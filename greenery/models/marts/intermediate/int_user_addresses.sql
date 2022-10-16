{{
  config(
    materialized='view'
  )
}}

SELECT 
    u.user_id
,   u.first_name
,   u.last_name
,   u.email
,   u.phone_number
,   a.address
,   a.zipcode
,   a.state
,   u.created_at_utc as user_created_at
,   u.updated_at_utc as user_updated_at
from {{ ref('stg_users') }} u
left join {{ ref('stg_addresses') }} a
    on u.address_id = a.address_id