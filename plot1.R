#Extraction of data and filter by dates
data<-read.table('household_power_consumption.txt',header=T,sep=";",
                        colClasses=c('character','character','numeric','numeric',
                        'numeric','numeric','numeric','numeric','numeric'),na.strings = '?')
data$Date<-as.Date(data$Date,format='%d/%m/%Y')
data1<-filter(data,(Date=='2007-02-01'|Date=='2007-02-02'))
# data1$Time<-strptime(data1$Time,format='%H:%M:%S')

#Plotting code

hist(data1$Global_active_power,col='red',xlab='Global Active Power (kilowatts)',
     main='Global Active Power')
dev.copy(png,file='plot1.png') #copy to a png file
dev.off()