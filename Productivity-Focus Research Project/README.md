# 🎧 Course-wise Impact of Audio Device Usage on Productivity and Focus

## 📌 Project Overview
This research-oriented data analytics project investigates the **course-wise impact of audio device usage (e.g., headphones/earphones)** on students’ **academic productivity** and **attentional focus**.

The project follows an end-to-end analytical pipeline using **Excel → Python → SQL → Power BI**, combining survey-based data with validated cognitive scales to derive structured, interpretable insights suitable for academic evaluation.

---

## 🎯 Research Objective
To examine whether and how **audio device usage while studying** affects:
- **Academic Productivity** (measured using APS)
- **Attentional Focus** (measured using ACS)

across different **academic course categories**.

---

## ❓ Core Research Questions (Solved Using SQL)

The following five core research questions were addressed using structured SQL analysis:

1. **Do productivity levels (APS) differ across courses of study?**
2. **Do attentional focus levels (ACS) differ across courses of study?**
3. **Are there course-wise differences in productivity and focus between students who study with audio devices and those who do not?**
4. **Do specific audio usage characteristics (duration, volume level, and noise cancellation) influence productivity and focus differently across courses?**
5. **Which courses show the strongest positive or negative impact of audio device usage on productivity and focus?**

---

## 🧪 Methodology & Tools

### 🔹 Excel (Initial Cleaning)
Excel was used for:
- Removing redundant columns
- Renaming variables for clarity
- Reversing negatively framed APS and ACS items
- Performing basic consistency checks

Excel served as a **pre-processing and validation layer** before programmatic analysis.

---

### 🔹 Python (Data Processing & Feature Engineering)
Python was used to:
- Load and clean survey data using **Pandas**
- Encode categorical variables (e.g., noise cancellation usage)
- Convert multi-select listening environments into **binary indicator variables**
- Compute composite scores:
  - **APS_score** (Academic Productivity Scale)
  - **ACS_score** (Attentional Control Scale)
- Round scores for interpretability
- Export an analysis-ready dataset for SQL and Power BI

This ensured a **transparent and reproducible preprocessing pipeline**.

---

### 🔹 SQL (Core Analytical Layer)
SQL Server was used to:
- Store the processed dataset
- Perform group-wise aggregations
- Compare:
  - Course-wise APS and ACS averages
  - Audio users vs low/no audio users
- Analyze audio usage characteristics (duration, volume, noise cancellation)
- Compute **audio impact metrics** (difference between audio and low/no audio groups)

All **primary research questions were solved using SQL**, ensuring analytical clarity and traceability.

---

### 🔹 Power BI (Visualization & DAX)
Power BI was used to present analytical insights through interactive visuals.  
**DAX** was used to create custom measures for average APS, average ACS, and
course-wise audio impact.

Power BI enabled:
- Course-wise comparison of productivity and focus
- Audio users vs low/no audio comparisons
- A summary table highlighting the impact of audio device usage

---

## 🔒 Data Availability & Ethics

The following resources are **not publicly shared** in this repository:
- Raw survey data
- Cleaned Excel files
- Power BI (.pbix) dashboard file

### Reason:
- The dataset contains **human-subject responses**
- Data was collected strictly for **academic research purposes**
- Sharing raw or linked files could compromise:
  - Participant privacy
  - Ethical research compliance

Only **code, methodology, and analytical logic** are shared to ensure transparency while maintaining ethical responsibility.

---

## 📊 Key Insights
- The impact of audio device usage on productivity and focus is **course-dependent**
- Productivity (APS) and attentional focus (ACS) do **not always change in the same direction**
- Students’ **perceived benefit** of headphones does not always align with measured attentional focus
- Audio usage characteristics influence outcomes differently across academic disciplines

---

## 🛠️ Tech Stack
- **Python** (Pandas, NumPy, SQLAlchemy, pyodbc)
- **SQL Server**
- **Power BI**
- **Microsoft Excel**

---

## 📬 Notes
This project demonstrates:
- Research-oriented data analytics
- End-to-end analytical workflow
- Ethical handling of participant data
- Clear separation between perception-based and scale-based outcomes

