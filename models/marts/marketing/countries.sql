{{
    config(
        materialized='table',
    )
}}


with total_camps as (
select
    cust_id,
    sum(order_qty) as total_qty
from
    {{ ref('stg_campaigns') }}
group by
    cust_id
),


customers as (
    select
        cust_id,
        country
    from
        {{ ref('stg_customers') }}
),


orders_country as (
    select

        country,
        sum(total_camps.total_qty) as total_orders

    from total_camps


    left join customers on
            total_camps.cust_id = customers.cust_id

    group by customers.country

)


select * from orders_country
