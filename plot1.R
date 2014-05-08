## Set LC_TIME to C
Sys.setlocale("LC_TIME", "C")
## read the data and subset to the dates of interest
data <- read.table("./household_power_consumption.txt", sep=";", header = TRUE)
data <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007", ]
data$Date <- as.Date(strptime(data$Date, format="%d/%m/%Y"))
data$Time <- strptime(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
##Plot 1
data$Global_active_power <- as.numeric(as.character(data$Global_active_power))
hist(data$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")
dev.copy(png, file = "plot1.png")  ## Copy my plot to a PNG file
dev.off()  ## Don't forget to close the PNG device!