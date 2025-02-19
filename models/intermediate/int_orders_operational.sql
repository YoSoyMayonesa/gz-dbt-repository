SELECT
*,
round (margin+shipping_fee+logcost-ship_cost,2) as operational_margin
from {{ ref('int_orders_margin') }} as operation
join {{ ref('stg_raw__ship') }} as ship
using (orders_id)