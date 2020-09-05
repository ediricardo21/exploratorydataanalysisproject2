
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Ex3 ---------------------------------------------------------------------
library(ggplot2)
baltimore <- subset(NEI,fips == "24510")

png("plot3.png",width=480,height=480,units="px",bg="transparent")

pic3 <- aggregate(Emissions ~ year + type, baltimore, sum)

p <- ggplot(pic3,aes(year,Emissions,color=type))
p3 <- p+geom_line()+ggtitle(expression('Total Aggregated PM'[2.5]*' Emmissions by Year in Baltimore'))
print(p3)
dev.off()
