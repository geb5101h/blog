#mean-shift
library(LPCM)
ms_fit<-ms.self.coverage(faithful,gridsize= 50, taumin=0.1,
                 taumax=0.5, plot.type="o")
h <- select.self.coverage(foo)$select
fit <- ms(faithful,h=h[1])
