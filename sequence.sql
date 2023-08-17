drop SEQUENCE SEQ_TEST;
create SEQUENCE SEQ_TEST
START with 1
increment by 1
minvalue 1
maxvalue 9999
cycle nocache;

create table emp_seq(
id number,
name varchar2(20),
day timestamp with time zone default systimestamp);



-- timastamp : dateŸ���� Ȯ�� (year,month,day,hour,minute,second)
-- with time zone : timestamp�� type���� GMT�� ���� ������ ����
-- default systimestamp : �����ͺ��̽��� �����ϴ� �ý��� �ð��� ����

select * from emp_seq;

insert into emp_seq values(seq_test.nextval,'ȫ�浿',systimestamp);
insert into emp_seq values(seq_test.nextval,'�ۿ��',systimestamp);
insert into emp_seq values(seq_test.nextval,'�糪',systimestamp);


-- �������� ����
alter sequence seq_test increment by 2;
alter sequence seq_test maxvalue 1000;

insert into emp_seq values(seq_test.nextval,'������',systimestamp);
insert into emp_seq values(seq_test.nextval,'�̺���',systimestamp);
insert into emp_seq values(seq_test.nextval,'������',systimestamp);

-- ���� ������
drop sequence SEQ_TEST2;
create SEQUENCE SEQ_TEST2
START with 1000
increment by -1
minvalue 1
maxvalue 1000
nocache
nocycle;


drop table emp_seq2;
create table emp_seq2(
id number,
name varchar2(20),
day timestamp with time zone default systimestamp);

select * from emp_seq2;

insert into emp_seq2 values(SEQ_TEST2.nextval,'ȫ�浿',default);
insert into emp_seq2 values(SEQ_TEST2.nextval,'�ۿ��',default);
insert into emp_seq2 values(SEQ_TEST2.nextval,'�糪',default);

/*
start with : �������� ���۰�
increment by : ������
minvalue 1 :�Ӱ豸���� �ּҰ�
maxvalue 9999 :�Ӱ豸���� �ִ밪
cycle : 9999���� ��� �ٽ� 1���� �ݺ�
nocache : �ӵ����
nocycle : �ݺ�����
cache : ������ ���� ������ ��� ������
*/
