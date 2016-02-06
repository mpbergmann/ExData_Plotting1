## plot2.R
## function to match second plot of project assignment 1 for Coursera course:
## Exploratory Data Analysis
##
plot2 <- function(directory = "./")  {
   datafile <- file.path(directory,"household_power_consumption.txt")
   powerdat <- read.table(datafile,sep=";",na.strings="?",stringsAsFactors=FALSE,header=TRUE)
   powerdat$Date <- as.Date(powerdat$Date,format="%d/%m/%Y")
   febdat <- subset(powerdat,powerdat$Date == "2007-02-01" | powerdat$Date == "2007-02-02")
   febdat$Date.Time <- paste(febdat$Date,febdat$Time)
   png(filename="plot2.png",width=480,height=480,bg="grey61")
   plot(strptime(febdat$Date.Time, "%Y-%m-%d %H:%M:%S"),febdat$Global_active_power,
               type="l",ylab="Global Active Power (kilowatts)", xlab="",bg="grey61")
   dev.off()


}
