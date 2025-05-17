
SELECT c.id as CUSTOMER_ID,
        concat(c.FIRST_NAME, ' ', c.LAST_NAME) AS CUSTOMER_NAME,
        COUNT(o.id) AS TOTAL_ORDERS,
        COUNT(o.id) * SUM(oi.QUANTITY) AS TOTAL_QUANTITY,
        min(o.DATE) AS FIRST_ORDER_DATE,        
        max(o.DATE) AS LAST_ORDER_DATE
FROM   {{ ref('stg_orders') }}  o
LEFT JOIN  {{ ref('stg_order_items') }} oi ON o.id = oi.order_id
LEFT JOIN {{ ref('stg_customers') }} c  ON c.ID = o.CUSTOMER_ID
WHERE oi.order_item_id IS NOT NULL
        and o.STATUS != 'cancelled'
GROUP BY c.id, c.FIRST_NAME, c.LAST_NAME
