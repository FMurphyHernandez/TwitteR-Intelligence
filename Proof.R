Proof<-function(){
k<-100
control<-0
library("twitteR")
Train<-read.csv('Train.csv')
Train$text<-as.character(Train$text)
load(file="twitter authentication.Rdata")
registerTwitterOAuth(cred)
while(control<5){
	Twts<- searchTwitter('movistarmx OR telcel OR unefon OR iusacell OR nextel',n=k,lang='es', retryOnRateLimit=5,cainfo="cacert.pem")
	Twts<-twListToDF(Twts)
	Proof<-Twts[Twts$isRetweet==FALSE,]
	Proof<-Proof[,c(1,8)]
	Proof<-Proof[!(Proof$id %in% Train$id),]
	control<-nrow(Proof)
	if(control>=5)Proof<-Proof[sample(1:nrow(Proof),5),]
	k<-k+100
	}
return(Proof)
}
