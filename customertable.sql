use madang;

create table Customer(
	custid integer primary key ,
	name varchar(40) ,
    address varchar(40) ,
    phone varchar(40) 
);

insert into Customer values(1, '박지성', '영국 맨체스터', '000-5000-0001');
insert into Customer values(2, '김연아', '대한민국 서울', '000-6000-0001');
insert into Customer values(3, '김연경', '대한민국 경기도', '000-7000-0001');
insert into Customer values(4, '추신수', '미국 클리블랜드', '000-8000-0001');
insert into Customer values(5, '박세리', '대한민국 대전', NULL);