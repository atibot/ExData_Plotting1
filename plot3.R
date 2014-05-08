## Set LC_TIME to C
Sys.setlocale("LC_TIME", "C")
## read the data and subset to the dates of interest
data <- read.table("./household_power_consumption.txt", sep=";", header = TRUE)
data <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007", ]
data$Date <- as.Date(strptime(data$Date, format="%d/%m/%Y"))
data$Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
data$Sub_metering_1 <-as.numeric(as.character(data$Sub_metering_1))
data$Sub_metering_2 <-as.numeric(as.character(data$Sub_metering_2))
data$Sub_metering_3 <-as.numeric(as.character(data$Sub_metering_3))
##Plot 3
plot(data$Time, data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(data$Time, data$Sub_metering_1, col="black")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.75)
dev.copy(png, file = "plot3.png")  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!