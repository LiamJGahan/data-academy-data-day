with orders as ( 
    select * from {{ ref('stg_orders') }}
), 
customer as (
    select * from {{ ref('stg_customer') }}
),
order_line as (
    select * from {{ ref('stg_order_line') }}
),
order_status as (
    select * from {{ ref('stg_order_status') }}
),
product as (
    select * from {{ ref('stg_product') }}
),
joined_data as ( 
    select 
    c.customer_id,
    c.city,
    o.order_date,
    o.total_amount,
    o.order_id
    from 
    customer c
    left join orders o
    on c.customer_id = o.customer_id
)

select * from joined_data