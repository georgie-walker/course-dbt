{{
  config(
    materialized='table'
  )
}}

SELECT
    user_id
,   first_name
,   last_name
,   email
,   phone_number
,   address
,   zipcode
,   state
,   user_created_at
,   user_updated_at
from {{ ref('int_user_addresses') }}