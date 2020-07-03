library(ggplot2)
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEIbaltimore <- subset(NEI, fips == "24510" & type == "ON-ROAD")

baltimoreMotor <- aggregate(Emissions ~ year + type, NEIbaltimore, sum)

png("plot5.png")

ggplot(baltimoreMotor, aes(year, Emissions)) + 
  geom_line(col = "cadetblue")+ 
  labs(title = "Baltimore motor vehicle"~PM[2.5]~"total emissions by year") +
  xlab("Year") +
  ylab("Vehicle"~PM[2.5]~"emissions per year")

dev.off()