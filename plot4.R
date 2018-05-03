# Loading and Extracting Data
df <- read.table("../data/household_power_consumption.txt", sep=";", header=TRUE)
df <- subset(df, as.Date(df$Date, "%d/%m/%Y") == as.Date("2007-02-01") | as.Date(df$Date, "%d/%m/%Y") == as.Date("2007-02-02"))

# Create DateTime column that combines Date and Time columns
df$DateTime <- strptime(paste( as.character(as.Date(df$Date, "%d/%m/%Y")), as.character(df$Time), sep = " "),format="%Y-%m-%d %H:%M:%S")

# Cast data from Factor to Numeric
df$Global_active_power <-as.numeric(as.character(df$Global_active_power))
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))
df$Voltage <- as.numeric(as.character(df$Voltage))
df$Global_reactive_power <- as.numeric(as.character(df$Global_reactive_power))

# Plot to PNG device
png(filename="plot4.png", width=480, height=480)

par(mfrow= c(2,2))

# Plot Top Left
plot(df$DateTime, df$Global_active_power, xlab="",  ylab="Global Active Power", type="n")
lines(df$DateTime, df$Global_active_power)

# Plot Top Right
plot(df$DateTime, df$Voltage, xlab="datetime",  ylab="Voltage", type="n")
lines(df$DateTime, df$Voltage)

# Plot Bottom Left
plot(df$DateTime, df$Sub_metering_1, xlab="",  ylab="Energy sub metering", type="n")
legend("topright",lty=1,col=c("black", "red","blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

lines(df$DateTime, df$Sub_metering_1)
par("col" = "red")
lines(df$DateTime, df$Sub_metering_2)
par("col" = "blue")
lines(df$DateTime, df$Sub_metering_3)
par("col" = "black")

# Plot Bottom Right
plot(df$DateTime, df$Global_reactive_power, xlab="",  ylab="Global_Reactive_Power", type="n")
lines(df$DateTime, df$Global_reactive_power)

# Disconnect the device.
dev.off()