Select X.A  AS unique_product_2020 , Y.B AS unique_product_2021 , ROUND((B-A) *100/A ,2)AS percentage_change 
from 
 ( 
    (select count(distinct(product_code)) as A 
      from fact_sales_monthly
      where fiscal_year="2020") X ,
    (select count(distinct(product_code))AS B   
      from fact_sales_monthly 
	  where fiscal_year = "2021") Y
)