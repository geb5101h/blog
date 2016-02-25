#An example of a spurious correlation when regressing
#two independent random walks

library(magrittr)
n=100

set.seed(32487)
x =y= rep(0,n)
(2:n)%>%lapply(.,function(i){
  x[i] <<- x[i-1] + rnorm(1)
  y[i] <<- y[i-1] + rnorm(1)
})

plot(x,y,type="l")

lms=lm(y~x)
par(mfcol=c(2,1))
plot(x,y,type="l",lwd=2)
abline(a=lms$coef[1],b=lms$coef[2],col="red",lwd=2,lty=3)

plot(x,col="red",ylim=range(cbind(x,y)),xlab="time",ylab="Two random walks",pch=16)
points(y,pch=16)

lms%>%summary
