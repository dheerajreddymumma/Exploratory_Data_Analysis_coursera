df<-read.table("household_power_consumption.txt",na.string="?",sep=";",header=TRUE)
df['Date']=as.character(df[,'Date'])
df1<-df[df['Date']=="1/2/2007",]
df2<-df[df['Date']=="2/2/2007",]
df3<-rbind(df1,df2)
df3['Time']<-as.character(df3[,'Time'])
df3['DateTime']<-paste(df3$Date,df3$Time,sep=" ")
df3$da<-strptime(df3[,'DateTime'],"%d/%m/%Y %H:%M")
plot(df3[,11],df3[,3],type="l",lwd=1,xlab="",ylab="Global Active Power(Kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()