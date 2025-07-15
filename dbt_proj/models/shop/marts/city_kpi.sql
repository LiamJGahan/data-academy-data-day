select city,
count(customer_id),
sum(total_amount),
count(order_id)
from {{ ref('inter_customer_orders') }}
group by city
order by sum(total_amount) desc