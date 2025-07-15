select 
customer_id,
customer_name,
status_name,
city,
order_date
from {{ ref('inter_customer_orders') }} 
where status_name = 'Unshipped'