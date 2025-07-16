with inter_customer_orders as ( 
    select * from {{ ref('inter_customer_orders') }}
), 
joined_data as (
select 
customer_id,
customer_name,
status_name,
city,
order_id,
order_date
from inter_customer_orders
where status_name = 'Unshipped')

select * from joined_data