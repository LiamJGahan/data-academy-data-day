with orders as ( 
    select * from {{ ref('stg_orders') }}
), 
customer as (
    select * from {{ ref('stg_customer') }}
),
order_status as (
    select * from {{ ref('stg_order_status') }}
),
joined_data as ( 
    select 
    c.customer_id,
    c.customer_name,
    c.city,
    o.order_date,
    o.total_amount,
    o.order_id,
    s.status_name
    from customer as c
    join orders as o
    on c.customer_id = o.customer_id
    join order_status as s
    on o.order_status_id = s.order_status_id
)

select * from joined_data