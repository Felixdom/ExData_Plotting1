##To see the code for load and read the data see plots 1, 2 or 3.

par(mfrow=c(2,2),mar=c(2,4,1,1)

#First plot
with(datos,plot(datetime, Global_active_power,type="l",ylab="Global active power", xlab=""))

#Second plot
with(datos,plot(datetime, Voltage,type="l",ylab="Voltage",xlab=""))

#Third plot
yrange<-range(c(datos$Sub_metering_1,datos$Sub_metering_2,datos$Sub_metering_3))
with(datos,plot(datetime, Sub_metering_1,type="l",ylab="Energy sub metering",xlab="",ylim=yrange))
par(new=T)
with(datos,plot(datetime, Sub_metering_2,type="l",ylab="",xlab="",ylim=yrange,col="red"))
par(new=T)
with(datos,plot(datetime, Sub_metering_3,type="l",ylab="",xlab="",ylim=yrange,col="blue"))
legend("topright", lty=c(1,1), col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#Fourth plot
with(datos,plot(datetime, Global_reactive_power,type="l",ylab="Global reactive power",xlab=""))

##Copy the plot in a png file.
dev.copy(png, file="plot4.png")
dev.off()
