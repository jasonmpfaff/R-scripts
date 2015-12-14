install.packages("koRpus")
install.packages("tm")
install.packages("SnowballC")
source("http://bioconductor.org/biocLite.R")
biocLite("Rgraphviz")
install.packages("wordcloud")
install.packages("RColorBrewer")

library(RColorBrewer)
library(wordcloud)
library(SnowballC)
library(tm)
library(koRpus)
library(Rgraphviz)

surv<-read.csv("complaints.csv")
surv_corpus<-Corpus(DataframeSource(surv))
inspect(surv_corpus)

survey_corpus<-tm_map(surv_corpus, tolower)
survey_corpus<-tm_map(surv_corpus, removePunctuation)
survey_corpus<-tm_map(surv_corpus, removeWords, stopwords("english"))


survey_corpus<-tm_map(surv_corpus, PlainTextDocument)
survey_corpus
inspect(survey_corpus)

######initial viz to check data execution
palette<-brewer.pal(9,"BuGn")
palette<-palette[-(1:4)]
wordcloud(survey_corpus, colors=palette)
###

####create term doc matrix#####

survey_corpus_dtm<-TermDocumentMatrix(survey_corpus)
survey_corpus_dtm

findFreqTerms(survey_corpus_dtm, lowfreq=10)

findAssocs(survey_corpus_dtm, "teachers", corlimit=.3)
findAssocs(survey_corpus_dtm, "horrible", corlimit=.3)
findAssocs(survey_corpus_dtm, "students", corlimit=.3)
findAssocs(survey_corpus_dtm, "test", corlimit=.3)
findAssocs(survey_corpus_dtm, "money", corlimit=.3)
findAssocs(survey_corpus_dtm, "hate", corlimit=.3)
findAssocs(survey_corpus_dtm, "sick", corlimit=.3)
findAssocs(survey_corpus_dtm, "tired", corlimit=.3)
findAssocs(survey_corpus_dtm, "joke", corlimit=.3)


plot(survey_corpus_dtm, (freqterms[1:12]), weighting=TRUE, corThreshold=.05, cex=1.5)

##hierarchical cluster plot##
survey_corpus_dtm2<-removeSparseTerms(survey_corpus_dtm, sparse=.93)
survey_corpus_dtm3<-as.matrix(survey_corpus_dtm2)
distMatrix<-dist(scale(survey_corpus_dtm3))
survey.fit<-hclust(distMatrix, method="ward")
plot(survey.fit, cex=1, hang=1, main="K=6")
rect.hclust(survey.fit, k=6)
survey_corpus

doc1<-read.csv("complaints.csv")
doc2<-read.csv("complaints.csv")
doc3<-read.csv("complaints.csv")
doc4<-read.csv("complaints.csv")
doc5<-read.csv("complaints.csv")
doc6<-read.csv("complaints.csv")
doc7<-read.csv("complaints.csv")

doc.list <- list(doc1, doc2, doc3, doc4, doc5, doc6, doc7)
N.docs <- length(doc.list)
names(doc.list) <- paste0("doc", c(1:N.docs))

query <- "You love class"

my.docs <- VectorSource(c(doc.list, query))
my.docs$Names <- c(names(doc.list), "query")

my.corpus <- Corpus(my.docs)
my.corpus

my.corpus <- tm_map(my.corpus, removePunctuation)
my.corpus$doc1

my.corpus <- tm_map(my.corpus, stemDocument)
my.corpus$doc1

my.corpus <- tm_map(my.corpus, removeNumbers)
my.corpus <- tm_map(my.corpus, tolower)
my.corpus <- tm_map(my.corpus, stripWhitespace)
my.corpus$doc1
corpus_clean <- tm_map(my.corpus, PlainTextDocument)
term.doc.matrix.stm <- TermDocumentMatrix(corpus_clean)
inspect(term.doc.matrix.stm[0:14, ])

term.doc.matrix <- as.matrix(term.doc.matrix.stm)

cat("Dense matrix representation costs", object.size(term.doc.matrix), "bytes.\n", 
    "Simple triplet matrix representation costs", object.size(term.doc.matrix.stm), 
    "bytes.")

get.tf.idf.weights <- function(tf.vec, df) {
  # Computes tfidf weights from a term frequency vector and a document
  # frequency scalar
  weight = rep(0, length(tf.vec))
  weight[tf.vec > 0] = (1 + log2(tf.vec[tf.vec > 0])) * log2(N.docs/df)
  weight
}

cat("A word appearing in 4 of 6 documents, occuring 1, 2, 3, and 6 times, respectively: \n", 
    get.tf.idf.weights(c(1, 2, 3, 0, 0, 6), 4))

get.weights.per.term.vec <- function(tfidf.row) {
  term.df <- sum(tfidf.row[1:N.docs] > 0)
  tf.idf.vec <- get.tf.idf.weights(tfidf.row, term.df)
  return(tf.idf.vec)
}

tfidf.matrix <- t(apply(term.doc.matrix, c(1), FUN = get.weights.per.term.vec))
colnames(tfidf.matrix) <- colnames(term.doc.matrix)

tfidf.matrix[0:3, ]

angle <- seq(-pi, pi, by = pi/16)
plot(cos(angle) ~ angle, type = "b", xlab = "angle in radians", main = "Cosine similarity by angle")

tfidf.matrix <- scale(tfidf.matrix, center = FALSE, scale = sqrt(colSums(tfidf.matrix^2)))
tfidf.matrix[0:3, ]

query.vector <- tfidf.matrix[, (N.docs + 1)]
tfidf.matrix <- tfidf.matrix[, 1:N.docs]

doc.scores <- t(query.vector) %*% tfidf.matrix

results.df <- data.frame(doc = names(doc.list), score = t(doc.scores), text = unlist(doc.list))
results.df <- results.df[order(results.df$score, decreasing = TRUE), ]

options(width = 2000)
print(results.df, row.names = FALSE, right = FALSE, digits = 2)





