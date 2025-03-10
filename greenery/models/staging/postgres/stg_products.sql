{{
  config(
    materialized='table'
  )
}}

SELECT 
    product_id
,   name as product_name
,   price as product_price
,   inventory as quantity_available
FROM {{ source('postgres', 'products') }}