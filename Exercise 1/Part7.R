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
