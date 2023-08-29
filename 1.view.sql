-- VIEW


grant create view, create sequence to guest;
select * from customer;
select custid, name,address
from customer
where address like '%영국%';
-- VIEW 생성
create or REPLACE view VW_customer(name,address)
as
select name,address
from customer
where address like '%영국%';

select * from vw_customer;

--VIEW 삭제
drop view vw_customer;
-- 판매가격이 20000원 이상인 도서의 도서번호,도서이름, 고객이름, 출판사, 판매가격을 보여주는 view를 생성하시오
create or REPLACE view bk_book
as
select od.bookid,bookname,name,publisher,saleprice
from orders od
INNER JOIN book bk on bk.bookid=od.bookid
INNER JOIN customer cs on cs.custid=od.custid
where saleprice >= 15000;

select bk.bookid, bk.bookname, cs.name, bk.publisher, bk.price
from book bk
inner join orders od on od.bookid = bk.bookid
inner join customer cs on cs.custid = od.custid
where saleprice >= 20000;

select * from bk_book;
-- view(vw_book) '축구'라는 글자가 들어간 도서의 모든 정보를 보이시오
create or replace view vw_book
as
select *
from book
where bookname like '%축구%';

select * from vw_book;

-- view insert
insert into vw_book values(20,'축구의 기술','솔데스크',23000);
select * from book;

insert into book values(21,'올림픽 축구이야기 ','솔데스크',32000);

-- view update
update vw_book SET bookname='월드컵 축구' where bookid like 20;

-- view delete
delete from vw_book where bookid =20;