Project answers: week 1.

# How many users do we have?
130 users.

# On average, how many orders do we receive per hour?
15 orders per hour (median, rounded).

# On average, how long does an order take from being placed to being delivered?
93 hours (median, rounded).

# How many users have only made one purchase? Two purchases? Three+ purchases?
1: 25 users
2: 28 users
3+: 71 users

# On average, how many unique sessions do we have per hour?
39 unique sessions (median, rounded).


# Queries

-- How many users do we have?
select 
    count(user_id) as users
from dev_db.dbt_georginawalker.stg_users;


-- On average, how many orders do we receive per hour?
with orders_hour as (
    select 
        hour(created_at) as created_hour
    ,   count(order_id) as orders
    from dev_db.dbt_georginawalker.stg_orders
    group by 1
)

select 
    avg(orders) 
from orders_hour;


-- On average, how long does an order take from being placed to being delivered?
select 
    avg(timediff(hour,created_at, delivered_at))
from dev_db.dbt_georginawalker.stg_orders;


-- How many users have only made one purchase? Two purchases? Three+ purchases?
with numb_orders as (
    select
        user_id
    ,   count(order_id) as orders
    from dev_db.dbt_georginawalker.stg_orders
    group by 1
)

select 
    case 
        when orders < 3 then orders::varchar
        else '3+'
    end as number_orders
,   count(user_id) as users
from numb_orders
group by 1
order by 1
; 


-- On average, how many unique sessions do we have per hour?
with sessions_hour as (
    select 
        hour(created_at) as created_hour
    ,   count(distinct session_id) as sessions
    from dev_db.dbt_georginawalker.stg_events
    group by 1
)

select 
    avg(sessions) 
from sessions_hour;