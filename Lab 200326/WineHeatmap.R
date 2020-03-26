# wane data has 14 vars
wine_data<-read.table("http://archive.ics.uci.edu/ml/machine-learning-databases/wine/wine.data", sep= ",")
# No variable names
head(wine_data)

#178 rows, 14 vars
dim(wine_data)

# Add names 
colnames(wine_data)=c("Cvs", "Alcohol", "Malic_Acid", "Ash", "Alkalinity_of_Ash", "Magnesium", "Total_Phenols", "Flavanoids", "NonFlavanoid_Phenols","Proanthocyanins", "Color_Intensity", "Hue", "OD280/OD315_of_Diluted_Wine", "Proline")
head(wine_data) 

# Create a heatmap to check correlation (darker=more correlated)
heatmap(cor(wine_data),Rowv= NA, Colv= NA)

#Factor by cultivars
cultivar_classes=factor(wine_data$Cvs)
cultivar_classes

#normalize variables an perform PCA (do not include cultivar)
wine_data_PCA=prcomp(scale(wine_data[,-1]))

#Result gave us 13 PCs
summary(wine_data_PCA)
