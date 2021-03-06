//#property copyright "鱼儿编程 QQ：276687220"
//#property link      "http://babelfish.taobao.com/"
extern bool 是否显示文字标签=true;
extern double 初始单量=1;
extern double 止损=0;
extern double 止盈=0;
extern double 滑点=3;
extern string 备注="20141101 TB babyzihao888";
extern int magic=89870;
extern color 多单颜色标记=Blue;
extern color 空单颜色标记=Red;
extern color 网格颜色标记=clrMaroon;
extern double 连续交易次数=1;
extern double 反向开仓倍数=1;
extern double 最大交易单量=10;
extern double 多空趋势=0;//-1 1多空

//===========================================================================
extern double 格子大小=100;
double price;
  double 离现价最高=0;
  double 离现价最低=0;
extern bool 移动止损开关=true;
extern double 移动止损激活点数=50;
extern double 回调离场距离=100;
//+------------------------------------------------------------------+
//| expert initialization function                                   |
//+------------------------------------------------------------------+
int init()
  {
   SetGrid();
   return(0);
  }
//+------------------------------------------------------------------+
//| expert deinitialization function                                 |
//+------------------------------------------------------------------+
int deinit()
  {
    ClearGrid();
    return(0);
  }
//+------------------------------------------------------------------+
//| expert start function                                            |
//+------------------------------------------------------------------+
int start()
  {
  //----
    
    double 单量=初始单量;
 

 
//单边交易单处理
if(总交易量(OP_BUY,magic)==0)//持有空单
{
  gengzong(-1,回调离场距离,1,移动止损激活点数,magic);
}
if(总交易量(OP_SELL,magic)==0)//持有多单
{
  gengzong(1,回调离场距离,1,移动止损激活点数,magic);
}
  
/*
//双向持仓单，且交易量超过设定值的处理
if(总交易量(OP_BUY,magic)>=最大交易单量||总交易量(OP_SELL,magic)>=最大交易单量)
{
  单量=MathMin(总交易量(OP_SELL,magic),总交易量(OP_BUY,magic));
  delwhat(0,单量/总交易量(OP_BUY,magic) );//多单平仓
  delwhat(1,单量/总交易量(OP_SELL,magic)  );//空单平仓
// delwhat(0,MathAbs(总交易量(OP_BUY,magic)-总交易量(OP_SELL,magic))/总交易量(OP_BUY,magic));//多单平仓
}
*/

//双边交易单且最大单量未超过设定值的处理
if( 总交易量(OP_BUY,magic)>=总交易量(OP_SELL,magic)&&总交易量(OP_BUY,magic)<=最大交易单量)
{
  gengzong(-1,回调离场距离,1,移动止损激活点数,magic);
}
if( 总交易量(OP_BUY,magic)<=总交易量(OP_SELL,magic)&&总交易量(OP_SELL,magic)<=最大交易单量)
{
  gengzong(1,回调离场距离,1,移动止损激活点数,magic);
}


//双边交易且盈利
if(分类单据利润(OP_BUY,magic)+分类单据利润(OP_SELL,magic)>2 && 总交易量(OP_BUY,magic)>0 &&总交易量(OP_SELL,magic)>0) //
{
  单量=MathMin(总交易量(OP_SELL,magic),总交易量(OP_BUY,magic));
  delwhat(0,单量/总交易量(OP_BUY,magic) );//多单平仓
  delwhat(1,单量/总交易量(OP_SELL,magic)  );//空单平仓

}   


// if(移动止损开关==true)
 // {
 // gengzong(0,回调离场距离,1,移动止损激活点数,magic);
//  }






//开仓



//开空
    if(总交易量(OP_BUY,magic)==0&&多空趋势<=0 )//无仓
    {
    
      if(分类单据利润(OP_BUY,magic)<0)
      {
        单量=总交易量(OP_BUY,magic)*反向开仓倍数;
      }
        
      if(分项单据统计(OP_SELL,magic) <连续交易次数) 
      if( 价位是否有单(OP_BUY,Close[0],NormalizeDouble(格子大小*系数()*Point,Digits),magic)==0 && 价位是否有单(OP_SELL,Close[0],NormalizeDouble(格子大小*系数()*Point,Digits),magic)==0 )
      if(Close[0]<=NormalizeDouble(离现价最低,Digits)&&离现价最低!=0)
      {
        建立单据(Symbol(),OP_SELL,单量,0,0,止损,止盈,备注,magic);
      }
      
    }
 
 
    if(总交易量(OP_BUY,magic)<最大交易单量&&总交易量(OP_BUY,magic)>0)//买单量小于最大量
    {
    
      if(分类单据利润(OP_BUY,magic)<0&&多空趋势>=0 )//看多或没有方向则锁仓
      {
        单量=总交易量(OP_BUY,magic)*反向开仓倍数;
      }
      if(分类单据利润(OP_BUY,magic)<0&&多空趋势<0 )//看空则翻倍加仓
      {
        单量=总交易量(OP_BUY,magic)*反向开仓倍数;//*2;
      }
        
      if(分项单据统计(OP_SELL,magic) <连续交易次数) 
      if( 价位是否有单(OP_BUY,Close[0],NormalizeDouble(格子大小*系数()*Point,Digits),magic)==0 && 价位是否有单(OP_SELL,Close[0],NormalizeDouble(格子大小*系数()*Point,Digits),magic)==0 )
      if(Close[0]<=NormalizeDouble(离现价最低,Digits)&&离现价最低!=0)
      {
        建立单据(Symbol(),OP_SELL,单量,0,0,止损,止盈,备注,magic);
      }
      
    }

    if(总交易量(OP_BUY,magic)>=最大交易单量 &&多空趋势<=0 )//////////////////////////////////////
    {

      if(分类单据利润(OP_BUY,magic)<0)
      {
        单量=MathAbs( 总交易量(OP_SELL,magic)-总交易量(OP_BUY,magic) );//MathRound(总交易量(OP_BUY,magic)/3*10)/10;
      }
      //if(总交易量(OP_SELL,magic)==总交易量(OP_BUY,magic))单量=总交易量(OP_BUY,magic);
    
      if(分类单据利润(OP_BUY,magic)<0)
      if(分类单据利润(OP_SELL,magic)>=0)
      //if(分项单据统计(OP_SELL,magic) <反向开仓倍数)
      if(分项单据统计(OP_BUY,magic) <=连续交易次数)
      if( 价位是否有单(OP_BUY,Close[0],NormalizeDouble(格子大小*系数()*Point,Digits),magic)==0 && 价位是否有单(OP_SELL,Close[0],NormalizeDouble(格子大小*系数()*Point,Digits),magic)==0 )
      if(Close[0]<=NormalizeDouble(离现价最低,Digits)&&离现价最低!=0)
      {
        建立单据(Symbol(),OP_SELL,单量,0,0,止损,止盈,备注,magic);
      }  

    }
    

   if(总交易量(OP_SELL,magic)==0&&多空趋势>=0 )//无仓建多单
    {

      if(分类单据利润(OP_SELL,magic)<0)
      {
        单量=总交易量(OP_SELL,magic)*反向开仓倍数;
      }

      if(分项单据统计(OP_BUY,magic) <连续交易次数)
      if( 价位是否有单(OP_BUY,Close[0],NormalizeDouble(格子大小*系数()*Point,Digits),magic)==0 && 价位是否有单(OP_SELL,Close[0],NormalizeDouble(格子大小*系数()*Point,Digits),magic)==0 )
      if(Close[0]>=NormalizeDouble(离现价最高,Digits)&&离现价最高!=0)
      {
        建立单据(Symbol(),OP_BUY,单量,0,0,止损,止盈,备注,magic);
      }
    }

    if(总交易量(OP_SELL,magic)<最大交易单量&&总交易量(OP_SELL,magic)>0)
    {

      if(分类单据利润(OP_SELL,magic)<0  &&多空趋势<=0 )//看空或无方向则锁仓
      {
        单量=总交易量(OP_SELL,magic)*反向开仓倍数;
      }
      if(分类单据利润(OP_SELL,magic)<0  &&多空趋势>0 )//看多则加倍
      {
        单量=总交易量(OP_SELL,magic)*反向开仓倍数;//*2;
      }

      if(分项单据统计(OP_BUY,magic) <连续交易次数)
      if( 价位是否有单(OP_BUY,Close[0],NormalizeDouble(格子大小*系数()*Point,Digits),magic)==0 && 价位是否有单(OP_SELL,Close[0],NormalizeDouble(格子大小*系数()*Point,Digits),magic)==0 )
      if(Close[0]>=NormalizeDouble(离现价最高,Digits)&&离现价最高!=0)
      {
        建立单据(Symbol(),OP_BUY,单量,0,0,止损,止盈,备注,magic);
      }
    }

    if(总交易量(OP_SELL,magic)>=最大交易单量  &&多空趋势>=0 )/////////////////////////////////////////////
    {
      if(分类单据利润(OP_SELL,magic)<0)
      {
      单量=MathAbs( 总交易量(OP_SELL,magic)-总交易量(OP_BUY,magic) );//MathRound(总交易量(OP_SELL,magic)/3*10)/10;
      }
       if(分类单据利润(OP_SELL,magic)<0)
      if(分类单据利润(OP_BUY,magic)>=0)//必须有=
      //if(分项单据统计(OP_BUY,magic) <反向开仓倍数)
      if(分项单据统计(OP_SELL,magic) <=连续交易次数)
      if( 价位是否有单(OP_BUY,Close[0],NormalizeDouble(格子大小*系数()*Point,Digits),magic)==0 && 价位是否有单(OP_SELL,Close[0],NormalizeDouble(格子大小*系数()*Point,Digits),magic)==0 )
      if(Close[0]>=NormalizeDouble(离现价最高,Digits)&&离现价最高!=0)
      {
      建立单据(Symbol(),OP_BUY,单量,0,0,止损,止盈,备注,magic);
      }
    }



  if(Close[0]>=NormalizeDouble(离现价最高,Digits)&&离现价最高!=0)
  {
  ObjectCreate("格子"+price,OBJ_HLINE,0,0,price);
  ObjectSet("格子"+price,OBJPROP_STYLE, STYLE_DOT);
  ObjectSet("格子"+price,OBJPROP_COLOR, 网格颜色标记);
  ObjectDelete("格子"+NormalizeDouble(离现价最高,Digits));
  price=NormalizeDouble(离现价最高,Digits);  
  }

  if(Close[0]<=NormalizeDouble(离现价最低,Digits)&&离现价最低!=0)
  {
  ObjectCreate("格子"+price,OBJ_HLINE,0,0,price);
  ObjectSet("格子"+price,OBJPROP_STYLE, STYLE_DOT);
  ObjectSet("格子"+price,OBJPROP_COLOR, 网格颜色标记);
  ObjectDelete("格子"+NormalizeDouble(离现价最低,Digits));
  price=NormalizeDouble(离现价最低,Digits);
  } 

   离现价最高=0;
   离现价最低=0;
   double 现价=Close[0];
  
  for(int i=0;i<ObjectsTotal();i++)
  if(StringFind(ObjectName(i),"格子",0)==0)
  {
     if(ObjectGet(ObjectName(i),OBJPROP_PRICE1)>=现价)
     if(离现价最高==0||离现价最高>ObjectGet(ObjectName(i),OBJPROP_PRICE1))
     离现价最高=ObjectGet(ObjectName(i),OBJPROP_PRICE1);

     if(ObjectGet(ObjectName(i),OBJPROP_PRICE1)<现价)
     if(离现价最低==0||离现价最低<ObjectGet(ObjectName(i),OBJPROP_PRICE1))
     离现价最低=ObjectGet(ObjectName(i),OBJPROP_PRICE1);  
  }

      
Comment(
  "\n平台商:"+AccountCompany()+" 杠杆:"+DoubleToStr(AccountLeverage(),0)+
  "\n------------------------------------"+
  "\n多单个数:"+分项单据统计(OP_BUY,magic)+
  "\n多单获利:"+DoubleToStr(分类单据利润(OP_BUY,magic),2)+
  "\n多单手数:"+DoubleToStr(总交易量(OP_BUY,magic),2)+
  "\n------------------------------------"+
  "\n空单个数:"+分项单据统计(OP_SELL,magic)+
  "\n空单获利:"+DoubleToStr(分类单据利润(OP_SELL,magic),2)+
  "\n空单手数:"+DoubleToStr(总交易量(OP_SELL,magic),2)+
  "\n------------------------------------"+
  "\n浮动盈亏:"+DoubleToStr(分类单据利润(OP_BUY,magic)+分类单据利润(OP_SELL,magic),2)+
  "\n账户净值:"+DoubleToStr(AccountEquity(),2)+
  "\n账户余额:"+DoubleToStr(AccountBalance(),2)+
 "\n------------------------------------"+
  "\n上方线:"+DoubleToStr(离现价最高,Digits)+
  "\n下方线:"+DoubleToStr(离现价最低,Digits)+
  "\n下方线:"+DoubleToStr(Close[0]-NormalizeDouble(50*Point,Digits),Digits)+
  "\n距离差:"+DoubleToStr(iATR(NULL,0,14,0),Digits)
  );

  
//----
   return(0);
  }
  
  
  
  
  
  
  
