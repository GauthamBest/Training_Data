
# K-Means Clustering

rm(list = ls())

# reproducible results
set.seed(2)

x=  matrix(rnorm(50*2), ncol=2)

x

plot(x)

x[1:25,1]=x[1:25,1]+3

x

x[1:25,2]=x[1:25,2]-4

x

plot(x)

?kmeans()

km.out= kmeans(x, 2, nstart=20)

km.out$centers

summary(km.out)

km.out$withinss

km.out$cluster

km.out$betweenss

plot(x, col=(km.out$cluster), main="K-Means Clustering Results with K=2", 
     xlab="X", ylab="Y", pch=20, cex=2)


set.seed(4)

km.out=kmeans(x,3,nstart=20)

km.out
x
plot(x, col=(km.out$cluster+1), main="K-Means Clustering Results with K=3", xlab="", ylab="", pch=20, cex=2)

set.seed(3)

km.out=kmeans(x,3,nstart=1)

km.out$withinss

km.out=kmeans(x,3,nstart=20)

km.out$tot.withinss

plot(x, col=(km.out$cluster+1), main="K-Means Clustering Results with K=3", xlab="", ylab="", pch=20, cex=2)


# Hierarchical Clustering

x

?dist
?hclust

hc.complete=hclust(dist(x), method="complete")

summary(hc.complete)

hc.average=hclust(dist(x), method="average")

summary(hc.average)


hc.single=hclust(dist(x), method="single")

par(mfrow=c(1,3))

plot(hc.complete,main="Complete Linkage", xlab="", sub="", cex=.9)
plot(hc.average, main="Average Linkage", xlab="", sub="", cex=.9)
plot(hc.single, main="Single Linkage", xlab="", sub="", cex=.9)

?cutree

cutree(hc.complete, 2)
cutree(hc.average, 2)
cutree(hc.single, 2)

cutree(hc.single, 4)

?scale
x
xsc= scale(x)

xsc

plot(hclust(dist(xsc), method="complete"), main="Hierarchical Clustering with Scaled Features")

x=matrix(rnorm(30*3), ncol=3)

x
dd=as.dist(1-cor(t(x)))

dd

plot(hclust(dd, method="complete"), main="Complete Linkage with Correlation-Based Distance", xlab="", sub="")



# Cluster Analysis 

getwd()
setwd("D:/Official/Data Science/RWORK")
mydata <- read.csv("data/utilities.csv")
str(mydata)
head(mydata)
pairs(mydata)

attach(mydata)
# Scatter plot 
plot(mydata$Fuel_Cost ~ mydata$Sales, data = mydata)

with(mydata,text(mydata$Fuel_Cost ~ mydata$Sales, labels=mydata$Company,pos=4, cex = .7))
head(mydata)

# For cluster analysis we should remove qualitative variables
z = mydata[,-c(1,1)]
z

# Normalize/ Standardize - very Large or very small numbers with respect to individual 
# variables can be misleading, so it is important to bring the data into a similar level

means = apply(z, MARGIN = 2, FUN = mean)

means

sds = apply(z,2,sd)

sds

?scale

nor = scale(z, center=means, scale=sds)

nor

##calculate distance matrix (default is Euclidean distance)
? dist

distance = dist(nor)

distance

head(nor)

# summary(rnorm(10, 2, 4))

print(distance, digits = 3)
# make observations of distance between companies

# Hierarchical agglomerative clustering using default complete linkage 
# each company is initially treated as a single cluster and then based on distance they are grouped together
?hclust

mydata.hclust.c = hclust(distance)
plot(mydata.hclust.c)
plot(mydata.hclust.c,labels=mydata$Company,main='Default from hclust')
plot(mydata.hclust.c,hang=-1)



# Hierarchical agglomerative clustering using "average" linkage 

mydata.hclust.a<-hclust(distance,method="average")
plot(mydata.hclust.a,hang=-1)

# Cluster membership
?cutree
member.c = cutree(mydata.hclust.c,3)
member.a = cutree(mydata.hclust.a,3)

table(member.c, member.a)

#Characterizing clusters 

list(member)
aggregate(nor,list(member),mean)

# Averages in original units
aggregate(mydata[,-c(1,1)],list(member),mean)

# Silhoutte plot - to check health of cluster
library(cluster)
plot(silhouette(cutree(mydata.hclust.c, 3), distance))


# Scree Plot
# gives an overview of all possible clusters
# wss - within group sum of squares
nor

wss <- (nrow(nor)-1)*sum(apply(nor,2,var))
wss

for (i in 2:20) wss[i] <- sum(kmeans(nor, centers=i)$withinss)
plot(1:20, wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares") 


# K-means clustering
kc<- kmeans(nor, 3, nstart = 20)

kc
kc$size

plot(mydata$Sales ~ mydata$D.Demand, col = kc$cluster)


plot(mydata$Fuel_Cost ~ mydata$Sales, col = kc$cluster)

with(mydata,text(mydata$Fuel_Cost ~ mydata$Sales, labels=mydata$Company,pos=4, cex = .7))
