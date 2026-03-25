# 🔍 Exploratory Data Analysis w/ SQL: Job Market Analytics

![Project Overview](../IMAGE\1_1_Project1_EDA.png)

## 📋 Project Overview
This project is a deep-dive analysis of the **Data Engineer** job market using a real-world dataset of over 100,000 job postings. By leveraging **DuckDB** and **MotherDuck**, I designed an analytical workflow to identify high-value skills, salary trends, and the "Optimal" path for career growth in data engineering.

## 🧾 Executive Summary (For Hiring Managers)
* **Project Scope:** Engineered **3 core analytical queries** to solve complex business questions regarding market demand and compensation.
* **Data Modeling:** Navigated a **Star Schema** with millions of potential row combinations using efficient multi-table joins.
* **Advanced Analytics:** Implemented statistical functions like `MEDIAN()` and mathematical transformations like `LN()` for data normalization.
* **Strategic Outcomes:** Identified **Terraform** as a top-tier salary driver and **Python/SQL** as the primary market "gatekeepers."

---

## 🧩 Problem & Context
The data engineering field moves fast. To stay competitive, professionals need to know:
1. 🎯 **Demand:** Which skills appear most frequently in job descriptions?
2. 💰 **Salary:** Which skills actually translate to higher annual compensation?
3. ⚖️ **ROI:** What is the best "Return on Investment" skill (high pay + high demand)?

### Data Warehouse Architecture
The project utilizes a relational database structure designed for analytical performance:

![Data Warehouse Schema](../IMAGE\1_2_Data_Warehouse.png)

* **Fact Table:** `job_postings_fact` (Core metrics: Title, Salary, Location)
* **Dimension Tables:** `company_dim` (Company Info), `skills_dim` (Skill Catalog)
* **Bridge Table:** `skills_job_dim` (Maps skills to specific postings)

---

## 🧰 Tech Stack
* **Engine:** **DuckDB** (Process-embedded OLAP)
* **Cloud:** **MotherDuck** (Serverless Data Warehouse)
* **Language:** **SQL** (PostgreSQL dialect)
* **IDE:** **VS Code** with SQL & Git extensions

---

## 🏗 Analysis Overview

### 1. Top Demanded Skills ([01_top_demanded_skills.sql](../1_EDA\01_top_demanded_skill.sql))
* **Goal:** Find the top 10 most requested skills for Remote Data Engineer roles.
* **Insight:** SQL and Python are mandatory, while AWS leads as the preferred cloud provider.

### 2. Top Paying Skills ([02_top_paying_skills.sql](../1_EDA\02_top_high_pay_skill.sql))
* **Goal:** Focus on the highest median salaries across all postings.
* **Insight:** Specialized tools like **Terraform** ($184k) and **Kafka** ($145k) command a significant premium over general tools.

### 3. Optimal Skills ([03_optimal_skills.sql](../1_EDA\03_Optimal_skills.sql))
* **Goal:** Calculate an "Optimal Score" by multiplying the **Natural Log (LN) of Demand** by the **Median Salary**.
* **Insight:** This highlights the "Sweet Spot" skills—those that are both highly lucrative and widely sought after.

---

## 💻 SQL Skills Demonstrated
* **Complex Joins:** Managing many-to-many relationships via bridge tables.
* **Window Functions & Aggregates:** Using `COUNT()`, `MEDIAN()`, and `ROUND()`.
* **Data Cleaning:** Filtering for `NULL` values and specific string patterns using `LIKE` and `NOT LIKE`.
* **Subqueries & CTEs:** Breaking down complex logic into readable, modular Common Table Expressions.

---

## 📂 Repository Structure
```text
1_EDA/
├── 01_top_demanded_skills.sql    # Focus: Volume/Demand
├── 02_top_paying_skills.sql      # Focus: Compensation
├── 03_optimal_skills.sql         # Focus: Career ROI
└── README.md                     # Documentation