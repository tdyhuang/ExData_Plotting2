## Read PM2.5 data from files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## subset records of Baltimore City
b=NEI[which(NEI$fips=='24510'),]
## sum up total emissions of PM2.5 in Baltimore City  by year
baltimore=aggregate(b$Emissions,by=list(b$year),sum)
## Make a barplot to show that the Emissions of Baltimore City has and decreased in the period of  1999 to 2008
png("plot2.png")
barplot(baltimore$x,names.arg=baltimore$Group.1,col='red',xlab='year',ylim=c(0,3500),
ylab='Emissions of PM2.5(in tons)',main="Total Emissions of PM2.5 in Baltimore City")
dev.off()
