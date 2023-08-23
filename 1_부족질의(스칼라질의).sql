-- 부속질의(스칼라질의)

-- 구매한 고객의 모든 정보를 보이시오
select *
from orders od, customer cs
where od.custid=cs.custid;

-- 안시
select *
from orders od
inner join customer cs on od.custid=cs.custid;

-- 고객별 판매액을 검색하여 해당 고객의 이름과 판매액을 보이시오
SELECT cs.name , SUM(saleprice)
FROM customer cs, orders od
WHERE cs.custid = od.custid
GROUP BY cs.name;
    
SELECT cs.name , SUM(saleprice)
FROM orders od
inner join customer cs on od.custid=cs.custid
    GROUP BY cs.name
    order by cs.name;
    
-- 스칼라 질의
select od.custid,(SELECT cs.name
                    FROM customer cs
                    WHERE cs.custid = od.custid) name, SUM(saleprice) total
from orders od
GROUP BY od.custid
order by od.custid;
