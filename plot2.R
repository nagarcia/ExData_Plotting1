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

##PLOT 2##

dtaf$dt <- paste(dtaf$Date, dtaf$Time)
dtaf$dts <- strptime(dtaf$dt, "%Y-%m-%d %H:%M:%S")
class(dtaf$dts)

dtaf$day <- ifelse(dtaf$Date == "2007-02-01", "Thu", "Fri")

png(file = "plot2.png")

plot(dtaf$dts, dtaf$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()

