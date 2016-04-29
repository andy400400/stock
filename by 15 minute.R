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
#for (aa in 1:length(dir)) {
  text_1<-c(text_1,dir[aa])
  data<-read.csv(paste('D:/000/ByTime/',dir[aa],sep = ""))
  
  data_colnames<-colnames(data)
  data_nrow<-nrow(data)
  
  #前15
  for (x in 1:data_nrow) {
    
    if (nchar(data$Time[x])==5) {
      if ((as.numeric(substr(data$Time[x],2,3)) %% 15) == 0) {
        
      }
    }
    
    if (nchar(data$Time[x])==6) {
      if ((as.numeric(substr(data$Time[x],3,4)) %% 15) == 0) {
        
      }
    }
    
    
  }
 
  
  
  
  