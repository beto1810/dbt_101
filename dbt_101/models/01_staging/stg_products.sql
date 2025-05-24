with source_cte as (

    select * from {{ source('grocery_store','products') }}

),

cast_type as (

    select
        cast(id as integer) as product_id,
        cast(price as float) as product_price,
        cast(name as varchar) as product_name,
        cast(category as varchar) as product_category
    from source_cte

)

select *
from cast_type
