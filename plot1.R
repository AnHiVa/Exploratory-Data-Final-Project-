NEI <- readRDS("summarySCC_PM25.rds")

NEI <- aggregate(Emissions ~ year, NEI, sum)

png(filename = "plot1.png")

plot(NEI$year, NEI$Emissions, type = "o", col = "darkred", main = expression("Total emissions of "*PM[2.5]), xlab = "Year", ylab =expression("Emissions of "*PM[2.5]) )

dev.off()
