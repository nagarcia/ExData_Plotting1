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

##see PLOT 1-3

##PLOT 4##

png(file = "plot4.png")

par(mfrow = c(2,2))

plot(dtaf$dts, dtaf$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

plot(dtaf$dts, dtaf$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

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


dtaf$Global_reactive_power <- dtaf$Global_reactive_power/1000
plot(dtaf$dts, dtaf$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")

dev.off()