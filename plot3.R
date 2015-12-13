plot3 <- function(){
    ##Read the data
    data <- read.csv.sql('household_power_consumption.txt', 
                         sql = "select * from file where Date='2/2/2007' or Date='1/2/2007'", 
                         header = T , sep = ';', 
                         colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
    #Convert date into a date time object
    data$Date <- strptime(paste(data$Date, data$Time), format = "%e/%m/%Y %T")
    
    #create the PNG graphics device
    png(filename = 'ExData_Plotting1/plot3.png', width = 480, height = 480, bg = "transparent")
    
    #add the plot of sub_metering_1
    plot(data$Date, data$Sub_metering_1, type = 'l', col = 'black', xlab = "", ylab = "Energy sub metering")
    #add the sub_metering_2 to the plot
    lines(data$Date, data$Sub_metering_2, col = 'red')
    #add sub_metering_3
    lines(data$Date, data$Sub_metering_3, col = 'blue')
    #add the legend
    legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
    
    #close graphics device
    dev.off()
}