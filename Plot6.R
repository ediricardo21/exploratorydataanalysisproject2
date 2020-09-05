NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Ex6 ---------------------------------------------------------------------
png("plot6.png",width=480,height=480,units="px",bg="transparent")
LA <- subset(NEI,fips == "06037")
LA$City <- "LA"
baltimore <- subset(NEI,fips == "24510")
baltimore$City <- "Baltimore"

motorMatches  <- grepl("vehicle",SCC$EI.Sector, ignore.case=TRUE)
subsetmotorSCC <- SCC[motorMatches, ]

subLA <- subset(LA, LA$SCC %in% subsetmotorSCC$SCC)
subBAL <- subset(baltimore, baltimore$SCC %in% subsetmotorSCC$SCC)

bothNEI <- rbind(subLA,subBAL)

pic6 <- aggregate(Emissions ~ year+City, bothNEI, sum)

p4 <- ggplot(pic6,aes(factor(year),Emissions,fill=City,label = round(Emissions,2)))
p6 <- p4+ geom_bar(stat="identity",width=0.75) + facet_grid(.~City)+
	geom_label(aes(fill = City),colour = "yellow", fontface = "bold")+
	ylab(expression("total PM"[2.5]*" emissions in tons")) + xlab("year") +
	ggtitle(expression("Baltimore City vs Los Angeles County Motor vehicle emission in tons"))+
	theme_bw()

print(p6)

dev.off()
