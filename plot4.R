## This function reads the data from the housesold power consumption file.
## It will only reads data for 1/2/2007 and 2/2/2007 when default params are used.
readData <- function(filePath = "household_power_consumption.txt", skipN = 66636, rowsN = 2880) {
    con <- file(filePath)
    open(con)
    header <- scan(con, what = character(), nlines = 1, quiet = TRUE)
    data <- read.csv(con, header=FALSE, sep=";", skip=skipN, nrows=rowsN)
    close(con)
    colnames(data) <- strsplit(header, ";")[[1]]
    data
}

## This function draws the plot and save it to a png file 
## called plot4.png in the working dicrectory.
plotToFile <- function(data) {
    png(file = "plot4.png", width = 480, height = 480)
    par(mfrow = c(2, 2))

    plot(data$Global_active_power, type="l" , xaxt='n', 
         ylab="Global Active Power", xlab="")
    axis(1, at=c(1, 1440, 2880), c("Thu", "Fri", "Sat"))

    plot(data$Voltage, type="l" , xaxt='n', 
         ylab="Voltage", xlab="datetime")
    axis(1, at=c(1, 1440, 2880), c("Thu", "Fri", "Sat"))

    plot(data$Sub_metering_1, type="l" , xaxt='n', 
         ylab="Energy sub metering", xlab="")
    lines(data$Sub_metering_2, col="red")
    lines(data$Sub_metering_3, col="blue")
    legend("topright", colnames(data)[7:9], lty=1, col=c("black", "red", "blue"), bty="n")
    axis(1, at=c(1, 1440, 2880), c("Thu", "Fri", "Sat"))

    plot(data$Global_reactive_power, type="l" , xaxt='n', 
         ylab="Global_reactive_power", xlab="datetime")
    axis(1, at=c(1, 1440, 2880), c("Thu", "Fri", "Sat"))
    dev.off()
}

## Uncomment and run the following commands to test the code
## assuming the data file is in your current working directory.
# data <- readData()
# plotToFile(data)
