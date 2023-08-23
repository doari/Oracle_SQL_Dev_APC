-- �μ�����(��Į������)

-- ������ ���� ��� ������ ���̽ÿ�
select *
from orders od, customer cs
where od.custid=cs.custid;

-- �Ƚ�
select *
from orders od
inner join customer cs on od.custid=cs.custid;

-- ���� �Ǹž��� �˻��Ͽ� �ش� ���� �̸��� �Ǹž��� ���̽ÿ�
SELECT cs.name , SUM(saleprice)
FROM customer cs, orders od
WHERE cs.custid = od.custid
GROUP BY cs.name;
    
SELECT cs.name , SUM(saleprice)
FROM orders od
inner join customer cs on od.custid=cs.custid
    GROUP BY cs.name
    order by cs.name;
    
-- ��Į�� ����
select od.custid,(SELECT cs.name
                    FROM customer cs
                    WHERE cs.custid = od.custid) name, SUM(saleprice) total
from orders od
GROUP BY od.custid
order by od.custid;
