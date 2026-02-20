with 

source as (

    select * from {{ source('jaffle_shop', 'customers_training') }}

),

renamed as (

    select
        id,
        name

    from source

)

select * from renamed