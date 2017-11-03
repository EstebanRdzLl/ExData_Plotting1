#Extraction of data and filter by dates
data<-read.table('household_power_consumption.txt',header=T,sep=";",
                 colClasses=c('character','character','numeric','numeric',
                              'numeric','numeric','numeric','numeric','numeric'),na.strings = '?')
data$Date<-as.Date(data$Date,format='%d/%m/%Y')
data1<-filter(data,(Date=='2007-02-01'|Date=='2007-02-02'))
data1$Time<-strptime(paste(data1$Date,data1$Time),format='%Y-%m-%d %H:%M:%S')


#Plotting code
plot(data1$Time,data1$Sub_metering_1,type='n',ylab='Energy Sub Metering',xlab='')
lines(data1$Time,data1$Sub_metering_1,col='black')
lines(data1$Time,data1$Sub_metering_3,col='blue')
lines(data1$Time,data1$Sub_metering_2,col='red')
legend('topright',legend=c('Sub metering 1','Sub metering 2','Sub metering 3'),
       col=c('black','red','blue'),lty=1)
dev.copy(png,file='plot3.png') #copy to a png file
dev.off()