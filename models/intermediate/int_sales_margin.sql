SELECT 
s.orders_id
,s.product_id
,s.date_date
,s.revenue
,s.quantity
,p.purchase_price
,s.quantity * p.purchase_price AS purchase_cost
,s.revenue - (s.quantity * p.purchase_price) AS margin
FROM {{ ref('stg_gz_raw_data__sales') }} AS s
LEFT JOIN {{ ref('stg_gz_raw_data__product') }} AS p
ON s.product_id = p.products_id