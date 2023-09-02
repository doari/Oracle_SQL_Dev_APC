-- 정규화
drop table summer;

create table summer(
sid number,
class varchar2(40),
price number
);

insert into summer values(100,'JAVA',50000);
insert into summer values(150,'ORACLE',45000);
insert into summer values(200,'JSP',30000);
insert into summer values(250,'JAVA',50000);

select *from summer;

--삭제 이상현상
-- JSP 강좌의 수강료 조회
select price
from summer
where class like 'JSP';

-- 200번 학생이 수강신청을 취소
delete from summer
where sid=200;

commit;

-- 삽입 이상현상
-- API강좌 개설
insert into summer values(null,'API',25000);
select *from summer;

--전체 수강인원
select count(*) 수강인원
from summer;
-- 정상출력
select count(sid) 수강인원
from summer;

--IS NOT NULL
select count(*) 수강인원
from summer
where sid is not null;

commit;

-- 업데이트 이상현상
update summer set price= 40000
where class like 'JAVA';
select *from summer;

-- JAVA 수강료 문의
select DISTINCT price
from summer
where class like 'JAVA';

-- 만약 update문을 잘못 작성하면 데이터의 일관성이 불일치하는 이상현상이 발생
update summer set price= 35000
where class like 'JAVA' and sid=100;
select *from summer;