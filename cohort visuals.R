cohort<-read.csv("Winter.csv", header=T)
cohort
barplot(cohort$actualdrop, names.arg=cohort$Campus, col = rgb(200, 25, 0, 255, maxColorValue=255), cex.names=.6, las=2,ylim=c(0,70))
par(new=TRUE)
barplot(cohort$targetdrop, names.arg=cohort$Campus, col = rgb(0, 255, 0, 100, maxColorValue=255), cex.names=.6, las=2, ylim=c(0,70),ylab="Drop %",main="Winter Cohort Drop Rate at 180 days vs Budget")
legend("top", legend = c("Positive Variance", "Negative Variance"), horiz=T, bty="n",cex=.7,fill = c(col = rgb(0, 255, 0, 100, maxColorValue=255), col = rgb(200, 25, 0, 255, maxColorValue=255)))


cohort<-read.csv("Winter Mid.csv", header=T)
#cohort
barplot(cohort$actualdrop, names.arg=cohort$Campus, col = rgb(200, 25, 0, 255, maxColorValue=255), cex.names=.6, las=2,ylim=c(0,90))
par(new=TRUE)
barplot(cohort$targetdrop, names.arg=cohort$Campus, col = rgb(0, 255, 0, 100, maxColorValue=255), cex.names=.6, las=2, ylim=c(0,90),ylab="Drop %",main="Winter Mid Cohort Drop Rate at 180 days vs Budget")
legend("top", legend = c("Positive Variance", "Negative Variance"), horiz=T, bty="n",cex=.7, fill = c(col = rgb(0, 255, 0, 100, maxColorValue=255), col = rgb(200, 25, 0, 255, maxColorValue=255)))


cohort<-read.csv("Spring.csv", header=T)
#cohort
barplot(cohort$actualdrop, names.arg=cohort$Campus, col = rgb(200, 25, 0, 255, maxColorValue=255), cex.names=.6, las=2,ylim=c(0,70))
par(new=TRUE)
barplot(cohort$targetdrop, names.arg=cohort$Campus, col = rgb(0, 255, 0, 100, maxColorValue=255), cex.names=.6, las=2, ylim=c(0,70),ylab="Drop %",main="Spring Cohort Drop Rate at 180 days vs Budget")
legend("top", legend = c("Positive variance", "Negative Variance"),horiz=T, bty="n",cex=.7, fill = c(col = rgb(0, 255, 0, 100, maxColorValue=255), col = rgb(200, 25, 0, 255, maxColorValue=255)))

cohort<-read.csv("Spring Mid.csv", header=T)
#cohort
barplot(cohort$actualdrop, names.arg=cohort$Campus, col = rgb(200, 25, 0, 255, maxColorValue=255), cex.names=.6, las=2,ylim=c(0,70))
par(new=TRUE)
barplot(cohort$targetdrop, names.arg=cohort$Campus, col = rgb(0, 255, 0, 100, maxColorValue=255), cex.names=.6, las=2, ylim=c(0,70),ylab="Drop %",main="Spring Mid Cohort Drop Rate at 150 days vs Budget")
legend("top", legend = c("Positive Variance", "Negative Variance"), horiz=T, bty="n",cex=.7,fill = c(col = rgb(0, 255, 0, 100, maxColorValue=255), col = rgb(200, 25, 0, 255, maxColorValue=255)))


cohort<-read.csv("Summer.csv", header=T)
#cohort
barplot(cohort$actualdrop, names.arg=cohort$Campus, col = rgb(200, 25, 0, 255, maxColorValue=255), cex.names=.6, las=2,ylim=c(0,50))
par(new=TRUE)
barplot(cohort$targetdrop, names.arg=cohort$Campus, col = rgb(0, 255, 0, 100, maxColorValue=255), cex.names=.6, las=2, ylim=c(0,50),ylab="Drop %",main="Summer Cohort Drop Rate vs Budget at 90 days")
legend("top", legend = c("Positive Variance", "Negative Variance"), horiz=T, bty="n",cex=.7,fill = c(col = rgb(0, 255, 0, 100, maxColorValue=255), col = rgb(200, 25, 0, 255, maxColorValue=255)))

cohort<-read.csv("Summer Mid.csv", header=T)
#cohort
barplot(cohort$actualdrop, names.arg=cohort$Campus, col = rgb(200, 25, 0, 255, maxColorValue=255), cex.names=.6, las=2,ylim=c(0,30))
par(new=TRUE)
barplot(cohort$targetdrop, names.arg=cohort$Campus, col = rgb(0, 255, 0, 100, maxColorValue=255), cex.names=.6, las=2, ylim=c(0,30),ylab="Drop %",main="Summer Mid Cohort Drop Rate vs Budget at 60 days")
legend("top", legend = c("Positive Variance", "Negative Variance"), horiz=T, bty="n",cex=.7,fill = c(col = rgb(0, 255, 0, 100, maxColorValue=255), col = rgb(200, 25, 0, 255, maxColorValue=255)))


