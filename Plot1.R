#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

#Pulls out all years in dataset
years <- unique(NEI$year)
#Group data by year only - Returns list of 4 dataframes for each year
NEIyr <- split(NEI, NEI$year) 

yrsums <- c(sum(NEIyr$`1999`$Emissions),sum(NEIyr$`2002`$Emissions),sum(NEIyr$`2005`$Emissions),sum(NEIyr$`2008`$Emissions))


#Graphics device to create .png
# png(filename = "Plot1.png", width = 480, height = 480)

#Graphics device for in R viewing
par(mfrow = c(1,1), mar = c(4,4,2,1))
plot(years, yrsums)

#Closes out .png device if used
#dev.off()
