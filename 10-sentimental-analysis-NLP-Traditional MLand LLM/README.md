# Airline Customer Feedback Intelligence using NLP and Retrieval-Augmented Generation (RAG)

## Project Overview

This project analyzes airline customer feedback using two complementary approaches:

1. **Traditional NLP and Machine Learning Approach**
   Performs sentiment classification using text preprocessing, Count Vectorization, and Random Forest to categorize customer feedback into positive, neutral, and negative sentiments.

2. **Generative AI Approach using Retrieval-Augmented Generation (RAG)**
   Implements an intelligent feedback retrieval system using sentence embeddings, FAISS vector database, semantic search, and an open-source Large Language Model (FLAN-T5) to answer business questions using relevant customer feedback.

The project demonstrates the evolution from traditional NLP-based text classification to modern Generative AI-powered information retrieval systems.

---

# Project Objectives

* Analyze airline customer feedback using Natural Language Processing techniques.
* Develop a machine learning-based sentiment classification pipeline.
* Implement a Retrieval-Augmented Generation (RAG) workflow for natural language querying over customer feedback.
* Generate sentence embeddings and store them in a vector database for semantic retrieval.
* Enable context-aware responses using an open-source Large Language Model.
* Compare the capabilities of traditional ML approaches and modern GenAI techniques for customer feedback analysis.

---

# Approach 1: Traditional NLP & Machine Learning

## Workflow

```
Raw Tweets
    ↓
Text Preprocessing
    ↓
Count Vectorizer
    ↓
Random Forest Classifier
    ↓
Sentiment Prediction
```

## Data Preprocessing

Applied NLP preprocessing techniques:

* HTML tag removal
* Contraction expansion
* Special character and punctuation removal
* Unicode normalization
* Tokenization
* Stopword removal
* Lemmatization

## Feature Extraction

### Count Vectorizer (Bag-of-Words)

Converted processed tweets into numerical feature representations based on word frequency patterns.

## Model

### Random Forest Classifier

Used to classify tweets into:

* Positive
* Neutral
* Negative

## Model Evaluation

| Metric    | Score  |
| --------- | ------ |
| Accuracy  | 76.23% |
| Precision | 75.36% |
| Recall    | 76.23% |
| F1-score  | 75.33% |

Evaluation techniques:

* Classification Report
* Confusion Matrix

## Insights

* Negative feedback represents a significant portion of airline customer opinions.
* Common issues include delays, customer service problems, cancellations, and operational challenges.
* Traditional ML provides a reliable and interpretable baseline for sentiment classification.

---

# Approach 2: Generative AI using RAG

## Workflow

```
Customer Feedback
        ↓
Sentence Embeddings
        ↓
FAISS Vector Database
        ↓
Semantic Search
        ↓
Relevant Feedback Retrieval
        ↓
Prompt Construction
        ↓
LLM Generation
        ↓
Business Response
```

## Embedding Generation

Used:

* Sentence Transformer
* Model: `all-MiniLM-L6-v2`

Customer feedback text was converted into vector representations capturing semantic meaning.

---

## Vector Database

Implemented:

* FAISS (Facebook AI Similarity Search)

Purpose:

* Store text embeddings.
* Perform efficient similarity-based retrieval.

---

## Semantic Search

The system converts user queries into embeddings and retrieves the most relevant customer feedback based on contextual similarity.

Example:

Query:

```
Passengers complaining about baggage
```

Retrieved feedback:

```
Lost luggage
Delayed baggage
Missing suitcase
```

---

## Retrieval-Augmented Generation (RAG)

The retrieved customer feedback is provided as context to an open-source LLM.

Process:

```
User Question
      ↓
Semantic Search
      ↓
Relevant Feedback
      ↓
Prompt Template
      ↓
FLAN-T5 LLM
      ↓
Generated Business Summary
```

## Large Language Model

Used:

* Google FLAN-T5 Base

Purpose:

* Generate contextual responses based only on retrieved customer feedback.

---

# Key Insights from RAG Implementation

* Semantic search retrieves relevant feedback based on meaning rather than exact keywords.
* Vector embeddings enable efficient similarity-based information retrieval.
* RAG reduces unsupported responses by grounding LLM outputs using retrieved customer feedback.
* LLMs can transform unstructured customer feedback into concise business summaries.

---

# Technologies & Libraries

## Programming

* Python

## Data Processing

* Pandas
* NumPy

## NLP

* NLTK
* BeautifulSoup
* Sentence Transformers

## Machine Learning

* Scikit-learn
* Count Vectorizer
* Random Forest

## Generative AI

* Hugging Face Transformers
* FLAN-T5
* FAISS Vector Database
* LangChain Prompt Templates

## Visualization

* Matplotlib
* Seaborn

---

# Conclusion

This project demonstrates both traditional and modern approaches for airline customer feedback intelligence. The machine learning pipeline provides reliable sentiment classification using interpretable NLP techniques, while the RAG pipeline extends the system by enabling semantic search and natural language question answering using embeddings, vector databases, and Large Language Models.

Together, these approaches demonstrate the practical application of NLP and Generative AI techniques for extracting insights from unstructured customer feedback.
