drop SEQUENCE SEQ_TEST;
create SEQUENCE SEQ_TEST
START with 1
increment by 1
minvalue 1
maxvalue 9999
cycle nocache;

create table emp_seq(
id number,
name varchar2(20),
day timestamp with time zone default systimestamp);



-- timastamp : date타입이 확장 (year,month,day,hour,minute,second)
-- with time zone : timestamp의 type으로 GMT를 기준 시차로 적용
-- default systimestamp : 데이터베이스가 존재하는 시스템 시간에 맞춤

select * from emp_seq;

insert into emp_seq values(seq_test.nextval,'홍길동',systimestamp);
insert into emp_seq values(seq_test.nextval,'송우기',systimestamp);
insert into emp_seq values(seq_test.nextval,'사나',systimestamp);


-- 시퀀스의 수정
alter sequence seq_test increment by 2;
alter sequence seq_test maxvalue 1000;

insert into emp_seq values(seq_test.nextval,'안유진',systimestamp);
insert into emp_seq values(seq_test.nextval,'이병건',systimestamp);
insert into emp_seq values(seq_test.nextval,'오영택',systimestamp);

-- 감소 시퀀스
drop sequence SEQ_TEST2;
create SEQUENCE SEQ_TEST2
START with 1000
increment by -1
minvalue 1
maxvalue 1000
nocache
nocycle;


drop table emp_seq2;
create table emp_seq2(
id number,
name varchar2(20),
day timestamp with time zone default systimestamp);

select * from emp_seq2;

insert into emp_seq2 values(SEQ_TEST2.nextval,'홍길동',default);
insert into emp_seq2 values(SEQ_TEST2.nextval,'송우기',default);
insert into emp_seq2 values(SEQ_TEST2.nextval,'사나',default);

/*
start with : 시퀀스의 시작값
increment by : 증가값
minvalue 1 :임계구역의 최소값
maxvalue 9999 :임계구역의 최대값
cycle : 9999까지 찍고 다시 1부터 반복
nocache : 속도향상
nocycle : 반복없음
cache : 이전에 사용된 영역을 계속 유지함
*/
