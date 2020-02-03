#Multivariate Regression
getwd()
labdir<-"C:/Users/ebelw/Documents/RPI/2020_1_Spring/Data Analytics/GitRepo/Classwork 200203"
setwd(labdir)

#Note: paste adds space, paste0 does not
help(paste)
datadir=paste0(labdir,"/multivariate.csv")
datadir

#Data nice, looks good
multivariate<-read.csv(datadir)
head(multivariate)
attach(multivariate)

#Create Linear Model:
#Dependent Variable = %Immigrants
#Independent Variables:
#Income
#Population
#Homeowners/Population
#Population density

#This is correct according to the model
HP<-Homeowners/Population
PD<-Population/area
IP<-100*Immigrant/Population
my_lm2<-lm(IP~Income+Population+HP+PD)
my_lm2
summary(my_lm2)
#Very good Fit!

#This is how the coefficients in the slides were generated
#Note this is incorrect (% population density???)
HP<-100*Homeowners/Population
PD<-100*Population/area
my_lm<-lm(Immigrant~Income+Population+HP+PD)
my_lm
summary(my_lm)
#Very poor fit!

