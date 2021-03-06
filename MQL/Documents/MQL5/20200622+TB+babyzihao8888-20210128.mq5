//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2012, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#property copyright "鱼儿编程 QQ：276687220"
#property link"http://babelfish.taobao.com/"
//#property strict
input bool 是否显示信息框=true;
input bool 显示全平按钮=false;
input double 止损=0;
input double 止盈=0;
input string 备注="";
input int magic=15420;
input string comm1X="----------------------------";
input bool 锁仓开关1=false;
input double 锁仓单止损距离=100;
input bool 反向对冲开关=true;
input int 反向对冲启动大于等于=5;
input int 反向对冲启动小于等于=10;
input bool 反向正向对冲平单总开关=true;
input double 正向对冲后盈利大于X美金2=0;
input double 每次正向对冲掉手数2=0.03;
input double 顺势加仓距离=30;
input double 逆势加仓距离=30;
input int 顺势最大加仓次数=20;
input int 逆势最大加仓次数=20;
input double 首单单量=0.1;
input double 顺势单量1=0.1;
input double 顺势单量2=0.2;
input double 顺势单量3=0.3;
input double 顺势单量4=0.4;
input double 顺势单量5=0.5;
input double 顺势单量6=0.6;
input double 顺势单量7=0.7;
input double 顺势单量8=0.8;
input double 顺势单量9=0.9;
input double 顺势单量10=1;
input double 顺势单量11=1.1;
input double 顺势单量12=1.2;
input double 顺势单量13=1.3;
input double 顺势单量14=1.4;
input double 顺势单量15=1.5;
input double 顺势单量16=1.6;
input double 顺势单量17=1.7;
input double 顺势单量18=1.8;
input double 顺势单量19=1.9;
input double 顺势单量20=2;

input double 逆势单量1=0.1;
input double 逆势单量2=0.2;
input double 逆势单量3=0.3;
input double 逆势单量4=0.4;
input double 逆势单量5=0.5;
input double 逆势单量6=0.6;
input double 逆势单量7=0.7;
input double 逆势单量8=0.8;
input double 逆势单量9=0.9;
input double 逆势单量10=1;
input double 逆势单量11=1.1;
input double 逆势单量12=1.2;
input double 逆势单量13=1.3;
input double 逆势单量14=1.4;
input double 逆势单量15=1.5;
input double 逆势单量16=1.6;
input double 逆势单量17=1.7;
input double 逆势单量18=1.8;
input double 逆势单量19=1.9;
input double 逆势单量20=2;
double 顺势单量X[100];
double 逆势单量X[100];
input string comm2X="----------------------------";
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum XHWZ
  {
   实时出现信号判断=0,收盘出现信号判断=1
  };
input string _____指标1MA_____="------MA------";
input bool 指标1开关=false;
input XHWZ 指标1信号位置=收盘出现信号判断;
input ENUM_TIMEFRAMES 指标1时间轴=PERIOD_CURRENT;
input string 指标1名称="MA";
input int  指标1MA周期1=100;
input int  指标1MA平移1=0;
input ENUM_MA_METHOD  指标1MA计算方式1=MODE_SMA;
input ENUM_APPLIED_PRICE  指标1MA价格方式1=PRICE_CLOSE;
input int  指标1MA周期2=200;
input int  指标1MA平移2=0;
input ENUM_MA_METHOD  指标1MA计算方式2=MODE_SMA;
input ENUM_APPLIED_PRICE  指标1MA价格方式2=PRICE_CLOSE;
int 指标1做多,指标1做空;
int 指标1序列1;
int 指标1序列2;
double 指标11[];
double 指标12[];
//+------------------------------------------------------------------+
//| |
//+------------------------------------------------------------------+
void 指标1()
  {
   指标1做多=0;
   指标1做空=0;

   if(指标1开关==false)
     {
      指标1做多=1;
      指标1做空=1;
      return;
     }

   CopyBuffer(指标1序列1,0,0,BarsCalculated(指标1序列1),指标11);
   CopyBuffer(指标1序列2,0,0,BarsCalculated(指标1序列2),指标12);
   if(BarsCalculated(指标1序列1)<1)
      return;
   if(BarsCalculated(指标1序列2)<1)
      return;

   double MA1=指标11[指标1信号位置];
   double MA2=指标12[指标1信号位置];

   if(MA1>MA2)
      指标1做多=1;

   if(MA1<MA2)
      指标1做空=1;
  }
input string _____指标220200719_TB_babyzihao8888_缠论指标_____="------20200719 TB babyzihao8888-缠论指标------";
input bool 指标2开关=true;
input XHWZ 指标2信号位置=收盘出现信号判断;
input ENUM_TIMEFRAMES 指标2时间轴=PERIOD_CURRENT;
string 指标2名称="20200719TBbabyzihao8888缠论指标";
int 指标2做多,指标2做空;
int 指标2序列;
double 指标21[];
double 指标22[];

//+------------------------------------------------------------------+
//| |
//+------------------------------------------------------------------+
void 指标2()
  {
   指标2做多=0;
   指标2做空=0;

   if(指标2开关==false)
     {
      指标2做多=1;
      指标2做空=1;
      return;
     }

   CopyBuffer(指标2序列,2,0,BarsCalculated(指标2序列),指标11);
   CopyBuffer(指标2序列,3,0,BarsCalculated(指标2序列),指标12);
   if(BarsCalculated(指标2序列)<1)
      return;

   double XH1=指标11[指标2信号位置];
   double XH2=指标12[指标2信号位置];

   if(XH1!=0)
      指标2做多=1;

   if(XH2!=0)
      指标2做空=1;
  }
input string comm3X="----------------------------";
input bool 正向对冲平单总开关=true;
input int 持有大于等于N单可以使用正向对冲=10;
input int 持有小于等于N单可以使用正向对冲=20;
input double 正向对冲后盈利大于X美金=0;
input double 每次正向对冲掉手数=0.03;
input string comm4X="----------------------------";
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
enum HTFS
  {
   回调固定距离=1,回调比例=2
  };
input bool 移动止损开关=true;
input double 移动止损激活点数=30;
double 移动止损停止点数=100000;
HTFS 移动止损回调方式=1;
input double 移动止损回调离场距离=10;
double 移动止损回调离场比例=50;
input string comm5X="----------------------------";
input string comm6X="----------------------------";
input string comm7X="----------------------------";
input string comm8X="----------------------------";
input string comm9X="----------------------------";
//+------------------------------------------------------------------+
//||
//+------------------------------------------------------------------+
enum 做单方向
  {
   停止=0,做多=1,做空=2,全做=3
  };
input 做单方向 做单方向选择=0;
int check;
int X=20;
int Y=20;
int Y间隔=15;
color 标签颜色=Yellow;
int 标签字体大小=10;
ENUM_BASE_CORNER 固定角=0;
//////////////////////////////////////////////////////////////

datetime time1,time2;
int 单量小数保留=2;
datetime 启动时间;
bool 不允许智能交易报警=false;
MqlTradeRequest  request= {0};
MqlTradeResult   result= {0};
//+------------------------------------------------------------------+
//| expert initialization function|
//+------------------------------------------------------------------+
int OnInit()
  {
   if(指标1开关)
     {
      指标1序列1=iMA(Symbol(),指标1时间轴,指标1MA周期1,指标1MA平移1,指标1MA计算方式1,指标1MA价格方式1);
      指标1序列2=iMA(Symbol(),指标1时间轴,指标1MA周期2,指标1MA平移2,指标1MA计算方式2,指标1MA价格方式2);
      ArraySetAsSeries(指标11,true);
      ArraySetAsSeries(指标12,true);
     }

   if(指标2开关)
     {
      指标2序列=iCustom(Symbol(),指标2时间轴,指标2名称);
      ArraySetAsSeries(指标21,true);
      ArraySetAsSeries(指标22,true);
     }

//----
   顺势单量X[1]=顺势单量1;
   顺势单量X[2]=顺势单量2;
   顺势单量X[3]=顺势单量3;
   顺势单量X[4]=顺势单量4;
   顺势单量X[5]=顺势单量5;
   顺势单量X[6]=顺势单量6;
   顺势单量X[7]=顺势单量7;
   顺势单量X[8]=顺势单量8;
   顺势单量X[9]=顺势单量9;
   顺势单量X[10]=顺势单量10;
   顺势单量X[11]=顺势单量11;
   顺势单量X[12]=顺势单量12;
   顺势单量X[13]=顺势单量13;
   顺势单量X[14]=顺势单量14;
   顺势单量X[15]=顺势单量15;
   顺势单量X[16]=顺势单量16;
   顺势单量X[17]=顺势单量17;
   顺势单量X[18]=顺势单量18;
   顺势单量X[19]=顺势单量19;
   顺势单量X[20]=顺势单量20;

   逆势单量X[1]=逆势单量1;
   逆势单量X[2]=逆势单量2;
   逆势单量X[3]=逆势单量3;
   逆势单量X[4]=逆势单量4;
   逆势单量X[5]=逆势单量5;
   逆势单量X[6]=逆势单量6;
   逆势单量X[7]=逆势单量7;
   逆势单量X[8]=逆势单量8;
   逆势单量X[9]=逆势单量9;
   逆势单量X[10]=逆势单量10;
   逆势单量X[11]=逆势单量11;
   逆势单量X[12]=逆势单量12;
   逆势单量X[13]=逆势单量13;
   逆势单量X[14]=逆势单量14;
   逆势单量X[15]=逆势单量15;
   逆势单量X[16]=逆势单量16;
   逆势单量X[17]=逆势单量17;
   逆势单量X[18]=逆势单量18;
   逆势单量X[19]=逆势单量19;
   逆势单量X[20]=逆势单量20;

//Alert("急速模式程序,修改参数后需重置EA开关");
   if(SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP)<10)
      单量小数保留=0;
   if(SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP)<1)
      单量小数保留=1;
   if(SymbolInfoDouble(Symbol(),SYMBOL_VOLUME_STEP)<0.1)
      单量小数保留=2;

   启动时间=TimeCurrent();

//if(IsTesting()==false)
//EventSetMillisecondTimer(300);
//----
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| expert deinitialization function |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//----
   if(MQLInfoInteger(MQL_TESTER)==false)
      ObjectsDeleteAll(0,"标签");
//----
  }
