-- ��������(�����ͺ��̽�)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
create user madang IDENTIFIED BY 12345;
-- ������� ����
grant connect, resource to madang;
-- ������� ����
alter user madang IDENTIFIED BY 12345;

-- �ٸ� �����ͺ��̽� ���� ����
grant create table, create session, create view, create sequence, create procedure to madang;

-- ======================================================================
create user guest IDENTIFIED BY 12345;
-- ������� ����
grant connect, resource to guest;
GRANT INSERT ON USERS TO guest;
-- �ٸ� �����ͺ��̽� ���� ����
grant create table, create session, create view, create sequence, create procedure to guest;