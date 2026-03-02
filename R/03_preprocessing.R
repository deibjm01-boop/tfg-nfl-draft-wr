library(VIM)
library(naniar)
library(DMwR2)

# Calcular porcentaje de NA por columna para ver el método de imputación.
missing_per_column <- colMeans(is.na(NFL_COMBINE_TFG)) * 100
missing_per_column

# Generar gráfico de patrones combinados
par(mar = c(15, 10, 10, 15))
aggr(NFL_COMBINE_TFG, col = c("gray", "black"), numbers = TRUE, sortVars = TRUE,
     only.miss = TRUE, labels = names(NFL_COMBINE_TFG), gap = 3, 
     ylab = c("Missing Data", "Pattern of Missingness"),cex.axis=0.8)

mcar_test(NFL_COMBINE_TFG)

# Imputación a través de KNN
NFL_imputado<- knnImputation(NFL_COMBINE_TFG, meth="median")
NFL_imputado
anyNA(NFL_imputado)
str(NFL_imputado)
summary(NFL_imputado)
sd(NFL_COMBINE_TFG$Three_Cone,na.rm = T)
sd(NFL_imputado$Three_Cone)
stats::var(NFL_imputado)
