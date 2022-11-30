# Load Files --------------------------------------------------------------
load("~/MVE510/Exercise 2/genome1.rdata")
load("~/MVE510/Exercise 2/genome2.rdata")
load("~/MVE510/Exercise 2/genome3.rdata")


# Calculate Coverage of genome1 -------------------------------------------

genome1.cov <- apply(genome1[,2:5], 1, sum)
genome1.cov.avg <- sum(genome1.cov)/length(genome1.cov)
genome1.cov.max <- max(genome1.cov)
genome1.cov.var <- var(genome1.cov)


# Plot coverage for subsections -------------------------------------------

genome1.sub1=genome1[2000001:2001000,]
genome1.sub1.cov <- apply(genome1.sub1[,2:5], 1, sum)
plot(genome1.sub1[,1], genome1.sub1.cov, 
     main = 'Coverage genome1 Subsection 1',
     xlab = 'Position', 
     ylab = 'Reads')

genome1.sub2=genome1[3000001:3001000,]
genome1.sub2.cov <- apply(genome1.sub2[,2:5], 1, sum)
plot(genome1.sub2[,1], genome1.sub2.cov, 
     main = 'Coverage genome1 Subsection 2',
     xlab = 'Position', 
     ylab = 'Reads')


# Error rates -------------------------------------------------------------

# Syntax for for-loop in R.  
genome1.length=nrow(genome1) # Calculate the length of genome1 
# Allocate an empty vector for matches 
matches=vector(length=genome1.length) 

for (pos in 1:genome1.length){ 
  matches[pos] = genome1[pos,reference[pos]]  
  
} 

mismatches=vector(length=genome1.length)

for (pos in 1:genome1.length){
  mismatches[pos] = genome1.cov[pos]-matches[pos]
}


# Test mismatches over subsection
  
sublength=nrow(genome1.sub1)
# Allocate another empty vector for mismatches in subsection 1
mismatches.sub1=vector(length=sublength)

for (pos in 3000001:3001000){
  mismatches.sub1[pos-3000000]=genome1.cov[pos]-matches[pos]
}
plot(mismatches.sub1)

# Count how many positions have at least one mismatch
mismatches.sub1.nonzero=sum(mismatches.sub1 !=0)
hist(mismatches.sub1)


# SNP Test ----------------------------------------------------------------
pval.1=vector(length=genome1.length)

for (pos in 1:genome1.length){
               x=mismatches[pos]
               n=genome1.cov[pos]
                if (n > 0)
               {if (x > 0){
               a=binom.test(x, n, p = 0.1,
               alternative = c("less"),
               conf.level = 0.95)
               pval.1[pos]=unlist(a[3])
               }else{
                 pval.1[pos]=0
               }
               }else{
                 pval.1[pos]=0
               }
               
  
}
pval.1.sorted=pval.1[order(pval.1,decreasing=TRUE)]
pval.1.sorted
pval.1.sub=pval.1[3000001:3010000]
plot(pval.1.sub)

x=1
n=20
a=(binom.test(x, n, p = 0.1,
           alternative = "less",
           conf.level = 0.95))
a
b=unlist(a[3])
b

