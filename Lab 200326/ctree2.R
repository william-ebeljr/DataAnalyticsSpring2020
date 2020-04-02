
require(party)
# Conditional Inference Tree for Mileage
fit2M = ctree(Mileage~Price + Country + Reliability + Type, data=na.omit(cu.summary))
summary(fit2M)
# plot tree
plot(fit2M, uniform=TRUE, main="CI Tree for Mileage ")
