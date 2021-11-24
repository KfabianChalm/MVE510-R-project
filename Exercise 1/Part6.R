library(MASS)
data(cats)
help(cats)
summary(cats)
head(cats)
mean(cats[,2]); mean(cats[,3])
median(cats[,2]); median(cats[,3])
var(cats[,2]); var(cats[,3])
cor(cats[,2],cats[,3])

female=cats[,1]=="F"
cats.female=cats[female,]

male=cats[,1]=="M"
cats.male=cats[male,]

mean(cats.male[,2]); mean(cats.female[,2])
median(cats.male[,2]); median(cats.female[,2])
var(cats.male[,2]); var(cats.female[,2])

var.test(cats.female[,2], cats.male[,2]) #The variance is almost 3x as large for males as for females
var(cats.female[,2])/var(cats.male[,2])  #This is how the ratio is calculated in var.test

help(t.test)
t.test(cats.female[,2], cats.male[,2], var.equal=FALSE) 
#False is used by default
#
wilcox.test(cats.female[,2], cats.male[,2])
