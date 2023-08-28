-- 수학함수

-- ABS(절대값)
select ABS(-88), ABS(88)
from dual; -- 오라클에서 주는 가상 테이블

--ROUND(반올림 값을 구함)
select ROUND(4.879, 1)
from dual;


select custid "고객 번호",ROUND(SUM(saleprice)/count(*),2) " 평균 금액"
from orders
group by custid;

-- 문자함수
select * from book;
select bookid, REPLACE(bookname, '야구', '농구') bookname, publisher
from book;

select bookname "제목", LENGTH(bookname) "글자수", LENGTHB(bookname) "바이트"
from book
where publisher like '굿스포츠';

select SUBSTR(name, 1,1) "성", count(*) "인원"
from customer
group by SUBSTR(name, 1,1);

-- 날짜함수
select orderdate
from orders;

select orderid, orderdate 주문일, orderdate+7 배송완료
from orders;

-- TO_DATE : 문자형으로 입력된 날짜를 -> 날짜형으로 타입 변경
-- TO_CHAR : 날짜형으로 입력된 날짜를 -> 문자형으로 타입 변경

select * from orders;

select orderid, to_char(orderdate,'mm-dd dy') 주문일,custid,bookid
from orders
where orderdate=to_date('20220707','yyyymmdd');
--달+
select ADD_MONTHS(TO_DATE('2022-08-11','yyyy-mm-dd'),3)
from dual;
-- 마지막날
select LAST_DAY(TO_DATE('2022/02/14','yyyy/mm/dd'))
from dual;

-- 날짜 시간
select systimestamp from dual;
-- 날짜만
select sysdate from dual;

select sysdate, TO_CHAR(sysdate, 'yyyy/mm/dd hh12:mi:ss') systm
from dual;

select sysdate, TO_CHAR(sysdate, 'yyyy/mm/dd hh24:mi:ss') systm
from dual;