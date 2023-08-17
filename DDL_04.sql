-- �⺻Ű�� �ϳ��� ���� �� �÷��� ��ð� ���������� 2�� �̻��ϰ��� ��ȣ�� ����Ͽ� ����Ű�� �����Ѵ�.
create table NewBook(
bookname varchar2(20),
publisher VARCHAR2(20),
price number,
PRIMARY KEY(bookname,publisher));

-- UNIQUE: �ߺ����� �Է� �Ұ��� 
-- DEFAULT : �԰ݰ��� ���� ��� �⺻������ �� �Է�
-- CHECK : �����Է½� �ּ� �ݾ�
drop table NewBook;


create table NewBook(
bookname varchar2(20) not null,
publisher VARCHAR2(20) UNIQUE,
price number DEFAULT 100 check(price > 3000),
PRIMARY KEY(bookname,publisher));

create table newcustomer(
custid number primary key,
name varchar2(40),
address varchar2(40),
phone varchar2(40)
);

-- on delete cascade : �θ����̺��� �����Ǹ� �ڽ����̺��� �����͵� ����
-- on update cascade(����Ŭ������ ���� �ȵ�=> Ʈ���� ���) : �θ����̺��� ������Ʈ �Ǹ� �ڽ����̺��� �����͵� ������Ʈ
create table neworders(
orderid number,
custid number,
bookid number,
saleprice number,
orderdate date,
PRIMARY KEY(orderid),
foreign key(custid) references newcustomer(custid) on delete cascade );

-- ��������
select * from newbook;
desc newbook;

alter table newbook add inbn VARCHAR2(40); --�Ӽ��߰�
alter table newbook modify inbn number; --�Ӽ�Ÿ�Ժ���
alter table newbook rename column inbn to iss; --�Ӽ��̸�����
alter table newbook drop column iss; --�Ӽ�����

alter table newbook rename to TB_newbook; -- ���̺��̸� ����