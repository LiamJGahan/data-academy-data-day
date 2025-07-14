with 

source as (

    select * from {{ source('shop', 'order_line') }}

),

renamed as (

    select
        order_line_id,
        order_id,
        product_id,
        quantity

    from source

)

select * from renamed
