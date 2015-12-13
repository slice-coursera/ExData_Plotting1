plot4 <- function() {
    ##Read the data
    data <- read.csv.sql('household_power_consumption.txt', 
                         sql = "select * from file where Date='2/2/2007' or Date='1/2/2007'", 
                         header = T , sep = ';', 
                         colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
    #Convert date into a date time object
    data$Date <- strptime(paste(data$Date, data$Time), format = "%e/%m/%Y %T")
    
    #create the PNG graphics device
    png(filename = 'ExData_Plotting1/plot4.png', width = 480, height = 480, bg = "transparent")
    
    #function to create first plot
    p1 <- function() {
        plot(data$Date, data$Global_active_power, type = 'l', xlab = "", ylab = "Global Active Power")
    }
    #function to create second plot
    p2 <- function() {
        plot(data$Date, data$Voltage, type = 'l', xlab = "datetime", ylab = "Voltage")
    }
    #function to create third plot
    p3 <- function() {
        #add the plot of sub_metering_1
        plot(data$Date, data$Sub_metering_1, type = 'l', col = 'black', xlab = "", ylab = "Energy sub metering")
        #add the sub_metering_2 to the plot
        lines(data$Date, data$Sub_metering_2, col = 'red')
        #add sub_metering_3
        lines(data$Date, data$Sub_metering_3, col = 'blue')
        #add the legend
        legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)
    }
    #function to create fourth plot
    p4 <- function() {
        plot(data$Date, data$Global_reactive_power, type = 'l', xlab = "datetime", ylab = "Global_reactive_power")
    }
    #set up the 2x2 plot
    par(mfrow = c(2,2))
    #use the functions above to create the four plots
    with(data, {p1()
        p2()
        p3()
        p4()
        })
    #close graphics device
    dev.off()
}

