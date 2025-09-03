# 🐾 Clinipet – HealthTail Analysis Project

**Role:** Business Intelligence Analyst  
**Client:** HealthTail Veterinary Hospital  
**Organization:** Clinipet – IT & Analytics Solutions for Veterinary Clinics and Pet Hotels  


---

## 📘 Project Overview

HealthTail, one of the largest veterinary hospitals in the city, partnered with Clinipet to modernize their manual medication auditing process and gain actionable insights into patient diagnoses and medication spend.

This end-to-end analytics solution was developed using **Google BigQuery** for SQL-based ETL and **Looker Studio** for dashboarding.

As the BI Analyst on this project, I cleaned and transformed raw .csv data, created intermediate and final data models in BigQuery, and built an interactive dashboard to support data-driven decisions across the hospital.

---

## 🎯 Project Goals

1. **Audit Medication Purchases and Expenses**  
   - Automate medication tracking and procurement monitoring.  
   - Identify profit/loss per medication to guide cost-saving opportunities.

2. **Monitor Diagnoses and Disease Trends**  
   - Segment diagnoses by pet type, breed, and age.  
   - Support inventory and staffing plans with data-backed insights.

---

## ✅ Deliverables

- [x] Upload & structure raw `.csv` files in BigQuery  
- [x] Clean and transform raw data  
- [x] Build intermediate and summary tables (e.g., `med_margin_summary`)  
- [x] Write SQL to answer client research questions  
- [x] Deliver an interactive dashboard in Looker Studio  
- [x] Present findings (recorded video presentation)

---

## 🛠️ Tools & Skills Used

- **Google Cloud Platform**
  - BigQuery (data cleaning, joins, aggregations, CTEs)
  - Looker Studio (filters, drilldowns, dual-axis charts)
- **SQL Skills**
  - Data wrangling, type conversions, string cleaning
  - Aggregated views, UNIONs, profit calculations
- **Soft Skills**
  - Dashboard storytelling  
  - Troubleshooting region mismatches, schema issues

---

## 🧪 Research Questions & SQL Answers 

```sql
--- 1. What med did we spend the most money on in total?
SELECT 
  med_name,
  SUM(total_value) AS total_spent
FROM `healthtail-project-461613.healthtail_project.med_audit`
WHERE stock_movement = 'stock_in'
GROUP BY med_name
ORDER BY total_spent DESC
LIMIT 1;
-- Answer: Vetmedin (Pimobendan), 1035780.0

--- 2. What med had the highest monthly total_value spent on patients? At what month?
SELECT 
  med_name,
  month,
  SUM(total_value) AS monthly_total
FROM `healthtail-project-461613.healthtail_project.med_audit`
WHERE stock_movement = 'stock_out'
GROUP BY med_name, month
ORDER BY monthly_total DESC
LIMIT 1;
-- Answer: Palladia (Toceranib Phosphate), month November 2024, monthly total 50000.0

--- 3. What month was the highest in packs of meds spent in vet clinic?
SELECT 
  month,
  SUM(total_packs) AS total_packs_used
FROM `healthtail-project-461613.healthtail_project.med_audit`
WHERE stock_movement = 'stock_out'
GROUP BY month
ORDER BY total_packs_used DESC
LIMIT 1;
-- Answer: Month December 2024, 3861.62000000 total packs used

--- 4. What’s an average monthly spend in packs of the med that generated the most revenue?
WITH top_med AS (
  SELECT 
    med_name
  FROM `healthtail-project-461613.healthtail_project.med_audit`
  WHERE stock_movement = 'stock_out'
  GROUP BY med_name
  ORDER BY SUM(total_value) DESC
  LIMIT 1
)
SELECT 
  med_name,
  AVG(monthly_packs) AS avg_monthly_packs
FROM (
  SELECT 
    med_name,
    month,
    SUM(total_packs) AS monthly_packs
  FROM `healthtail-project-461613.healthtail_project.med_audit`
  WHERE stock_movement = 'stock_out'
  GROUP BY med_name, month
)
WHERE med_name = (SELECT med_name FROM top_med)
GROUP BY med_name;
-- Answer: Palladia (Toceranib Phosphate), average monthly spend in packs 52.54
```

---

## 📊 Dashboard

The final dashboard was built in **Looker Studio** and includes:

- Diagnosis trends by **pet type**, **breed**, and **age**
- Medication **profit margins**, **usage vs. procurement**
- Profitability overview of each medication
- Donut chart of profitable vs. loss-making medications
- Filters for diagnosis, breed, medication name, and more

📎 [View Interactive Dashboard](3_dashboards/dashboard_link.txt)  
📷 Preview screenshot:  
![Dashboard Overview](3_dashboards/dashboard_overview.png)

---

## 🧠 Key Learnings

- Learned how to navigate the full GCP data workflow: from upload to ETL to dashboard
- Gained practical experience in **Looker Studio**, including filtering, interactivity, and drilldowns
- Troubleshot issues like region mismatch and missing schema fields
- Realised the importance of **centralizing calculations in BigQuery** to avoid broken charts in Looker

---

## 💡 Future Enhancements

- Add stock-on-hand for improved margin accuracy  
- Tag diagnoses as chronic vs acute for trend analysis  
- Automate pipeline refresh via scheduled queries or data loaders  

---

## 📁 Repository Structure

```bash
├── README.md
├── 1_data/
│   └── schema_summary.md
├── 2_queries/
│   ├── clean_reg_cards.sql
│   ├── clean_visits.sql
│   ├── clean_invoices.sql
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

## 👤 Author

**Victoria Cobbah**  
BI & Marketing Analyst  
[LinkedIn →](https://www.linkedin.com/in/victoriacobbah/)

