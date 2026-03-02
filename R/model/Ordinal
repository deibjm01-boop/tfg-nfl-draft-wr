library(stargazer)
library(car)
library(caret)
library(pROC)
library(MLmetrics)
library(DescTools)
library(MASS)
library(vcd)
library(dplyr)

tfg<- NFL_imputado[,c(1,2,3,4,5,6,7,8,9,10,11,12,15,16,18)]

#PROBAR CENTESIMAS DE SEGUNDO
nflcs<-tfg
nflcs$Fourty_yd<-nflcs$Fourty_yd*100
nflcs$Shuttle<-nflcs$Shuttle*100
nflcs$Three_Cone<-nflcs$Three_Cone*100
nflcs$Round<-factor(nflcs$Round,ordered = T,levels = c("X1","X2","X3","X4","X5","X6","X7","Undrafted"))
str(nflcs)

set.seed(2025)
trainIndex <- createDataPartition(nflcs$Round, p=0.8, list=FALSE)
data_train <- nflcs[trainIndex,]
data_test <- nflcs[-trainIndex,]


modeloInicial<-polr(Round ~ ., data=data_train)
modeloInicial$edf
stargazer(modeloInicial,type="text",report=('vc*p'))
Anova(modeloInicial, type = "II")

Modelo2<- polr(Round ~ First_Division+Power_Conference+Fourty_yd+Games+TD, data=data_train)
Modelo2$edf
stargazer(Modelo2, type="text")
Anova(Modelo2, type = "II")
(exp(coef(Modelo2)))


cm<-confusionMatrix(table(predict(Modelo2, newdata=data_train), data_train$Round))
cm$table
cm$overall[1:2]
summary(Kappa(cm$table))
cm$byClass[,1:2]

cm_test<-confusionMatrix(table(predict(Modelo2,newdata=data_test),data_test$Round))
cm_test$table
cm_test$overall[1:2]
summary(Kappa(cm_test$table))
cm_test$byClass[,1:2]


null<-polr(Round ~ 1, data=data_train)
full<-polr(Round ~ ., data=data_train)
modeloStepBIC<-step(null, scope=list(lower=null, upper=full), direction="both",
                    k=log(nrow(data_train)),trace=F)
modeloStepAIC<-step(null, scope=list(lower=null, upper=full), direction="both",trace=F)
modeloForwBIC<-step(null, scope=list(lower=null, upper=full), direction="forward",
                    k=log(nrow(data_train)),trace=F)
modeloForwAIC<-step(null, scope=list(lower=null, upper=full), direction="forward",trace=F)
modeloBackBIC<-step(full, scope=list(lower=null, upper=full), direction="backward",
                    k=log(nrow(data_train)),trace=F)
modeloBackAIC<-step(full, scope=list(lower=null, upper=full), direction="backward",trace=F)
modelos<-list(modeloStepBIC,modeloStepAIC,modeloForwBIC,modeloForwAIC,modeloBackBIC,
              modeloBackAIC)
sapply(modelos,function(x) x$call)
sapply(modelos,function(x) x$edf)

my_summary <- function(data, lev = NULL, model = NULL){
  a1 <- multiClassSummary(data, lev, model)
  b1 <- vcd::Kappa(table(data[, "pred"],data[, "obs"]))$Weighted[1]
  out <- c(a1, Wkappa=b1)
  out
}
modelos<-list(Modelo2,modeloStepBIC,modeloStepAIC)
vcrTodosModelos<-list()
for (i in 1:length(modelos)){
  set.seed(1712)
  vcr <- train (formula(modelos[[i]]),
                data = data_train, method = "polr",
                tuneGrid = expand.grid(method="logistic"),
                trControl = trainControl(method = "repeatedcv",
                                         number = 5, repeats=20,
                                         classProbs = TRUE,
                                         summaryFunction = my_summary)
  )
  vcrTodosModelos[[i]]<-vcr
}
bwplot(resamples(vcrTodosModelos),metric=c("AUC","Kappa","Accuracy","Wkappa.value"),
       scales = list(x = list(relation = "free")))

summary(resamples(vcrTodosModelos),metric=c("AUC","Kappa","Accuracy","Wkappa.value"))
sapply(modelos,function(x) x$edf)

stargazer(modeloStepAIC, type="text", report=('vc*p'), apply.coef=exp, p.auto=F)
Anova(modeloStepAIC,type = "II")
(exp(coef(modeloStepAIC)))

cm_test<-confusionMatrix(table(predict(modeloStepAIC,newdata=data_test),data_test$Round))
cm_test$table
cm_test$overall[1:2]
summary(Kappa(cm_test$table))
cm_test$byClass[,1:2]
