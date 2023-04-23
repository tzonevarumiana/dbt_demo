with source as (
    select * from {{source('snowflake','raw_campaigns') }}
),


campaigns as (
select
    campaing_id as campkey,
    cust_id as cust_id,
    campaign_name as camp_name,
    order_qty as order_qty,
    'New value' as new_col
from source
 
)
 
select * from campaigns