cohort<-read.csv("Fall.csv", header=T)
#cohort
barplot(cohort$actualdrop, names.arg=cohort$Campus, col = rgb(200, 25, 0, 255, maxColorValue=255), cex.names=.6, las=2,ylim=c(0,30))
par(new=TRUE)
barplot(cohort$targetdrop, names.arg=cohort$Campus, col = rgb(0, 255, 0, 100, maxColorValue=255), cex.names=.6, las=2, ylim=c(0,30),ylab="Drop %",main="Fall Cohort Drop Rate vs Budget at 60 days")
legend("top", legend = c("Positive Variance", "Negative Variance"), horiz=T, bty="n",cex=.7,fill = c(col = rgb(0, 255, 0, 100, maxColorValue=255), col = rgb(200, 25, 0, 255, maxColorValue=255)))




######prior year below

cohort<-read.csv("Winter MidH.csv", header=T)
#cohort
barplot(cohort$thisyear, names.arg=cohort$Campus, col = rgb(200, 25, 0, 255, maxColorValue=255), cex.names=.6, las=2,ylim=c(0,80))
par(new=TRUE)
barplot(cohort$lastyear, names.arg=cohort$Campus, col = rgb(0, 255, 0, 100, maxColorValue=255), cex.names=.6, las=2, ylim=c(0,80),ylab="Drop %",main="Winter Mid Start Drop % at 180 days")
legend("top", legend = c("Last Year", "This Year"), horiz=T, bty="n",cex=.7,fill = c(col = rgb(0, 255, 0, 100, maxColorValue=255), col = rgb(200, 25, 0, 255, maxColorValue=255)))

cohort<-read.csv("WinterH.csv", header=T)
#cohort
barplot(cohort$thisyear, names.arg=cohort$Campus, col = rgb(200, 25, 0, 255, maxColorValue=255), cex.names=.6, las=2,ylim=c(0,80))
par(new=TRUE)
barplot(cohort$lastyear, names.arg=cohort$Campus, col = rgb(0, 255, 0, 100, maxColorValue=255), cex.names=.6, las=2, ylim=c(0,80),ylab="Drop %",main="Winter Start Drop % at 180 days")
legend("top", legend = c("Last Year", "This Year"), horiz=T, bty="n",cex=.7,fill = c(col = rgb(0, 255, 0, 100, maxColorValue=255), col = rgb(200, 25, 0, 255, maxColorValue=255)))


cohort<-read.csv("SpringH.csv", header=T)
#cohort
barplot(cohort$thisyear, names.arg=cohort$Campus, col = rgb(200, 25, 0, 255, maxColorValue=255), cex.names=.6, las=2,ylim=c(0,80))
par(new=TRUE)
barplot(cohort$lastyear, names.arg=cohort$Campus, col = rgb(0, 255, 0, 100, maxColorValue=255), cex.names=.6, las=2, ylim=c(0,80),ylab="Drop %",main="Winter Mid Start Drop % at 180 days")
legend("top", legend = c("Last Year", "This Year"), horiz=T, bty="n",cex=.7,fill = c(col = rgb(0, 255, 0, 100, maxColorValue=255), col = rgb(200, 25, 0, 255, maxColorValue=255)))

cohort<-read.csv("Spring MidH.csv", header=T)
#cohort
barplot(cohort$thisyear, names.arg=cohort$Campus, col = rgb(200, 25, 0, 255, maxColorValue=255), cex.names=.6, las=2,ylim=c(0,80))
par(new=TRUE)
barplot(cohort$lastyear, names.arg=cohort$Campus, col = rgb(0, 255, 0, 100, maxColorValue=255), cex.names=.6, las=2, ylim=c(0,80),ylab="Drop %",main="Winter Start Drop % at 180 days")
legend("top", legend = c("Last Year", "This Year"), horiz=T, bty="n",cex=.7,fill = c(col = rgb(0, 255, 0, 100, maxColorValue=255), col = rgb(200, 25, 0, 255, maxColorValue=255)))

cohort<-read.csv("SummerH.csv", header=T)
#cohort
barplot(cohort$thisyear, names.arg=cohort$Campus, col = rgb(200, 25, 0, 255, maxColorValue=255), cex.names=.6, las=2,ylim=c(0,80))
par(new=TRUE)
barplot(cohort$lastyear, names.arg=cohort$Campus, col = rgb(0, 255, 0, 100, maxColorValue=255), cex.names=.6, las=2, ylim=c(0,80),ylab="Drop %",main="Winter Mid Start Drop % at 180 days")
legend("top", legend = c("Last Year", "This Year"), horiz=T, bty="n",cex=.7,fill = c(col = rgb(0, 255, 0, 100, maxColorValue=255), col = rgb(200, 25, 0, 255, maxColorValue=255)))

