#Creating Plots
getwd()
labdir<-"C:/Users/ebelw/Documents/RPI/2020_1_Spring/Data Analytics/GitRepo/Lab 1 Part 2"
setwd(labdir)

plot(mtcars$wt,mtcars$mpg)
install.packages("ggplot2")
install.packages("lifecycle") #Apparently need this too
library(ggplot2)

#Quick plot - from ggplot library
help(qplot)
qplot(mtcars$wt,mtcars$mpg)
qplot(wt,mpg,data=mtcars) #uses dataframe column names for axes

#GGplot - make same graph
ggplot(mtcars,aes(x=wt,y=mpg))+geom_point()

#plot a function
#Create plot (note:default is points)
plot(pressure$temperature,pressure$pressure, type="l")
#Add points
points(pressure$temperature,pressure$pressure)
lines(pressure$temperature,pressure$pressure/2,col="red")
points(pressure$temperature,pressure$pressure/2, col="blue")
title("Plot a function from data")

library(ggplot2)
#quickplot
qplot(pressure$temperature,pressure$pressure,geom="line")
#quickplot with column names on axes
qplot(temperature,pressure, data=pressure,geom="line")
#Use ggplot to add line and points
ggplot(pressure, aes(x=temperature,y=pressure))+geom_line()+geom_point()