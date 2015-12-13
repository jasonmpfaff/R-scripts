install.packages("koRpus")
install.packages("tm")
install.packages("SnowballC")
source("http://bioconductor.org/biocLite.R")
biocLite("Rgraphviz")
install.packages("wordcloud")
library(Rgraphviz)
library(koRpus)
library(tm)
library(SnowballC)
library(wordcloud)
sept<-read.csv("surv.csv")
require(tm)

#clean#
septcorp<-Corpus(DataframeSource(sept))
inspect(septcorp)
septcorp<-tm_map(septcorp, removePunctuation)
septcorp<-tm_map(septcorp, removeNumbers)
septcorp<-tm_map(septcorp, stripWhitespace)
septcorp<-tm_map(septcorp, removeWords, stopwords("english"))
##septcorp<-tm_map(septcorp, removeWords, c("speak", "today", "Adrienne", "Crystal", "Colette", "Michael", "Jackie","Ron", "span", "can", "may", "will", "Phil"))
septcorp<-tm_map(septcorp, stemDocument)


#set up doc matrix
septdtm<-TermDocumentMatrix(septcorp)
septdtm
#analyze correlations / freq terms
findAssocs(septdtm, "instructor", corlimit=.3)
findAssocs(septdtm, "horrific", corlimit=.3)
findAssocs(septdtm, "students", corlimit=.3)
findAssocs(septdtm, "school", corlimit=.3)
findAssocs(septdtm, "money", corlimit=.3)
findAssocs(septdtm, "time", corlimit=.3)
findFreqTerms(septdtm, lowfreq=10)


#visuals
plot(septdtm, terms=findFreqTerms(septdtm, lowfreq=3500), corThreshold=.7, cex=3.5)
wordcloud(septcorp)
septdtm<-removeSparseTerms(septdtm, .99)

##cluster













