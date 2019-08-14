NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Pulls out all years in dataset
years <- unique(NEI$year)
#Group data by year only - Returns list of 4 dataframes for each year
BaltNEI <- subset(NEI, fips =="24510")
Baltyr <- split(BaltNEI, BaltNEI$year) 
rm(NEI)


plotdat <- aggregate(BaltNEI$Emissions, list(BaltNEI$year, BaltNEI$type), sum)
names(plotdat) <- c("Year", "Type", "Average")

Plot3   <- ggplot(plotdat, aes(Year, Average, colour = Type)) + geom_line() #+ facet_grid(rows = vars(Type))
        

###Graphics device to create .png
png(filename = "Plot3.png", width = 480, height = 480)
print(Plot3)
##Closes out .png device if used
dev.off()

