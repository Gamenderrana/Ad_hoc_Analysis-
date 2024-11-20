select 
case 
   when month(date) in (9,10,11) then "Q1"
   when month(date) in (12,1,2) then  "Q2"
   when month(date) in (3,4,5) then  "Q3"
   else  "Q4"
END  as QTR
, sum(sold_quantity) AS total_qty_sold 
FROM fact_sales_monthly 
where fiscal_year = "2020"
group by QTR
order by total_qty_sold DESC
;
/* most product sold on 2020 fiscal year */

/*--------------------------------------------------------*/

/* total number of product sold on 2020 fiscal year  with month name column */ 
;
select 
Concat(
case 
   when month(date) in (9,10,11) then "Q1"
   when month(date) in (12,1,2) then  "Q2"
   when month(date) in (3,4,5) then  "Q3"
   else  "Q4"
END ," [ ",monthname(date)," ] "
) as QTR_Month
, sum(sold_quantity) AS total_qty_sold 
FROM fact_sales_monthly 
where fiscal_year = "2020"
group by QTR_Month
;




