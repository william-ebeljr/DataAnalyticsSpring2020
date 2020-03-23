data(Boston, package="MASS")
help(Boston)

help(prcomp)
pca_out=prcomp(Boston,scale. = T) #scale to unit variance before PCA

pca_out #loadings
plot(pca_out) #bar graph of variances

biplot(pca_out, scale = 0) # Biplot (PC1, PC2)
boston_pc=pca_out$x #PC scores for each observation
boston_pc

#One row for each observation
head(boston_pc)
summary(boston_pc)
