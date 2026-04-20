with source as(
    select * from {{ref("raw_orders")}}
),
staged as(
    select 
       order_id,
       customer_id,
       cast(order_date as date) as order_date,
       amount as order_amount,
       lower(status) as order_status
 from source
)
SELECT * FROM staged