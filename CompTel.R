CompTel<-function(com='2014-11-01',fin='2014-11-09'){
library("ROAuth")
library("twitteR")
library("wordcloud")
library("tm")
library(RColorBrewer)
load(file="twitter authentication.Rdata")
registerTwitterOAuth(cred)
TwtsMov<- searchTwitter('#Movistar', lang='es', since=com,until=fin,retryOnRateLimit=5,cainfo="cacert.pem")
TwtsTel<- searchTwitter('#Telcel', lang='es', since=com,until=fin,retryOnRateLimit=5,cainfo="cacert.pem")
TwtsUne<- searchTwitter('#Unefon', lang='es', since=com,until=fin,retryOnRateLimit=5,cainfo="cacert.pem")
TwtsIus<- searchTwitter('#Iusacell', lang='es', since=com,until=fin,retryOnRateLimit=5,cainfo="cacert.pem")
TwtsNex<- searchTwitter('#Nextel', lang='es', since=com,until=fin,retryOnRateLimit=5,cainfo="cacert.pem")

TwtsMov_txt<- sapply(TwtsMov, function(x) x$getText())
TwtsTel_txt<- sapply(TwtsTel, function(x) x$getText())
TwtsUne_txt<- sapply(TwtsUne, function(x) x$getText())
TwtsIus_txt<- sapply(TwtsIus, function(x) x$getText())
TwtsNex_txt<- sapply(TwtsNex, function(x) x$getText())

clean.text <- function(x)
{
   # tolower
   x <- tolower(x)
   # remove rt
   x <-gsub("rt", "", x)
   # remove at
   x <- gsub("@\\w+", "", x)
   # remove punctuation
   x <- gsub("[[:punct:]]", "", x)
   # remove numbers
   x <- gsub("[[:digit:]]", "", x)
   # remove links http
   x <- gsub("http\\w+", "", x)
   # remove tabs
   x <- gsub("[ |\t]{2,}", "", x)
   # remove blank spaces at the beginning
   x <- gsub("^ ", "", x)
   # remove blank spaces at the end
   x <- gsub(" $", "", x)
   return(x)
}

cleanMov<-clean.text(TwtsMov_txt)
cleanTel<-clean.text(TwtsTel_txt)
cleanUne<-clean.text(TwtsUne_txt)
cleanIus<-clean.text(TwtsIus_txt)
cleanNex<-clean.text(TwtsNex_txt)

Mov<- paste(cleanMov, collapse=" ")
Tel<- paste(cleanTel, collapse=" ")
Une<- paste(cleanUne, collapse=" ")
Ius<- paste(cleanIus, collapse=" ")
Nex<- paste(cleanNex, collapse=" ")



all <- c(Mov,Tel,Une,Ius,Nex)
all <- removeWords(all,c(stopwords('es'), 'Movistar','movistar', 'Telcel','telcel','Unefon','unefon','Iusacell','iusacell','Nextel','nextel'))


corpus = Corpus(VectorSource(all))
tdm = TermDocumentMatrix(corpus)
tdm = as.matrix(tdm)
colnames(tdm) = c('Movistar', 'Telcel','Unefon','Iusacell','Nextel')
return(comparison.cloud(tdm, random.order=FALSE, 
colors = c('chartreuse','blue1','gold','firebrick1','deepskyblue'),
title.size=1.5, max.words=200))

}


