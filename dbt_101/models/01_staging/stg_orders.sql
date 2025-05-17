
with source_cte as (

    select * from {{ source('grocery_store','orders') }}

),

Cast_type as (

    select
        cast(id as integer) as id,
        cast(source_cte.DATE as DATE) as DATE,
        cast(CUSTOMER_ID as integer) as CUSTOMER_ID,
        cast(source_cte.STATUS as VARCHAR) as STATUS
    from source_cte
)

select *
from Cast_type


