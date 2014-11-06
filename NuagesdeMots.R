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



Nuage<-function(x){
  library(twitteR)
  library(ROAuth)
  load(file="twitter authentication.Rdata")
  registerTwitterOAuth(cred)
  
  
  
  
  
  
