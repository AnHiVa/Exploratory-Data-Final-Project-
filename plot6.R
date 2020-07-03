library(ggplot2)
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEIsubset <- subset(NEI, fips %in% c("24510","06037") & type == "ON-ROAD")

BaltLA <- aggregate(Emissions ~ year + fips, NEIsubset, sum)

png("plot6.png")

ggplot(BaltLA, aes(year, Emissions, col = fips))+
  geom_line()+
  labs(title = "Motor Vehicle"~PM[2.5]~"emissions in LA and Baltimore by year")+
  xlab("Years")+
  ylab("Motor Vehicle"~PM[2.5]~"emissions per year")+
  scale_color_discrete(name = "City", labels = c("Los Angeles", "Baltimore"))

dev.off()