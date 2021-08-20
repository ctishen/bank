// Hello World server in MQ4

#include <Zmq/Zmq.mqh>

//+------------------------------------------------------------------+
 void OnTick()
  {
   Context context("helloworld");
   Socket socket(context,ZMQ_REP);

   socket.bind("tcp://*:5556");

   while(!IsStopped())
     {
      ZmqMsg request;

      // Wait for next request from client

      // MetaTrader note: this will block the script thread
      // and if you try to terminate this script, MetaTrader
      // will hang (and crash if you force closing it)

      socket.recv(request);
      Print("Receive: AUDUSD Sell execute");

      Sleep(1000);

      ZmqMsg reply(GetBidAsk("SPX500")+"|"+GetBidAsk("XAUUSD")+"|"+GetBidAsk("COPPER")+"|"+GetBidAsk("US_OIL")+"|"+GetBidAsk("JPN225")+"|"+GetBidAsk("BTC"));
      // Send reply back to client
      socket.send(reply);
      Print("Feedback: Trade was executed");
     }
  }
//+------------------------------------------------------------------+
string GetBidAsk(string symbol) {
   
   double bid = MarketInfo(symbol, MODE_BID);
   double ask = MarketInfo(symbol, MODE_ASK);
   return(StringFormat("%.0f", bid));
   
   //return(StringFormat("%.2f|%f", bid, ask));
}
