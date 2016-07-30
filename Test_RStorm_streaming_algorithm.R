install.packages("RStorm")
library(RStorm)

x<-seq(1,1000)
topology<-Topology(data.frame(x=y))
computeSum<-function(x,...){
  sum<-GetHash("sum")
  if(is.data.frame(sum)){
    x<-sum+(x[1])
  }
  SetHash("sum", x)
  }
topology<-AddBolt(topology, Bolt(computeSum))
result<-RStorm(topology)
print(GetHash("sum", result))
plot(topology)