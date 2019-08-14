#NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

#Pulls out all years in dataset
years <- unique(NEI$year)

yrsums <- aggregate(NEI$Emissions, list(NEI$year), sum)
names(yrsums) <- c("Year", "Total_Emissions")

###Graphics device for in R viewing
par(mfrow = c(1,1), mar = c(4,4,2,1))
plot(yrsums$Year, yrsums$Total_Emissions, xlab = "Year", ylab = "Total Emissions")


# ###Graphics device to create .png
# png(filename = "Plot1.png", width = 480, height = 480)
# plot(years, yrsums)
# ##Closes out .png device if used
# dev.off()
