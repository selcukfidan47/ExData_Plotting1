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

# Plot.3
data <- read.table(data.file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
str(data)

subset.data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
date.time <- strptime(paste(subset.data$Date, subset.data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
global.active.power <- as.numeric(subset.data$Global_active_power)

sub.metering1 <- as.numeric(subset.data$Sub_metering_1)
sub.metering2 <- as.numeric(subset.data$Sub_metering_2)
sub.metering3 <- as.numeric(subset.data$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(date.time,  sub.metering1, type="l", ylab="Energy Submetering", xlab="")
lines(date.time, sub.metering2, type="l", col="red")
lines(date.time, sub.metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()