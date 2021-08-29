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
PC$Date <- as.Date(PC$Date, format="%d/%m/%Y")

#Subset the required data

PC <- filter(PC, Date >= "2007-02-01" & Date <= "2007-02-02")


#Plotting
png("plot1.png", width=480, height=480)
hist(PC$Global_active_power, col = "red",main = "Global Active Power", xlab="Global Active Power(kilowatts)")
dev.off()

