{{
  config(
    materialized='table'
  )
}}

SELECT
    p.product_id
,   p.product_name
,   p.product_price
,   p.quantity_available
,   count(distinct oi.order_id) as distinct_orders
,   max(op.order_created_at) as latest_order_at
from {{ ref('stg_products') }} p
left join {{ ref('stg_order_items')}} oi
    on p.product_id = oi.product_id
left join {{ ref('int_orders_promos')}} op
    on oi.order_id = op.order_id
group by 1,2,3,4