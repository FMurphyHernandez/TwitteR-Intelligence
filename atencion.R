atencion<-function(x){
if(x=='telcel')mot='@ServicioTelcel'
if(x=='movistar')mot='@mimovistarmx'
if(x=='iusacell')mot='@iusacell24_7'
library("twitteR")
load(file="twitter authentication.Rdata")
registerTwitterOAuth(cred)
twts<-searchTwitter(mot,n=100,cainfo="cacert.pem")
twts<-twListToDF(twts)
twts<-twts[is.na(twts$replyToSN),c(1,5,8,11)]
twts$tiempo<-difftime(Sys.time(),twts$created)
return(twts)
}
