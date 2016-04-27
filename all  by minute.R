dir<-dir('D:/000/ByMinute')

ma<-1

{
  file_name<-NULL
  all_filter_Time<-NULL
  all_filter_momentum.sig<-NULL
  all_filter_momentum.diff<-NULL
  all_filter_Vol<-NULL
  all_filter_data_time<-NULL
  all_filter_div_Low<-NULL
  all_filter_div_High<-NULL
}

for (aa in 1:length(dir)) {
  
  data<-read.csv(paste('D:/000/ByMinute/',dir[aa],sep = ""))
  
  head(data)
  data_colnames<-colnames(data)
  data_nrow<-nrow(data)
  #設變數
  {
    Time<-NULL
    Open<-NULL
    High<-NULL
    Low<-NULL
    Close<-NULL
    Vol<-NULL
    momentum<-NULL
    momentum.sig<-NULL
    momentum.ins<-NULL
    momentum.diff<-NULL
  }
  
  for (x in ma:data_nrow) {
    Time<-c(Time,data$Time[x])
    Open<-c(Open,data$Open[x])
    Close<-c(Close,data$Close[x])
    
    ##################################
    High_1<-NULL
    Low_1<-NULL
    High_1<-data$High[(x-ma+1):x]
    Low_1<-data$Low[(x-ma+1):x]
    
    High<-c(High,max(High_1))
    Low<-c(Low,min(Low_1))
    ##################################
    Vol_1<-NULL
    Low_1<-NULL
    momentum.sig_1<-NULL
    momentum.ins_1<-NULL
    momentum.diff_1<-NULL
    Vol_1<-data$Vol[(x-ma+1):x]
    momentum_1<-data$momentum[(x-ma+1):x]
    momentum.sig_1<-data$momentum.sig[(x-ma+1):x]
    momentum.ins_1<-data$momentum.ins[(x-ma+1):x]
    momentum.diff_1<-data$momentum.diff[(x-ma+1):x]
    
    Vol<-c(Vol,sum(Vol_1))
    momentum<-c(momentum,sum(momentum_1))
    momentum.sig<-c(momentum.sig,sum(momentum.sig_1))
    momentum.ins<-c(momentum.ins,sum(momentum.ins_1))
    momentum.diff<-c(momentum.diff,sum(momentum.diff_1))
  }
  #設變數
  {
    div_Low<-NULL
    div_High<-NULL
    data_time<-NULL
  }
  #價差
  for (y in ma:data_nrow) {
    div_1<-data$Low[y]-data$Low[y-1]
    div_Low<-c(div_Low,div_1)
    
    div_2<-data$High[y]-data$High[y-1]
    div_High<-c(div_High,div_2)
    
    data_time<-c(data_time,data$Time[y])
  }
  
  #設變數
  {
    filter_Time<-NULL
    filter_momentum.sig<-NULL
    filter_momentum.diff<-NULL
    filter_Vol<-NULL
    filter_data_time<-NULL
    filter_div_Low<-NULL
    filter_div_High<-NULL
    file_name_1<-NULL
  }
  #############################################################################
  for (z in 1:length(Vol)) {
    #條件
    if (momentum.diff[z]>400) {
      filter_Time<-c(filter_Time,Time[z])
      filter_momentum.sig<-c(filter_momentum.sig,momentum.sig[z])
      filter_momentum.diff<-c(filter_momentum.diff,momentum.diff[z])
      filter_Vol<-c(filter_Vol,Vol[z])
      filter_data_time<-c(filter_data_time,data_time[z])
      filter_div_Low<-c(filter_div_Low,div_Low[z])
      filter_div_High<-c(filter_div_High,div_High[z])
    }
  }
  #############################################################################
  #檔案名稱
  for (bb in 1:length(filter_div_High)) {
    file_name_1<-c(file_name,dir[aa])
  }
  file_name<-c(file_name,file_name_1)
  all_filter_Time<-c(all_filter_Time,filter_Time)
  all_filter_momentum.sig<-c(all_filter_momentum.sig,filter_momentum.sig)
  all_filter_momentum.diff<-c(all_filter_momentum.diff,filter_momentum.diff)
  all_filter_Vol<-c(all_filter_Vol,filter_Vol)
  all_filter_data_time<-c(all_filter_data_time,filter_data_time)
  all_filter_div_Low<-c(all_filter_div_Low,filter_div_Low)
  all_filter_div_High<-c(all_filter_div_High,filter_div_High)
}

you<-cbind(file_name,all_filter_Time,all_filter_momentum.sig,all_filter_momentum.diff,all_filter_Vol,all_filter_data_time,all_filter_div_Low,all_filter_div_High)

#you<-cbind(Time,momentum.sig,momentum.diff,Vol,data_time,div_Low,div_High)
View(you)
