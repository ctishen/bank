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
input bool 对冲总开关2=true;
input int 对冲启动大于等于=5;
input int 对冲启动小于等于=10;
input bool 对冲平单总开关2=true;
input double 对冲后盈利大于X美金2=100;
input double 每次对冲掉手数2=1;


input double 顺势加仓距离=30;
input double 逆势加仓距离=30;
input int 顺势最大加仓次数=20;
input int 逆势最大加仓次数=20;
input double 首单单量=1;
input double 顺势单量=2;
input double 逆势单量=1;
/*
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
*/
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
//input string _____指标1MA_____="------MA------";
//input bool 指标1开关=false;
//input XHWZ 指标1信号位置=收盘出现信号判断;
//input ENUM_TIMEFRAMES 指标1时间轴=PERIOD_CURRENT;
//input string 指标1名称="MA";
//input int  指标1MA周期1=100;
//input int  指标1MA平移1=0;
//input ENUM_MA_METHOD  指标1MA计算方式1=MODE_SMA;
//input ENUM_APPLIED_PRICE  指标1MA价格方式1=PRICE_CLOSE;
//input int  指标1MA周期2=200;
//input int  指标1MA平移2=0;
//input ENUM_MA_METHOD  指标1MA计算方式2=MODE_SMA;
//input ENUM_APPLIED_PRICE  指标1MA价格方式2=PRICE_CLOSE;
//int 指标1做多,指标1做空;
//+------------------------------------------------------------------+
//| |
//+------------------------------------------------------------------+
/*
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

   double MA1=iMA(Symbol(),指标1时间轴,指标1MA周期1,指标1MA平移1,指标1MA计算方式1,指标1MA价格方式1,指标1信号位置);
   double MA2=iMA(Symbol(),指标1时间轴,指标1MA周期2,指标1MA平移2,指标1MA计算方式2,指标1MA价格方式2,指标1信号位置);

   if(MA1>MA2)
      指标1做多=1;

   if(MA1<MA2)
      指标1做空=1;
  }
*/


input string _____指标220200719_TB_babyzihao8888_缠论指标_____="------20200719 TB babyzihao8888-缠论指标------";
input bool 指标2开关=true;
input XHWZ 指标2信号位置=收盘出现信号判断;
input ENUM_TIMEFRAMES 指标2时间轴=PERIOD_CURRENT;
string 指标2名称="20200719 TB babyzihao8888-缠论指标";
int 指标2做多,指标2做空;
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

   double XH1=iCustom(Symbol(),指标2时间轴,指标2名称,2,指标2信号位置);
   double XH2=iCustom(Symbol(),指标2时间轴,指标2名称,3,指标2信号位置);

   if(XH1!=0)
      指标2做多=1;

   if(XH2!=0)
      指标2做空=1;
  }


input string comm3X="----------------------------";
input bool 对冲平单总开关=true;
input int 持有大于等于N单可以使用对冲=10;
input int 持有小于等于N单可以使用对冲=20;
input double 对冲后盈利大于X美金=100;
input double 每次对冲掉手数=1;


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
//input string comm6X="----------------------------";
//input string comm7X="----------------------------";
//input string comm8X="----------------------------";
//input string comm9X="----------------------------";
//+------------------------------------------------------------------+
//||
//+------------------------------------------------------------------+
enum 做单方向
  {
   停止=0,做多=1,做空=2,全做=3
  };
input 做单方向 做单方向选择=0;
enum 市场状态
  {
   混沌=0,单边=1,震荡=2,行情启动=3,行情中继=4,行情尾声=5
  };
input 市场状态 市场状态选择=0;
input color 多单颜色标记=Blue;
input color 空单颜色标记=Red;
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
//+------------------------------------------------------------------+
//| expert initialization function|
//+------------------------------------------------------------------+
int OnInit()
  {
//----
/*
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
*/
   for(int i=0;i<100;i++)
   {
      顺势单量X[i]=顺势单量;
      逆势单量X[i]=逆势单量;
   }
/*
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
*/
//Alert("急速模式程序,修改参数后需重置EA开关");
   if(MarketInfo(Symbol(),MODE_LOTSTEP)<10)
      单量小数保留=0;
   if(MarketInfo(Symbol(),MODE_LOTSTEP)<1)
      单量小数保留=1;
   if(MarketInfo(Symbol(),MODE_LOTSTEP)<0.1)
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
   if(IsTesting()==false)
      ObjectsDeleteAll(0,"标签");
//----
  }
