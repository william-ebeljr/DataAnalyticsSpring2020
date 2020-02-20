library(e1071)
classifier=naiveBayes(iris[,1:4],iris[,5])
table(predict(classifier,iris[,-5]),iris[,5],dnn=list('predicted','actual'))
classifier$apriori
classifier$tables$Petal.Length

#Plot a normal distribution for the petal lengths
#For each species based on mean & standard deviation
plot(function(x) dnorm(x,1.462,0.173664),0,8,col='red',
     main='Petal length distribution for the 3 different species')
curve(dnorm(x,4.26,0.469911),add=TRUE,col='blue')
curve(dnorm(x,5.552,0.5518947),add=TRUE,col='green')

#This must be an approximation..
#Real data is not normal distribution
