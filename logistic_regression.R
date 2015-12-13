##install base packages

install.packages("caret")
install.packages("gtools")
install.packages("lme4")
install.packages("lmtest")
install.packages("pscl")
install.packages("survey")
install.packages("pROC")
install.packages("ROCR")
library(caret)

##read in data
data<-read.csv("model2.csv")

train <- data[1:30000,]
test <- data[30001:32950,]

# Model fitting
model <- glm(grad ~.,family=binomial(link='logit'),data=train)


##base logistic model
model<- glm(grad~sex+age+marital+efc, data=data, family="binomial")
summary(model)
##read out on performance
 
predict(mod_fit_one, newdata=data, type="response") # predicted probabilities

##visuals
plot(model)


##analysis of variance
library(lmtest)
anova(model,test="Chisq")
lrtest(mod_fit_one)

library(pscl)
pR2(model)

library(survey)
##measuring importance of variables
regTermTest(model, "efc")
varImp(model)

##visuals showing model error
#####CreditHistory.Critical
library(pROC)
library(ROCR)
f1=roc(Class~CreditHistory.Critical, data=training)
plot(f1, col="red")

prob<-predict(mod_fit_one, newdata=testing, type="response")
pred<-prediction(prob,testing$Class)
perf<-performance(pred, measure="tpr", x.measure = "fpr")
plot(perf)


varplot(model, TRUE, FALSE)
plot(model)
plot(model, FALSE, FALSE)
plot(model, TRUE, FALSE)
plot(jitter(grad)~age, data)
boxplot(jitter(grad)~efc, data)
forplot<-data.frame(data$grad,data$age, data$marital, data$mom, data$efc)
splom(forplot)

















