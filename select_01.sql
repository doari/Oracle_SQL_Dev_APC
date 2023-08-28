-- book테이블에서 가장 비싼 가격을 보이시오
select MAX(price)
from book;

select * from customer;
select * from orders;
-- book테이블에서 가장 비싼 가격의 도서이름을 보이시오.

SELECT bookname
FROM book
WHERE price = (SELECT MAX(price) FROM book);

-- IN
SELECT bookname
FROM book
WHERE price IN (SELECT MAX(price) FROM book);

-- 도서를 구매한 적이 있는 고객의 이름을 보이시오
select custid,name
from customer
where custid IN (select custid from orders);

-- 굿스포츠에서 출판한 도서를 구매한 적이 있는 고객의 이름을 보이시오
select * from book;

select name
from customer
where custid IN (select custid 
                from orders
                where bookid IN (select bookid
                                 from book
                                 where publisher='굿스포츠'));
                                 
                                 
                                 
-- EXISTS (null값 자동처리, 찾고자하는 값을 찾으면 자동으로 다음 행들을  무시하고 중지함으로 빠름)
-- 주문한 적이 있는 고객의 이름과 주소를 보이시오
select * from orders od, customer cs
where cs.custid=od.custid;

select name, address
from customer cs
where EXISTS(select * 
            from orders od
            where cs.custid=od.custid);
            
-- 상관부속질의
-- 출판사별로 출판사의 평균도서 가격보다 더 비싼 가격의 도서이름과 출판사를 구하시오
select * from book;

select bookname,publisher,price
from book b1
where price > (select avg(b2.price)
                from book b2
                where b1.publisher=b2.publisher);
                
-- 집합연산
-- 차집합(MINUS), 합집합(UNION), 교집합(INTERSECT)(INNER JOIN으로 대채)
-- 도서를 주문하지 않은 고객의 이름을 보이시오--전체고객에서 결재한고객 빼주기(차집합)
select name
from customer
MINUS
select name
from customer
where custid IN (select custid
                from orders);
