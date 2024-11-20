with cte1 as 
	 ( select dc.customer_code , dc.customer , pid.pre_invoice_discount_pct as average_discount_pct
	   from dim_customer dc
       join fact_pre_invoice_deductions pid
       on pid.customer_code = dc.customer_code
       where fiscal_year = "2021" and dc.market = "India" 
      )
select * from cte1 
where average_discount_pct > (select  avg(average_discount_pct) from cte1 )
order by average_discount_pct desc 
LIMIT 5 