//+------------------------------------------------------------------+
//| expert start function|
//+------------------------------------------------------------------+
void OnTick()
  {
   if(TerminalInfoInteger(TERMINAL_CONNECTED)==false)
      return;

   if(MQLInfoInteger(MQL_TESTER)==false)
      if(TimeCurrent()-SymbolInfoInteger(Symbol(),SYMBOL_TIME)>=30)
         return;

   if(显示全平按钮==true)
     {
      按钮("标签全平按钮","全平按钮","全平按钮",80,30,60,20,CORNER_RIGHT_LOWER,clrRed,clrBlack);

      if(ObjectGetInteger(0,"标签全平按钮",OBJPROP_STATE)==1)
        {
         deleteorder(-100,magic,"");
         deleteorder(-100,magic+1,"");
         deleteorder(-100,magic+2,"");
         ObjectDelete(0,"启动时间");
         return;
        }
     }

   if(ObjectFind(0,"启动时间")==-1)
      画直线("启动时间",0,0,TimeCurrent(),clrNONE,0,0);
   启动时间=(datetime)ObjectGetInteger(0,"启动时间",OBJPROP_TIME);

   指标1();
   指标2();

   if(分项单据统计(1,magic+1,"")==0)
      if(做单方向选择==1 || 做单方向选择==3)
         if(指标1做多==1)
            if(指标2做多==1)
               if(分项单据统计(0,magic,"")==0)
                 {
                  ulong t=建立单据(Symbol(),0,首单单量,0,0,止损,止盈,备注,magic);
                 }

   if(分项单据统计(0,magic+1,"")==0)
      if(做单方向选择==2 || 做单方向选择==3)
         if(指标1做空==1)
            if(指标2做空==1)
               if(分项单据统计(1,magic,"")==0)
                 {
                  ulong t=建立单据(Symbol(),1,首单单量,0,0,止损,止盈,备注,magic);
                 }

   long 点差距离=SymbolInfoInteger(Symbol(),SYMBOL_SPREAD);

   double 多初始位置=0;
   if(PositionSelectByTicket(findlassorder(0,0,magic,"前","现在","",0)))
      多初始位置=PositionGetDouble(POSITION_PRICE_OPEN);
   double 空初始位置=0;
   if(PositionSelectByTicket(findlassorder(1,1,magic,"前","现在","",0)))
      空初始位置=PositionGetDouble(POSITION_PRICE_OPEN);

   int 多顺势单数=分项单据统计HL(0,magic,"","H",多初始位置);
   int 多逆势单数=分项单据统计HL(0,magic,"","L",多初始位置);
   int 空顺势单数=分项单据统计HL(1,magic,"","L",空初始位置);
   int 空逆势单数=分项单据统计HL(1,magic,"","H",空初始位置);

   if(分项单据统计(1,magic+1,"")==0)
      if(多顺势单数<顺势最大加仓次数)
         if(PositionSelectByTicket(最高最低单据订单号(0,0,magic,"H","",0,0)))
           {
            laber0("多顺势做单位置","多顺势做单位置",clrYellow,TimeCurrent(),PositionGetDouble(POSITION_PRICE_OPEN)+顺势加仓距离*系数(Symbol())*_Point,8,ANCHOR_LEFT_UPPER,0);
            if(PositionGetDouble(POSITION_PRICE_CURRENT)-PositionGetDouble(POSITION_PRICE_OPEN)+点差距离*_Point>=顺势加仓距离*系数(Symbol())*_Point)
              {
               ulong t=建立单据(Symbol(),0,顺势单量X[多顺势单数+1],0,0,止损,止盈,"顺"+备注,magic);
              }
           }

   if(分项单据统计(0,magic+1,"")==0)
      if(空顺势单数<顺势最大加仓次数)
         if(PositionSelectByTicket(最高最低单据订单号(1,1,magic,"L","",0,0)))
           {
            laber0("空顺势做单位置","空顺势做单位置",clrYellow,TimeCurrent(),PositionGetDouble(POSITION_PRICE_OPEN)-顺势加仓距离*系数(Symbol())*_Point,8,ANCHOR_LEFT_UPPER,0);
            if(-PositionGetDouble(POSITION_PRICE_CURRENT)+PositionGetDouble(POSITION_PRICE_OPEN)+点差距离*_Point>=顺势加仓距离*系数(Symbol())*_Point)
              {
               ulong t=建立单据(Symbol(),1,顺势单量X[空顺势单数+1],0,0,止损,止盈,"顺"+备注,magic);
              }
           }

   if(分项单据统计(1,magic+1,"")==0)
      if(PositionSelectByTicket(最高最低单据订单号(0,0,magic,"L","",0,0)))
        {
         laber0("多逆势做单位置","多逆势做单位置",clrYellow,TimeCurrent(),PositionGetDouble(POSITION_PRICE_OPEN)-逆势加仓距离*系数(Symbol())*_Point,8,ANCHOR_LEFT_UPPER,0);
         if(-PositionGetDouble(POSITION_PRICE_CURRENT)+PositionGetDouble(POSITION_PRICE_OPEN)-点差距离*_Point>=逆势加仓距离*系数(Symbol())*_Point)
           {
            if(多逆势单数<逆势最大加仓次数)
               ulong t=建立单据(Symbol(),0,逆势单量X[多逆势单数+1],0,0,止损,止盈,"逆"+备注,magic);
            else
               if(锁仓开关1)
                  ulong t=建立单据(Symbol(),1,总交易量(0,magic,""),0,0,锁仓单止损距离,0,"锁"+备注,magic+1);
           }
        }

   if(分项单据统计(0,magic+1,"")==0)
      if(PositionSelectByTicket(最高最低单据订单号(1,1,magic,"H","",0,0)))
        {
         laber0("空逆势做单位置","空逆势做单位置",clrYellow,TimeCurrent(),PositionGetDouble(POSITION_PRICE_OPEN)+逆势加仓距离*系数(Symbol())*_Point,8,ANCHOR_LEFT_UPPER,0);
         if(PositionGetDouble(POSITION_PRICE_CURRENT)-PositionGetDouble(POSITION_PRICE_OPEN)-点差距离*_Point>=逆势加仓距离*系数(Symbol())*_Point)
           {
            if(空逆势单数<逆势最大加仓次数)
               ulong t=建立单据(Symbol(),1,逆势单量X[空逆势单数+1],0,0,止损,止盈,"逆"+备注,magic);
            else
               if(锁仓开关1)
                  ulong t=建立单据(Symbol(),0,总交易量(1,magic,""),0,0,锁仓单止损距离,0,"锁"+备注,magic+1);
           }
        }

   if(反向对冲开关)
     {
      double 利润=分类单据利润(0,magic,"");
      if(分项单据统计(0,magic,"")>=反向对冲启动大于等于&&分项单据统计(0,magic,"")<=反向对冲启动小于等于)
         if(PositionSelectByTicket(findlassorder(0,0,magic,"后","现在","",0)))
           {
            ulong TICKET=findlassorder(0,0,magic,"后","现在","",0);
            string SYMBOL=PositionGetString(POSITION_SYMBOL);
            double CLOSE=PositionGetDouble(POSITION_PRICE_CURRENT);
            double OPEN=PositionGetDouble(POSITION_PRICE_OPEN);
            int TYPE=(int)PositionGetInteger(POSITION_TYPE);
            double SL=PositionGetDouble(POSITION_SL);
            double TP=PositionGetDouble(POSITION_TP);
            double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
            int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
            long MAGIC=PositionGetInteger(POSITION_MAGIC);
            string COMM=PositionGetString(POSITION_COMMENT);
            double LOTS=PositionGetDouble(POSITION_VOLUME);
            double SWAP=PositionGetDouble(POSITION_SWAP);
            double PROFIT=PositionGetDouble(POSITION_PROFIT);
            datetime OPENTIME=(datetime)PositionGetInteger(POSITION_TIME);

            if(ObjectFind(0,"已使用"+(string)TICKET)==-1)
               if((StringFind(COMM,"顺",0)!=-1&&利润<=0)||StringFind(COMM,"逆",0)!=-1)
                 {
                  string NAME="已使用"+(string)TICKET;
                  if(NormalizeDouble(总交易量(0,magic,"")-总交易量(1,magic+2,""),单量小数保留)>=SymbolInfoDouble(SYMBOL,SYMBOL_VOLUME_MIN))
                    {
                     ulong t=建立单据X(Symbol(),1,总交易量(0,magic,"")-总交易量(1,magic+2,""),0,0,0,0,"锁"+备注,magic+2);
                     if(PositionSelectByTicket(t))
                        laber0(NAME,"",clrYellow,0,0,8,ANCHOR_LEFT_UPPER,0);
                    }
                 }
           }

      利润=分类单据利润(1,magic,"");
      if(分项单据统计(1,magic,"")>=反向对冲启动大于等于&&分项单据统计(1,magic,"")<=反向对冲启动小于等于)
         if(PositionSelectByTicket(findlassorder(1,1,magic,"后","现在","",0)))
           {
            ulong TICKET=findlassorder(1,1,magic,"后","现在","",0);
            string SYMBOL=PositionGetString(POSITION_SYMBOL);
            double CLOSE=PositionGetDouble(POSITION_PRICE_CURRENT);
            double OPEN=PositionGetDouble(POSITION_PRICE_OPEN);
            int TYPE=(int)PositionGetInteger(POSITION_TYPE);
            double SL=PositionGetDouble(POSITION_SL);
            double TP=PositionGetDouble(POSITION_TP);
            double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
            int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
            long MAGIC=PositionGetInteger(POSITION_MAGIC);
            string COMM=PositionGetString(POSITION_COMMENT);
            double LOTS=PositionGetDouble(POSITION_VOLUME);
            double SWAP=PositionGetDouble(POSITION_SWAP);
            double PROFIT=PositionGetDouble(POSITION_PROFIT);
            datetime OPENTIME=(datetime)PositionGetInteger(POSITION_TIME);

            if(ObjectFind(0,"已使用"+(string)TICKET)==-1)
               if((StringFind(COMM,"顺",0)!=-1&&利润<=0)||StringFind(COMM,"逆",0)!=-1)
                 {
                  string NAME="已使用"+(string)TICKET;
                  if(NormalizeDouble(总交易量(1,magic,"")-总交易量(0,magic+2,""),单量小数保留)>=SymbolInfoDouble(SYMBOL,SYMBOL_VOLUME_MIN))
                    {
                     ulong t=建立单据X(Symbol(),0,总交易量(1,magic,"")-总交易量(0,magic+2,""),0,0,0,0,"锁"+备注,magic+2);
                     if(PositionSelectByTicket(t))
                        laber0(NAME,"",clrYellow,0,0,8,ANCHOR_LEFT_UPPER,0);
                    }
                 }
           }
     }

   if(反向正向对冲平单总开关)
     {
      double 利润=分类单据利润(0,magic,"");
      if(PositionSelectByTicket(最高最低单据订单号(1,1,magic+2,"L","",0,0)))
        {
         if(PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP)+利润>=正向对冲后盈利大于X美金2)
            if(OrderClose(最高最低单据订单号(1,1,magic+2,"L","",0,0)))
               deleteorder(0,magic,"");
        }

      利润=分类单据利润(1,magic,"");
      if(PositionSelectByTicket(最高最低单据订单号(0,0,magic+2,"H","",0,0)))
        {
         if(PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP)+利润>=正向对冲后盈利大于X美金2)
            if(OrderClose(最高最低单据订单号(0,0,magic+2,"H","",0,0)))
               deleteorder(1,magic,"");
        }
     }

   if(正向对冲平单总开关)
     {
      if(分项单据统计(1,magic+1,"")==0)
         if(分项单据统计(0,magic,"")>=持有大于等于N单可以使用正向对冲)
            if(分项单据统计(0,magic,"")<=持有小于等于N单可以使用正向对冲)
               if(PositionSelectByTicket(最高最低单据订单号(0,0,magic,"L","",0,0)))
                 {
                  double 利润=PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP);
                  double PRICE=0;
                  double 单量累计=NormalizeDouble(每次正向对冲掉手数,2);

                  while(PositionSelectByTicket(最高最低单据订单号限制位置(0,0,magic,"H","",0,0,PRICE)))
                    {
                     PRICE=OrderGetDouble(ORDER_PRICE_OPEN);
                     if(NormalizeDouble(OrderGetDouble(ORDER_VOLUME_CURRENT),2)<=单量累计)
                       {
                        利润+=PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP);
                        单量累计-=NormalizeDouble(OrderGetDouble(ORDER_VOLUME_CURRENT),2);
                        if(单量累计==0)
                           break;
                       }
                     else
                       {
                        利润+=(PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP))/OrderGetDouble(ORDER_VOLUME_CURRENT)*单量累计;
                        break;
                       }
                    }

                  if(利润>=正向对冲后盈利大于X美金)
                    {
                     单量累计=NormalizeDouble(每次正向对冲掉手数,2);

                     if(PositionSelectByTicket(最高最低单据订单号(0,0,magic,"L","",0,0)))
                        if(OrderClose(最高最低单据订单号(0,0,magic,"L","",0,0)))
                           while(PositionSelectByTicket(最高最低单据订单号(0,0,magic,"H","",0,0)))
                             {
                              if(NormalizeDouble(OrderGetDouble(ORDER_VOLUME_CURRENT),2)<=单量累计)
                                {
                                 if(OrderClose(最高最低单据订单号(0,0,magic,"H","",0,0)))
                                    单量累计-=NormalizeDouble(OrderGetDouble(ORDER_VOLUME_CURRENT),2);
                                 if(单量累计==0)
                                    break;
                                }
                              else
                                {
                                 if(OrderClose(最高最低单据订单号(0,0,magic,"H","",0,0)))
                                    break;
                                }
                             }
                    }
                 }

      if(分项单据统计(0,magic+1,"")==0)
         if(分项单据统计(1,magic,"")>=持有大于等于N单可以使用正向对冲)
            if(分项单据统计(1,magic,"")<=持有小于等于N单可以使用正向对冲)
               if(PositionSelectByTicket(最高最低单据订单号(1,1,magic,"H","",0,0)))
                 {
                  double 利润=PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP);
                  double PRICE=0;
                  double 单量累计=NormalizeDouble(每次正向对冲掉手数,2);

                  while(PositionSelectByTicket(最高最低单据订单号限制位置(1,1,magic,"L","",0,0,PRICE)))
                    {
                     PRICE=OrderGetDouble(ORDER_PRICE_OPEN);
                     if(NormalizeDouble(OrderGetDouble(ORDER_VOLUME_CURRENT),2)<=单量累计)
                       {
                        利润+=PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP);
                        单量累计-=NormalizeDouble(OrderGetDouble(ORDER_VOLUME_CURRENT),2);
                        if(单量累计==0)
                           break;
                       }
                     else
                       {
                        利润+=(PositionGetDouble(POSITION_PROFIT)+PositionGetDouble(POSITION_SWAP))/OrderGetDouble(ORDER_VOLUME_CURRENT)*单量累计;
                        break;
                       }
                    }

                  if(利润>=正向对冲后盈利大于X美金)
                    {
                     单量累计=NormalizeDouble(每次正向对冲掉手数,2);

                     if(PositionSelectByTicket(最高最低单据订单号(1,1,magic,"H","",0,0)))
                        if(OrderClose(最高最低单据订单号(1,1,magic,"H","",0,0)))
                           while(PositionSelectByTicket(最高最低单据订单号(1,1,magic,"L","",0,0)))
                             {
                              if(NormalizeDouble(OrderGetDouble(ORDER_VOLUME_CURRENT),2)<=单量累计)
                                {
                                 if(OrderClose(最高最低单据订单号(1,1,magic,"L","",0,0)))
                                    单量累计-=NormalizeDouble(OrderGetDouble(ORDER_VOLUME_CURRENT),2);
                                 if(单量累计==0)
                                    break;
                                }
                              else
                                {
                                 if(OrderClose(最高最低单据订单号(1,1,magic,"L","",0,0)))
                                    break;
                                }
                             }
                    }
                 }
     }

   if(移动止损开关==true)
     {
      if(分项单据统计(0,magic+1,"")==0)
         if(分项单据统计(0,magic+2,"")==0)
            移动止损距离比例(1,移动止损激活点数,移动止损停止点数,移动止损回调方式,移动止损回调离场距离,移动止损回调离场比例,magic,"");
      if(分项单据统计(1,magic+1,"")==0)
         if(分项单据统计(1,magic+2,"")==0)
            移动止损距离比例(0,移动止损激活点数,移动止损停止点数,移动止损回调方式,移动止损回调离场距离,移动止损回调离场比例,magic,"");
     }

   if(是否显示信息框)
     {
      string 内容[100];
      int pp=0;
      内容[pp]="";
      pp++;
      内容[pp]="平台商:" +AccountInfoString(ACCOUNT_COMPANY)+" 杠杆:"+DoubleToString(AccountInfoInteger(ACCOUNT_LEVERAGE),0);
      pp++;
      内容[pp]="EA独立代码 magic :"+(string)magic;
      pp++;
      内容[pp]="启动时间:"+DoubleToString((TimeCurrent()-启动时间)/60/60,1)+"小时";
      pp++;
      内容[pp]="------------------------------------";
      pp++;
      内容[pp]="多单个数:"+(string)(分项单据统计(0,magic,"")+分项单据统计(0,magic+1,"")+分项单据统计(0,magic+2,""));
      pp++;
      内容[pp]="多单获利:"+DoubleToString(分类单据利润(0,magic,"")+分类单据利润(0,magic+1,"")+分类单据利润(0,magic+2,""),2);
      pp++;
      内容[pp]="多单手数:"+DoubleToString(总交易量(0,magic,"")+总交易量(0,magic+1,"")+总交易量(0,magic+2,""),2);
      pp++;
      内容[pp]="------------------------------------";
      pp++;
      内容[pp]="空单个数:"+(string)(分项单据统计(1,magic,"")+分项单据统计(1,magic+1,"")+分项单据统计(1,magic+2,""));
      pp++;
      内容[pp]="空单获利:"+DoubleToString(分类单据利润(1,magic,"")+分类单据利润(1,magic+1,"")+分类单据利润(1,magic+2,""),2);
      pp++;
      内容[pp]="空单手数:"+DoubleToString(总交易量(1,magic,"")+总交易量(1,magic+1,"")+总交易量(1,magic+2,""),2);
      pp++;
      内容[pp]="------------------------------------";
      pp++;
      内容[pp]="浮动盈亏:"+DoubleToString(分类单据利润(-100,magic,"")+分类单据利润(-100,magic+1,"")+分类单据利润(-100,magic+2,""),2);
      pp++;
      内容[pp]="------------------------------------";

      for(int ixx=0; ixx<pp; ixx++)
         固定位置标签("标签"+(string)ixx,内容[ixx],X,Y+Y间隔*ixx,标签颜色,标签字体大小,固定角);
     }
   return;
  }
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void 移动止损距离比例(long typeX,double 启动距离1,double 启动距离2,long 回调模式,double 保持距离,double 保持比例,long magicX,string comm)
  {
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ulong TICKET=PositionGetTicket(i);
      string SYMBOL=PositionGetString(POSITION_SYMBOL);
      double CLOSE=PositionGetDouble(POSITION_PRICE_CURRENT);
      double OPEN=PositionGetDouble(POSITION_PRICE_OPEN);
      int TYPE=(int)PositionGetInteger(POSITION_TYPE);
      double SL=PositionGetDouble(POSITION_SL);
      double TP=PositionGetDouble(POSITION_TP);
      double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
      int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
      long MAGIC=PositionGetInteger(POSITION_MAGIC);
      string COMM=PositionGetString(POSITION_COMMENT);
      double LOTS=PositionGetDouble(POSITION_VOLUME);
      double SWAP=PositionGetDouble(POSITION_SWAP);
      double PROFIT=PositionGetDouble(POSITION_PROFIT);
      datetime OPENTIME=(datetime)PositionGetInteger(POSITION_TIME);

      if(TICKET>0)
         if(SYMBOL==Symbol())
            if(MAGIC==magicX || magicX==-1)
               if(TYPE==POSITION_TYPE_BUY || TYPE==POSITION_TYPE_SELL)
                  if(typeX==-100 || typeX==-200 || typeX==TYPE)
                     if(StringFind(COMM,comm,0)!=-1 || comm=="")
                       {

                        double 保持距离X=0;

                        if(回调模式==1)
                           保持距离X=保持距离;

                        if(回调模式==2)
                           保持距离X=MathAbs(CLOSE-OPEN)*保持比例/100/POINT/系数(SYMBOL);

                        if(TYPE==0)
                           if(CLOSE-OPEN>启动距离1*POINT*系数(SYMBOL))
                              if(CLOSE-OPEN<=启动距离2*POINT*系数(SYMBOL))
                                 if(NormalizeDouble(CLOSE-(保持距离X*系数(SYMBOL)+1)*POINT,DIGITS)>=SL || SL==0)
                                   {
                                    ZeroMemory(request);
                                    ZeroMemory(result);

                                    if(错误调试1==1)
                                       request.type_filling=ORDER_FILLING_FOK;
                                    if(错误调试1==2)
                                       request.type_filling=ORDER_FILLING_IOC;
                                    if(错误调试1==3)
                                       request.type_filling=ORDER_FILLING_RETURN;

                                    request.action=TRADE_ACTION_SLTP;
                                    request.position=TICKET;
                                    request.symbol=SYMBOL;
                                    request.sl=NormalizeDouble(CLOSE-保持距离X*系数(SYMBOL)*POINT,DIGITS);
                                    request.tp=TP;
                                    request.deviation=(ulong)(滑点*系数(SYMBOL));

                                    check=OrderSend(request,result);
                                   }

                        if(TYPE==1)
                           if(-CLOSE+OPEN>启动距离1*POINT*系数(SYMBOL))
                              if(-CLOSE+OPEN<=启动距离2*POINT*系数(SYMBOL))
                                 if(NormalizeDouble(CLOSE+(保持距离X*系数(SYMBOL)+1)*POINT,DIGITS)<=SL || SL==0)
                                   {
                                    ZeroMemory(request);
                                    ZeroMemory(result);

                                    if(错误调试1==1)
                                       request.type_filling=ORDER_FILLING_FOK;
                                    if(错误调试1==2)
                                       request.type_filling=ORDER_FILLING_IOC;
                                    if(错误调试1==3)
                                       request.type_filling=ORDER_FILLING_RETURN;

                                    request.action=TRADE_ACTION_SLTP;
                                    request.position=TICKET;
                                    request.symbol=SYMBOL;
                                    request.sl=NormalizeDouble(CLOSE+保持距离X*系数(SYMBOL)*POINT,DIGITS);
                                    request.tp=TP;
                                    request.deviation=(ulong)(滑点*系数(SYMBOL));

                                    check=OrderSend(request,result);
                                   }
                       }
     }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ulong 建立单据X(string 货币对X,ENUM_ORDER_TYPE 类型X,double 单量内X,double 价位X,double 间隔X,double 止损X,double 止盈X,string 备注X,long magicX)
  {
   double 总单量=单量内X;
   double 单量拆分单位=每次正向对冲掉手数2;
   ulong x=0;
   bool 第一单=true;
   while(总单量>=0.009)
     {
      x=建立单据(货币对X,类型X,MathMin(总单量,单量拆分单位),价位X,间隔X,止损X,止盈X,(第一单?"":"拆")+备注X,magicX);
      if(PositionSelectByTicket(x))
        {
         总单量-=PositionGetDouble(POSITION_VOLUME);
         第一单=false;
        }
     }
   return(x);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ulong 最高最低单据订单号限制位置(long a,long b,long magicX,string 高低,string comm,long pc1,long pc2,double PRICE)
  {
   double 价格=0;
   ulong 订单号=0;

   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ulong TICKET=PositionGetTicket(i);
      string SYMBOL=PositionGetString(POSITION_SYMBOL);
      double CLOSE=PositionGetDouble(POSITION_PRICE_CURRENT);
      double OPEN=PositionGetDouble(POSITION_PRICE_OPEN);
      int TYPE=(int)PositionGetInteger(POSITION_TYPE);
      double SL=PositionGetDouble(POSITION_SL);
      double TP=PositionGetDouble(POSITION_TP);
      double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
      int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
      long MAGIC=PositionGetInteger(POSITION_MAGIC);
      string COMM=PositionGetString(POSITION_COMMENT);
      double LOTS=PositionGetDouble(POSITION_VOLUME);
      double SWAP=PositionGetDouble(POSITION_SWAP);
      double PROFIT=PositionGetDouble(POSITION_PROFIT);
      datetime OPENTIME=(datetime)PositionGetInteger(POSITION_TIME);

      if(TICKET>0)
         if(TICKET!=pc1 && TICKET!=pc2)
            if(SYMBOL==Symbol())
               if(MAGIC==magicX || magicX==-1)
                  if(TYPE==POSITION_TYPE_BUY || TYPE==POSITION_TYPE_SELL)
                     if(TYPE==a || TYPE==b || a==-100 || b==-100 || a==-200 || b==-200)
                        if(StringFind(COMM,comm,0)!=-1 || comm=="")
                          {
                           if(PRICE==0
                              ||(高低=="L"&&OPEN>PRICE)
                              ||(高低=="H"&&OPEN<PRICE))
                              if(((价格==0 || 价格>OPEN) && 高低=="L")
                                 || ((价格==0 || 价格<OPEN) && 高低=="H"))
                                {
                                 价格=OPEN;
                                 订单号=TICKET;
                                }
                          }
     }

   PositionSelectByTicket(订单号);
   return(订单号);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ulong 最高最低单据订单号(long a,long b,long magicX,string 高低,string comm,long pc1,long pc2)
  {
   double 价格=0;
   ulong 订单号=0;

   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ulong TICKET=PositionGetTicket(i);
      string SYMBOL=PositionGetString(POSITION_SYMBOL);
      double CLOSE=PositionGetDouble(POSITION_PRICE_CURRENT);
      double OPEN=PositionGetDouble(POSITION_PRICE_OPEN);
      int TYPE=(int)PositionGetInteger(POSITION_TYPE);
      double SL=PositionGetDouble(POSITION_SL);
      double TP=PositionGetDouble(POSITION_TP);
      double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
      int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
      long MAGIC=PositionGetInteger(POSITION_MAGIC);
      string COMM=PositionGetString(POSITION_COMMENT);
      double LOTS=PositionGetDouble(POSITION_VOLUME);
      double SWAP=PositionGetDouble(POSITION_SWAP);
      double PROFIT=PositionGetDouble(POSITION_PROFIT);
      datetime OPENTIME=(datetime)PositionGetInteger(POSITION_TIME);

      if(TICKET>0)
         if(TICKET!=pc1 && TICKET!=pc2)
            if(SYMBOL==Symbol())
               if(MAGIC==magicX || magicX==-1)
                  if(TYPE==POSITION_TYPE_BUY || TYPE==POSITION_TYPE_SELL)
                     if(TYPE==a || TYPE==b || a==-100 || b==-100 || a==-200 || b==-200)
                        if(StringFind(COMM,comm,0)!=-1 || comm=="")
                          {

                           if(((价格==0 || 价格>OPEN) && 高低=="L")
                              || ((价格==0 || 价格<OPEN) && 高低=="H"))
                             {
                              价格=OPEN;
                              订单号=TICKET;
                             }
                          }
     }

   PositionSelectByTicket(订单号);
   return(订单号);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---
   OnTick();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void 按钮(string name,string txt1,string txt2,long XX,long YX,long XL,long YL,long WZ,color A,color B)
  {
   if(ObjectFind(0,name)==-1)
      ObjectCreate(0,name,OBJ_BUTTON,0,0,0);

   ObjectSetInteger(0,name,OBJPROP_XDISTANCE,XX);
   ObjectSetInteger(0,name,OBJPROP_YDISTANCE,YX);
   ObjectSetInteger(0,name,OBJPROP_XSIZE,XL);
   ObjectSetInteger(0,name,OBJPROP_YSIZE,YL);
   ObjectSetString(0,name,OBJPROP_FONT,"微软雅黑");
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,7);
   ObjectSetInteger(0,name,OBJPROP_CORNER,WZ);

   if(ObjectGetInteger(0,name,OBJPROP_STATE)==1)
     {
      ObjectSetInteger(0,name,OBJPROP_COLOR,A);
      ObjectSetInteger(0,name,OBJPROP_BGCOLOR,B);
      ObjectSetString(0,name,OBJPROP_TEXT,txt1);
     }

   else
     {
      ObjectSetInteger(0,name,OBJPROP_COLOR,B);
      ObjectSetInteger(0,name,OBJPROP_BGCOLOR,A);
      ObjectSetString(0,name,OBJPROP_TEXT,txt2);
     }
  }
