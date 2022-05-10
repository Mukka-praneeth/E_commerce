{% set payment_methods = ["boleto", "credit_card", "debit_card","voucher"] %}

select
   
    {% for payment_method in payment_methods %}
    sum(case when payment_type = '{{payment_method}}' then payment_value end) as {{payment_method}}_amount,
    {% endfor %}
    sum(payment_value) as total_amount
from stg_order_payments
