-- DML(Data Manipulation Language) : 데이터 조작언어
/*
select : 데이터 조회
insert : 데이터 삽입
update : 데이터 수정 or 갱신
delete : 데이터 삭제
*/

select * from book;
select * from customer;
select * from orders;

-- Book 테이블에서 가격이(price) 20000원 이상인 데이터의 도서이름,출판사,가격
SELECT bookname,publisher, price
FROM Book
WHERE price >= 20000;

-- book테이블에서 모든 도서의 도서이름과 가격만 출력
SELECT bookname, price
FROM Book;

-- book테이블에서 모든 도서의 도서이름과 가격만 출력(중복설 제거)
SELECT DISTINCT bookname, price
FROM Book;

-- 가격이 15000원 이상 23000원 이하인 도서의 모든 정보 출력
SELECT *
FROM Book
WHERE price >= 15000 AND price <= 23000;

SELECT *
FROM Book
WHERE price BETWEEN 15000 AND 23000;

-- book테이블에서 축구의 역사를 출간한 출판사와 도서의 가격을 보이시오
SELECT publisher, price
FROM Book
WHERE bookname = '축구의 역사';

-- 패턴
SELECT publisher, price
FROM Book
WHERE bookname like '축구의 역사';

-- book테이블에서 야구에 관한 도서의 모든 정보를 보이시오
select * 
from book 
where bookname like '%야구%';

-- 도서가격의 합계
SELECT SUM(price) "도서가격 총액"
FROM Book;
-- 도서가격중 가장 비싼도서
SELECT MAX(price) 최고가
FROM Book;
--도서가격중 가장 저가인것
SELECT MIN(price) 최저가
FROM Book;
