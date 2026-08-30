# Airline Customer Feedback Intelligence using NLP, RAG, and Knowledge Graphs

## Project Overview

This project analyzes airline customer feedback using three complementary approaches:

* **Traditional NLP & Machine Learning** — Text preprocessing, Count Vectorization, and Random Forest for sentiment classification.
* **Retrieval-Augmented Generation (RAG)** — Sentence embeddings, FAISS semantic search, and FLAN-T5 for context-aware customer feedback retrieval and responses.
* **Knowledge Graph** — Neo4j and Cypher to represent airlines, feedback, sentiment, and complaints as connected entities and relationships.

The project demonstrates the progression from traditional NLP and machine learning to **Generative AI and knowledge graph-based analysis**.

---

## Project Objectives

* Analyze airline customer feedback using NLP and machine learning.
* Classify customer sentiment.
* Retrieve relevant feedback using semantic search and RAG.
* Represent customer feedback using a knowledge graph.
* Analyze relationships between airlines, sentiment, and complaints.
* Generate business insights from customer feedback.

---

# Approach 1: Traditional NLP & Machine Learning

### Workflow

```text
Tweets
  ↓
Text Preprocessing
  ↓
Count Vectorizer
  ↓
Random Forest
  ↓
Sentiment Classification
```

### Techniques

* NLP preprocessing
* Count Vectorization
* Random Forest Classifier
* Classification Report
* Confusion Matrix

**Model Accuracy: 76.23%**

---

# Approach 2: Retrieval-Augmented Generation (RAG)

### Workflow

```text
Customer Feedback
      ↓
Sentence Embeddings
      ↓
FAISS
      ↓
Semantic Search
      ↓
Relevant Feedback
      ↓
FLAN-T5
      ↓
Business Response
```

### Technologies

* Sentence Transformers (`all-MiniLM-L6-v2`)
* FAISS
* FLAN-T5
* LangChain Prompt Templates

RAG enables semantic retrieval of relevant customer feedback and generates contextual responses using retrieved information.

---

# Approach 3: Knowledge Graph

### Workflow

```text
Airline Tweets
      ↓
Data Preparation
      ↓
Ontology & Semantic Model
      ↓
Neo4j Knowledge Graph
      ↓
Cypher Queries
      ↓
Business Insights
```

### Graph Model

```text
Airline ──HAS_FEEDBACK──> Feedback
                              │
                    ┌─────────┴─────────┐
                    ↓                   ↓
             HAS_SENTIMENT       HAS_COMPLAINT
                    ↓                   ↓
                Sentiment           Complaint
```

### Analysis

Cypher queries are used to analyze:

* Feedback volume by airline
* Sentiment distribution
* Negative complaint categories
* Airline-specific complaints
* Specific customer feedback

---

# Technologies

**Python | Pandas | NumPy | NLTK | Scikit-learn | Random Forest | Sentence Transformers | FAISS | FLAN-T5 | LangChain | Neo4j | Cypher | Matplotlib | Seaborn**

---

# Conclusion

This project demonstrates the use of **traditional NLP/ML, Retrieval-Augmented Generation, and knowledge graphs** for airline customer feedback intelligence. It combines sentiment classification, semantic retrieval, generative AI, and relationship-based analysis to transform unstructured customer feedback into actionable business insights.
