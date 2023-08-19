-- INSERT INTO

-- 부분삽입
SELECT* from book;
desc book;
INSERT INTO BOOK(bookid,bookname,publisher) VALUES(14,'스포츠 의학','스포츠북');

-- 대량 삽입 (bulk insert)
select * from imported_book;

-- book테이블의 모든 데이터를 IMPORTED_BOOK으로 삽입
insert into imported_book(bookid,bookname,publisher,price)
select bookid,bookname,publisher,price
from book;
-- 컬럼명을 명시하여 bookid 7에서 14번까지의 데이터만 삽입
insert into imported_book(bookid,bookname,publisher,price)
select bookid,bookname,publisher,price
from book
where bookid BETWEEN 7 and 14;
-- 컬럼명을 명시하여 bookid 1에서 3번까지의 데이터만 삽입
insert into imported_book
select bookid,bookname,publisher,price
from book
where bookid BETWEEN 1 and 3;

delete from imported_book;

-- ================================================================================
-- update
select * from customer;
update customer set address= '대한민국 분당'
where custid=5;

select address
from customer
where name = '김연아';

update customer
set address=(select address from customer where name ='김연아')
where name like '박세리';

select * from orders;
alter table orders add bookname varchar2(40);

-- 조인하기
update orders
set bookname=(select bookname 
                    from book
                        where book.bookid=orders.bookid);
                        
alter table orders drop column bookname;

-- DELETE
select *
from imported_book order by bookid;
delete from imported_book where bookid=14;

delete from imported_book;

-- ORDER BY (정렬)
select *
from book
order by price DESC, publisher ASC;