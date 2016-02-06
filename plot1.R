## plot1.R
## function to match first plot of project assignment 1 for Coursera course:
## Exploratory Data Analysis
##
plot1 <- function(directory = ".")  {
   datafile <- file.path(directory,"household_power_consumption.txt")
   powerdat <- read.table(datafile,sep=";",na.strings="?",stringsAsFactors=FALSE,header=TRUE)
   powerdat$Date <- as.Date(powerdat$Date,format="%d/%m/%Y")
   febdat <- subset(powerdat,powerdat$Date == "2007-02-01" | powerdat$Date == "2007-02-02")
   png(filename="plot1.png",width=480,height=480,bg="grey61")
   hist(febdat$Global_active_power,xlab="Global Active Power (kilowatts)",main="Global Active Power",col="red1")
   dev.off()


}
