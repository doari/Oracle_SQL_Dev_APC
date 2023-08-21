-- book���̺����� ���� ��� ������ ���̽ÿ�
select MAX(price)
from book;

select * from customer;
select * from orders;
-- book���̺����� ���� ��� ������ �����̸��� ���̽ÿ�.

SELECT bookname
FROM book
WHERE price = (SELECT MAX(price) FROM book);

-- IN
SELECT bookname
FROM book
WHERE price IN (SELECT MAX(price) FROM book);

-- ������ ������ ���� �ִ� ������ �̸��� ���̽ÿ�
select custid,name
from customer
where custid IN (select custid from orders);

-- �½��������� ������ ������ ������ ���� �ִ� ������ �̸��� ���̽ÿ�
select * from book;

select name
from customer
where custid IN (select custid 
                from orders
                where bookid IN (select bookid
                                 from book
                                 where publisher='�½�����'));
                                 
                                 
                                 
-- EXISTS (null�� �ڵ�ó��, ã�����ϴ� ���� ã���� �ڵ����� ���� �����  �����ϰ� ���������� ����)
-- �ֹ��� ���� �ִ� ������ �̸��� �ּҸ� ���̽ÿ�
select * from orders od, customer cs
where cs.custid=od.custid;

select name, address
from customer cs
where EXISTS(select * 
            from orders od
            where cs.custid=od.custid);