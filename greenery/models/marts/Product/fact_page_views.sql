{{
  config(
    materialized='table'
  )
}}

SELECT
    event_id
,   created_at_utc as page_view_created_at
,   session_id
,   user_id
,   page_url
,   product_id
from {{ ref('stg_events') }}
where event_type = 'page_view'