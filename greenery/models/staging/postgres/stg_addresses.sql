{{
  config(
    materialized='table'
  )
}}

SELECT 
    address_id
,   address
,   replace(zipcode,',','') as zipcode
,   state
,   country
FROM {{ source('postgres', 'addresses') }}