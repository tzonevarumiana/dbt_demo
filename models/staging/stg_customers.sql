with source as (
    select * from {{source('snowflake','raw_customers') }}
),
customers as (
select
    cust_id as cust_id,
    cust_name as name,
    cust_country as country
from source
)
 
select * from customers
