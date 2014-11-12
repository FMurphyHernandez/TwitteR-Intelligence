
NuageHash<-function(MOT,com='2014-11-01',fin='2014-11-09',lieu='DF'){
library("ROAuth")
library("twitteR")
library("wordcloud")
library("tm")
library(RColorBrewer)
load(file="twitter authentication.Rdata")
registerTwitterOAuth(cred)


Twts<- searchTwitter(p,n=1000, lang='es', since=com,until=fin,geocode=loc,retryOnRateLimit=10,cainfo="cacert.pem")
Twts_txt<- sapply(Twts, function(x) x$getText())

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

TwtsClean<-clean.text(Twts_txt)
TWT<- paste(TwtsClean, collapse=" ")
TWT<- removeWords(TWT,stopwords("es"))
Twts_corp<- Corpus(VectorSource(TWT))

pal2 <- brewer.pal(8,"Dark2")
return(wordcloud(Twts_corp,min.freq=2,max.words=200, random.order=T, colors=pal2))
}
