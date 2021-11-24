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
