plot1 <- function() {
  # Read and subset data
  data <- read.csv("household_power_consumption.txt", sep = ";", quote = "", stringsAsFactors = F)
  data$Date <- as.Date(data$Date, "%d/%m/%Y")
  rel <- data[data$Date == as.Date("2007-02-02") | data$Date == as.Date("2007-02-01"),]
  
  # cleanup columns we are using
  rel$Global_active_power <- as.numeric(rel$Global_active_power)
  
  # Plot
  png("plot1.png", width = 480, height = 480)
  hist(rel$Global_active_power, 12, col = "red", main="Global Active Power", xlab = "Global Active Power (kilowatts)")
  dev.off()
}