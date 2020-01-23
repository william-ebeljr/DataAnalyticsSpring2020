#Creating a dataframe
#Example: RPI Weather dataframe

days<-c('Mon','Tues',"Wed",'Thurs','Fri','Sat','Sun') #days
temp<-c(28,30.5,32,31.2,29.3,27.9,26.4) #temperature in F during winter
snowed<-c('T','T','F','F','T','T','F') #Flag for days snowed
help("data.frame")
RPI_Weather_Week<-data.frame(days,temp,snowed) #create dataframe

RPI_Weather_Week
head(RPI_Weather_Week) #head of the dataframe (Only shows first 6 rows!)

str(RPI_Weather_Week) #look at structrure of dataframe

summary(RPI_Weather_Week) #summary of dataframe

#Select various data from dataframe
RPI_Weather_Week[1,] #show 1st row
RPI_Weather_Week[,1] #show 1st column
RPI_Weather_Week[,'snowed']
RPI_Weather_Week[,'days']
RPI_Weather_Week[,'temp']
RPI_Weather_Week[1:5,c("days","temp")]

#Filter days that have snowed
RPI_Weather_Week$temp
help(subset)
subset(RPI_Weather_Week,subset = snowed=='T') #had to change to 'T' b/c it is not a boolean

#Reorder with days snowed at end
sorted_snowed<-order(RPI_Weather_Week['snowed'])
sorted_snowed
RPI_Weather_Week[sorted_snowed,]

help(order) #search how to change sort order
descending_snow<-order(RPI_Weather_Week['snowed'],decreasing = TRUE)
descending_snow
RPI_Weather_Week[descending_snow,] #now days snowed are first

#Order by descending temp (vector name misleading)
dec_snow<-order(-RPI_Weather_Week$temp)
dec_snow
RPI_Weather_Week[dec_snow,]

#Creating Dataframes
empty_DataFrame <- data.frame()
empty_DataFrame
v1<-1:10
v1
letters
v2<-letters[1:10]
v2
df<-data.frame(col_name_1 = v1, col_name_2=v2)
df

help("write.csv")
getwd() #Found online, path is Windows/System32, don't want to save here
help("setwd")
setwd("C:/Users/ebelw/RStudioWorkspace") #Change woking directory
getwd() #looks good!

write.csv(df,file='saved_df1.csv')
df2 <- read.csv('saved_df1.csv')
df2
