with 

<<<<<<< HEAD
from {{ source('jaffle_shop', 'orders') }}
=======
source as (

    select * from {{ source('jaffle_shop', 'orders_jdelgado') }}

),

renamed as (

    select
        id as order_id,
        user_id as customer_id,
        order_date,
        status as order_status,
        _etl_loaded_at

    from source

)

select * from renamed
>>>>>>> fc71a1a3c33f44f3c39bade3f06b729487ffd0c5
