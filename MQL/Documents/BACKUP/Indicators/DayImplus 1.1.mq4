//-- www.ea800.com  QQ超级群 43911999 ----+------------------------------------------------------------------+
//-- www.ea800.com  QQ超级群 43911999 ----| DayImplus 1.1.mq4                                                |
//-- www.ea800.com  QQ超级群 43911999 ----|                                                                  |
//-- www.ea800.com  QQ超级群 43911999 ----| Updated by DriverDan                                             |
//-- www.ea800.com  QQ超级群 43911999 ----|                                                                  |
//-- www.ea800.com  QQ超级群 43911999 ----| Versions:                                                        |
//-- www.ea800.com  QQ超级群 43911999 ----|   1.1 Released by DriverDan                                      |
//-- www.ea800.com  QQ超级群 43911999 ----|       Fix horrible style, removed extra buffer, changed to draw  |
//-- www.ea800.com  QQ超级群 43911999 ----|       from the beginning, added MA, and fixed gaps in signal.    |
//-- www.ea800.com  QQ超级群 43911999 ----|                                                                  |
//-- www.ea800.com  QQ超级群 43911999 ----|   1.0 Original Release                                           |
//-- www.ea800.com  QQ超级群 43911999 ----+------------------------------------------------------------------+

#property link "http://-- www.ea800.com  QQ超级群 43911999 ----www.arkworldmarket.ru/forum/showthread.php?t=966&page=2&pp=10"
   
#property indicator_separate_window
#property indicator_buffers 2
#property indicator_color1  Gold
#property indicator_color2  White

extern int per       = 14;  //-- www.ea800.com  QQ超级群 43911999 ---- Period for signal
extern int drawShift = 14;  //-- www.ea800.com  QQ超级群 43911999 ---- Forward shift
extern int useMA     = 1;   //-- www.ea800.com  QQ超级群 43911999 ---- 1 = use MA
extern int maPeriod  = 34;  //-- www.ea800.com  QQ超级群 43911999 ---- Moving average period

double ExtMapBuffer[];
double maBuffer[];
   
int init() {
   string title = "DayImplus(" + per + ")";
   SetIndexStyle(0, DRAW_LINE);
   SetIndexBuffer(0, ExtMapBuffer);
   SetIndexStyle(1, DRAW_LINE);
   SetIndexBuffer(1, maBuffer);
   SetIndexShift(0, drawShift);
   SetIndexShift(1, drawShift);
   SetIndexLabel(0, "Signal(" + per + ")");
   SetIndexLabel(1, "MA(" + maPeriod + ")");
   
   if(useMA == 1) {
      title = title + " MA(" + maPeriod + ")";
   }
   
   IndicatorShortName(title);
   return(0);
}

int start() {
   int    counted_bars = IndicatorCounted();
   int    shift, i;
   double imp;

   //-- www.ea800.com  QQ超级群 43911999 ----for shift=mBar down to per 
   for(shift = Bars - counted_bars - 1; shift >= 0; shift--) {
      imp = 0;

      for(i = shift; i >= shift - per; i--) {
         imp = imp + (Open[i] - Close[i]);
      }

      imp = MathRound(imp / Point);

      if(imp != 0) {
         imp =- imp;
      }
      ExtMapBuffer[shift] = imp;
   }
   
   if(useMA == 1) {
      for(shift = Bars - counted_bars - 1; shift >= 0; shift--) {
         if(shift < Bars - maPeriod && shift < Bars - per) {
            maBuffer[shift] = iMAOnArray(ExtMapBuffer, 0, maPeriod, 0, MODE_SMA, shift);
         }
      }
   }
   
   return(0);
}

