-- NULL

create table mybook(
bookid number,
price number);

insert into mybook values(1,10000);
insert into mybook values(2,20000);
insert into mybook values(3,null);
insert into mybook values(4,25000);
insert into mybook values(5,15000);
insert into mybook values(5,18500);
insert into mybook values(5,17800);
insert into mybook values(5,null);

select * from mybook;

-- 5�� ������ ���� �հ� ,���,������ ���̽ÿ�
select sum(price),avg(price),count(price)
from mybook
where bookid = 5;

-- NULL/ NULL ����
select * from mybook
where price is null;

select * from mybook
where price is not null;

select * from customer;

-- null ���� ��ü�ϴ� �޼ҵ�
select name ����,NVL(phone,'��ȣ���� ����') ��ȭ��ȣ
from customer;

-- �����÷� Ȱ��
select ROWNUM ����,custid,name,phone
from customer
where ROWNUM <=3;