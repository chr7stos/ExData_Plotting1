hpc<-"./data/household_power_consumption.txt"

file.info(hpc)
data <-read.csv(hpc, sep=";", stringsAsFactors = FALSE)
object.size(hpc)
dataPart <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",] 





globalActivePower <- as.numeric(dataPart$Global_active_power)
datetime <- strptime(paste(dataPart$Date, dataPart$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot2.png", width=480, height=480)

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()


dev.off()