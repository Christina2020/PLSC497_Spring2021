#Conceptual Questions:
#Question 1) What are latent variables?

#are variables that are not directly observed

#but are rather inferred from other variables that are observed.

#Question 2) What is stemming? How is it different from lemmatization? 

#stemming is the process of reducing a word down to stem and lemmatization is the process of groupong 
#together the inflected froms of a word so they can be analysed as a single item, identified by the 
#word's lemma, or dictionary form. stemming Shrinks the word down to its simplest parts while L bring forward 
#together to form a dictionary.

#Question 3) What is a document term matrix? Why is it usually sparse? 

#is a mathematical matrix that describes the frequency of terms that occur 
#in a collection of documents.In a document-term matrix, rows correspond to 
#documents in the collection and columns correspond to terms.
#To make it easier to access particular rows and columns as it will be 
#stored in a more efficient format and that's why it's sparse

#Question 4) Explain the tf-idf statistic and the advantage of using it 

#term frequency (tf) and inverse document frequency (idf)
#With TF you can determine how frequently a word appears in a document and with 
#IDF you can use to decrease the weight of a commonly use word and increase the 
#weight for words that are not use very much in a collection of documents. 
#This works wellIf you're trying to analyze a group of documents and you want 
#to cut out all the over the use words or Star Wars such as the, is, of.
#





#Question 5) Explain Zipf’s Law as it applies to text data

#Is the study of frequency of words in a corpus of
#natural language utterance and states that the frequency of 
#any word is inversely proportional to the rank and the frequency table.
#It is the ability to go from qualitative to quantitative when analyzing text data. 
#You have the ability to assign words of value or how frequently they occur in a 
#document and that they will be proportion to its rank in the frequency table.



#Coding Parts
#question 1
install.packages("quanteda")
require(quanteda)
install.packages("readtext")
library("tm")
library("quanteda")
library("readtext")
txt <- c(sent1 = "This is an example of the summary method for character objects.",
         sent2 = "The cat in the hat swung the bat.")
summary(txt)



summary(corpus(data_char_ukimmig2010, notes = "Created as a demo."))
corp <- data_corpus_inaugural
#Question 2
corp$LastName <- paste(data_corpus_inaugural$President)
docvars(corp, "President") <- paste("prez", 1:ndoc(corp), sep = "")
head(docvars(corp))
toks <- tokens(corpus_subset(data_corpus_inaugural, Year <= 1805))
toks$Year
toks$Year <- 1991:1995
toks$Year
toks$nonexistent <- TRUE
docvars(toks)
myDfm <- dfm(corpus_subset(data_corpus_inaugural, Year > 1861))
textstat_lexdiv(myDfm, "R")
LincolnDoc <- textstat_readability(corpus_subset(data_corpus_inaugural, Year > 1861), measure = "Flesch.Kincaid")
head(LincolnDoc) 
textstat_simil(presDfm, "1865-Lincoln",  margin = "documents")
textstat_simil(presDfm, presDfm[c("1861-Lincoln", "1865-Lincoln"), ], margin = "documents")
tstat3 <- textstat_simil(presDfm, presDfm[, c("fair", "health", "terror")], method = "cosine", margin = "features")
head(as.matrix(tstat3), 10)
as.list(tstat3, n = 6)
NewData1<-docvars(corp, "President") <- paste(data_corpus_inaugural$President, sep = "")
NewData<-docvars(corp, "President") <- paste("prez", 1:ndoc(corp), sep = "")
head(docvars(corp))
#Question 3
presDfm <- dfm(corpus_subset(data_corpus_inaugural, Year > 1700), stem = TRUE,
               remove = stopwords("english"))
presDfm <- dfm_trim(presDfm, min_termfreq = 5, min_docfreq = 3)



