#install.packages("dplyr")#
library(dplyr)

#read sheet with data by channel and lead age for gross enrolls#
Lead<-read.csv("LeadTime.csv")

#check the data loaded#
dim(Lead)
head(Lead)

#scan in weekly totals for time series line and bar graph of totals#
weekly<-scan("weekly.csv")
leadtimeseries <- ts(weekly, frequency=52, start=c(2013,26))

#scan in totals by week#
LeadWeeks<-read.csv("LeadWeeks.csv")
LeadWeeksbar<-(LeadWeeks$NumLeads)
barplot(LeadWeeksbar, col="red", ylab="lead volume", xlab="weeks", main = "Weekly Lead Volume", horiz=FALSE, names.arg=LeadWeeks$Week, axes=TRUE)
plot(leadtimeseries, main="Lead volume by week", ylab="Lead Volume", xlab="weeks")

##daily lead volume all but HS##

LeadDay1<-read.csv("LeadDay1.csv")
Day1<-filter(LeadDay1, LeadChannel!="EV - High School")
Day2<-group_by(Day1,LeadDate)
Day3<-summarise(Day2, NumLeads=sum(NumLeads))
Day4<-data.frame(Day3)
barplot(Day3$NumLeads, names.arg=Day3$LeadDate, xlab="Daily Lead Volume excluding High School", ylab="Volume", main="Daily Lead Volume")

####daily volume PWL
LeadDayPWL<-read.csv("LeadDay1.csv")
DayPWL<-filter(LeadDayPWL, LeadChannel=="PWL - WEB")
Day2PWL<-group_by(DayPWL,LeadDate)
Day3PWL<-summarise(Day2PWL, NumLeads=sum(NumLeads))
DayPWL<-data.frame(Day3PWL)
barplot(Day3PWL$NumLeads, names.arg=Day3PWL$LeadDate, xlab="Daily Lead Volume from PWL", ylab="Volume", main="Daily PWL Volume")

##start period analysis##

July13<-filter(Lead, StartDate=="7/10/2013")
mean(July13$NumDaysBeforeStart)
median(July13$NumDaysBeforeStart)
hist(July13$NumDaysBeforeStart, breaks=30, col="blue",main="July 2013", mtext("344 starts from leads > 100 days", side= 3), ylab="Starts", xlab="lead volume in 10 day buckets", ylim=c(0,250))
July13100<-subset(July13, NumDaysBeforeStart>=100)
nrow(July13100)



July13<-filter(Lead, StartDate=="7/10/2013")
mean(July13$NumDaysBeforeStart)
median(July13$NumDaysBeforeStart)
hist(July13$NumDaysBeforeStart, breaks=30, col="blue",main="July 2013", mtext("344 starts from leads > 100 days", side= 3), ylab="Starts", xlab="lead volume in 10 day buckets", ylim=c(0,250))
July13100<-subset(July13, NumDaysBeforeStart>=100)
nrow(July13100)

Oct13<-filter(Lead, StartDate=="10/2/2013")
mean(Oct13$NumDaysBeforeStart)
median(Oct13$NumDaysBeforeStart)
hist(Oct13$NumDaysBeforeStart, breaks=30, col="blue",main="October 2013", mtext("249 starts from leads > 100 days",side=3), ylab="Lead Volume", xlab="lead volume in 10 day buckets")
Oct13100<-subset(Oct13, NumDaysBeforeStart>=100)
nrow(Oct13100)

Jan14<-filter(Lead, StartDate=="1/22/2014")
mean(Jan14$NumDaysBeforeStart)
median(Jan14$NumDaysBeforeStart)
hist(Jan14$NumDaysBeforeStart, breaks=30, col="blue", main="January 2014", mtext("371 starts from leads > 100 days",side=3), ylab="Lead Volume", xlab="lead volume in 10 day buckets")
Jan14100<-subset(Jan14, NumDaysBeforeStart>=100)
nrow(Jan14100)

Apr14<-filter(Lead, StartDate=="4/16/2014")
mean(Apr14$NumDaysBeforeStart)
median(Apr14$NumDaysBeforeStart)
hist(Apr14$NumDaysBeforeStart, breaks=30, col="blue", main="April 2014", mtext("153 starts from leads > 100 days", side=3), ylab="Lead Volume", xlab="lead volume in 10 day buckets")
Apr14100<-subset(Apr14, NumDaysBeforeStart>=100)
nrow(Apr14100)

July14<-filter(Lead, StartDate=="7/16/2014")
mean(July14$NumDaysBeforeStart)
median(July14$NumDaysBeforeStart)
hist(July14$NumDaysBeforeStart, breaks=30, col="blue", main="July 2014", mtext("441 starts from leads > 100 days old", side=3), ylab="Lead Volume", xlab="lead volume in 10 day buckets")
July14100<-subset(July14, NumDaysBeforeStart>=100)
nrow(July14100)
July14120<-subset(July14, NumDaysBeforeStart>=100 & NumDaysBeforeStart<=120)
nrow(July14120)

