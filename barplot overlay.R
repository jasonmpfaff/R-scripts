cohort<-read.csv("cohort.csv", header=T)
cohort
library(reshape2)
cohort1<-melt(cohort, id.vars=c("Campus"))
cohort1
library(ggplot2)
ggplot(data=cohort1, aes(x=Campus,y=value,fill=variable))+geom_bar(stat="identity",position="jitter",colour="grey")+theme(text = element_text(size=12),
axis.text.x = element_text(angle=90, vjust=1))
par(new=TRUE)
cohort<-read.csv("cohort.csv", header=T)
cohort
library(reshape2)
cohort1<-melt(cohort, id.vars=c("Campus"))
cohort1
library(ggplot2)
ggplot(data=cohort1, aes(x=Campus,y=value,fill=variable))+geom_bar(stat="identity",colour="grey")+theme(text = element_text(size=12),
                                                                                                                                                axis.text.x = element_text(angle=90, vjust=1))








cohort<-read.csv("cohort.csv", header=T)
cohort
barplot(cohort$actualdrop, names.arg=cohort$Campus, col = rgb(1,0,0, alpha=0.1), cex.names=.5, las=2,ylim=c(0,.7))
par(new=TRUE)
barplot(cohort$targetdrop, names.arg=cohort$Campus, col = rgb(0,1,0,alpha=.5), cex.names=.5, las=2, ylim=c(0,.7))


cohort<-read.csv("cohort.csv", header=T)
cohort
barplot(cohort$actualdrop, names.arg=cohort$Campus, col = rgb(1,0,0, alpha=0.2), density=1, cex.names=.5, las=2,ylim=c(0,.7))
par(new=TRUE)
barplot(cohort$targetdrop, names.arg=cohort$Campus, col = rgb(0,0,1,alpha=.7),density=5, cex.names=.5, las=2, ylim=c(0,.7))



cohort<-read.csv("cohort.csv", header=T)
#cohort
barplot(cohort$actualdrop, names.arg=cohort$Campus, col = rgb(200, 25, 0, 255, maxColorValue=255), cex.names=.5, las=2,ylim=c(0,.6))
par(new=TRUE)
barplot(cohort$targetdrop, names.arg=cohort$Campus, col = rgb(0, 255, 0, 100, maxColorValue=255), cex.names=.5, las=2, ylim=c(0,.6),ylab="Drop %",main="Spring Cohort Drop Rate vs Target")
legend("topright", 
       legend = c("Target", "Actuals"), 
       fill = c(col = rgb(0, 255, 0, 100, maxColorValue=255), col = rgb(200, 25, 0, 255, maxColorValue=255)))






hist(cohort1, breaks=6)


library(reshape2)
melt(cohort, id.vars=c("Campus"))
cohort1<-data.frame(cohort$Campus,cohort$actualdrop, cohort$targetdrop)
barplot(cohort1, names.arg=cohort$Campus, col="lightgreen", cex.names=.5, las=2)
cohort1


cohort1<-data.frame(cohort$actualdrop, cohort$targetdrop)


cohort<-read.csv("cohort.csv", header=T)
cohort
ggplot(data=cohort, aes(Campus,fill=actualdrop))+geom_bar(stat="identity", position="dodge",colour="lightgreen")+theme(text = element_text(size=1),
                                                                                                                       axis.text.x = element_text(angle=90, vjust=1))




cohort2<-as.matrix(read.csv("cohort.csv", header=TRUE))
library(reshape2)
melt(cohort2, id.vars=c("Campus"))
barplot(cohort2, col=c("lightgreen","red"))
