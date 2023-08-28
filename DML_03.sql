-- INSERT INTO

-- �κл���
SELECT* from book;
desc book;
INSERT INTO BOOK(bookid,bookname,publisher) VALUES(14,'������ ����','��������');

-- �뷮 ���� (bulk insert)
select * from imported_book;

-- book���̺��� ��� �����͸� IMPORTED_BOOK���� ����
insert into imported_book(bookid,bookname,publisher,price)
select bookid,bookname,publisher,price
from book;
-- �÷����� ����Ͽ� bookid 7���� 14�������� �����͸� ����
insert into imported_book(bookid,bookname,publisher,price)
select bookid,bookname,publisher,price
from book
where bookid BETWEEN 7 and 14;
-- �÷����� ����Ͽ� bookid 1���� 3�������� �����͸� ����
insert into imported_book
select bookid,bookname,publisher,price
from book
where bookid BETWEEN 1 and 3;

delete from imported_book;

-- ================================================================================
-- update
select * from customer;
update customer set address= '���ѹα� �д�'
where custid=5;

select address
from customer
where name = '�迬��';

update customer
set address=(select address from customer where name ='�迬��')
where name like '�ڼ���';

select * from orders;
alter table orders add bookname varchar2(40);

-- �����ϱ�
update orders
set bookname=(select bookname 
                    from book
                        where book.bookid=orders.bookid);
                        
alter table orders drop column bookname;

-- DELETE
select *
from imported_book order by bookid;
delete from imported_book where bookid=14;

delete from imported_book;

-- ORDER BY (����)
select *
from book
order by price DESC, publisher ASC;

-- �����Լ�
select Sum(saleprice) as �Ѹ���
from orders;

-- ���� �ֹ��� ������ �� �Ǹž�, �ִ밪, �ּڰ��� ���Ͻÿ�.
SELECT
    SUM(saleprice) as Total,
    AVG(saleprice) as Average,
    MAX(saleprice) as Maximun,
    MIN(saleprice) as Minimun
FROM orders;
-- orders�� ����� ����
select * from orders;
-- Ʃ���� �������� 
select count(orderid)
from orders;

-- ��ü Ʃ���� ����
select count(*)
from orders;

-- ���� �ǸŰ����� 20000�� �̻��� �Ǽ��� ���̽ÿ�
-- where ��
SELECT
    COUNT(*) AS �ǸŰ���_20000��_�̻���_�Ǽ�
FROM
    orders
WHERE
    saleprice >= 20000;
    
-- case when then ���
SELECT count(
(case when saleprice >= 20000 then 1 end)) as VIP
FROM orders;

-- ���� �ǸŰ����� 20000�� �̻��� �Ǽ��� 10000������ �Ǽ��� ���Ͻÿ�
SELECT count((case when saleprice >= 20000 then 1 end)) as VIP,
       count((case when saleprice < 10000 then 1 end)) as cs
FROM orders;

-- GROUP BY
-- ������ �ֹ��� ������ �� ������ �� �Ǹž��� ���̽ÿ�
select custid, count(*) ��������, SUM(saleprice) as "�� �Ǹž�"
from orders
group by custid
order by custid; --������� ����

-- ������ 15000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ������� �� ������ ���̽ÿ�
select custid,count(case when saleprice >= 15000 then 1 end) as "15000�� �̻��� ����"
from orders
group by custid
order by custid; --������� ����

-- ������ 15000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ������� �� ������ ���̽ÿ�
-- (�� 2���̻� ������ ���� ���)-- �׷���� ������ having
select custid,count(case when saleprice >= 15000 then 1 end) as "15000�� �̻��� ����"
from orders
where saleprice >=15000
group by custid
having count(*)>=2 -- �׷���� ������ having
order by custid; --������� ����
-- ������ 15000�� �̻��� ������ ������ ���� ���Ͽ� ���� �ֹ������� �� ������ ���̽ÿ�
-- (�� 2���̻� ������ ���� ���)-- �׷���� ������ having
select custid,count(*) as "15000�� �̻��� ����"
from orders
where saleprice >=15000 --1
group by custid
having count(*)>=2
order by custid; --2