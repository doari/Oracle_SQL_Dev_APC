-- works
commit;
insert into works values(1,1,3);
insert into works values(1,2,1);
insert into works values(2,3,1);
insert into works values(2,4,5);
insert into works values(1,5,1);
-- 사원관리

select * from department;
select * from employee;
select * from project;
select * from works;

------------------
-- 모든 사원의 이름을 보이시오
select name from employee;
-- 여자 사원의 이름을 보이시오
select name from employee where gender like '여';
-- 홍길동 팀장(manager)의 사원 empno,name를 보이시오(중첩질의)
select empno,name
from employee
where deptno IN (select deptno
                from department where manager like '홍길동');
-- '홍길동' 팀장(MANAGER)부서에서 일하는 사원의 수를 보이시오(중첩질의)
select count(name) 사원수
from employee
where name != '홍길동'and deptno IN (select deptno
                from department where manager like '홍길동');
-- 'IT'부서에서 일하는 사원의 이름과 주소를 보이시오(조인)
select empno,name
from employee
where deptno IN (select deptno
                from department where deptname like 'IT');
-- 부서번호와 부서별 사원들의 일한 시간 수를 보이시오.조인(단,부서별 오름차순)
select deptno,sum(hoursworked)
from employee em,works wk
where em.empno=wk.empno
group by em.deptno;
-- 두 명 이상의 사원이 참여한 프로젝트의 번호,이름,사원의 수를 보이시오 (조인,HAVING)
select * from project;
select * from employee;

select projno,projname,count(name) 사원수
from project pr,employee em
where pr.deptno=em.deptno
group by pr.projno,pr.projname -- 프로젝트 이름과 번호가 하나만 존재하므로 같이 그룹으로 실현
having count(*)>=2;
-- 세 명 이상의 사원이 있는 부서의 사원 이름을 보이시오.(중첩질의 또는 조인)
select name
from employee em1,department de1
where de1.deptno=de1.deptno
and deptname IN (select deptname
                from department de2,employee em2
                where de2.deptno=em2.deptno
                group by deptname
                having count(*)>=3);