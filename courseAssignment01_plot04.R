## Course assignment01, Plot 04
## Jared Bowden

## Set the working directory
setwd('/home/jared/Dropbox/Code/Exploratory_data_analysis/Course_project01/')

## Read in the file
rawData <- read.table("./household_power_consumption.txt", sep = ";",
                      header = TRUE, na.strings = "?")

## Convert raw date data to a date class, and add as a new column. 
rawData$newDate <- as.Date(rawData$Date, "%d/%m/%Y")

## Subset this from the dates 2007-02-01 and 2007-02-02.
subData <- subset(rawData, 
        newDate >= as.Date('2007-02-01') & newDate <= as.Date('2007-02-02'))

## Add additional column to include both date and time
as.Date(subData$Time, "%H:%M:%S")
subData$dateTime <- paste(subData$newDate, subData$Time)

## Plotting with dev.copy has been messing up the legend margins. Going to
## run this with the png() function. 
png("plot04.png", width = 480, height = 480)

## Establish the plot area: 2 x 2 graphs
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(subData, {
    ## Plot a line graph of global active power data (y-axis), against time in 
    ## days (x-axis)
    plot(as.POSIXct(subData$dateTime), subData$Global_active_power, type = "l",
         ylab = "Global active power", xlab = "")
    
    ## Plot a line graph of voltage (y-axis), against time in days (x-axis)
    plot(as.POSIXct(subData$dateTime), subData$Voltage, type = "l",
         ylab = "Voltage", xlab = "datetime")
    
    ## Plot line graph of each of the 3 sub metering group (y-axis), against 
    ## time in days (x-axis)
    plot(as.POSIXct(subData$dateTime), subData$Sub_metering_1,
         type = "l", ylab = "Energy sub metering", xlab = "")
    lines(as.POSIXct(subData$dateTime), subData$Sub_metering_2, col = "red")
    lines(as.POSIXct(subData$dateTime), subData$Sub_metering_3, col = "blue")
    
    ## Add the legend for the previous plot
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    ## Plot a line graph of global reactive power (y-axis), against time in 
    ## days(x-axis)
    plot(as.POSIXct(subData$dateTime), subData$Global_reactive_power, 
         type = "l", ylab = "Global_reactive_power", xlab = "datetime")
})

## Export this plot as a .png 
dev.off()