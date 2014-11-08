
NuageHash<-function(MOT){
library("ROAuth")
library("twitteR")
library("wordcloud")
library("tm")
library(RColorBrewer)
load(file="twitter authentication.Rdata")
registerTwitterOAuth(cred)
Twts<- searchTwitter(paste('#',MOT,sep=''), n=500, cainfo="cacert.pem")
Twts<- sapply(r_stats, function(x) x$getText())
Twts <- Corpus(VectorSource(Twts))
Twts<- tm_map(Twts, content_transformer(tolower))
Twts<- tm_map(Twts, removePunctuation)
r_stats_text_corpus <- tm_map(Twts, function(x)removeWords(x,stopwords()))
pal2 <- brewer.pal(8,"Dark2")
return(wordcloud(Twts,min.freq=2,max.words=100, random.order=T, colors=pal2))
}
