CREATE OR REPLACE TABLE `healthtail-project-461613.healthtail_project.med_margin_summary` AS
WITH stock_out AS (
  SELECT 
    med_name,
    SUM(total_value) AS revenue
  FROM `healthtail-project-461613.healthtail_project.med_audit`
  WHERE stock_movement = 'stock_out'
  GROUP BY med_name
),
stock_in AS (
  SELECT 
    med_name,
    SUM(total_value) AS cost
  FROM `healthtail-project-461613.healthtail_project.med_audit`
  WHERE stock_movement = 'stock_in'
  GROUP BY med_name
)
SELECT 
  so.med_name,
  revenue,
  cost,
  ROUND(revenue - cost, 2) AS profit,
  ROUND(SAFE_DIVIDE(revenue - cost, cost) * 100, 2) AS profit_margin_pct
FROM stock_out so
JOIN stock_in si
  ON so.med_name = si.med_name
ORDER BY profit DESC;