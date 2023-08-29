-- ������ �Ի��� ����� ���� ����Ͻÿ�
select * from employees;
-- ���1 GROUP BY
select TO_CHAR(hire_date,'mm'),count(*)
from employees
group by TO_CHAR(hire_date,'mm')
order by TO_CHAR(hire_date,'mm');

-- ���2 DECODE
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

-- ���3 DECODE
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
-- �μ���ȣȭ ������ �������� ��ü ���� �׷캰�� ������ �޿� �հ�� �ο����� ����Ͻÿ�
select * from employees;
select department_id,TO_CHAR(sum(salary),'$999,999,00') �޿��հ�, count(*) �ο���
from EMPLOYEES
group by department_id, job_id
order by department_id;

-- �μ���ȣȭ ������ �������� ��ü ���� �׷캰�� ������ �޿� �հ�� �ο��� �� �μ��� ������ �� �޿��հ� �ο����� ����Ͻÿ�
select * from employees;
-- ROLLUP �׷�ȭ�Ǿ� �ִ� �÷��� ���Ͽ� �Ұ踦 ����Ѵ�
select department_id,TO_CHAR(sum(salary),'$999,999,00') �޿��հ�, 
    count(*) �ο���,grouping(job_id) ��������
from EMPLOYEES
group by ROLLUP(department_id, job_id)
order by department_id;

-- CUBE�� UNION ALL �� ������ ������� �Ұ踦 �ѹ� �� �������
select department_id,TO_CHAR(sum(salary),'$999,999,00') �޿��հ�, 
    count(*) �ο���,grouping(job_id) ��������
from EMPLOYEES
group by CUBE(department_id, job_id)
order by department_id;

-- �� ����� �Ҽӵ� �μ����� �޿� ������ ����Ͻÿ� (�� �޿��� �������� ���������Ͻÿ�)
-- rank() over : ����
-- DENSE_RANK() over : ������ ���� ������ ����ó����
-- ROW_NUMBER() over : ������ ���� ������ �������� ����
select EMPLOYEE_id, LAST_NAME, Salary, department_id,
rank()over(PARTITION BY department_id order by salary desc) Rank,
DENSE_RANK() OVER(PARTITION BY department_id order by salary desc)DENSE_RANK
from employees;

select EMPLOYEE_id, LAST_NAME, Salary, department_id,
rank()over(PARTITION BY department_id order by salary desc) Rank,
DENSE_RANK() OVER(PARTITION BY department_id order by salary desc)DENSE_RANK,
ROW_NUMBER() OVER(PARTITION BY department_id order by salary desc)ROW_NUMBER
from employees;

-- first(), last()�� �̿��Ͽ� �μ����� �׷�ȭ�ϰ� �μ����� �޿��� ���� ���� �޴� ����� ���� ���� �޴� ����� ����
-- KEEP Ű���带 ����ϸ� �� ���� ���������� ���� �Ǵ� �ְ� �ش��ϴ� ���� ������ ���� ������ �� �ִ�
-- KEEP Ű����� group by ���� �Բ� ����ؾ� �Ѵ�
select department_id, count(*)
from EMPLOYEES
group by department_id;

select department_id, count(*),
MAX(last_name) KEEP (DENSE_RANK FIRST ORDER BY salary DESC) as "MAX_EMP_name",
MIN(last_name) KEEP (DENSE_RANK LAST ORDER BY salary DESC) as "MIN_EMP_name"
from EMPLOYEES
group by department_id;