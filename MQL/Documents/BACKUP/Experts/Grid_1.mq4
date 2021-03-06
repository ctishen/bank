//+------------------------------------------------------------------+

//|                                                      Grid1.1.mq4 |

//|                                          Copy* 顺势加码 2006 |

//|                                                |

//+------------------------------------------------------------------+

#property copyright "Copy* 顺势加码 2006 外汇联盟收集整理"

#property link      "service@fxunion.com"

#include <stdlib.mqh>



extern double GridStep=50;        //格幅

extern double GridLength=100;   //格长

double PivotPr, Multiple, i, Lots=0.1, STOPLEVEL, TP, ST;

string Text="Grid";

int Magic, j, BuyCount, SellCount, DTS, Ticket;

//+------------------------------------------------------------------+

int init()    //初始化部分将定义参数赋值: 每次在start里面都可能被赋值一次，消耗时间
{
   if (DTS==4)  DTS=2;

       else  DTS=0;

    Magic =105;

    GridStep =GridStep*Point;

    GridLength =GridLength*Point;

    STOPLEVEL =MarketInfo(Symbol(),MODE_STOPLEVEL)*Point;

    return(0);

   
}


//+------------------------------------------------------------------+

int start()

{

    Multiple =NormalizeDouble((Bid-NormalizeDouble(Bid,DTS))/GridStep, 0); // 评rint 检查这地方出值为0  

    PivotPr =NormalizeDouble(Bid,DTS) +GridStep*Multiple;

    // 下网格布网

    for(i=PivotPr; i>=PivotPr-GridLength; i=i-GridStep)

       {

        BuyCount=0; SellCount=0;

        for(j=0; j<OrdersTotal(); j++)

           {

            if(OrderSelect(j,SELECT_BY_POS)==false) return(0);

  

            if(OrderMagicNumber()==Magic && NormalizeDouble(OrderOpenPrice(),DTS)==NormalizeDouble(i,DTS) )

              {

               if(OrderType()==OP_BUY || OrderType()==OP_BUYLIMIT )    BuyCount++;

               if(OrderType()==OP_SELL || OrderType()==OP_SELLSTOP )     SellCount++;

              }

           }

        if(BuyCount==0)

           {

            TP =i+GridStep; ST=0;

            if(Ask-i>=STOPLEVEL)

              {

              Ticket =OrderSend(Symbol(),OP_BUYLIMIT,Lots,i,0,ST,TP,"Grid - BuyLimit",Magic,0,0);

              if (Ticket>0) Alert(Symbol()," ",Ticket,"Grid -   BuyLimit=",i," 开仓成功");

                else Alert( Symbol(),"Grid - BuyLimit=",i," 开仓失败:",ErrorDescription(GetLastError()));

              Sleep(10000);

              }

           if(Ask==i)

              {

               Ticket=OrderSend(Symbol(),OP_BUY,Lots,i,0,ST,TP,"Grid - Buy",Magic,0,0);

               if (Ticket>0) Alert(Symbol()," ",Ticket,"Grid -   Buy=",i," 开仓成功");

               else Alert( Symbol(),"Grid - Buy=",i," 开仓失败:",ErrorDescription(GetLastError()));

               Sleep(10000);

             }

          }

      /* if(SellCount==0)

          {

           TP=i-GridStep;ST=0;

           if(Bid-i>=STOPLEVEL)

             {

              Ticket=OrderSend(Symbol(),OP_SELLSTOP,Lots,i,0,ST,TP,"Grid - SellStop",Magic,0,0);

              if (Ticket>0) Alert(Symbol()," ",Ticket,"Grid -   SellStop=",i," 开仓成功");

              else Alert( Symbol(),"Grid - SellStop=",i," 开仓失败:",ErrorDescription(GetLastError()));

              Sleep(10000);

             }

           if(Bid==i)

             {

              Ticket=OrderSend(Symbol(),OP_SELL,Lots,i,0,ST,TP,"Grid - Sell",Magic,0,0);

              if (Ticket>0) Alert(Symbol()," ",Ticket,"Grid -   BuyLimit=",i," 开仓成功");

              else Alert( Symbol(),"Grid - BuyLimit=",i," 开仓失败:",ErrorDescription(GetLastError()));

              Sleep(10000);

             }

          }*/

      }   

  

   // 上网格布网

   for(i=PivotPr+GridStep;i<=PivotPr+GridLength;i=i+GridStep)

      {

  

       BuyCount=0;SellCount=0;

       for(j=0;j<OrdersTotal();j++)

          {

           if(OrderSelect(j,SELECT_BY_POS)==false) return(0);

           if(OrderMagicNumber()==Magic && NormalizeDouble(OrderOpenPrice(),DTS)==NormalizeDouble(i,DTS) )

             {

              if(OrderType()==OP_BUY || OrderType()==OP_BUYSTOP)    BuyCount++;   

              if(OrderType()==OP_SELL || OrderType()==OP_SELLLIMIT)  SellCount++;

             }

          }

      /* if(BuyCount==0)

          {

           TP=i+GridStep;ST=0;

           if(i-Ask>=STOPLEVEL)

             {Ticket=OrderSend(Symbol(),OP_BUYSTOP,Lots,i,0,ST,TP,"Grid +  BuyStop",Magic,0,0);

              if (Ticket>0) Alert(Symbol()," ",Ticket,"Grid +    BuyStop=",i," 开仓成功");

              else Alert( Symbol(),"Grid +  BuyStop=",i," 开仓失败:",ErrorDescription(GetLastError()));

              Sleep(10000);

             }

           if(i==Ask)

             {

             Ticket=OrderSend(Symbol(),OP_BUY,Lots,i,0,ST,TP,"Grid +  Buy",Magic,0,0);

             if(Ticket>0) Alert(Symbol(),"  ",Ticket,"Grid +   Buy=",i," 开仓成功");

             else Alert( Symbol(),"Grid +  Buy=",i," 开仓失败:",ErrorDescription(GetLastError()));

             Sleep(10000);

            }

         }*/

     if(SellCount==0)

         {

          TP=i-GridStep;ST=0;

          if(i-Bid>=STOPLEVEL)

            {

            Ticket=OrderSend(Symbol(),OP_SELLLIMIT,Lots,i,0,ST,TP,"Grid +  SellLimit",Magic,0,0);

            if (Ticket>0) Alert(Symbol()," ",Ticket,"Grid +    SellLimit=",i," 开仓成功");

            else Alert( Symbol(),"Grid +  SellLimit=",i," 开仓失败:",ErrorDescription(GetLastError()));

            Sleep(10000);

            }  

          if(i==Bid)

            {

            Ticket=OrderSend(Symbol(),OP_SELL,Lots,i,0,ST,TP,"Grid + Sell",Magic,0,0);

            if(Ticket>0) Alert(Symbol(),"  ",Ticket,"Grid +    Sell=",i," 开仓成功");

            else Alert( Symbol(),"Grid +  Sell=",i," 开仓失败:",ErrorDescription(GetLastError()));

            Sleep(10000);

            }

         }

    }

   

//----

   return(0);

}

//+------------------------------------------------------------------+