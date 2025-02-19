SELECT
order_date as date_date,
round (count (orders_id),2) as nb_transactions,
round (sum(revenue),2) as revenue,
round (avg(quantity),2) as average_basket,
round (sum (margin),2) as margin,
round (sum (operational_margin),2) as operational_margin
from {{ ref('int_orders_operational') }}
group by order_date