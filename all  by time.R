dir<-dir('D:/000/ByTime')

#變數
{
text_1<-NULL
  
Open_1<-NULL
Close_1<-NULL
High_1<-NULL
Low_1<-NULL
Vol_1<-NULL
momentum.sig_1<-NULL
momentum.diff_1<-NULL

Open_2<-NULL
Close_2<-NULL
High_2<-NULL
Low_2<-NULL
Vol_2<-NULL
momentum.sig_2<-NULL
momentum.diff_2<-NULL
}

head(data,20)
for (aa in 1:length(dir)) {
  text_1<-c(text_1,dir[aa])
  data<-read.csv(paste('D:/000/ByTime/',dir[aa],sep = ""))
  
  data_colnames<-colnames(data)
  data_nrow<-nrow(data)

  #前15
  for (x in 1:data_nrow) {
    if (data$Time[x] == "90000") {
      start_x<-x
    }
  }
  #後15
  for (y in 1:data_nrow) {
    if (data$Time[y] == "133001") {
      start_y<-y
    }
  }
  
  High_1_1<-NULL
  Low_1_1<-NULL
  Vol_1_1<-0
  momentum.sig_1_1<-0
  momentum.diff_1_1<-0
  for (a in 1:start_x) {
    High_1_1<-c(High_1_1,data$High[a])
    Low_1_1<-c(Low_1_1,data$Low[a])
    Vol_1_1<-Vol_1_1+data$Vol[a]
    momentum.sig_1_1<-momentum.sig_1_1+data$momentum.sig[a]
    momentum.diff_1_1<-momentum.diff_1_1+data$momentum.diff[a]
  }
  Open_1<-c(Open_1,data$Open[1])
  Close_1<-c(Close_1,data$Close[start_x])
  High_1<-c(High_1,max(High_1_1))
  Low_1<-c(Low_1,min(Low_1_1))
  Vol_1<-c(Vol_1,Vol_1_1)
  momentum.sig_1<-c(momentum.sig_1,momentum.sig_1_1)
  momentum.diff_1<-c(momentum.diff_1,momentum.diff_1_1)
  
  
  High_2_1<-NULL
  Low_2_1<-NULL
  Vol_2_1<-0
  momentum.sig_2_1<-0
  momentum.diff_2_1<-0
  for (a in start_y:data_nrow) {
    High_2_1<-c(High_2_1,data$High[a])
    Low_2_1<-c(Low_2_1,data$Low[a])
    Vol_2_1<-Vol_2_1+data$Vol[a]
    momentum.sig_2_1<-momentum.sig_2_1+data$momentum.sig[a]
    momentum.diff_2_1<-momentum.diff_2_1+data$momentum.diff[a]
  }
  Open_2<-c(Open_2,data$Open[1])
  Close_2<-c(Close_2,data$Close[start_y])
  High_2<-c(High_2,max(High_2_1))
  Low_2<-c(Low_2, min(Low_2_1))
  Vol_2<-c(Vol_2,Vol_2_1)
  momentum.sig_2<-c(momentum.sig_2,momentum.sig_2_1)
  momentum.diff_2<-c(momentum.diff_2,momentum.diff_2_1)
}


clean_data<-cbind(text_1,Open_1,Close_1,High_1,Low_1,Vol_1,momentum.sig_1,momentum.diff_1,Open_2,Close_2,High_2,Low_2,Vol_2,momentum.sig_2,momentum.diff_2)

View(clean_data)
