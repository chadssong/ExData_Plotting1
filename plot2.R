###### Load Data

file <- "./data/project1_household_power_consumption.txt"
data <- read.table(file ,sep=";", header=T, stringsAsFactors=F)
slected_data <-  data$Date=="1/2/2007"|data$Date=="2/2/2007"
data_new <- data[slected_data,]

temp_DateTime<- paste(data_new$Date, data_new$Time, sep="/")
data_new$DateTime <- strptime(temp_DateTime, "%d/%m/%Y/%H:%M:%S")
rownames(data_new) <- 1:nrow(data_new)

###### Plot 2. 

png(filename = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")

plot(data_new$DateTime, data_new$Global_active_power, type="l", xlab="", ylab = "Global Active Power(kilowatts)")
dev.off()




