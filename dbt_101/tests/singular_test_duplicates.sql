with source_data as (
    select
        *,
        concat(order_id, order_item_id) as composite_key  -- unique identifier across records
    from {{ ref('stg_order_items') }}
)

select
    composite_key,
    count(*) as record_count  -- count of duplicate records
from source_data
group by 1
having count(*) > 1  -- should return no rows if test passes