//+------------------------------------------------------------------+
//| expert start function|
//+------------------------------------------------------------------+
void OnTick()
  {
   if(IsTesting()==false)
      if(TimeCurrent()-MarketInfo(Symbol(),MODE_TIME)>=30)
         return;

   if(IsConnected()==false)
      return;

   RefreshRates();
   if(显示全平按钮==true)
     {
      按钮("标签全平按钮","全平按钮","全平按钮",80,30,60,20,CORNER_RIGHT_LOWER,clrRed,clrBlack);

      if(ObjectGetInteger(0,"标签全平按钮",OBJPROP_STATE)==1)
        {
         deleteorder(-100,magic,"");
         deleteorder(-100,magic+1,"");
         deleteorder(-100,magic+2,"");
         ObjectDelete("启动时间");
         return;
        }
     }

   if(objectFind("启动时间")==-1)
      画直线("启动时间",0,0,TimeCurrent(),clrNONE,0,0);
   启动时间=objectGet("启动时间",OBJPROP_TIME1);

   //指标1();
   指标2();

   if(分项单据统计(OP_SELL,magic+1,"")==0)
      if(做单方向选择==1 || 做单方向选择==3)
         //if(指标1做多==1)
            if(指标2做多==1)
               if(分项单据统计(OP_BUY,magic,"")==0)
                 {
                  int t=建立单据(Symbol(),OP_BUY,首单单量,0,0,止损,止盈,备注,magic,多单颜色标记);
                 }

   if(分项单据统计(OP_BUY,magic+1,"")==0)
      if(做单方向选择==2 || 做单方向选择==3)
         //if(指标1做空==1)
            if(指标2做空==1)
               if(分项单据统计(OP_SELL,magic,"")==0)
                 {
                  t=建立单据(Symbol(),OP_SELL,首单单量,0,0,止损,止盈,备注,magic,空单颜色标记);
                 }

   double 点差距离=MarketInfo(Symbol(),MODE_SPREAD);

   double 多初始位置=0;
   if(OrderSelect(findlassorder(OP_BUY,OP_BUY,magic,"前","现在","",0),SELECT_BY_TICKET))
      多初始位置=OrderOpenPrice();
   double 空初始位置=0;
   if(OrderSelect(findlassorder(OP_SELL,OP_SELL,magic,"前","现在","",0),SELECT_BY_TICKET))
      空初始位置=OrderOpenPrice();

   int 多顺势单数=分项单据统计HL(OP_BUY,magic,"","H",多初始位置);
   int 多逆势单数=分项单据统计HL(OP_BUY,magic,"","L",多初始位置);
   int 空顺势单数=分项单据统计HL(OP_SELL,magic,"","L",空初始位置);
   int 空逆势单数=分项单据统计HL(OP_SELL,magic,"","H",空初始位置);

   if(分项单据统计(OP_SELL,magic+1,"")==0)
      if(多顺势单数<顺势最大加仓次数)
         if(OrderSelect(最高最低单据订单号(OP_BUY,OP_BUY,magic,"H","",0,0),SELECT_BY_TICKET))
            if(OrderClosePrice()-OrderOpenPrice()+点差距离*Point>=顺势加仓距离*系数(Symbol())*Point)
              {
               t=建立单据(Symbol(),OP_BUY,顺势单量X[多顺势单数+1],0,0,止损,止盈,"顺"+备注,magic,多单颜色标记);
              }

   if(分项单据统计(OP_BUY,magic+1,"")==0)
      if(空顺势单数<顺势最大加仓次数)
         if(OrderSelect(最高最低单据订单号(OP_SELL,OP_SELL,magic,"L","",0,0),SELECT_BY_TICKET))
            if(-OrderClosePrice()+OrderOpenPrice()+点差距离*Point>=顺势加仓距离*系数(Symbol())*Point)
              {
               t=建立单据(Symbol(),OP_SELL,顺势单量X[空顺势单数+1],0,0,止损,止盈,"顺"+备注,magic,空单颜色标记);
              }

   if(分项单据统计(OP_SELL,magic+1,"")==0)
      if(OrderSelect(最高最低单据订单号(OP_BUY,OP_BUY,magic,"L","",0,0),SELECT_BY_TICKET))
         if(-OrderClosePrice()+OrderOpenPrice()-点差距离*Point>=逆势加仓距离*系数(Symbol())*Point)
           {
            if(多逆势单数<逆势最大加仓次数)
               t=建立单据(Symbol(),OP_BUY,逆势单量X[多逆势单数+1],0,0,止损,止盈,"逆"+备注,magic,多单颜色标记);
            else
               if(锁仓开关1)
                  t=建立单据(Symbol(),OP_SELL,总交易量(OP_BUY,magic,""),0,0,锁仓单止损距离,0,"锁"+备注,magic+1,clrWhite);
           }

   if(分项单据统计(OP_BUY,magic+1,"")==0)
      if(OrderSelect(最高最低单据订单号(OP_SELL,OP_SELL,magic,"H","",0,0),SELECT_BY_TICKET))
         if(OrderClosePrice()-OrderOpenPrice()-点差距离*Point>=逆势加仓距离*系数(Symbol())*Point)
           {
            if(空逆势单数<逆势最大加仓次数)
               t=建立单据(Symbol(),OP_SELL,逆势单量X[空逆势单数+1],0,0,止损,止盈,"逆"+备注,magic,空单颜色标记);
            else
               if(锁仓开关1)
                  t=建立单据(Symbol(),OP_BUY,总交易量(OP_SELL,magic,""),0,0,锁仓单止损距离,0,"锁"+备注,magic+1,clrWhite);
           }

   bool 移动止损中断=false;
   if(对冲总开关2)
     {
      double 利润=分类单据利润(OP_BUY,magic,"");
      if(分项单据统计(OP_BUY,magic,"")>=对冲启动大于等于&&分项单据统计(OP_BUY,magic,"")<=对冲启动小于等于)
      {
         移动止损中断=true;//shenadd
         if(OrderSelect(findlassorder(OP_BUY,OP_BUY,magic,"后","现在","",0),SELECT_BY_TICKET))
            if(objectFind("已使用"+OrderTicket())==-1)
               if((StringFind(OrderComment(),"顺",0)!=-1&&利润<=0)||StringFind(OrderComment(),"逆",0)!=-1)
                 {
                  string NAME="已使用"+OrderTicket();
                  if(NormalizeDouble(总交易量(OP_BUY,magic,"")-总交易量(OP_SELL,magic+2,""),单量小数保留)>=MarketInfo(Symbol(),MODE_MINLOT))
                     t=建立单据(Symbol(),OP_SELL,总交易量(OP_BUY,magic,"")-总交易量(OP_SELL,magic+2,""),0,0,0,0,"锁"+备注,magic+2,clrWhite);
                  if(OrderSelect(t,SELECT_BY_TICKET))
                     laber0(NAME,"",clrYellow,0,0,8,ANCHOR_LEFT_UPPER,0);
                 }
        }

      利润=分类单据利润(OP_SELL,magic,"");
      if(分项单据统计(OP_SELL,magic,"")>=对冲启动大于等于&&分项单据统计(OP_SELL,magic,"")<=对冲启动小于等于)
      {
         移动止损中断=true;//shenadd
         if(OrderSelect(findlassorder(OP_SELL,OP_SELL,magic,"后","现在","",0),SELECT_BY_TICKET))
            if(objectFind("已使用"+OrderTicket())==-1)
               if((StringFind(OrderComment(),"顺",0)!=-1&&利润<=0)||StringFind(OrderComment(),"逆",0)!=-1)
                 {
                  NAME="已使用"+OrderTicket();
                  if(NormalizeDouble(总交易量(OP_SELL,magic,"")-总交易量(OP_BUY,magic+2,""),单量小数保留)>=MarketInfo(Symbol(),MODE_MINLOT))
                     t=建立单据(Symbol(),OP_BUY,总交易量(OP_SELL,magic,"")-总交易量(OP_BUY,magic+2,""),0,0,0,0,"锁"+备注,magic+2,clrWhite);
                  if(OrderSelect(t,SELECT_BY_TICKET))
                     laber0(NAME,"",clrYellow,0,0,8,ANCHOR_LEFT_UPPER,0);
                 }
        }
     }

   if(对冲平单总开关2)
     {
      对冲2(OP_SELL,OP_BUY,OP_SELL,"H",magic+2,magic,magic+2);
      对冲2(OP_BUY,OP_SELL,OP_SELL,"L",magic,magic+2,magic+2);

      对冲2(OP_BUY,OP_SELL,OP_BUY,"L",magic+2,magic,magic+2);
      对冲2(OP_SELL,OP_BUY,OP_BUY,"H",magic,magic+2,magic+2);
     }

   if(对冲平单总开关)
     {
      if(分项单据统计(OP_SELL,magic+1,"")==0)
         if(分项单据统计(OP_BUY,magic,"")>=持有大于等于N单可以使用对冲)
            if(分项单据统计(OP_BUY,magic,"")<=持有小于等于N单可以使用对冲)
               if(OrderSelect(最高最低单据订单号(OP_BUY,OP_BUY,magic,"L","",0,0),SELECT_BY_TICKET))
                 {
                  利润=OrderProfit()+OrderSwap()+OrderCommission();
                  double PRICE=0;
                  double 单量累计=NormalizeDouble(每次对冲掉手数,2);

                  while(OrderSelect(最高最低单据订单号限制位置(OP_BUY,OP_BUY,magic,"H","",0,0,PRICE),SELECT_BY_TICKET))
                    {
                     PRICE=OrderOpenPrice();
                     if(NormalizeDouble(OrderLots(),2)<=单量累计)
                       {
                        利润+=OrderProfit()+OrderSwap()+OrderCommission();
                        单量累计-=NormalizeDouble(OrderLots(),2);
                        if(单量累计==0)
                           break;
                       }
                     else
                       {
                        利润+=(OrderProfit()+OrderSwap()+OrderCommission())/OrderLots()*单量累计;
                        break;
                       }
                    }

                  if(利润>=对冲后盈利大于X美金)
                    {
                     单量累计=NormalizeDouble(每次对冲掉手数,2);

                     if(OrderSelect(最高最低单据订单号(OP_BUY,OP_BUY,magic,"L","",0,0),SELECT_BY_TICKET))
                        if(OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),滑点))
                           while(OrderSelect(最高最低单据订单号(OP_BUY,OP_BUY,magic,"H","",0,0),SELECT_BY_TICKET))
                             {
                              if(NormalizeDouble(OrderLots(),2)<=单量累计)
                                {
                                 if(OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),滑点))
                                    单量累计-=NormalizeDouble(OrderLots(),2);
                                 if(单量累计==0)
                                    break;
                                }
                              else
                                {
                                 if(OrderClose(OrderTicket(),单量累计,OrderClosePrice(),滑点))
                                    break;
                                }
                             }
                    }
                 }

      if(分项单据统计(OP_BUY,magic+1,"")==0)
         if(分项单据统计(OP_SELL,magic,"")>=持有大于等于N单可以使用对冲)
            if(分项单据统计(OP_SELL,magic,"")<=持有小于等于N单可以使用对冲)
               if(OrderSelect(最高最低单据订单号(OP_SELL,OP_SELL,magic,"H","",0,0),SELECT_BY_TICKET))
                 {
                  利润=OrderProfit()+OrderSwap()+OrderCommission();
                  PRICE=0;
                  单量累计=NormalizeDouble(每次对冲掉手数,2);

                  while(OrderSelect(最高最低单据订单号限制位置(OP_SELL,OP_SELL,magic,"L","",0,0,PRICE),SELECT_BY_TICKET))
                    {
                     PRICE=OrderOpenPrice();
                     if(NormalizeDouble(OrderLots(),2)<=单量累计)
                       {
                        利润+=OrderProfit()+OrderSwap()+OrderCommission();
                        单量累计-=NormalizeDouble(OrderLots(),2);
                        if(单量累计==0)
                           break;
                       }
                     else
                       {
                        利润+=(OrderProfit()+OrderSwap()+OrderCommission())/OrderLots()*单量累计;
                        break;
                       }
                    }

                  if(利润>=对冲后盈利大于X美金)
                    {
                     单量累计=NormalizeDouble(每次对冲掉手数,2);

                     if(OrderSelect(最高最低单据订单号(OP_SELL,OP_SELL,magic,"H","",0,0),SELECT_BY_TICKET))
                        if(OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),滑点))
                           while(OrderSelect(最高最低单据订单号(OP_SELL,OP_SELL,magic,"L","",0,0),SELECT_BY_TICKET))
                             {
                              if(NormalizeDouble(OrderLots(),2)<=单量累计)
                                {
                                 if(OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),滑点))
                                    单量累计-=NormalizeDouble(OrderLots(),2);
                                 if(单量累计==0)
                                    break;
                                }
                              else
                                {
                                 if(OrderClose(OrderTicket(),单量累计,OrderClosePrice(),滑点))
                                    break;
                                }
                             }
                    }
                 }
     }
   //if(移动止损中断==false)
     if( (移动止损开关==true) && (分项单据统计(OP_BUY,magic+1,"")==0) &&(分项单据统计(OP_SELL,magic+1,"")==0) && (分项单据统计(OP_BUY,magic+2,"")==0) &&(分项单据统计(OP_SELL,magic+2,"")==0)) //shenadd
     {
      if(分项单据统计(OP_BUY,magic+1,"")==0)
         移动止损距离比例(OP_SELL,移动止损激活点数,移动止损停止点数,移动止损回调方式,移动止损回调离场距离,移动止损回调离场比例,magic,"");
      if(分项单据统计(OP_SELL,magic+1,"")==0)
         移动止损距离比例(OP_BUY,移动止损激活点数,移动止损停止点数,移动止损回调方式,移动止损回调离场距离,移动止损回调离场比例,magic,"");
     }


   if(是否显示信息框 && IsOptimization()==false)
     {
      string 内容[100];
      int pp=0;
      内容[pp]="";
      pp++;
      内容[pp]="平台商:" +AccountCompany()+" 杠杆:"+DoubleToStr(AccountLeverage(),0);
      pp++;
      内容[pp]="EA独立代码 magic :"+magic;
      pp++;
      内容[pp]="启动时间:"+DoubleToStr((TimeCurrent()-启动时间)/60/60,1)+"小时";
      pp++;
      内容[pp]="------------------------------------";
      pp++;
      内容[pp]="多单个数:"+(分项单据统计(OP_BUY,magic,"")+分项单据统计(OP_BUY,magic+1,"")+分项单据统计(OP_BUY,magic+2,""));
      pp++;
      内容[pp]="多单获利:"+DoubleToStr(分类单据利润(OP_BUY,magic,"")+分类单据利润(OP_BUY,magic+1,"")+分类单据利润(OP_BUY,magic+2,""),2);
      pp++;
      内容[pp]="多单手数:"+DoubleToStr(总交易量(OP_BUY,magic,"")+总交易量(OP_BUY,magic+1,"")+总交易量(OP_BUY,magic+2,""),2);
      pp++;
      内容[pp]="------------------------------------";
      pp++;
      内容[pp]="空单个数:"+(分项单据统计(OP_SELL,magic,"")+分项单据统计(OP_SELL,magic+1,"")+分项单据统计(OP_SELL,magic+2,""));
      pp++;
      内容[pp]="空单获利:"+DoubleToStr(分类单据利润(OP_SELL,magic,"")+分类单据利润(OP_SELL,magic+1,"")+分类单据利润(OP_SELL,magic+2,""),2);
      pp++;
      内容[pp]="空单手数:"+DoubleToStr(总交易量(OP_SELL,magic,"")+总交易量(OP_SELL,magic+1,"")+总交易量(OP_SELL,magic+2,""),2);
      pp++;
      内容[pp]="------------------------------------";
      pp++;
      内容[pp]="浮动盈亏:"+DoubleToStr(分类单据利润(-100,magic,"")+分类单据利润(-100,magic+1,"")+分类单据利润(-100,magic+2,""),2);
      pp++;
      内容[pp]="------------------------------------";
      pp++;

      for(int ixx=0; ixx<pp; ixx++)
         固定位置标签("标签"+ixx,内容[ixx],X,Y+Y间隔*ixx,标签颜色,标签字体大小,固定角);
     }
   return;
  }
