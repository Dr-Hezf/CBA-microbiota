taxspe<-read.csv("./菌属简化/OTU_V1.csv",header = T,row.names = 1,stringsAsFactors = F,check.names = F)   #OTU
spe<-taxspe[-c(1:6)]   #remove taxa information
group<-read.csv("./菌属简化/group.csv",header = T,check.names = F,stringsAsFactors = F)         

#A101
OUT_V1<-taxspe[,group$Sample]
library(tidyverse)  
write_excel_csv(OUT_V1,"./OTU_V1.csv") 
speA1<-spe[,groupA1$SampleID]    #acquired A101 subgroup
write.csv(speA1,"./001-16S堆叠图/A1/OTU-A1.csv")   


group_BC<-subset(group,group=="BC") 
group_BC<-subset(group_BC,state=="V1"|state=="A101"|state=="A201"|state=="A301"|state=="A401"|state=="5101") 
library(tidyverse)  
write_excel_csv(group_BC,"./001-16S堆叠图/BC内部/group_BC.csv")  
spe_BC<-spe[,group_BC$SampleID]  
write.csv(spe_BC,"./001-16S堆叠图/BC内部/spe_BC.csv")  


group_BC<-subset(group,group=="BC")  
group_BC<-subset(group_BC,state=="V1") 
library(tidyverse)  
write_excel_csv(group_BC,"./001-16S堆叠图/BC内部/生物燃料与吸烟的对比/group_BC.csv")  
spe_BC<-spe[,group_BC$SampleID]  
write.csv(spe_BC,"./001-16S堆叠图/BC内部/生物燃料与吸烟的对比/spe_BC.csv")   
