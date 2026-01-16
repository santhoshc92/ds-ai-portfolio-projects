# Credit Score Classification Project

## Problem Statement

This project focuses on building a machine learning model to classify individuals’ credit scores into predefined categories (Poor, Standard, and Good) based on their financial and behavioral information. The goal is to provide accurate predictions that can assist financial institutions in assessing creditworthiness.

---

## Dataset Explanation

The dataset contains 100,000 records with financial, demographic, and behavioral features of customers. Key columns include:

| Column Name              | Description                                                             |
| ------------------------ | ----------------------------------------------------------------------- |
| ID                       | Unique identifier for each record                                       |
| Customer_ID              | Unique identifier for each customer                                     |
| Month                    | Month of the record                                                     |
| Name                     | Customer’s name                                                         |
| Age                      | Age of the customer                                                     |
| SSN                      | Social Security Number                                                  |
| Occupation               | Customer’s occupation                                                   |
| Annual_Income            | Total annual income of the customer                                     |
| Monthly_Inhand_Salary    | Monthly take-home salary                                                |
| Num_Bank_Accounts        | Number of bank accounts held                                            |
| Num_Credit_Card          | Number of credit cards owned                                            |
| Interest_Rate            | Interest rate applied to loans                                          |
| Num_of_Loan              | Total number of loans                                                   |
| Type_of_Loan             | Types of loans taken by the customer                                    |
| Delay_from_due_date      | Average number of days payment is delayed                               |
| Num_of_Delayed_Payment   | Number of delayed payments                                              |
| Changed_Credit_Limit     | Recent change in credit limit                                           |
| Num_Credit_Inquiries     | Number of credit inquiries made                                         |
| Credit_Mix               | Variety of credit types held                                            |
| Outstanding_Debt         | Total unpaid debt                                                       |
| Credit_Utilization_Ratio | Percentage of available credit used                                     |
| Credit_History_Age       | Length of credit history                                                |
| Payment_of_Min_Amount    | Whether minimum payment is made                                         |
| Total_EMI_per_month      | Total monthly EMI payments                                              |
| Amount_invested_monthly  | Monthly investment amount                                               |
| Payment_Behaviour        | Spending and payment behavior pattern                                   |
| Monthly_Balance          | Remaining monthly balance after expenses                                |
| Credit_Score             | Target variable indicating credit score category (Poor, Standard, Good) |

---

## Data Cleaning

Data cleaning included:

- Standardizing column formats and correcting incorrect data types.

- Converting mixed-type features (e.g., Credit_History_Age) to consistent numerical formats (months).

- Fixing inconsistent feature values and replacing negative values with NaN.

- Imputing missing values using median (numerical) and mode (categorical).

- Label encoding for categorical variables to prepare for modeling.

- After cleaning, the dataset was ready for exploratory data analysis (EDA) and modeling.

---

## Exploratory Data Analysis (EDA)

- Target variable imbalance: Standard credit scores dominate, while Good and Poor scores are less frequent.

- Feature distribution: Most features are skewed, with prevalent outliers.

- Outlier analysis: Boxplots and histograms were used to identify and treat outliers.

- Skewness and outliers were addressed through preprocessing steps like standardization and careful imputation.

---

## Feature Engineering & Preprocessing

- Multicollinearity check: Variance Inflation Factor (VIF) analysis was performed; features with VIF > 6 were removed for linear models.

- Standardization: Numerical features were scaled to ensure model stability.

- Target encoding & label encoding applied for categorical variables.

- Functions created to automate preprocessing, outlier analysis, and evaluation metric calculation.

---

## Modeling

Several models were evaluated:

| Model                                | Train Accuracy | Test Accuracy | Key Notes                                                                        |
| ------------------------------------ | -------------- | ------------- | -------------------------------------------------------------------------------- |
| Logistic Regression                  | 59.46%         | 59.18%        | Underfits, linear assumptions limit performance.                                 |
| LDA + Logistic Regression            | 57.43%         | 56.95%        | Similar to LR, linear assumptions and skewed features limit performance.         |
| Decision Tree (default)              | 100%           | 67%           | Severe overfitting observed.                                                     |
| Decision Tree (hyperparameter tuned) | 67.51%         | 66.24%        | Hyperparameter tuning improved generalization.                                   |
| Bagging on Decision Tree             | 68.39%         | 68.10%        | Ensemble reduced variance and stabilized predictions.                            |
| Random Forest (default)              | 100%           | 76.85%        | Overfitting on training data.                                                    |
| Random Forest (hyperparameter tuned) | 72.87%         | 70.13%        | Balanced performance, improved generalization.                                   |
| Bagging on Random Forest             | 71.73%         | 69.86%        | Stable ensemble, robust across all classes.                                      |


- Evaluation metrics used: Accuracy, Precision, Recall, F1-score, Confusion Matrix, and Classification Report.

---

## Conclusion

- Linear models (Logistic Regression, LDA) underfit and perform poorly on the minority class.

- Decision Trees perform better after tuning; bagging improves stability and reduces variance.

- Random Forest shows the best overall performance, balancing accuracy, F1-score, and class-wise performance.

- Bagging on Random Forest further stabilizes predictions but offers marginal improvement over the tuned Random Forest.

---

## Final Recommendation

The hyperparameter-tuned Random Forest is the best model for credit score classification, providing robust, balanced predictions with minimal overfitting and reliable performance across all credit score categories.

---

## Tools & Technologies

- Python
- Pandas, NumPy
- Scikit-learn
- Matplotlib, Seaborn
