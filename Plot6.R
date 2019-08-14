#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

#Finds instances of Motor Vehicle emissions, sorts a subset for only LA and Baltimore
MVindex <- as.character(SCC[grep("vehic", SCC$SCC.Level.Two, ignore.case = TRUE), "SCC"])
MVBaltLA <- subset(NEI[(NEI$SCC%in%MVindex), ], fips =="24510"|fips =="06037")

plotdat <- aggregate(MVBaltLA$Emissions, list(MVBaltLA$year,MVBaltLA$fips), sum)

names(plotdat) <- c("Year", "fips", "Emissions")
Plot6 <- ggplot(plotdat, aes(Year, Emissions, color = fips), xlab = "Year", ylab = "Total Emissions", color = "red") + 
                geom_line() + 
                ggtitle("Total Motor Vehicle Emissions LA vs. Baltimore")

# ###Graphics device for in R viewing
# par(mfrow = c(1,1), mar = c(4,4,2,1))
# print(Plot6)

###Graphics device to create .png
png(filename = "Plot6.png", width = 480, height = 480)
print(Plot6)
##Closes out .png device if used
dev.off()