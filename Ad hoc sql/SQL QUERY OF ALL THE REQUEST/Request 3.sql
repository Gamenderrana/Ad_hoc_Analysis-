select segment , count(*) as Product_count
from  dim_product 
group by segment 
order by product_count desc