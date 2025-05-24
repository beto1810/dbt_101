with source_data as (
    select
        order_id,
        order_item_id,
        quantity,
        product_id,
        concat(order_id, order_item_id) as composite_key
    from {{ ref('stg_order_items') }}
)

select
    composite_key,
    order_id,
    order_item_id,
    quantity,
    product_id
from source_data
where composite_key is null  -- should return no rows if test passes
