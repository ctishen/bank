#property copyright "Õ‚ª„¡™√À www.FXunion.com QQ»∫144033"
#property link      ""

#property indicator_chart_window

extern double EntryLevel = 0;
extern double StopLossLevel = 0;
extern double Risk = 1; // Risk tolerance in percentage points
extern bool UseEquityInsteadOfBalance = false;

extern color font_color = LightBlue;
extern color ps_font_color = Red;
extern int font_size = 12;
extern string font_face = "Courier";
extern int corner = 0; //0 - for top-left corner, 1 - top-right, 2 - bottom-left, 3 - bottom-right
extern int distance_x = 10;
extern int distance_y = 15;
extern color entry_line_color = Blue;
extern color stoploss_line_color = Lime;

string QuoteCurrency = "", ReferencePair = "";
double ReferencePrice = 0;
int ReferenceType = -1;
string ModeText, SizeText;
double Size, RiskMoney;
double PositionSize;
double StopLoss;
double UnitCost = 1;

void InitializeReferencePair()
{
   // Try Ask for AccountCurrency/QouteCurrency
   ReferencePair = AccountCurrency() + QuoteCurrency;
   ReferenceType = MODE_ASK;
   ReferencePrice = MarketInfo(ReferencePair, ReferenceType);
   // Try Bid for QuoteCurrency/AccountCurrency
   if (!ReferencePrice)
   {
      ReferencePair = QuoteCurrency + AccountCurrency();
      ReferenceType = MODE_BID;
      ReferencePrice = MarketInfo(ReferencePair, ReferenceType);
   }
   
   if (!ReferencePrice)
   {
      Alert("Failed to detect a proper currency pair for pip valuation.");
      Alert("Try adding all the available currency pairs to Market Watch.");
      ReferenceType = -1;
      return;
   }

   if (ReferenceType == MODE_BID) ModeText = "Bid";
   else if (ReferenceType == MODE_ASK) ModeText = "Ask";
   ObjectCreate("ReferencePair", OBJ_LABEL, 0, 0, 0);
   ObjectSet("ReferencePair", OBJPROP_CORNER, corner);
   ObjectSet("ReferencePair", OBJPROP_XDISTANCE, distance_x);
   ObjectSet("ReferencePair", OBJPROP_YDISTANCE, distance_y + 30);
   ObjectSetText("ReferencePair", ReferencePair + " " + ModeText + ":   " + DoubleToStr(ReferencePrice, Digits), font_size, font_face, font_color);
}

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int init()
{
   if (EntryLevel - StopLossLevel == 0)
   {
      Alert("Entry and Stop-Loss levels should be different and non-zero.");
      return(-1);
   }

   // Determine the symbol quote currency
   if ((StringSubstr(Symbol(), 0, 1) == "#") || (StringFind(Symbol(), ".") != -1) || (StringFind(Symbol(), "_") != -1)) QuoteCurrency = "USD"; // CFD
   else if ((StringLen(Symbol()) != 6) && (StringSubstr(Symbol(), 0, 1) != "m") && (StringSubstr(Symbol(), 0, 1) != "x")) QuoteCurrency = "USD"; // Some commodity?
   else QuoteCurrency = StringSubstr(Symbol(), 3, 3); // Currency pair

   // Need to take into account the rate (Bid or Ask) of a reference currency pair
   // Can do it only if connected to account
   if ((AccountCurrency() != QuoteCurrency) && (AccountCurrency() != "")) InitializeReferencePair();
   
   ObjectCreate("Entry", OBJ_LABEL, 0, 0, 0);
   ObjectSet("Entry", OBJPROP_CORNER, corner);
   ObjectSet("Entry", OBJPROP_XDISTANCE, distance_x);
   ObjectSet("Entry", OBJPROP_YDISTANCE, distance_y);
   ObjectSetText("Entry", "Entry Lvl:    " + DoubleToStr(EntryLevel, Digits), font_size, font_face, font_color);

   ObjectCreate("EntryLine", OBJ_HLINE, 0, Time[0], EntryLevel);
   ObjectSet("EntryLine", OBJPROP_STYLE, STYLE_SOLID);
   ObjectSet("EntryLine", OBJPROP_COLOR, entry_line_color);
   ObjectSet("EntryLine", OBJPROP_WIDTH, 1);

   ObjectCreate("StopLoss", OBJ_LABEL, 0, 0, 0);
   ObjectSet("StopLoss", OBJPROP_CORNER, corner);
   ObjectSet("StopLoss", OBJPROP_XDISTANCE, distance_x);
   ObjectSet("StopLoss", OBJPROP_YDISTANCE, distance_y + 15);
   ObjectSetText("StopLoss", "Stop-Loss:    " + DoubleToStr(StopLossLevel, Digits), font_size, font_face, font_color);
   
   ObjectCreate("StopLossLine", OBJ_HLINE, 0, Time[0], StopLossLevel);
   ObjectSet("StopLossLine", OBJPROP_STYLE, STYLE_SOLID);
   ObjectSet("StopLossLine", OBJPROP_COLOR, stoploss_line_color);
   ObjectSet("StopLossLine", OBJPROP_WIDTH, 1);

   StopLoss = MathAbs(EntryLevel - StopLossLevel);
   
   ObjectCreate("Risk", OBJ_LABEL, 0, 0, 0);
   ObjectSet("Risk", OBJPROP_CORNER, corner);
   ObjectSet("Risk", OBJPROP_XDISTANCE, distance_x);
   ObjectSet("Risk", OBJPROP_YDISTANCE, distance_y + 45);
   ObjectSetText("Risk", "Risk:         " + DoubleToStr(Risk, 2) + "%", font_size, font_face, font_color);

   if (UseEquityInsteadOfBalance)
   {
      SizeText = "Equity";
      Size = AccountEquity();
   }
   else
   {
      SizeText = "Balance";
      Size = AccountBalance();
   }
   ObjectCreate("AccountSize", OBJ_LABEL, 0, 0, 0);
   ObjectSet("AccountSize", OBJPROP_CORNER, corner);
   ObjectSet("AccountSize", OBJPROP_XDISTANCE, distance_x);
   ObjectSet("AccountSize", OBJPROP_YDISTANCE, distance_y + 60);
   ObjectSetText("AccountSize", "Acc. " + SizeText + ": " + DoubleToStr(Size, 2), font_size, font_face, font_color);
   
   RiskMoney = Size * Risk / 100;
   ObjectCreate("RiskMoney", OBJ_LABEL, 0, 0, 0);
   ObjectSet("RiskMoney", OBJPROP_CORNER, corner);
   ObjectSet("RiskMoney", OBJPROP_XDISTANCE, distance_x);
   ObjectSet("RiskMoney", OBJPROP_YDISTANCE, distance_y + 75);
   ObjectSetText("RiskMoney", "Risk, money:  " + DoubleToStr(RiskMoney, 2), font_size, font_face, font_color);
   
   
   if (ReferenceType == MODE_ASK)
   {
      RefreshRates();
      ReferencePrice = MarketInfo(ReferencePair, ReferenceType);
      UnitCost = 1 / ReferencePrice;
   }
	else if (ReferenceType == MODE_BID)
	{
      RefreshRates();
      ReferencePrice = MarketInfo(ReferencePair, ReferenceType);
      UnitCost = ReferencePrice;
   }

   ObjectCreate("PositionSize", OBJ_LABEL, 0, 0, 0);
   ObjectSet("PositionSize", OBJPROP_CORNER, corner);
   ObjectSet("PositionSize", OBJPROP_XDISTANCE, distance_x);
   ObjectSet("PositionSize", OBJPROP_YDISTANCE, distance_y + 90);

   if ((ReferenceType != -1) && (AccountCurrency() != QuoteCurrency)) return(0);

   PositionSize = (RiskMoney / StopLoss) / 100000 / UnitCost;
   ObjectSetText("PositionSize", "Pos. Size:    " + DoubleToStr(PositionSize, 2), font_size + 1, font_face, ps_font_color);

   return(0);
}

