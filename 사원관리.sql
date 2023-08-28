-- works
commit;
insert into works values(1,1,3);
insert into works values(1,2,1);
insert into works values(2,3,1);
insert into works values(2,4,5);
insert into works values(1,5,1);
-- �������

select * from department;
select * from employee;
select * from project;
select * from works;

------------------
-- ��� ����� �̸��� ���̽ÿ�
select name from employee;
-- ���� ����� �̸��� ���̽ÿ�
select name from employee where gender like '��';
-- ȫ�浿 ����(manager)�� ��� empno,name�� ���̽ÿ�(��ø����)
select empno,name
from employee
where deptno IN (select deptno
                from department where manager like 'ȫ�浿');
-- 'ȫ�浿' ����(MANAGER)�μ����� ���ϴ� ����� ���� ���̽ÿ�(��ø����)
select count(name) �����
from employee
where name != 'ȫ�浿'and deptno IN (select deptno
                from department where manager like 'ȫ�浿');
-- 'IT'�μ����� ���ϴ� ����� �̸��� �ּҸ� ���̽ÿ�(����)
select empno,name
from employee
where deptno IN (select deptno
                from department where deptname like 'IT');
-- �μ���ȣ�� �μ��� ������� ���� �ð� ���� ���̽ÿ�.����(��,�μ��� ��������)
select deptno,sum(hoursworked)
from employee em,works wk
where em.empno=wk.empno
group by em.deptno;
-- �� �� �̻��� ����� ������ ������Ʈ�� ��ȣ,�̸�,����� ���� ���̽ÿ� (����,HAVING)
select * from project;
select * from employee;

select projno,projname,count(name) �����
from project pr,employee em
where pr.deptno=em.deptno
group by pr.projno,pr.projname -- ������Ʈ �̸��� ��ȣ�� �ϳ��� �����ϹǷ� ���� �׷����� ����
having count(*)>=2;
-- �� �� �̻��� ����� �ִ� �μ��� ��� �̸��� ���̽ÿ�.(��ø���� �Ǵ� ����)
select name
from employee em1,department de1
where de1.deptno=de1.deptno
and deptname IN (select deptname
                from department de2,employee em2
                where de2.deptno=em2.deptno
                group by deptname
                having count(*)>=3);