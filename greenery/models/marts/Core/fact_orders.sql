{{
  config(
    materialized='table'
  )
}}

SELECT
    order_id
,   user_id
,   promo_id
,   address_id
,   order_created_at
,   order_cost
,   shipping_cost
,   total_cost
,   promo_discount
,   product_quantity
,   tracking_id
,   shipping_service
,   estimated_delivery_at_utc
,   delivered_at_utc
,   datediff(d,order_created_at,delivered_at_utc) as days_to_deliver
,   order_status
from {{ ref('int_orders_promos') }}