//函数  
  
  
  
  
  
  
  
//+------------------------------------------------------------------+

void SetGrid()
{

//----
   //price=NormalizeDouble(Close[0],Digits);//以最新价价作为起点
   price=NormalizeDouble(iOpen(Symbol(), PERIOD_W1, 0),Digits); //以当周开盘价作为起点
  
   for(int i=0;i<1000000;i++)
   {
      int 位置=NormalizeDouble((i*Point-price)/Point,0);
      int 格子=格子大小*系数();
      if(位置%格子==0)
      {
        ObjectCreate("格子"+NormalizeDouble(i*Point,Digits),OBJ_HLINE,0,0,NormalizeDouble(i*Point,Digits)); 
        ObjectSet("格子"+NormalizeDouble(i*Point,Digits),OBJPROP_STYLE, STYLE_DOT);
        ObjectSet("格子"+NormalizeDouble(i*Point,Digits),OBJPROP_COLOR, 网格颜色标记);
      }  
   }
   ObjectDelete("格子"+price);
//----
}

void ClearGrid()
{

//----
  for(int i=0;i<ObjectsTotal();i++)
  {
     if(StringFind(ObjectName(i),"格子",0)==0)
     {
       ObjectDelete(ObjectName(i));
       i--;
     }
  }    
//----

}


