//+------------------------------------------------------------------+
//|                                                  mqtt_sample.mq4 |
//|                                  Copyright 2018, Maxim Kuznetsov |
//|                                          https://www.luxtrade.tk |
//+------------------------------------------------------------------+
#property copyright "Copyright 2018, Maxim Kuznetsov"
#property link      "https://www.luxtrade.tk"
#property version   "1.00"
#property strict

#include <mt4mqtt/mt4mqtt.mqh>

//--- input parameters
const string   BOTNAME="sample bot v1";
input int      MAGIC=1122;

MQTT *mqtt=NULL;
// топики в которые будем публиковать данные
string topic_tick="tick";
string topic_bar="bar";
string topic_balance="balance";
string topic_time="localtime";
string topic_talk="talk";
string topic_shot="shot";

int
on_connect(MQTT *mqtt)
{
   // Оформим подписки
   mqtt.Subscribe("talk/#");        // подписываемся на "разговоры" (на всё дерево)
   mqtt.Subscribe("alert");         // на конкретный топик alert
   mqtt.Subscribe("screenshot/#");  // и на всё дерево скриншотов
   // подсветим кнопочки зелёным
   ObjectSetInteger(0,"sendButton",OBJPROP_COLOR,clrDarkGreen);
   ObjectSetInteger(0,"shotButton",OBJPROP_COLOR,clrDarkGreen);
   return 0;
}
int
on_disconnect(MQTT *mqtt,int reason)
{
   // подсветим кнопочки красным
   ObjectSetInteger(0,"sendButton",OBJPROP_COLOR,clrBrown);
   ObjectSetInteger(0,"shotButton",OBJPROP_COLOR,clrBrown);
   return 0;
}

// on_message будет вызываться на каждое принятое сообщение от сервера
// (то есть на те, на которые есть подписка)
// @arg mqtt - дескриптор
// @arg topic - топик сообщения
// @arg data - бинарные данные сообщения
// @arg qos - QOS сообщения
// @arg retain - было-ли сообщение сохранено на сервере
int
on_message(MQTT *_mqtt,string topic,uchar &data[],int qos,int retain)
{
   if (StringSubstr(topic,0,11)=="screenshot/") {
      // получен скриншот от кого-то там
      if (topic!=topic_shot) {
         // если это не наш скриншот
         // то сохраним его
         string folder=topic;
         // заменить в путевом имени / на \
         // потому как авторы mql не в курсе WinAPI
         int pos=0;
         while((pos=StringFind(folder,"/"))!=-1) {
            folder=StringSetChar(folder,pos,'\\');
         }
         // создать каталог, если его нет
         FolderCreate(folder);
         // чтобы имя файла было уникально - производим его от времени
         datetime t=TimeLocal();
         // сделать имя скриншоту, чтобы в нём не было "." кроме последней
         // гении в mq считают что "расширение имени файлы" - это после первой же точки
         string name=StringFormat("%04d%02d%02d_%02d%02d_%02d.png",
            TimeYear(t),
            TimeMonth(t),
            TimeDay(t),
            TimeHour(t),
            TimeMinute(t),
            TimeSeconds(t));
         string fullName=folder+"\\"+name;
         PrintFormat("Save to %s",fullName);
         int f=FileOpen(fullName,FILE_BIN|FILE_WRITE);
         if (f!=INVALID_HANDLE) {
            FileWriteArray(f,data);
            FileClose(f);
         }
      }
      return 0;
   }
   if (topic=="alert") {
      string text=CharArrayToString(data,0,WHOLE_ARRAY,CP_UTF8);
      Alert(text);
      return 0;
   }
   string text=CharArrayToString(data,0,WHOLE_ARRAY,CP_UTF8);
   printf("MQTT topic=%s data=%s",topic,text);
   return 0;
}

int OnInit()
{
   if (IsTesting() || IsOptimization()) {
      return INIT_FAILED;
   }
   // настроим имена топиков, чтобы они были уникальны на локальном сервере
   string id=AccountCompany()+"/"+IntegerToString(AccountNumber())+"/"+BOTNAME+"/"+IntegerToString(MAGIC);
   bot=id;
   topic_tick=id+"/"+_Symbol+"/tick";
   topic_bar=id+"/"+_Symbol+"/"+StringSubstr(EnumToString((ENUM_TIMEFRAMES)_Period),7);
   topic_balance=id+"/balance";
   topic_time=id+"/localtime";
   topic_talk="talk/"+id;
   topic_shot="screenshot/"+id+"/png";
   // 
   mqtt=new MQTT("localhost");      // соеденимся с локальным сервером, а он уже со всеми прочими
   mqtt.SetCallbacks(on_message,on_connect,on_disconnect);   // установим свой callback
   EventSetTimer(1);
   Draw();
   return(INIT_SUCCEEDED);
}

