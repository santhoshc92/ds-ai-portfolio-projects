# Movie Genre Associations: Recommendation System Using Market Basket Analysis

---

## Project Overview

The system applies Association Rule Mining to movie genres, using the Apriori algorithm to discover strong relationships between genres. This allows the system to suggest genres that are commonly watched together, improving the movie discovery experience for users.

---

## Dataset

The dataset consists of 9,125 movie records and 3 attributes:

| Column Name | Description                                                              |
| ----------- | -------------------------------------------------------------------------|
| **movieId** | A unique identifier assigned to each movie                               |
| **title**   | The name of the movie along with its release year                        |
| **genres**  | A list of genres associated with the movie                               |

---

## Steps Performed

- Data Preprocessing: The movie genres were split into individual lists to represent transactions for Market Basket Analysis.

- Market Basket Analysis: Used the Apriori algorithm to discover frequent genre combinations in the dataset.

- Threshold Optimization: Evaluated rules using Support, Confidence, and Lift, and adjusted thresholds to find the most relevant rules.

- Rule Validation: Split the data into training and test sets to validate the generated rules.

- Genre Recommendation Function: Created a function that recommends genres based on a user’s previously watched genres.

- Visualization: Visualized the top association rules and the strength of relationships using heatmaps.

---

## Evaluation Metrics

The quality of the recommendations is evaluated based on:

- Support: The frequency of co-occurrence between genres.

- Confidence: The likelihood that one genre is recommended based on the presence of another.

- Lift: The strength of the association between two genres.

---

## Visualizations

- Heatmap: Displayed the Lift values between antecedents and consequents of the rules.

- Top Rules: Visualized the most significant genre associations.

---

## Requirements

pandas

mlxtend

matplotlib

seaborn

---