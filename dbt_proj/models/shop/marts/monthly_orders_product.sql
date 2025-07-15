select 
LEFT(order_date::text,7) as monthly_breakdown,
sum(total_amount) as total_amount_per_month,
sum(total_amount * profit_margin) as net_profit,
product_name
from {{ ref('inter_orders_product') }}
group by LEFT(order_date::text,7), product_name
order by monthly_breakdown