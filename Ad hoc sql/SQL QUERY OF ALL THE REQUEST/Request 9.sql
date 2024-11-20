SELECT 
    channel,
    concat(round(SUM(sold_quantity * gross_price)/1000000,2) ," M " ) as  gross_sale_mln ,
    concat(round(SUM(sold_quantity * gross_price) / SUM(SUM(sold_quantity * gross_price)) 
    OVER () * 100,2), " % " ) AS percentage
FROM fact_sales_monthly sm
JOIN dim_customer dc ON sm.customer_code = dc.customer_code
JOIN fact_gross_price gp ON sm.product_code = gp.product_code 
WHERE sm.fiscal_year = '2021'
GROUP BY channel
ORDER BY Percentage DESC ; 