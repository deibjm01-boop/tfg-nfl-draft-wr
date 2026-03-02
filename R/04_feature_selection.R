library(car)
library(corrplot)

#6. MULTICOLINEALIDAD

sapply(NFL_imputado,length)
multicolinealidad<-NFL_imputado
multicolinealidad$multicolinealidad<-rep(1,550)
nflvif<-lm(multicolinealidad~ First_Division+Power_Conference+Ht+Wt+Fourty_yd+Bench+Vertical+Broad_Jump+Shuttle+Three_Cone+Games+Receptions+Yards+Yards_Receptions+TD+Yards_Game+Receptions_Game,data=multicolinealidad)
nflvif
VIF(nflvif)


vif(nflvif)

nflvif2<-lm(multicolinealidad~ First_Division+Power_Conference+Ht+Wt+Fourty_yd+Bench+Vertical+Broad_Jump+Shuttle+Three_Cone+Games+Yards+Yards_Receptions+TD+Yards_Game+Receptions_Game,data=multicolinealidad)
nflvif2
VIF(nflvif2)
vif(nflvif2)

nflvif3<-lm(multicolinealidad~ First_Division+Power_Conference+Ht+Wt+Fourty_yd+Bench+Vertical+Broad_Jump+Shuttle+Three_Cone+Games+Yards+Yards_Receptions+TD+Receptions_Game,data=multicolinealidad)
nflvif3
VIF(nflvif3)
vif(nflvif3)

nflvif4<-lm(multicolinealidad~ First_Division+Power_Conference+Ht+Wt+Fourty_yd+Bench+Vertical+Broad_Jump+Shuttle+Three_Cone+Games+Yards_Receptions+TD+Receptions_Game,data=multicolinealidad)
nflvif4
VIF(nflvif4)
vif(nflvif4)

#MATRIZ CORRELACIONES (VER SI METER O NO)
nomulticol<-NFL_imputado[,c(3,4,5,6,7,8,9,10,12,15,16,18)]
cor_matrix2 <- cor(nomulticol)
print(cor_matrix2)
which(abs(cor_matrix2) > 0.8, arr.ind = TRUE)
aux2<-(abs(cor_matrix2)>0.2)*1
corrplot(aux2)
corrplot(cor_matrix2)


cor_matrix <- cor(NFL_imputado[, sapply(NFL_imputado, is.numeric)])
print(cor_matrix)
which(abs(cor_matrix) > 0.8, arr.ind = TRUE)
aux<-(abs(cor_matrix)>0.8)*1
corrplot(aux)

n1<-NFL_imputado[, sapply(NFL_imputado, is.numeric)]
n2<-n1[,-10]
cor_matrix <- cor(n2)
print(cor_matrix)
which(abs(cor_matrix) > 0.8, arr.ind = TRUE)
aux<-(abs(cor_matrix)>0.8)*1
corrplot(aux)

n3<-n2[,-13]
cor_matrix <- cor(n3)
print(cor_matrix)
which(abs(cor_matrix) > 0.8, arr.ind = TRUE)
aux<-(abs(cor_matrix)>0.8)*1
corrplot(aux)
