
# Part 1 ------------------------------------------------------------------

#Quit the program
#q()

#Get help on q#Alternatively: ?q

#Loads MASS package into library
library(MASS)
#Opens web page illustrating all Vignettes in different packages
browseVignettes()

# Part 2 ------------------------------------------------------------------

4+7
4-7
4*7
4/7
4^7
4+7*3
(4+7)*3
#help(Syntax)
help('+')
sqrt(9)
exp(2)
log(4)
log(0)
log(-1)

# Part 3 ------------------------------------------------------------------

x=c(1,2,3,2,3);  xx <- c(3,2,1,3,3)
x-1
x*2
x^2
exp(x)
x[2]
1:10
5:15
x[2:4]
x[c(1,3)]
y=x>2
x[y]
x[x>2]
#help(seq)
q1=seq(1,100,length.out=10000)
#help(rep)
q2=rep(42,times=100)
z=matrix(1:12,4,3,byrow=TRUE)
z[3:4,2:3]
apply(z,2,sum)
mean(apply(z,2,sum))

# Part 4 ------------------------------------------------------------------

x=1.5
y=exp(x)
print(y)

# Part 5 ------------------------------------------------------------------

#rm(list=ls())               In case I want to reset all my values and variables
library(MASS)                #Import the MASS data library
data(mammals)                #Extract value "mammals" from dataset
ls()                         #Shows all values/vars in the console when run
class(mammals)               #Displays the classification of the variable
head(mammals)                #Displays only the 6 (out of 62) first values
tail(mammals)                #Displays only the 6 (out of 62) last values
rownames(mammals)            #Displays the row names
colnames(mammals)            #Displays the column names

MBod=mean(mammals[,1])       #Gives the mean value of the first column (body)
MBr=mean(mammals[,2])        #Gives the mean value of the second column (brain)
MedBod=median(mammals[,1])   #Gives the median of the first column (body)
MedBr=median(mammals[,2])    #Gives the median of the second column (brain)
VarBod=var(mammals[,1])      #Gives the variance of the first column (body)
VarBr=var(mammals[,2])       #Gives the variance of the second column (brain)
SDBod=sqrt(mammals[,1])      #Gives the variance of the first column (body)
SDBr=sqrt(mammals[,2])       #Gives the standard deviation of the second column (brain)

MedBod2=median(mammals[,1]+mammals[,2]/1000) #Gives median of the combines weight of body and brain

ratio=(mammals[,2]/1000)/mammals[,1]
mammals2=cbind(mammals,ratio)                #Binds the two matrices together
colnames(mammals2)=c("Body", "Brain", "Body/Brain-ratio")
mammals.order=order(mammals2[,3], decreasing=TRUE)
mammals2.sorted=mammals2[mammals.order,]
#Ground Squirrel has the highest and African elephant the lowest

# Part 6 ------------------------------------------------------------------

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

# Part 7 ------------------------------------------------------------------

library(MASS)
data(cats)
plot(cats[,2],cats[,3])
plot(cats[,2],cats[,3],col="red") 
plot(cats[,2],cats[,3],pch=5)
plot(cats[,2],cats[,3],pch=2,main="Cat  body-heart  weight",xlab="Body  weight",ylab="Heart weight") 
plot(cats[,2],cats[,3],pch=2,main="Cat  body-heart  weight",xlab="Body  weight",ylab="Heart weight",cex=1.5,cex.main=1.5)
plot(cats[,2],cats[,3],pch=2,main="Cat  body-heart  weight",xlab="Body  weight",ylab="Heart weight",cex=1.5,cex.main=1.5,xlim=c(2,2.5),ylim=c(6,15))

hist(cats[,2],breaks=20)

barplot(cats[1:10,3],xlab="Cats 1-10",ylab="Heart Weight (g)")

pdf(file="cats.pdf",width=8,height=8) 
plot(cats[,2],cats[,3],pch=2,main="Cat  body-heart weight",xlab="Body  weight",ylab="Heart weight",cex=1.5,cex.main=1.5)
dev.off()

windows()
layout(matrix(1:2,nrow=1,ncol=2))
hist(cats.female[,2],breaks=20,xlim=c(2,4),ylim=c(0,12))
hist(cats.male[,2],breaks=20,xlim=c(2,4),ylim=c(0,12))

windows()
layout(matrix(1:4,nrow=2,ncol=2))
hist(cats.female[,2],breaks=20,xlim=c(2,4),ylim=c(0,12),main="Female body  weight (kg)")
hist(cats.male[,2],breaks=20,xlim=c(2,4),ylim=c(0,12),main="Male body  weight (kg)")
hist(cats.female[,3],breaks=20,xlim=c(6,21),ylim=c(0,12),main="Female brain  weight (g)")
hist(cats.male[,3],breaks=20,xlim=c(6,21),ylim=c(0,12),main="Male brain  weight (g)")

# Part 8 ------------------------------------------------------------------

myfunc = function(x,y){
  z=x+y
  return(z)
}

myfunc(3,4)


fun.sum = function(n){
  vect = seq(from=1, to=1000, by=1)
  s = sum(vect[0:n])
  return(s)
}

fun.sum(4)


fun.euc = function(x,y){
  d=sqrt(sum((x-y)^2))
  return(d)
}

x = c(1,2,3,4,5)
y = c(2,3,4,5,6)

fun.euc(x,y)


fun.fib = function(n){
  n1=0
  n2=1
  print(n1)
  print(n2)
  for (i in 1:(n-2)){
    a=n1+n2
    n1=n2
    n2=a
    print(a)
  }
}

fun.fib(10)
