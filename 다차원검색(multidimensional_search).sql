-- 월별로 입사한 사원의 수를 출력하시오
select * from employees;
-- 방법1 GROUP BY
select TO_CHAR(hire_date,'mm'),count(*)
from employees
group by TO_CHAR(hire_date,'mm')
order by TO_CHAR(hire_date,'mm');

-- 방법2 DECODE
select DECODE(TO_CHAR(hire_date,'mm'),'01',count(*),0) "1 MONTH",
        DECODE(TO_CHAR(hire_date,'mm'),'02',count(*),0) "2 MONTH",
        DECODE(TO_CHAR(hire_date,'mm'),'03',count(*),0) "3 MONTH",
        DECODE(TO_CHAR(hire_date,'mm'),'04',count(*),0) "4 MONTH",
        DECODE(TO_CHAR(hire_date,'mm'),'05',count(*),0) "5 MONTH",
        DECODE(TO_CHAR(hire_date,'mm'),'06',count(*),0) "6 MONTH",
        DECODE(TO_CHAR(hire_date,'mm'),'07',count(*),0) "7 MONTH",
        DECODE(TO_CHAR(hire_date,'mm'),'08',count(*),0) "8 MONTH",
        DECODE(TO_CHAR(hire_date,'mm'),'09',count(*),0) "9 MONTH",
        DECODE(TO_CHAR(hire_date,'mm'),'10',count(*),0) "10 MONTH",
        DECODE(TO_CHAR(hire_date,'mm'),'11',count(*),0) "11 MONTH",
        DECODE(TO_CHAR(hire_date,'mm'),'12',count(*),0) "12 MONTH"
from employees
group by TO_CHAR(hire_date,'mm')
order by TO_CHAR(hire_date,'mm');

-- 방법3 DECODE
select sum(DECODE(TO_CHAR(hire_date,'mm'),'01',count(*),0)) "1 MONTH",
        sum(DECODE(TO_CHAR(hire_date,'mm'),'02',count(*),0)) "2 MONTH",
        sum(DECODE(TO_CHAR(hire_date,'mm'),'03',count(*),0)) "3 MONTH",
        sum(DECODE(TO_CHAR(hire_date,'mm'),'04',count(*),0)) "4 MONTH",
        sum(DECODE(TO_CHAR(hire_date,'mm'),'05',count(*),0)) "5 MONTH",
        sum(DECODE(TO_CHAR(hire_date,'mm'),'06',count(*),0)) "6 MONTH",
        sum(DECODE(TO_CHAR(hire_date,'mm'),'07',count(*),0)) "7 MONTH",
        sum(DECODE(TO_CHAR(hire_date,'mm'),'08',count(*),0)) "8 MONTH",
        sum(DECODE(TO_CHAR(hire_date,'mm'),'09',count(*),0)) "9 MONTH",
        sum(DECODE(TO_CHAR(hire_date,'mm'),'10',count(*),0)) "10 MONTH",
        sum(DECODE(TO_CHAR(hire_date,'mm'),'11',count(*),0)) "11 MONTH",
        sum(DECODE(TO_CHAR(hire_date,'mm'),'12',count(*),0)) "12 MONTH"
from employees
group by TO_CHAR(hire_date,'mm')
order by TO_CHAR(hire_date,'mm');
-- 부서번호화 업무를 기준으로 전체 행을 그룹별로 나눈후 급여 합계와 인원수를 출력하시오
select * from employees;
select department_id,TO_CHAR(sum(salary),'$999,999,00') 급여합계, count(*) 인원수
from EMPLOYEES
group by department_id, job_id
order by department_id;

-- 부서번호화 업무를 기준으로 전체 행을 그룹별로 나눈후 급여 합계와 인원수 및 부서의 업무별 총 급여합과 인원합을 출력하시오
select * from employees;
-- ROLLUP 그룹화되어 있는 컬럼에 대하여 소계를 출력한다
select department_id,TO_CHAR(sum(salary),'$999,999,00') 급여합계, 
    count(*) 인원수,grouping(job_id) 업무구분
from EMPLOYEES
group by ROLLUP(department_id, job_id)
order by department_id;

-- CUBE는 UNION ALL 과 유사한 기능으로 소계를 한번 더 요약해줌
select department_id,TO_CHAR(sum(salary),'$999,999,00') 급여합계, 
    count(*) 인원수,grouping(job_id) 업무구분
from EMPLOYEES
group by CUBE(department_id, job_id)
order by department_id;

-- 각 사원이 소속된 부서별로 급여 순위를 출력하시오 (단 급여를 기준으로 내림차순하시오)
-- rank() over : 순위
-- DENSE_RANK() over : 동점은 공동 순위로 집계처리함
-- ROW_NUMBER() over : 동점은 공동 순위로 인정하지 않음
select EMPLOYEE_id, LAST_NAME, Salary, department_id,
rank()over(PARTITION BY department_id order by salary desc) Rank,
DENSE_RANK() OVER(PARTITION BY department_id order by salary desc)DENSE_RANK
from employees;

select EMPLOYEE_id, LAST_NAME, Salary, department_id,
rank()over(PARTITION BY department_id order by salary desc) Rank,
DENSE_RANK() OVER(PARTITION BY department_id order by salary desc)DENSE_RANK,
ROW_NUMBER() OVER(PARTITION BY department_id order by salary desc)ROW_NUMBER
from employees;

-- first(), last()를 이용하여 부서별로 그룹화하고 부서별로 급여를 가장 많이 받는 사원과 가장 적게 받는 사원의 정보
-- KEEP 키워드를 사용하면 한 번의 쿼리문으로 최저 또는 최고에 해당하는 행의 값들을 쉽게 가져올 수 있다
-- KEEP 키워드는 group by 절과 함께 사용해야 한다
select department_id, count(*)
from EMPLOYEES
group by department_id;

select department_id, count(*),
MAX(last_name) KEEP (DENSE_RANK FIRST ORDER BY salary DESC) as "MAX_EMP_name",
MIN(last_name) KEEP (DENSE_RANK LAST ORDER BY salary DESC) as "MIN_EMP_name"
from EMPLOYEES
group by department_id;