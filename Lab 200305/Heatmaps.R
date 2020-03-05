set.seed(12345) #Set seed
help(par) # Set or query graphical parameters.

par(mar = rep(0.2,4)) #margin as c(bottom,left,top,right)
#rep(0.2,4) creates the vector c(0.2, 0.2, 0.2, 0.2)

#matrix(numbers,nrows) creates 40 rows x 10 columns (400 numbers)
#rnorm picks number following the normal distribution
data_Matrix=matrix(rnorm(400), nrow= 40)
#image displays a color image (x-grid,y-grid,matrix w/ values)
#the image data matrix must be in (x,y) form which is (col,row)
#to get (0,0) at bottom-left, we must transpose and flip horizontal:
#t() transposes the matrix
#nrow(data_Matrix):1 = 40,39,38...3,2,1
image(1:10, 1:40, t(data_Matrix)[,nrow(data_Matrix):1])

#heatmap performs image(t(x)) but also adds dendogram & reorders rows & columns
#The reordering is a heirarchichal clustering method - we don't see muct here b/c data is random
help(heatmap)
par(mar=rep(0.2,4)) #Set margins again
heatmap(data_Matrix) #draw heatmap

help("rbinom")
#binomial function (two outcomes) with specified probability

set.seed(678910)
for(i in 1:40){ #loop through the 40 rows
  coin_Flip=rbinom(1,size=1,prob=0.5) #50% probablility
  if(coin_Flip){
    data_Matrix[i,]=data_Matrix[i,]+rep(c(0,3),each=5) #if the outcome is true, add 0 0 0 0 0 3 3 3 3 3 to this row
  }
}

par(mar= rep(0.2, 4))
image(1:10, 1:40, t(data_Matrix)[, nrow(data_Matrix):1])
#Note some rows are dark on the right half b/c 3 was added
#Some are light all the way across (no change, normalized value is less b/c mean of data is larger)

par(mar=rep(0.2, 4))
heatmap(data_Matrix)
#Now clustering has sorted the pattern, rows with coin flips have moved to the top

help(hclust) #Hierarchical cluster analysis on a set of dissimilarities
# eg. distance matrix of matrix will cluster the rows based on euclidean distance between rows
hh=hclust(dist(data_Matrix)) #cluster based on euclidean distance matrix
#distance matrix calculation:
#matrix is taken row by row with the columns representing coordinates
#so 40 row by 10 column matrix is treated as 40 points in a 10-dimensional space
#euclidean distance is calculated between each pair of points and placed in distance matrix
data_Matrix_Ordered=data_Matrix[hh$order,] #Now re-order the matrix based on clustering
par(mfrow=c(1,3))
image(t(data_Matrix_Ordered)[,nrow(data_Matrix_Ordered):1])
plot(rowMeans(data_Matrix_Ordered),40:1,xlab='The Row Mean',ylab='Row',pch=19) #pch = 'plot character' = type of point plotted
plot(colMeans(data_Matrix_Ordered),xlab='Column',ylab='Column Mean',pch=19)
