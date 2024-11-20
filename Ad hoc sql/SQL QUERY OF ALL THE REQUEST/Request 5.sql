 select mc.product_code , dp.product, mc.manufacturing_cost as total_cost 
from fact_manufacturing_cost Mc  
join dim_product dp  
on Mc.product_code = dp.product_code
where mc.manufacturing_cost 
in (
      select max(manufacturing_cost) from fact_manufacturing_cost
      union 
      select min(manufacturing_cost) from fact_manufacturing_cost 
)
order by  mc.manufacturing_cost  desc

