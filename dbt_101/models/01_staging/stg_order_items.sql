with source_cte as (

    select * from {{ source('grocery_store','order_items') }}

),

cast_type as (

    select
        cast(order_id as integer) as order_id,
        cast(order_item_id as integer) as order_item_id,
        cast(product_id as integer) as product_id,
        cast(quantity as integer) as quantity
    from source_cte
)

select *
from cast_type
