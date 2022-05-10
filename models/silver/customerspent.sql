select customer_unique_id,
        sum(price) as amount_spent
from Customersdetails
group by customer_unique_id

    
