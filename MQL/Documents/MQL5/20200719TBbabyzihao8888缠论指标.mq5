//+------------------------------------------------------------------+
//|                               20200719 TB babyzihao8888-缠论指标.mq5 |
//|                                  Copyright 2021, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "鱼儿编程 QQ：276687220"
#property link"http://babelfish.taobao.com/"
#property indicator_chart_window
#property indicator_buffers 6
#property indicator_plots   3
//--- plot Label1
#property indicator_label1  "Label1"
#property indicator_type1   DRAW_CANDLES
#property indicator_color1  clrRed
#property indicator_style1  STYLE_SOLID
#property indicator_width1  1
//--- plot Label2
#property indicator_label2  "Label2"
#property indicator_type2   DRAW_ARROW
#property indicator_color2  clrLime
#property indicator_style2  STYLE_SOLID
#property indicator_width2  1
//--- plot Label3
#property indicator_label3  "Label3"
#property indicator_type3   DRAW_ARROW
#property indicator_color3  clrLime
#property indicator_style3  STYLE_SOLID
#property indicator_width3  1
//--- indicator buffers

double ExtMapBuffer1[];
double ExtMapBuffer2[];
double ExtMapBuffer1X[];
double ExtMapBuffer2X[];
double         Label2Buffer[];
double         Label3Buffer[];
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
   SetIndexBuffer(0,ExtMapBuffer1,INDICATOR_DATA);
   SetIndexBuffer(1,ExtMapBuffer1X,INDICATOR_DATA);
   SetIndexBuffer(2,ExtMapBuffer2X,INDICATOR_DATA);
   SetIndexBuffer(3,ExtMapBuffer2,INDICATOR_DATA);
   SetIndexBuffer(4,Label2Buffer,INDICATOR_DATA);
   SetIndexBuffer(5,Label3Buffer,INDICATOR_DATA);
//--- setting a code from the Wingdings charset as the property of PLOT_ARROW
//PlotIndexSetDouble(0,PLOT_EMPTY_VALUE,EMPTY_VALUE);
   PlotIndexSetInteger(1,PLOT_ARROW,233);
   PlotIndexSetInteger(2,PLOT_ARROW,234);
   PlotIndexSetDouble(1,PLOT_EMPTY_VALUE,0);
   PlotIndexSetDouble(2,PLOT_EMPTY_VALUE,0);
   PlotIndexSetInteger(1,PLOT_ARROW_SHIFT,10);
   PlotIndexSetInteger(2,PLOT_ARROW_SHIFT,-10);


   IndicatorSetString(INDICATOR_SHORTNAME,"20200719 TB babyzihao8888-缠论指标");
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+

//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---

  }
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
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
//if(rates_total<ExtPlotBegin)
   if(rates_total<2)
      return(0);

   int i;
   if(prev_calculated>1)
      i=prev_calculated-1;
   else
     {
      i=0;
      ArrayInitialize(ExtMapBuffer1,EMPTY_VALUE);
      ArrayInitialize(ExtMapBuffer2,EMPTY_VALUE);
      ArrayInitialize(ExtMapBuffer1X,EMPTY_VALUE);
      ArrayInitialize(ExtMapBuffer2X,EMPTY_VALUE);
      ArrayInitialize(Label2Buffer,0);
      ArrayInitialize(Label3Buffer,0);
     }
