library(e1071)
set.seed(1)

#20x2 matrix of 20 2D observations
#y=observation classes
x=matrix(rnorm(20*2), ncol=2)
y=c(rep(-1,10), rep(1,10))
x[y==1,]=x[y==1,] + 1
x
y

#plot observations color-coded by class
plot(x, col=(3-y))

#make a data frame
dat=data.frame(x = x,y= as.factor(y))
dat

#Perform SVM fit and plot results(easy b/c 2d)
svmfit=svm(y ~., data=dat, kernel="linear", cost=10,scale=FALSE)
plot(svmfit, dat, color.palette = cm.colors)

#ID of support vectors
svmfit$index

#basic info
summary(svmfit)

#Lower cost, more rigid boundary
svmfit<-svm(y ~., data=dat, kernel="linear", cost = 0.1, scale=FALSE)
plot(svmfit, dat, color.palette = cm.colors)
svmfit$index

set.seed(1)
tune.out=tune(svm,y~.,data=dat,kernal='linear',ranges=list(cost=c(0.001,0.01,0.1,1,5,10,100)))
summary(tune.out)
#best error is for cost = 10 or 100

#tune gives best model: cost = 10
bestmod=tune.out$best.model
summary(bestmod)

#Create some test observations
xtest=matrix(rnorm(20*2),ncol=2)
ytest=sample(c(-1,1),20,rep=T)
xtest[ytest==1,]=xtest[ytest==1,]+1
testdat=data.frame(x=xtest, y=as.factor(ytest))

#Predict and tabulate results
ypred=predict(bestmod,testdat)
table(predict=ypred, truth=testdat$y)

#Try again with lower cost (0.01)
svmfit<-svm(y~., data=dat, kernel="linear", cost=.01, scale=FALSE)
ypred=predict(svmfit,testdat)
table(predict=ypred, truth=testdat$y) #one more is misclassified, makes sense

#Now try linearly seperable:
x[y==1,]=x[y==1,]+0.5
plot(x, col=(y+5)/2, pch=19)

#Use large cost value so all are classified
dat=data.frame(x=x,y=as.factor(y))
svmfit=svm(y~., data=dat, kernel="linear", cost=1e5)
summary(svmfit)
plot(svmfit,dat,color.palette = cm.colors)
#Might misclassify test data

#Lower cost function, one observation misclassified
svmfit=svm(y~., data=dat, kernel="linear", cost=1)
summary(svmfit)
plot(svmfit,dat,color.palette = cm.colors)


library(e1071)
library(ISLR)

#x holds gene expression values
#y holds cancer tumor type
#Both are split into test & training data
names(Khan)
help(Khan)

dim(Khan$xtrain)
dim(Khan$xtest)

length(Khan$ytrain)
length(Khan$ytest)
table(Khan$ytrain)
table(Khan$ytest)

dat=data.frame(x=Khan$xtrain, y = as.factor(Khan$ytrain))
out=svm(y ~., data=dat, kernel="linear",cost=10)
summary(out)

dat.te=data.frame(x=Khan$xtest, y = as.factor(Khan$ytest))
pred.te=predict(out, newdata=dat.te)
table(pred.te, dat.te$y)
#So cost=10 yielded 2 error out of 20, 10% error rate