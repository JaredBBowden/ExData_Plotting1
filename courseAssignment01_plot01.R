## Course assignment01, Plot 01
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

## Plot a histogram with global active power data
hist(subData$Global_active_power, col = "orangered", 
     xlab = "Global active power (kilowatts)", main = "Global Active Power")

## Export this plot as a .png
dev.copy(png, file = "plot01.png")
dev.off()