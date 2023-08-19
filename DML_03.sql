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