//+------------------------------------------------------------------+
void 对冲2(int type1,int type2,int type3,string 方位1,int magic1,int magic2,int magic3)
  {
   if(分项单据统计(type3,magic3,"")!=0)
      if(OrderSelect(最高最低单据订单号(type1,type1,magic1,方位1,"",0,0),SELECT_BY_TICKET))
        {
         double 利润=OrderProfit()+OrderSwap()+OrderCommission();
         double PRICE=0;
         double 单量累计=NormalizeDouble(每次对冲掉手数2,2);

         while(OrderSelect(最高最低单据订单号限制位置(type2,type2,magic2,方位1,"",0,0,PRICE),SELECT_BY_TICKET))
           {
            PRICE=OrderOpenPrice();
            if(NormalizeDouble(OrderLots(),2)<=单量累计)
              {
               利润+=OrderProfit()+OrderSwap()+OrderCommission();
               单量累计-=NormalizeDouble(OrderLots(),2);
               if(单量累计==0)
                  break;
              }
            else
              {
               利润+=(OrderProfit()+OrderSwap()+OrderCommission())/OrderLots()*单量累计;
               break;
              }
           }

         if(利润>=对冲后盈利大于X美金2)
           {
            单量累计=NormalizeDouble(每次对冲掉手数2,2);

            if(OrderSelect(最高最低单据订单号(type1,type1,magic1,方位1,"",0,0),SELECT_BY_TICKET))
               if(OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),滑点))
                  while(OrderSelect(最高最低单据订单号(type2,type2,magic2,方位1,"",0,0),SELECT_BY_TICKET))
                    {
                     if(NormalizeDouble(OrderLots(),2)<=单量累计)
                       {
                        if(OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),滑点))
                           单量累计-=NormalizeDouble(OrderLots(),2);
                        if(单量累计==0)
                           break;
                       }
                     else
                       {
                        if(OrderClose(OrderTicket(),单量累计,OrderClosePrice(),滑点))
                           break;
                       }
                    }
           }
        }
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int 最高最低单据订单号限制位置(int a,int b,int magicX,string 高低,string comm,int pc1,int pc2,double PRICE)
  {
   double 价格=0;
   int 订单号=0;
   for(int i=0; i<OrdersTotal(); i++)
      if(OrderSelect(i,SELECT_BY_POS))
         if(OrderTicket()!=pc1 && OrderTicket()!=pc2)
            if(Symbol()==OrderSymbol())
               if(OrderMagicNumber()==magicX || magicX==-1)
                  if(StringFind(OrderComment(),comm,0)!=-1 || comm=="")
                     if(OrderType()==a || OrderType()==b || a==-100 || b==-100)
                        if(PRICE==0
                           ||(高低=="L"&&OrderOpenPrice()>PRICE)
                           ||(高低=="H"&&OrderOpenPrice()<PRICE))
                           if(((价格==0 || 价格>OrderOpenPrice()) && 高低=="L")
                              || ((价格==0 || 价格<OrderOpenPrice()) && 高低=="H"))
                             {
                              价格=OrderOpenPrice();
                              订单号=OrderTicket();
                             }
   return(订单号);
  }