void OnTick()
{
   // вычитываем все тики до последнего самого актуального
   MqlTick tick;
   SymbolInfoTick(_Symbol,tick);
   // опубликуем на сервере(серверах) наш тик
   // на формат ограничений не накладывается - пусть будет просто строка
   // пока а-ля CSV, хотя в порядочных местах принят json.
   // топик тоже произвольный, всё-же localhost сами админим
   string payload=StringFormat("time %s ; bid %s ; ask %s ; volume %d ; spread %d",
      TimeToString(tick.time),
      DoubleToString(tick.bid,_Digits),
      DoubleToString(tick.ask,_Digits),
      tick.volume,
      (int)((tick.bid-tick.ask)/_Point)
      );
   mqtt.Publish(topic_tick,payload);   // опубликуем тик, запретим хранение на сервере     

   // и текущий бар опубликуем тоже
   MqlRates rates[];
   CopyRates(_Symbol,_Period,0,1,rates);
   payload=StringFormat("time %s ; open %s ; high %s ; low %s ; close %s ; volume %d",
      TimeToString(rates[0].time),
      DoubleToString(rates[0].open,_Digits),
      DoubleToString(rates[0].high,_Digits),
      DoubleToString(rates[0].low,_Digits),
      DoubleToString(rates[0].close,_Digits),
      rates[0].tick_volume
      );
   mqtt.Publish(topic_bar,payload,0,true);   // опубликуем бар, он сохранится на сервере
   
   // крутанём цикл чтения - если есть входящие сообщения, то них будет вызван my_callback     
   mqtt.Loop();
}
double lastBalance=0;
double lastFreeMargin=0;
double lastEquity=0;
double lastMargin=0;
string bot;
void OnTimer()
{
   if (lastBalance!=AccountBalance() || lastFreeMargin!=AccountFreeMargin() || lastEquity!=AccountEquity()|| lastMargin!=AccountMargin()) {
      // если что поменялось с балансом - опубликуем и это
      lastBalance=AccountBalance();
      lastFreeMargin=AccountFreeMargin();
      lastEquity=AccountEquity();
      lastMargin=AccountMargin();
      string payload=StringFormat("time %s ; balance %.2f ; equity %.2f ; freeMargin %.2f ; margin %.2f",
         TimeToString(TimeCurrent()),
         lastBalance,
         lastEquity,
         lastFreeMargin,
         lastMargin
      );
      mqtt.Publish(topic_balance,payload,0,true);
   }
   mqtt.Publish(topic_time,TimeToString(TimeLocal()));
   mqtt.Loop();
}
void Draw()
{
   string name="textEdit";
   ObjectCreate(0,name,OBJ_EDIT,0,0,0);
   ObjectSetInteger(0,name,OBJPROP_ANCHOR,ANCHOR_RIGHT);
   ObjectSetInteger(0,name,OBJPROP_CORNER,CORNER_RIGHT_UPPER);
   ObjectSetInteger(0,name,OBJPROP_XSIZE,500);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,20);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,600);
   name="sendButton";
   ObjectCreate(0,name,OBJ_BUTTON,0,0,0);
   ObjectSetInteger(0,name,OBJPROP_ANCHOR,ANCHOR_RIGHT);
   ObjectSetInteger(0,name,OBJPROP_CORNER,CORNER_RIGHT_UPPER);
   ObjectSetInteger(0,name,OBJPROP_XSIZE,100);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,20);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,100);
   ObjectSetString(0,name,OBJPROP_TEXT,"SEND");
   name="shotButton";
   ObjectCreate(0,name,OBJ_BUTTON,0,0,0);
   ObjectSetInteger(0,name,OBJPROP_ANCHOR,ANCHOR_RIGHT);
   ObjectSetInteger(0,name,OBJPROP_CORNER,CORNER_RIGHT_UPPER);
   ObjectSetInteger(0,name,OBJPROP_XSIZE,100);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,40);
   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,100);
   ObjectSetString(0,name,OBJPROP_TEXT,"screenshot");
}
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
{
   if (id==CHARTEVENT_OBJECT_CLICK) {
      if (sparam=="sendButton") {
         string text=ObjectGetString(0,"textEdit",OBJPROP_TEXT);
         mqtt.Publish(topic_talk,text);
         ObjectSetInteger(0,"sendButton",OBJPROP_STATE,0);
         ObjectSetString(0,"textEdit",OBJPROP_TEXT,"");
      } else if (sparam=="shotButton") {
         // делаем скриншот полного чарта
         long width=ChartGetInteger(0,CHART_WIDTH_IN_PIXELS);
         long height=ChartGetInteger(0,CHART_HEIGHT_IN_PIXELS);
         // чтобы имя файла было уникально - производим его от времени
         datetime t=TimeLocal();
         // сделать имя скриншоту, чтобы в нём не было "." кроме последней
         // гении в mq считают что "расширение имени файла" - это после первой же точки
         string name=StringFormat("%04d%02d%02d_%02d%02d%02d_%02d.png",
            TimeYear(t),
            TimeMonth(t),
            TimeDay(t),
            TimeHour(t),
            TimeMinute(t),
            TimeSeconds(t));
         // каталог в который сохраняем локальные скрины
         string folder="screenshot/"+bot+"/png";
         // заменить в путевом имени / на \
         // потому как авторы mql не в курсе WinAPI
         int pos=0;
         while((pos=StringFind(folder,"/"))!=-1) {
            folder=StringSetChar(folder,pos,'\\');
         }
         // создать каталог, если его нет
         if (!FolderCreate(folder)) {
            PrintFormat("unable to create folder %s",folder);
         }
         string fullName=folder+"\\"+name;
         // снимаем скриншот в файл
         if (ChartScreenShot(0,fullName,(int)width,(int)height)) {
            // если всё получилось
            // читаем файл и публикуем его как есть
            int f=FileOpen(fullName,FILE_BIN|FILE_READ);
            if (f!=INVALID_HANDLE) {
               ulong size=FileSize(f);
               uchar data[];
               if (FileReadArray(f,data,0,(int)size)==size) {
                  PrintFormat("Publish screenshot");
                  mqtt.Publish(topic_shot,data,(int)size);
               }
               FileClose(f);
            }
         }
         ObjectSetInteger(0,"shotButton",OBJPROP_STATE,0);
      }
   }
   mqtt.Loop();
}

void OnDeinit(const int reason)
{
   ObjectDelete(0,"textEdit");
   ObjectDelete(0,"sendButton");
   ObjectDelete(0,"shotButton");
   EventKillTimer();
   delete mqtt;
   
}
