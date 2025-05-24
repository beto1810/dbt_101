select
    c.id as customer_id,
    concat(c.first_name, ' ', c.last_name) as customer_name,
    count(o.id) as number_of_orders,
    sum(oi.quantity * p.price) as total_amount_spent_usd,
    sum(oi.quantity * p.price) as total_spent,
    min(o.date) as first_order_date,
    max(o.date) as last_order_date
from {{ ref('stg_orders') }} as o
left join {{ ref('stg_order_items') }} as oi
    on o.id = oi.order_id
left join {{ ref('stg_customers') }} as c
    on o.customer_id = c.id
left join {{ ref('stg_products') }} as p
    on oi.product_id = p.id
where
    oi.order_item_id is not null
    and o.status != 'cancelled'
group by
    1, 2
