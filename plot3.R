library(ggplot2)

url <- 'http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'

if (!file.exists('data/exdata-data-NEI_data.zip')) {
  download.file(url, 'data/exdata-data-NEI_data.zip')
  unzip('data/exdata-data-NEI_data.zip', exdir='./data')
}

pmEmissionsData <- readRDS('data/summarySCC_PM25.rds')
sourceClassificationCode <- readRDS('data/Source_Classification_Code.rds')

data <- pmEmissionsData[pmEmissionsData$fips == "24510",]
data <- aggregate(Emissions ~ year + type, data=data, sum)

plot3 <- qplot(year, Emissions, data=data, color=type, geom="path", main="Emissions By Type In Baltimor", xlab="Year", ylab="Emissions")
ggsave(plot3, file="plot3.png", width=5, height=5)
