Feel<-function(F1,F2,F3,F4,F5,Train1){
	
	Train1$feeling<-c(F1,F2,F3,F4,F5)
	X<-read.csv('Train.csv')
	Train<-rbind(X,Train1)
	write.csv(Train,'Train.csv',row.names=FALSE)
	
}
