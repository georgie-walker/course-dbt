{{
  config(
    materialized='table'
  )
}}

{%- set event_types = get_event_types() -%}

select distinct
    session_id
,   product_id
,   {%- for event_type in event_types %}
    max(case when event_type = '{{event_type}}' then 1 else 0 end) over (partition by session_id, product_id) as product_{{event_type}}
    {%- if not loop.last %},{% endif -%}
    {% endfor %}
,   case when max(order_id) over (partition by session_id) is not null then 1 else 0 end as session_converted
from {{ ref('stg_events') }}
