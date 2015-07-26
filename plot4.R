# Read PM2.5 and SCC data from files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## adding a  the searching Text column of SCC
SCC$Text <- paste(SCC$SCC.Level.One, SCC$SCC.Level.Two,SCC$SCC.Level.Three, SCC$SCC.Level.Four, sep = " ")
## find the SCC code  with combustion and Coal
sub1=SCC[grepl('Coal',SCC$Text,ignore.case=T),]
sub2=sub1[grepl('combustion',sub1$Text,ignore.case=T),]
## subset of NEI records with coal cumbustion related.

p25=NEI[NEI$SCC %in% sub2$SCC]
## sum up the Emissions by year
coal=aggregate(p25$Emissions,list(p25$year),sum)
barplot(coal$x,names.arg=coal$Group.1,col='red',main="Coal Cumbustion related PM2.5 Emissions of US ",
xlab="year",ylab="Emissions(in tons)")
dev.copy(png,"plot4.png")
dev.off()
