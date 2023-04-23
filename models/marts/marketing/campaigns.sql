{{
    config(
        materialized='view',
    )
}}


with total_camps as (
select
    campkey,
    sum(order_qty) as total_qty
from
    {{ ref('stg_campaigns') }}
group by
    campkey
)


select * from total_camps
