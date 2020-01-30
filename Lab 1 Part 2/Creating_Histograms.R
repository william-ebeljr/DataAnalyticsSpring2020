#Creating Histograms
getwd()
labdir<-"C:/Users/ebelw/Documents/RPI/2020_1_Spring/Data Analytics/GitRepo/Lab 1 Part 2"
setwd(labdir)

#Basic Histogram
hist(mtcars$mpg)
hist(mtcars$mpg, breaks=10)
hist(mtcars$mpg, breaks=5)
hist(mtcars$mpg, breaks=12)

#GGPlot Histograms
qplot(mpg,data=mtcars,binwidth=4)
ggplot(mtcars,aes(x=mpg))+geom_histogram(binwidth = 4)
ggplot(mtcars,aes(x=mpg))+geom_histogram(binwidth = 5)
