SELECT 
orders_id
,date_date
,ROUND(SUM(revenue),2) AS revenue
,SUM(quantity) AS qty
,ROUND(SUM(margin),2) AS margin
FROM {{ ref('int_sales_margin') }} 
GROUP BY orders_id, date_date
ORDER BY date_date