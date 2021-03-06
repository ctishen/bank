// Hello World server in MQ4

#include <Zmq/Zmq.mqh>

extern string t1 = "--- ZeroMQ Configuration ---";
extern bool Publish_MarketData = false;

string Publish_Symbols[15] = {
   "SPX500","XAUUSD","COPPER","US_OIL","JPN225","BTC","CHINAA50","HK50",
   "AUDUSD","GBPUSD","EURUSD","USDCNY","USDCNH","USDHKD" ,"USDJPY"
};
string Publish_CN_Symbols[15] = {
   "标普","黄金","美铜","原油","日经","比特币","中国50","恒指",
   "澳美","镑美","欧美","人民币离","人民币在","美港" ,"美日"
};
ZmqMsg request;

//+------------------------------------------------------------------+
 void OnTick()
  {
   Context context("helloworld");
   Socket socket(context,ZMQ_REP);

   socket.bind("tcp://*:6666");
/*
   if(!IsStopped() && Publish_MarketData == true)
   {

      socket.recv(request);
      Print("Receive: AUDUSD Sell execute");
      Sleep(1000);
      for(int s = 0; s < ArraySize(Publish_Symbols); s++)
      {
         // Python clients can subscribe to a price feed by setting
         // socket options to the symbol name. For example:
         
         string _tick = GetBidAsk(Publish_Symbols[s]);
         Print("Sending " + Publish_Symbols[s] + " " + _tick + " to PUB Socket");
         ZmqMsg reply(StringFormat("%s %s", Publish_Symbols[s], _tick));
         socket.send(reply, true);
      }
   }

*/

   while(!IsStopped())
     {

      socket.recv(request);
      Print("Receive: AUDUSD Sell execute");

      Sleep(1000);

      ZmqMsg reply(Getmsg());//"{"+GetBidAsk("SPX500")+","+GetBidAsk("XAUUSD")+","+GetBidAsk("COPPER")+","+GetBidAsk("US_OIL")+","+GetBidAsk("JPN225")+","+GetBidAsk("BTC")+"}");
      // Send reply back to client
      socket.send(reply);
      Print("Feedback: Trade was executed");
     }
     

  }
//+------------------------------------------------------------------+
string GetBidAsk(string symbol) {
   
   double bid = MarketInfo(symbol, MODE_BID);
   double ask = MarketInfo(symbol, MODE_ASK);
   double pclose =iClose(symbol,PERIOD_D1,1);
   //double open = MarketInfo(symbol, MODE_OPEN);
   double updown =0;
   if(pclose!=0)
   {
      updown=(bid-pclose)/pclose*100;
   }
   return (StringFormat("'%s':%.2f", symbol,bid ));
   
   
   
   //return(StringFormat("%.2f|%f", bid, ask));
}
string Getmsg() {
      string msg = "";
      for(int s = 0; s < ArraySize(Publish_Symbols); s++)
      {
         
         string _tick = GetBidAsk(Publish_Symbols[s]);
         if( StringCompare(_tick,"") )
         {
            Print("Sending " + Publish_Symbols[s] + " " + _tick + ",");
            msg=_tick+","+msg;
         }
         
      }
   
   return(msg);
   
   
   //return(StringFormat("%.2f|%f", bid, ask));
}