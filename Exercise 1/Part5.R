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