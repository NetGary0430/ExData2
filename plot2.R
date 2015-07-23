## Load the NEI & SCC data frames.
## This takes time - use recommended techique

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Subset NEI data by Baltimore's fip.
## This makes using the aggregate command to summarize the data faster
baltimoreNEI <- NEI[NEI$fips=="24510",]

## Aggregate the data using the aggregate command
aggTotalsBaltimore <- aggregate(Emissions ~ year, baltimoreNEI,sum)


## Plot the desired results
png("plot2.png",width=480,height=480,units="px",bg="transparent")

barplot(
  aggTotalsBaltimore$Emissions,
  names.arg=aggTotalsBaltimore$year,
  xlab="Year",
  ylab="PM2.5 Emissions (Tons)",
  main="Total PM2.5 Emissions From all Baltimore City Sources"
)

## Turn off the plot device so that the file will be created
dev.off()
