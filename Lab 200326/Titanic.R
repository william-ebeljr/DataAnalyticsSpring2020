library(rpart)
library(rpart.plot)

data("Titanic")
help("Titanic")

#4D Array containing observations of the given variables
# D1: Class (1st, 2nd, 3rd, 4th)
# D2: Sex (Male, Female)
# D3: Age (Child, Adult)
# D4: Survived (No, Yes)
str(Titanic)

#I need a dataframe instead of a matrix:
df=as.data.frame(Titanic)
df #This gives me a frequency entry for every variable combination
#But I want one entry per observation

#https://stackoverflow.com/questions/8753531/repeat-rows-of-a-data-frame-n-times/8753732
do.call("rbind", replicate(n, d, simplify = FALSE))

firstRow=TRUE;
for (i in 1:length(df$Class)) {
  if (df$Freq[i]>0) {
    if(firstRow){
      Titanic_df=do.call("rbind", replicate(df$Freq[i], df[i,1:4], simplify = FALSE))
      firstRow=FALSE;
    }
    else {
      Titanic_df=rbind(Titanic_df,do.call("rbind", replicate(df$Freq[i], df[i,1:4], simplify = FALSE)))
    }
  }
}
str(Titanic_df) # Check number of rows
rownames(Titanic_df=1:2201) # overwrite rownames


############################  rpart  #######################################
############################################################################
#Construct and plot tree using rpart
rpart_titanic=rpart(Survived~.,Titanic_df)
rpart.plot(rpart_titanic,type=1)
############################################################################

##########################   ctree   #######################################
############################################################################
#Construct and plot conditional interference tree
ctree_titanic=ctree(Survived~.,data=Titanic_df)
plot(ctree_titanic)
############################################################################


############################ Heatmap #######################################
############################################################################
#in order to do any sort of heatmap, I need to flatten the data down to a 2d data matrix
#I will flatten down into a matrix with 16 rows and 2 columns
#Each row will represent a class of people and each column  will represent survival outcome
#The data in the matrix will represent the frequency of that outcome observed

#First lets convert the titanic data to a matrix and make sure it is ordered as desired:
Titanic_dm=data.matrix(df)
Titanic_dm
#It looks good: the rows are ordered in ascending order of class of people with the MSB being Age
#And the LSB being Class. The first 16 rows contain survived=NO outcomes and the last 16 rows 
#contain Survived=Yes

m=matrix(nrow=16,ncol=2) #Create matrix with desired dimensions
m[1:16,1]=Titanic_dm[1:16,5] #Copy over survived outcomes to first column
m[1:16,2]=Titanic_dm[17:32,5] #copy over did not survive outcomes to second column
m

#Not my favorite way to do this, but it didn't take long..
colnames(m)=c('Survived=NO','Survived=YES')
rownames(m)=c('1st,Male,Child',
              '2nd,Male,Child',
              '3rd,Male,Child',
              'Crew,Male,Child',
              '1st,Female,Child',
              '2nd,Female,Child',
              '3rd,Female,Child',
              'Crew,Female,Child',
              '1st,Male,Adult',
              '2nd,Male,Adult',
              '3rd,Male,Adult',
              'Crew,Male,Adult',
              '1st,Female,Adult',
              '2nd,Female,Adult',
              '3rd,Female,Adult',
              'Crew,Female,Adult')
m
heatmap(m)
#looks pretty saturated, but that probably makes sense

#Let's try removing empty rows and looking at survival percentage instead
m2=m[which(rowSums(m) > 0),] #remove empty rows
m2=m2/rowSums(m2)
m2

heatmap(m2)

#Now we can use hclust
hh=hclust(dist(m2)) #cluster based on euclidean distance matrix
m2_ordered=m2[hh$order,] #Now re-order the matrix based on clustering

heatmap(m2_ordered)
par(mfrow=c(1,2))
image(t(m2_ordered)[, nrow(m2_ordered):1])

plot(m2_ordered[,2]/(m2_ordered[,1]+m2_ordered[,2]),14:1,xlab='% Survived',ylab='Row',pch=19) #pch = 'plot character' = type of point plotted
#It would be nice to show the dendrites on this nicer plot and to indicate which class corresponds to each row (the axes are very misleading)
############################################################################


######################### Random Forest ####################################
############################################################################
fitT = randomForest(Survived~.,   data=Titanic_df)

print(fitT) 	# view results

importance(fitT) # importance of each predictor
varImpPlot(fitT,main='Survival Importance of Titanic Dataset Factors') # plot of importance, sex matters most, age matters least

plot(fitT,main='OOB and classification errors for Titanic Random Forest') # plot of OOB error and classification errors for each class
legend(280,0.55,legend=c('OOB (black)','Survived=Yes (green)','Survived=No (red)'))
############################################################################

