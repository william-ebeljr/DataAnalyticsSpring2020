# PCA on USArrests dataset (in base R package) 
data("USArrests")

# Rows are the 50 states
states=row.names(USArrests)
states

# Columns are Murder, Assault, UrbanPop, and Rape
names(USArrests)

help("USArrests")
#Arrest numbers are per 100,000
#UrbanPop is a percentage

apply(USArrests, 2, mean) #apply mean to columns to get mean of all states for each category
#Rapes about 3x murders, assaults about 8x rapes

apply(USArrests, 2, var) #apply var to columns to get variance of all states for each category

#Perform PCA
help(prcomp) #scale=TRUE scales variables to unit variance before doing PCA
pr.out=prcomp(USArrests, scale=TRUE)
names(pr.out)

# The center & scale are the mean & std dev of variables used for scaling (prior to PCA.)
pr.out$center
pr.out$scale
# Columns of the rotation matrix contain principle component loadings for a given PC
# We have 4 PCs
pr.out$rotation

# x contains the principle component score vectors (coordinates for each data point in PC space)
dim(pr.out$x)

help("biplot.prcomp")

# Plot projection onto two PC axes:
biplot(pr.out, choices=1:2, scale=0)
# scale=0 ensures arrows are scaled to represent actual loadings
# other scale values give biplots with different meaning

# standard deviations of principal components
pr.out$sdev

# Variance explained by each PC is square of std dev:
pr.var= pr.out$sdev^2
pr.var

# Proportion of total variance explained by each PC:
pve= pr.var/sum(pr.var)
pve
