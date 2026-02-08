# Airline Tweet Sentiment Analysis – NLP & LLM Approaches

## Project Overview

This project analyzes public sentiment toward major U.S. airlines using Twitter data. We combine traditional Natural Language Processing (NLP) techniques, machine learning models, and Large Language Model (LLM)–based approaches to understand customer feedback, detect trends, and derive actionable insights for airlines

### Objectives

- Collect and preprocess airline-related tweets for analysis.
- Perform sentiment classification into Positive, Neutral, and Negative categories using:
	- Traditional ML models with Count Vectorizer
	- Prompt-based LLMs (zero-shot and few-shot)
- Compare model performance using evaluation metrics such as:
	- Accuracy, Precision, Recall, F1-score
	- Confusion matrices
	- Exact match, consistency, hallucination, and prompt sensitivity
- Visualize sentiment distributions across airlines to identify trends and pain points.
- Provide recommendations for leveraging NLP tools in real-world airline customer feedback monitoring.

---

## Data Exploration & Analysis

- Percentage of tweets by airline company
- Distribution of sentiments across all tweets
- Sentiment distribution per airline
- Analysis of negative tweet reasons
- Visualizations: Word Clouds, bar charts, and sentiment distribution plots

---

## Data Preprocessing

- Removal of HTML tags
- Expansion of contractions
- Removal of special characters, numbers, and punctuation
- Unicode normalization
- Tokenization and stopword removal
- Lemmatization

---

## Method 1: Traditional NLP & Machine Learning

- Vectorization: Count Vectorizer
- Model: Random Forest Classifier
- Performance:

| Metric    | Value  |
| --------- | ------ |
| Accuracy  | 0.7623 |
| Precision | 0.7536 |
| Recall    | 0.7623 |
| F1-score  | 0.7533 |

### Insights

- Negative tweets dominate, often related to customer service issues.
- Traditional ML provides a reliable baseline with interpretable results.

---

## Method 2: Prompt-Based LLM Sentiment Analysis

### Approach 1: Text-Generation Prompting (FLAN-T5)

- Zero-shot and few-shot sentiment classification using LangChain and Hugging Face Transformers.
- Issue: The model was deterministic but biased toward one class.
- Accuracy: ~19%
- Hallucination Rate: 0%
- Observation: High consistency, low accuracy — shows sensitivity to prompt design.

### Approach 2: Task-Aligned Zero-Shot Classification (BART-MNLI)

- Zero-shot classification pipeline for direct sentiment detection.
- Accuracy: 72.5%
- Observation: Switching to task-aligned models dramatically improves performance.

## Key Insight

- LLMs require proper task alignment; prompt-based generation may underperform for structured classification tasks.

---

## Comparative Analysis

| Approach                              | Accuracy | Strengths                                          | Limitations                                            |
| --------------------------------------| -------- | -------------------------------------------------- | ------------------------------------------------------ |
| Traditional ML (Count Vectorizer + RF)| 76%      | Fast, interpretable, reliable baseline             | Needs feature engineering, less semantic understanding |
| LLM-based (FLAN-T5)                   | 19%      | Flexible, zero/few-shot learning                   | Sensitive to prompts, biased if misaligned             |
| LLM-based (BART-MNLI)                 | 72.5%    | Accurate, zero-shot ready, task-aligned            | Moderate computational cost                            |


---

## Visualizations

- Word clouds for negative tweets
- Sentiment distribution per airline
- Comparative bar charts of model predictions

---

## Conclusion

- Most public feedback on U.S. airlines is negative, primarily due to customer service issues.
- Traditional ML approaches are reliable baselines but require feature engineering.
- Transformer-based and task-aligned LLMs achieve higher accuracy and semantic understanding.
- Prompt-based text-generation LLMs need careful design and alignment with the task.

---

## Recommendations

- Airlines should monitor real-time feedback using NLP pipelines.
- Focus on improving customer service and issue resolution.
- Consider combining traditional ML and modern LLMs for better accuracy and scalability.

---

## Technologies & Libraries

- Python
- Pandas, NumPy, Matplotlib, Seaborn
- NLTK, BeautifulSoup, Contractions
- Scikit-learn (Random Forest, TF-IDF)
- Hugging Face Transformers (BART-MNLI, FLAN-T5)
- LangChain (LLM prompting)

