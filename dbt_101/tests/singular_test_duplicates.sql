WITH SOURCE_DATA AS (
    SELECT
        *,
        order_id || ORDER_ITEM_ID AS PK -- concatenation that is unique across records and produces no nulls
    FROM {{ ref('stg_order_items') }}
)

SELECT
    PK,
    COUNT(*) -- values greater than 1 would mean there are duplicate PKs
FROM SOURCE_DATA
GROUP BY 1
HAVING COUNT(*) > 1 -- should return no rows, causing the test to pass
