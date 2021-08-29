library(dplyr)

# Read the data into R
PC <- read.table("household_power_consumption.txt",stringsAsFactors = FALSE, header = TRUE, sep =";")

# Change the format of columns
PC$Global_active_power <- as.numeric(PC$Global_active_power)
PC$Global_reactive_power <- as.numeric(PC$Global_reactive_power)
PC$Voltage <- as.numeric(PC$Voltage)
PC$Global_intensity <- as.numeric(PC$Global_intensity)
PC$Sub_metering_1 <- as.numeric(PC$Sub_metering_1)
PC$Sub_metering_2 <- as.numeric(PC$Sub_metering_2)
PC$Sub_metering_3 <- as.numeric(PC$Sub_metering_3)



PC <- mutate(PC, DateFull = strptime(paste(PC$Date, PC$Time, sep=" "), "%d/%m/%Y %H:%M:%S"))

PC$Date <- as.Date(PC$Date, format="%d/%m/%Y")
PC <- filter(PC, Date >= "2007-02-01" & Date <= "2007-02-02")


png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))


# Plot1
with(PC, plot(DateFull, Global_active_power, type="l", xlab = " ",ylab ="Global Active Power"))

#Plot2
with(PC, plot(DateFull, Voltage, type="l", xlab="datetime", ylab="Voltage"))

#Plot3
with(PC, plot(DateFull, Sub_metering_1, type="l", xlab=" ", ylab="Energy sub metering"))
lines(PC$DateFull, PC$Sub_metering_2,type="l", col= "red")
lines(PC$DateFull, PC$Sub_metering_3,type="l", col= "blue")
legend(c("topright"), c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty= 1, lwd=2, col = c("black", "red", "blue"))

#Plot4
with(PC, plot(DateFull, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power"))

dev.off()