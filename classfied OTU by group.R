taxspe<-read.csv("./菌属简化/OTU_V1.csv",header = T,row.names = 1,stringsAsFactors = F,check.names = F)   #读取OTU原始文件
spe<-taxspe[-c(1:6)]   #去除物种信息，仅保留otu序号
group<-read.csv("./菌属简化/group.csv",header = T,check.names = F,stringsAsFactors = F)         #读取全部分组信息

#A101部分数据处理
OUT_V1<-taxspe[,group$Sample]
library(tidyverse)   #加载包
write_excel_csv(OUT_V1,"./OTU_V1.csv") #生成csv文件，该函数可以避免中文乱码
speA1<-spe[,groupA1$SampleID]    #获取A101部分患者的OTU
write.csv(speA1,"./001-16S堆叠图/A1/OTU-A1.csv")   #保存A101的OTU信息

#BC部分数据处理
group_BC<-subset(group,group=="BC")  #获取BC患者所有状态的分组信息
group_BC<-subset(group_BC,state=="V1"|state=="A101"|state=="A201"|state=="A301"|state=="A401"|state=="5101") #获取BC患者中V和A101状态的信息
library(tidyverse)   #加载包
write_excel_csv(group_BC,"./001-16S堆叠图/BC内部/group_BC.csv")  #生成csv文件，该函数可以避免中文乱码
spe_BC<-spe[,group_BC$SampleID]  #获取BC部分患者的OTU
write.csv(spe_BC,"./001-16S堆叠图/BC内部/spe_BC.csv")   #保存BC的OTU信息

#BC-V1部分数据处理
group_BC<-subset(group,group=="BC")  #获取BC患者所有状态的分组信息
group_BC<-subset(group_BC,state=="V1") #获取BC患者中V1状态的信息
library(tidyverse)   #加载包
write_excel_csv(group_BC,"./001-16S堆叠图/BC内部/生物燃料与吸烟的对比/group_BC.csv")  #生成csv文件，该函数可以避免中文乱码
spe_BC<-spe[,group_BC$SampleID]  #获取BC部分患者的OTU
write.csv(spe_BC,"./001-16S堆叠图/BC内部/生物燃料与吸烟的对比/spe_BC.csv")   #保存BC的OTU信息