//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---
   OnTick();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void 获利后一次性止损保护(int type,double 保护距离,double 启动距离,int magicX,string comm)
  {
   for(int i=0; i<OrdersTotal(); i++)
     {
      if(OrderSelect(i,SELECT_BY_POS))
         if(Symbol()==OrderSymbol())
            if(OrderMagicNumber()==magicX || magicX==-1)
               if(OrderType()==type || type==-100)
                  if(StringFind(OrderComment(),comm,0)!=-1 || comm=="")
                    {
                     double a=OrderClosePrice();

                     if(OrderType()==OP_BUY)
                        if(a-OrderOpenPrice()>启动距离*MarketInfo(OrderSymbol(),MODE_POINT)*系数(OrderSymbol()))
                           if(OrderStopLoss()+MarketInfo(OrderSymbol(),MODE_POINT)<OrderOpenPrice()+保护距离*MarketInfo(OrderSymbol(),MODE_POINT)*系数(OrderSymbol()) || OrderStopLoss()==0)
                             {
                              if(OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(OrderOpenPrice()+保护距离*MarketInfo(OrderSymbol(),MODE_POINT)*系数(OrderSymbol()),MarketInfo(OrderSymbol(),MODE_DIGITS)),OrderTakeProfit(),0)==false)
                                 报错组件("");
                             }

                     if(OrderType()==OP_SELL)
                        if(OrderOpenPrice()-a>启动距离*MarketInfo(OrderSymbol(),MODE_POINT)*系数(OrderSymbol()))
                           if(OrderStopLoss()-MarketInfo(OrderSymbol(),MODE_POINT)>OrderOpenPrice()-保护距离 *MarketInfo(OrderSymbol(),MODE_POINT)*系数(OrderSymbol()) || OrderStopLoss()==0)
                             {
                              if(OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(OrderOpenPrice()-保护距离*MarketInfo(OrderSymbol(),MODE_POINT)*系数(OrderSymbol()),MarketInfo(OrderSymbol(),MODE_DIGITS)),OrderTakeProfit(),0)==false)
                                 报错组件("");
                             }
                    }
     }
  }
//+------------------------------------------------------------------+
//| |
//+------------------------------------------------------------------+
void 移动止损距离比例(int type,double 启动距离1,double 启动距离2,int 回调模式,double 保持距离,double 保持比例,int magicX,string comm)
  {
   for(int i=0; i<OrdersTotal(); i++)
      if(OrderSelect(i,SELECT_BY_POS))
         if(Symbol()==OrderSymbol())
            if(OrderType()==type || type==-100)
               if(OrderMagicNumber()==magicX || magicX==-1)
                  if(StringFind(OrderComment(),comm,0)!=-1 || comm=="")
                    {
                     RefreshRates();
                     double 保持距离X;
                     if(回调模式==1)
                        保持距离X=保持距离;

                     if(回调模式==2)
                        保持距离X=MathAbs(OrderClosePrice()-OrderOpenPrice())*保持比例/100/MarketInfo(OrderSymbol(),MODE_POINT)/系数(OrderSymbol());

                     if(保持距离X<MarketInfo(OrderSymbol(),MODE_STOPLEVEL)/系数(OrderSymbol()))
                        return;


                     if(OrderType()==OP_BUY)
                        if(OrderClosePrice()-OrderOpenPrice()>=启动距离1*MarketInfo(OrderSymbol(),MODE_POINT)*系数(OrderSymbol()))
                           if(OrderClosePrice()-OrderOpenPrice()<=启动距离2*MarketInfo(OrderSymbol(),MODE_POINT)*系数(OrderSymbol()))
                              if(NormalizeDouble(OrderClosePrice()-(保持距离X*系数(OrderSymbol())+1)*MarketInfo(OrderSymbol(),MODE_POINT),MarketInfo(OrderSymbol(),MODE_DIGITS))>=OrderStopLoss() || OrderStopLoss()==0)
                                {
                                 if(OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(OrderClosePrice()-保持距离X*MarketInfo(OrderSymbol(),MODE_POINT)*系数(OrderSymbol()),MarketInfo(OrderSymbol(),MODE_DIGITS)),OrderTakeProfit(),0)==false)
                                    报错组件("");
                                }

                     if(OrderType()==OP_SELL)
                        if(OrderOpenPrice()-OrderClosePrice()>=启动距离1*MarketInfo(OrderSymbol(),MODE_POINT)*系数(OrderSymbol()))
                           if(OrderOpenPrice()-OrderClosePrice()<=启动距离2*MarketInfo(OrderSymbol(),MODE_POINT)*系数(OrderSymbol()))
                              if(NormalizeDouble(OrderClosePrice()+(保持距离X*系数(OrderSymbol())+1)*MarketInfo(OrderSymbol(),MODE_POINT),MarketInfo(OrderSymbol(),MODE_DIGITS))<=OrderStopLoss() || OrderStopLoss()==0)
                                {
                                 if(OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(OrderClosePrice()+保持距离X*MarketInfo(OrderSymbol(),MODE_POINT)*系数(OrderSymbol()),MarketInfo(OrderSymbol(),MODE_DIGITS)),OrderTakeProfit(),0)==false)
                                    报错组件("");
                                }
                    }
  }
