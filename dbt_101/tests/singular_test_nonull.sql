WITH SOURCE_DATA AS (
    SELECT
        *,
        order_id || ORDER_ITEM_ID AS PK -- concatenation that is unique across records and produces no nulls
    FROM {{ ref('stg_order_items') }}
)

SELECT
    PK,
    *
FROM SOURCE_DATA
WHERE PK IS NULL -- should return no rows, causing the test to pass- should return no rows, causing the test to pass
