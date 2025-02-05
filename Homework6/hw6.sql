use W3Resource
go
 --1
select mov_title, mov_year,mov_dt_rel
from movies.movie
--2
select mov_year from movies.movie 
where mov_title='American Beauty'
--3
select mov_title from movies.movie 
where mov_year= 1999
--4
select mov_title from movies.movie
where mov_year< 1998
--5
select movies.reviewer.rev_name
from movies.reviewer
union
select movies.movie.mov_title
from movies.movie

--6
select movies.reviewer.rev_name 
from movies.reviewer, movies.rating
where movies.rating.rev_id=movies.reviewer.rev_id
and		movies.rating.rev_stars>7
and movies.reviewer.rev_name is not null


--7
select movies.movie.mov_title
from  movies.movie, movies.rating
where movies.movie.mov_id=movies.rating.mov_id
and movies.rating.num_o_ratings is null
and movies.movie.mov_title is not null


--
select mov_title
from movies.movie
where mov_id not in (
select mov_id
from movies.rating
)


--8
select mov_title 
from movies.movie
 where mov_id in (905 ,907, 917)
 --9
  select  mov_id,  mov_title, mov_year
  from movies.movie
  where mov_title like '%Boogie Nights%'
  order by mov_year asc
   --10
    select act_id 
	from movies.actor
	where act_fname ='Woody'
	and act_lname =  'Allen'

	-- EMPLOYEE DATABASE
	select*from employee.employees
	--2
	select salary 
	from employee.employees
	--3
	select distinct (job_name)
	from employee.employees
	--4
	select emp_name, to_char(1.15*salary,'$99,999') AS "Salary"
	from employee.employees

	--5
	select (emp_name +'  '+'('+ job_name+')') as [Employee]
	from employee.employees
	--6
	select (emp_name +'  '+ job_name) as [Employee & Job]
	from employee.employees
	--7
	select 
	emp_id,
	emp_name,
	salary,
	 to_char(hire_date,'Month DD,YYYY') as to_char
	from employee.employees
	--8
	select len(trim(emp_name))
	from employee.employees
	--9
	select emp_id,salary,commission
	from employee.employees
	--10
	select distinct dep_id,
	job_name
	from employee.employees
	--11
	select*from employee.employees
	where dep_id != 2001
	--12
	select*from employee.employees
	where hire_date <('1991-1-1')
	--13
	select avg(salary)
	from employee.employees
	where job_name='ANALYST'
	--14
	SELECT*FROM EMPLOYEE.EMPLOYEES
	WHERE EMP_NAME='BLAZE'
	--15
	select*from employee.employees
	where commission>salary
	-16
	select*from employee.employees
	where (1.25*salary)>3000
	--17
	select emp_name from employee.employees
	where len(emp_name)=6 
	--18
	select*from employee.employees
	where datename (month,hire_date)='January'

	--WHERE to_char(hire_date, 'mon')='jan'
	--19
	select job_name from employee.employees
	where job_name='PRESIDENT'
	
	(select job_name from employee.employees
	where job_name='MANAGER')
	
	select job_name from employee.employees
	where job_name not in('PRESIDENT', 'MANAGER')
	--19
	SELECT e.emp_name + ' works for ' + m.emp_name
FROM employees e,
     employees m
WHERE e.manager_id = m.emp_id

--20
select *from employee.employees
where job_name='CLERK'
--21
	select * from employee.employees
  where 	year(getdate())-year(hire_date) > 27




