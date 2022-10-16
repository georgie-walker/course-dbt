{{
  config(
    materialized='table'
  )
}}

SELECT
    user_id
,   count(order_id) as lifetime_order_count
,   sum(order_cost) as lifetime_spend_exc_shipping
,   sum(total_cost) as lifetime_spend_inc_shipping
,   sum(product_quantity) as lifetime_items_purchased
,   max(order_created_at) as latest_order_at
,   min(order_created_at) as earliest_order_at  
from {{ ref('fact_orders') }}
group by 1
