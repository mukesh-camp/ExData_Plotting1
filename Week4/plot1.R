# Load the NEI & SCC data frames.
if(!exists("NEI")){
  NEI <- readRDS("summarySCC_PM25.rds")
}
if(!exists("SCC")){
  SCC <- readRDS("Source_Classification_Code.rds")
}

# Aggregate by sum the total emissions by year
aggregatedTotalByYear <- aggregate(Emissions ~ year, NEI, sum)

# Draw a barplot and save it as plot1.png
png("plot1.png",width=480,height=480,units="px",bg="transparent")
barplot(height=(aggregatedTotalByYear$Emissions)/10^6, names.arg=aggregatedTotalByYear$year, xlab="Year", ylab=expression('PM2.5 emission (10^6 Tons)'),main=expression('Total PM2.5 emissions From All Sources'))
dev.off()