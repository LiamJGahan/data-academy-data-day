with inter_customer_orders as ( 
    select * from {{ ref('inter_customer_orders') }}
), 
joined_data as (
select city,
count(customer_id) as customer_count,
sum(total_amount) as total_orders
from inter_customer_orders
group by city
order by sum(total_amount) desc)

select * from joined_data