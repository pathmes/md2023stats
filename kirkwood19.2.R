# Create a dataframe using the cross tabulated data in
# Table 19.2 of Kirkwoods book


tm <- matrix(c(541, 281, 213, 267), ncol = 2)
t1 <- as.table(tm)
t2 <- as.data.frame.table(t1, stringsAsFactors = FALSE)

t2$Var1[t2$Var1 == "A"] <- "Rainforest"
t2$Var1[t2$Var1 == "B"] <- "Savannah"
t2$Var2[t2$Var2 == "A"] <- "Yes"
t2$Var2[t2$Var2 == "B"] <- "No"
names(t2)[names(t2) == "Var1"] <- "Area"
names(t2)[names(t2) == "Var2"] <- "Microfilaria"

t3 <- t2[rep(1:nrow(t2), t2$Freq), -3]
t3$Area <- as.factor(t3$Area)
t3$Area <- relevel(t3$Area, ref = "Savannah")
t3$Microfilaria <- as.factor(t3$Microfilaria)
t3$Microfilaria <- relevel(t3$Microfilaria, ref= "No")

t3$mfp <- as.numeric(t3$Microfilaria == "Yes")

