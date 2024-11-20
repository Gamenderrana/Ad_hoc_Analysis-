select CONCAT(MONTHname(sm.date), ' (', YEAR(sm.date), ')') AS 'Month', sm.fiscal_year
,sum(gc.gross_price*sm.sold_quantity) as gross_price_total 
from fact_sales_monthly sm
join dim_customer dc
on sm.customer_code = dc.customer_code
join fact_gross_price gc 
on gc.product_code = sm.product_code  
where dc.customer = "Atliq Exclusive"
group by month , sm.fiscal_year 
ORDER BY sm.fiscal_year ;
