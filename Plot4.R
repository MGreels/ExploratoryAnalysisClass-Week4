NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#Finds instances of both coal and combustion in the Source codes
Coalindex <- as.character(
        SCC[intersect(grep("comb", SCC$Short.Name, ignore.case = TRUE),
                      grep("coal", SCC$Short.Name, ignore.case = TRUE)),
            "SCC"]
)
