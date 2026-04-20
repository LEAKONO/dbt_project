-- fct_orders.sql
-- Order facts joined with customer info

with orders as (
    select * from {{ ref('stg_orders') }}
),

customers as (
    select * from {{ ref('stg_customers') }}
),

final as (
    select
        o.order_id,
        o.order_date,
        o.order_amount,
        o.order_status,
        c.customer_id,
        c.full_name    as customer_name,
        c.email        as customer_email,
        c.country      as customer_country
    from orders o
    left join customers c on o.customer_id = c.customer_id
)

select * from final