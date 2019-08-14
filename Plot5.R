#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

#Finds instances of motor vehicle emissions, sorts for Baltimore City fips
MVindex <- as.character(SCC[grep("vehic", SCC$SCC.Level.Two, ignore.case = TRUE), "SCC"])
MVBalt <- subset(NEI[(NEI$SCC%in%MVindex), ], fips =="24510")

plotdat <- aggregate(MVBalt$Emissions, list(MVBalt$year), sum)
names(plotdat) <- c("Year", "Emissions")
Plot5   <-      ggplot(plotdat, aes(Year, Emissions), xlab = "Year", ylab = "Total Emissions")  + 
                geom_line() + 
                ggtitle("Total Motor Vehicle Emissions in Baltimore")

# ###Graphics device for in R
# par(mfrow = c(1,1), mar = c(4,4,2,1))
# print(Plot5)

###Graphics device to create .png
png(filename = "Plot5.png", width = 480, height = 480)
print(Plot5)
##Closes out .png device if used
dev.off()