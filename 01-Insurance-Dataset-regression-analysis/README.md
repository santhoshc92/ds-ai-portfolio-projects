# Insurance Charges Prediction

## Project Overview

This project focuses on predicting insurance charges based on customer demographics and medical history. Using exploratory data analysis (EDA), feature engineering, and multiple regression models, the goal is to build a robust predictive model to accurately estimate insurance charges for new customers.

The dataset includes variables such as age, sex, BMI, smoking status, region, annual salary, hospital expenditure, past consultations, and claim amounts.

---

## Dataset Description

The dataset contains information about individuals and their medical expenses:

| Feature                             | Description                                          |
| ----------------------------------- | ---------------------------------------------------- |
| **age**                             | Age of the individual                                |
| **sex**                             | Gender (male/female)                                 |
| **bmi**                             | Body Mass Index — a measure of body fat              |
| **children**                        | Number of dependents                                 |
| **smoker**                          | Whether the person is a smoker (yes/no)              |
| **Claim_Amount**                    | Previous insurance claim amount filed                |
| **past_consultations**              | Number of past medical consultations                 |
| **num_of_steps**                    | Average number of steps taken daily (activity level) |
| **Hospital_expenditure**            | Previous hospital spending                           |
| **Number_of_past_hospitalizations** | Count of past hospitalizations                       |
| **Annual_Salary**                   | Annual income of the individual                      |
| **region**                          | Residential region                                   |
| **charges** *(Target variable)*     | Total medical insurance charges                      |

---

## Exploratory Data Analysis (EDA)

- Categorical Features: sex, smoker, region, children

	Visualized using value_counts and count plots.

- Distribution Analysis

	Only BMI follows a normal distribution; other numerical features are skewed.

- Outlier Analysis

	Outliers detected in charges, annual_salary, hospital_expenditure, past_consultations, and BMI. Outliers were not treated since the target variable also contains extreme values influenced by independent variables.

- Missing Values: Imputed where necessary.

---

## Categorical Encoding

Applied Label Encoding for categorical variables.

## Feature Selection

Correlation analysis showed strong to moderate correlation of charges with: smoker, claim_amount, past_consultations, num_of_steps, hospital_expenditure, number_of_past_hospitalizations, annual_salary

Features such as age, sex, region, children, BMI were not used in the initial model due to low correlation with charges.

---

## Data Preprocessing

- Train-test split applied.

- Standardization of numerical features.

- Function created to calculate R² and RMSE for model evaluation.

---

## Model Building & Evaluation

| Model             | R² (Train) | R² (Test) | RMSE (Train) | RMSE (Test) | Observation                               |
| ----------------- | ---------- | --------- | ------------ | ----------- | ----------------------------------------- |
| Linear Regression | 0.981      | 0.985     | 0.138        | 0.110       | High accuracy, generalizes well           |
| Decision Tree     | 1.0        | 0.995     | 0.0          | 0.065       | Excellent predictions, slight overfitting |
| DT (Tuned)        | 0.998      | 0.996     | 0.045        | 0.057       | Reduced overfitting, robust               |
| Random Forest     | 0.999      | 0.997     | 0.031        | 0.047       | Highly accurate, robust                   |
| RF (Tuned)        | 0.999      | 0.997     | 0.026        | 0.054       | Most reliable, excellent generalization   |


---

# Key Takeaways

- All models performed well.

- Tree-based models outperformed Linear Regression.

- Random Forest (tuned) achieved the best combination of accuracy and robustness, making it the preferred model for predicting insurance charges.

- Metrics were visualized using bar plots for train and test sets.

---

### Technologies Used

- Python (Pandas, NumPy, Scikit-learn, Matplotlib, Seaborn)

- Jupyter Notebook for development and visualization