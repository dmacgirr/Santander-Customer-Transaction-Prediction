library(tidyverse)
library(data.table)
library(FNN)
library(gmodels)

train <- fread("train.csv")
test <- fread("test.csv")
target <- train$target
testx <- test

train$ID_code <- NULL
train$target <- NULL
test$ID_code <- NULL

trainknn2 <- knn(train = train, test = test, cl= target, k = 2)
CrossTable(x=target, y=trainknn2, prop.chisq=FALSE)

trainknn3 <- knn(train = train, test = test, cl= target, k = 3)
CrossTable(x=target, y=trainknn3, prop.chisq=FALSE)

trainknn4 <- knn(train = train, test = test, cl= target, k = 4)
CrossTable(x=target, y=trainknn4, prop.chisq=FALSE)

trainknn5 <- knn(train = train, test = test, cl= target, k = 5)
CrossTable(x=target, y=trainknn5, prop.chisq=FALSE)

trainknn6 <- knn(train = train, test = test, cl= target, k = 6)
CrossTable(x=target, y=trainknn6, prop.chisq=FALSE)

trainknn7 <- knn(train = train, test = test, cl= target, k = 7)
CrossTable(x=target, y=trainknn7, prop.chisq=FALSE)

trainknn8 <- knn(train = train, test = test, cl= target, k = 8)
CrossTable(x=target, y=trainknn8, prop.chisq=FALSE)

trainknn9 <- knn(train = train, test = test, cl= target, k = 9)
CrossTable(x=target, y=trainknn9, prop.chisq=FALSE)

trainknn10 <- knn(train = train, test = test, cl= target, k = 10)
CrossTable(x=target, y=trainknn10, prop.chisq=FALSE)

test <- fread("test.csv")
test$target <- trainknn3
submissionknn <- test[,-(2:201)]
write.csv(submissionknn, file="submission knn3.csv", row.names=F)
# Submission score 0.503 - whomp whomp