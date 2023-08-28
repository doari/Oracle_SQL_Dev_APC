-- ��������(�����ͺ��̽�)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
create user madang IDENTIFIED BY 12345;

-- ������� ����
grant connect, resource to madang;
-- �ٸ� �����ͺ��̽� ���� ����
grant create table, create session, create view, create sequence, create procedure to madang;
-- �������� ���� Ȯ��
alter user madang default tablespace USERS quota unlimited on USERS;


-- ���� ����
DROP USER madang CASCADE;
-- ������� ����
alter user madang IDENTIFIED BY 12345;

-- ======================================================================
create user guest IDENTIFIED BY 12345;
-- ������� ����
grant connect, resource to guest;

-- �ٸ� �����ͺ��̽� ���� ����
grant create table, create session, create view, create sequence, create procedure to guest;

-- USERS ���̺����̽��� ���� ���� �ο�
grant unlimited tablespace to madang;
grant unlimited tablespace to guest;