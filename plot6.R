## Read PM2.5 and SCC data from files 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
##subset Baltimore city Record
b=NEI[which(NEI$fips=='24510'),]
##define  motor Vehicle related Emissions source as "ON_ROAD"
BB=b[which(b$type=="ON-ROAD"),]
##sum up by year
Bal=aggregate(BB$Emissions,list(BB$year),sum)

## find Los Angeles City Records in NEI and with the type of "ON-ROAD"
c=NEI[which(NEI$fips=="06037"),]
CC=c[which(c$type=="ON-ROAD"),]
##sum up by year
Los=aggregate(CC$Emissions,list(CC$year),sum)
##rename the colomn names of Bal and Los
names(Bal)=c('year','Emissions')
names(Los)=c('year','Emissions')
##add Bal and Los dataframe with id column Bal id as bal and Los id as los
Bal$id='bal'
Los$id="los"
## rbind two dataframes to compare with plot
BA=rbind(Bal,Los)
## Make the compare plot with ggplot
ggplot(BA,aes(id,Emissions))+geom_bar(stat="identity",aes(fill=id))+facet_grid(.~year)+labs(title="Emissions of motor Vehicle in Baltimore and LA")+labs(x="Area")
dev.copy(png,"plot6.png")
dev.off()
