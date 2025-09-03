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