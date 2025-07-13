with 

source as (

    select * from {{ source('shop', 'orders') }}

),

renamed as (

    select
        order_id,
        customer_id,
        order_date,
        total_amount,
        order_status_id

    from source

)

select * from renamed