void gengzong(int 买卖方向,int 保持距离,int 跳跃距离,int 启动距离,int c)
{
   if(保持距离!=0)
   for(int i=0;i<OrdersTotal();i++)
   {
      if(OrderSelect(i,SELECT_BY_POS))
      if(OrderSymbol()==Symbol())
      if(OrderMagicNumber()==c||c==-1)
      {
      RefreshRates();
      double a=OrderClosePrice();

         if(OrderType()==OP_BUY&&买卖方向>=0)
         if(a-OrderOpenPrice()>启动距离*Point*系数())
         if(a-(保持距离+跳跃距离)*Point*系数()>=OrderStopLoss()||OrderStopLoss()==0)
         {
         繁忙等待组件();
         OrderModify(OrderTicket(),OrderOpenPrice(),a-保持距离*Point*系数(),OrderTakeProfit(),0);
         报错组件("");
         }

         if(OrderType()==OP_SELL&&买卖方向<=0)
         if(OrderOpenPrice()-a>启动距离*Point*系数())
         if(a+(保持距离+跳跃距离)*Point*系数()<=OrderStopLoss()||OrderStopLoss()==0)
         {
         繁忙等待组件();
         OrderModify(OrderTicket(),OrderOpenPrice(),a+保持距离*Point*系数(),OrderTakeProfit(),0); 
         报错组件("");
         }
      }
   }
}




