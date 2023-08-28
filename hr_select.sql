-- HR 실습
select * from employees; -- 사원정보
select * from departments; -- 부서정보
select * from locations; -- 사원 상세정보
select * from jobs; -- 프로젝트 작업 정보
select * from job_history; -- 


-----------------------------------------------------------
-- 사원정보 테이블에서 사원번호, 이름, 급여, 업무, 입사일, 상사의 사원번호를 보이시오
-- (단, 이름은 이름과 성을 연결하여 name컬럼으로 출력하시오)
select employee_id ,first_name ||' '|| last_name as Name,salary,job_id,hire_date,manager_id
from employees;

-- 사원정보 테이블에서 사원번호, 이름 (단, 이름은 이름과 성을 연결하여 name컬럼으로 출력하시오),
-- 급여 'Salary',/ 연봉에 $100 보너스를 추가하여 계산한 값은 'Increase ANN_Salary', /
-- 급여에 $100 보너스를 추가하여 계산한 연봉은 Increase_Salary라는 별칭을 붙여 보이시오
select employee_id ,first_name ||' '|| last_name as Name,
salary as Salary,(salary *12) +100 AS "Increase ANN_Salary",
(salary+100)*12 as "Increase_Salary"
from employees;

-- 부서별 담당하는 업무를 한 번씩만 출력하시오
select DISTINCT (department_id), job_id 
from employees
order by department_id;

/*
이번 분기에 60번 IT 부서에서는 신규 프로그램을 개발하고 보급하여 회사에 공헌하였다
이에 해당 부서의 사원 급여를 12.3% 인상하기로 하였다
60번 IT 부서 사원의 급여를 12.3% 인상하여 정수(반올림)로 표시하는 보고서를 작성하시오
보고서는 사원번호, 성과 이름(Name으로 별칭), 급여, 인상된급여(Increase_Salary로 별칭) 순서로 출력하시오
*/
select
    employee_id AS "사원번호",first_name ||' '|| last_name as Name,
    salary AS "Salary",
    Round(salary *1.123) AS "Increase_Salary"
from employees
where department_id = 60
order by "Increase_Salary";

-- HR 데이터베이스에 존재하는 Employees, Departments, Locations 테이블의 구조를 파악
desc employees;
desc departments;
desc locations;

-- Oxford에 근무하는 사원의 이름(이름 성)과 업무, 부서이름, 도시이름
-- 이때, 첫번째 열은 회사이름인 'SoftBast'로 상수값이 출력되도록 하시오
-- 오라클 전용
select (first_name ||' '|| last_name) Name, department_name, city 
from employees em , locations lc, departments dp 
where dp.location_id = lc.location_id and em.department_id = dp.department_id 
and city like 'Oxford';

select  (first_name ||' '|| last_name) Name,departments_name,city
from locations loc,employees em,departments dp
where em.department_id = dp.department_id and dp.location_id= loc.location_id
and city like 'Oxford';

-- ANSI
select 'SoftBast' 회사명, (first_name ||' '|| last_name) Name, department_name, city
from employees ey
inner join departments dp on ey.department_id = dp.department_id
inner join locations loc on dp.location_id = loc.location_id
and city like 'Oxford';

-- HR 부서의 어떤 사원이 급여정보를 조회하는 업무를 담당하고 있다(중첨질의)
-- Tucker 사원보다 급여를 많이 받고 있는 사원의 이름(이름 성)과, 업무, 급여를 출력하시오
select * from employees;

select first_name ||''|| last_name Name,job_id,salary
from employees
where salary > (select salary
                from employees
                where last_name like 'Tucker');
                
-- 사원의 급여 정보 중 업무별 최소 급여를 받고 있는 사원의 이름과 업무, 급여, 입사일을 출력하시오
select department_id,first_name ||''|| last_name Name,job_id,salary,hire_date
from employees em1
where salary IN (select min(salary)
                from employees em2
                where em1.department_id=em2.department_id
                group by department_id)
                order by department_id;