{{
  config(
    materialized='table'
  )
}}

SELECT 
    order_id
,   product_id
,   quantity as product_quantity
FROM {{ source('postgres', 'order_items') }}