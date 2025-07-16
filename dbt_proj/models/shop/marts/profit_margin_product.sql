with inter_orders_product as ( 
    select * from {{ ref('inter_orders_product') }}
), 
joined_data as (
select
product_id,
product_name,
profit_margin
from inter_orders_product
group by product_id, product_name, profit_margin
order by profit_margin desc)

select * from joined_data