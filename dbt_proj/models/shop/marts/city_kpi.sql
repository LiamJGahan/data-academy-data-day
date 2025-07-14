select city,
count(customer_id),
sum(total_amount),
count(order_id)
from {{ ref('sales') }}
group by city