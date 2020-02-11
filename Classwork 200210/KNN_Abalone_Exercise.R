#abalone dataset from UCI repository
#read dataset from URL:
abalone=read.csv(url("https://archive.ics.uci.edu/ml/machine-learning-databases/abalone/abalone.data"),header = FALSE,sep=",")

#Col names
colnames(abalone)=c('sex','length','diameter','height','whole_weight','shucked_weight','viscera_weight','shell_weight','rings')

summary(abalone)
str(abalone)
summary(abalone$rings)

#Rings 1-29
#Break into 3 groups (<8, 8-11, >11)
abalone$rings=as.numeric(abalone$rings)
abalone$rings=cut(abalone$rings,br=c(-1,8,11,35),labels=c('young','adult','old'))
abalone$rings=as.factor(abalone$rings)
summary(abalone$rings)

#Remove 'sex' (can't use non-numeric for KNN)
aba=abalone
aba$sex=NULL
str(aba)

#normalization function
normalize=function(x){
  return ((x-min(x))/(max(x)-min(x)))
}

#normalize the data
aba[1:7]=as.data.frame(lapply(aba[1:7],normalize))
summary(aba$shucked_weight)

#Split data into test/training sets
ind=sample(2,nrow(aba),replace=TRUE,prob=c(0.7,0.3))
KNNtrain=aba[ind==1,]
KNNtest=aba[ind==2,]

#make k=sqrt(training_observations)
sqrt(2918) #54.02 > Use 55 (odd)
library(class)
help("knn")
KNNpred=knn(train=KNNtrain[1:7],test=KNNtest[1:7],cl=KNNtrain$rings,k=55)
KNNpred
table(KNNpred)

#Check error rate
KNNtest
sum(KNNpred!=KNNtest$rings)
length(KNNpred)
error_rate=sum(KNNpred!=KNNtest$rings)/length(KNNpred)
error_rate #32% is high!!

#try with varying k:
error_rate=NULL
for (i in 1:100) {
  set.seed(101)
  KNNpred=knn(train=KNNtrain[1:7],test=KNNtest[1:7],cl=KNNtrain$rings,k=i)
  error_rate[i]=sum(KNNpred!=KNNtest$rings)/length(KNNpred)
}

error_rate

# Plot the K value on a graph
library(ggplot2)
k_values <- 1:100

error_df <- data.frame(error_rate, k_values)
print(error_df)
ggplot(error_df,aes(k_values,error_rate)) + geom_point() + geom_line(lty='dotted', color='blue')


