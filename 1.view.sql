-- VIEW


grant create view, create sequence to guest;
select * from customer;
select custid, name,address
from customer
where address like '%����%';
-- VIEW ����
create or REPLACE view VW_customer(name,address)
as
select name,address
from customer
where address like '%����%';

select * from vw_customer;

--VIEW ����
drop view vw_customer;
-- �ǸŰ����� 20000�� �̻��� ������ ������ȣ,�����̸�, ���̸�, ���ǻ�, �ǸŰ����� �����ִ� view�� �����Ͻÿ�
create or REPLACE view bk_book
as
select od.bookid,bookname,name,publisher,saleprice
from orders od
INNER JOIN book bk on bk.bookid=od.bookid
INNER JOIN customer cs on cs.custid=od.custid
where saleprice >= 15000;

select bk.bookid, bk.bookname, cs.name, bk.publisher, bk.price
from book bk
inner join orders od on od.bookid = bk.bookid
inner join customer cs on cs.custid = od.custid
where saleprice >= 20000;

select * from bk_book;
-- view(vw_book) '�౸'��� ���ڰ� �� ������ ��� ������ ���̽ÿ�
create or replace view vw_book
as
select *
from book
where bookname like '%�౸%';

select * from vw_book;

-- view insert
insert into vw_book values(20,'�౸�� ���','�ֵ���ũ',23000);
select * from book;

insert into book values(21,'�ø��� �౸�̾߱� ','�ֵ���ũ',32000);

-- view update
update vw_book SET bookname='������ �౸' where bookid like 20;

-- view delete
delete from vw_book where bookid =20;