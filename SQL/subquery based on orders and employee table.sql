--query to select all data
Select * from orders
Select avg(sales) from orders
Select order_id, sum(sales) as total_sales_value from orders
group by order_id

-- avg value as total

Select avg(total_sales_value) as avg_sales
From (Select order_id, sum(sales) as total_sales_value from orders
group by order_id) common_name

--order_id where we have sales more than the avg_order_value 
Select order_id, sum(sales) from Orders 
group by order_id
having sum(sales) >
(Select avg(total_sales_value) as avg_sales
from(
Select order_id, sum(sales) as total_sales_value from orders
group by order_id ) as total_Sales );

-- query to select all data
Select * from employee

-- complate avg sal by dep name
Select dep_name, avg(salary) as avg_sal from employee e
full join dept d on e.dept_id = d.dep_id
group by dept_id, dep_name 

-- complete table having all information
Select e.*, d.avg_sal from employee e
join
(Select dept_id,avg(salary) as avg_sal from employee
group by dept_id) d
on e.dept_id = d.dept_id