//+------------------------------------------------------------------+
//||
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
void 按钮(string name,string txt1,string txt2,int XX,int YX,int XL,int YL,int WZ,color A,color B)
  {
   if(ObjectFind(0,name)==-1)
     {
      ObjectCreate(0,name,OBJ_BUTTON,0,0,0);
      ObjectSetInteger(0,name,OBJPROP_XDISTANCE,XX);
      ObjectSetInteger(0,name,OBJPROP_YDISTANCE,YX);
      ObjectSetInteger(0,name,OBJPROP_XSIZE,XL);
      ObjectSetInteger(0,name,OBJPROP_YSIZE,YL);
      ObjectSetString(0,name,OBJPROP_FONT,"宋体");
      ObjectSetInteger(0,name,OBJPROP_FONTSIZE,7);
      ObjectSetInteger(0,name,OBJPROP_CORNER,WZ);
     }

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
//+------------------------------------------------------------------+
//||
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int 最高最低单据订单号(int a,int b,int magicX,string 高低,string comm,int pc1,int pc2)
  {
   double 价格=0;
   int 订单号=0;
   for(int i=0; i<OrdersTotal(); i++)
      if(OrderSelect(i,SELECT_BY_POS))
         if(OrderTicket()!=pc1 && OrderTicket()!=pc2)
            if(Symbol()==OrderSymbol())
               if(OrderMagicNumber()==magicX || magicX==-1)
                  if(StringFind(OrderComment(),comm,0)!=-1 || comm=="")
                     if(OrderType()==a || OrderType()==b || a==-100 || b==-100)
                        if(((价格==0 || 价格>OrderOpenPrice()) && 高低=="L")
                           || ((价格==0 || 价格<OrderOpenPrice()) && 高低=="H"))
                          {
                           价格=OrderOpenPrice();
                           订单号=OrderTicket();
                          }
   return(订单号);
  }
//+----------------------------------------------------- -------------+
//| |
//+------------------------------------------------------------------+
int findlassorder(int type1,int type2,int magicX,string fx,string 现在与历史,string comm,int 排除)
  {
   int i;
   if(现在与历史=="现在")
      if(fx=="后")
         for(i=OrdersTotal()-1; i>=0; i--)
            if(OrderSelect(i,SELECT_BY_POS))
               if(OrderTicket()!=排除 || 排除==0)
                  if(Symbol()==OrderSymbol())
                     if(OrderMagicNumber()==magicX || magicX==-1)
                        if(
                           OrderType()==type1
                           || OrderType()==type2
                           || type1==-100
                           || type2==-100
                           ||(type1==-200&&OrderType()<2)
                           ||(type2==-200&&OrderType()<2)
                           ||(type1==-300&&OrderType()>=2)
                           ||(type2==-300&&OrderType()>=2)
                        )
                           if(StringFind(OrderComment(),comm,0)!=-1 || comm=="")
                              return(OrderTicket());

   if(现在与历史=="现在")
      if(fx=="前")
         for(i=0; i<OrdersTotal(); i++)
            if(OrderSelect(i,SELECT_BY_POS))
               if(OrderTicket()!=排除 || 排除==0)
                  if(Symbol()==OrderSymbol())
                     if(OrderMagicNumber()==magicX || magicX==-1)
                        if(
                           OrderType()==type1
                           || OrderType()==type2
                           || type1==-100
                           || type2==-100
                           ||(type1==-200&&OrderType()<2)
                           ||(type2==-200&&OrderType()<2)
                           ||(type1==-300&&OrderType()>=2)
                           ||(type2==-300&&OrderType()>=2)
                        )
                           if(StringFind(OrderComment(),comm,0)!=-1 || comm=="")
                              return(OrderTicket());

   if(现在与历史=="历史")
      if(fx=="后")
         for(i=OrdersHistoryTotal()-1; i>=0; i--)
            if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY))
               if(OrderTicket()!=排除 || 排除==0)
                  if(Symbol()==OrderSymbol())
                     if(OrderMagicNumber()==magicX || magicX==-1)
                        if(OrderType()<=5 && OrderType()>=0)
                           if(
                              OrderType()==type1
                              || OrderType()==type2
                              || type1==-100
                              || type2==-100
                              ||(type1==-200&&OrderType()<2)
                              ||(type2==-200&&OrderType()<2)
                              ||(type1==-300&&OrderType()>=2)
                              ||(type2==-300&&OrderType()>=2)
                           )
                              if(StringFind(OrderComment(),comm,0)!=-1 || comm=="")
                                 if(OrderCloseTime()!=0)
                                    return(OrderTicket());

   if(现在与历史=="历史")
      if(fx=="前")
         for(i=0; i<OrdersHistoryTotal(); i++)
            if(OrderSelect(i,SELECT_BY_POS,MODE_HISTORY))
               if(OrderTicket()!=排除 || 排除==0)
                  if(Symbol()==OrderSymbol())
                     if(OrderMagicNumber()==magicX || magicX==-1)
                        if(OrderType()<=5 && OrderType()>=0)
                           if(
                              OrderType()==type1
                              || OrderType()==type2
                              || type1==-100
                              || type2==-100
                              ||(type1==-200&&OrderType()<2)
                              ||(type2==-200&&OrderType()<2)
                              ||(type1==-300&&OrderType()>=2)
                              ||(type2==-300&&OrderType()>=2)
                           )
                              if(StringFind(OrderComment(),comm,0)!=-1 || comm=="")
                                 if(OrderCloseTime()!=0)
                                    return(OrderTicket());

   return(-1);
  }
//+------------------------------------------------------------------+
//| |
//+------------------------------------------------------------------+
void deleteorder(int type,int magicX,string comm)
  {
//datetime time=TimeCurrent();
   for(int i=OrdersTotal()-1; i>=0; i--)
     {
      if(OrderSelect(i,SELECT_BY_POS))
         if(Symbol()==OrderSymbol())
            if(OrderMagicNumber()==magicX || magicX==-1)
               if(
                  (OrderType()==type || type==-100)
                  || (OrderType()<2 && type==-200)
                  || (OrderType()>=2 && type==-300)
               )
                  if(StringFind(OrderComment(),comm,0)!=-1 || comm=="")
                     //if(OrderOpenTime()<=time)
                    {
                     if(OrderType()>=2)
                       {
                        if(OrderDelete(OrderTicket())==false)
                           报错组件("");
                        i=OrdersTotal();
                       }
                     else
                       {
                        if(OrderClose(OrderTicket(),OrderLots(),OrderClosePrice(),滑点*系数(OrderSymbol()))==false)
                           报错组件("");
                        i=OrdersTotal();
                       }
                    }
     }
  }
//+------------------------------------------------------------------+
//| |
//+------------------------------------------------------------------+
int 分项单据统计HL(int type,int magicX,string comm,string HL,double price)
  {
   int 数量=0;
   for(int i=0; i<OrdersTotal(); i++)
      if(OrderSelect(i,SELECT_BY_POS))
         if(Symbol()==OrderSymbol())
            if(OrderMagicNumber()==magicX || magicX==-1)
               if(StringFind(OrderComment(),comm,0)!=-1 || comm=="")
                  if(
                     (OrderType()==type || type==-100)
                     || (OrderType()<2 && type==-200)
                     || (OrderType()>=2 && type==-300)
                  )
                     if(
                        (HL=="H"&&OrderOpenPrice()>price)
                        ||(HL=="L"&&OrderOpenPrice()<price)
                     )
                        数量++;
   return(数量);
  }


//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int 分项单据统计(int type,int magicX,string comm)
  {
   int 数量=0;
   for(int i=0; i<OrdersTotal(); i++)
      if(OrderSelect(i,SELECT_BY_POS))
         if(Symbol()==OrderSymbol())
            if(OrderMagicNumber()==magicX || magicX==-1)
               if(StringFind(OrderComment(),comm,0)!=-1 || comm=="")
                  if(
                     (OrderType()==type || type==-100)
                     || (OrderType()<2 && type==-200)
                     || (OrderType()>=2 && type==-300)
                  )
                     数量++;
   return(数量);
  }
//+------------------------------------------------------------------+
//| |
//+------------------------------------------------------------------+
double 分类单据利润(int type,int magicX,string comm)
  {
   double 利润=0;
   for(int i=0; i<OrdersTotal(); i++)
      if(OrderSelect(i,SELECT_BY_POS))
         if(Symbol()==OrderSymbol())
            if(OrderMagicNumber()==magicX || magicX==-1)
               if(StringFind(OrderComment(),comm,0)!=-1 || comm=="")
                  if(
                     (OrderType()==type || type==-100)
                     || (OrderType()<2 && type==-200)
                     || (OrderType()>=2 && type==-300)
                  )
                     利润+=OrderProfit()+OrderSwap()+OrderCommission();
   return(利润);
  }
//+------------------------------------------------------------------+
//| |
//+------------------------------------------------------------------+
double 总交易量(int type,int magicX,string comm)
  {
   double js=0;
   for(int i=0; i<OrdersTotal(); i++)
      if(OrderSelect(i,SELECT_BY_POS))
         if(Symbol()==OrderSymbol())
            if(OrderMagicNumber()==magicX || magicX==-1)
               if(StringFind(OrderComment(),comm,0)!=-1 || comm=="")
                  if(OrderType()==type || (type==-100 && OrderType()<2))
                     js+=OrderLots();

   return(NormalizeDouble(js,2));
  }

