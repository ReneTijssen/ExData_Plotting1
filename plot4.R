#assumption: The file is in currect Working Directory

#Read file in R
Data_plot <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")

#Convert time and add a column for DateTime
Data_plot$Date = as.Date(Data_plot$Date, format="%d/%m/%Y")
Data_plot$DateTime <- as.POSIXct(paste(Data_plot$Date, Data_plot$Time), format="%Y-%m-%d %H:%M:%S") 

#Create a subset
Data_subset<-subset(Data_plot,Date=="2007-02-01"|Date=="2007-02-02")

#Make graph
png(file="plot4.png",width=480,height=480, units="px")

par(mfrow = c(2,2))

plot(Data_subset$DateTime,
     Data_subset$Global_active_power, 
     type = "l",
     ylab ="Global Active Power (kilowatts)",
     xlab ="")
plot(Data_subset$DateTime,
     Data_subset$Voltage, 
     type = "l",
     ylab ="Voltage",
     xlab ="datetime")
plot(Data_subset$DateTime,
     Data_subset$Sub_metering_1, 
     type = "l",
     ylab ="Global Active Power (kilowatts)",
     xlab ="",
     col   ="black")
lines(Data_subset$DateTime, 
      Data_subset$Sub_metering_2,
      col="red")
lines(Data_subset$DateTime,
      Data_subset$Sub_metering_3,
      col="blue")
legend("topright",
       col=c("black", "red", "blue"),
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=1)
plot(Data_subset$DateTime,
     Data_subset$Global_reactive_power, 
     type = "l",
     ylab ="Global_reactive_power",
     xlab ="datetime")

dev.off()
