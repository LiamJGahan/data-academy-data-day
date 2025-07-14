with 

source as (

    select * from {{ source('shop', 'product') }}

),

renamed as (

    select
        product_id,
        product_name,
        selling_price,
        cost_price

    from source

)

select * from renamed
