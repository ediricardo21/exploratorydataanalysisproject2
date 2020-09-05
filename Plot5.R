NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Ex5 ---------------------------------------------------------------------
baltimore <- subset(NEI,fips == "24510")
png("plot5.png",width=480,height=480,units="px",bg="transparent")


motorMatches  <- grepl("vehicle",SCC$EI.Sector, ignore.case=TRUE)
subsetmotorSCC <- SCC[motorMatches, ]

subsetBalmotor <- subset(baltimore, baltimore$SCC %in% subsetmotorSCC$SCC)
pic5 <- aggregate(Emissions ~ year, subsetBalmotor, sum)

p3 <- ggplot(pic5,aes(factor(year),Emissions))
p5 <- p3+ geom_bar(stat="identity",fill="skyblue",width=0.75) + xlab(as.factor("year"))+
	theme_bw() + labs(x="year", y=expression("Total PM"[2.5]*" Emission")) + 
	labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))+ 
	geom_text(aes(label=round(Emissions,digits = 2)), vjust=0) 
print(p5)
dev.off()

