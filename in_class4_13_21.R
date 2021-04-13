
library(jsonlite)
library(dplyr)
library(tidyr)
library(ggplot2)
library(stringr)


##code adapted from Heather Geiger

setwd("~/Desktop/Penn State University/Spring 2021/PLSC 496/TAD_2021-master-5/R lessons")


NYTIMES_KEY <- ("QsPLuYp2xQ8C6KUuUqDhMDtAbAuO8HXv")

#term <- "facebook"
term <- "Immigration"
begin_date <- "20200101"
end_date <- "20200401"

baseurl <- paste0("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=",term,
                  "&begin_date=",begin_date,"&end_date=",end_date,
                  "&facet_filter=true&api-key=",NYTIMES_KEY, sep="")

initialQuery <- fromJSON(baseurl)

pages_2020 <- vector("list",length=5)

for(i in 0:4){
  nytSearch <- fromJSON(paste0(baseurl, "&page=", i), flatten = TRUE) %>% data.frame() 
  pages_2020[[i+1]] <- nytSearch 
  Sys.sleep(10) #I was getting errors more often when I waited only 1 second between calls. 5 seconds seems to work better.
}
#facebook_2020_articles <- rbind_pages(pages_2020)
Immigration_2020_articles <- rbind_pages(pages_2020)


#term <- "facebook"
term <- "Penn State"
begin_date <- "20210101"
end_date <- "20210401"

baseurl <- paste0("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=",term,
                  "&begin_date=",begin_date,"&end_date=",end_date,
                  "&facet_filter=true&api-key=",NYTIMES_KEY, sep="")

initialQuery <- fromJSON(baseurl)

pages_2021 <- vector("list",length=5)

for(i in 0:5){
  nytSearch <- fromJSON(paste0(baseurl, "&page=", i), flatten = TRUE) %>% data.frame()
  pages_2021[[i+1]] <- nytSearch
  Sys.sleep(10)
}
#facebook_2021_articles <- rbind_pages(pages_2021)

PennState_2021_articles <- rbind_pages(pages_2021)




#####in-class practice: 


### save the results of two different queries from the date range jan 1 2021 - APril 1 2021

#Immigration_2020_articles
#PennState_2021_articles
### calculate the proportion of the headlines from each search term assigned to a given section name
table(Immigration_2020_articles$response.docs.section_name)
table(PennState_2021_articles$response.docs.section_name)

## create a combined dfm with the text of all of the lead paragraphs

ImmigrationData_dfm <-dfm(Immigration_2020_articles$response.docs.lead_paragraph)
PennStatenData_dfm <-dfm(PennState_2021_articles$response.docs.lead_paragraph)

## calculate the average Flesch Reading Ease score (hint: use code form descriptive_2.R) for the lead paragraphs from each search term. Which is higher?
Immigration<-textstat_readability(Immigration_2020_articles$response.docs.lead_paragraph, "Flesch")

PennState<-textstat_readability(PennState_2021_articles$response.docs.lead_paragraph, "Flesch")
mean(Immigration$Flesch,na.rm=TRUE)
mean(PennState$Flesch,na.rm=TRUE)



















