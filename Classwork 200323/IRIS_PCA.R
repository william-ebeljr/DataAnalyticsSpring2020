data("iris")
head(iris)

# dataset with only sepal & petal dimensions (no species):
irisdata1=iris[,1:4]
irisdata1
head(irisdata1)

help("princomp") #Does PCA on numeric data matrix, returns princomp object
principal_components=princomp(irisdata1, cor= TRUE, score = TRUE)
# cor=TRUE: use correlation matrix instead of covariance matrix (requires no constant variables)
# score=TRUE: calculate score for each PC

summary(principal_components)
# std dev, individual proportion variance, cumulative proportion of variance for the resulting components (we have 4 here)

# plot(prin_comp) gives bar graph of variances
plot(principal_components)

# change type to 'l' for line graph
plot(principal_components, type = "l")

help("biplot.princomp")
biplot(principal_components)#Default scale is 1
biplot(principal_components,choices=1:2,scale=0)#Scale of zero
#when the scale is 0, the arrows (original feature axes projected onto 2 PC axis, 
#with tick marks top & right in red) have length equal to the feature means
#The actual PC scores of each observation is plotted (ticks in black, left & bottom)
#
#when the scale is 1, the variables are larger and observations are smaller
#but I do not know how to interpret...