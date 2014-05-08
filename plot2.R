## Set LC_TIME to C
Sys.setlocale("LC_TIME", "C")
## read the data and subset to the dates of interest
data <- read.table("./household_power_consumption.txt", sep=";", header = TRUE)
data <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007", ]
data$Date <- as.Date(strptime(data$Date, format="%d/%m/%Y"))
data$Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
##Plot 2
plot(data$Time, data$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
lines(data$Time, data$Global_active_power)
dev.copy(png, file = "plot2.png")  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!