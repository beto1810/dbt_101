with source_cte as (

    select * from {{ source('grocery_store', 'customers') }}

),

cast_type as (

    select
        cast(id as integer) as customer_id,
        cast(first_name as varchar) as customer_first_name,  -- Changed from first_name
        cast(last_name as varchar) as customer_last_name,    -- Changed from last_name
        cast(gender as varchar) as customer_gender,
        cast(email as varchar) as email_address,
        cast(date_of_birth as date) as birth_date
    from source_cte

)

select *
from cast_type
