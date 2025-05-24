{% set product_categories = dbt_utils.default__get_column_values(table=ref('stg_products'), column='product_category') %}

select 
    customers.customer_id,
    {% for category in product_categories %}
        sum(case when products.product_category = '{{ category }}' then order_items.quantity else 0 end) as {{ category | replace(" ", "_") | lower }}_units_sold
        {% if not loop.last %},{% endif %}
    {% endfor %},

    {% for category in product_categories %}
        sum(case when products.product_category = '{{ category }}' then order_items.quantity * products.product_price else 0 end) as amount_spent_{{ category | replace(" ", "_") | lower }}
        {% if not loop.last %},{% endif %}
    {% endfor %}
from {{ ref('stg_orders') }} as orders
left join {{ ref('stg_order_items') }} as order_items
    on orders.order_id = order_items.order_id
left join {{ ref('stg_products') }} as products
    on order_items.product_id = products.product_id
left join {{ ref('stg_customers') }} as customers
    on orders.customer_id = customers.customer_id
group by 1