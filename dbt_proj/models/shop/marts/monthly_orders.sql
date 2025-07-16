with inter_orders_product as ( 
    select * from {{ ref('inter_orders_product') }}
), 
joined_data as (
select 
LEFT(order_date::text,7) as monthly_breakdown,
sum(total_amount) as total_orders_per_month
from inter_orders_product
group by LEFT(order_date::text,7)
order by left(order_date::text,7))

select * from joined_data
