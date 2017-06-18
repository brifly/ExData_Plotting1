plot3 <- function() {
  # Read and subset data
  data <- read.csv("household_power_consumption.txt", sep = ";", quote = "", stringsAsFactors = F)
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  rel <- data[data$Date == as.Date("2007-02-02") | data$Date == as.Date("2007-02-01"),]
  
  # cleanup columns we are using
  rel$Global_active_power <- as.numeric(rel$Global_active_power)
  rel$Time <- strptime(paste(as.character(rel$Date), rel$Time), format = "%Y-%m-%d %H:%M:%S")
  
  png("plot3.png", width = 480, height = 480, bg="transparent")
  par(bg="transparent")
  
  plot(rel$Time, rel$Sub_metering_1, type="n", xlab = "", ylab = "Energy sub metering")
  lines(rel$Time, rel$Sub_metering_1)
  lines(rel$Time, rel$Sub_metering_2, col="red")
  lines(rel$Time, rel$Sub_metering_3, col="blue")
  legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1)
  
  dev.off()
   
}
