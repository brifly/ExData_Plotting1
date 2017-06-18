plot2 <- function() {
  # Read and subset data
  data <- read.csv("household_power_consumption.txt", sep = ";", quote = "", stringsAsFactors = F)
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  rel <- data[data$Date == as.Date("2007-02-02") | data$Date == as.Date("2007-02-01"),]
  
  # cleanup columns we are using
  rel$Global_active_power <- as.numeric(rel$Global_active_power)
  rel$Time <- strptime(paste(as.character(rel$Date), rel$Time), format = "%Y-%m-%d %H:%M:%S")
  
  png("plot2.png", width = 480, height = 480)
  plot(rel$Time, rel$Global_active_power, type = "l", ylab="Global Active Power (Kilowatts)", xlab = "")
  dev.off()
   
}