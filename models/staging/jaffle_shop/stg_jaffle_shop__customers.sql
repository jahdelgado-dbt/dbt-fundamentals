with 

<<<<<<< HEAD
from {{ source('jaffle_shop', 'customers') }}
=======
source as (

    select * from {{ source('jaffle_shop', 'customers') }}

),

renamed as (

    select
        id as customer_id,
        first_name,
        last_name,
        mobile_number

    from source

)

select * from renamed
>>>>>>> fc71a1a3c33f44f3c39bade3f06b729487ffd0c5
