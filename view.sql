select * from book;
select * from customer;
select * from orders;

create view Vorders
as select o.orderid, o.custid, c.name, b.bookid, b.bookname,
			o.saleprice, o.orderdate
from orders o, book b, customer c
where o.custid = c.custid and o.bookid = b.bookid;


select * from Vorders;

create view vw_book
as select *
from book
where bookname like '%축구%';

select * from vw_book;

create view vw_customer
as select *
from customer
where address like '%대한민국%';

select * from vw_customer;

create view vw_orders
as select o.orderid, o.custid, c.name, b.bookid, b.bookname,
			o.saleprice, o.orderdate
from orders o, customer c, book b
where o.custid = c.custid and o.bookid = b.bookid;

select orderid, bookname, saleprice
from vw_orders
where name = '김연아';

select * from highorders;

drop view highorders;