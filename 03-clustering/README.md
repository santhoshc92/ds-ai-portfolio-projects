# Life Expectancy Clustering Using WHO Data

## Project Overview

This project clusters countries based on life expectancy patterns using unsupervised machine learning. By analyzing health, demographic, economic, and social indicators from WHO data, the project uncovers hidden global health patterns and identifies key factors influencing life expectancy.

---

## Dataset Description
 
| **Feature Name**                | **Description**                                                    |
| ------------------------------- | ------------------------------------------------------------------ |
| Country                         | Name of the country                                                |
| Year                            | Year of data collection                                            |
| Status                          | Development status of the country (Developed / Developing)         |
| Life expectancy                 | Average life expectancy at birth (years)                           |
| Adult Mortality                 | Probability of dying between ages 15 and 60 per 1,000 population   |
| Infant deaths                   | Number of infant deaths per 1,000 population                       |
| Alcohol                         | Average alcohol consumption per capita (liters)                    |
| Percentage expenditure          | Health expenditure as a percentage of GDP                          |
| Hepatitis B                     | Immunization coverage for Hepatitis B (%)                          |
| Measles                         | Number of reported measles cases                                   |
| BMI                             | Average Body Mass Index of the population                          |
| Under-five deaths               | Number of deaths of children under five per 1,000 population       |
| Polio                           | Polio immunization coverage (%)                                    |
| Total expenditure               | Government health expenditure as a percentage of total expenditure |
| Diphtheria                      | DPT immunization coverage (%)                                      |
| HIV/AIDS                        | Deaths per 1,000 live births due to HIV/AIDS                       |
| GDP                             | Gross Domestic Product per capita                                  |
| Population                      | Total population of the country                                    |
| Thinness 1–19 years             | Prevalence of thinness among children and adolescents (%)          |
| Thinness 5–9 years              | Prevalence of thinness among children aged 5–9 (%)                 |
| Income composition of resources | Human Development Index (HDI) income component                     |
| Schooling                       | Average number of years of schooling                               |


### Observations from the dataset:

- Life expectancy ranges from 36 to 89 years, with a global average of ~69 years.

- Mortality rates, HIV/AIDS prevalence, GDP, and population show high variability, indicating inequality across countries.

- Immunization coverage is generally high but uneven across countries.

- Several variables contain missing values, requiring preprocessing.

---

## Data Cleaning & Preprocessing

- Standardized column names.

- Checked for negative and invalid values.

- Exploratory Data Analysis (EDA): performed data distribution analysis for numerical features and visualized categorical features using countplot

- Outlier analysis using IQR and boxplots.

- Missing value handling via imputation.

- Encoding categorical variables.

- Feature standardization for clustering.

---

## Clustering Approaches

### 1. KMeans Clustering

Since the elbow method did not yield clear clusters, the silhouette method was used to determine the optimal number of clusters (2 clusters).

**Cluster Insights:**

- Cluster 0: A small group of developing countries with lower life expectancy, higher mortality, lower GDP, and fewer years of schooling.

- Cluster 1: The remaining developing countries plus all developed countries, generally with higher life expectancy, lower mortality, higher GDP, and more schooling.

---

### 2. Hierarchical Clustering

- Linkage method: Ward

- Optimal clusters: 2

- Silhouette Score: 0.272

**Cluster Insights:**

- Similar clustering patterns to KMeans, confirming robust separation between developed and developing countries.

---

## Comparison of KMeans vs Hierarchical

| **Metric / Feature**        | **KMeans**          | **Hierarchical**    |
| --------------------------- | ------------------- | ------------------- |
| Silhouette Score            | 0.269               | 0.272               |
| Cluster Visualization (PCA) | Clear separation    | Some overlap        |
| Interpretation              | Consistent clusters | Consistent clusters |
| Strength                    | Visual separation   | Preserves distances |

### Interpretation:

- KMeans provides clear visual separation.

- Hierarchical clustering captures true distances slightly better in high-dimensional space.

- Both methods consistently separate countries into developed vs developing clusters.

---

## Tools used

- Pandas, NumPy

- Matplotlib, Seaborn

- Scikit-learn (KMeans, Hierarchical Clustering, PCA)

---