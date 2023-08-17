-- 기본키가 하나일 경우는 각 컬럼에 명시가 가능하지만 2개 이상일경우는 괄호를 사용하여 복합키로 설정한다.
create table NewBook(
bookname varchar2(20),
publisher VARCHAR2(20),
price number,
PRIMARY KEY(bookname,publisher));

-- UNIQUE: 중복뎅터 입력 불가능 
-- DEFAULT : 입격값이 없을 경우 기본데이터 값 입력
-- CHECK : 직접입력시 최소 금액
drop table NewBook;


create table NewBook(
bookname varchar2(20) not null,
publisher VARCHAR2(20) UNIQUE,
price number DEFAULT 100 check(price > 3000),
PRIMARY KEY(bookname,publisher));

create table newcustomer(
custid number primary key,
name varchar2(40),
address varchar2(40),
phone varchar2(40)
);

-- on delete cascade : 부모테이블에서 삭제되면 자식테이블의 데이터도 삭제
-- on update cascade(오라클에서는 지원 안됨=> 트리거 사용) : 부모테이블에서 업데이트 되면 자식테이블의 데이터도 업데이트
create table neworders(
orderid number,
custid number,
bookid number,
saleprice number,
orderdate date,
PRIMARY KEY(orderid),
foreign key(custid) references newcustomer(custid) on delete cascade );

-- 제약조건
select * from newbook;
desc newbook;

alter table newbook add inbn VARCHAR2(40); --속성추가
alter table newbook modify inbn number; --속성타입변경
alter table newbook rename column inbn to iss; --속성이름변경
alter table newbook drop column iss; --속성삭제

alter table newbook rename to TB_newbook; -- 테이블이름 변경