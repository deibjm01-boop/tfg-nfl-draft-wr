library(questionr)
#5. DEPURACIÓN DE DATOS

summary(NFL_COMBINE_TFG$Ht)
hist(NFL_COMBINE_TFG$Ht)
boxplot(NFL_COMBINE_TFG$Ht)

summary(NFL_COMBINE_TFG$Wt)
hist(NFL_COMBINE_TFG$Wt)
boxplot(NFL_COMBINE_TFG$Wt)

summary(NFL_COMBINE_TFG$Fourty_yd)
hist(NFL_COMBINE_TFG$Fourty_yd)
boxplot(NFL_COMBINE_TFG$Fourty_yd)

summary(NFL_COMBINE_TFG$Bench)
hist(NFL_COMBINE_TFG$Bench)
boxplot(NFL_COMBINE_TFG$Bench)

summary(NFL_COMBINE_TFG$Vertical)
hist(NFL_COMBINE_TFG$Vertical)
boxplot(NFL_COMBINE_TFG$Vertical)

summary(NFL_COMBINE_TFG$Broad_Jump)
hist(NFL_COMBINE_TFG$Broad_Jump)
boxplot(NFL_COMBINE_TFG$Broad_Jump)

summary(NFL_COMBINE_TFG$Shuttle)
hist(NFL_COMBINE_TFG$Shuttle)
boxplot(NFL_COMBINE_TFG$Shuttle)

summary(NFL_COMBINE_TFG$Three_Cone)
hist(NFL_COMBINE_TFG$Three_Cone)
boxplot(NFL_COMBINE_TFG$Three_Cone)

summary(NFL_COMBINE_TFG$Round)
barchart(NFL_COMBINE_TFG$Round)
NFL_COMBINE_TFG$Round<-as.factor(make.names(NFL_COMBINE_TFG$Round))

summary(NFL_COMBINE_TFG$Games)
hist(NFL_COMBINE_TFG$Games)
boxplot(NFL_COMBINE_TFG$Games)

summary(NFL_COMBINE_TFG$Receptions)
hist(NFL_COMBINE_TFG$Receptions)
boxplot(NFL_COMBINE_TFG$Receptions)

summary(NFL_COMBINE_TFG$Yards)
hist(NFL_COMBINE_TFG$Yards)
boxplot(NFL_COMBINE_TFG$Yards)

summary(NFL_COMBINE_TFG$TD)
hist(NFL_COMBINE_TFG$TD)
boxplot(NFL_COMBINE_TFG$TD)

summary(NFL_COMBINE_TFG$First_Division)
barchart(NFL_COMBINE_TFG$First_Division)
NFL_COMBINE_TFG$First_Division<-as.factor(NFL_COMBINE_TFG$First_Division)

summary(NFL_COMBINE_TFG$Power_Conference)
barchart(NFL_COMBINE_TFG$Power_Conference)
NFL_COMBINE_TFG$Power_Conference<-as.factor(NFL_COMBINE_TFG$Power_Conference)

summary(NFL_COMBINE_TFG$Yards_Receptions)
hist(NFL_COMBINE_TFG$Yards_Receptions)
boxplot(NFL_COMBINE_TFG$Yards_Receptions)

summary(NFL_COMBINE_TFG$Yards_Game)
hist(NFL_COMBINE_TFG$Yards_Game)
boxplot(NFL_COMBINE_TFG$Yards_Game)

summary(NFL_COMBINE_TFG$Receptions_Game)
hist(NFL_COMBINE_TFG$Receptions_Game)
boxplot(NFL_COMBINE_TFG$Receptions_Game)

summary(NFL_COMBINE_TFG)
str(NFL_COMBINE_TFG)
