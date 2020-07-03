NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(NEI, fips == "24510")
baltimore <- aggregate(Emissions ~ year,baltimore, sum)

png(filename = "plot2.png")

plot(baltimore$year, baltimore$Emissions, type = "o", col = "darkred", main = expression("Total emissions of "*PM[2.5]*" in Baltimore"), xlab = "Year", ylab =expression("Emissions of "*PM[2.5]*" by year") )

dev.off()