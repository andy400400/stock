dir<-dir('D:/000/ByTime')

head(data,20)

for (aa in 1:length(dir)) {
  data<-read.csv(paste('D:/000/ByTime/',dir[aa],sep = ""))
  
  data_colnames<-colnames(data)
  data_nrow<-nrow(data)
  
  #15分鐘切一段
  start_1<-NULL
  asd1<-0
  asd2<-45
  for (x in 1:data_nrow) {
    #time length = 5
    if (nchar(data$Time[x])==5) {
      sub_5<-as.numeric(substr(data$Time[x],2,3))
      if ((sub_5 %% 15) == 0 & asd1 != sub_5 ) {
        asd1<-sub_5
        start_1<-c(start_1,x)
      }
    }
    #time length = 6
    if (nchar(data$Time[x])==6) {
      sub_6<-as.numeric(substr(data$Time[x],3,4))
      if ((sub_6 %% 15) == 0 & asd2 != sub_6) {
        asd2<-sub_6
        start_1<-c(start_1,x)
      }
    }
  }
  
  #15分鐘中的趨勢
  #各區段
  {
  Time<-NULL
  Open<-NULL
  Close<-NULL
  High<-NULL
  Low<-NULL
  Vol<-NULL
  momentum<-NULL
  momentum.sig<-NULL
  momentum.diff<-NULL
  }
  z_length<-length(start_1)-1
  for (z in 1:z_length) {
    z_start<-start_1[z]
    z_finish<-start_1[z+1]-1
    
    #15分鐘區段
    High_1<-NULL
    Low_1<-NULL
    Vol_1<-NULL
    momentum_1<-NULL
    momentum.sig_1<-NULL
    momentum.diff_1<-NULL
    for (c in z_start:z_finish) {
      High_1<-c(High_1,data$High[c])
      Low_1<-c(Low_1,data$Low[c])
      Vol_1<-c(Vol_1,data$Vol[c])
      momentum_1<-c(momentum_1,data$momentum[c])
      momentum.sig_1<- c(momentum.sig_1,data$momentum.sig[c])
      momentum.diff_1<- c(momentum.diff_1,data$momentum.diff[c])
    }
    Time<-c(Time,data$Time[z_start])
    Open<-c(Open,data$Open[z_start])
    Close<-c(Close,data$Close[z_finish])
    
    High<-c(High,max(High_1))
    Low<-c(Low,max(Low_1))
    Vol<-c(Vol,sum(Vol_1))
    momentum<-c(momentum,sum(momentum_1))
    momentum.sig<-c(momentum.sig,sum(momentum.sig_1))
    momentum.diff<-c(momentum.diff,sum(momentum.diff_1))
  }
  new_data<-cbind(Time,Open,Close,High,Low,Vol,momentum,momentum.sig,momentum.diff)
  write.csv(new_data,paste('D:/00/',dir[aa],sep = ""))
}

  
colnames(data)
  