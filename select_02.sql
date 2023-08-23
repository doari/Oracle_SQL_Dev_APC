-- 박지성이 구매한 도서의 출판사
-- INNER JOIN
-- 오라클 전용
select *
from book bk, orders od,customer cs;

select bk.publisher,bk.BOOKNAME -- 원래: publisher,BOOKNAME
from book bk, orders od,customer cs
where bk.bookid=od.bookid and od.custid=cs.custid and cs.name='박지성';

-- ANSI SQL (공용)
select bk.bookname,bk.publisher--원래: bookname, publisher
from orders od
inner JOIN book bk on od.bookid = bk.bookid
inner JOIN customer cs on od.custid= cs.custid and cs.name='박지성';

-- 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구입한 고객의 이름(박지성 제외)
-- 오라클 전용
select * from book;
select * from customer;
select * from orders;


select DISTINCT name
from book bk1, orders od1,customer cs1
where bk1.bookid=od1.bookid and od1.custid=cs1.custid
and cs1.name not like '박지성'
and bk1.publisher in(select bk.publisher 
                    from book bk, orders od,customer cs
                    where bk.bookid=od.bookid and od.custid=cs.custid and cs.name='박지성');

-- 위에꺼와 같은거
SELECT DISTINCT name
FROM book bk1, orders od1, customer cs1
WHERE bk1.bookid = od1.bookid 
    AND od1.custid = cs1.custid
    AND cs1.name NOT LIKE '박지성'
    AND bk1.publisher IN (
        SELECT bk.publisher 
        FROM book bk, orders od, customer cs
        WHERE bk.bookid = od.bookid 
            AND od.custid = cs.custid 
            AND cs.name = '박지성');

-- 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구입한 고객의 이름(박지성 제외)
-- ANSI SQL (공용)
SELECT DISTINCT cs1.name
FROM book bk1
JOIN orders od1 ON bk1.bookid = od1.bookid
JOIN customer cs1 ON od1.custid = cs1.custid
WHERE cs1.name NOT LIKE '박지성'
    AND bk1.publisher IN (
        SELECT bk.publisher
        FROM book bk
        JOIN orders od ON bk.bookid = od.bookid
        JOIN customer cs ON od.custid = cs.custid
        WHERE cs.name = '박지성'
    );
-- ANSI SQL
select distinct name
from orders od1
inner join book bk1 on od1.bookid = bk1.bookid
inner join customer cs1 on od1.custid = cs1.custid and cs1.name not like '박지성'
and bk1.publisher in (select publisher from orders od
                        inner join book bk on od.bookid = bk.bookid
                        inner join customer cs on od.custid = cs.custid 
                        and cs.name like '박지성');
                        
-- 두개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
select name
from customer cs1
where 2 <= (select count(DISTINCT publisher)
            from orders od,customer cs2,book bk
            where bk.bookid=od.bookid and od.custid=cs2.custid and(cs1.name=cs2.name));
            
-- 전체 고객의 30% 이상이 구매한 도서
select bookname
from book bk1
where ((select count(bk2.bookid)
            from book bk2,orders od
            where bk2.bookid=od.bookid and bk1.bookid=bk2.bookid) 
            >= 0.3 *(select count(*)from customer));
    
