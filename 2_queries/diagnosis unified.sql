CREATE OR REPLACE TABLE `healthtail-project-461613.healthtail_project.diagnosis_unified` AS
SELECT
  v.patient_id,
  v.visit_datetime,
  EXTRACT(YEAR FROM v.visit_datetime) AS visit_year,
  FORMAT_DATE('%Y-%m', v.visit_datetime) AS visit_month,
  v.diagnosis_cleaned AS diagnosis,
  v.med_prescribed_cleaned AS medication,
  v.med_dosage,
  v.med_cost,
  r.pet_type,
  r.breed,
  r.patient_age,
  r.patient_name,  
  v.med_dosage * i.price AS procurement_cost_estimate,
  i.price AS unit_price
FROM `healthtail-project-461613.healthtail_project.visits_cleaned` v
LEFT JOIN `healthtail-project-461613.healthtail_project.registration_clean` r
  ON v.patient_id = r.patient_id
LEFT JOIN `healthtail-project-461613.healthtail_project.invoices_cleaned` i
  ON v.med_prescribed_cleaned = i.med_name_cleaned
WHERE v.diagnosis_cleaned IS NOT NULL;