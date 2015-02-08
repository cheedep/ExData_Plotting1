makePlot1 <- function(){
    mydf <- read.csv("household_power_consumption.txt", header = TRUE,sep = ";", na.strings="?", stringsAsFactors=FALSE)
    mydf$Date <- as.Date(mydf$Date, format="%d/%m/%Y")
    mydf$Time <- strptime(mydf$Time, "%H:%M:%S")
    febData <- subset(mydf, Date == "2007-02-01" | Date =="2007-02-02")
    
    hist(febData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
    
    png(file = "./plot1.png", width = 480, height = 480, units = "px", type = "cairo", bg = "transparent")
    hist(febData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
    blah <- dev.off()
}