Oct14<-filter(Lead, StartDate=="10/7/2014")
mean(Oct14$NumDaysBeforeStart)
median(Oct14$NumDaysBeforeStart)
hist(Oct14$NumDaysBeforeStart, breaks=30, col="blue", main="Oct 2014", mtext("197 starts from leads > 100 days old", side=3), ylab="Lead Volume", xlab="lead volume in 10 day buckets")
Oct14100<-subset(Oct14, NumDaysBeforeStart>=100)
nrow(Oct14100)
Oct14120<-subset(Oct14, NumDaysBeforeStart>=100 & NumDaysBeforeStart<=120)
nrow(Oct14120)

attach(Lead)

##build density plots##


a <- density(July13$NumDaysBeforeStart)
plot(a, main="Distribution of time between lead create and start date",xlab="July mean = 73 days from lead create to start")
polygon(a, col="red", border="blue")
b<-density(Oct13$NumDaysBeforeStart)
plot(b, main="Distribution of time between lead create and start date", xlab="October mean = 58 days from lead create to start")
polygon(b, col="red", border="red")
c<-density(Jan14$NumDaysBeforeStart)
plot(c, main="Distribution of time between lead create and start date", xlab="January mean = 63 days from lead create to start")
polygon(c, col="red", border="blue")
d<-density(Apr14$NumDaysBeforeStart)
plot(d, main="Distribution of time between lead create and start date", xlab="April mean = 51 days from lead create to start")
polygon(d, col="red", border="blue")
e<-density(July14$NumDaysBeforeStart)
plot(e, main="Distribution of time between lead create and start date", xlab="July mean = 71 days from lead create to start")
polygon(e, col="red", border="lightgreen")
h<-density(Oct14$NumDaysBeforeStart)
plot(h, main="Distribution of time between lead create and start date", xlab="October 14 mean = 60 days from lead create to start")
polygon(h, col="red", border="red")
f<-density(PWLJan$NumDaysBeforeStart)
plot(f, main="Distribution of time between lead create and start date--PWL January", xlab="PWL Jan",sub="mean= 68 days from lead create to start")
polygon(f, col="red", border="lightgreen")
g<-density(PWLJuly$NumDaysBeforeStart)
plot(g, main="Distribution of time between lead create and start date", xlab="PWL July",sub="mean= 61 days from lead create to start")
polygon(g, col="red", border="lightgreen")
k<-density(PWLOct$NumDaysBeforeStart)
plot(k, main="Distribution of time between lead create and start date", xlab="PWL Oct",sub="mean= 66 days from lead create to start")
polygon(k, col="red", border="lightgreen")

##channel analysis##

channel<-read.csv("leadchannel.csv")

PWL<-filter(channel, LeadChannel=="PWL - WEB")
mean(PWL$NumDaysBeforeStart)
median(PWL$NumDaysBeforeStart)
hist(PWL$NumDaysBeforeStart, breaks=30, col="orange", main="PWL", sub="334 starts from leads > 100 days old", ylab="Lead Volume", xlab="")
PWL100<-subset(PWL, NumDaysBeforeStart>=100)
nrow(PWL100)

INT<-filter(channel, LeadChannel=="INT - Default")
mean(INT$NumDaysBeforeStart)
median(INT$NumDaysBeforeStart)
hist(INT$NumDaysBeforeStart, breaks=30, col="orange", main="INT", sub="733 starts from leads > 100 days old", ylab="Lead Volume", xlab="")
INT100<-subset(INT, NumDaysBeforeStart>=100)
nrow(INT100)

INTSEM<-filter(channel, LeadChannel=="INT - SEM")
mean(INTSEM$NumDaysBeforeStart)
median(INTSEM$NumDaysBeforeStart)
hist(INTSEM$NumDaysBeforeStart, breaks=30, col="orange", main="INT  SEM", sub="331 starts from leads > 100 days old", ylab="Lead Volume", xlab="")
INTSEM100<-subset(INTSEM, NumDaysBeforeStart>=100)
nrow(INTSEM100)

##channel by start period analysis PWL##

PWLJuly<-filter(channel, LeadChannel=="PWL - WEB", StartDate=="7/16/2014")
mean(PWLJuly$NumDaysBeforeStart)
median(PWLJuly$NumDaysBeforeStart)
hist(PWLJuly$NumDaysBeforeStart, breaks=30, col="red", main="PWL July", sub="62 starts from leads > 100 days old", ylab="Lead Volume", xlab="")
PWLJuly100<-subset(PWLJuly, NumDaysBeforeStart>=90)
nrow(PWLJuly100)

