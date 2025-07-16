with inter_orders_product as ( 
    select * from {{ ref('inter_orders_product') }}
), 
joined_data as (
select 
LEFT(order_date::text,7) as monthly_breakdown,
sum(total_amount) as total_amount_per_month,
sum(total_amount * profit_margin) as net_profit,
product_name
from inter_orders_product
group by LEFT(order_date::text,7), product_name
order by monthly_breakdown)

select * from joined_data