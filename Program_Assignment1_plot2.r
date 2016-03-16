# Selcuk Fidan
# EDA Assignment.1

elec.power.cons <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  
  # make sure the site is live, if it is not live stop function terminate the program
  check.url <- file(elec.power.cons,"r")
  if (!isOpen(check.url)) {
    stop(paste("There's a problem with the data:",geterrmessage()))
  }
zipfile.data = "exdata-data-household_power_consumption.zip"
  # make sure the data in the working directory if not download the zip file into the to zipfile.data and unzip the zipfile.data
  if(!file.exists(zipfile.data)) {
        
        download.file(elec.power.cons,zipfile.data)
        data.file <- unzip(zipfile.data)
} else {
        data.file <-"household_power_consumption.txt"
}

# Plot.2
data <- read.table(data.file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
str(data)

subset.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
date.time <- strptime(paste(subset.data$Date, subset.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global.active.power <- as.numeric(subset.data$Global_active_power)

png("plot2.png", width=480, height=480)
plot(date.time, global.active.power, type="l", 
     xlab="", ylab = "Global Active Power (kilowatts)")
dev.off()