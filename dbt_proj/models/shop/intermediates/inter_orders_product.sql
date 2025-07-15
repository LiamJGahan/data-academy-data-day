with orders as ( 
    select * from {{ ref('stg_orders') }}
), 
order_line as (
    select * from {{ ref('stg_order_line') }}
),
product as (
    select * from {{ ref('stg_product') }}
),
joined_data as ( 
    select 
    p.product_id,
    p.product_name,
    o.order_date,
    o.total_amount,
    o.order_id,
    p.selling_price,
    p.cost_price,
    (p.selling_price - p.cost_price) as profit_margin
    from orders as o
    join order_line as l
    on o.order_id = l.order_id
    join product as p
    on l.product_id = p.product_id
)

select * from joined_data