#NEI <- readRDS("summarySCC_PM25.rds")
# SCC <- readRDS("Source_Classification_Code.rds")

#Pulls out all years in dataset
years <- unique(NEI$year)
#Group data by year only - Returns list of 4 dataframes for each year
NEIyr <- split(NEI, NEI$year) 

Balt99 <- subset(NEIyr$'1999', fips == "24510")
Balt02 <- subset(NEIyr$'2002', fips == "24510")
Balt05 <- subset(NEIyr$'2005', fips == "24510")
Balt08 <- subset(NEIyr$'2008', fips == "24510")

Baltsums <- c(sum(Balt99$Emissions),sum(Balt02$Emissions),sum(Balt05$Emissions),sum(Balt08$Emissions))

# ###Graphics device for in R viewing
# par(mfrow = c(1,1), mar = c(4,4,2,1))
# plot(years, Baltsums)


###Graphics device to create .png
png(filename = "Plot1.png", width = 480, height = 480)
plot(years, Baltsums)
##Closes out .png device if used
dev.off()