## Read PM2.5 data from files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## sum up total emissions of PM2.5 by year
a=aggregate(NEI$Emissions,by=list(NEI$year),sum)
## make the plot
png("plot1.png")
barplot(a$x,names.arg=a$Group.1,ylim=c(0,8000000),col='red',
xlab='year',ylab='Emissions of PM2.5(in tons)',main="Total Emissions of PM2.5 in United States")
dev.off()
