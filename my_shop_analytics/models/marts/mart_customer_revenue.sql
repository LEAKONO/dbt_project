-- mart_customer_revenue.sql
-- Revenue summary per customer

with orders as (
    select * from {{ ref('fct_orders') }}
    where order_status = 'completed'
),

customer_revenue as (
    select
        customer_id,
        customer_name,
        customer_email,
        customer_country,
        count(order_id)          as total_orders,
        sum(order_amount)        as total_revenue,
        min(order_date)          as first_order_date,
        max(order_date)          as last_order_date
    from orders
    group by 1,2,3,4
)

select * from customer_revenue