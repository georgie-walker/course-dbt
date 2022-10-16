{{
  config(
    materialized='table'
  )
}}

select 
    session_id
,   user_id
,   min(order_id) as order_id
,   min(created_at_utc) as session_started_at
,   max(created_at_utc) as session_ended_at
from {{ ref('stg_events') }}
group by 1,2