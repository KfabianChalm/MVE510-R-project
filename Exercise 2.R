
# Load Files --------------------------------------------------------------
load("genome1.rdata")
load("genome2.rdata")
load("genome3.rdata")

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
