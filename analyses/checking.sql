with customer as(
    select *
    from {{ ref('Customersdetails') }}
),
product as(
    select *
    from {{ ref('stg_products') }}
),
details as (select customer_id,
       order_status,
       price,
       product_category_name
       from customer left join product
       on customer.product_id = product.product_id),
translated as (
    select customer_id,
       order_status,
       price,
       product_category_name_english
    from {{ ref('product_category_name_translation') }}
    right join details
    on details.product_category_name = {{ ref('product_category_name_translation') }}.product_category_name
)

select  * from translated