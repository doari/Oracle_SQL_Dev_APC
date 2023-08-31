-- UPDATE 프로시저

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
EXECUTE UPDATE_PROC(20,'스포츠의 계절','솔데스크',22500);


-- customer 테이블에서 고객의 아이디가 같으면 고객의이름, 주소, 전화번호를 모두 업데이트하는 프로시저
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

EXEC UPDATE_CS(1,	'박지성'	,'서울 종로구','010-7894-8569'); -- 박지성의 주소를 수정
select * from customer;