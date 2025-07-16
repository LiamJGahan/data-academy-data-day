with inter_orders_product as ( 
    select * from {{ ref('inter_orders_product') }}
), 
joined_data as (
select
product_id,
product_name,
sum(profit_margin) as net_profit
from inter_orders_product
group by product_id, product_name
having sum(profit_margin) is not NULL
order by net_profit desc)

select * from joined_data