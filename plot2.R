plot2 <- function() {
	# Unzip Zip File
	file<-unzip("exdata-data-household_power_consumption.zip")

	# Read entire file into memory.
	# I have 8 GB RAM and I calculated that the entire data will fit in memory

	data <- read.table(file,header=T,sep=";",as.is=F,na.strings=c("",NA,"?"),stringsAsFactors=F)

	# Subset plot data data.frame
	
	plotdata <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')
	
	# Create columns to concatenate
	
	cols <- c('Date', 'Time')
	
	# Add new string column dattetime to plotdata data.frame
	
	plotdata$datetime <- apply( plotdata[ , cols], 1, paste, collapse = " ")
	
	# Apply strptime function to convert datetime string to POSIX
	
	plotdata$datetime <- strptime(plotdata$datetime, "%d/%m/%Y %H:%M:%S")
	
	# Plot
	with(plotdata, plot(datetime, Global_active_power, type="l", xlab = "", ylab = "Global Active Power (kilowatts)"))

	# Write PNG file to current working directory
	
	dev.copy(png, file = "plot2.png")
	dev.off()
}