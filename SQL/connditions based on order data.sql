--order_id where we have sales more than the avg_order_value 
Select order_id, sum(sales) as above_avg_sales from Orders 
group by order_id
having sum(sales) >
(Select avg(total_sales_value) as avg_sales
from(
Select order_id, sum(sales) as total_sales_value from orders
group by order_id ) as total_Sales );

--Using inner join
/*
from A
inner join B
on a.col1=b.col1
*/
Select A.*, B.* from 
(Select Order_ID, sum(sales) as total_order_value
from Orders
group by Order_ID) A
inner join
(Select avg(total_order_value) as avg_sales_value from(
Select Order_ID, sum(sales) as total_order_value
from Orders
group by Order_ID) as order_agg) B
on 1=1 
where total_order_value > avg_sales_value ;

-- using CTE 
With total_order_value as(
Select Order_ID, sum(sales) as total_order_value
from Orders
group by Order_ID)

, B as (
Select avg(total_order_value) as avg_sales_value from total_order_value as order_agg) 

Select A.*, B.*
From total_order_value A
inner join B 
on 1=1 
where total_order_value > avg_sales_value ;