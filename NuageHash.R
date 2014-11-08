
NuageHash<-function(MOT){
library("ROAuth")
library("twitteR")
library("wordcloud")
library("tm")
library(RColorBrewer)
load(file="twitter authentication.Rdata")
registerTwitterOAuth(cred)
Twts<- searchTwitter(paste('#',MOT,sep=''), n=2000, cainfo="cacert.pem")
Twts_txt<- sapply(Twts, function(x) x$getText())
Twts_corp<- Corpus(VectorSource(Twts_txt))
Twts_corp<- tm_map(Twts_corp, content_transformer(tolower))
Twts_corp<- tm_map(Twts_corp, removePunctuation)
Twts_corp<- tm_map(Twts_corp, function(x)removeWords(x,stopwords()))
pal2 <- brewer.pal(8,"Dark2")
return(wordcloud(Twts_corp,min.freq=5,max.words=100, random.order=T, colors=pal2))
}
