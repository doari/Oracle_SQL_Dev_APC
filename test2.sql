-- 오라클 Git 연동 1
select * from tab;

CREATE TABLE Department (
    deptno NUMBER PRIMARY KEY,
    deptname VARCHAR2(40),
    manager VARCHAR2(40)
);
CREATE TABLE Employee(
empno NUMBER PRIMARY KEY,
deptno NUMBER ,
name VARCHAR2(40),
phoneno NUMBER,
address VARCHAR2(40),
gender VARCHAR2(40),
posision VARCHAR2(40),
foreign key(deptno) REFERENCES Department(deptno)
);