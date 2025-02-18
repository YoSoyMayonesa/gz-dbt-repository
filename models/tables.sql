
SELECT 
    date_date,
    orders_id,
    pdt_id AS product_id,
    revenue AS total_revenue,
    quantity AS order_quantity
FROM {{source('raw', 'sales')}};

SELECT 
    products_id as product_id,
    purchSE_PRICE as purchase_price,
FROM {{source('raw', 'product')}};

SELECT 
    *,
FROM {{source('raw', 'ship')}};

with

 source as (

     select * from {{ source('raw', 'sales') }}

 ),

 renamed as (

     select
         date_date,
         orders_id,
         pdt_id,
         revenue,
         quantity

     from source

 )

 select * from renamed