double 系数()
{
   int 系数=1;
   if(Digits==3||Digits==5||(StringFind(Symbol(),"XAU",0)==0&&Digits==2)||(StringFind(Symbol(),"GOLD",0)==0&&Digits==2))系数=10;
   if(StringFind(Symbol(),"XAU",0)==0&&Digits==3)系数=100;  
return(系数);
}



void laber(string a,color b)
{
   if(是否显示文字标签==true)
   {
   ObjectDelete("箭头"+TimeToStr(Time[0],TIME_DATE|TIME_MINUTES)+a);
   ObjectCreate("箭头"+TimeToStr(Time[0],TIME_DATE|TIME_MINUTES)+a,OBJ_TEXT,0,Time[0],Low[0]);
   ObjectSetText("箭头"+TimeToStr(Time[0],TIME_DATE|TIME_MINUTES)+a,a,8,"Times New Roman",b);
   }
}



int 分项单据统计(int a,int magic)
{
int buy=0,sell=0,buyl=0,selll=0,buys=0,sells=0;
   for(int i=0;i<OrdersTotal();i++)
   {
      if(OrderSelect(i,SELECT_BY_POS))
      if(OrderSymbol()==Symbol())
      if(OrderMagicNumber()==magic|| magic ==-1)
      switch(OrderType())
      {
      case OP_BUY:
      buy++;
      break;
      case OP_SELL:
      sell++;
      break;
      case OP_BUYLIMIT:
      buyl++;
      break;
      case OP_BUYSTOP:
      buys++;
      break;
      case OP_SELLSTOP:
      sells++;
      break;
      case OP_SELLLIMIT:
      selll++;
      break;
      }
   }
   
   switch(a)
   {
   case OP_BUY:
   return(buy);
   case OP_SELL:
   return(sell);
   case OP_BUYLIMIT:
   return(buyl);
   case OP_BUYSTOP:
   return(buys);
   case OP_SELLLIMIT:
   return(selll);
   case OP_SELLSTOP:
   return(sells);
   }
}

double 价位是否有单(int type,double 现价,double 范围,int magic)
{
  double bp,sp;
   for(int i=0;i<OrdersTotal();i++)
   {
     if(OrderSelect(i,SELECT_BY_POS))
     if(OrderSymbol()==Symbol())
     if(OrderMagicNumber()==magic||magic==-1)
     if(OrderType()==type)
     {
      if (OrderOpenPrice()>现价-范围 && OrderOpenPrice()<现价+范围)
      {
        bp=OrderTicket();
        break;
      }else
      {
        bp=0;
        continue;
      }
     }
   }
     //if(bp>0)Print(DoubleToStr(bp,5));
     return (bp);
    // }else
    // {
    //   return(0);
    // }
}

double 分类单据利润(int a,int magic)
{
   double 利润=0;
   for(int i=0;i<OrdersTotal();i++)
   if(OrderSelect(i,SELECT_BY_POS))
   if(OrderSymbol()==Symbol())
   if(OrderMagicNumber()==magic||magic==-1)
   if(OrderType()==a)
   利润+=OrderProfit()+OrderSwap()+OrderCommission() ;
return(利润);
}

double 总交易量(int type,int a)
{
   double js=0;
   for(int i=0;i<OrdersTotal();i++)
   if(OrderSelect(i,SELECT_BY_POS))
   if(OrderSymbol()==Symbol())
   if(OrderMagicNumber()==a|| a ==-1)
   if(OrderType()==type)
   js+=OrderLots();

return(js);
}


