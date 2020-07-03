library(ggplot2)
library(dplyr)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

SCCcoal <- SCC[grepl("Coal", SCC$Short.Name, ignore.case = TRUE),]

NEIcoal <- subset(NEI, SCC %in% SCCcoal$SCC)

Coal <- aggregate(Emissions ~ year + type, NEIcoal, sum)

png("plot4.png")

ggplot(Coal, aes(year, Emissions, col = type))+
  geom_line() +
  labs(x = "Year", y = PM[2.5]~"Coal emissions", title = "Total"~PM[2.5]~"coal emissions by year and type")

dev.off()

