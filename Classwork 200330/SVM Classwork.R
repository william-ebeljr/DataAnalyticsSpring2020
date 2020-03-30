#Support Vector Machine (SVM) example using iris dataset
data("iris")
head(iris)

str(iris) 

library(ggplot2)
library(e1071)

qplot(Petal.Length, Petal.Width, data=iris, color = Species)

#Create SVM Model to classify species
help("svm")
svm_model1=svm(Species~., data = iris)

#Model has 51 support vectors, 3 classes
summary(svm_model1)

#Plot petal width vs. petal length
help(plot.svm) #Sepal.width and Sepal.Length are held constant (data projected onto this plane)
plot(svm_model1, data = iris, Petal.Width~Petal.Length, slice = list(Sepal.Width= 3, Sepal.Length= 4))

#Vector of SVM classifications for the data
pred1=predict(svm_model1, iris)

#tabulate svm classification vs. actual class
#A couple mistakes because the dta are not linearly separable
table1=table(Predicted = pred1, Actual = iris$Species)
table1

#Accuracy Rate = 97.3%
Model1_accuracyRate = sum(diag(table1))/sum(table1)
Model1_accuracyRate

#Missclassification rate = 2.7%
Model1_MissClassificationRate = 1 -Model1_accuracyRate
Model1_MissClassificationRate

#Create a second model based on a linear kernel
svm_model2 <-svm(Species~., data = iris, kernel = "linear")

#Model has 54 support vectors
summary(svm_model2)

plot(svm_model2, data = iris, Petal.Width~Petal.Length, slice = list(Sepal.Width= 3, Sepal.Length= 4))

pred2 <-predict(svm_model2, iris)

#5 missclassifications (4 versicolor)
table2 <-table(Predicted = pred2, Actual = iris$Species)
table2

#96.7% accuracy
Model2_accuracyRate = sum(diag(table2))/sum(table2)
Model2_accuracyRate

#3.3% missclassification
Model2_MissClassificationRate = 1 -Model2_accuracyRate
Model2_MissClassificationRate




#Create a third model based on a polynomial kernel
svm_model3 <-svm(Species~., data = iris, kernel = "polynomial")

#Model has 54 support vectors
summary(svm_model3)

plot(svm_model3, data = iris, Petal.Width~Petal.Length, slice = list(Sepal.Width= 3, Sepal.Length= 4))

pred3 <-predict(svm_model3, iris)

#7 missclassifications (all virginica)
table3 <-table(Predicted = pred3, Actual = iris$Species)
table3

#95.3% accuracy
Model3_accuracyRate = sum(diag(table3))/sum(table3)
Model3_accuracyRate

#4.6% missclassification
Model3_MissClassificationRate = 1 -Model3_accuracyRate
Model3_MissClassificationRate