//+------------------------------------------------------------------+
//| Custom indicator deinitialization function                       |
//+------------------------------------------------------------------+
int deinit()
{
   ObjectDelete("Entry");
   ObjectDelete("EntryLine");
   ObjectDelete("StopLoss");
   ObjectDelete("StopLossLine");
   ObjectDelete("Risk");
   ObjectDelete("ReferencePair");
   ObjectDelete("AccountSize");
   ObjectDelete("RiskMoney");
   ObjectDelete("PositionSize");
   return(0);
}

//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int start()
{
   if (EntryLevel - StopLossLevel == 0) return(0);
   
   // Need to initialize reference pair because we couldn't do it in init() as the there was no connection to account
   if ((AccountCurrency() != QuoteCurrency) && (ReferencePair == ""))
   {
      if (AccountCurrency() == "") return(0);
      InitializeReferencePair();
   }
   
   double tEntryLevel = ObjectGet("EntryLine", OBJPROP_PRICE1);
   double tStopLossLevel = ObjectGet("StopLossLine", OBJPROP_PRICE1);
   ObjectSetText("Entry", "Entry Lvl:    " + DoubleToStr(tEntryLevel, Digits), font_size, font_face, font_color);
   ObjectSetText("StopLoss", "Stop-Loss:    " + DoubleToStr(tStopLossLevel, Digits), font_size, font_face, font_color);

   StopLoss = MathAbs(tEntryLevel - tStopLossLevel);

   if (UseEquityInsteadOfBalance) Size = AccountEquity();
   else Size = AccountBalance();
   ObjectSetText("AccountSize", "Acc. " + SizeText + ": " + DoubleToStr(Size, 2), font_size, font_face, font_color);

   RiskMoney = Size * Risk / 100;
   ObjectSetText("RiskMoney", "Risk, money:  " + DoubleToStr(RiskMoney, 2), font_size, font_face, font_color);

   if (ReferenceType != -1)
   {
      ReferencePrice = MarketInfo(ReferencePair, ReferenceType);
      ObjectSetText("ReferencePair", ReferencePair + " " + ModeText + ":   " + DoubleToStr(ReferencePrice, Digits), font_size, font_face, font_color);
   
      if (ReferenceType == MODE_ASK) UnitCost = 1 / ReferencePrice;
	   else if (ReferenceType == MODE_BID) UnitCost = ReferencePrice;
   }

   PositionSize = (RiskMoney / StopLoss) / 100000 / UnitCost;
   
   ObjectSetText("PositionSize", "Pos. Size:    " + DoubleToStr(PositionSize, 2), font_size + 1, font_face, ps_font_color);
   
   return(0);
}
//+------------------------------------------------------------------+