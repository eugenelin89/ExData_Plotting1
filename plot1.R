# Loading and Extracting Data
df <- read.table("../data/household_power_consumption.txt", sep=";", header=TRUE)
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df <- subset(df, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))
df$Global_active_power <-as.numeric(as.character(df$Global_active_power))
# Open PNG device
png(filename="plot1.png", width=480, height=480)
# Plot to PNG device with width and hight equal to 480 pixels
hist(df$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
# Close PNG device
dev.off()