#--1--
Create table employees (EMPNO int primary key, ENAME varchar(50), JOB varchar(50) default "clerk", MGR int, HIREDATE varchar(50), SAL int check (SAl>=0), COMM int, DEPTNO int);
insert into employees values ('7369', 'SMITH', 'CLERK', 7902, '1980-12-17', '800', NULL, 20),
('7499', 'ALLEN', 'SALESMAN', '7698', '1981-02-20', 1600, '300', 30),
('7521', 'WARD', 'SALESMAN', '7698', '1981-02-22', 1250, '500', 30),
('7566', 'JONES', 'MANAGER', '7839', '1981-04-02', 2975, NULL, 20),
('7654', 'MARTIN', 'SALESMAN', '7698', '1981-09-28', 1250, '1400', 30),
('7698', 'BLAKE', 'MANAGER', '7839', '1981-05-01', 2850, NULL, 30),
('7782', 'CLARK', 'MANAGER', '7839', '1981-06-09', 2450, NULL, 10),
('7788', 'SCOTT', 'ANALYST', '7566', '1982-12-09', 3000, NULL, 20),
('7839', 'KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 10),
('7844', 'TURNER', 'SALESMAN', '7698', '1980-09-08', 1500, '0', 30),
('7876', 'ADAMS', 'CLERK', '7788', '1983-01-12', 1100, NULL, 20),
('7900', 'JAMES', 'CLERK', '7698', '1981-12-03', 950, NULL, 30),
('7902', 'FORD', 'ANALYST', '7566', '1981-12-03', 3000, NULL, 20),
('7934', 'MILLER', 'CLERK', '7782', '1982-01-23', 1300, NULL, 10);


select * from employees;


#--2--

select ename,sal from employees where sal >1000;

#--3--

select ename from employees where ename like 'S%' or ename like 'A%';
#--4--

SELECT deptno,job,avg(sal) as avg from employees 
group by deptno,job;
#--5--
select e.empno , e.ename as name ,m.ename as 'manager name' from employees e,employees m where e.mgr =m.empno;

#--6--
#Rank of salary in Organisation 
select empno,ename,deptno,sal,dense_rank() over (order by sal asc) as org_rnk from employees;
#Rank of Salary in their respective department
select empno,ename,deptno,sal,dense_rank() over (partition by deptno order by sal asc) as dept_rnk from employees;