##Read the data. read only the relevand lines and then read in the header and set the names
data <- read.table("household_power_consumption.txt",skip = 66637,nrows=2880,sep = ";")
hdr <- read.table("household_power_consumption.txt",header=TRUE,nrows=1,sep = ";")
colnames(data) <- names(hdr)
#Convert data and time to one variable in the Date column
data$Date <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")

#create the plot and save the png file
png(filename = "plot2.png",width = 480, height = 480)
with (data,plot(Date,Global_active_power,type="l",xlab = "", ylab = "Global Active Power (kilowatts)" ))
dev.off()