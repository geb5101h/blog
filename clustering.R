#figure 1: sample densities
par(mfcol=c(1,2))

f<- function(x) (dnorm(x) +dnorm((x-2)))/2
curve(f,-3,5,
      xlab="",
      ylab="")


x<- seq(-15,15,length.out=100)
y<-seq(-5,17,length.out=100)
z<-tcrossprod(dnorm(x/6),dnorm(y)) + tcrossprod(dnorm(x-6),dnorm((y-6)/5))
contour(z)

#fig 2: gaussian mixtures
library(mclust)
faithmodel=Mclust(faithful)

par(mfcol=c(2,2))
plot(faithmodel,
     what=c("classification", "uncertainty", "density"))

#fig 3:mean-shift
library(LPCM)
ms_fit<-ms.self.coverage(faithful,gridsize= 50, taumin=0.1,
                 taumax=0.5, plot.type="o")
h <- select.self.coverage(foo)$select
fit <- ms(faithful,h=h[1])
