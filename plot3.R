library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")

baltimore <- subset(NEI, fips == "24510")
baltimore <- aggregate(Emissions ~ year + type,baltimore, sum)

png("plot3.png")

qplot(year, Emissions, data = baltimore,geom = "line", col = type, main = "Total"~PM[2.5]~"emissions by type in Baltimore", ylab = PM[2.5]~"emissions by year", xlab = "Year")

dev.off()
