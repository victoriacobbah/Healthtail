CREATE OR REPLACE TABLE `healthtail-project-461613.healthtail_project.registration_clean` AS
SELECT
  patient_id,
  owner_id,
  INITCAP(TRIM(owner_name)) AS owner_name,
  pet_type,
  CASE
    WHEN breed IS NULL OR TRIM(breed) = '' THEN 'Unknown'
    ELSE INITCAP(TRIM(breed))
  END AS breed,
  UPPER(TRIM(patient_name)) AS patient_name,
  INITCAP(gender) AS gender,
  patient_age,
  date_registration,
  REGEXP_REPLACE(owner_phone, r'\D', '') AS owner_phone
FROM `healthtail-project-461613.healthtail_project.reg_cards`;



CREATE OR REPLACE TABLE `healthtail-project-461613.healthtail_project.med_audit` AS

WITH stock_in AS (
  SELECT
    FORMAT_DATE('%Y-%m-01', DATE(month_invoice)) AS month,
    med_name_cleaned AS med_name,
    SUM(packs) AS total_packs,
    SUM(total_price) AS total_value,
    'stock_in' AS stock_movement
  FROM `healthtail-project-461613.healthtail_project.invoices_cleaned`
  GROUP BY month, med_name
),
stock_out AS (
  SELECT
    FORMAT_DATE('%Y-%m-01', DATE(visit_datetime)) AS month,
    med_prescribed_cleaned AS med_name,
    SUM(med_dosage) AS total_packs,
    SUM(med_cost) AS total_value,
    'stock_out' AS stock_movement
  FROM `healthtail-project-461613.healthtail_project.visits_cleaned`
  GROUP BY month, med_name
)
SELECT * FROM stock_in
UNION ALL
SELECT * FROM stock_out;