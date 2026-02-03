# Electricity Consumption Forecasting using LSTM

This project implements a Long Short-Term Memory (LSTM) neural network to forecast hourly electricity consumption using historical time series data. The model is designed for short-term load forecasting, enabling effective energy management, demand planning, and smart grid applications.

---

## Project Overview

- Objective: Predict the next hour’s electricity consumption based on the previous 24 hours.
- Approach: Deep learning–based time series forecasting using LSTM networks.
- Focus: Single-household forecasting (Household T1) as a representative univariate time series.
- Prediction Type: One-step-ahead (next-hour) forecasting.

---

## Dataset Description

- Source: UCI Electricity Load Diagrams Dataset
- Time Span: 2012–2014
- Resolution: Hourly (aggregated from 15-minute intervals)
- Households: 321 independent time series

### Dataset Structure

| Component | Description                                |
| --------- | ------------------------------------------ |
| Rows      | Each row represents one household          |
| Columns   | Hourly electricity consumption values      |
| Features  | Univariate (electricity consumption in kW) |

---

## Data Preprocessing

- Selected a single household (T1) for modeling.
- Applied MinMaxScaler to normalize the data.
- Created sliding windows of 24 hours to predict the next hour.
- Split data into 80% training and 20% testing, preserving temporal order.

---

## Model Architecture

- LSTM layer (64 units, return sequences)
- LSTM layer (32 units)
- Dropout (0.2)
- Dense Layer (ReLU)
- Output Layer (1 neuron)

### Training Settings

- Optimizer: Adam
- Loss Function: Mean Squared Error (MSE)
- Metric: Mean Absolute Error (MAE)
- Early Stopping to prevent overfitting
- No shuffling (time series constraint)

---

## Model Performance

| Metric | Value     |
| ------ | --------- |
| MAE    | ≈ 4.76 kW |
| RMSE   | ≈ 8.56 kW |

- Training and validation losses decreased steadily.
- Predictions closely matched actual consumption patterns.
- Minimal overfitting observed.

---

## Forecasting Future Data

- A dedicated function enables next-hour electricity consumption prediction using the most recent 24-hour window.
- Uses the trained LSTM model
- Applies inverse scaling to return predictions in kW
- Supports real-time, one-step-ahead forecasting

---

## Results Visualization

- Time series visualization of electricity consumption
- Training vs validation loss curves
- Actual vs predicted consumption plots

---

## Technologies Used

- Python
- Pandas, NumPy
- Matplotlib
- Scikit-learn
- TensorFlow / Keras

---

## Conclusion

The LSTM-based model demonstrates strong performance in forecasting hourly electricity consumption. With accurate predictions and real-time forecasting capability, it provides a robust and scalable solution for short-term energy demand prediction.