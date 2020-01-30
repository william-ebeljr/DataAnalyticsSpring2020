#Multivariate Regression
getwd()
labdir<-"C:/Users/ebelw/Documents/RPI/2020_1_Spring/Data Analytics/GitRepo/Lab 1 Part 2"
setwd(labdir)

#Note: paste adds space, paste0 does not
help(paste)
datadir=paste0(labdir,"/multivariate.csv")
datadir

#Data nice, looks good
multivariate<-read.csv(datadir)
head(multivariate)
attach(multivariate)

#lm is a linear model object
help(lm)
my_lm<-lm(Homeowners~Immigrant)
my_lm
summary(my_lm)
plot(Homeowners~Immigrant) #~ reverses order
plot(Immigrant,Homeowners) #Equivalent

help("abline") #Adds straight line to plot
abline(my_lm)
abline(my_lm,col=2,lwd=3) #change color, line width

newImmigrantdata<-data.frame(Immigrant=c(0,20))
newImmigrantdata
my_lm %>% predict(newImmigrantdata)
#^Predicted homeowners for immigrant values of 0 and 20
#More on pipe operator %>% later

abline(my_lm) #Draws default line over
abline(my_lm,col=3,lwd=3) #change color to green
attributes(my_lm) #structure of linear model object
my_lm$coefficients #linear regression coefficients