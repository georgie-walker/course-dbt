{{
  config(
    materialized='view'
  )
}}

with products_orders as (
    select
        order_id
    ,   sum(product_quantity) as product_quantity
    from {{ ref('stg_order_items') }}
    group by 1
)

SELECT
    o.order_id
,   o.user_id
,   o.promo_id
,   o.address_id
,   o.created_at_utc as order_created_at
,   o.order_cost
,   o.shipping_cost
,   o.order_total as total_cost
,   coalesce(p.discount,0) as promo_discount
,   po.product_quantity
,   o.tracking_id
,   o.shipping_service
,   o.estimated_delivery_at_utc
,   o.delivered_at_utc
,   o.order_status
from {{ ref('stg_orders') }} o
left join {{ ref('stg_promos') }} p
    on o.promo_id = p.promo_id
left join products_orders po
    on o.order_id = po.order_id