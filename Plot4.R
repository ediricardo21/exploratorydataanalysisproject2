
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


# Ex4 ---------------------------------------------------------------------
png("plot4.png",width=480,height=480,units="px",bg="transparent")

coalMatches  <- grepl("coal", SCC$Short.Name, ignore.case=TRUE)
subsetSCC <- SCC[coalMatches, ]


subsetNEI <- subset(NEI, NEI$SCC %in% subsetSCC$SCC)
pic4 <- aggregate(Emissions ~ year, subsetNEI, sum)

p2 <- ggplot(pic4,aes(factor(year),Emissions/10^5))
p4 <- p2+ geom_bar(stat="identity",fill="skyblue",width=0.75) + xlab(as.factor("year")) +  
	ylab(expression('Total Emissions')) + ggtitle('Total [2.5]* Coal Emissions From 1999 to 2008 /100000')
print(p4)
dev.off()