int 建立单据(string 货币对,int 类型,double 单量,double 价位,double 间隔,double 止损,double 止盈,string 备注,int magic)
{
   int t;
   int i;
   double zs,zy;
   double POINT=MarketInfo(货币对,MODE_POINT)*系数();
   int 滑点2=滑点*系数();
   价位=NormalizeDouble(价位,MarketInfo(货币对,MODE_DIGITS));
   if(类型==OP_BUY)
   {
      i=0;
      while(true)
      {
      繁忙等待组件();
      RefreshRates();
      t=OrderSend(货币对,OP_BUY,单量,MarketInfo(货币对,MODE_ASK),滑点2,0,0,备注,magic,0,多单颜色标记);
         if(t>0)  break;        
      报错组件("");
         if(i>=3)  break; 
      i++;
      }           
      if(OrderSelect(t,SELECT_BY_TICKET))
      {
         if(止损!=0&&止盈!=0)
         {
            i=0;
            while(true)
            {         
            繁忙等待组件();
               if(OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice()-止损*POINT,OrderOpenPrice()+止盈*POINT,0))  break;
            报错组件(""); 
            if(i>=3)  break; 
            i++;
            }
         }
         if(止损==0&&止盈!=0)
         {
            i=0;
            while(true)
            {         
            繁忙等待组件();
               if(OrderModify(OrderTicket(),OrderOpenPrice(),0,OrderOpenPrice()+止盈*POINT,0))  break;
            报错组件(""); 
            if(i>=3)  break; 
            i++;
            }
         }
         if(止损!=0&&止盈==0)
         {
            i=0;
            while(true)
            {  
            繁忙等待组件();
               if(OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice()-止损*POINT,0,0))  break;
            报错组件("");
               if(i>=3)  break; 
            i++;
            }
         }
      } 
   }

   if(类型==OP_SELL)
   {
      i=0;
      while(true)
      {
      繁忙等待组件();
      RefreshRates();
      t=OrderSend(货币对,OP_SELL,单量,MarketInfo(货币对,MODE_BID),滑点2,0,0,备注,magic,0,空单颜色标记);
         if(t>0)  break;        
      报错组件("");
         if(i>=3)  break; 
      i++;
      }           
      if(OrderSelect(t,SELECT_BY_TICKET))
      {
         if(止损!=0&&止盈!=0)
         {
            i=0;
            while(true)
            {         
            繁忙等待组件();
               if(OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice()+止损*POINT,OrderOpenPrice()-止盈*POINT,0))  break;
            报错组件(""); 
               if(i>=3)  break; 
            i++;
            }
         }
         if(止损==0&&止盈!=0)
         {
            i=0;
            while(true)
            {         
            繁忙等待组件();
               if(OrderModify(OrderTicket(),OrderOpenPrice(),0,OrderOpenPrice()-止盈*POINT,0))  break;
            报错组件(""); 
               if(i>=3)  break; 
            i++;
            }
         }
         if(止损!=0&&止盈==0)
         {
            i=0;
            while(true)
            {  
            繁忙等待组件();
               if(OrderModify(OrderTicket(),OrderOpenPrice(),OrderOpenPrice()+止损*POINT,0,0))  break;
            报错组件("");
               if(i>=3)  break; 
            i++;
            }
         }
      } 
   }


   if(类型==OP_BUYLIMIT||类型==OP_BUYSTOP)
   {
      if(价位==0)
      {
      RefreshRates();
      价位=MarketInfo(货币对,MODE_ASK);
      }   

      i=0;
      while(true)
      {  
      繁忙等待组件();
         if(类型==OP_BUYLIMIT)
         {
            if(止损!=0&&止盈!=0)
            t=OrderSend(货币对,OP_BUYLIMIT,单量,价位-间隔*POINT,滑点2,价位-间隔*POINT-止损*POINT,价位-间隔*POINT+止盈*POINT,备注,magic,0,多单颜色标记); 
            if(止损==0&&止盈!=0)
            t=OrderSend(货币对,OP_BUYLIMIT,单量,价位-间隔*POINT,滑点2,0,价位-间隔*POINT+止盈*POINT,备注,magic,0,多单颜色标记); 
            if(止损!=0&&止盈==0)
            t=OrderSend(货币对,OP_BUYLIMIT,单量,价位-间隔*POINT,滑点2,价位-间隔*POINT-止损*POINT,0,备注,magic,0,多单颜色标记); 
            if(止损==0&&止盈==0)
            t=OrderSend(货币对,OP_BUYLIMIT,单量,价位-间隔*POINT,滑点2,0,0,备注,magic);            
         }     
         if(类型==OP_BUYSTOP)
         {
            if(止损!=0&&止盈!=0)
            t=OrderSend(货币对,OP_BUYSTOP,单量,价位+间隔*POINT,滑点2,价位+间隔*POINT-止损*POINT,价位+间隔*POINT+止盈*POINT,备注,magic,0,多单颜色标记); 
            if(止损==0&&止盈!=0)
            t=OrderSend(货币对,OP_BUYSTOP,单量,价位+间隔*POINT,滑点2,0,价位+间隔*POINT+止盈*POINT,备注,magic,0,多单颜色标记); 
            if(止损!=0&&止盈==0)
            t=OrderSend(货币对,OP_BUYSTOP,单量,价位+间隔*POINT,滑点2,价位+间隔*POINT-止损*POINT,0,备注,magic,0,多单颜色标记); 
            if(止损==0&&止盈==0)
            t=OrderSend(货币对,OP_BUYSTOP,单量,价位+间隔*POINT,滑点2,0,0,备注,magic,0,多单颜色标记);             
         } 
         if(t>0)  break;     
      报错组件("");
         if(i>=3)  break; 
      i++;
      }
   }   

   if(类型==OP_SELLLIMIT||类型==OP_SELLSTOP)
   {
      if(价位==0)
      {
      RefreshRates();
      价位=MarketInfo(货币对,MODE_BID);
      }

      i=0;
      while(true)
      {  
         繁忙等待组件();
         if(类型==OP_SELLSTOP)
         {
            if(止损!=0&&止盈!=0)
            t=OrderSend(货币对,OP_SELLSTOP,单量,价位-间隔*POINT,滑点2,价位-间隔*POINT+止损*POINT,价位-间隔*POINT-止盈*POINT,备注,magic,0,空单颜色标记); 
            if(止损==0&&止盈!=0)
            t=OrderSend(货币对,OP_SELLSTOP,单量,价位-间隔*POINT,滑点2,0,价位-间隔*POINT-止盈*POINT,备注,magic,0,空单颜色标记); 
            if(止损!=0&&止盈==0)
            t=OrderSend(货币对,OP_SELLSTOP,单量,价位-间隔*POINT,滑点2,价位-间隔*POINT+止损*POINT,0,备注,magic,0,空单颜色标记);
            if(止损==0&&止盈==0)
            t=OrderSend(货币对,OP_SELLSTOP,单量,价位-间隔*POINT,滑点2,0,0,备注,magic,0,空单颜色标记); 
         }     
         if(类型==OP_SELLLIMIT)
         {
            if(止损!=0&&止盈!=0)
            t=OrderSend(货币对,OP_SELLLIMIT,单量,价位+间隔*POINT,滑点2,价位+间隔*POINT+止损*POINT,价位+间隔*POINT-止盈*POINT,备注,magic,0,空单颜色标记); 
            if(止损==0&&止盈!=0)
            t=OrderSend(货币对,OP_SELLLIMIT,单量,价位+间隔*POINT,滑点2,0,价位+间隔*POINT-止盈*POINT,备注,magic,0,空单颜色标记); 
            if(止损!=0&&止盈==0)
            t=OrderSend(货币对,OP_SELLLIMIT,单量,价位+间隔*POINT,滑点2,价位+间隔*POINT+止损*POINT,0,备注,magic,0,空单颜色标记); 
            if(止损==0&&止盈==0)
            t=OrderSend(货币对,OP_SELLLIMIT,单量,价位+间隔*POINT,滑点2,0,0,备注,magic,0,空单颜色标记); 
         } 
            if(t>0)  break;     
         报错组件("");
            if(i>=3)  break; 
         i++;
      }
   }   
