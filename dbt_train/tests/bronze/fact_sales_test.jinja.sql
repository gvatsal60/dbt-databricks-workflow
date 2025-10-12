select
    sales_id,
    sum(net_amount) as total_amount
from {{ source("source", "fact_sales") }}
group by 1
having total_amount < 0
