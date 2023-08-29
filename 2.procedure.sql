-- PROCEDURE
-- insert
create or replace procedure insertbook(
mybookid in number,
mybookname in varchar2,
mypublisher in varchar2,
myprice in number)
as
begin
    insert into book(bookid,bookname,publisher,price)
    values(mybookid,mybookname,mypublisher,myprice);
end;
/
EXEC insertbook(25,'����������','���й���',25000);
select * from book;


create or REPLACE PROCEDURE bookinsertorupdate(
mybookid number,
mybookname varchar2,
mypublisher varchar2,
myprice int)
as
mycount number; -- ��������
begin
select count(*) into mycount from book
where bookname like mybookname;
    if mycount !=0 then
        update book set price=myprice
        where bookname like mybookname;
    else
        insert into book(bookid, bookname, publisher, price)
        values(mybookid,mybookname, mypublisher, myprice);
    end if; -- if
end; -- procedure
/
exec bookinsertorupdate(20, '�������� ��ſ�', '�ֵ���ũ������',20000);
-- ����
drop procedure bookinsertorupdate;