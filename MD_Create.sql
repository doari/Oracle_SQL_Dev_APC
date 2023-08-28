-- 계정생성(데이터베이스)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;
create user madang IDENTIFIED BY 12345;

-- 계정등록 권한
grant connect, resource to madang;
-- 다른 데이터베이스 접근 권한
grant create table, create session, create view, create sequence, create procedure to madang;
-- 물리적인 공간 확보
alter user madang default tablespace USERS quota unlimited on USERS;


-- 계정 삭제
DROP USER madang CASCADE;
-- 계정비번 변경
alter user madang IDENTIFIED BY 12345;

-- ======================================================================
create user guest IDENTIFIED BY 12345;
-- 계정등록 권한
grant connect, resource to guest;

-- 다른 데이터베이스 접근 권한
grant create table, create session, create view, create sequence, create procedure to guest;

-- USERS 테이블스페이스에 대한 권한 부여
grant unlimited tablespace to madang;
grant unlimited tablespace to guest;