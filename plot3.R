if(!file.exists("./Electric")){dir.create("./Electric")}
unzip("household_power_consumption.zip")

library(dplyr)
data<-read.table("household_power_consumption.txt",header=TRUE,nrows=70000,sep=";", na.strings="?")

##Convert the Date variable to Date classes in R.
data$Date<-as.Date(data$Date,"%d/%m/%Y")

##Select two days
datos<-filter(data,Date=="2007-02-01"| Date=="2007-02-02")

##Make plot
yrange<-range(c(datos$Sub_metering_1,datos$Sub_metering_2,datos$Sub_metering_3))
  with(datos,plot(datetime, Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",ylim=yrange))
par(new=T)
  with(datos,plot(datetime, Sub_metering_2,type="l",ylab="",xlab="",ylim=yrange,col="red"))
par(new=T)
  with(datos,plot(datetime, Sub_metering_3,type="l",ylab="",xlab="",ylim=yrange,col="blue"))

legend("topright", lty=c(1,1), col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

##Copy the plot in a png file.
dev.copy(png, file="plot3.png")
