-- system �������� ����
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
--create user apcOracle IDENTIFIED BY 12345;
-- ����� ����(== �����ͺ��̽�) ���� : apcOracle
create user apcOracle IDENTIFIED By 12345;

--�⺻ ���� (����,�⺻�ҽ�)
grant connect,resource to apcOracle;

-- ��� (debeloper)
-- ������ ���� Ȯ��
alter user apcOracle default tablespace users quota unlimited on users;

-- �������� ����
grant create table, create session, create view, create sequence, create procedure to apcOracle;
-- DML ����
grant select,delete,update,insert on madang.book to apcOracle;
grant select,delete,update,insert on madang.customer to apcOracle;
grant select,delete,update,insert on madang.orders to apcOracle;

-- �л���� ������Ʈ(���� : number, ���� : varchar2)
-- �л�([�л���ȣ], �̸�, ����, �ּ�, ��ȭ��ȣ) ==> student
-- ����([���¹�ȣ], {�л���ȣ}, {������ȣ}, ���¸�, ���ǽ�, ���½ð�) ==>class
-- ����([������ȣ], �л���ȣ, �̸�, ����, �ּ�, ��ȭ��ȣ)==>professor
-- ���������� alter�� ����

--drop table student;
create table student(
stdnum number(10),
stdname varchar2(20),
gender varchar2(10),
address varchar2(40),
phone varchar2(20)
);

--������ alter {}���� []����Ű
drop table professor;
create table professor(
proid number (10),
stuid number (10),
proname varchar2 (20),
progender varchar2 (10),
proaddress varchar2 (40),
phone varchar2 (10),
primary key(proid)
);
--��������
alter table student add primary key(stdnum);
alter table professor add primary key(proid);

drop table class;
create table class(
classnum number(20),
stdnum number(20),
pronum number(20),
classname varchar(20),
classadress varchar(20),
classtime varchar2(20)
);
--��������
alter table class add primary key(classnum);

-- �������� �����ϱ�
alter table order_2 add CONSTRAINT student foreign key(stdnum) REFERENCES salesperson(stdnum);
alter table order_2 add CONSTRAINT professor foreign key(pronum) REFERENCES professor(proid);





-----------------------------------------------------------------------
-- ������� ����
grant connect, resource to madang;
-- �ٸ� �����ͺ��̽� ���� ����
grant create table, create session, create view, create sequence, create procedure to madang;
-- �������� ���� Ȯ��
alter user madang default tablespace USERS quota unlimited on USERS;
