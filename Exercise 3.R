x = read.table('~/MVE510/Exercise 3/counts_matrix.txt') 
metadata = read.table('~/MVE510/Exercise 3/metadata.txt',sep='\t',header=TRUE) 
rownames(x) 
colnames(x) 
metadata$patient.id 
colnames(x) == metadata$patient.id 
a=unlist(x['ENSG00000002586',])
plot(a, type = "l")
b=unlist(x['ENSG00000004809',])
plot(b, type = "l")