//--- main cycle
   ExtMapBuffer1[rates_total-1]=EMPTY_VALUE;
   ExtMapBuffer2[rates_total-1]=EMPTY_VALUE;
   ExtMapBuffer1X[rates_total-1]=EMPTY_VALUE;
   ExtMapBuffer2X[rates_total-1]=EMPTY_VALUE;
   Label2Buffer[rates_total-1]=0;
   Label3Buffer[rates_total-1]=0;

   for(int m=i; m<rates_total-1 && !IsStopped(); m++)
     {
      if(ExtMapBuffer1[m]==EMPTY_VALUE||prev_calculated==0)
        {
         ExtMapBuffer1[m]=high[m];
         ExtMapBuffer2[m]=low[m];
         ExtMapBuffer1X[m]=ExtMapBuffer1[m];
         ExtMapBuffer2X[m]=ExtMapBuffer2[m];
         Label2Buffer[m]=0;
         Label3Buffer[m]=0;
        }
     }

   for(int m=i; m<rates_total-1 && !IsStopped(); m++)
     {
      if(ExtMapBuffer1[m]!=EMPTY_VALUE)
        {
         int ix;
         int 左侧1=-1;
         int 左侧2=-1;
         for(ix=m-1; ix>=0; ix--)
            if(ExtMapBuffer1[ix]!=EMPTY_VALUE)
              {
               左侧1=ix;
               break;
              }

         for(ix=左侧1-1; ix>=0; ix--)
            if(ExtMapBuffer1[ix]!=EMPTY_VALUE)
              {
               左侧2=ix;
               break;
              }

         if(左侧1!=-1)
            if(左侧2!=-1)
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
                        ExtMapBuffer2[左侧1]=EMPTY_VALUE;
                        ExtMapBuffer1X[m]=ExtMapBuffer1[m];
                        ExtMapBuffer2X[m]=ExtMapBuffer2[m];
                        ExtMapBuffer1X[左侧1]=ExtMapBuffer1[左侧1];
                        ExtMapBuffer2X[左侧1]=ExtMapBuffer2[左侧1];
                        Label2Buffer[左侧1]=0;
                        Label3Buffer[左侧1]=0;
                        m--;
                       }

                  if(ExtMapBuffer1[左侧1]<ExtMapBuffer1[左侧2])
                     if(ExtMapBuffer2[左侧1]<ExtMapBuffer2[左侧2])
                       {
                        ExtMapBuffer1[m]=MathMin(ExtMapBuffer1[m],ExtMapBuffer1[左侧1]);
                        ExtMapBuffer2[m]=MathMin(ExtMapBuffer2[m],ExtMapBuffer2[左侧1]);
                        ExtMapBuffer1[左侧1]=EMPTY_VALUE;
                        ExtMapBuffer2[左侧1]=EMPTY_VALUE;
                        ExtMapBuffer1X[m]=ExtMapBuffer1[m];
                        ExtMapBuffer2X[m]=ExtMapBuffer2[m];
                        ExtMapBuffer1X[左侧1]=ExtMapBuffer1[左侧1];
                        ExtMapBuffer2X[左侧1]=ExtMapBuffer2[左侧1];
                        Label2Buffer[左侧1]=0;
                        Label3Buffer[左侧1]=0;
                        m--;
                       }
                 }
        }
     }

   for(int m=MathMax(i,1); m<rates_total-1 && !IsStopped(); m++)
     {
      if(ExtMapBuffer1[m-1]!=EMPTY_VALUE)
        {
         int 左侧1=m-1;
         int ix;
         for(ix=左侧1-1; ix>0; ix--)
            if(ExtMapBuffer1[ix]!=EMPTY_VALUE)
               break;

         int 左侧2=ix;

         if(左侧1>=0)
            if(左侧2>=0)
              {
               if(ExtMapBuffer2[左侧1]<low[m])
                  if(ExtMapBuffer1[左侧1]<high[m])
                     if(ExtMapBuffer2[左侧1]<ExtMapBuffer2[左侧2])
                        Label2Buffer[m]=low[m];

               if(ExtMapBuffer1[左侧1]>high[m])
                  if(ExtMapBuffer2[左侧1]>low[m])
                     if(ExtMapBuffer1[左侧1]>ExtMapBuffer1[左侧2])
                        Label3Buffer[m]=high[m];
              }
        }
     }

   return(rates_total);
  }
//+------------------------------------------------------------------+