//+------------------------------------------------------------------+
//| |
//+------------------------------------------------------------------+
void 固定位置标签(string 名称,string 内容,int XX,int YX,color C,int 字体大小,int 固定角内)
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
int 建立单据(string 货币对,int 类型,double 单量内,double 价位,double 间隔,double 止损内,double 止盈内,string 备注内,int magicX,color 颜色标记)
  {

   备注内=备注内+"-"+Period()+"-"+magicX;
   int 单量小数保留内=0;
   if(MarketInfo(货币对,MODE_LOTSTEP)<10)
      单量小数保留内=0;
   if(MarketInfo(货币对,MODE_LOTSTEP)<1)
      单量小数保留内=1;
   if(MarketInfo(货币对,MODE_LOTSTEP)<0.1)
      单量小数保留内=2;

   单量内=NormalizeDouble(单量内,单量小数保留内);

   if(单量内<MarketInfo(货币对,MODE_MINLOT))
     {
      laber("低于最低单量",Yellow,0);
      return(-1);
     }

   if(单量内>MarketInfo(货币对,MODE_MAXLOT))
      单量内=MarketInfo(货币对,MODE_MAXLOT);

   int t,ix,ix2;
   double POINT=MarketInfo(货币对,MODE_POINT)*系数(货币对);
   int DIGITS=MarketInfo(货币对,MODE_DIGITS);
   int 滑点内=滑点*系数(货币对);

   if(类型==OP_BUY || 类型==OP_SELL)
      if(AccountFreeMargin()<单量内*MarketInfo(货币对,MODE_MARGINREQUIRED))
        {
         Print("保证金不足");
         return(-1);
        }

   if(类型==OP_BUY)
     {
      t=-1;
      for(ix2=0; ix2<1; ix2++)
         if(t==-1)
           {
            RefreshRates();
            t=OrderSend(货币对,OP_BUY,单量内,MarketInfo(货币对,MODE_ASK),滑点内,0,0,备注内,magicX,0,颜色标记);
            报错组件("");
            if(OrderSelect(t,SELECT_BY_TICKET))
              {
               if(止损内!=0 && 止盈内!=0)
                  for(ix=0; ix<3; ix++)
                     if(OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(OrderOpenPrice()-止损内 *POINT,DIGITS),NormalizeDouble(OrderOpenPrice()+止盈内 *POINT,DIGITS),0))
                        break;

               if(止损内==0 && 止盈内!=0)
                  for(ix=0; ix<3; ix++)
                     if(OrderModify(OrderTicket(),OrderOpenPrice(),0,NormalizeDouble(OrderOpenPrice()+止盈内 *POINT,DIGITS),0))
                        break;

               if(止损内!=0 && 止盈内==0)
                  for(ix=0; ix<3; ix++)
                     if(OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(OrderOpenPrice()-止损内 *POINT,DIGITS),0,0))
                        break;

               报错组件("");
              }
           }
     }

   if(类型==OP_SELL)
     {
      t=-1;
      for(ix2=0; ix2<1; ix2++)
         if(t==-1)
           {
            RefreshRates();
            t=OrderSend(货币对,OP_SELL,单量内,MarketInfo(货币对,MODE_BID),滑点内,0,0,备注内,magicX,0,颜色标记);
            报错组件("");
            if(OrderSelect(t,SELECT_BY_TICKET))
              {
               if(止损内!=0 && 止盈内!=0)
                  for(ix=0; ix<3; ix++)
                     if(OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(OrderOpenPrice()+止损内 *POINT,DIGITS),NormalizeDouble(OrderOpenPrice()-止盈内 *POINT,DIGITS),0))
                        break;

               if(止损内==0 && 止盈内!=0)
                  for(ix=0; ix<3; ix++)
                     if(OrderModify(OrderTicket(),OrderOpenPrice(),0,NormalizeDouble(OrderOpenPrice()-止盈内 *POINT,DIGITS),0))
                        break;

               if(止损内!=0 && 止盈内==0)
                  for(ix=0; ix<3; ix++)
                     if(OrderModify(OrderTicket(),OrderOpenPrice(),NormalizeDouble(OrderOpenPrice()+止损内 *POINT,DIGITS),0,0))
                        break;
              }
            报错组件("");
           }
     }

   if(类型==OP_BUYLIMIT || 类型==OP_BUYSTOP)
     {
      t=-1;
      for(ix2=0; ix2<1; ix2++)
         if(t==-1)
           {
            if(价位==0)
              {
               RefreshRates();
               价位=MarketInfo(货币对,MODE_ASK);
              }

            if(类型==OP_BUYLIMIT)
              {
               if(止损内!=0 && 止盈内!=0)
                  t=OrderSend(货币对,OP_BUYLIMIT,单量内,NormalizeDouble(价位-间隔*POINT,DIGITS),滑点内,NormalizeDouble(价位-间隔*POINT-止损内 *POINT,DIGITS),NormalizeDouble(价位-间隔*POINT+止盈内 *POINT,DIGITS),备注内,magicX,0,颜色标记);
               if(止损内==0 && 止盈内!=0)
                  t=OrderSend(货币对,OP_BUYLIMIT,单量内,NormalizeDouble(价位-间隔*POINT,DIGITS),滑点内,0,NormalizeDouble(价位-间隔*POINT+止盈内 *POINT,DIGITS),备注内,magicX,0,颜色标记);
               if(止损内!=0 && 止盈内==0)
                  t=OrderSend(货币对,OP_BUYLIMIT,单量内,NormalizeDouble(价位-间隔*POINT,DIGITS),滑点内,NormalizeDouble(价位-间隔*POINT-止损内 *POINT,DIGITS),0,备注内,magicX,0,颜色标记);
               if(止损内==0 && 止盈内==0)
                  t=OrderSend(货币对,OP_BUYLIMIT,单量内,NormalizeDouble(价位-间隔*POINT,DIGITS),滑点内,0,0,备注内,magicX,0,颜色标记);
              }

            if(类型==OP_BUYSTOP)
              {
               if(止损内!=0 && 止盈内!=0)
                  t=OrderSend(货币对,OP_BUYSTOP,单量内,NormalizeDouble(价位+间隔*POINT,DIGITS),滑点内,NormalizeDouble(价位+间隔*POINT-止损内 *POINT,DIGITS),NormalizeDouble(价位+间隔*POINT+止盈内 *POINT,DIGITS),备注内,magicX,0,颜色标记);
               if(止损内==0 && 止盈内!=0)
                  t=OrderSend(货币对,OP_BUYSTOP,单量内,NormalizeDouble(价位+间隔*POINT,DIGITS),滑点内,0,NormalizeDouble(价位+间隔*POINT+止盈内 *POINT,DIGITS),备注内,magicX,0,颜色标记);
               if(止损内!=0 && 止盈内==0)
                  t=OrderSend(货币对,OP_BUYSTOP,单量内,NormalizeDouble(价位+间隔*POINT,DIGITS),滑点内,NormalizeDouble(价位+间隔*POINT-止损内 *POINT,DIGITS),0,备注内,magicX,0,颜色标记);
               if(止损内==0 && 止盈内==0)
                  t=OrderSend(货币对,OP_BUYSTOP,单量内,NormalizeDouble(价位+间隔*POINT,DIGITS),滑点内,0,0,备注内,magicX,0,颜色标记);
              }
            报错组件("");
           }
     }

   if(类型==OP_SELLLIMIT || 类型==OP_SELLSTOP)
     {
      t=-1;
      for(ix2=0; ix2<1; ix2++)
         if(t==-1)
           {
            if(价位==0)
              {
               RefreshRates();
               价位=MarketInfo(货币对,MODE_BID);
              }

            if(类型==OP_SELLSTOP)
              {
               if(止损内!=0 && 止盈内!=0)
                  t=OrderSend(货币对,OP_SELLSTOP,单量内,NormalizeDouble(价位-间隔*POINT,DIGITS),滑点内,NormalizeDouble(价位-间隔*POINT+止损内 *POINT,DIGITS),NormalizeDouble(价位-间隔*POINT-止盈内 *POINT,DIGITS),备注内,magicX,0,颜色标记);
               if(止损内==0 && 止盈内!=0)
                  t=OrderSend(货币对,OP_SELLSTOP,单量内,NormalizeDouble(价位-间隔*POINT,DIGITS),滑点内,0,NormalizeDouble(价位-间隔*POINT-止盈内 *POINT,DIGITS),备注内,magicX,0,颜色标记);
               if(止损内!=0 && 止盈内==0)
                  t=OrderSend(货币对,OP_SELLSTOP,单量内,NormalizeDouble(价位-间隔*POINT,DIGITS),滑点内,NormalizeDouble(价位-间隔*POINT+止损内 *POINT,DIGITS),0,备注内,magicX,0,颜色标记);
               if(止损内==0 && 止盈内==0)
                  t=OrderSend(货币对,OP_SELLSTOP,单量内,NormalizeDouble(价位-间隔*POINT,DIGITS),滑点内,0,0,备注内,magicX,0,颜色标记);
              }

            if(类型==OP_SELLLIMIT)
              {
               if(止损内!=0 && 止盈内!=0)
                  t=OrderSend(货币对,OP_SELLLIMIT,单量内,NormalizeDouble(价位+间隔*POINT,DIGITS),滑点内,NormalizeDouble(价位+间隔*POINT+止损内 *POINT,DIGITS),NormalizeDouble(价位+间隔*POINT-止盈内 *POINT,DIGITS),备注内,magicX,0,颜色标记);
               if(止损内==0 && 止盈内!=0)
                  t=OrderSend(货币对,OP_SELLLIMIT,单量内,NormalizeDouble(价位+间隔*POINT,DIGITS),滑点内,0,NormalizeDouble(价位+间隔*POINT-止盈内 *POINT,DIGITS),备注内,magicX,0,颜色标记);
               if(止损内!=0 && 止盈内==0)
                  t=OrderSend(货币对,OP_SELLLIMIT,单量内,NormalizeDouble(价位+间隔*POINT,DIGITS),滑点内,NormalizeDouble(价位+间隔*POINT+止损内 *POINT,DIGITS),0,备注内,magicX,0,颜色标记);
               if(止损内==0 && 止盈内==0)
                  t=OrderSend(货币对,OP_SELLLIMIT,单量内,NormalizeDouble(价位+间隔*POINT,DIGITS),滑点内,0,0,备注内,magicX,0,颜色标记);
              }
            报错组件("");
           }
     }
   return(t);
  }

