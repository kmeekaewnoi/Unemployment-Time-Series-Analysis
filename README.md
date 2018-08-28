# Time Series Analysis of the unemployment figures of women aged 20 years and over in the US from 1948-1981.

## Introduction

The goal of this study is to identify a model best fitting the United States unemployment data and forecast the unemployment figures. We will investigate the ACF and PACF to see if the data need a transformation. Then we will diagnostic the residuals and examine if the model is validated for this data. And last, we will perform a 12-month forecast using the best model that we found.]

## Requirement

You will need to install the following packages in R.

Packages: "astsa", "PerformanceAnalytics"

## Data

This project was part of my Time Series Analysis class. The dataset I uploaded was between 1948-1981. The original dataset can be downloaded at [FRED](https://fred.stlouisfed.org/series/LNS14000024).

The data collected from 1948 to 1981 of unemployment women aged 20 years and over in the United States, the unit is in thousands. If we look at the time series plot of this data set we will be able to relate back to some of the women workforce history.

![](https://github.com/kmeekaewnoi/Unemployment-Time-Series-Analysis/blob/master/images/figure1.PNG)

From figure 1, we can see that there is a long term trend in this data set. In 1950, there is a peak in the unemployment from the affect of World War II. Millions of women who had joined the workforce during the war were displaced by returning soldiers. Culture and media encouraged these women to give up their jobs and return quietly to domestic life. The obvious arise in the unemployment between 1973 and 1975 were causes by the oil crisis recession. Besides the long-term trend, unemployment figures also have seasonal component that were fluctuate throughout the whole year. We will next try to identify a model that best fitting this data.

## Method

To identify a model best fitting with this data, we need to first examine the behavior of ACF/PACF of the series.

![](https://github.com/kmeekaewnoi/Unemployment-Time-Series-Analysis/blob/master/images/figure2.PNG)

The first two plots from figure 2 are the ACF and PACF of the original data set. The ACF is slowly decay, this suggest that the data need to transform by differencing. After we difference the data with d = 1, we can see that the data is now a seasonal, nonstationary time series.
For the seasonal component, it appears that at the seasons, the ACF is cutting off at lags 1s, 2s,3s,4s,whereas the PACF is tailing off at lags 1s, 2s,3s,4s,…These results implies an SMA(1), P = 0, Q = 1, in the season (s = 12).
For the non-seasonal component, inspecting the sample PACF cutoff after lag 2. This suggests an AR(2) or ARMA(2,0) within the seasons, p = 2, q = 0.
Thus, we can suggest an ARIMA(2,1,0) x (0,1,1)12 on the unemployment data. Next, we will do a residuals analysis for the model.

## Residuals Analysis

![](https://github.com/kmeekaewnoi/Unemployment-Time-Series-Analysis/blob/master/images/figure3.PNG)

Figure 3 display a plot of the standardized residuals, the ACF of the residuals, a boxplot of the standardized residuals, and the p-values associated with the Q-statistic.
The time plot of the standardized residuals shows no obvious pattern. The ACF of the standardized residuals shows no apparent departure from the model assumptions. However, at lag 1.3 the ACF exceeds the bounds. The Q-tests are all not significant, the p-values for the Ljung-Box statistic are all large. And the normal Q-Q plot of the residuals shows that the assumption of normality is reasonable, although there is evidence of outlier and heavy upper tail.
Also, all the parameter estimates of AR1, AR2, and SMA1 are significant at the 0.05 level.
Overall, the ARIMA(2,1,0) x (0,1,1)12 model appears to fit well with this unemployment data.
After we diagnostic the residuals and found that the model assumption is valid, next we will be able to make a forecast using this model.

## Forecasting

We can see from figure 1 that the long-term trend of an unemployment in women tends to go up with time. After using the forecast, we found that the 12-month forecast of this data set is present below.

![](https://github.com/kmeekaewnoi/Unemployment-Time-Series-Analysis/blob/master/images/figure4.PNG)

Figure 4 shows the 12-month forecast that the unemployment in women will continue to go up in 1982. The forecast also shows that the unemployment will goes down in April and reach its peak in August. The actual forecasting is representing below.

![](https://github.com/kmeekaewnoi/Unemployment-Time-Series-Analysis/blob/master/images/figure5.PNG)

## Conclusion
It is not surprise that an SARIMA model would be a good fit for this unemployment data set because unemployment always involves in trend and seasonal. However, there were many factors that could be a reason of the unemployment in women in each century. As mentioned that recession, culture, and economics might have many effect on women workforce in the history.
However, the SARIMA model and its forecasting give a reasonable forecast that an unemployment in women will continue to increase in the future.