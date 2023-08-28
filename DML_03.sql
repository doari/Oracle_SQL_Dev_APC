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

-- 집계함수
select Sum(saleprice) as 총매출
from orders;

-- 고객이 주문한 도서의 총 판매액, 최대값, 최솟값을 구하시오.
SELECT
    SUM(saleprice) as Total,
    AVG(saleprice) as Average,
    MAX(saleprice) as Maximun,
    MIN(saleprice) as Minimun
FROM orders;
-- orders의 모든행 추출
select * from orders;
-- 튜플의 갯수세기 
select count(orderid)
from orders;

-- 전체 튜플의 갯수
select count(*)
from orders;

-- 도서 판매가격이 20000원 이상인 건수를 보이시오
-- where 문
SELECT
    COUNT(*) AS 판매가격_20000원_이상인_건수
FROM
    orders
WHERE
    saleprice >= 20000;
    
-- case when then 사용
SELECT count(
(case when saleprice >= 20000 then 1 end)) as VIP
FROM orders;

-- 도서 판매가격이 20000원 이상인 건수와 10000이하의 권수를 구하시오
SELECT count((case when saleprice >= 20000 then 1 end)) as VIP,
       count((case when saleprice < 10000 then 1 end)) as cs
FROM orders;

-- GROUP BY
-- 고객별로 주문한 도서의 총 수량과 총 판매액을 보이시오
select custid, count(*) 도서수량, SUM(saleprice) as "총 판매액"
from orders
group by custid
order by custid; --순서대로 정렬

-- 가격이 15000원 이상인 도서를 구해한 고객에 대하여 고객별 주문도서의 총 수량를 보이시오
select custid,count(case when saleprice >= 15000 then 1 end) as "15000원 이상인 도서"
from orders
group by custid
order by custid; --순서대로 정렬

-- 가격이 15000원 이상인 도서를 구해한 고객에 대하여 고객별 주문도서의 총 수량를 보이시오
-- (단 2권이상 구매한 고객만 출력)-- 그룹안의 조건은 having
select custid,count(case when saleprice >= 15000 then 1 end) as "15000원 이상인 도서"
from orders
where saleprice >=15000
group by custid
having count(*)>=2 -- 그룹안의 조건은 having
order by custid; --순서대로 정렬
-- 가격이 15000원 이상인 도서를 구해한 고객에 대하여 고객별 주문도서의 총 수량를 보이시오
-- (단 2권이상 구매한 고객만 출력)-- 그룹안의 조건은 having
select custid,count(*) as "15000원 이상인 도서"
from orders
where saleprice >=15000 --1
group by custid
having count(*)>=2
order by custid; --2