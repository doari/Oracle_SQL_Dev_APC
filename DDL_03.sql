drop table order_2;
create table order_2(
orderid number,
custname VARCHAR2(20),
salesperson VARCHAR2(20),
amount number
);

drop table customer_2;
create table customer_2(
name VARCHAR2(20),
city VARCHAR2(20),
industrytype VARCHAR2(40)
);

drop table salesperson;
create table salesperson(
name VARCHAR2(20),
age number,
salary number);

-- 기본키 orderid, name, name
alter table order_2 add primary key(orderid);
alter table customer_2 add primary key(name);
alter table salesperson add primary key(name);

-- 참조조건 설정하기
alter table order_2 add CONSTRAINT salesperson foreign key(salesperson) REFERENCES salesperson(name);
alter table order_2 add CONSTRAINT customer_2 foreign key(custname) REFERENCES customer_2(name);

-- not null : custname, city,salary
alter table order_2 MODIFY custname VARCHAR2(20) not null;
alter table customer_2 MODIFY city VARCHAR2(20) not null;
alter table salesperson MODIFY salary number not null;