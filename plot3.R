setwd("C:/Users/santibka/Documents/2019/coursera/datascience")
tabAll <- read.table("exdata_data_household_power_consumption/household_power_consumption.txt", colClasses = classes, sep= ";", stringsAsFactors = FALSE, header =TRUE, na.string = "?")
chartData <- subset(tabAll, Date == '1/2/2007' | tabAll$Date == '2/2/2007')
chartData1 <- cbind(chartData, date_1=as.Date(chartData$Date, "%d/%m/%Y"))
chartData1 <- cbind(chartData1, time_1=strptime(chartData$Time, "%H:%M:%S"))
chartData1 <- cbind(chartData1, date_time=strptime(paste(chartData$Date,chartData$Time), "%d/%m/%Y %H:%M:%S"))
names(chartData1) = tolower(names(chartData1))
png('C:/Users/santibka/repo/ExData_Plotting1/plot3.png', height = 480, width = 480)
plot(chartData1$date_time, chartData1$sub_metering_1, type="l", ylab = "Energy sub metering", xlab = "")
lines(chartData1$date_time, chartData1$sub_metering_2, col = "red")
lines(chartData1$date_time, chartData1$sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, col=c("black","red","blue"))
dev.off()