return(t);
}
//-----------------------------------------
void 繁忙等待组件()
{
while (!IsTradeAllowed() && IsTradeContextBusy()) Sleep(100);
RefreshRates();
}





//-----------------------------------定单操作函数版本1.3------------------------------------------------------
//m取值0、1、2、3、4、5、6、7//0-5表示定单类型//6表示所有//也可以指定某个定单号//7表示清理所有挂单
//1.0版本 0表示多单平仓、1表示空单平仓、2表示BUYLIMIT、3表示SELLLIMIT、4表示BUYSTOP、5表示SELLSTOP
//1.1版本 继承1.0版本所有功能，加入6删除所有挂单，平仓所有成交定单
//1.2版本 继承1.1版本功能，加入7删除所有挂单
//问题反馈 93334898@qq
bool delwhat(int m ,double lots)
{
bool trueorfalse;
if(m > 100000) 
{
if(OrderSelect(m,SELECT_BY_TICKET,MODE_TRADES) == true)
{ 
if(OrderType() == 0)
{
trueorfalse = OrderClose(OrderTicket(),OrderLots()*lots,Bid,滑点,Yellow); //平仓操作
return(trueorfalse);
} else if(OrderType() == 1)
{
trueorfalse = OrderClose(OrderTicket(),OrderLots()*lots,Ask,滑点,Yellow);//平仓操作
return(trueorfalse);
} else if(OrderType() > 1)
{
trueorfalse = OrderDelete(OrderTicket()); //删除挂单操作
return(trueorfalse);
}
} 
else 
{
Print("赋予删除函数的参数数值无效，请检查");
//MT_SpeechText("赋予删除函数的参数数值无效，请检查",1);
}
} 
if (-1 < m < 8)
{
for(int b=0;b<=OrdersTotal();b++) //循环建立一系列数字为序列号
{
if (OrderSelect(b,SELECT_BY_POS,MODE_TRADES) == false) break;//根据系列号抓取定单，失败打断该操作
if(m == 0) //如果参数m的值为0，表示如果抓取的当前定单为buy单
{
if(OrderType()==0)
{
trueorfalse = OrderClose(OrderTicket(),OrderLots()*lots,Bid,滑点,CLR_NONE); //平仓操作
return(trueorfalse);
} else {} //返回操作结果，成功为1，失败为0

} else if(m == 1) //抓取sell单
{
if(OrderType()==1)
{
trueorfalse = OrderClose(OrderTicket(),OrderLots()*lots,Ask,滑点,CLR_NONE);//平仓操作
return(trueorfalse);
} else {}
//返回操作结果 
} else if(m > 1 && m < 6 ) //抓取4种挂单
{
if(OrderType()>1 && OrderType() == m)
{
trueorfalse = OrderDelete(OrderTicket()); //删除挂单操作
return(trueorfalse);
} else {} 
//返回操作结果
} else if(m == 6) //表示需要删除所有挂单，平仓所有多和空单
{
if(OrderType() == 0)
{
trueorfalse = OrderClose(OrderTicket(),OrderLots()*lots,Bid,滑点,CLR_NONE);//平仓操作
return(trueorfalse); //返回操作结果
} else if (OrderType() == 1)
{
trueorfalse = OrderClose(OrderTicket(),OrderLots()*lots,Ask,滑点,CLR_NONE);//平仓操作
return(trueorfalse); //返回操作结果
} else if(OrderType()>1)
{
trueorfalse = OrderDelete(OrderTicket()); //删除挂单操作
return(trueorfalse);
}
} else if(m == 7)
{
if(OrderType()>1)
{
trueorfalse = OrderDelete(OrderTicket()); //删除挂单操作 
return(trueorfalse);
} else {} 
}

}
}
}
//------------------------------------------------------------------------------------------------------------------------



