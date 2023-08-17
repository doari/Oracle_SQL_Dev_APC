-- Madang 데이터베이스
CREATE TABLE Book (
    bookid NUMBER(2) PRIMARY KEY,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);

CREATE TABLE Orders (
    orderid NUMBER(2) PRIMARY KEY,
    custid NUMBER(2) REFERENCES Customer(custid),
    bookid NUMBER(2) REFERENCES Book(bookid),
    saleprice NUMBER(8) ,
    orderdate DATE
);

CREATE TABLE Customer (
    custid NUMBER(2) PRIMARY KEY,
    name VARCHAR2(40),
    address VARCHAR2(50),
    phone VARCHAR2(20)
);
-- Improted_Book(bookid(정수),bookname(문자열40),publisher(문자열40),price(정수 8))
CREATE TABLE Imported_Book (
    bookid NUMBER,
    bookname VARCHAR2(40),
    publisher VARCHAR2(40),
    price NUMBER(8)
);
-------------------------------------------------------------------
commit;