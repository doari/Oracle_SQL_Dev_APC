-- summerprice ���̺�
create table summerprice(
class varchar2(40),
price number);

insert into summerprice values('JAVA',50000);
insert into summerprice values('JSP',45000);
insert into summerprice values('Spring',80000);
select * from summerprice;
-- summerEnroll
create table summerEnroll(
sid number,
class varchar2(40));

insert into summerEnroll values(100,'JAVA');
insert into summerEnroll values(150,'JSP');
insert into summerEnroll values(200,'Spring');
insert into summerEnroll values(250,'JAVA');
select * from summerEnroll;

--�˻�
--spring�� �����Ḧ ���̽ÿ�

select price ������
from summerprice
where class like 'Spring';
--����
-- Spring�� ���� ���
delete from summerEnroll
where sid=200;

select * from summerEnroll;
--spring�� �����Ḧ ���̽ÿ�
select price ������
from summerprice
where class like 'Spring';

--����
insert into summerprice values('JS',25000);

-- ���� ����� �л��� �ο��� ���
select count(*)
from summerEnroll;

--������Ʈ
update summerprice
set price=40000
where class like 'JAVA';

-- ���¿� ���� �������� ���� ���
select price ������
from summerprice 
where class like 'JAVA';

-- ����ȭ
-- ��1����ȭ(���ڰ�����)
-- ��2����ȭ(�κ���������)
-- ��3����ȭ(��������������) => BCNF
