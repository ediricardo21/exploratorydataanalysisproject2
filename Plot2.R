
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Ex2 ---------------------------------------------------------------------
baltimore <- subset(NEI,fips == "24510")

png("plot2.png",width=480,height=480,units="px",bg="transparent")

pic2 <- tapply(baltimore$Emissions,baltimore$year,sum)
pic2 <- pic2/1000
cols <- c("maroon","yellow","skyblue","green")
barplot(pic2,main = expression('Aggregated PM'[2.5]*' Emmissions by Year in Baltimore'),col =cols,ylab = "Emmissions in Tons /1000")

dev.off()
