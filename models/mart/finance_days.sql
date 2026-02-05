
WITH temp AS (
   SELECT
     date_date
     ,COUNT(DISTINCT orders_id) AS Total_transactions
     ,ROUND(SUM(revenue),2) AS revenue
     ,ROUND(SUM(margin),2) AS margin
     ,ROUND(SUM(operational_margin),2) AS operational_margin
     ,ROUND(SUM(purchase_cost),2) AS purchase_cost
     ,ROUND(SUM(shipping_fee),2) AS shipping_fee
     ,ROUND(SUM(log_cost),2) AS log_cost
     ,ROUND(SUM(ship_cost),2) AS ship_cost
     ,SUM(qty) AS quantity
 FROM {{ref("int_orders_operational")}}
 GROUP BY  date_date
 )

 SELECT
     date_date
     , revenue
     , margin
     , operational_margin
     , purchase_cost
     , shipping_fee
     , log_cost
     , ship_cost
     , quantity
     , ROUND(revenue/Total_transactions) AS average_basket
 FROM temp
 ORDER BY  date_date DESC