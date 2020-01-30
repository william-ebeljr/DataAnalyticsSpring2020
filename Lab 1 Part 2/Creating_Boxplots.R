#Creating Box-plots
getwd()
labdir<-"C:/Users/ebelw/Documents/RPI/2020_1_Spring/Data Analytics/GitRepo/Lab 1 Part 2"
setwd(labdir)

help(ToothGrowth)
#supplement type = Orange Juice (OJ) or Vitamin C (VC)
#Create Box plot for growth lenth for teeth for each supplement:

#Basic Plot
plot(ToothGrowth$supp,ToothGrowth$len)
boxplot(len~supp,data=ToothGrowth)
boxplot(len~supp+dose,data=ToothGrowth) #split further into doses

#Quick Plot (ggplot)
library(ggplot2)
qplot(ToothGrowth$supp,ToothGrowth$len, geom="boxplot")
#vectors in same data fram:
qplot(supp,len,data=ToothGrowth,geom="boxplot")

#Full ggplot
ggplot(ToothGrowth,aes(x=supp,y=len))+geom_boxplot()

#3 vectors Quick Plot
qplot(interaction(ToothGrowth$supp,ToothGrowth$dose),ToothGrowth$len,geom="boxplot")
#3 vectors ggplot
ggplot(ToothGrowth,aes(x=interaction(supp,dose),y=len))+geom_boxplot()
