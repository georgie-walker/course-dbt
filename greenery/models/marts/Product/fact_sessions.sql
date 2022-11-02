{{
  config(
    materialized='table'
  )
}}

{%- set event_types = get_event_types() -%}

select distinct
    session_id
,   user_id
,   min(order_id) over (partition by session_id, user_id) as order_id
,   min(created_at_utc) over (partition by session_id, user_id) as session_started_at
,   max(created_at_utc) over (partition by session_id, user_id) as session_ended_at
,   {%- for event_type in event_types %}
-- Event-level counts (i.e. how many events occurred)
    count(distinct case when event_type = '{{event_type}}' then event_id else null end) over (partition by session_id, user_id) as num_{{event_type}}_events
-- Session-level counts (i.e. did the event occur)    
,   max(case when event_type = '{{event_type}}' then 1 else 0 end) over (partition by session_id, user_id) as {{event_type}}_occurred
    {%- if not loop.last %},{% endif -%}
    {% endfor %}
from {{ ref('stg_events') }}
