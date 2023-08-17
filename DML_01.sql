-- DML(Insert into)
-- BOOKTABLE
alter user madang default tablespace USERS quota unlimited on USERS;
INSERT INTO book(bookid,bookname,publisher,price)values(1, '축구의 역사','굿스포츠',13000);
INSERT INTO book values(2, '골때리는 그녀들','나무수',17000);
insert into book values(3, '축구의 이해', '대한미디어', 22000);
INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO Book VALUES(6, '역도 단계별기술', '굿스포츠', 6000);
INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);

SELECT * from book;
------------------------------------------------------------------------------------------------
--CUSTOMER
insert into customer values(1, '박지성', '영국 맨체스타', '010-7894-8569');
INSERT INTO Customer VALUES (2, '김연아', '대한민국 서울', '000-6000-0001');
INSERT INTO Customer VALUES (3, '장미란', '대한민국 강원도', '000-7000-0001');
INSERT INTO Customer VALUES (4, '추신수', '미국 클리블랜드', '000-8000-0001');
INSERT INTO Customer VALUES (5, '박세리', '대한민국 대전', NULL);
INSERT INTO Customer VALUES (6, '박태환', '호주 클리블랜드', '000-8800-0001');
INSERT INTO Customer VALUES (7, '이영지', '대한민국 경기', NULL);

SELECT * from CUSTOMER;
------------------------------------------------------------------------------------------------
--ORDER
INSERT INTO ORDERS VALUES(1,1,1,13000,TO_DATE('2022-07-15','yyyy-mm-dd'));
INSERT INTO ORDERS VALUES(2,1,1,13000,TO_DATE('2022-07-14','yyyy-mm-dd'));
insert into orders values(2,1,3,22000, To_date('2022-07-14','yyyy-mm-dd'));
insert into orders values(3,2,5,13000, To_date('2022-07-14','yyyy-mm-dd'));
insert into orders values(4,3,6,22000, To_date('2022-07-12','yyyy-mm-dd'));
insert into orders values(5,4,7,13000, To_date('2022-07-07','yyyy-mm-dd'));
insert into orders values(6,1,2,22000, To_date('2022-07-07','yyyy-mm-dd'));
insert into orders values(7,4,5,8000, To_date('2022-07-14','yyyy-mm-dd'));
insert into orders values(8,3,6,6000, To_date('2022-07-12','yyyy-mm-dd'));
insert into orders values(9,2,7,20000, To_date('2022-07-07','yyyy-mm-dd'));
insert into orders values(10,3,2,17000, To_date('2022-07-07','yyyy-mm-dd'));
insert into orders values(11,6,8,13000,to_date('2022-07-15','yyyy-mm-dd'));
insert into orders values(12,7,10,13000,to_date('2022-07-12','yyyy-mm-dd'));
insert into orders values(13,6,2,22000,to_date('2022-07-13','yyyy-mm-dd'));

select * from orders;