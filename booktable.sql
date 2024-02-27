use madang;

-- create user madang@localhost identified by 'madang';
-- grant all privileges on madangdb.* to madang@localhost;
-- commit;

create table Book(
	bookid integer primary key ,
	bookname varchar(40),
    publisher varchar(40),
    price integer
    );

insert into Book(bookid, bookname, publisher, price) 
	values(1, '축구의 역사', '굿스포츠', 7000);
    
insert into Book
	values(2, '축구 아는 여자', '나무수', 13000);

insert into Book
	values(3, '축구의 이해', '대한미디어', 22000);

INSERT INTO Book VALUES(4, '골프 바이블', '대한미디어', 35000);
INSERT INTO Book VALUES(5, '피겨 교본', '굿스포츠', 8000);
INSERT INTO Book VALUES(6, '배구 단계별기술', '굿스포츠', 6000);
INSERT INTO Book VALUES(7, '야구의 추억', '이상미디어', 20000);
INSERT INTO Book VALUES(8, '야구를 부탁해', '이상미디어', 13000);
INSERT INTO Book VALUES(9, '올림픽 이야기', '삼성당', 7500);
INSERT INTO Book VALUES(10, 'Olympic Champions', 'Pearson', 13000);
#INSERT INTO Book VALUES(10, '올림픽 이야기', '삼성당', 7500);	key value는 유일

#select bookid, bookname, publisher, price from Book; 
select bookname, publisher from Book;
select publisher, bookname from Book;

select * from Book; 

select distinct publisher from Book;	# 중복된 거 하나씩만 불러오겠다
select publisher from Book;

select * from Book where price < 10000;
select * from Book where price between 10000 and 20000;
select * from Book where price >= 10000 and price <= 20000;