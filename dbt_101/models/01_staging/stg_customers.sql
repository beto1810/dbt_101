
with source_cte as (

    select * from {{ source('grocery_store','customers') }}

),

Cast_type as (

    select
        cast(id as integer) as id,
        cast(first_name as varchar) as first_name,
        cast(last_name as varchar) as last_name,
        cast(gender as varchar) as gender,
        cast(email as varchar) as email,
        cast(date_of_birth as date) as date_of_birth
    from source_cte
)

select *
from Cast_type


