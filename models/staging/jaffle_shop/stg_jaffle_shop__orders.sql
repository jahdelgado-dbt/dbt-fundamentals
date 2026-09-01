-- Repro #135149: source `jaffle_shop.orders_jdelgado` is empty in this sandbox,
-- so we inject a few rows here to give fct_orders (and the SL cache) real data.
with renamed as (
    select * from (
        values
            (1, 101, cast('2024-01-01' as date), 'completed'),
            (2, 102, cast('2024-01-01' as date), 'completed'),
            (3, 103, cast('2024-01-02' as date), 'returned'),
            (4, 104, cast('2024-01-02' as date), 'completed'),
            (5, 105, cast('2024-01-03' as date), 'returned'),
            (6, 106, cast('2024-01-03' as date), 'completed')
    ) as t(order_id, customer_id, order_date, order_status)
)

select
    order_id,
    customer_id,
    order_date,
    order_status,
    current_timestamp as _etl_loaded_at
from renamed
