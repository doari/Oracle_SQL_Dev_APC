-- HR �ǽ�
select * from employees; -- �������
select * from departments; -- �μ�����
select * from locations; -- ��� ������
select * from jobs; -- ������Ʈ �۾� ����
select * from job_history; -- 


-----------------------------------------------------------
-- ������� ���̺��� �����ȣ, �̸�, �޿�, ����, �Ի���, ����� �����ȣ�� ���̽ÿ�
-- (��, �̸��� �̸��� ���� �����Ͽ� name�÷����� ����Ͻÿ�)
select employee_id ,first_name ||' '|| last_name as Name,salary,job_id,hire_date,manager_id
from employees;

-- ������� ���̺��� �����ȣ, �̸� (��, �̸��� �̸��� ���� �����Ͽ� name�÷����� ����Ͻÿ�),
-- �޿� 'Salary',/ ������ $100 ���ʽ��� �߰��Ͽ� ����� ���� 'Increase ANN_Salary', /
-- �޿��� $100 ���ʽ��� �߰��Ͽ� ����� ������ Increase_Salary��� ��Ī�� �ٿ� ���̽ÿ�
select employee_id ,first_name ||' '|| last_name as Name,
salary as Salary,(salary *12) +100 AS "Increase ANN_Salary",
(salary+100)*12 as "Increase_Salary"
from employees;

-- �μ��� ����ϴ� ������ �� ������ ����Ͻÿ�
select DISTINCT (department_id), job_id 
from employees
order by department_id;

/*
�̹� �б⿡ 60�� IT �μ������� �ű� ���α׷��� �����ϰ� �����Ͽ� ȸ�翡 �����Ͽ���
�̿� �ش� �μ��� ��� �޿��� 12.3% �λ��ϱ�� �Ͽ���
60�� IT �μ� ����� �޿��� 12.3% �λ��Ͽ� ����(�ݿø�)�� ǥ���ϴ� ������ �ۼ��Ͻÿ�
������ �����ȣ, ���� �̸�(Name���� ��Ī), �޿�, �λ�ȱ޿�(Increase_Salary�� ��Ī) ������ ����Ͻÿ�
*/
select
    employee_id AS "�����ȣ",first_name ||' '|| last_name as Name,
    salary AS "Salary",
    Round(salary *1.123) AS "Increase_Salary"
from employees
where department_id = 60
order by "Increase_Salary";

-- HR �����ͺ��̽��� �����ϴ� Employees, Departments, Locations ���̺��� ������ �ľ�
desc employees;
desc departments;
desc locations;

-- Oxford�� �ٹ��ϴ� ����� �̸�(�̸� ��)�� ����, �μ��̸�, �����̸�
-- �̶�, ù��° ���� ȸ���̸��� 'SoftBast'�� ������� ��µǵ��� �Ͻÿ�
-- ����Ŭ ����
select (first_name ||' '|| last_name) Name, department_name, city 
from employees em , locations lc, departments dp 
where dp.location_id = lc.location_id and em.department_id = dp.department_id 
and city like 'Oxford';

select  (first_name ||' '|| last_name) Name,departments_name,city
from locations loc,employees em,departments dp
where em.department_id = dp.department_id and dp.location_id= loc.location_id
and city like 'Oxford';

-- ANSI
select 'SoftBast' ȸ���, (first_name ||' '|| last_name) Name, department_name, city
from employees ey
inner join departments dp on ey.department_id = dp.department_id
inner join locations loc on dp.location_id = loc.location_id
and city like 'Oxford';

-- HR �μ��� � ����� �޿������� ��ȸ�ϴ� ������ ����ϰ� �ִ�(��÷����)
-- Tucker ������� �޿��� ���� �ް� �ִ� ����� �̸�(�̸� ��)��, ����, �޿��� ����Ͻÿ�
select * from employees;

select first_name ||''|| last_name Name,job_id,salary
from employees
where salary > (select salary
                from employees
                where last_name like 'Tucker');
                
-- ����� �޿� ���� �� ������ �ּ� �޿��� �ް� �ִ� ����� �̸��� ����, �޿�, �Ի����� ����Ͻÿ�
select department_id,first_name ||''|| last_name Name,job_id,salary,hire_date
from employees em1
where salary IN (select min(salary)
                from employees em2
                where em1.department_id=em2.department_id
                group by department_id)
                order by department_id;