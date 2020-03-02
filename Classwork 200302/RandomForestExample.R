library(randomForest)

#Load Data
data1=read.csv(file.choose(),header=TRUE)
head(data1)

colnames(data1)=c('BuyingPrice','Maintenance','NumDoors','NumPersons','BootSpace','Safety','Condition')
head(data1)
str(data1)

#Look at 4 factors for Conditions
levels(data1$Condition)
summary(data1)

#Creat training (70%) and validation (30%) data
set.seed(100)
train=sample(nrow(data1),0.7*nrow(data1),replace=FALSE)
TrainSet=data1[train,]
ValidSet=data1[-train,]
summary(TrainSet)
summary(ValidSet)

help("randomForest") #Documentation
#Default Parameters
model1=randomForest(Condition ~ ., data=TrainSet, importance=TRUE)
model1
#default # of trees is 500 if unspecified, default mtry=2
#Mtry = number of variables tried at each split

model2=randomForest(Condition ~ ., data=TrainSet, ntree=500, mtry=6, importance=TRUE)
model2
#Here # trees is still 500 but mtry is set to 6

#Assesment of Model 1
#Prediction on Training Data
predTrain=predict(model1,TrainSet,type='class')
table(predTrain,TrainSet$Condition)
#Prediction on Validation Data
predValid=predict(model1,ValidSet,type='class')
table(predValid,ValidSet$Condition)
#Check and plot important variables with importance & varImpPlot
importance(model1)
varImpPlot(model1)

#Assesment of Model 2
#Prediction on Training Data
predTrain=predict(model2,TrainSet,type='class')
table(predTrain,TrainSet$Condition)
#Prediction on Validation Data
predValid=predict(model2,ValidSet,type='class')
table(predValid,ValidSet$Condition)
#Check and plot important variables with importance & varImpPlot
importance(model2)
varImpPlot(model2)

a=c()
i=5
for(i in 3:8){
  model3=randomForest(Condition ~ ., data=TrainSet, ntree=500, mtry=i, importance=TRUE)
  predValid=predict(model3,ValidSet,type='class')
  a[i-2]=mean(predValid==ValidSet$Condition)
}
a
plot(3:8,a)
title('MSE vs mtry for Random Forest (max mtry=6)')

#Note that there are only 6 variables that we can try (there are 7 variables total including the condition)
#For this reason, we get a warning in the above loop when i=7 or 8 which says that the mtry is reset to within
#The valid range. This means that i=6,7,8 are all models with mtry=6 and it does not make sense to do this...
#In any case, mtrys=6 certainly shows significant improvement over mtrys<6
