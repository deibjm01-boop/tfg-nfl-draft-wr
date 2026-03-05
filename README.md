# NFL Draft Wide Receiver Round Prediction

Predictive modeling study to estimate the **probability of a college wide receiver being selected in each round of the NFL Draft** using NCAA performance statistics and NFL Combine measurements.

This repository contains the code used in my **Bachelor’s Thesis (TFG)**, where I compare **ordinal logistic regression** and **multinomial logistic regression** to model draft round outcomes.

---

## Project Overview

NFL teams evaluate hundreds of college wide receivers every year using both **on-field performance metrics** and **physical testing results from the NFL Combine**.

The objective of this project is to build statistical models capable of predicting:

> **In which round a wide receiver will be drafted (Rounds 1–7 or Undrafted).**

The analysis focuses on identifying **which player characteristics most influence draft position**, such as:

- Physical attributes (height, weight)
- Athletic performance (40-yard dash, vertical jump, shuttle, etc.)
- College production (receptions, yards, touchdowns)

---

## Full Thesis

The complete Bachelor's Thesis can be accessed through the institutional repository:

https://hdl.handle.net/20.500.14352/118690

This repository contains the code used in the thesis analysis.

---

## Methodology

### 1. Data Import

Raw data is loaded and formatted for analysis.

### 2. Exploratory Data Analysis (EDA)

Exploration of:

- Variable distributions
- Missing values
- Relationships between combine metrics and draft round

### 3. Data Preprocessing

Includes:

- Handling missing values
- Variable transformation
- Feature scaling where appropriate
- Encoding of the draft round as categorical/ordinal

### 4. Feature Selection

Identification of the most informative predictors using:

- Correlation analysis
- Variance Inflation Factor (VIF)
- Statistical significance

### 5. Modeling Approaches

Two different classification approaches are implemented.

#### Ordinal Logistic Regression

Used because draft rounds have a **natural order (1 → 7)**.

Implemented using proportional odds models.

#### Multinomial Logistic Regression

Treats each round as a **separate class**, without assuming ordinal structure.

This allows comparison with the ordinal approach.

### 6. Model Evaluation

Models are evaluated using metrics such as:

- Accuracy
- Confusion Matrix
- Weighted Kappa
- ROC / AUC (when applicable)

The goal is to determine which modeling approach better captures the structure of draft outcomes.

---

## Repository Structure

```

nfl-draft-wr-round-prediction
│
├── README.md
├── LICENSE
│
├── data
│   ├── raw
│   └── processed
│
├── R
│   ├── 01_import.R
│   ├── 02_EDA.R
│   ├── 03_preprocessing.R
│   └── 04_feature_selection.R
│
├── models
│   ├── Ordinal
│   └── multinomial
│
│
└── reports
    ├── TFG.pdf
    └── thesis_link.md



```
