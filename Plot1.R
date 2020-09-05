
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Ex1 ---------------------------------------------------------------------
png("plot1.png",width=480,height=480,units="px",bg="transparent")

pic1 <- tapply(NEI$Emissions,NEI$year,sum)
pic1 <- pic1/1000
cols <- c("maroon","yellow","skyblue","green")
barplot(pic1,main = expression('Aggregated PM'[2.5]*' Emmissions by Year'),col =cols,ylab = "Emmissions in Tons /1000")

dev.off()
