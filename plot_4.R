hpc<-"./data/household_power_consumption.txt"

file.info(hpc)
data <-read.csv(hpc, sep=";", stringsAsFactors = FALSE)
object.size(hpc)
dataPart <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",] 





globalActivePower <- as.numeric(dataPart$Global_active_power)
datetime <- strptime(paste(dataPart$Date, dataPart$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
subMetering1 <- as.numeric(dataPart$Sub_metering_1)
subMetering2 <- as.numeric(dataPart$Sub_metering_2)
subMetering3 <- as.numeric(dataPart$Sub_metering_3)
voltage <- as.numeric(dataPart$Voltage)
globalReactivePower<-as.numeric(dataPart$Global_reactive_power)

png("plot4.png", width=480, height=480)
par(mfcol = c(2,2))

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power")

plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"), bty = "o", box.col = "white")

plot(datetime, voltage, type="l", xlab="datetime", ylab = "Voltage")

plot(datetime, globalReactivePower, type = "l", xlab = "datetime", ylab = "global_reactive_power")

dev.off()