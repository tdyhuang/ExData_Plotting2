## Read PM2.5 data from files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
## subset records of Baltimore City
b=NEI[which(NEI$fips=='24510'),]
## subset the Baltimore City record with column of year type and Emissions
bb=b[,c(4,5,6)]
## sum up by year and type of Baltimore City Emissions
q3=aggregate(bb$Emissions,by=list(year,type),sum)
## Using ggplot to show each type Improvement from 1999 to 2008 
ggplot(q3,aes(year,Emissions))+geom_bar(stat="identity",aes(fill=year))+facet_grid(.~type)
+labs(title="Change of Emissions in Baltimore City")
dev.copy(png,"plot3.png")
dev.off()