PWLApr<-filter(channel, LeadChannel=="PWL - WEB", StartDate=="4/16/2014")
mean(PWLApr$NumDaysBeforeStart)
median(PWLApr$NumDaysBeforeStart)
hist(PWLApr$NumDaysBeforeStart, breaks=30, col="red", main="PWL Apr", sub="36 starts from leads > 100 days old", ylab="Lead Volume", xlab="")
PWLApr100<-subset(PWLApr, NumDaysBeforeStart>=90)
nrow(PWLApr100)

PWLJuly13<-filter(channel, LeadChannel=="PWL - WEB", StartDate=="7/10/2013")
mean(PWLJuly13$NumDaysBeforeStart)
median(PWLJuly13$NumDaysBeforeStart)
hist(PWLJuly13$NumDaysBeforeStart, breaks=30, col="red", main="PWL July 13", sub="34 starts from leads > 100 days old", ylab="Lead Volume", xlab="")
PWLJuly10013<-subset(PWLJuly13, NumDaysBeforeStart>=90)
nrow(PWLJuly10013)

PWLJan<-filter(channel, LeadChannel=="PWL - WEB", StartDate=="1/22/2014")
mean(PWLJan$NumDaysBeforeStart)
median(PWLJan$NumDaysBeforeStart)
hist(PWLJan$NumDaysBeforeStart, breaks=30, col="red", main="PWL January", sub="", ylab="Lead Volume", xlab="51 starts from leads > 100 days old")
PWLJan100<-subset(PWLJan, NumDaysBeforeStart>=100)
nrow(PWLJan100)

PWLOct<-filter(channel, LeadChannel=="PWL - WEB", StartDate=="10/7/2014")
mean(PWLOct$NumDaysBeforeStart)
median(PWLOct$NumDaysBeforeStart)
hist(PWLOct$NumDaysBeforeStart, breaks=30, col="red", main="PWL October 2014", sub="", ylab="Lead Volume", xlab="40 starts from leads > 100 days old")
PWLOct100<-subset(PWLOct, NumDaysBeforeStart>=100)
nrow(PWLOct100)

PWLOct13<-filter(channel, LeadChannel=="PWL - WEB", StartDate=="10/2/2013")
mean(PWLOct13$NumDaysBeforeStart)
median(PWLOct13$NumDaysBeforeStart)
hist(PWLOct13$NumDaysBeforeStart, breaks=30, col="red", main="PWL October 2013", sub="", ylab="Lead Volume", xlab="29 starts from leads > 100 days old")
PWLOct10013<-subset(PWLOct13, NumDaysBeforeStart>=100)
nrow(PWLOct10013)

##INT - Deafult


INT<-filter(channel, LeadChannel=="INT - Default")
mean(INT$NumDaysBeforeStart)
median(INT$NumDaysBeforeStart)
hist(INT$NumDaysBeforeStart, breaks=30, col="gray", main="INT", sub="733 starts from leads > 100 days old", ylab="Lead Volume", xlab="")
INT100<-subset(INT, NumDaysBeforeStart>=100)
nrow(INT100)

INTJuly<-filter(channel, LeadChannel=="INT - Default", StartDate=="7/16/2014")
mean(INTJuly$NumDaysBeforeStart)
median(INTJuly$NumDaysBeforeStart)
hist(INTJuly$NumDaysBeforeStart, breaks=30, col="gray", main="INT - Default July", sub="138 starts from leads > 100 days old", ylab="Lead Volume", xlab="")
INTJuly100<-subset(INTJuly, NumDaysBeforeStart>=100)
nrow(INTJuly100)

INTJuly13<-filter(channel, LeadChannel=="INT - Default", StartDate=="7/10/2013")
mean(INTJuly13$NumDaysBeforeStart)
median(INTJuly13$NumDaysBeforeStart)
hist(INTJuly13$NumDaysBeforeStart, breaks=30, col="gray", main="INT - Default July 13", sub="127 starts from leads > 100 days old", ylab="Lead Volume", xlab="")
INTJuly10013<-subset(INTJuly13, NumDaysBeforeStart>=100)
nrow(INTJuly10013)

INTJan<-filter(channel, LeadChannel=="INT - Default", StartDate=="1/22/2014")
mean(INTJan$NumDaysBeforeStart)
median(INTJan$NumDaysBeforeStart)
hist(INTJan$NumDaysBeforeStart, breaks=30, col="gray", main="INT - Default January", sub="", ylab="Lead Volume", xlab="124 starts from leads > 100 days old")
INTJan100<-subset(INTJan, NumDaysBeforeStart>=100)
nrow(INTJan100)

