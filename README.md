# 🐾 Clinipet – HealthTail Analysis Project

**Role:** Business Intelligence Analyst  
**Client:** HealthTail Veterinary Hospital  
**Organization:** Clinipet – IT & Analytics Solutions for Veterinary Clinics 


## Project Overview
HealthTail, a major veterinary hospital, partnered with Clinipet to automate their manual medication audit process and gain actionable insights into disease and medication trends across their patients.

As the BI Analyst, I led the data integration, cleaning, transformation, and visualisation efforts. This end-to-end project used BigQuery and Looker Studio to deliver an interactive dashboard that supports operational decisions for the clinic’s management team.

---

## 🚩 Project Goals

### 1. Automate medication audits
- Track medication purchases vs. usage over time
- Identify inefficiencies or losses due to overspending or stock-outs

### 2. Uncover diagnosis and disease patterns
- Identify top diagnoses by pet type and breed
- Understand cost implications of common conditions

---

## ✅ Final Deliverables

| Step | Description | Output |
|------|-------------|--------|
| **Step 1** | Clean and aggregate the raw data in BigQuery | [`Step 1 (1).sql`](./Step%201%20(1).sql) → `registration_clean`, `med_audit` tables |
| **Step 2** | Answer business questions using SQL | [`Step 2 (1).sql`](./Step%202%20(1).sql) |
| **Step 3** | Create an interactive Looker Studio dashboard | [`dashboard_link.txt`](3_dashboards/dashboard_link.txt) |
| **Step 4** | Present the final findings and insights | Live presentation (video not hosted in this repo) |

---

## 🔧 Tools & Technologies

- **BigQuery**: SQL transformations, table creation, business logic
- **Looker Studio**: Interactive data visualisation and report creation
- **Google Cloud Platform (GCP)**

---

## 🧪 Key Datasets

- `healthtail_reg_cards.csv`: Patient and owner info
- `visits.csv`: Diagnosis and medication usage logs
- `invoices.csv`: Monthly medication purchases from suppliers

---

## 🔍 Business Questions Answered

1. What med did we spend the most money on in total?
2. What med had the highest monthly total_value spent on patients? At what month?
3. What month had the highest packs of meds used?
4. What’s the average monthly usage of the highest-grossing medication?

✔️ Answers and SQL queries are included in [`Step 2.sql`](2_queries/Step%202.sql)

---

## 📈 Dashboard Overview

The dashboard includes two pages:

### 1. **Diagnosis Insights**
- Top diagnoses by pet type and breed
- Diagnosis profitability and age patterns
- Most common pet names and conditions

### 2. **Spend & Supply Insights**
- Medication procurement vs. usage trends (`med_audit`)
- Profitable vs. loss-making meds (`med_margin_summary`)
- Procurement by supplier (`procurement_summary`)

---

## 💡 Lessons Learned

- Learned how to build an end-to-end GCP analytics pipeline
- Gained hands-on experience with Looker Studio dashboard design
- Learned to troubleshoot schema mismatches and reconnect data sources
- Importance of reconnecting charts when schema updates cause Looker breakage

---

## 🔄 Future Enhancements

- Add live stock-on-hand tracking for accurate margin insights
- Group diagnosis categories into chronic vs. acute for better trends
- Automate pipeline refresh via Cloud Scheduler & Dataflow

---

## 📁 Repository Structure

```bash
├── README.md
├── 1_data/
│   └── schema_summary.md
├── 2_queries/
│   ├── Step 1.sql               # registration_clean & med_audit
│   ├── Step 2.sql               # Business questions
│   ├── diagnosis_unified.sql
│   ├── procurement_summary.sql
│   └── med_margin_summary.sql
├── 3_dashboards/
│   ├── dashboard_overview.png
│   └── dashboard_link.txt
└── imgs/
    └── (screenshots for README if needed)
```

---

## 👩‍💻 Author

**Victoria Cobbah** – BI & Marketing Analyst  
[LinkedIn](https://www.linkedin.com


