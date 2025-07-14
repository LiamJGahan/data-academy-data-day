with 

source as (

    select * from {{ source('shop', 'order_status') }}

),

renamed as (

    select
        order_status_id,
        status_name

    from source

)

select * from renamed
