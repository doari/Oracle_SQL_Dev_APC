-- �����Լ�

-- ABS(���밪)
select ABS(-88), ABS(88)
from dual; -- ����Ŭ���� �ִ� ���� ���̺�

--ROUND(�ݿø� ���� ����)
select ROUND(4.879, 1)
from dual;


select custid "�� ��ȣ",ROUND(SUM(saleprice)/count(*),2) " ��� �ݾ�"
from orders
group by custid;

-- �����Լ�
select * from book;
select bookid, REPLACE(bookname, '�߱�', '��') bookname, publisher
from book;

select bookname "����", LENGTH(bookname) "���ڼ�", LENGTHB(bookname) "����Ʈ"
from book
where publisher like '�½�����';

select SUBSTR(name, 1,1) "��", count(*) "�ο�"
from customer
group by SUBSTR(name, 1,1);

-- ��¥�Լ�
select orderdate
from orders;

select orderid, orderdate �ֹ���, orderdate+7 ��ۿϷ�
from orders;

-- TO_DATE : ���������� �Էµ� ��¥�� -> ��¥������ Ÿ�� ����
-- TO_CHAR : ��¥������ �Էµ� ��¥�� -> ���������� Ÿ�� ����

select * from orders;

select orderid, to_char(orderdate,'mm-dd dy') �ֹ���,custid,bookid
from orders
where orderdate=to_date('20220707','yyyymmdd');
--��+
select ADD_MONTHS(TO_DATE('2022-08-11','yyyy-mm-dd'),3)
from dual;
-- ��������
select LAST_DAY(TO_DATE('2022/02/14','yyyy/mm/dd'))
from dual;

-- ��¥ �ð�
select systimestamp from dual;
-- ��¥��
select sysdate from dual;

select sysdate, TO_CHAR(sysdate, 'yyyy/mm/dd hh12:mi:ss') systm
from dual;

select sysdate, TO_CHAR(sysdate, 'yyyy/mm/dd hh24:mi:ss') systm
from dual;