# Read in the dataset
unemploy<-read.csv("./data/monthly-us-female-20-years.csv")

# Change column name (only column 2)
names(unemploy)[2]<-"count"

# Look at the structure of the data
str(unemploy)
summary(unemploy)

#install astsa package
install.packages("astsa")
library(astsa)


#Create a time series format
unemploy.ts <- ts(unemploy$count, frequency=12, start=c(1948,1),end = c(1981,12))
unemploy.ts
#Plot the time series
install.packages("PerformanceAnalytics")
library(PerformanceAnalytics)
PerformanceAnalytics::chart.TimeSeries(as.xts(unemploy.ts),element.color = "darkgray",
                                       main  = "Monthly US Female Unemployment in Thousands",
                                       grid.color = "lightgray",colorset = "blue")

#transform the data 
unem.diff <- diff(unemploy.ts)
unem.diff
#plot the data after differencing
plot(unem.diff)

#Plot of the ACF/PACF before and after transformation
par(mfrow=c(4,1))
unem.ACF<-acf(unemploy.ts)
unem.PACF<-pacf(unemploy.ts)
acf2(unem.diff,108)

# Residuals Analysis
sarima(unemploy.ts,2,1,0,0,1,1,12)
par(mfrow=c(4,1))
#Forecasting
sarima.for(unemploy.ts,12,2,1,0,0,1,1,12)

