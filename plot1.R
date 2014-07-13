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
## called plot1.png in the working dicrectory.
plotToFile <- function(data) {
    png(file = "plot1.png", width = 480, height = 480)
    hist(data$Global_active_power, col="red", main = "Global Active Power", 
         xlab="Global Active Power (kilowatts)")
    dev.off()
}

## Uncomment and run the following commands to test the code
## assuming the data file is in your current working directory.
# data <- readData()
# plotToFile(data)
