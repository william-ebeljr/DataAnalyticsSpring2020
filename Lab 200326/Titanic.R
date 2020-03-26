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
      a=do.call("rbind", replicate(df$Freq[i], df[i,1:4], simplify = FALSE))
      firstRow=FALSE;
    }
    else {
      a=rbind(a,do.call("rbind", replicate(df$Freq[i], df[i,1:4], simplify = FALSE)))
    }
  }
}

ctree=rpart(Survived~.,a)

rpart.plot(ctree)
