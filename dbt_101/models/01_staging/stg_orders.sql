with source_cte as (

    select * from {{ source('grocery_store','orders') }}

),

cast_type as (

    select
        cast(id as integer) as order_id,
        cast(date as date) as order_date,
        cast(customer_id as integer) as customer_id,
        cast(status as varchar) as order_status
    from source_cte

)

select *
from cast_type
