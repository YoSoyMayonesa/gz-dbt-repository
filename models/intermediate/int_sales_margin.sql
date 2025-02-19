with calcualtion1 as (SELECT
    sales.date_date,
    sales.orders_id,
    sales.products_id, 
    sales.revenue,
    sales.quantity,
    product.purchase_price,
    sales.quantity * product.purchase_price AS purchase_cost
FROM {{ ref('stg_raw__sales') }} AS sales 
JOIN {{ ref('stg_raw__product') }} AS product  
ON sales.products_id = product.products_id
GROUP BY 
    sales.date_date, 
    sales.orders_id, 
    sales.products_id,
    sales.revenue, 
    sales.quantity, 
    product.purchase_price)
select 
*,
round(purchase_cost * revenue,2) as margin
from calcualtion1


