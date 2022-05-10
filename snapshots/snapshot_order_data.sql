{% snapshot order_snapshot %}

{{ config({"as_columnstore": false,})
    }}
{{
    config(
         
        target_database='E_Commerce',
        target_schema='dbo',
        unique_key='order_id',

        strategy='timestamp',
        updated_at='order_purchase_timestamp                                                    '
    )
}}

select 
        [order_id],
        [customer_id],
        [order_purchase_timestamp]
      from {{ source('dbo','orders_dataset')}}

{% endsnapshot %} 