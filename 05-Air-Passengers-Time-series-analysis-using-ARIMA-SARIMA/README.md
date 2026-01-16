# Air Passengers Time Series Analysis & Forecasting

## Project Objective

The goal of this project is to analyze the **Air Passengers** time series dataset to identify trend and seasonal patterns and build a reliable forecasting model for predicting future airline passenger demand.

---

## Dataset Description

| Column Name | Description                            |
| ----------- | -------------------------------------- |
| month       | Year and month of observation          |
| passengers  | Number of airline passengers per month |

The dataset records monthly airline passenger numbers, making it suitable for time series analysis and forecasting.

---

## Data Preprocessing

- Convert the month column to datetime format.

- Set month as the index of the DataFrame.

- Exploratory Data Analysis (EDA) was conducted to understand trends, seasonality, and variance.

- Observations:

	- The time series shows increasing trend and seasonal fluctuations.

	- The fan-shaped ACF indicates changing variance → log transformation is needed.

	- Slow decay in ACF indicates a non-stationary mean → differencing is required.

---

## Data Transformation & Stationarity

- Log Transformation: To stabilize variance.

- Differencing:

	- Regular differencing was applied to remove trend.

	- Seasonal differencing (lag=12) was applied to remove annual seasonality.

- Stationarity Testing: Performed using the ADF test, ACF, and PACF plots.

---

## Model Building

1. ARIMA Model

	- Order (2,1,1) from correlation plots:

		- RMSE: 0.2009

	- Order (4,1,3) from auto_arima:

		- RMSE: 0.1368

- Observation: Auto ARIMA performs better than manual order selection but still deviates from actual values.

2. SARIMA Model

	- Order (2,1,1)(1,1,1)[12] from correlation plots:

		- RMSE: 0.0320

	- Order (0,1,1)(1,0,1)[12] from auto_arima:

		- RMSE: 0.0312 → best fit

- Observation: SARIMA models significantly outperform ARIMA by capturing seasonality effectively.

---

## Final Model

- SARIMA (0,1,1)(1,0,1)[12] on log-transformed data

- Forecasted the next 24 months of airline passenger demand.

- The model provides accurate predictions that closely follow observed patterns.

---

## Key Insights

- The Air Passengers dataset exhibits strong trends and yearly seasonality.

- Log transformation and differencing are essential for stationarity.

- Seasonality-aware models (SARIMA) dramatically improve forecasting accuracy.

- Final Model Recommendation: SARIMA (0,1,1)(1,0,1)[12] for reliable monthly passenger forecasts.

---

## Libraries Used

- pandas, numpy → data manipulation

- matplotlib, seaborn → visualization

- statsmodels → ARIMA/SARIMA modeling, ADF test

- pmdarima → auto_arima for automated order selection

