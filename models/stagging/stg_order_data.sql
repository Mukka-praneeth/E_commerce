{{
    config(
        materialized= 'incremental',
        unique_key='order_id'
    )
}}

select *
from dbo.orders_dataset

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where order_purchase_timestamp >= (select max(order_purchase_timestamp) from {{ this }})

{% endif %}