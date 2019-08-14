#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")

#Finds instances of both coal and combustion in the Source codes
Coalindex <- as.character(
        SCC[intersect(grep("comb", SCC$Short.Name, ignore.case = TRUE),
                      grep("coal", SCC$Short.Name, ignore.case = TRUE)),
            "SCC"]
)

NEICoal <- NEI[(NEI$SCC%in%Coalindex), ]
plotdat <- aggregate(NEICoal$Emissions, list(NEICoal$year), sum)
names(plotdat) <- c("Year", "Average")
Plot4   <- ggplot(plotdat, aes(Year, Average)) + 
                geom_line() + 
                ggtitle("Total Emissions from Coal Combustion")

# ###Graphics device for in R
# par(mfrow = c(1,1), mar = c(4,4,2,1))
# print(Plot4)

###Graphics device to create .png
png(filename = "Plot4.png", width = 480, height = 480)
print(Plot4)
##Closes out .png device if used
dev.off()