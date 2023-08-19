-- DML(Data Manipulation Language) : ������ ���۾��
/*
select : ������ ��ȸ
insert : ������ ����
update : ������ ���� or ����
delete : ������ ����
*/

select * from book;
select * from customer;
select * from orders;

-- Book ���̺��� ������(price) 20000�� �̻��� �������� �����̸�,���ǻ�,����
SELECT bookname,publisher, price
FROM Book
WHERE price >= 20000;

-- book���̺��� ��� ������ �����̸��� ���ݸ� ���
SELECT bookname, price
FROM Book;

-- book���̺��� ��� ������ �����̸��� ���ݸ� ���(�ߺ��� ����)
SELECT DISTINCT bookname, price
FROM Book;

-- ������ 15000�� �̻� 23000�� ������ ������ ��� ���� ���
SELECT *
FROM Book
WHERE price >= 15000 AND price <= 23000;

SELECT *
FROM Book
WHERE price BETWEEN 15000 AND 23000;

-- book���̺��� �౸�� ���縦 �Ⱓ�� ���ǻ�� ������ ������ ���̽ÿ�
SELECT publisher, price
FROM Book
WHERE bookname = '�౸�� ����';

-- ����
SELECT publisher, price
FROM Book
WHERE bookname like '�౸�� ����';

-- book���̺��� �߱��� ���� ������ ��� ������ ���̽ÿ�
select * 
from book 
where bookname like '%�߱�%';

-- ���������� �հ�
SELECT SUM(price) "�������� �Ѿ�"
FROM Book;
-- ���������� ���� ��ѵ���
SELECT MAX(price) �ְ�
FROM Book;
--���������� ���� �����ΰ�
SELECT MIN(price) ������
FROM Book;