//------------------------------------
void 报错组件(string a)
{
int t=GetLastError();
string 报警;
   if(t!=0)
   switch (t)
   {
   case 0:报警="错误代码:"+0+"没有错误返回";break;
   case 1:报警="错误代码:"+1+"没有错误返回但结果不明";break;
   case 2:报警="错误代码:"+2+"一般错误";break;
   case 3:报警="错误代码:"+3+"无效交易参量";break;
   case 4:报警="错误代码:"+4+"交易服务器繁忙";break;
   case 5:报警="错误代码:"+5+"客户终端旧版本";break;
   case 6:报警="错误代码:"+6+"没有连接服务器";break;
   case 7:报警="错误代码:"+7+"没有权限";break;
   case 8:报警="错误代码:"+8+"请求过于频繁";break;
   case 9:报警="错误代码:"+9+"交易运行故障";break;
   case 64:报警="错误代码:"+64+"账户禁止";break;
   case 65:报警="错误代码:"+65+"无效账户";break;
   case 128:报警="错误代码:"+128+"交易超时";break;
   case 129:报警="错误代码:"+129+"无效价格";break;
   case 130:报警="错误代码:"+130+"无效停止";break;
   case 131:报警="错误代码:"+131+"无效交易量";break;
   case 132:报警="错误代码:"+132+"市场关闭";break;
   case 133:报警="错误代码:"+133+"交易被禁止";break;
   case 134:报警="错误代码:"+134+"资金不足";break;
   case 135:报警="错误代码:"+135+"价格改变";break;
   case 136:报警="错误代码:"+136+"开价";break;
   case 137:报警="错误代码:"+137+"经纪繁忙";break;
   case 138:报警="错误代码:"+138+"重新开价";break;
   case 139:报警="错误代码:"+139+"定单被锁定";break;
   case 140:报警="错误代码:"+140+"只允许看涨仓位";break;
   case 141:报警="错误代码:"+141+"过多请求";break;
   case 145:报警="错误代码:"+145+"因为过于接近市场，修改否定";break;
   case 146:报警="错误代码:"+146+"交易文本已满";break;
   case 147:报警="错误代码:"+147+"时间周期被经纪否定";break;
   case 148:报警="错误代码:"+148+"开单和挂单总数已被经纪限定";break;
   case 149:报警="错误代码:"+149+"当对冲备拒绝时,打开相对于现有的一个单置";break;
   case 150:报警="错误代码:"+150+"把为反FIFO规定的单子平掉";break;
   case 4000:报警="错误代码:"+4000+"没有错误";break;
   case 4001:报警="错误代码:"+4001+"错误函数指示";break;
   case 4002:报警="错误代码:"+4002+"数组索引超出范围";break;
   case 4003:报警="错误代码:"+4003+"对于调用堆栈储存器函数没有足够内存";break;
   case 4004:报警="错误代码:"+4004+"循环堆栈储存器溢出";break;
   case 4005:报警="错误代码:"+4005+"对于堆栈储存器参量没有内存";break;
   case 4006:报警="错误代码:"+4006+"对于字行参量没有足够内存";break;
   case 4007:报警="错误代码:"+4007+"对于字行没有足够内存";break;
   case 4008:报警="错误代码:"+4008+"没有初始字行";break;
   case 4009:报警="错误代码:"+4009+"在数组中没有初始字串符";break;
   case 4010:报警="错误代码:"+4010+"对于数组没有内存";break;
   case 4011:报警="错误代码:"+4011+"字行过长";break;
   case 4012:报警="错误代码:"+4012+"余数划分为零";break;
   case 4013:报警="错误代码:"+4013+"零划分";break;
   case 4014:报警="错误代码:"+4014+"不明命令";break;
   case 4015:报警="错误代码:"+4015+"错误转换(没有常规错误)";break;
   case 4016:报警="错误代码:"+4016+"没有初始数组";break;
   case 4017:报警="错误代码:"+4017+"禁止调用DLL ";break;
   case 4018:报警="错误代码:"+4018+"数据库不能下载";break;
   case 4019:报警="错误代码:"+4019+"不能调用函数";break;
   case 4020:报警="错误代码:"+4020+"禁止调用智能交易函数";break;
   case 4021:报警="错误代码:"+4021+"对于来自函数的字行没有足够内存";break;
   case 4022:报警="错误代码:"+4022+"系统繁忙 (没有常规错误)";break;
   case 4050:报警="错误代码:"+4050+"无效计数参量函数";break;
   case 4051:报警="错误代码:"+4051+"无效参量值函数";break;
   case 4052:报警="错误代码:"+4052+"字行函数内部错误";break;
   case 4053:报警="错误代码:"+4053+"一些数组错误";break;
   case 4054:报警="错误代码:"+4054+"应用不正确数组";break;
   case 4055:报警="错误代码:"+4055+"自定义指标错误";break;
   case 4056:报警="错误代码:"+4056+"不协调数组";break;
   case 4057:报警="错误代码:"+4057+"整体变量过程错误";break;
   case 4058:报警="错误代码:"+4058+"整体变量未找到";break;
   case 4059:报警="错误代码:"+4059+"测试模式函数禁止";break;
   case 4060:报警="错误代码:"+4060+"没有确认函数";break;
   case 4061:报警="错误代码:"+4061+"发送邮件错误";break;
   case 4062:报警="错误代码:"+4062+"字行预计参量";break;
   case 4063:报警="错误代码:"+4063+"整数预计参量";break;
   case 4064:报警="错误代码:"+4064+"双预计参量";break;
   case 4065:报警="错误代码:"+4065+"数组作为预计参量";break;
   case 4066:报警="错误代码:"+4066+"刷新状态请求历史数据";break;
   case 4067:报警="错误代码:"+4067+"交易函数错误";break;
   case 4099:报警="错误代码:"+4099+"文件结束";break;
   case 4100:报警="错误代码:"+4100+"一些文件错误";break;
   case 4101:报警="错误代码:"+4101+"错误文件名称";break;
   case 4102:报警="错误代码:"+4102+"打开文件过多";break;
   case 4103:报警="错误代码:"+4103+"不能打开文件";break;
   case 4104:报警="错误代码:"+4104+"不协调文件";break;
   case 4105:报警="错误代码:"+4105+"没有选择定单";break;
   case 4106:报警="错误代码:"+4106+"不明货币对";break;
   case 4107:报警="错误代码:"+4107+"无效价格";break;
   case 4108:报警="错误代码:"+4108+"无效定单编码";break;
   case 4109:报警="错误代码:"+4109+"不允许交易";break;
   case 4110:报警="错误代码:"+4110+"不允许长期";break;
   case 4111:报警="错误代码:"+4111+"不允许短期";break;
   case 4200:报警="错误代码:"+4200+"定单已经存在";break;
   case 4201:报警="错误代码:"+4201+"不明定单属性";break;
   case 4202:报警="错误代码:"+4202+"定单不存在";break;
   case 4203:报警="错误代码:"+4203+"不明定单类型";break;
   case 4204:报警="错误代码:"+4204+"没有定单名称";break;
   case 4205:报警="错误代码:"+4205+"定单坐标错误";break;
   case 4206:报警="错误代码:"+4206+"没有指定子窗口";break;
   case 4207:报警="错误代码:"+4207+"定单一些函数错误";break;
   case 4250:报警="错误代码:"+4250+"错误设定发送通知到队列中";break;
   case 4251:报警="错误代码:"+4251+"无效参量- 空字符串传递到SendNotification()函数";break;
   case 4252:报警="错误代码:"+4252+"无效设置发送通知(未指定ID或未启用通知)";break;
   case 4253:报警="错误代码:"+4253+"通知发送过于频繁";break;
   }
   if(t!=0)
   {
   Print(报警);
   laber(报警,Yellow);
   }
} 