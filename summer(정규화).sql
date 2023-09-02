-- ����ȭ
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

--���� �̻�����
-- JSP ������ ������ ��ȸ
select price
from summer
where class like 'JSP';

-- 200�� �л��� ������û�� ���
delete from summer
where sid=200;

commit;

-- ���� �̻�����
-- API���� ����
insert into summer values(null,'API',25000);
select *from summer;

--��ü �����ο�
select count(*) �����ο�
from summer;
-- �������
select count(sid) �����ο�
from summer;

--IS NOT NULL
select count(*) �����ο�
from summer
where sid is not null;

commit;

-- ������Ʈ �̻�����
update summer set price= 40000
where class like 'JAVA';
select *from summer;

-- JAVA ������ ����
select DISTINCT price
from summer
where class like 'JAVA';

-- ���� update���� �߸� �ۼ��ϸ� �������� �ϰ����� ����ġ�ϴ� �̻������� �߻�
update summer set price= 35000
where class like 'JAVA' and sid=100;
select *from summer;