makePlot3 <- function(){
  mydf <- read.csv("household_power_consumption.txt", header = TRUE,sep = ";", na.strings="?", stringsAsFactors=FALSE)
  mydf$Time <- strptime(paste(mydf$Date, mydf$Time), "%d/%m/%Y %H:%M:%S")
  mydf$Date <- as.Date(mydf$Date, format="%d/%m/%Y")
  febData <- subset(mydf, Date == "2007-02-01" | Date =="2007-02-02")

  plot(febData$Time, febData$Sub_metering_1, type="l", ylab ="Energy sub metering", xlab="", col="black")
  lines(febData$Time, febData$Sub_metering_2, type = "l", col="red")
  lines(febData$Time, febData$Sub_metering_3, type = "l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red","blue"))
  
  png(file = "./plot3.png", width = 480, height = 480, units = "px", type = "cairo", bg = "transparent")
  plot(febData$Time, febData$Sub_metering_1, type="l", ylab ="Energy sub metering", xlab="", col="black")
  lines(febData$Time, febData$Sub_metering_2, type = "l", col="red")
  lines(febData$Time, febData$Sub_metering_3, type = "l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red","blue"))
  blah <- dev.off()
}