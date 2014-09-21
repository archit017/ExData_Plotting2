url <- 'http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'

if (!file.exists('data/exdata-data-NEI_data.zip')) {
  download.file(url, 'data/exdata-data-NEI_data.zip')
  unzip('data/exdata-data-NEI_data.zip', exdir='./data')
}

pmEmissionsData <- readRDS('data/summarySCC_PM25.rds')
sourceClassificationCode <- readRDS('data/Source_Classification_Code.rds')

data <- aggregate(Emissions ~ year, data=pmEmissionsData, sum)

png('plot1.png', width = 480, height = 480)                                                                              
plot(data$year, data$Emissions, type="b", main="Total Emissions Per Year", xlab="Year", ylab="Total Emissions")
dev.off()
