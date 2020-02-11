#Classification ctrees
#iris data set

library(rpart)
library(rpart.plot)

iris
dim(iris) #check dimensions

#create a sample
s_iris=sample(150,100) #sample 100
s_iris

#Create Test/Training Sets
iris_train=iris[s_iris,]
iris_test=iris[-s_iris,]
dim(iris_test) #50 samples
dim(iris_train) #100 samples

#generate decision tree model
decisionTreeModel=rpart(Species~.,iris_train,method='class')
decisionTreeModel

#plot decision tree model
rpart.plot(decisionTreeModel)
