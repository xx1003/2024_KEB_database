use madang;

select * from orders;

select custid as '고객번호', 
	round(sum(saleprice) / count(*), -2) as '평균금액'
from orders
group by orders.custid;

-- 두 문자열을 연결함
select CONCAT('마당', ' 서점');

-- 대상 문자열을 모두 소문자로 변환함
select LOWER('MR. SCOTT');

-- 대상 문자열의 왼쪽부터 지정한 자릿수까지 지정한 문자로 채움
select  LPAD('Page 1', 10, '*');

-- 대상 문자열의 지정한 문자를 원하는 문자로 변경함
select  REPLACE('JACK & JUE', 'J', 'BL');

-- 대상 문자열의 오른쪽부터 지정한 자릿수까지 지정한 문자로 채움
select  RPAD('AbC', 5, '*');

-- 대상 문자열의 지정된 자리에서부터 지정된 길이만큼 잘라서 반환함
select  SUBSTR('ABCDEFG', 3, 4);

-- 대상 문자열의 양쪽에서 지정된 문자를 삭제함(문자열만 넣으면 기본값으로 공백 제거)
select  TRIM('=' FROM '==BROWNING==');

-- 대상 문자열을 모두 대문자로 변환함
select  UPPER('mr. scott');

-- 대상 알파벳 문자의 아스키코드 값을 반환함
select  ASCII('D') ;

-- 대상 문자열의 byte를 반환함(알파벳은 1byte, 한글은 3byte(UTF-8))
select  LENGTH('CANDIDE');
select  LENGTH('대한 민국');

-- 문자열의 문자 수를 반환함
select  CHAR_LENGTH('데이터');
select  CHAR_LENGTH('APPLE');


select * from Book;

SELECT	bookid, REPLACE(bookname, '야구', '농구') bookname, publisher, 
		price
FROM	Book;

# [4-5]
SELECT 	bookname '제목', CHAR_LENGTH(bookname) '문자수',	
		LENGTH(bookname) '바이트수'
FROM 	Book
WHERE 	publisher='굿스포츠';

select substr(name, 1, 1) as '성', count(*) as '인원'
from customer
group by substr(name, 1, 1);

select * from orders;

select orderid '주문번호', orderdate '주문일', 
adddate(orderdate, interval 10 day) '확정일'
from orders;


# [4-8]
SELECT	orderid '주문번호', 
DATE_FORMAT(orderdate, '%Y-%m-%d') '주문일', 
#orderdate '주문일',
custid '고객번호', bookid '도서번호'
FROM	Orders
WHERE	orderdate= STR_TO_DATE('20240707', '%Y%m%d');

# date -> string
SELECT SYSDATE(),
DATE_FORMAT(SYSDATE(), '%Y/%m/%d %a %h:%i')  'SYSDATE_시스템날짜시간';

create table Mybook(
	bookid integer,
	price integer
    );
    
insert into Mybook values(1, 10000);
insert into Mybook values(2, 20000);    
insert into Mybook values(3, NULL);
select * from Mybook;
commit;

select sum(price), avg(price), count(*), count(price)	# NULL 안 세짐
from Mybook;

select sum(price), avg(price), count(*)	# NULL 안 세짐
from Mybook
where bookid >= 4;

select * from mybook 
where price is NULL;

select * from mybook	# 공백 != NULL
where price = ' ';

select bookid, price+100
from Mybook
where bookid = 3;

select * from Customer;
SELECT	name '이름', IFNULL(phone, '연락처없음') '전화번호' 
FROM	Customer;

set @seq:=0;
select (@seq:=@seq+1) '연번', custid, name, phone
from customer
where @seq < 2;

select orderid, custid, saleprice
from orders od1
where saleprice > (select avg(saleprice)
					from orders od2
                    where od1.custid = od2.custid);

select sum(saleprice) 'total'
from orders
where custid in (select custid
				from customer
				where address like '%대한민국%');

select * from orders;
select orderid, saleprice
from orders
where saleprice > all (select saleprice
						from orders
                        where custid = 3);
                        
select sum(saleprice) 'total'
from orders od
where exists (select *
				from customer cs
                where address like '%대한민국%' and od.custid = cs.custid);
                
select sum(saleprice) 'total'
from orders
where custid in (select custid
				from customer
                where address like '%대한민국%');
                
select (select name
		from customer cs
        where cs.custid = od.custid ) 'name', 
        sum(saleprice) 'total'
from orders od
group by od.custid;


alter table orders add bname varchar(40);
select * from orders;

update orders
set bname = (select bookname
			from book
            where book.bookid = orders.bookid);
            
select * from book;           