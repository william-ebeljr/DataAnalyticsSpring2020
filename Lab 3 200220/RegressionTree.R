library(rpart)
library(rpart.plot)
library(ggplot2) #Needed for msleep dataset

data("msleep")
str(msleep)
help("msleep")

str(data)
# create data frame with the following columns included:
# 3 = -vore,6=sleep_total, 10=brainwt, 11=bodywt
mSleepDF1 <-msleep[,c(3,6,10,11)]

str(mSleepDF1)
head(mSleepDF1)

# Building Regression Decision Tree with rpart
help("rpart")
# Create regression decision tree using ANOVA for sleep total from other vars
sleepModel_1 <-rpart(sleep_total~ ., data=mSleepDF1, method = "anova")

#Print tree structure to console
sleepModel_1

#Use rpart.plot to plot the regression tree
help("rpart.plot")

# type = 3, Draw separate split labels for the left and right directions. 
#fallen.leaves= TRUE, Puts leaves at the bottom of the plot
#Digits [defaults to 2], number of significant digits displayed
rpart.plot(sleepModel_1, type = 3, fallen.leaves= TRUE)

#Change Digits to show 3 and 4 sig figs
rpart.plot(sleepModel_1, type = 3,digits = 3, fallen.leaves= TRUE) 
rpart.plot(sleepModel_1, type = 3,digits = 4, fallen.leaves= TRUE)
