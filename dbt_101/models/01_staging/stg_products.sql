
with source_cte as (

    select * from {{ source('grocery_store','products') }}

),

Cast_type as (

    select
        cast(id as integer) as id,
        cast(PRICE as float) as PRICE,
        cast(source_cte.NAME as VARCHAR) as `NAME`,
        cast(CATEGORY as VARCHAR) as CATEGORY
    from source_cte
)
select *
from Cast_type


