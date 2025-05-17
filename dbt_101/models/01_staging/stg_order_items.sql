
with source_cte as (

    select * from {{ source('grocery_store','order_items') }}

),

Cast_type as (

    select
        cast(order_id as integer) as order_id,
        cast(ORDER_ITEM_ID as integer) as ORDER_ITEM_ID,
        cast(PRODUCT_ID as integer) as PRODUCT_ID,
        cast(QUANTITY as integer) as QUANTITY
    from source_cte
)

select *
from Cast_type


