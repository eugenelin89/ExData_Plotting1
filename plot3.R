# Loading and Extracting Data
df <- read.table("../data/household_power_consumption.txt", sep=";", header=TRUE)

# Create DateTime column that combines Date and Time columns
df <- subset(df, as.Date(df$Date, "%d/%m/%Y") == as.Date("2007-02-01") | as.Date(df$Date, "%d/%m/%Y") == as.Date("2007-02-02"))

# Create a new column that combines Date and Time
df$DateTime <- strptime(paste( as.character(as.Date(df$Date, "%d/%m/%Y")), as.character(df$Time), sep = " "),format="%Y-%m-%d %H:%M:%S")

# Cast data from Factor to Numeric
df$Sub_metering_1 <- as.numeric(as.character(df$Sub_metering_1))
df$Sub_metering_2 <- as.numeric(as.character(df$Sub_metering_2))
df$Sub_metering_3 <- as.numeric(as.character(df$Sub_metering_3))

# Plot to PNG device
png(filename="plot3.png", width=480, height=480)
plot(df$DateTime, df$Sub_metering_1, xlab="",  ylab="Energy sub metering", type="n")

# Create Legend
legend("topright",lty=1,col=c("black", "red","blue"),legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

# Draw the lines
lines(df$DateTime, df$Sub_metering_1)
par("col" = "red")
lines(df$DateTime, df$Sub_metering_2)
par("col" = "blue")
lines(df$DateTime, df$Sub_metering_3)

# Disconnect the device.
dev.off()
