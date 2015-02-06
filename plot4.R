##Read the data. read only the relevand lines and then read in the header and set the names
data <- read.table("household_power_consumption.txt",skip = 66637,nrows=2880,sep = ";")
hdr <- read.table("household_power_consumption.txt",header=TRUE,nrows=1,sep = ";")
colnames(data) <- names(hdr)
#Convert data and time to one variable in the Date column
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")


#create the plot and save the png file
png(filename = "plot4.png",width = 480, height = 480)
par(mfrow = c(2,2), mar = c(4,4,2,1))
#plot2
with (data,plot(Date,Global_active_power,type="l",xlab = "", ylab = "Global Active Power" ))
#plot voltage
with (data,plot(Date,Voltage,type="l",xlab = "datetime", ylab = "Voltage" ))

#plot3
with (data,plot(Date,Sub_metering_1,type="l",xlab = "", ylab = "Energy sub metering" ))
lines(data$Date,data$Sub_metering_2,col = "red")
lines(data$Date,data$Sub_metering_3,col = "blue")
legend("topright",col = c("black","blue","red"),lty = c(1,1),legend = names(data)[7:9],bty = "n")
#legend("topright",cex = 0.7,text.width = 79372,col = c("black","blue","red"),lty = c(1,1),legend = names(data)[7:9])

#plot reactive power
with (data,plot(Date,Global_reactive_power,type="l",xlab = "datetime", ylab = "Global_reactive_power" ))


dev.off()