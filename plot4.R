## plot4.R
## function to match fourth plot of project assignment 1 for Coursera course:
## Exploratory Data Analysis
##
plot4 <- function(directory = "./")  {
   datafile <- file.path(directory,"household_power_consumption.txt")
   powerdat <- read.table(datafile,sep=";",na.strings="?",stringsAsFactors=FALSE,header=TRUE)
   powerdat$Date <- as.Date(powerdat$Date,format="%d/%m/%Y")
   febdat <- subset(powerdat,powerdat$Date == "2007-02-01" | powerdat$Date == "2007-02-02")
   febdat$Date.Time <- paste(febdat$Date,febdat$Time)
   png(filename="plot4.png",width=480,height=480,bg="grey61")
   par(mfcol=c(2,2))
   plot(strptime(febdat$Date.Time, "%Y-%m-%d %H:%M:%S"),febdat$Global_active_power,
               type="l",ylab="Global Active Power (kilowatts)", xlab="",bg="grey61")
   plot(strptime(febdat$Date.Time, "%Y-%m-%d %H:%M:%S"),febdat$Sub_metering_1,
               type="l",ylab="Global Active Power (kilowatts)", xlab="",bg="grey61")
   lines(strptime(febdat$Date.Time, "%Y-%m-%d %H:%M:%S"),febdat$Sub_metering_2,col="red")
   lines(strptime(febdat$Date.Time, "%Y-%m-%d %H:%M:%S"),febdat$Sub_metering_3,col="blue")
   legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"),lty=1)
   plot(strptime(febdat$Date.Time, "%Y-%m-%d %H:%M:%S"),febdat$Voltage,xlab="datetime",
             ylab="Voltage",type="l")
   plot(strptime(febdat$Date.Time, "%Y-%m-%d %H:%M:%S"),febdat$Global_reactive_power,
             xlab="datetime", ylab="Global_reactive_power",type="l")
   dev.off()


}
