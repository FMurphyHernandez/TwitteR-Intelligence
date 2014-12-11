

k<-1000

library("twitteR")
library(RODBC)
load(file="twitter authentication.Rdata")
registerTwitterOAuth(cred)
chanel <- odbcConnect("Ral98SN",uid = "********", pwd = "**********")
cadsql<-'select id from dbo.Tweets'
Train<- sqlQuery(chanel, cadsql)
Train<-as.vector(Train)
Train<-as.character(Train)


	Twts<- searchTwitter('movistarmx OR telcel OR unefon OR iusacell OR nextel',n=k,lang='es', retryOnRateLimit=5,cainfo="cacert.pem")
	Twts<-twListToDF(Twts)
	Proof<-Twts[Twts$isRetweet==FALSE,]
	Proof<-Proof[,c(1,8)]
	nrow(Proof)
	Proof<-Proof[!(Proof$id %in% Train),]
	nrow(Proof)



sqlSave(chanel,Proof, "tmp_Tweets",append=TRUE,rownames=FALSE)
sqlQuery(chanel,'dbo.SP_tweets_sent')
close(chanel)
