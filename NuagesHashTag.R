install.packages("ROAuth")
install.packages("twitteR")
install.packages("wordcloud")
install.packages("tm")
install.packages('RColorBrewer')

  download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")
  KEY<-'OMpVDANlNCYr13xHRzOCZJDtg'
  SECRET<-'pSR2wofinQu0Uni8FwOfSC50MGIk4HvW9CA5LbpmkDnLSV4h1r'
  cred <- OAuthFactory$new(consumerKey = KEY, 
    consumerSecret = SECRET,
    requestURL = "https://api.twitter.com/oauth/request_token", 
    accessURL = "https://api.twitter.com/oauth/access_token", 
    authURL = "https://api.twitter.com/oauth/authorize")
cred$handshake(cainfo="cacert.pem")
##PARAR PARA METER PIN
save(cred, file="twitter authentication.Rdata")



NuageHash<-function(MOT){
  library("ROAuth")
  library("twitteR")
  library("wordcloud")
  library("tm")
  library(RColorBrewer)
  load(file="twitter authentication.Rdata")
  registerTwitterOAuth(cred)
  r_stats<- searchTwitter(paste('#',MOT,sep=''), n=500, cainfo="cacert.pem")
  r_stats_text <- sapply(r_stats, function(x) x$getText())
  r_stats_text_corpus <- Corpus(VectorSource(r_stats_text))
  r_stats_text_corpus <- tm_map(r_stats_text_corpus, content_transformer(tolower))
  r_stats_text_corpus <- tm_map(r_stats_text_corpus, removePunctuation)
  r_stats_text_corpus <- tm_map(r_stats_text_corpus, function(x)removeWords(x,stopwords()))
  pal2 <- brewer.pal(8,"Dark2")
  return(wordcloud(r_stats_text_corpus,min.freq=2,max.words=100, random.order=T, colors=pal2))
  }
  
  
  
