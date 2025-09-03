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

--Answer: Palladia (Toceranib Phosphate), month November 2024, monthly total 50000.0



--- 3. What month was the highest in packs of meds spent in vet clinic?
SELECT 
  month,
  SUM(total_packs) AS total_packs_used
FROM `healthtail-project-461613.healthtail_project.med_audit`
WHERE stock_movement = 'stock_out'
GROUP BY month
ORDER BY total_packs_used DESC
LIMIT 1;

--Answer:  Month December 2024, 3861.62000000 Total packs used

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

--Answer: Palladia (Toceranib Phosphate), average monthly spend in packs 52.54166666666


