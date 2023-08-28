-- NULL

create table mybook(
bookid number,
price number);

insert into mybook values(1,10000);
insert into mybook values(2,20000);
insert into mybook values(3,null);
insert into mybook values(4,25000);
insert into mybook values(5,15000);
insert into mybook values(5,18500);
insert into mybook values(5,17800);
insert into mybook values(5,null);

select * from mybook;

-- 5번 도서의 가격 합계 ,평균,수량을 보이시오
select sum(price),avg(price),count(price)
from mybook
where bookid = 5;

-- NULL/ NULL 제외
select * from mybook
where price is null;

select * from mybook
where price is not null;

select * from customer;

-- null 값을 대체하는 메소드
select name 성명,NVL(phone,'번호정보 없음') 전화번호
from customer;

-- 가상컬럼 활용
select ROWNUM 순번,custid,name,phone
from customer
where ROWNUM <=3;