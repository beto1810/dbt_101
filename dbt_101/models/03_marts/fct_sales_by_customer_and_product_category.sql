{% set product_categories = dbt_utils.default__get_column_values(table=ref('stg_products'), column='category') %}


SELECT 
    customers.id AS customer_id,
    {% for category in product_categories %}
        SUM(CASE WHEN products.category = '{{ category }}' THEN order_items.quantity ELSE 0 END) AS {{ category | replace(" ", "_") | lower }}_units_sold
        {% if not loop.last %},{% endif %}
    {% endfor %},

    {% for category in product_categories %}
        SUM(CASE WHEN products.category = '{{ category }}' THEN order_items.quantity * products.price ELSE 0 END) AS AMOUNT_SPENT_{{ category | replace(" ", "_") | lower }}
        {% if not loop.last %},{% endif %}
    {% endfor %}
FROM {{ ref('stg_orders') }} AS sales
LEFT JOIN {{ ref('stg_order_items') }} AS order_items
    ON sales.id = order_items.order_id
LEFT JOIN {{ ref('stg_products') }} AS products
    ON order_items.product_id = products.id
LEFT JOIN {{ ref('stg_customers') }} AS customers
    ON sales.customer_id = customers.id
GROUP BY customers.id
