library(lubridate)
lambda<-60
registerTwitterOAuth(cred)
tweets = searchTwitter("RT: #Buenfin @movistarmx", lang="es",cainfo="cacert.pem")
tweets_df = twListToDF(tweets)

followers<-c()
for(i in 1:nrow(tweets_df)){
	followers<-c(followers,getUser(tweets_df$screenName[i])$followersCount)
	}
STOP<-Sys.time()
M<-getUser('movistarmx')$followersCount
Initime<-as.POSIXct('2014-11-11 14:11:00')
T<-as.numeric(floor(1440*(STOP-Initime)))
TIME<- Initime+(0:T)*60

Impacto<-c()
for(i in 0:T){
	impact<-M*lambda*exp(-i*lambda)
	Impacto<-c(Impacto,impact)
	}



RTtime<-tweets_df$created
for(i in 1:nrow(tweets_df)){
		RTtime[i]<-tweets_df$created[i]-second(tweets_df$created[i])
	}



S=0
for(i in 1:nrow(tweets_df){
	S<-as.numeric(floor(60*(STOP-RTtime[i])))
	Impacto2<-c()
		for(j in 0:S){
			impact<-followers[i]*lambda*exp(-j*lambda)
			Impacto2<-c(Impacto2,impact)
			}
	Impacto<-Impacto+c((0:(T-S))*0,Impacto2)	
	}
