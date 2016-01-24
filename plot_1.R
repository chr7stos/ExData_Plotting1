hpc<-"./data/household_power_consumption.txt"

file.info(hpc)
#gets the size of the txt file, before loading to R together with other info

data <-read.csv(hpc, sep=";", stringsAsFactors = FALSE)
#reads the file

object.size(hpc)
#gets the size of the object, after being loaded

dataPart <- data[data$Date == "1/2/2007" | data$Date == "2/2/2007",] 
#subset the data that are of interest in the current study
#dataPart <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
#str(dataPart)


globalActivePower <- as.numeric(dataPart$Global_active_power)
#create the variable globalActivePower and convert to numeric (it is a string)

png("plot1.png", width=480, height=480)

hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

dev.off()