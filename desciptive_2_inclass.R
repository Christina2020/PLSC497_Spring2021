# Descriptive practice


#1. Write two sentences. Save each as a seperate object in R. 

require(quanteda)
library(quanteda)

new5<-c(txt1 = "May the force be with you",
         txt2 = "I have one vehicle that I love to drive ")
#2. Combine them into a corpus
new5_txt<-corpus(new5)
#col1<- paste(new5, collapse = ", " )
#3. Make this corpus into a dfm with all pre-processing options at their defaults.
?dfm
new4_txt<-dfm(new5_txt)
#4. Now save a second dfm, this time with stopwords removed.

new3_txt<-dfm(new5_txt, remove = stopwords("english") )

#5. Calculate the TTR for each of these dfms (use textstat_lexdiv). Which is higher?
?textstat_lexdiv

textstat_lexdiv(new3_txt,measure = c("TTR"))

textstat_lexdiv(new4_txt,measure = c("TTR"))

#6. Calculate the Manhattan distance between the two sentences you've constructed (by hand!)

#|x1 - x2| + |y1 - y2|. 
0












