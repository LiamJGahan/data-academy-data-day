select
product_id,
product_name,
price_margin
from {{ ref('inter_orders_product') }}
group by product_id, product_name, profit_margin
order by price_margin desc