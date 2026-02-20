with 

source as (

    select * from {{ source('jaffle_shop', 'orders_snapshot2') }}

),

renamed as (

    select
        id,
        customer,
        ordered_at,
        store_id,
        subtotal,
        tax_paid,
        order_total,
        dbt_scd_id,
        dbt_updated_at,
        dbt_valid_from,
        dbt_valid_to

    from source

)

select * from renamed