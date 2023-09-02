-- summerprice 테이블
create table summerprice(
class varchar2(40),
price number);

insert into summerprice values('JAVA',50000);
insert into summerprice values('JSP',45000);
insert into summerprice values('Spring',80000);
select * from summerprice;
-- summerEnroll
create table summerEnroll(
sid number,
class varchar2(40));

insert into summerEnroll values(100,'JAVA');
insert into summerEnroll values(150,'JSP');
insert into summerEnroll values(200,'Spring');
insert into summerEnroll values(250,'JAVA');
select * from summerEnroll;

--검색
--spring의 수강료를 보이시오

select price 수강료
from summerprice
where class like 'Spring';
--삭제
-- Spring의 수강 취소
delete from summerEnroll
where sid=200;

select * from summerEnroll;
--spring의 수강료를 보이시오
select price 수강료
from summerprice
where class like 'Spring';

--삽입
insert into summerprice values('JS',25000);

-- 수강 등록한 학생의 인원을 출력
select count(*)
from summerEnroll;

--업데이트
update summerprice
set price=40000
where class like 'JAVA';

-- 강좌에 대한 정상적인 정보 출력
select price 수강료
from summerprice 
where class like 'JAVA';

-- 정규화
-- 제1정규화(원자값제거)
-- 제2정규화(부분종속제거)
-- 제3정규화(이행적종속제거) => BCNF
