with cte1 as 
          (
               select dp.segment AS A , count(distinct(DP.product_code))  AS B
               from  fact_sales_monthly fm 
               join dim_producT dp  on fm.product_code = dp.product_code
               where fiscal_year = "2020"
			   group by fiscal_year , dp.segment 
		  ),

cte2 as 
	(
           select dp.segment AS C, count(distinct(DP.product_code))  as D
           from  fact_sales_monthly fm 
           join dim_producT dp  on fm.product_code = dp.product_code
           where fiscal_year = "2021"
           group by fiscal_year , dp.segment 
    )
 
 select  Cte1.A AS segment , cte1.B AS Product_count_2020, cte2.D AS Product_count_2021, cte2.d-cte1.b as Difference 
 FROM cte1 
join cte2 on cte1.A = cte2.C