df<-read.table("household_power_consumption.txt",na.string="?",sep=";",header=TRUE)
df['Date']=as.character(df[,'Date'])
df1<-df[df['Date']=="1/2/2007",]
df2<-df[df['Date']=="2/2/2007",]
df3<-rbind(df1,df2)
hist(df3[,3],col="red",xlab="Global Active Power (Kilowatts)",ylab="Frequency",main="Global Active Power")
dev.copy(png,file="plot1.png")
dev.off()