//+----------------------------------------------------- -------------+

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
ulong findlassorder(long type1,long type2,long magicX,string fx,string 现在与历史,string comm,long 排除)
  {

   if(现在与历史=="现在")
      if(fx=="后")
         for(int i=PositionsTotal()-1; i>=0; i--)
           {
            ulong TICKET=PositionGetTicket(i);
            string SYMBOL=PositionGetString(POSITION_SYMBOL);
            double CLOSE=PositionGetDouble(POSITION_PRICE_CURRENT);
            double OPEN=PositionGetDouble(POSITION_PRICE_OPEN);
            int TYPE=(int)PositionGetInteger(POSITION_TYPE);
            double SL=PositionGetDouble(POSITION_SL);
            double TP=PositionGetDouble(POSITION_TP);
            double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
            int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
            long MAGIC=PositionGetInteger(POSITION_MAGIC);
            string COMM=PositionGetString(POSITION_COMMENT);
            double LOTS=PositionGetDouble(POSITION_VOLUME);
            double SWAP=PositionGetDouble(POSITION_SWAP);
            double PROFIT=PositionGetDouble(POSITION_PROFIT);
            datetime OPENTIME=(datetime)PositionGetInteger(POSITION_TIME);

            if(TICKET>0)
               if(SYMBOL==Symbol())
                  if(MAGIC==magicX || magicX==-1)
                     if(TYPE==POSITION_TYPE_BUY || TYPE==POSITION_TYPE_SELL)
                        if(TYPE==type1 || TYPE==type2 || type1==-100 || type2==-100 || type1==-200 || type2==-200)
                           if(StringFind(COMM,comm,0)!=-1 || comm=="")
                              return(TICKET);
           }

   if(现在与历史=="现在")
      if(fx=="后")
         for(int i=OrdersTotal()-1; i>=0; i--)
           {
            ulong TICKET=OrderGetTicket(i);
            string SYMBOL=OrderGetString(ORDER_SYMBOL);
            double CLOSE=OrderGetDouble(ORDER_PRICE_CURRENT);
            double OPEN=OrderGetDouble(ORDER_PRICE_OPEN);
            int TYPE=(int)OrderGetInteger(ORDER_TYPE);
            double SL=OrderGetDouble(ORDER_SL);
            double TP=OrderGetDouble(ORDER_TP);
            double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
            int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
            long MAGIC=OrderGetInteger(ORDER_MAGIC);
            string COMM=OrderGetString(ORDER_COMMENT);
            double LOTS=OrderGetDouble(ORDER_VOLUME_CURRENT);
            datetime OPENTIME=(datetime)OrderGetInteger(ORDER_TIME_SETUP);

            if(TICKET>0)
               if(SYMBOL==Symbol())
                  if(MAGIC==magicX || magicX==-1)
                     if(TYPE==ORDER_TYPE_BUY_LIMIT || TYPE==ORDER_TYPE_SELL_LIMIT || TYPE==ORDER_TYPE_BUY_STOP || TYPE==ORDER_TYPE_SELL_STOP || TYPE==ORDER_TYPE_BUY_STOP_LIMIT || TYPE==ORDER_TYPE_SELL_STOP_LIMIT)
                        if(TYPE==type1 || TYPE==type2 || type1==-100 || type2==-100 || type1==-300 || type2==-300)
                           if(StringFind(COMM,comm,0)!=-1 || comm=="")
                              return(TICKET);
           }

   if(现在与历史=="现在")
      if(fx=="前")
         for(int i=0; i<PositionsTotal(); i++)
           {
            ulong TICKET=PositionGetTicket(i);
            string SYMBOL=PositionGetString(POSITION_SYMBOL);
            double CLOSE=PositionGetDouble(POSITION_PRICE_CURRENT);
            double OPEN=PositionGetDouble(POSITION_PRICE_OPEN);
            int TYPE=(int)PositionGetInteger(POSITION_TYPE);
            double SL=PositionGetDouble(POSITION_SL);
            double TP=PositionGetDouble(POSITION_TP);
            double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
            int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
            long MAGIC=PositionGetInteger(POSITION_MAGIC);
            string COMM=PositionGetString(POSITION_COMMENT);
            double LOTS=PositionGetDouble(POSITION_VOLUME);
            double SWAP=PositionGetDouble(POSITION_SWAP);
            double PROFIT=PositionGetDouble(POSITION_PROFIT);
            datetime OPENTIME=(datetime)PositionGetInteger(POSITION_TIME);

            if(TICKET>0)
               if(SYMBOL==Symbol())
                  if(MAGIC==magicX || magicX==-1)
                     if(TYPE==POSITION_TYPE_BUY || TYPE==POSITION_TYPE_SELL)
                        if(TYPE==type1 || TYPE==type2 || type1==-100 || type2==-100 || type1==-200 || type2==-200)
                           if(StringFind(COMM,comm,0)!=-1 || comm=="")
                              return(TICKET);
           }

   if(现在与历史=="现在")
      if(fx=="前")
         for(int i=0; i<OrdersTotal(); i++)
           {
            ulong TICKET=OrderGetTicket(i);
            string SYMBOL=OrderGetString(ORDER_SYMBOL);
            double CLOSE=OrderGetDouble(ORDER_PRICE_CURRENT);
            double OPEN=OrderGetDouble(ORDER_PRICE_OPEN);
            int TYPE=(int)OrderGetInteger(ORDER_TYPE);
            double SL=OrderGetDouble(ORDER_SL);
            double TP=OrderGetDouble(ORDER_TP);
            double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
            int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
            long MAGIC=OrderGetInteger(ORDER_MAGIC);
            string COMM=OrderGetString(ORDER_COMMENT);
            double LOTS=OrderGetDouble(ORDER_VOLUME_CURRENT);
            datetime OPENTIME=(datetime)OrderGetInteger(ORDER_TIME_SETUP);

            if(TICKET>0)
               if(SYMBOL==Symbol())
                  if(MAGIC==magicX || magicX==-1)
                     if(TYPE==ORDER_TYPE_BUY_LIMIT || TYPE==ORDER_TYPE_SELL_LIMIT || TYPE==ORDER_TYPE_BUY_STOP || TYPE==ORDER_TYPE_SELL_STOP || TYPE==ORDER_TYPE_BUY_STOP_LIMIT || TYPE==ORDER_TYPE_SELL_STOP_LIMIT)
                        if(TYPE==type1 || TYPE==type2 || type1==-100 || type2==-100 || type1==-300 || type2==-300)
                           if(StringFind(COMM,comm,0)!=-1 || comm=="")
                              return(TICKET);
           }

   HistorySelect(0,TimeCurrent());

   if(现在与历史=="历史")
      if(fx=="后")
         for(int i=HistoryDealsTotal()-1; i>=0; i--)
            if(HistoryDealGetInteger(HistoryDealGetTicket(i),DEAL_ENTRY)==DEAL_ENTRY_OUT)
              {
               ulong TICKETOUT=HistoryDealGetTicket(i);
               ulong TICKET=HistoryDealGetInteger(TICKETOUT,DEAL_POSITION_ID);
               ulong TICKETINT=0;

               for(int i2=HistoryDealsTotal()-1; i2>=0; i2--)
                  if(HistoryDealGetInteger(HistoryDealGetTicket(i2),DEAL_ENTRY)==DEAL_ENTRY_IN)
                     if(HistoryDealGetInteger(HistoryDealGetTicket(i2),DEAL_POSITION_ID)==TICKET)
                        TICKETINT=HistoryDealGetTicket(i2);

               string SYMBOL=HistoryDealGetString(TICKETINT,DEAL_SYMBOL);
               double CLOSE=HistoryDealGetDouble(TICKETOUT,DEAL_PRICE);
               double OPEN=HistoryDealGetDouble(TICKETINT,DEAL_PRICE);
               int TYPE=(int)HistoryDealGetInteger(TICKETINT,DEAL_TYPE);
               //double SL=HistoryDealGetDouble(POSITION_SL);
               //double TP=HistoryDealGetDouble(POSITION_TP);
               double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
               int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
               long MAGIC=HistoryDealGetInteger(TICKETINT,DEAL_MAGIC);//未落实
               string COMM=HistoryDealGetString(TICKETINT,DEAL_COMMENT);
               double LOTSOUT=HistoryDealGetDouble(TICKETOUT,DEAL_VOLUME);
               double LOTSINT=HistoryDealGetDouble(TICKETINT,DEAL_VOLUME);
               double SWAP=HistoryDealGetDouble(TICKETOUT,DEAL_SWAP);//未落实
               double PROFIT=HistoryDealGetDouble(TICKETOUT,DEAL_PROFIT);
               datetime OPENTIME=(datetime)HistoryDealGetInteger(TICKETINT,DEAL_TIME);
               datetime CLOSETIME=(datetime)HistoryDealGetInteger(TICKETOUT,DEAL_TIME);
               double 剩余LOTS=0;
               if(PositionSelectByTicket(TICKET))
                  剩余LOTS=PositionGetDouble(POSITION_VOLUME);

               if(TICKET>0)
                  if(SYMBOL==Symbol())
                     if(MAGIC==magicX || magicX==-1)
                        if(TYPE==DEAL_TYPE_BUY || TYPE==DEAL_TYPE_SELL)
                           if(TYPE==type1 || TYPE==type2 || type1==-100 || type2==-100 || type1==-200 || type2==-200)
                              if(StringFind(COMM,comm,0)!=-1 || comm=="")
                                 return(TICKETOUT);
              }

   if(现在与历史=="历史")
      if(fx=="前")
         for(int i=0; i<HistoryDealsTotal(); i++)
            if(HistoryDealGetInteger(HistoryDealGetTicket(i),DEAL_ENTRY)==DEAL_ENTRY_OUT)
              {
               ulong TICKETOUT=HistoryDealGetTicket(i);
               ulong TICKET=HistoryDealGetInteger(TICKETOUT,DEAL_POSITION_ID);
               ulong TICKETINT=0;

               for(int i2=HistoryDealsTotal()-1; i2>=0; i2--)
                  if(HistoryDealGetInteger(HistoryDealGetTicket(i2),DEAL_ENTRY)==DEAL_ENTRY_IN)
                     if(HistoryDealGetInteger(HistoryDealGetTicket(i2),DEAL_POSITION_ID)==TICKET)
                        TICKETINT=HistoryDealGetTicket(i2);

               string SYMBOL=HistoryDealGetString(TICKETINT,DEAL_SYMBOL);
               double CLOSE=HistoryDealGetDouble(TICKETOUT,DEAL_PRICE);
               double OPEN=HistoryDealGetDouble(TICKETINT,DEAL_PRICE);
               int TYPE=(int)HistoryDealGetInteger(TICKETINT,DEAL_TYPE);
               //double SL=HistoryDealGetDouble(POSITION_SL);
               //double TP=HistoryDealGetDouble(POSITION_TP);
               double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
               int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
               long MAGIC=HistoryDealGetInteger(TICKETINT,DEAL_MAGIC);//未落实
               string COMM=HistoryDealGetString(TICKETINT,DEAL_COMMENT);
               double LOTSOUT=HistoryDealGetDouble(TICKETOUT,DEAL_VOLUME);
               double LOTSINT=HistoryDealGetDouble(TICKETINT,DEAL_VOLUME);
               double SWAP=HistoryDealGetDouble(TICKETOUT,DEAL_SWAP);//未落实
               double PROFIT=HistoryDealGetDouble(TICKETOUT,DEAL_PROFIT);
               datetime OPENTIME=(datetime)HistoryDealGetInteger(TICKETINT,DEAL_TIME);
               datetime CLOSETIME=(datetime)HistoryDealGetInteger(TICKETOUT,DEAL_TIME);
               double 剩余LOTS=0;
               if(PositionSelectByTicket(TICKET))
                  剩余LOTS=PositionGetDouble(POSITION_VOLUME);

               if(TICKET>0)
                  if(SYMBOL==Symbol())
                     if(MAGIC==magicX || magicX==-1)
                        if(TYPE==DEAL_TYPE_BUY || TYPE==DEAL_TYPE_SELL)
                           if(TYPE==type1 || TYPE==type2 || type1==-100 || type2==-100 || type1==-200 || type2==-200)
                              if(StringFind(COMM,comm,0)!=-1 || comm=="")
                                 return(TICKETOUT);
              }

   if(现在与历史=="历史")
      if(fx=="后")
         for(int i=HistoryOrdersTotal()-1; i>=0; i--)
           {
            ulong TICKET=HistoryOrderGetTicket(i);
            string SYMBOL=HistoryOrderGetString(TICKET,ORDER_SYMBOL);
            double OPEN=HistoryOrderGetDouble(TICKET,ORDER_PRICE_OPEN);
            int TYPE=(int)HistoryOrderGetInteger(TICKET,ORDER_TYPE);
            double SL=HistoryOrderGetDouble(TICKET,ORDER_SL);
            double TP=HistoryOrderGetDouble(TICKET,ORDER_TP);
            double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
            int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
            long MAGIC=HistoryOrderGetInteger(TICKET,ORDER_MAGIC);
            string COMM=HistoryOrderGetString(TICKET,ORDER_COMMENT);
            double LOTS=HistoryOrderGetDouble(TICKET,ORDER_VOLUME_INITIAL);
            datetime OPENTIME=(datetime)HistoryOrderGetInteger(TICKET,ORDER_TIME_SETUP);
            datetime CLOSETIME=(datetime)HistoryOrderGetInteger(TICKET,ORDER_TIME_DONE);

            if(TICKET>0)
               if(SYMBOL==Symbol())
                  if(MAGIC==magicX || magicX==-1)
                     if(TYPE==ORDER_TYPE_BUY_LIMIT || TYPE==ORDER_TYPE_SELL_LIMIT || TYPE==ORDER_TYPE_BUY_STOP || TYPE==ORDER_TYPE_SELL_STOP || TYPE==ORDER_TYPE_BUY_STOP_LIMIT || TYPE==ORDER_TYPE_SELL_STOP_LIMIT)
                        if(TYPE==type1 || TYPE==type2 || type1==-100 || type2==-100 || type1==-300 || type2==-300)
                           if(StringFind(COMM,comm,0)!=-1 || comm=="")
                              return(TICKET);
           }

   if(现在与历史=="历史")
      if(fx=="前")
         for(int i=0; i<HistoryOrdersTotal(); i++)
           {
            ulong TICKET=HistoryOrderGetTicket(i);
            string SYMBOL=HistoryOrderGetString(TICKET,ORDER_SYMBOL);
            double OPEN=HistoryOrderGetDouble(TICKET,ORDER_PRICE_OPEN);
            int TYPE=(int)HistoryOrderGetInteger(TICKET,ORDER_TYPE);
            double SL=HistoryOrderGetDouble(TICKET,ORDER_SL);
            double TP=HistoryOrderGetDouble(TICKET,ORDER_TP);
            double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
            int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
            long MAGIC=HistoryOrderGetInteger(TICKET,ORDER_MAGIC);
            string COMM=HistoryOrderGetString(TICKET,ORDER_COMMENT);
            double LOTS=HistoryOrderGetDouble(TICKET,ORDER_VOLUME_INITIAL);
            datetime OPENTIME=(datetime)HistoryOrderGetInteger(TICKET,ORDER_TIME_SETUP);
            datetime CLOSETIME=(datetime)HistoryOrderGetInteger(TICKET,ORDER_TIME_DONE);

            if(TICKET>0)
               if(SYMBOL==Symbol())
                  if(MAGIC==magicX || magicX==-1)
                     if(TYPE==ORDER_TYPE_BUY_LIMIT || TYPE==ORDER_TYPE_SELL_LIMIT || TYPE==ORDER_TYPE_BUY_STOP || TYPE==ORDER_TYPE_SELL_STOP || TYPE==ORDER_TYPE_BUY_STOP_LIMIT || TYPE==ORDER_TYPE_SELL_STOP_LIMIT)
                        if(TYPE==type1 || TYPE==type2 || type1==-100 || type2==-100 || type1==-300 || type2==-300)
                           if(StringFind(COMM,comm,0)!=-1 || comm=="")
                              return(TICKET);
           }

   return(0);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
bool OrderClose(ulong ticket)
  {
   if(PositionSelectByTicket(ticket))
     {
      ulong TICKET=ticket;
      string SYMBOL=PositionGetString(POSITION_SYMBOL);
      double CLOSE=PositionGetDouble(POSITION_PRICE_CURRENT);
      double OPEN=PositionGetDouble(POSITION_PRICE_OPEN);
      int TYPE=(int)PositionGetInteger(POSITION_TYPE);
      double SL=PositionGetDouble(POSITION_SL);
      double TP=PositionGetDouble(POSITION_TP);
      double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
      int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
      long MAGIC=PositionGetInteger(POSITION_MAGIC);
      string COMM=PositionGetString(POSITION_COMMENT);
      double LOTS=PositionGetDouble(POSITION_VOLUME);
      double SWAP=PositionGetDouble(POSITION_SWAP);
      double PROFIT=PositionGetDouble(POSITION_PROFIT);
      datetime OPENTIME=(datetime)PositionGetInteger(POSITION_TIME);

      ZeroMemory(request);
      ZeroMemory(result);

      if(错误调试1==1)
         request.type_filling=ORDER_FILLING_FOK;
      if(错误调试1==2)
         request.type_filling=ORDER_FILLING_IOC;
      if(错误调试1==3)
         request.type_filling=ORDER_FILLING_RETURN;

      request.action=TRADE_ACTION_DEAL;
      request.symbol=SYMBOL;
      request.position=TICKET;
      request.volume=LOTS;
      request.deviation=(ulong)(滑点*系数(SYMBOL));

      if(TYPE==POSITION_TYPE_BUY)
        {
         request.type=1;
         request.price=CLOSE;//SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_BID);
        }

      if(TYPE==POSITION_TYPE_SELL)
        {
         request.type=0;
         request.price=CLOSE;//SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_ASK);
        }
      if(OrderSend(request,result))
         return(true);
     }
   return(false);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void deleteorder(long typeX,long magicX,string comm)
  {

   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ulong TICKET=PositionGetTicket(i);
      string SYMBOL=PositionGetString(POSITION_SYMBOL);
      double CLOSE=PositionGetDouble(POSITION_PRICE_CURRENT);
      double OPEN=PositionGetDouble(POSITION_PRICE_OPEN);
      int TYPE=(int)PositionGetInteger(POSITION_TYPE);
      double SL=PositionGetDouble(POSITION_SL);
      double TP=PositionGetDouble(POSITION_TP);
      double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
      int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
      long MAGIC=PositionGetInteger(POSITION_MAGIC);
      string COMM=PositionGetString(POSITION_COMMENT);
      double LOTS=PositionGetDouble(POSITION_VOLUME);
      double SWAP=PositionGetDouble(POSITION_SWAP);
      double PROFIT=PositionGetDouble(POSITION_PROFIT);
      datetime OPENTIME=(datetime)PositionGetInteger(POSITION_TIME);

      if(TICKET>0)
         if(SYMBOL==Symbol())
            if(MAGIC==magicX || magicX==-1)
               if(TYPE==POSITION_TYPE_BUY || TYPE==POSITION_TYPE_SELL)
                  if(TYPE==typeX || typeX==-100 || typeX==-200)
                     if(StringFind(COMM,comm,0)!=-1 || comm=="")
                        //if(OrderOpenTime()<=time)
                       {
                        ZeroMemory(request);
                        ZeroMemory(result);

                        if(错误调试1==1)
                           request.type_filling=ORDER_FILLING_FOK;
                        if(错误调试1==2)
                           request.type_filling=ORDER_FILLING_IOC;
                        if(错误调试1==3)
                           request.type_filling=ORDER_FILLING_RETURN;

                        request.action=TRADE_ACTION_DEAL;
                        request.symbol=SYMBOL;
                        request.position=TICKET;
                        request.volume=LOTS;
                        request.deviation=(ulong)(滑点*系数(SYMBOL));

                        if(TYPE==POSITION_TYPE_BUY)
                          {
                           request.type=1;
                           request.price=CLOSE;//SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_BID);
                          }

                        if(TYPE==POSITION_TYPE_SELL)
                          {
                           request.type=0;
                           request.price=CLOSE;//SymbolInfoDouble(PositionGetString(POSITION_SYMBOL),SYMBOL_ASK);
                          }

                        check=OrderSend(request,result);
                        i=PositionsTotal();
                       }
     }

   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      ulong TICKET=OrderGetTicket(i);
      string SYMBOL=OrderGetString(ORDER_SYMBOL);
      double CLOSE=OrderGetDouble(ORDER_PRICE_CURRENT);
      double OPEN=OrderGetDouble(ORDER_PRICE_OPEN);
      int TYPE=(int)OrderGetInteger(ORDER_TYPE);
      double SL=OrderGetDouble(ORDER_SL);
      double TP=OrderGetDouble(ORDER_TP);
      double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
      int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
      long MAGIC=OrderGetInteger(ORDER_MAGIC);
      string COMM=OrderGetString(ORDER_COMMENT);
      double LOTS=OrderGetDouble(ORDER_VOLUME_CURRENT);
      datetime OPENTIME=(datetime)OrderGetInteger(ORDER_TIME_SETUP);

      if(TICKET>0)
         if(SYMBOL==Symbol())
            if(MAGIC==magicX || magicX==-1)
               if(TYPE==ORDER_TYPE_BUY_LIMIT || TYPE==ORDER_TYPE_SELL_LIMIT || TYPE==ORDER_TYPE_BUY_STOP || TYPE==ORDER_TYPE_SELL_STOP || TYPE==ORDER_TYPE_BUY_STOP_LIMIT || TYPE==ORDER_TYPE_SELL_STOP_LIMIT)
                  if(TYPE==typeX || typeX==-100 || typeX==-300)
                     if(StringFind(COMM,comm,0)!=-1 || comm=="")
                       {
                        ZeroMemory(request);
                        ZeroMemory(result);

                        if(错误调试1==1)
                           request.type_filling=ORDER_FILLING_FOK;
                        if(错误调试1==2)
                           request.type_filling=ORDER_FILLING_IOC;
                        if(错误调试1==3)
                           request.type_filling=ORDER_FILLING_RETURN;

                        request.action=TRADE_ACTION_REMOVE;
                        request.order=TICKET;
                        request.symbol=SYMBOL;
                        request.deviation=(ulong)(滑点*系数(SYMBOL));

                        check=OrderSend(request,result);
                        i=OrdersTotal();
                       }
     }
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int 分项单据统计HL(long typeX,long magicX,string comm,string HL,double price)
  {
   int 数量=0;
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ulong TICKET=PositionGetTicket(i);
      string SYMBOL=PositionGetString(POSITION_SYMBOL);
      double CLOSE=PositionGetDouble(POSITION_PRICE_CURRENT);
      double OPEN=PositionGetDouble(POSITION_PRICE_OPEN);
      long TYPE=PositionGetInteger(POSITION_TYPE);
      double SL=PositionGetDouble(POSITION_SL);
      double TP=PositionGetDouble(POSITION_TP);
      double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
      int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
      long MAGIC=PositionGetInteger(POSITION_MAGIC);
      string COMM=PositionGetString(POSITION_COMMENT);
      double LOTS=PositionGetDouble(POSITION_VOLUME);
      double SWAP=PositionGetDouble(POSITION_SWAP);
      double PROFIT=PositionGetDouble(POSITION_PROFIT);
      datetime OPENTIME=(datetime)PositionGetInteger(POSITION_TIME);

      if(TICKET>0)
         if(SYMBOL==Symbol())
            if(MAGIC==magicX || magicX==-1)
               if(TYPE==POSITION_TYPE_BUY || TYPE==POSITION_TYPE_SELL)
                  if(TYPE==typeX || typeX==-100 || typeX==-200)
                     if(StringFind(COMM,comm,0)!=-1 || comm=="")
                        if(
                           (HL=="H"&&OPEN>price)
                           ||(HL=="L"&&OPEN<price)
                        )
                           数量++;
     }

   return(数量);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
long 分项单据统计(long typeX,long magicX,string comm)
  {
   long 数量=0;
   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ulong TICKET=PositionGetTicket(i);
      string SYMBOL=PositionGetString(POSITION_SYMBOL);
      double CLOSE=PositionGetDouble(POSITION_PRICE_CURRENT);
      double OPEN=PositionGetDouble(POSITION_PRICE_OPEN);
      long TYPE=PositionGetInteger(POSITION_TYPE);
      double SL=PositionGetDouble(POSITION_SL);
      double TP=PositionGetDouble(POSITION_TP);
      double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
      int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
      long MAGIC=PositionGetInteger(POSITION_MAGIC);
      string COMM=PositionGetString(POSITION_COMMENT);
      double LOTS=PositionGetDouble(POSITION_VOLUME);
      double SWAP=PositionGetDouble(POSITION_SWAP);
      double PROFIT=PositionGetDouble(POSITION_PROFIT);
      datetime OPENTIME=(datetime)PositionGetInteger(POSITION_TIME);

      if(TICKET>0)
         if(SYMBOL==Symbol())
            if(MAGIC==magicX || magicX==-1)
               if(TYPE==POSITION_TYPE_BUY || TYPE==POSITION_TYPE_SELL)
                  if(TYPE==typeX || typeX==-100 || typeX==-200)
                     if(StringFind(COMM,comm,0)!=-1 || comm=="")
                        数量++;
     }

   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      ulong TICKET=OrderGetTicket(i);
      string SYMBOL=OrderGetString(ORDER_SYMBOL);
      double CLOSE=OrderGetDouble(ORDER_PRICE_CURRENT);
      double OPEN=OrderGetDouble(ORDER_PRICE_OPEN);
      long TYPE=OrderGetInteger(ORDER_TYPE);
      double SL=OrderGetDouble(ORDER_SL);
      double TP=OrderGetDouble(ORDER_TP);
      double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
      int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
      long MAGIC=OrderGetInteger(ORDER_MAGIC);
      string COMM=OrderGetString(ORDER_COMMENT);
      double LOTS=OrderGetDouble(ORDER_VOLUME_CURRENT);
      datetime OPENTIME=(datetime)OrderGetInteger(ORDER_TIME_SETUP);

      if(TICKET>0)
         if(SYMBOL==Symbol())
            if(MAGIC==magicX || magicX==-1)
               if(TYPE==ORDER_TYPE_BUY_LIMIT || TYPE==ORDER_TYPE_SELL_LIMIT || TYPE==ORDER_TYPE_BUY_STOP || TYPE==ORDER_TYPE_SELL_STOP || TYPE==ORDER_TYPE_BUY_STOP_LIMIT || TYPE==ORDER_TYPE_SELL_STOP_LIMIT)
                  if(TYPE==typeX || typeX==-100 || typeX==-300)
                     if(StringFind(COMM,comm,0)!=-1 || comm=="")
                        数量++;
     }
   return(数量);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double 分类单据利润(long typeX,long magicX,string comm)
  {
   double 利润=0;

   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ulong TICKET=PositionGetTicket(i);
      string SYMBOL=PositionGetString(POSITION_SYMBOL);
      double CLOSE=PositionGetDouble(POSITION_PRICE_CURRENT);
      double OPEN=PositionGetDouble(POSITION_PRICE_OPEN);
      int TYPE=(int)PositionGetInteger(POSITION_TYPE);
      double SL=PositionGetDouble(POSITION_SL);
      double TP=PositionGetDouble(POSITION_TP);
      double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
      int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
      long MAGIC=PositionGetInteger(POSITION_MAGIC);
      string COMM=PositionGetString(POSITION_COMMENT);
      double LOTS=PositionGetDouble(POSITION_VOLUME);
      double SWAP=PositionGetDouble(POSITION_SWAP);
      double PROFIT=PositionGetDouble(POSITION_PROFIT);
      datetime OPENTIME=(datetime)PositionGetInteger(POSITION_TIME);

      if(TICKET>0)
         if(SYMBOL==Symbol())
            if(MAGIC==magicX || magicX==-1)
               if(TYPE==POSITION_TYPE_BUY || TYPE==POSITION_TYPE_SELL)
                  if(TYPE==typeX || typeX==-100 || typeX==-200)
                     if(StringFind(COMM,comm,0)!=-1 || comm=="")
                        利润+=(PROFIT+SWAP);//OrderCommission()
     }
   return(利润);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double 总交易量(long typeX,long magicX,string comm)
  {
   double 交易量=0;

   for(int i=PositionsTotal()-1; i>=0; i--)
     {
      ulong TICKET=PositionGetTicket(i);
      string SYMBOL=PositionGetString(POSITION_SYMBOL);
      double CLOSE=PositionGetDouble(POSITION_PRICE_CURRENT);
      double OPEN=PositionGetDouble(POSITION_PRICE_OPEN);
      int TYPE=(int)PositionGetInteger(POSITION_TYPE);
      double SL=PositionGetDouble(POSITION_SL);
      double TP=PositionGetDouble(POSITION_TP);
      double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
      int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
      long MAGIC=PositionGetInteger(POSITION_MAGIC);
      string COMM=PositionGetString(POSITION_COMMENT);
      double LOTS=PositionGetDouble(POSITION_VOLUME);
      double SWAP=PositionGetDouble(POSITION_SWAP);
      double PROFIT=PositionGetDouble(POSITION_PROFIT);
      datetime OPENTIME=(datetime)PositionGetInteger(POSITION_TIME);

      if(TICKET>0)
         if(SYMBOL==Symbol())
            if(MAGIC==magicX || magicX==-1)
               if(TYPE==POSITION_TYPE_BUY || TYPE==POSITION_TYPE_SELL)
                  if(TYPE==typeX || typeX==-100 || typeX==-200)
                     if(StringFind(COMM,comm,0)!=-1 || comm=="")
                        交易量+=LOTS;
     }

   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      ulong TICKET=OrderGetTicket(i);
      string SYMBOL=OrderGetString(ORDER_SYMBOL);
      double CLOSE=OrderGetDouble(ORDER_PRICE_CURRENT);
      double OPEN=OrderGetDouble(ORDER_PRICE_OPEN);
      int TYPE=(int)OrderGetInteger(ORDER_TYPE);
      double SL=OrderGetDouble(ORDER_SL);
      double TP=OrderGetDouble(ORDER_TP);
      double POINT=SymbolInfoDouble(SYMBOL,SYMBOL_POINT);
      int DIGITS=(int)SymbolInfoInteger(SYMBOL,SYMBOL_DIGITS);
      long MAGIC=OrderGetInteger(ORDER_MAGIC);
      string COMM=OrderGetString(ORDER_COMMENT);
      double LOTS=OrderGetDouble(ORDER_VOLUME_CURRENT);
      datetime OPENTIME=(datetime)OrderGetInteger(ORDER_TIME_SETUP);

      if(TICKET>0)
         if(SYMBOL==Symbol())
            if(MAGIC==magicX || magicX==-1)
               if(TYPE==ORDER_TYPE_BUY_LIMIT || TYPE==ORDER_TYPE_SELL_LIMIT || TYPE==ORDER_TYPE_BUY_STOP || TYPE==ORDER_TYPE_SELL_STOP || TYPE==ORDER_TYPE_BUY_STOP_LIMIT || TYPE==ORDER_TYPE_SELL_STOP_LIMIT)
                  if(TYPE==typeX || typeX==-100 || typeX==-300)
                     if(StringFind(COMM,comm,0)!=-1 || comm=="")
                        交易量+=LOTS;
     }
   return(交易量);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void 固定位置标签(string 名称,string 内容,long XX,long YX,color C,long 字体大小,long 固定角内)
  {
   if(内容==NULL)
      return;

   if(ObjectFind(0,名称)==-1)
     {
      ObjectDelete(0,名称);
      ObjectCreate(0,名称,OBJ_LABEL,0,0,0);
     }
   ObjectSetInteger(0,名称,OBJPROP_XDISTANCE,XX);
   ObjectSetInteger(0,名称,OBJPROP_YDISTANCE,YX);
   ObjectSetString(0,名称,OBJPROP_TEXT,内容);
   ObjectSetString(0,名称,OBJPROP_FONT,"宋体");
   ObjectSetInteger(0,名称,OBJPROP_FONTSIZE,字体大小);
   ObjectSetInteger(0,名称,OBJPROP_COLOR,C);
   ObjectSetInteger(0,名称,OBJPROP_CORNER,固定角内);
   ObjectSetInteger(0,名称,OBJPROP_ANCHOR,ANCHOR_LEFT);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
long 建立单据(string 货币对,ENUM_ORDER_TYPE 类型,double 单量内,double 价位,double 间隔,double 止损内,double 止盈内,string 备注内,long magicX)
  {

   备注内=备注内+"-"+(string)Period()+"-"+(string)magicX;

   int 单量小数保留内=0;
   if(SymbolInfoDouble(货币对,SYMBOL_VOLUME_STEP)<10)
      单量小数保留内=0;
   if(SymbolInfoDouble(货币对,SYMBOL_VOLUME_STEP)<1)
      单量小数保留内=1;
   if(SymbolInfoDouble(货币对,SYMBOL_VOLUME_STEP)<0.1)
      单量小数保留内=2;

   单量内=NormalizeDouble(单量内,单量小数保留内);

   if(单量内<SymbolInfoDouble(货币对,SYMBOL_VOLUME_MIN))
     {
      laber("低于最低单量",Yellow,0);
      return(-1);
     }

   if(单量内>SymbolInfoDouble(货币对,SYMBOL_VOLUME_MAX))
      单量内=SymbolInfoDouble(货币对,SYMBOL_VOLUME_MAX);

   long     t=-1;
   double POINT=SymbolInfoDouble(货币对,SYMBOL_POINT)*系数(货币对);
   int DIGITS=(int)SymbolInfoInteger(货币对,SYMBOL_DIGITS);
   long 滑点内=(long)(滑点*系数(货币对));

   if(类型==0 || 类型==1)
     {
      double AA=0;

      if(类型==0)
         check=OrderCalcMargin(ORDER_TYPE_BUY,货币对,单量内,SymbolInfoDouble(货币对,SYMBOL_ASK),AA);
      if(类型==1)
         check=OrderCalcMargin(ORDER_TYPE_SELL,货币对,单量内,SymbolInfoDouble(货币对,SYMBOL_BID),AA);

      if(AccountInfoDouble(ACCOUNT_MARGIN_FREE)<AA)
        {
         Print("保证金不足");
         return(-1);
        }
     }

   if(类型==0 || 类型==1)
     {
      t=-1;
      for(long ix2=0; ix2<3; ix2++)
        {
         //RefreshRates();
         ZeroMemory(request);
         ZeroMemory(result);

         if(错误调试1==1)request.type_filling=ORDER_FILLING_FOK;
         if(错误调试1==2)request.type_filling=ORDER_FILLING_IOC;
         if(错误调试1==3)request.type_filling=ORDER_FILLING_RETURN;
         request.action=TRADE_ACTION_DEAL;
         request.symbol=货币对;
         request.type=类型;
         request.volume=单量内;
         request.deviation=滑点内;
         request.comment=备注内;
         request.magic=magicX;
         request.deviation=(ulong)(滑点*系数(货币对));

         if(类型==0)
           {
            request.price=SymbolInfoDouble(货币对,SYMBOL_ASK);
            request.tp=止盈内!=0?NormalizeDouble(SymbolInfoDouble(货币对,SYMBOL_ASK)+止盈内 *POINT,DIGITS):0;
            request.sl=止损内!=0?NormalizeDouble(SymbolInfoDouble(货币对,SYMBOL_ASK)-止损内 *POINT,DIGITS):0;
           }

         if(类型==1)
           {
            request.price=SymbolInfoDouble(货币对,SYMBOL_BID);
            request.tp=止盈内!=0?NormalizeDouble(SymbolInfoDouble(货币对,SYMBOL_BID)-止盈内 *POINT,DIGITS):0;
            request.sl=止损内!=0?NormalizeDouble(SymbolInfoDouble(货币对,SYMBOL_BID)+止损内 *POINT,DIGITS):0;
           }

         if(OrderSend(request,result)==false)
            报错组件("");
         else
           {
            t=(long)result.order;
            break;
           }
        }
     }

   if(类型==ORDER_TYPE_BUY_LIMIT || 类型==ORDER_TYPE_BUY_STOP || 类型==ORDER_TYPE_SELL_LIMIT || 类型==ORDER_TYPE_SELL_STOP)
     {
      t=-1;
      for(long ix2=0; ix2<3; ix2++)
        {
         //RefreshRates();
         ZeroMemory(request);
         ZeroMemory(result);

         if(错误调试1==1)
            request.type_filling=ORDER_FILLING_FOK;
         if(错误调试1==2)
            request.type_filling=ORDER_FILLING_IOC;
         if(错误调试1==3)
            request.type_filling=ORDER_FILLING_RETURN;

         request.action=TRADE_ACTION_PENDING;
         request.symbol=货币对;
         request.type=类型;
         request.volume=单量内;
         request.deviation=滑点内;
         request.comment=备注内;
         request.magic=magicX;
         request.deviation=(ulong)(滑点*系数(货币对));

         if(类型==0 || 类型==ORDER_TYPE_BUY_LIMIT || 类型==ORDER_TYPE_BUY_STOP)
           {
            if(价位==0)
               价位=SymbolInfoDouble(货币对,SYMBOL_ASK);
            double price=0;
            if(类型==0)
               price=NormalizeDouble(SymbolInfoDouble(货币对,SYMBOL_ASK),DIGITS);
            if(类型==ORDER_TYPE_BUY_LIMIT)
               price=NormalizeDouble(价位-间隔*POINT,DIGITS);
            if(类型==ORDER_TYPE_BUY_STOP)
               price=NormalizeDouble(价位+间隔*POINT,DIGITS);

            request.price=price;
            request.tp=止盈内!=0?NormalizeDouble(price+止盈内 *POINT,DIGITS):0;
            request.sl=止损内!=0?NormalizeDouble(price-止损内 *POINT,DIGITS):0;
           }

         if(类型==1 || 类型==ORDER_TYPE_SELL_LIMIT || 类型==ORDER_TYPE_SELL_STOP)
           {
            if(价位==0)
               价位=SymbolInfoDouble(货币对,SYMBOL_BID);
            double price=0;
            if(类型==1)
               price=NormalizeDouble(SymbolInfoDouble(货币对,SYMBOL_BID),DIGITS);
            if(类型==ORDER_TYPE_SELL_LIMIT)
               price=NormalizeDouble(价位+间隔*POINT,DIGITS);
            if(类型==ORDER_TYPE_SELL_STOP)
               price=NormalizeDouble(价位-间隔*POINT,DIGITS);

            request.price=price;
            request.tp=止盈内!=0?NormalizeDouble(price-止盈内 *POINT,DIGITS):0;
            request.sl=止损内!=0?NormalizeDouble(price+止损内 *POINT,DIGITS):0;
           }

         if(OrderSend(request,result)==false)
            报错组件("");
         else
           {
            t=(long)result.order;
            break;
           }
        }
     }
   if(t!=-1)
      Sleep(1000);
   return(t);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double 滑点=30;
input bool 是否显示文字标签=true;
input bool 国际点差自适应=true;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double 系数(string symbol)
  {
   double 系数=1;
   if(
      SymbolInfoInteger(symbol,SYMBOL_DIGITS)==3
      || SymbolInfoInteger(symbol,SYMBOL_DIGITS)==5
      || (StringFind(symbol,"XAU",0)==0 && SymbolInfoInteger(symbol,SYMBOL_DIGITS)==2)
      ||(StringFind(symbol,"GOLD",0)==0&&SymbolInfoInteger(symbol,SYMBOL_DIGITS)==2)
      ||(StringFind(symbol,"Gold",0)==0&&SymbolInfoInteger(symbol,SYMBOL_DIGITS)==2)
      || (StringFind(symbol,"USD_GLD",0)==0 && SymbolInfoInteger(symbol,SYMBOL_DIGITS)==2)
   )
      系数=10;

   if(StringFind(symbol,"XAU",0)==0 && SymbolInfoInteger(symbol,SYMBOL_DIGITS)==3)
      系数=100;
   if(StringFind(symbol,"GOLD",0)==0 && SymbolInfoInteger(symbol,SYMBOL_DIGITS)==3)
      系数=100;
   if(StringFind(symbol,"Gold",0)==0 && SymbolInfoInteger(symbol,SYMBOL_DIGITS)==3)
      系数=100;
   if(StringFind(symbol,"USD_GLD",0)==0 && SymbolInfoInteger(symbol,SYMBOL_DIGITS)==3)
      系数=100;

   if(国际点差自适应==false)
      return(1);

   return(系数);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void laber(string a,color b,long jl)
  {
   Print(a);
//if(IsOptimization())
//   return;

   if(是否显示文字标签==true)
     {
      double hh=ChartGetDouble(0,CHART_PRICE_MAX);
      double ll=ChartGetDouble(0,CHART_PRICE_MIN);
      double 文字小距离=(hh-ll)*0.03;

      ObjectDelete(0,"箭头"+TimeToString(iTime(Symbol(),0,0),TIME_DATE|TIME_MINUTES)+a);
      ObjectCreate(0,"箭头"+TimeToString(iTime(Symbol(),0,0),TIME_DATE|TIME_MINUTES)+a,OBJ_TEXT,0,iTime(Symbol(),0,0),iLow(Symbol(),0,0)-jl*文字小距离);
      ObjectSetString(0,"箭头"+TimeToString(iTime(Symbol(),0,0),TIME_DATE|TIME_MINUTES)+a,OBJPROP_TEXT,a);
      ObjectSetString(0,"箭头"+TimeToString(iTime(Symbol(),0,0),TIME_DATE|TIME_MINUTES)+a,OBJPROP_FONT,"Times New Roman");
      ObjectSetInteger(0,"箭头"+TimeToString(iTime(Symbol(),0,0),TIME_DATE|TIME_MINUTES)+a,OBJPROP_FONTSIZE,8);
      ObjectSetInteger(0,"箭头"+TimeToString(iTime(Symbol(),0,0),TIME_DATE|TIME_MINUTES)+a,OBJPROP_COLOR,b);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void 报错组件(string a)
  {

//RefreshRates();

//if(IsOptimization())
//   return;

   long t=GetLastError();

   if(t!=0)
     {
      //while(IsTradeContextBusy())
      Sleep(300);
      Print(t);
      laber((string)t,Yellow,0);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void laber0(string name,string txt,color 颜色,datetime 时间,double 价位,long 字体大小,long 定位,int 窗口)
  {
   ObjectDelete(0,name);
   ObjectCreate(0,name,OBJ_TEXT,窗口,时间,价位);
   ObjectSetString(0,name,OBJPROP_TEXT,txt);
   ObjectSetString(0,name,OBJPROP_FONT,"Times New Roman");
   ObjectSetInteger(0,name,OBJPROP_FONTSIZE,字体大小);
   ObjectSetInteger(0,name,OBJPROP_COLOR,颜色);
   ObjectSetInteger(0,name,OBJPROP_ANCHOR,定位);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void 画直线(string e,ENUM_OBJECT type,double b,datetime c,color d,long type2,long width)
  {
   ObjectDelete(0,e);
   ObjectCreate(0,e,type,0,0,0);
   ObjectSetDouble(0,e,OBJPROP_PRICE,0,b);
   ObjectSetInteger(0,e,OBJPROP_TIME,0,c);
   ObjectSetInteger(0,e,OBJPROP_COLOR,d);
   ObjectSetInteger(0,e,OBJPROP_STYLE,type2);
   ObjectSetInteger(0,e,OBJPROP_WIDTH,width);
  }
enum ORDER_FILLING模式
  {
   模式1=1,
   模式2=2,
   模式3=3,
  };
input ORDER_FILLING模式 错误调试1=2;//出现Unsupported filling mode报错时调试
input datetime 程序最终编译时间=__DATETIME__;
//+------------------------------------------------------------------+