double 滑点=30;
input bool 是否显示文字标签=true;
input bool 国际点差自适应=true;
//+------------------------------------------------------------------+
//||
//+------------------------------------------------------------------+
double 系数(string symbol)
  {
   int 系数=1;
   if(
      MarketInfo(symbol,MODE_DIGITS)==3
      || MarketInfo(symbol,MODE_DIGITS)==5
      || (StringFind(symbol,"XAU",0)==0 && MarketInfo(symbol,MODE_DIGITS)==2)
      ||(StringFind(symbol,"GOLD",0)==0&&MarketInfo(symbol,MODE_DIGITS)==2)
      ||(StringFind(symbol,"Gold",0)==0&&MarketInfo(symbol,MODE_DIGITS)==2)
      || (StringFind(symbol,"USD_GLD",0)==0 && MarketInfo(symbol,MODE_DIGITS)==2)
   )
      系数=10;

   if(StringFind(symbol,"XAU",0)==0 && MarketInfo(symbol,MODE_DIGITS)==3)
      系数=100;
   if(StringFind(symbol,"GOLD",0)==0 && MarketInfo(symbol,MODE_DIGITS)==3)
      系数=100;
   if(StringFind(symbol,"Gold",0)==0 && MarketInfo(symbol,MODE_DIGITS)==3)
      系数=100;
   if(StringFind(symbol,"USD_GLD",0)==0 && MarketInfo(symbol,MODE_DIGITS)==3)
      系数=100;

   if(国际点差自适应==false)
      return(1);

   return(系数);
  }
