PEOarima<-scan("PEO.csv")
PEOtimeseries<-ts(PEOarima, start=c(1992))
plot(PEOtimeseries, main="College Participation among under-resourced, 1992-2012", ylab="participation rate")
PEOtimeseriesarima<-auto.arima(PEOtimeseries)
PEOtimeseriesarima
library("forecast")
PEOtimeseriesforecasts<-forecast.Arima(PEOtimeseriesarima, h=10)
PEOtimeseriesforecasts
PEOdiff1<-diff(PEOtimeseries, differences=3)
acf(PEOdiff1, lag.max=20, main="Lag of model differences")
acf(PEOdiff1, lag.max=20, plot=FALSE)
plot.ts(PEOdiff1, main="Plot of Differeneces")
plot.forecast(PEOtimeseriesforecasts, main="College Participation from Under Served Students", ylab="College Participation %", xlab="Forecast for Next Ten Years", col="blue")

