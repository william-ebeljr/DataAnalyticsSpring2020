# require(C50)
#I looked up require - it returns FALSE/gives a warning on failure
#Library gives an error
#Require is more flexible for use in functions if we check for the failure
library(C50)

data("iris")
head(iris) 
str(iris) 

table(iris$Species) 
# using table() function we can look at the Species of Iris dataset column
#We have 50 of each

# set the seed
set.seed(9850)
# generate random number for each row
grn<-runif(nrow(iris))

grn #Random numbers
order(grn) #indices (1-150) of sorted (ascending) grn
irisrand<-iris[order(grn),] #dataset w/ randomized rows
str(irisrand)

#Create classification model for column 5 (species) using the other columns
#Using the first 100 rows:
classificationmodel1 <-C5.0(irisrand[1:100,-5], irisrand[1:100,5])
classificationmodel1
summary(classificationmodel1)

#Model has no errors but one node is very smal (2 entries)
#Overfitting???

#Now use the last 50 rows as a test set for the model
#Using predict() to classify them
prediction1 <-predict(classificationmodel1,irisrand[101:150,])
prediction1

# we will use the confusion matrix to compare
# prediction to value, looks like 3 errors
table(irisrand[101:150,5],prediction1)

#Can also label the sets
table(TestData=irisrand[101:150,5],Predicted = prediction1)
