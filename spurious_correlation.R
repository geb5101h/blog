#An example of a spurious correlation when regressing
#two independent random walks

library(magrittr)

#set.seed(32487)
simulate_rw <- function(n) {
  x = y = rep(0,n)
  (2:n) %>% lapply(.,function(i) {
    x[i] <<- x[i - 1] + rnorm(1)
    y[i] <<- y[i - 1] + rnorm(1)
  })
  
  return(cbind(x,y))
  
}


#plot one simulation
set.seed(32487)
n=100
out = simulate_rw(n)
x = out[,1]; y = out[,2]
par(mfcol = c(2,1))
plot(x,y,type = "l",lwd = 2)
abline(
  a = lms$coef[1],b = lms$coef[2],col = "red",lwd = 2,lty = 3
)

plot(
  x,col = "red",ylim = range(cbind(x,y)),xlab = "time",ylab = "Two random walks",pch =
    16
)
points(y,pch = 16)


#limiting distribution of regression coef
set.seed(9845)
n=100
sim_fn<- function(){
  out=simulate_rw(n)
  x=out[,1]; y=out[,2]
  lmout = lm(y~x)
  return(lmout$coef[2])
}
out = replicate(10000,sim_fn())


hist(out,100)
