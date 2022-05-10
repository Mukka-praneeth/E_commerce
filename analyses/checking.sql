with customer as(
    select *
    from {{ ref('Customersdetails') }}
)

select * from customer