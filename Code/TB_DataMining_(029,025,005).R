setwd("D:/TB_DataMining_(029,025,005)")
install.packages("mlbench")
install.packages("Momocs")
install.packages("caret")
install.packages("rpart")
install.packages("dplyr")
library(mlbench)
library(Momocs)
library(caret)
library(rpart)
library(dplyr)
dataset <- read.csv("SomervilleHappinessSurvey.csv", header=TRUE)
dataset <- na.omit(dataset)
str(dataset)
install.packages("matrixStats")
library(party)
set.seed(123)
ind <- sample(2, nrow(dataset), replace = TRUE, prob = c(0.8,0.2))
train.data <- dataset [ind ==1,]
test.data <- dataset [ind == 2,]
dataset_tree <- rpart(myFormula, data = train.data, control = rpart.control(minsplit=10))
rpartMod <- rpart(D ~ X1 + X2 + X3 + X4 + X5 + X6, data = train.data, method = "class")
table(predict(dataset_ctree), train.data$D)
printcp(rpartMod)
plotcp(rpartMod)
print(dataset_tree)
plot(dataset_tree)
text(dataset_tree)
