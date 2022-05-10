{{
    config({
        "as_columnstore": false, 
        "materialized": 'table',
    })
}}

with orders as(
    select order_id,
            customer_id,
            order_status
    from stg_order_data
),
orders_item as(
    select orders.order_id,
            customer_id,
            product_id,
            seller_id,
            order_status,
            price
    from stg_order_items 
    right join orders
    on stg_order_items.order_id = orders.order_id
)

select * from orders_item