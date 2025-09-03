CREATE OR REPLACE TABLE `healthtail-project-461613.healthtail_project.visits_cleaned` AS
SELECT
  visit_id,
  patient_id,
  visit_datetime,
  INITCAP(TRIM(doctor)) AS doctor,

  CASE
    WHEN LOWER(TRIM(REPLACE(diagnosis, '’', ''''''))) IN ('allergy', 'allergies') THEN 'Allergy'
    WHEN LOWER(TRIM(REPLACE(diagnosis, '’', ''''''))) IN ('ear infection', 'ear infections') THEN 'Ear Infection'
    ELSE INITCAP(TRIM(REPLACE(diagnosis, '’', '''''')))
  END AS diagnosis_cleaned,

  CASE
    WHEN LOWER(TRIM(med_prescribed)) IN (
      'clavamox (amoxicillin + clavulanic)',
      'clavamox (amoxicillin/clavulanic)'
    ) THEN 'Clavamox (Amoxicillin + Clavulanic)'
    ELSE INITCAP(TRIM(med_prescribed))
  END AS med_prescribed_cleaned,

  med_dosage,
  med_cost
FROM `healthtail-project-461613.healthtail_project.visits`;