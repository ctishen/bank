//+------------------------------------------------------------------+
//|du ShowTradeHis.mq4 |
//| ST小散 liangdawen |
//+------------------------------------------------------------------+
#property copyright "liangdawen"
#property link "ldawen@126.com"
#property indicator_chart_window
string indNames = "";
//+------------------------------------------------------------------+
//| |
//+------------------------------------------------------------------+
int init()
{
return(0);
}
int deinit()
{
DelTradesHis();
ObjectDelete("Show Trade History ");
ObjectDelete("copyright");
return(0);
}
//+------------------------------------------------------------------+
//| |
//+------------------------------------------------------------------+
int start()
{
/*
LabelCreate("ldw1",10,10,"abckmklsjfls");
ArrowCreate("ldwdsf",D'2010.10.01 22:10',1.3675,"safs",Red,3);
ArrowCreate("ld1wdsf",D'2010.10.01 20:10',1.3625,"sasfs",Blue,1);
ArrowCreate("ld1sf",D'2010.10.01 10:10',1.3615,"sasfs",Blue,4);
TrendLineCreate("kslsflksfsl",D'2010.10.01 22:10',1.3675,D'2010.10.01 20:10',1.3625);
*/
static datetime BarTime = 0;
if(BarTime != Time[0])
{
BarTime = Time[0];
LabelCreate("Show Trade History ",10,10,"Show Trade History");
LabelCreate("copyright",25,25,"(liangdawen)");
ShowTrades();
}
return(0);
}
//+------------------------------------------------------------------+
void LabelCreate(string name,int x,int y,string text="-",int size=10,string font="Arial",color colour=Red,int window = 0)
{
if (ObjectFind(indNames+name) == -1)
{
ObjectCreate(indNames+name,OBJ_LABEL,window,0,0);
ObjectSet(indNames+name,OBJPROP_CORNER,1);
ObjectSet(indNames+name,OBJPROP_XDISTANCE,x);
ObjectSet(indNames+name,OBJPROP_YDISTANCE,y);
}
ObjectSetText(indNames+name,text,size,font,colour);
}
void ArrowCreate(string name,datetime dt,double price,string text = "-",color colour=Red,int ArrowType = 1,int window = 0)
{
if (ObjectFind(indNames+name) == -1)
{
ObjectCreate(indNames+name,OBJ_ARROW,window,dt,price);
ObjectSet(indNames+name,OBJPROP_ARROWCODE,ArrowType);
ObjectSet(indNames+name,OBJPROP_COLOR,colour);
}
}
void TrendLineCreate(string name,datetime dt1,double price1,datetime dt2,double price2,color colour=Red,int window = 0)
{
if (ObjectFind(indNames+name) == -1)
{
ObjectCreate(indNames+name,OBJ_TREND,window,dt1,price1,dt2,price2);
ObjectSet(indNames+name,OBJPROP_COLOR,colour);
ObjectSet(indNames+name,OBJPROP_RAY,false);
ObjectSet(indNames+name,OBJPROP_STYLE,STYLE_DOT);
}
}
void ShowTrades()
{
int cnt;
color OpenArrowColor;
color CloseArrowColor;
color StopLossColor;
color LineColor;
string SType = " ";
string text;
int oc = OrdersHistoryTotal();
for(cnt=0;cnt<oc;cnt++)
{
if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY) ==false) continue;
if(OrderSymbol() != Symbol()) continue;
if( OrderType()==OP_SELL )
{
OpenArrowColor = Red;
CloseArrowColor = Violet;
StopLossColor = Red;
LineColor = Red;
}
if( OrderType()==OP_BUY )
{
OpenArrowColor = Blue;
CloseArrowColor = Goldenrod;
StopLossColor = Blue;
LineColor = Blue;
}
if(OrderType() == OP_SELL) SType = "SELL";
if(OrderType() == OP_BUY) SType = "BUY";
string ticket = DoubleToStr(OrderTicket(),0);
double lots = NormalizeDouble(OrderLots(),2);
double op= NormalizeDouble(OrderOpenPrice(),Digits);
double cp = NormalizeDouble(OrderClosePrice(),Digits);
text = StringConcatenate("# ",OrderTicket()," ",SType," ",lots," ",OrderSymbol()," at ",op," ",cp);
ArrowCreate("o "+text,OrderOpenTime(),OrderOpenPrice()," ",OpenArrowColor,1); // --Open arrow
ArrowCreate("c "+text,OrderCloseTime(),OrderClosePrice()," ",CloseArrowColor,3); // --close arrow
ArrowCreate("s "+text,OrderOpenTime(),OrderStopLoss()," ",OpenArrowColor,4); // --stop arrow
TrendLineCreate("l " + text ,OrderOpenTime(),OrderOpenPrice(),OrderCloseTime(),OrderClosePrice(),LineColor); // trendline
} // end for
} //end ShowTrades
void DelTradesHis()
{
int cnt;
string SType = " ";
string text;
int obj_id ;
string obj_name;
int oc = OrdersHistoryTotal();
for(cnt=0;cnt<oc;cnt++)
{
if(OrderSelect(cnt,SELECT_BY_POS,MODE_HISTORY) ==false) continue;
if(OrderSymbol() != Symbol()) continue;
if(OrderType() == OP_SELL) SType = "SELL";
if(OrderType() == OP_BUY) SType = "BUY";
string ticket = DoubleToStr(OrderTicket(),0);
double lots = NormalizeDouble(OrderLots(),2);
double op= NormalizeDouble(OrderOpenPrice(),Digits);
double cp = NormalizeDouble(OrderClosePrice(),Digits);
text = StringConcatenate("# ",OrderTicket()," ",SType," ",lots," ",OrderSymbol()," at ",op," ",cp);
obj_name = "o "+text;
obj_id = ObjectFind(obj_name);
if(obj_id!=-1) ObjectDelete(obj_name); // --Open arrow
obj_name = "c "+text;
obj_id = ObjectFind(obj_name);
if(obj_id!=-1) ObjectDelete(obj_name); // --close arrow
obj_name = "s "+text;
obj_id = ObjectFind(obj_name);
if(obj_id!=-1) ObjectDelete(obj_name); // --stop arrow
obj_name = "l "+text;
obj_id = ObjectFind(obj_name);
if(obj_id!=-1) ObjectDelete(obj_name); // --trendline
} // end for
} //end ShowTrades