## Extraction of data and filter by dates
data<-read.table('household_power_consumption.txt',header=T,sep=";",
                 colClasses=c('character','character','numeric','numeric',
                              'numeric','numeric','numeric','numeric','numeric'),na.strings = '?')
data$Date<-as.Date(data$Date,format='%d/%m/%Y')
data1<-filter(data,(Date=='2007-02-01'|Date=='2007-02-02'))
data1$Time<-strptime(paste(data1$Date,data1$Time),format='%Y-%m-%d %H:%M:%S')


#Plotting code
par(mfcol=c(2,2),mar=c(4.5,4.5,1,1))
#Time vs Active Power
plot(data1$Time,data1$Global_active_power,type='n',xlab='',ylab='Global Active Power')
lines(data1$Time,data1$Global_active_power)

#Time vs Submetering
plot(data1$Time,data1$Sub_metering_1,type='n',ylab='Energy Sub Metering',xlab='')
lines(data1$Time,data1$Sub_metering_1,col='black')
lines(data1$Time,data1$Sub_metering_3,col='blue')
lines(data1$Time,data1$Sub_metering_2,col='red')
legend('topright',legend=c('Sub metering 1','Sub metering 2','Sub metering 3'),
       col=c('black','red','blue'),lty=1,bty='n')

#Time vs Voltage
plot(data1$Time,data1$Voltage ,type='n',xlab='datetime',ylab='Voltage')
lines(data1$Time,data1$Voltage)

#Time vs Reactive Power
plot(data1$Time,data1$Global_reactive_power ,type='n',xlab='datetime',ylab='Global Reactive Power')
lines(data1$Time,data1$Global_reactive_power )

dev.copy(png,file='plot4.png') #copy to a png file
dev.off()