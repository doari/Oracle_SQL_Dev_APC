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
EXEC insertbook(25,'스포츠과학','과학문고',25000);
select * from book;


create or REPLACE PROCEDURE bookinsertorupdate(
mybookid number,
mybookname varchar2,
mypublisher varchar2,
myprice int)
as
mycount number; -- 지역변수
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
exec bookinsertorupdate(20, '스포츠의 즐거움', '솔데스크스포츠',20000);
-- 삭제
drop procedure bookinsertorupdate;