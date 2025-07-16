with inter_customer_orders as ( 
    select * from {{ ref('inter_customer_orders') }}
), 
joined_data as (
select email,
sum(customer_id) as customer_id_count
from inter_customer_orders
group by email)

select * from joined_data
