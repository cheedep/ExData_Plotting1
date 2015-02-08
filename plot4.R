makePlot4 <- function(){
  mydf <- read.csv("household_power_consumption.txt", header = TRUE,sep = ";", na.strings="?", stringsAsFactors=FALSE)
  mydf$Time <- strptime(paste(mydf$Date, mydf$Time), "%d/%m/%Y %H:%M:%S")
  mydf$Date <- as.Date(mydf$Date, format="%d/%m/%Y")
  febData <- subset(mydf, Date == "2007-02-01" | Date =="2007-02-02")
  
  par(mfrow = c(2,2))
  
  plot(febData$Time, febData$Global_active_power, type="l", ylab ="Global Active Power", xlab="")
  
  plot(febData$Time, febData$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  plot(febData$Time, febData$Sub_metering_1, type="l", ylab ="Energy sub metering", xlab="", col="black")
  lines(febData$Time, febData$Sub_metering_2, type = "l", col="red")
  lines(febData$Time, febData$Sub_metering_3, type = "l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red","blue"), bty = "n")
  
  plot(febData$Time, febData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  
  
  
  png(file = "./plot4.png", width = 480, height = 480, units = "px", type = "cairo", bg = "transparent")
  
  par(mfrow = c(2,2))
  
  plot(febData$Time, febData$Global_active_power, type="l", ylab ="Global Active Power", xlab="")
  
  plot(febData$Time, febData$Voltage, type="l", xlab="datetime", ylab="Voltage")
  
  plot(febData$Time, febData$Sub_metering_1, type="l", ylab ="Energy sub metering", xlab="", col="black")
  lines(febData$Time, febData$Sub_metering_2, type = "l", col="red")
  lines(febData$Time, febData$Sub_metering_3, type = "l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red","blue"), bty = "n")
  
  plot(febData$Time, febData$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
  
  blah <- dev.off()
}