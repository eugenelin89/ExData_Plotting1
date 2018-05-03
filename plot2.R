# Loading and Extracting Data
df <- read.table("../data/household_power_consumption.txt", sep=";", header=TRUE)
df <- subset(df, as.Date(df$Date, "%d/%m/%Y") == as.Date("2007-02-01") | as.Date(df$Date, "%d/%m/%Y") == as.Date("2007-02-02"))

# Create a new column that combines Date and Time
df$DateTime <- strptime(paste( as.character(as.Date(df$Date, "%d/%m/%Y")), as.character(df$Time), sep = " "),format="%Y-%m-%d %H:%M:%S")

# Cast data from Factor to Numeric
df$Global_active_power <-as.numeric(as.character(df$Global_active_power))

# Plot to PNG device
png(filename="plot2.png", width=480, height=480)
plot(df$DateTime, df$Global_active_power, xlab="",  ylab="Global Active Power (kilowatts)", type="n")
lines(df$DateTime, df$Global_active_power)

# Disconnect the device.
dev.off()