##SSC pilot
cohort<-read.csv("WintermidSSC.csv", header=T)
#cohort
barplot(cohort$ConsolDropRate, names.arg=cohort$Location, col = rgb(200, 25, 0, 255, maxColorValue=255), cex.names=.6, las=2,ylim=c(0,80))
par(new=TRUE)
barplot(cohort$ConsolDropRatePY, names.arg=cohort$Location, col = rgb(0, 255, 0, 100, maxColorValue=255), cex.names=.6, las=2, ylim=c(0,80),ylab="Drop %",main="Winter Mid Start Drop %")
legend("top", legend = c("Last Year", "This Year"), horiz=T, bty="n",cex=.7,fill = c(col = rgb(0, 255, 0, 100, maxColorValue=255), col = rgb(200, 25, 0, 255, maxColorValue=255)))

cohort<-read.csv("SpringSSC.csv", header=T)
#cohort
barplot(cohort$ConsolDropRate, names.arg=cohort$Location, col = rgb(200, 25, 0, 255, maxColorValue=255), cex.names=.6, las=2,ylim=c(0,60))
par(new=TRUE)
barplot(cohort$ConsolDropRatePY, names.arg=cohort$Location, col = rgb(0, 255, 0, 100, maxColorValue=255), cex.names=.6, las=2, ylim=c(0,60),ylab="Drop %",main="Spring Start Drop %")
legend("top", legend = c("Last Year", "This Year"), horiz=T, bty="n",cex=.7,fill = c(col = rgb(0, 255, 0, 100, maxColorValue=255), col = rgb(200, 25, 0, 255, maxColorValue=255)))


cohort<-read.csv("SpringmidSSC.csv", header=T)
#cohort
barplot(cohort$ConsolDropRate, names.arg=cohort$Location, col = rgb(200, 25, 0, 255, maxColorValue=255), cex.names=.6, las=2,ylim=c(0,80))
par(new=TRUE)
barplot(cohort$ConsolDropRatePY, names.arg=cohort$Location, col = rgb(0, 255, 0, 100, maxColorValue=255), cex.names=.6, las=2, ylim=c(0,80),ylab="Drop %",main="Spring Mid Start Drop %")
legend("top", legend = c("Last Year", "This Year"), horiz=T, bty="n",cex=.7,fill = c(col = rgb(0, 255, 0, 100, maxColorValue=255), col = rgb(200, 25, 0, 255, maxColorValue=255)))

cohort<-read.csv("SummerSSC.csv", header=T)
#cohort
barplot(cohort$ConsolDropRate, names.arg=cohort$Location, col = rgb(200, 25, 0, 255, maxColorValue=255), cex.names=.6, las=2,ylim=c(0,40))
par(new=TRUE)
barplot(cohort$ConsolDropRatePY, names.arg=cohort$Location, col = rgb(0, 255, 0, 100, maxColorValue=255), cex.names=.6, las=2, ylim=c(0,40),ylab="Drop %",main="Summer Start Drop%")
legend("top", legend = c("Last Year", "This Year"), horiz=T, bty="n",cex=.7,fill = c(col = rgb(0, 255, 0, 100, maxColorValue=255), col = rgb(200, 25, 0, 255, maxColorValue=255)))

cohort<-read.csv("WinterSSC.csv", header=T)
#cohort
barplot(cohort$ConsolDropRate, names.arg=cohort$Location, col = rgb(200, 25, 0, 255, maxColorValue=255), cex.names=.6, las=2,ylim=c(0,80))
par(new=TRUE)
barplot(cohort$ConsolDropRatePY, names.arg=cohort$Location, col = rgb(0, 255, 0, 100, maxColorValue=255), cex.names=.6, las=2, ylim=c(0,80),ylab="Drop %",main="Winter Start Drop %")
legend("top", legend = c("Last Year", "This Year"), horiz=T, bty="n",cex=.7,fill = c(col = rgb(0, 255, 0, 100, maxColorValue=255), col = rgb(200, 25, 0, 255, maxColorValue=255)))


################rough draft below#####

cohort<-read.csv("Variance.csv", header=T)
cohort
barplot(cohort$variance, names.arg=cohort$Location, col = rgb(25,0, 200, 255, maxColorValue=255), cex.names=.7, las=2, main="Net Variance to Target, all cohorts")


cohort<-read.csv("varbycohort.csv", header=T)
cohort1<-melt(cohort, id.vars=c("Location"))
cohort1
library(ggplot2)
ggplot(data=cohort1, aes(x=Location,y=value,fill=variable))+geom_bar(stat="identity",colour="grey", position="dodge", main="Net variance by cohort")+theme(text = element_text(size=12),axis.text.x = element_text(angle=90, vjust=1))       
