select 
LEFT(order_date::text,7) as monthly_breakdown,
sum(total_amount) as total_amount_per_month
from {{ ref('inter_orders_product') }}
group by LEFT(order_date::text,7)
order by left(order_date::text,7)