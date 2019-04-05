install.packages("rcompanion")
install.packages("MASS")

library(data.table)
library(rcompanion)
library(MASS)
library(leaps)


train <- fread("train.csv")
test <- fread("test.csv")

trainx <- train
trainx$ID_code <- NULL

trainxyes <- subset(trainx, target==1)
trainxno <- subset(trainx, target==0)

kruskal.test(trainxyes)
kruskal.test(trainxno)
kruskal.test(trainx)

bartlett.test(trainx, target)
fligner.test(trainx, target)

fulllm <- glm(target~., data = trainx, family = "binomial")
fullanova <- anova(fulllm)
fullres <- residuals(fulllm)
plotNormalDensity(fullres)
plotNormalHistogram(fullres)
plotDensityHistogram(fullres)

nulllm <- glm(target~1, data = trainx)

stepF <- stepAIC(nulllm, scope = list(lower=nulllm, upper=fulllm), direction = "forward", trace = TRUE)



