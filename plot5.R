## Read PM2.5 and SCC data from files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##subset Baltimore city Record
b=NEI[which(NEI$fips=='24510'),]
##define  motor Vehicle related Emissions source as "ON_ROAD"
BB=b[which(b$type=="ON-ROAD"),]
##sum up by year
bal=aggregate(BB$Emissions,list(BB$year),sum)
## make a plot 
barplot(bal$x,names.arg=bal$Group.1,ylim=c(0,400),col='red',main="Motor Vehicle Emissions of Baltimore City",ylab='Emissions(in tons)',xlab='year')
dev.copy(png,"plot5.png")
dev.off()
