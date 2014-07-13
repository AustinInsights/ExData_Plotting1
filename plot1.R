plot1 <- function() {
	# Unzip Zip File
	file <-unzip("exdata-data-household_power_consumption.zip")

	# Read entire file into memory.
	# I have 8 GB RAM and I calculated that the entire data will fit in memory
	
	data <- read.table(file,header=T,sep=";",as.is=F,na.strings=c("",NA,"?"),stringsAsFactors=F)

	# Subset plot data
	
	plotdata <- subset(data, Date == '1/2/2007' | Date == '2/2/2007')
	
	# Plot
	
	with(plotdata, hist(Global_active_power, 
	                             xlab = "Global Active Power (kilowatts)", 
								 main = paste("Global Active Power"), 
								 col = "red"))
	
	# Write PNG file to current working directory
	dev.copy(png, file = "plot1.png")
	dev.off()
}