//+------------------------------------------------------------------+
//| |
//+------------------------------------------------------------------+
void laber(string a,color b,int jl)
  {
   Print(a);
   if(IsOptimization())
      return;

   if(是否显示文字标签==true)
     {
      int pp=WindowBarsPerChart();
      double hh=High[iHighest(Symbol(),0,MODE_HIGH,pp,0)];
      double ll=Low[iLowest(Symbol(),0,MODE_LOW,pp,0)];
      double 文字小距离=(hh-ll)*0.03;

      ObjectDelete("箭头"+TimeToStr(Time[0],TIME_DATE|TIME_MINUTES)+a);
      ObjectCreate("箭头"+TimeToStr(Time[0],TIME_DATE|TIME_MINUTES)+a,OBJ_TEXT,0,Time[0],Low[0]-jl*文字小距离);
      ObjectSetText("箭头"+TimeToStr(Time[0],TIME_DATE|TIME_MINUTES)+a,a,8,"Times New Roman",b);
     }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void 报错组件(string a)
  {

   RefreshRates();

   if(IsOptimization())
      return;

   int t=GetLastError();
   string 报警;
   if(t!=0)
      switch(t)
        {
         //case 0:报警="错误代码:"+(string)0+"没有错误返回";break;
         //case 1:报警="错误代码:"+(string)1+"没有错误返回但结果不明";break;
         //case 2:报警="错误代码:"+(string)2+"一般错误";break;
         //case 3:报警="错误代码:"+(string)3+"无效交易参量";break;
         case 4:
            报警="错误代码:"+(string)4+"交易服务器繁忙";
            break;
         case 5:
            报警="错误代码:"+(string)5+"客户终端旧版本";
            break;
         case 6:
            报警="错误代码:"+(string)6+"没有连接服务器";
            break;
         case 7:
            报警="错误代码:"+(string)7+"没有权限";
            break;
         //case 8:报警="错误代码:"+(string)8+"请求过于频繁";break;
         case 9:
            报警="错误代码:"+(string)9+"交易运行故障";
            break;
         case 64:
            报警="错误代码:"+(string)64+"账户禁止";
            break;
         case 65:
            报警="错误代码:"+(string)65+"无效账户";
            break;
         // case 128:报警="错误代码:"+(string)128+"交易超时";break;
         //case 129:报警="错误代码:"+(string)129+"无效价格";break;
         case 130:
            报警="错误代码:"+(string)130+"无效停止";
            break;
         //case 131:报警="错误代码:"+(string)131+"无效交易量";break;
         case 132:
            报警="错误代码:"+(string)132+"市场关闭";
            break;
         case 133:
            报警="错误代码:"+(string)133+"交易被禁止";
            break;
         case 134:
            报警="错误代码:"+(string)134+"资金不足";
            break;
         case 135:
            报警="错误代码:"+(string)135+"价格改变";
            break;
         //case 136:报警="错误代码:"+(string)136+"开价";break;
         case 137:
            报警="错误代码:"+(string)137+"经纪繁忙";
            break;
         //case 138:报警="错误代码:"+(string)138+"重新开价";break;
         case 139:
            报警="错误代码:"+(string)139+"定单被锁定";
            break;
         case 140:
            报警="错误代码:"+(string)140+"只允许看涨仓位";
            break;
         //case 141:报警="错误代码:"+(string)141+"过多请求";break;
         //case 145:报警="错误代码:"+(string)145+"因为过于接近市场，修改否定";break;
         //case 146:报警="错误代码:"+(string)146+"交易文本已满";break;
         case 147:
            报警="错误代码:"+(string)147+"时间周期被经纪否定";
            break;
         case 148:
            报警="错误代码:"+(string)148+"开单和挂单总数已被经纪限定";
            break;
         case 149:
            报警="错误代码:"+(string)149+"当对冲备拒绝时,打开相对于现有的一个单置";
            break;
         case 150:
            报警="错误代码:"+(string)150+"把为反FIFO规定的单子平掉";
            break;
         case 4000:
            报警="错误代码:"+(string)4000+"没有错误";
            break;
         case 4001:
            报警="错误代码:"+(string)4001+"错误函数指示";
            break;
         case 4002:
            报警="错误代码:"+(string)4002+"数组索引超出范围";
            break;
         case 4003:
            报警="错误代码:"+(string)4003+"对于调用堆栈储存器函数没有足够内存";
            break;
         case 4004:
            报警="错误代码:"+(string)4004+"循环堆栈储存器溢出";
            break;
         case 4005:
            报警="错误代码:"+(string)4005+"对于堆栈储存器参量没有内存";
            break;
         case 4006:
            报警="错误代码:"+(string)4006+"对于字行参量没有足够内存";
            break;
         case 4007:
            报警="错误代码:"+(string)4007+"对于字行没有足够内存";
            break;
         //case 4008:报警="错误代码:"+(string)4008+"没有初始字行";break;
         case 4009:
            报警="错误代码:"+(string)4009+"在数组中没有初始字串符";
            break;
         case 4010:
            报警="错误代码:"+(string)4010+"对于数组没有内存";
            break;
         case 4011:
            报警="错误代码:"+(string)4011+"字行过长";
            break;
         case 4012:
            报警="错误代码:"+(string)4012+"余数划分为零";
            break;
         case 4013:
            报警="错误代码:"+(string)4013+"零划分";
            break;
         case 4014:
            报警="错误代码:"+(string)4014+"不明命令";
            break;
         case 4015:
            报警="错误代码:"+(string)4015+"错误转换(没有常规错误)";
            break;
         case 4016:
            报警="错误代码:"+(string)4016+"没有初始数组";
            break;
         case 4017:
            报警="错误代码:"+(string)4017+"禁止调用DLL ";
            break;
         case 4018:
            报警="错误代码:"+(string)4018+"数据库不能下载";
            break;
         case 4019:
            报警="错误代码:"+(string)4019+"不能调用函数";
            break;
         case 4020:
            报警="错误代码:"+(string)4020+"禁止调用智能交易函数";
            break;
         case 4021:
            报警="错误代码:"+(string)4021+"对于来自函数的字行没有足够内存";
            break;
         case 4022:
            报警="错误代码:"+(string)4022+"系统繁忙 (没有常规错误)";
            break;
         case 4050:
            报警="错误代码:"+(string)4050+"无效计数参量函数";
            break;
         case 4051:
            报警="错误代码:"+(string)4051+"无效参量值函数";
            break;
         case 4052:
            报警="错误代码:"+(string)4052+"字行函数内部错误";
            break;
         case 4053:
            报警="错误代码:"+(string)4053+"一些数组错误";
            break;
         case 4054:
            报警="错误代码:"+(string)4054+"应用不正确数组";
            break;
         case 4055:
            报警="错误代码:"+(string)4055+"自定义指标错误";
            break;
         case 4056:
            报警="错误代码:"+(string)4056+"不协调数组";
            break;
         case 4057:
            报警="错误代码:"+(string)4057+"整体变量过程错误";
            break;
         case 4058:
            报警="错误代码:"+(string)4058+"整体变量未找到";
            break;
         case 4059:
            报警="错误代码:"+(string)4059+"测试模式函数禁止";
            break;
         case 4060:
            报警="错误代码:"+(string)4060+"没有确认函数";
            break;
         case 4061:
            报警="错误代码:"+(string)4061+"发送邮件错误";
            break;
         case 4062:
            报警="错误代码:"+(string)4062+"字行预计参量";
            break;
         case 4063:
            报警="错误代码:"+(string)4063+"整数预计参量";
            break;
         case 4064:
            报警="错误代码:"+(string)4064+"双预计参量";
            break;
         case 4065:
            报警="错误代码:"+(string)4065+"数组作为预计参量";
            break;
         case 4066:
            报警="错误代码:"+(string)4066+"刷新状态请求历史数据";
            break;
         case 4067:
            报警="错误代码:"+(string)4067+"交易函数错误";
            break;
         case 4099:
            报警="错误代码:"+(string)4099+"文件结束";
            break;
         case 4100:
            报警="错误代码:"+(string)4100+"一些文件错误";
            break;
         case 4101:
            报警="错误代码:"+(string)4101+"错误文件名称";
            break;
         case 4102:
            报警="错误代码:"+(string)4102+"打开文件过多";
            break;
         case 4103:
            报警="错误代码:"+(string)4103+"不能打开文件";
            break;
         case 4104:
            报警="错误代码:"+(string)4104+"不协调文件";
            break;
         case 4105:
            报警="错误代码:"+(string)4105+"没有选择定单";
            break;
         case 4106:
            报警="错误代码:"+(string)4106+"不明货币对";
            break;
         case 4107:
            报警="错误代码:"+(string)4107+"无效价格";
            break;
         case 4108:
            报警="错误代码:"+(string)4108+"无效定单编码";
            break;
         case 4109:
            报警="错误代码:"+(string)4109+"不允许交易";
            break;
         case 4110:
            报警="错误代码:"+(string)4110+"不允许长期";
            break;
         case 4111:
            报警="错误代码:"+(string)4111+"不允许短期";
            break;
         case 4200:
            报警="错误代码:"+(string)4200+"定单已经存在";
            break;
         case 4201:
            报警="错误代码:"+(string)4201+"不明定单属性";
            break;
         //case 4202:报警="错误代码:"+(string)4202+"定单不存在";break;
         case 4203:
            报警="错误代码:"+(string)4203+"不明定单类型";
            break;
         case 4204:
            报警="错误代码:"+(string)4204+"没有定单名称";
            break;
         case 4205:
            报警="错误代码:"+(string)4205+"定单坐标错误";
            break;
         case 4206:
            报警="错误代码:"+(string)4206+"没有指定子窗口";
            break;
         case 4207:
            报警="错误代码:"+(string)4207+"定单一些函数错误";
            break;
         case 4250:
            报警="错误代码:"+(string)4250+"错误设定发送通知到队列中";
            break;
         case 4251:
            报警="错误代码:"+(string)4251+"无效参量- 空字符串传递到SendNotification()函数";
            break;
         case 4252:
            报警="错误代码:"+(string)4252+"无效设置发送通知(未指定ID或未启用通知)";
            break;
         case 4253:
            报警="错误代码:"+(string)4253+"通知发送过于频繁";
            break;
        }
   if(t!=0)
     {
      while(IsTradeContextBusy())
         Sleep(300);
      Print(a+报警);
      laber(a+报警,Yellow,0);
     }
  }

string JLA[999];
double JLB[999];
datetime JLC[999];
string JLD[999];
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int HQXH(string A)
  {
   int JL=-100;
   for(int ix=0; ix<999; ix++)
     {
      if(JLA[ix]==A)
         return(ix);
      else
         if(JLA[ix]==NULL)
            if(JL==-100)
               JL=ix;
     }
   return(JL);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int objectFind(string A)
  {
   if(IsOptimization())
     {
      for(int ix=0; ix<999; ix++)
         if(JLA[ix]==A)
            return(0);
      return(-1);
     }
   return(ObjectFind(A));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void objectDelete(string A)
  {
   if(IsOptimization())
     {
      int WZ=HQXH(A);
      JLA[WZ]=NULL;
      return;
     }
   ObjectDelete(A);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
double objectGet(string A,int B)
  {
   if(IsOptimization())
     {
      if(objectFind(A)!=-1)
        {
         if(B==OBJPROP_PRICE1)
            return(JLB[HQXH(A)]);
         if(B==OBJPROP_TIME1)
            return(JLC[HQXH(A)]);
        }
      else
         return(0);
     }
   return(ObjectGet(A,B));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
string objectDescription(string A)
  {
   if(IsOptimization())
      return(JLD[HQXH(A)]);
   return(ObjectDescription(A));
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void laber0(string name,string txt,color 颜色,datetime 时间,double 价位,int 字体大小,int 定位,int 窗口)
  {
   if(IsOptimization())
     {
      int WZ=HQXH(name);
      JLA[WZ]=name;
      JLB[WZ]=价位;
      JLC[WZ]=时间;
      JLD[WZ]=txt;
      return;
     }
   ObjectDelete(name);
   ObjectCreate(name,OBJ_TEXT,窗口,时间,价位);
   ObjectSetText(name,txt,字体大小,"Times New Roman",颜色);
   ObjectSetInteger(0,name,OBJPROP_ANCHOR,定位);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void 画直线(string e,int type,double b,datetime c,color d,int type2,int width)
  {
   if(IsOptimization())
     {
      int WZ=HQXH(e);
      JLA[WZ]=e;
      JLB[WZ]=b;
      JLC[WZ]=c;
      return;
     }

   ObjectDelete(e);
   ObjectCreate(e,type,0,0,0);
   ObjectSet(e,OBJPROP_PRICE1,b);
   ObjectSet(e,OBJPROP_TIME1,c);
   ObjectSet(e,OBJPROP_COLOR,d);
   ObjectSet(e,OBJPROP_STYLE,type2);
   ObjectSet(e,OBJPROP_WIDTH,width);
  }
//+------------------------------------------------------------------+
input datetime 程序最终编译时间=__DATETIME__;
//+------------------------------------------------------------------+
