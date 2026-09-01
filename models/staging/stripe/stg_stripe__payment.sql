-- Repro #135149: source `stripe.payment` is empty in this sandbox,
-- so we inject matching successful payments for the seeded orders.
with renamed as (
    select * from (
        values
            (1001, 1, 'credit_card', 'success', 10.00),
            (1002, 2, 'credit_card', 'success', 20.00),
            (1003, 3, 'credit_card', 'success', 30.00),
            (1004, 4, 'credit_card', 'success', 40.00),
            (1005, 5, 'credit_card', 'success', 50.00),
            (1006, 6, 'credit_card', 'success', 60.00)
    ) as t(payment_id, order_id, payment_method, status, amount)
)

select
    payment_id,
    order_id,
    payment_method,
    status,
    amount,
    current_timestamp as created_at,
    current_timestamp as _batched_at
from renamed
