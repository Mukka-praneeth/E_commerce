{{
    config({
        "as_columnstore": false, 
        "materialized": 'table',
    })
}}

with custmerDetials as(
    select * from stg_customer_data
),
customer as(
    select dimOrders.customer_id,
           customer_unique_id,
           customer_state,
           order_id,
            dimOrders.product_id,
            seller_id,
            order_status,
            price
    from dimOrders
    left join custmerDetials
    on dimOrders.customer_id = custmerDetials.customer_id
)

select * from customer