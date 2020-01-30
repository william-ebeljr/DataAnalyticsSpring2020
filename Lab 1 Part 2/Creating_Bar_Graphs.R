#Creating Bar Graphs
getwd()
labdir<-"C:/Users/ebelw/Documents/RPI/2020_1_Spring/Data Analytics/GitRepo/Lab 1 Part 2"
setwd(labdir)

#default bargraph function
barplot(BOD$demand,names.arg = BOD$Time)

mtcars$cyl
table(mtcars$cyl) #table w/ frequency of occurence
barplot(table(mtcars$cyl)) #bar plot from counts
barplot(mtcars$cyl) #Does NOT work!!

qplot(mtcars$cyl) #plotting continuous numerical value
qplot(factor(mtcars$cyl)) #plotting only represented discrete value
qplot(factor(mtcars$cyl),data=mtcars) #No difference..
#Best, adds count axis
ggplot(mtcars,aes(x=factor(cyl))) + geom_bar()
