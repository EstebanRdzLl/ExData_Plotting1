#Extraction of data and filter by dates
data<-read.table('household_power_consumption.txt',header=T,sep=";",
                 colClasses=c('character','character','numeric','numeric',
                              'numeric','numeric','numeric','numeric','numeric'),na.strings = '?')
data$Date<-as.Date(data$Date,format='%d/%m/%Y')
data1<-filter(data,(Date=='2007-02-01'|Date=='2007-02-02'))
data1$Time<-strptime(paste(data1$Date,data1$Time),format='%Y-%m-%d %H:%M:%S')


#Plotting code
plot(data1$Time,data1$Global_active_power,type='n',xlab='',ylab='Global Active Power (kilowatts)')
lines(data1$Time,data1$Global_active_power)
dev.copy(png,file='plot2.png') #copy to a png file
dev.off()