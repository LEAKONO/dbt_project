-- stg_customers.sql
-- Clean and standardize raw customers

with source as (
    select * from {{ ref('raw_customers') }}
),

staged as (
    select
        customer_id,
        first_name,
        last_name,
        first_name || ' ' || last_name as full_name,
        lower(email)                    as email,
        cast(created_at as date)        as created_date,
        upper(country)                  as country
    from source
)

select * from staged