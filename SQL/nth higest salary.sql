-- table name: employee 

--check the entire data in table 
Select * from employee  

-- first method using offset
Select distinct salary,emp_name
from employee
order by salary desc
offset 1 row
fetch next 1 row only ;

--Using subquery
SELECT MAX(salary) AS second_highest_salary
FROM employee
WHERE salary < (SELECT MAX(salary) FROM employee);

--Using rank function
--step 1:
--assigning rank
select emp_name,salary, rank() over(order by salary desc) as rnk from employee

--step 2:
-- selecting rank
Select  salary 
from(
select emp_name, salary, rank() over(order by salary desc) as rnk from employee
) rnk_sal
where rnk = 9
