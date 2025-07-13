with 

source as (

    select * from {{ source('shop', 'customer') }}

),

renamed as (

    select
        customer_id,
        customer_name,
        email,
        phone_number,
        address_line_1,
        city

    from source

)

select * from renamed
