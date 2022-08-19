
USE employees;

1)

SELECT  count(case when gender='M' then 1 end) as male_cnt,
  count(case when gender='F' then 1 end) as female_cnt,
  YEAR(hire_date) AS yearr
From employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 2002
GROUP BY YEAR(hire_date)
ORDER BY YEAR(hire_date) ASC;


2)

DELETE FROM dept_manager 
WHERE YEAR(to_date) = '9999';

SELECT  count(case when employees.gender='M' then 1 end) as male_Mgr,
  count(case when employees.gender='F' then 1 end) as female_Mgr,
  YEAR(to_date) AS yearr
FROM dept_manager
INNER JOIN employees ON employees.emp_no = dept_manager.emp_no
WHERE YEAR(to_date) BETWEEN 1990 AND 2002
GROUP BY YEAR(to_date)
ORDER BY YEAR(to_date) ASC;

3)


SELECT YEAR(to_date) as Year,
format(AVG(Case when employees.gender = 'M' then convert(float,salaries.salary) end),'##.#0') as 'AVG_SAL_male',
format(AVG(Case when employees.gender = 'F' then convert(float,salaries.salary) end),'##.#0') as 'AVG_SAL_Female'
FROM salaries
INNER JOIN employees ON salaries.emp_no = employees.emp_no
WHERE YEAR(to_date) BETWEEN 1990 AND 2002
GROUP BY YEAR(to_date)
ORDER BY YEAR(to_date) ASC;

4.)
SELECT departments.dept_name,
format(AVG(Case when employees.gender = 'M' then convert(float,salaries.salary) end),'##.#0') as 'AVG_SAL_male',
format(AVG(Case when employees.gender = 'F' then convert(float,salaries.salary) end),'##.#0') as 'AVG_SAL_Female'
FROM salaries
INNER JOIN dept_emp ON salaries.emp_no = dept_emp.emp_no
INNER JOIN departments ON departments.dept_no= dept_emp.dept_no
INNER JOIN employees ON salaries.emp_no = employees.emp_no
Group by departments.dept_name;