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
data$Voltage <-as.numeric(as.character(data$Voltage))
data$Global_reactive_power <-as.numeric(as.character(data$Global_reactive_power))
##Plot 4
par(mfcol=c(2,2))
##plot2
plot(data$Time, data$Global_active_power, type="n", ylab="Global Active Power", xlab="")
lines(data$Time, data$Global_active_power)
##plot 3
plot(data$Time, data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
lines(data$Time, data$Sub_metering_1, col="black")
lines(data$Time, data$Sub_metering_2, col="red")
lines(data$Time, data$Sub_metering_3, col="blue")
legend("topright", lty = "solid", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=0.7, bty="n")
##plot an additional one at the upper right
plot(data$Time, data$Voltage, type="n", ylab="Voltage", xlab="datetime")
lines(data$Time, data$Voltage)
##plot another one at the lower right
plot(data$Time, data$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab="datetime")
lines(data$Time, data$Global_reactive_power)
## copy it to a PNG file
dev.copy(png, file = "plot4.png")  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!