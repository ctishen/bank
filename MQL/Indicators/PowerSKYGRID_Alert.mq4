#property indicator_chart_window

extern int 间隔分钟=60;

datetime NextTime=0;

int start() {

if( TimeLocal()>NextTime) { SendNotification( TimeToStr(TimeCurrent())+" "+DoubleToStr(AccountEquity(),2));

NextTime=TimeLocal()+间隔分钟*60;

}

return(0);

}