getwd()
setwd("C:/Users/ebelw/Documents/RPI/2020_1_Spring/Data Analytics/GitRepo/Lab 1")

help(read.csv)
EPI_data <- read.csv(file.choose(),skip = 1,fill=FALSE,na.strings = "..",blank.lines.skip = TRUE)
attach(EPI_data)

EPI
summary(EPI) #Has lots of NA's
EPI_Filter<-complete.cases(EPI) #vector of rows w/o NA
EPI_Filtered<-EPI[EPI_Filter] #Index filled rows
summary(EPI_Filtered) #Same data w/o NA's

fivenum(EPI,na.rm=TRUE)
fivenum(EPI) #Produces same result! Must just help with speed to strip out NAs?

stem(EPI)#Stem Plot

######## Histograms #############
hist(EPI)
help(hist)
hist(EPI,breaks=seq(30,95,1),prob=TRUE) #set spacing, use density (area=1)
help(lines)
help(density)
lines(density(EPI,na.rm=TRUE,bw=1)) #bandwith=1, jagged line
lines(density(EPI,na.rm=TRUE,bw="SJ")) #automatic bandwidth, smoother line
rug(EPI) #Add rug
################################

help(ecdf) #creates ecdf function object, plotting only - don't use for data storage
help(plot)
plot(ecdf(EPI),do.points=FALSE,verticals=TRUE,main="ECDF of EPI",sub="Empirical Cumulative Density Function",xlab="EPI",ylab="ecdf(EPI)")

help(par)
par(pty='s') #Used to set/get plot parameters, this sets plot region to square
#Must replot after setting plot parameter:
plot(ecdf(EPI),do.points=FALSE,verticals=TRUE,main="ECDF of EPI",sub="Empirical Cumulative Density Function",xlab="EPI",ylab="ecdf(EPI)")


##########Q-Q Plots#############
help(qqnorm)
qqnorm(EPI) #Creates Q-Q plot against the normal distribution
#Notice slight curvature - data skewed
qqline(EPI) #Adds line through quantiles

help(qt) #Creates a Student t Distribution
x<-seq(30,95,1)
qqplot(qt(ppoints(250),df=5),x,xlab="Q-Q plot for t dsn")
qqline(x)


################# DALY #######################
DALY
summary(DALY) #Has lots of NA's
DALY_Filter<-complete.cases(DALY) #vector of rows w/o NA
DALY_Filtered<-DALY[DALY_Filter] #Index filled rows
summary(DALY_Filtered) #Same data w/o NA's

fivenum(DALY)

stem(DALY)#Data 0 to 92

hist(DALY)
hist(DALY,breaks=seq(0,95,1.5),prob=TRUE) #set spacing, use density (area=1)

lines(density(DALY,na.rm=TRUE,bw=1)) #bandwidth = 1
lines(density(DALY,na.rm=TRUE,bw="SJ")) #automatic bandwidth, smoother line
rug(DALY) #Add rug

plot(ecdf(DALY),do.points=FALSE,verticals=TRUE,main="ECDF of DALY",sub="Empirical Cumulative Density Function",xlab="DALY",ylab="ecdf(DALY)")

qqnorm(DALY) #Creates Q-Q plot against the normal distribution
#S-Shape means tails are thicker than normal distribution
qqline(DALY) #Adds line through quantiles

################# WATER_H #######################
WATER_H
summary(WATER_H) #Has lots of NA's
WATER_H_Filter<-complete.cases(WATER_H) #vector of rows w/o NA
WATER_H_Filtered<-WATER_H[WATER_H_Filter] #Index filled rows
summary(WATER_H_Filtered) #Same data w/o NA's

fivenum(WATER_H)

stem(WATER_H)#Data 0 to 92

hist(WATER_H)
hist(WATER_H,breaks=seq(0,100,2),prob=TRUE) #set spacing, use density (area=1)

lines(density(WATER_H,na.rm=TRUE,bw=1)) #bandwidth = 1
lines(density(WATER_H,na.rm=TRUE,bw="SJ")) #automatic bandwidth, smoother line
rug(WATER_H) #Add rug

plot(ecdf(WATER_H),do.points=FALSE,verticals=TRUE,main="ECDF of WATER_H",sub="Empirical Cumulative Density Function",xlab="WATER_H",ylab="ecdf(WATER_H)")

qqnorm(WATER_H) #Creates Q-Q plot against the normal distribution
#S-Shape favoring right means right tail is thicker than normal distribution
qqline(WATER_H) #Adds line through quantiles

detach(EPI_data)
