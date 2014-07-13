## Course assignment01, Plot 02
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

## Plot a line graph of global active power data (y-axis), against time in days
## (x-axis)
plot(as.POSIXct(subData$dateTime), subData$Global_active_power, type = "l",
     ylab = "Global active power (kilowatts)", xlab = "")

## Export this plot as a .png
dev.copy(png, file = "plot02.png")
dev.off()