INTApr<-filter(channel, LeadChannel=="INT - Default", StartDate=="4/16/2014")
mean(INTApr$NumDaysBeforeStart)
median(INTApr$NumDaysBeforeStart)
hist(INTApr$NumDaysBeforeStart, breaks=30, col="gray", main="INT - Default April", sub="", ylab="Lead Volume", xlab="48 starts from leads > 100 days old")
INTApr100<-subset(INTApr, NumDaysBeforeStart>=100)
nrow(INTApr100)


INTOct<-filter(channel, LeadChannel=="INT - Default", StartDate=="10/7/2014")
mean(INTOct$NumDaysBeforeStart)
median(INTOct$NumDaysBeforeStart)
hist(INTOct$NumDaysBeforeStart, breaks=30, col="gray", main="INT- Default October 2014", sub="", ylab="Lead Volume", xlab="58 starts from leads > 100 days old")
INTOct100<-subset(INTOct, NumDaysBeforeStart>=100)
nrow(INTOct100)

INTOct13<-filter(channel, LeadChannel=="INT - Default", StartDate=="10/2/2013")
mean(INTOct13$NumDaysBeforeStart)
median(INTOct13$NumDaysBeforeStart)
hist(INTOct13$NumDaysBeforeStart, breaks=30, col="gray", main="INT - Default October 2013", sub="", ylab="Lead Volume", xlab="72 starts from leads > 100 days old")
INTOct10013<-subset(INTOct13, NumDaysBeforeStart>=100)
nrow(INTOct10013)


###SEM###


SEMJuly<-filter(channel, LeadChannel=="INT - SEM", StartDate=="7/16/2014")
mean(SEMJuly$NumDaysBeforeStart)
median(SEMJuly$NumDaysBeforeStart)
hist(SEMJuly$NumDaysBeforeStart, breaks=30, col="blue", main="INT - SEM July", sub="72 starts from leads > 100 days old", ylab="Lead Volume", xlab="")
SEMJuly100<-subset(SEMJuly, NumDaysBeforeStart>=100)
nrow(SEMJuly100)

SEMJuly13<-filter(channel, LeadChannel=="INT - SEM", StartDate=="7/10/2013")
mean(SEMJuly13$NumDaysBeforeStart)
median(SEMJuly13$NumDaysBeforeStart)
hist(SEMJuly13$NumDaysBeforeStart, breaks=30, col="blue", main="INT - SEM July 13", sub="71 starts from leads > 100 days old", ylab="Lead Volume", xlab="")
SEMJuly10013<-subset(SEMJuly13, NumDaysBeforeStart>=100)
nrow(SEMJuly10013)

SEMJan<-filter(channel, LeadChannel=="INT - SEM", StartDate=="1/22/2014")
mean(SEMJan$NumDaysBeforeStart)
median(SEMJan$NumDaysBeforeStart)
hist(SEMJan$NumDaysBeforeStart, breaks=30, col="blue", main="INT - SEM January", sub="", ylab="Lead Volume", xlab="41 starts from leads > 100 days old")
SEMJan100<-subset(SEMJan, NumDaysBeforeStart>=100)
nrow(SEMJan100)

SEMApr<-filter(channel, LeadChannel=="INT - SEM", StartDate=="4/16/2014")
mean(SEMApr$NumDaysBeforeStart)
median(SEMApr$NumDaysBeforeStart)
hist(SEMApr$NumDaysBeforeStart, breaks=30, col="blue", main="INT - SEM April", sub="", ylab="Lead Volume", xlab="14 starts from leads > 100 days old")
SEMApr100<-subset(SEMApr, NumDaysBeforeStart>=100)
nrow(SEMApr100)


SEMOct<-filter(channel, LeadChannel=="INT - SEM", StartDate=="10/7/2014")
mean(SEMOct$NumDaysBeforeStart)
median(SEMOct$NumDaysBeforeStart)
hist(SEMOct$NumDaysBeforeStart, breaks=30, col="blue", main="INT- SEM October 2014", sub="", ylab="Lead Volume", xlab="26 starts from leads > 100 days old")
SEMOct100<-subset(SEMOct, NumDaysBeforeStart>=100)
nrow(SEMOct100)

SEMOct13<-filter(channel, LeadChannel=="INT - SEM", StartDate=="10/2/2013")
mean(SEMOct13$NumDaysBeforeStart)
median(SEMOct13$NumDaysBeforeStart)
hist(SEMOct13$NumDaysBeforeStart, breaks=30, col="blue", main="INT - SEM October 2013", sub="", ylab="Lead Volume", xlab="36 starts from leads > 100 days old")
SEMOct10013<-subset(SEMOct13, NumDaysBeforeStart>=100)
nrow(SEMOct10013)








