plot2 <- function() {
    ##Read the data
    data <- read.csv.sql('household_power_consumption.txt', 
                         sql = "select * from file where Date='2/2/2007' or Date='1/2/2007'", 
                         header = T , sep = ';', 
                         colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
    #Convert date into a date time object
    data$Date <- strptime(paste(data$Date, data$Time), format = "%e/%m/%Y %T")
    #open PNG graphics device
    png(filename = 'ExData_Plotting1/plot2.png', width = 480, height = 480, bg = "transparent")
    #plot the DateTime and Global_active_power
    plot(data$Date, data$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power (kilowatts)")
    #close the graphics device
    dev.off()
}