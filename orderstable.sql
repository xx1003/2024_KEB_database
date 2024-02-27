create  database  madang;
use madang;

create table Orders(
	orderid integer primary	key ,
	custid integer references Customer(custid),
    bookid integer references Book(bookid) ,
    saleprice integer , 
    orderdate date );

INSERT INTO Orders VALUES (1, 1, 1, 6000, STR_TO_DATE('2024-07-01','%Y-%m-%d'));
INSERT INTO Orders VALUES (2, 1, 3, 21000, STR_TO_DATE('2024-07-03','%Y-%m-%d'));
INSERT INTO Orders VALUES (3, 2, 5, 8000, STR_TO_DATE('2024-07-03','%Y-%m-%d'));
INSERT INTO Orders VALUES (4, 3, 6, 6000, STR_TO_DATE('2024-07-04','%Y-%m-%d'));
INSERT INTO Orders VALUES (5, 4, 7, 20000, STR_TO_DATE('2024-07-05','%Y-%m-%d'));
INSERT INTO Orders VALUES (6, 1, 2, 12000, STR_TO_DATE('2024-07-07','%Y-%m-%d'));
INSERT INTO Orders VALUES (7, 4, 8, 13000, STR_TO_DATE('2024-07-07','%Y-%m-%d'));
INSERT INTO Orders VALUES (8, 3, 10, 12000, STR_TO_DATE('2024-07-08','%Y-%m-%d'));
INSERT INTO Orders VALUES (9, 2, 10, 7000, STR_TO_DATE('2024-07-09','%Y-%m-%d'));
INSERT INTO Orders VALUES (10, 3, 8, 13000, STR_TO_DATE('2024-07-10','%Y-%m-%d'));
SELECT * FROM Orders;

select sum(saleprice) from Orders; 

select name from Customer
	where address like '대한민국%' and 
		name not in ( 
			select name from Customer
				where custid IN(select custid from Orders) );	# 박세리 출력

select name from Customer
where address like '대한민국%' and 
		name in ( select name from Customer
			where custid IN(select custid from Orders) );	# 김연아, 김연경
            
select name, address from Customer AS cs
where exists ( select * from Orders AS od
				where cs.custid = od.custid );
                
select name, address from Customer cs
where exists ( select * from Orders od
				where cs.custid = od.custid );
                
CREATE TABLE 	NewBook (
  bookname		VARCHAR(20)	NOT NULL,
  publisher		VARCHAR(20)	UNIQUE,
  price		INTEGER DEFAULT 10000 CHECK(price > 1000),
  PRIMARY KEY	(bookname, publisher));
  
drop table NewBook;

CREATE TABLE	NewBook (
  bookid		INTEGER	PRIMARY KEY,
  bookname		VARCHAR(20),
  publisher		VARCHAR(20),
  price		INTEGER);
  
drop table newbook;

CREATE TABLE 	NewBook (
  bookname		VARCHAR(20),
  publisher		VARCHAR(20),
  price 		INTEGER,
  PRIMARY KEY	(bookname, publisher));
  
drop table newbook;

CREATE TABLE	NewCustomer (
  custid		INTEGER	PRIMARY KEY,
  name			VARCHAR(40),
  address		VARCHAR(40),
  phone			VARCHAR(30));
  
  
CREATE TABLE NewOrders (
  orderid	INTEGER,
  custid	INTEGER	NOT NULL,
  bookid	INTEGER	NOT NULL,
  saleprice	INTEGER,
  orderdate	DATE,
  primary key(orderid),
  foreign key(custid) references NewCustomer(custid)
  on delete cascade,
  foreign key(bookid) references NewBook(bookid)
  on delete cascade
  );
  
select * from NewBook;
alter table NewBook add isbn varchar(13);
alter table NewBook modify isbn integer;
alter table NewBook drop column isbn;


drop table NewOrders;
drop table NewBook;
CREATE TABLE	NewBook (
  bookid		INTEGER	PRIMARY KEY,
  bookname		VARCHAR(20),
  publisher		VARCHAR(20),
  price		INTEGER);
  
alter table NewBook modify bookname varchar(20) not null;

alter table NewBook Drop primary key;
alter table Newbook add primary key(bookid);

insert into Book VALUES (11, '스포츠 의학', '한솔의학서적', 90000);
INSERT INTO Book VALUES (12, '스포츠 의학', '한솔의학서적', 90000);
INSERT INTO Book(bookid, bookname, price, publisher) VALUES (13, '스포츠 의학', 90000, '한솔의학서적');	# 순서 바꿔도 ㄱㅊ
INSERT INTO Book(bookid, bookname, publisher) VALUES (14, '스포츠 의학', '한솔의학서적');

CREATE TABLE Imported_Book (
  bookid		INTEGER,
  bookname	VARCHAR(40),
  publisher	VARCHAR(40),
  price		INTEGER
);
INSERT INTO Imported_Book VALUES(21, 'Zen Golf', 'Pearson', 12000);
INSERT INTO Imported_Book VALUES(22, 'Soccer Skills', 'Human Kinetics', 15000);

SELECT * FROM	Imported_Book;
select * from Book;

insert into Book(bookid, bookname, publisher, price)
	select bookid, bookname, publisher, price from imported_book;
    
select * from Customer;

update Customer
set address = '대한민국 부산'
where custid = 5;