CREATE OR REPLACE TABLE `healthtail-project-461613.healthtail_project.invoices_cleaned` AS
SELECT
  month_invoice,
  invoice_id,
  INITCAP(TRIM(supplier)) AS supplier,
  
  CASE
    WHEN LOWER(TRIM(med_name)) IN (
      'clavamox (amoxicillin + clavulanic)',
      'clavamox (amoxicillin/clavulanic)'
    ) THEN 'Clavamox (Amoxicillin + Clavulanic)'
    ELSE INITCAP(TRIM(med_name))
  END AS med_name_cleaned,

  ROUND(packs, 2) AS packs,
  price,
  ROUND(total_price, 2) AS total_price
FROM `healthtail-project-461613.healthtail_project.invoices`;