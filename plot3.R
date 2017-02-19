###Exploratory Data Analysis Assignment 1##

##Introductory Code##
dta <- read.table("hhpc.txt", sep = ";", header = T)
dta$Date <- as.Date(strptime(as.character(dta$Date), "%d/%m/%Y"))

dtaf <- dta[dta$Date == "2007-02-01" | dta$Date == "2007-02-02", ]

dtaf$Global_active_power <- as.numeric(dtaf$Global_active_power)
dtaf$Global_reactive_power <- as.numeric(dtaf$Global_reactive_power)
dtaf$Voltage <- as.numeric(dtaf$Voltage)
dtaf$Global_intensity <- as.numeric(dtaf$Global_intensity)
dtaf$Sub_metering_1 <- as.numeric(dtaf$Sub_metering_1)
dtaf$Sub_metering_2 <- as.numeric(dtaf$Sub_metering_2)
dtaf$Sub_metering_3 <- as.numeric(dtaf$Sub_metering_3)

sapply(dtaf, class)

##PLOT 3##

png(file = "plot3.png")

plot(dtaf$dts, dtaf$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
lines(dtaf$dts, dtaf$Sub_metering_2, 
      col = "red")
lines(dtaf$dts, dtaf$Sub_metering_3,
      col = "blue")
legend("topright", pch = "-" , col = c("black","red","blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()

