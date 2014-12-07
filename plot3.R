df<-read.table("household_power_consumption.txt",na.string="?",sep=";",header=TRUE)
df['Date']=as.character(df[,'Date'])
df1<-df[df['Date']=="1/2/2007",]
df2<-df[df['Date']=="2/2/2007",]
df3<-rbind(df1,df2)
df3['Time']<-as.character(df3[,'Time'])
df3['DateTime']<-paste(df3$Date,df3$Time,sep=" ")
df3$da<-strptime(df3[,'DateTime'],"%d/%m/%Y %H:%M")
with(df3,plot(df3[, 11], df3[, 7],type="l",lwd=1,ylab="Energy sub metering",xlab=""))
lines(df3[,11], df3[,8], col="red")
lines(df3[,11], df3[,9], col="blue")
legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png,file="plot3.png")
dev.off()