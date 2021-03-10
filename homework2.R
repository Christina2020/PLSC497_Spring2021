install.packages("coop")

library(quanteda)
library(quanteda.textmodels)
library(readtext)
library(dplyr)
library(coop)

##load in data
data("data_corpus_inaugural")
df <- texts(data_corpus_inaugural)

# Question 1
# a
df[49]
df[50]
new5_txt<-corpus(df[49])

new3_txt<-dfm(new5_txt, remove = stopwords("english") )
?textstat_lexdiv
textstat_lexdiv(new3_txt,measure = c("TTR"))
new4_txt<-corpus(df[50])
new7_txt<-dfm(new4_txt, remove = stopwords("english") )
?textstat_lexdiv
textstat_lexdiv(new7_txt,measure = c("TTR"))
#b

mat<-dfm(c(new5_txt,new4_txt))





# Question 2

# a
presDfm <- dfm(corpus_subset(data_corpus_inaugural[49:50], Year > 1977), stem = TRUE)
textstat_lexdiv(presDfm,measure = c("TTR"))
# b
presDfm <- dfm(corpus_subset(data_corpus_inaugural[49:50], Year > 1977), stem = TRUE, remove = stopwords("english"))
textstat_lexdiv(presDfm,measure = c("TTR"))
# c

presDfm <- dfm(corpus_subset(data_corpus_inaugural[49:50], Year >1977), stem = TRUE, remove = stopwords("english"), tolower = TRUE)
textstat_lexdiv(presDfm,measure = c("TTR"))
# d
#There will be no change in the TTROr very little change because this function will
#have a small effect on the TTR


# 3
text1 <- c("Trump Says He’s ‘Not Happy’ With Border Deal, but Doesn’t Say if He Will Sign It.",
            "Trump ‘not happy’ with border deal, weighing options for building wall.")
mat22<-dfm(c(text1))
text_1 <-c(1,1,1,2,1,1,1,1,1,1)
text_2<-c(1,0,0,2,1,1,1,1,1,1)
fm <- matrix(c(text_1,text_2), byrow=T, nrow=2)
# a
dist1<-stats::dist(mat22, method = "euclidean")
euclidean <- function(text_1, text_2) sqrt(sum((text_1 - text_2)^2))

# b 
dist2<-stats::dist(mat22, method = "manhattan")
dv1 <- abs(fm[1,1]-fm[1,10]) + abs(fm[2,1]-fm[2,10])
dv1
# c

c<-cosine(mat22) 








