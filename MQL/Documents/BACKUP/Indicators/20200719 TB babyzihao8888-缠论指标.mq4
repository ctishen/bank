//+------------------------------------------------------------------+
//|                                                      ProjectName |
//|                                      Copyright 2012, CompanyName |
//|                                       http://www.companyname.net |
//+------------------------------------------------------------------+
#property copyright "鱼儿编程 QQ：276687220"
#property link"http://babelfish.taobao.com/"
#property indicator_chart_window
#property indicator_buffers 4
#property indicator_color1 Red
#property indicator_color2 Red

#property indicator_color3 clrLime
#property indicator_color4 clrLime



//--- buffers
double ExtMapBuffer1[];
double ExtMapBuffer2[];
double ExtMapBuffer3[];
double ExtMapBuffer4[];
input int 间隔=40;
//+------------------------------------------------------------------+
//| Custom indicator initialization function |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   Chart_Scale=ChartScaleGet();

   switch(Chart_Scale)
     {
      case 0:
         Bar_Width=1;
         break;
      case 1:
         Bar_Width=2;
         break;
      case 2:
         Bar_Width=2;
         break;
      case 3:
         Bar_Width=3;
         break;
      case 4:
         Bar_Width=6;
         break;
      default:
         Bar_Width=13;
     }

   IndicatorBuffers(50);

   int pp=0;
   SetIndexStyle(pp,DRAW_HISTOGRAM,0,Bar_Width);
   pp++;
   SetIndexStyle(pp,DRAW_HISTOGRAM,0,Bar_Width);
   pp++;
   SetIndexStyle(pp,DRAW_ARROW);
   SetIndexArrow(pp,233);
   SetIndexEmptyValue(pp,0.0);
   pp++;
   SetIndexStyle(pp,DRAW_ARROW);
   SetIndexArrow(pp,234);
   SetIndexEmptyValue(pp,0.0);
   pp++;

   pp=0;
   SetIndexBuffer(pp,ExtMapBuffer1);
   pp++;
   SetIndexBuffer(pp,ExtMapBuffer2);
   pp++;
   SetIndexBuffer(pp,ExtMapBuffer3);
   pp++;
   SetIndexBuffer(pp,ExtMapBuffer4);
   pp++;

   IndicatorShortName("20200719 TB babyzihao8888-缠论指标");
   IndicatorDigits(Digits+1);
//EventSetMillisecondTimer(300);
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//----
   for(int i=ObjectsTotal(); i>=0; i--)
     {
      if(StringFind(ObjectName(i),"20200719",0)==0)
        {
         ObjectDelete(ObjectName(i));
         i=ObjectsTotal();
        }
     }
//----
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function|
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
   int counted=MathMax(prev_calculated,0);
   if(counted<0)
      return(-1);
   if(counted>0)
      counted--;
   int i=MathMin(rates_total-counted,rates_total-0);

   for(int m=i; m>=1; m--)
     {
      if(ExtMapBuffer1[m]==EMPTY_VALUE)
        {
         ExtMapBuffer1[m]=High[m];
         ExtMapBuffer2[m]=Low[m];
        }
     }

   for(m=i; m>=1; m--)
     {
      if(ExtMapBuffer1[m]!=EMPTY_VALUE)
        {
         for(int ix=m+1; ix<Bars; ix++)
            if(ExtMapBuffer1[ix]!=EMPTY_VALUE)
               break;

         int 左侧1=ix;

         for(ix=左侧1+1; ix<Bars; ix++)
            if(ExtMapBuffer1[ix]!=EMPTY_VALUE)
               break;

         int 左侧2=ix;

         if(
            (ExtMapBuffer1[m]>=ExtMapBuffer1[左侧1] && ExtMapBuffer2[m]<=ExtMapBuffer2[左侧1])
            || (ExtMapBuffer1[m]<=ExtMapBuffer1[左侧1] && ExtMapBuffer2[m]>=ExtMapBuffer2[左侧1])
         )
           {
            if(ExtMapBuffer1[左侧1]>ExtMapBuffer1[左侧2])
               if(ExtMapBuffer2[左侧1]>ExtMapBuffer2[左侧2])
                 {
                  ExtMapBuffer1[m]=MathMax(ExtMapBuffer1[m],ExtMapBuffer1[左侧1]);
                  ExtMapBuffer2[m]=MathMax(ExtMapBuffer2[m],ExtMapBuffer2[左侧1]);
                  ExtMapBuffer1[左侧1]=EMPTY_VALUE;
                  ExtMapBuffer1[左侧1]=EMPTY_VALUE;
                  ExtMapBuffer3[左侧1]=0;
                  ExtMapBuffer4[左侧1]=0;
                  m++;
                 }

            if(ExtMapBuffer1[左侧1]<ExtMapBuffer1[左侧2])
               if(ExtMapBuffer2[左侧1]<ExtMapBuffer2[左侧2])
                 {
                  ExtMapBuffer1[m]=MathMin(ExtMapBuffer1[m],ExtMapBuffer1[左侧1]);
                  ExtMapBuffer2[m]=MathMin(ExtMapBuffer2[m],ExtMapBuffer2[左侧1]);
                  ExtMapBuffer1[左侧1]=EMPTY_VALUE;
                  ExtMapBuffer1[左侧1]=EMPTY_VALUE;
                  ExtMapBuffer3[左侧1]=0;
                  ExtMapBuffer4[左侧1]=0;
                  m++;
                 }
           }
        }
     }

   for(m=i; m>=1; m--)
     {
      if(ExtMapBuffer1[m+1]!=EMPTY_VALUE)
        {
         //for(ix=m+1;ix<Bars;ix++)
         //   if(ExtMapBuffer1[ix]!=EMPTY_VALUE)
         //      break;

         左侧1=m+1;

         for(ix=左侧1+1; ix<Bars; ix++)
            if(ExtMapBuffer1[ix]!=EMPTY_VALUE)
               break;

         左侧2=ix;

         if(ExtMapBuffer2[左侧1]<Low[m])
            if(ExtMapBuffer1[左侧1]<High[m])
               if(ExtMapBuffer2[左侧1]<ExtMapBuffer2[左侧2])
                  ExtMapBuffer3[m]=Low[m]-间隔*Point;

         if(ExtMapBuffer1[左侧1]>High[m])
            if(ExtMapBuffer2[左侧1]>Low[m])
               if(ExtMapBuffer1[左侧1]>ExtMapBuffer1[左侧2])
                  ExtMapBuffer4[m]=High[m]+间隔*Point;
        }
     }
   return(rates_total);
  }
//+------------------------------------------------------------------+

int  Chart_Scale,Bar_Width;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,const long &lparam,const double &dparam,const string &sparam)
  {
   Chart_Scale=ChartScaleGet();
   OnInit();
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
int ChartScaleGet()
  {
   long result=-1;
   ChartGetInteger(0,CHART_SCALE,0,result);
   return((int)result);
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---

  }
//+------------------------------------------------------------------+
input datetime 程序最终编译时间=__DATETIME__;
//+------------------------------------------------------------------+
