# 🛠️ Data Engineering & Analytics Portfolio
*Strategic hands-on projects focused on scalable data architecture and market intelligence.*

![Project Overview](../IMAGE/1_1_Project1_EDA.png)

## 📋 Overview
This repository contains a series of projects designed to demonstrate proficiency in modern data stack components like **DuckDB**, **MotherDuck**, and **SQL**. Each project focuses on a specific pillar of data engineering: Exploratory Data Analysis (EDA), Dimensional Modeling, and Schema Transformation.

---

## 🚀 Projects

### **01 | Market Intelligence EDA (./1_EDA/)
**Strategic Querying & Trend Analysis**
An advanced SQL-driven analysis of the global Data Engineering job market. This project identifies high-ROI technical skills by normalizing demand metrics against median compensation using mathematical transformations.
* **Core Skills:** Complex Multi-table Joins, Data Normalization (`LN()`), Statistical Aggregations (`MEDIAN`), and Market Gap Analysis.
* **Tech:** DuckDB, SQL, GitHub.
* **Status:** ✅ Complete | [View Scripts](./1_EDA/)

### **02 | Enterprise Warehouse & Mart Build (`2_WH_Mart_Build/`)**
**End-to-End ETL & Dimensional Modeling**
A full-scale ETL pipeline that transforms raw, unstructured CSV data into a production-ready **Star Schema**. This includes the creation of specialized **Data Marts** designed for executive-level reporting and rapid business intelligence.
* **Core Skills:** Star Schema Design, Fact/Dimension Mapping, ETL Pipeline Automation, and Data Mart Architecture.
* **Tech:** MotherDuck (Cloud Data Warehouse), Python, SQL.
* **Status:** 🛠️ In Progress

### **03 | Flat-File to Relational Transformation (`3_Flat_to_WH_Build/`)**
**Advanced Data Normalization & Schema Migration**
*Bonus Project:* A technical demonstration of migrating "flat" denormalized data into a high-performance **3NF (Third Normal Form)** or Star Schema. This highlights the ability to handle data integrity and complex transformations.
* **Core Skills:** Schema Evolution, Data Integrity Constraints, Normalization Logic, and Performance Tuning.
* **Tech:** DuckDB (OLAP Engine).
* **Status:** 🧪 Experimental

---

## 💻 Technical Skills Demonstrated
* **Data Modeling:** Star Schema, Snowflake Schema, 3NF Normalization.
* **Analytics:** Window Functions, CTEs, Logarithmic Scaling, and Trend Analysis.
* **Infrastructure:** Process-embedded OLAP (DuckDB) and Serverless Cloud Warehousing (MotherDuck).
* **Workflow:** Git Version Control, Branch Management, and Documentation.

---

## 📂 Repository Structure
```text
.
├── 1_EDA/                  # Phase 1: Market Analysis
├── 2_WH_Mart_Build/        # Phase 2: Warehouse Engineering
├── 3_Flat_to_WH_Build/     # Phase 3: Schema Migration
└── README.md               # Portfolio Documentation
