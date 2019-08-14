NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Pulls out all years in dataset
years <- unique(NEI$year)

##  #Pulls out Baltimore only
BaltNEI <- subset(NEI, fips =="24510")

## # Aggregates sums of all types of Emissions by year only
Baltsums <- aggregate(BaltNEI$Emissions, list(BaltNEI$year), sum)
names(Baltsums) <- c("Year", "Total") ## Adds Data labels

# ###Graphics device for in R viewing
# par(mfrow = c(1,1), mar = c(4,4,2,1))
# plot(years, Baltsums)

###Graphics device to create .png
png(filename = "Plot2.png", width = 480, height = 480)
plot(Baltsums$Year, Baltsums$Total, ylab = "Total Emissions", xlab = "Year")
##Closes out .png device if used
dev.off()