###### Load Data

file <- "./data/project1_household_power_consumption.txt"
data <- read.table(file ,sep=";", header=T, stringsAsFactors=F)
slected_data <-  data$Date=="1/2/2007"|data$Date=="2/2/2007"
data_new <- data[slected_data,]

temp_DateTime<- paste(data_new$Date, data_new$Time, sep="/")
data_new$DateTime <- strptime(temp_DateTime, "%d/%m/%Y/%H:%M:%S")
rownames(data_new) <- 1:nrow(data_new)

###### Plot 4. 

png(filename = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
par(mfrow=c(2,2))

# 1
plot(data_new$DateTime, as.numeric(data_new$Global_active_power), type="l", xlab="", ylab="Global Active Power")

# 2
plot(data_new$DateTime, as.numeric(data_new$Voltage), type="l", xlab="datetime", ylab="Voltage")

# 3
plot(data_new$DateTime, data_new$Sub_metering_1,type="n", xlab="", ylab="Energy sub metering")
lines(data_new$DateTime, data_new$Sub_metering_1, col = "black")
lines(data_new$DateTime, data_new$Sub_metering_2, col = "red")
lines(data_new$DateTime, data_new$Sub_metering_3, col = "blue")
legend("topright", lwd=1, bty="n" ,col=c("black", "red", "blue"), c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

# 4
plot(data_new$DateTime, as.numeric(data_new$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")     


dev.off()
