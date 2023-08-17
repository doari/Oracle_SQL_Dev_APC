-- 계정생성(데이터베이스)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
create user madang IDENTIFIED BY 12345;
-- 계정등록 권한
grant connect, resource to madang;
-- 계정비번 변경
alter user madang IDENTIFIED BY 12345;

-- 다른 데이터베이스 접근 권한
grant create table, create session, create view, create sequence, create procedure to madang;

-- ======================================================================
create user guest IDENTIFIED BY 12345;
-- 계정등록 권한
grant connect, resource to guest;
GRANT INSERT ON USERS TO guest;
-- 다른 데이터베이스 접근 권한
grant create table, create session, create view, create sequence, create procedure to guest;