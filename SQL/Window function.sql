
--row number, rank, dense rank 
Select *,
row_number () over (partition by dept_id order by salary desc) as rn,
rank() over(partition by dept_id order by salary desc) as rnk,
dense_rank() over(partition by dept_id order by salary desc) as d_rnk
from employee


-- first 2 salary in the employee
With cte as (
Select *,
row_number () over (partition by dept_id order by salary desc) as rnk
from employee) 
Select * from cte 
where rnk <=2 ;


--to print top 10  selling product from each category 

With cat_product_sales as(
select Category, Product_ID, sum(sales) as category_sales
from Orders
group by Category, Product_ID
),
rnk_sales as (
Select *, 
RANK() over(partition by category order by category_sales desc) rnk
from cat_product_sales)
Select * from rnk_sales
where rnk<=10 ;
