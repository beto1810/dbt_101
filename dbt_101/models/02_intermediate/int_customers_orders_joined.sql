select
    c.customer_id ,
    concat(c.customer_first_name, ' ', c.customer_last_name) as customer_name,
    count(o.order_id) as number_of_orders,
    sum(oi.quantity * p.product_price) as total_amount_spent_usd,
    sum(oi.quantity * p.product_price) as total_spent,
    min(o.order_date) as first_order_date,
    max(o.order_date) as last_order_date
from {{ ref('stg_orders') }} as o
left join {{ ref('stg_order_items') }} as oi
    on o.order_id = oi.order_id
left join {{ ref('stg_customers') }} as c
    on o.customer_id = c.customer_id
left join {{ ref('stg_products') }} as p
    on oi.product_id = p.product_id
where
    oi.order_item_id is not null
    and o.order_status != 'cancelled'
group by
    1, 2
