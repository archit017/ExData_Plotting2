url <- 'http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip'

download.file(url, 'data/exdata-data-NEI_data.zip')
unzip('data/exdata-data-NEI_data.zip', exdir='./data')

