plot1 <- function(){
    #Read data from file
    data <- read.csv.sql('household_power_consumption.txt', 
                         sql = "select * from file where Date='2/2/2007' or Date='1/2/2007'", 
                         header = T , sep = ';', 
                         colClasses = c('character', 'character', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric', 'numeric'))
    #Open PNG graphics device with 480x480 and transparent bg
    png(filename = 'ExData_Plotting1/plot1.png', width = 480, height = 480, bg = "transparent")
    #plot the global active power histogram
    with(data, hist(data$Global_active_power, col = 'red', main="Global Active Power", xlab = "Global Active Power (kilowatts)"))
    #close the graphics device
    dev.off()
}