makePlot2 <- function(){
  mydf <- read.csv("household_power_consumption.txt", header = TRUE,sep = ";", na.strings="?", stringsAsFactors=FALSE)
  mydf$Time <- strptime(paste(mydf$Date, mydf$Time), "%d/%m/%Y %H:%M:%S")
  mydf$Date <- as.Date(mydf$Date, format="%d/%m/%Y")
  febData <- subset(mydf, Date == "2007-02-01" | Date =="2007-02-02")
  
  plot(febData$Time, febData$Global_active_power, type="l", ylab ="Global Active Power (kilowatts)", xlab="")
  
  png(file = "./plot2.png", width = 480, height = 480, units = "px", type = "cairo", bg = "transparent")
  plot(febData$Time, febData$Global_active_power, type="l", ylab ="Global Active Power (kilowatts)", xlab="")
  blah <- dev.off()
}