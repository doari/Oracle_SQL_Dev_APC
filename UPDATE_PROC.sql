-- UPDATE ���ν���

create or replace procedure UPDATE_PROC(
B_bookid in number,
B_bookname in VARCHAR2,
B_publisher in varchar2,
B_price in number
)
IS
BEGIN
update book
set bookname=B_bookname, publisher=B_publisher, price=B_price
where bookid=B_bookid;
end;
/
select * from book;
EXECUTE UPDATE_PROC(20,'�������� ����','�ֵ���ũ',22500);


-- customer ���̺��� ���� ���̵� ������ �����̸�, �ּ�, ��ȭ��ȣ�� ��� ������Ʈ�ϴ� ���ν���
create or replace procedure UPDATE_CS(
    B_custid in NUMBER,
    B_name in VARCHAR2,
    B_address in VARCHAR2,
    B_phone in VARCHAR2
)
is
BEGIN
update customer
set name=B_name,address=B_address, phone=B_phone
where custid=B_custid;
end;
/

EXEC UPDATE_CS(1,	'������'	,'���� ���α�','010-7894-8569'); -- �������� �ּҸ� ����
select * from customer;