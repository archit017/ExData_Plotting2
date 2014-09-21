library(ggplot2)

url <- 'http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'

if (!file.exists('data/exdata-data-NEI_data.zip')) {
  download.file(url, 'data/exdata-data-NEI_data.zip')
  unzip('data/exdata-data-NEI_data.zip', exdir='./data')
}

pmEmissionsData <- readRDS('data/summarySCC_PM25.rds')
sourceClassificationCode <- readRDS('data/Source_Classification_Code.rds')

sources <- sourceClassificationCode[grepl("On-Road", sourceClassificationCode$EI.Sector),]
sources <- sources$SCC
data <- pmEmissionsData[pmEmissionsData$SCC %in% sources,]
data <- pmEmissionsData[pmEmissionsData$fips %in% c("24510", "06037"),]
data <- aggregate(Emissions ~ year + fips, data=data, sum)

plot <- qplot(year, Emissions, color=fips, data=data, geom="path", main="Emissions From Vehicle Related Sources in Baltimore and Los Angeles County", xlab="Year", ylab="Emissions")
ggsave(plot, file="plot6.png", width=10, height=5)
