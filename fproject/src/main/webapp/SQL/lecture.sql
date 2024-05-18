
create table lecture(
	lecId int not null auto_increment,
	lecName varchar(50),
	teacherName varchar(10),
	lecDescription varchar(150),
	lecCategory varchar(15),
	lecLevel varchar(2),
	lecPrice int(10),
	lecReviewCount int(5),
	primary key (lecId)
);

alter table lecture change column lecname

show tables

desc lecture

insert into lecture values(
	201000001,
	'스프링 핵심 원리 - 기본편',
	'김영한',
	'스프링 입문자가 예제를 만들어가면서 스프링의 핵심 원리를 이해하고, 스프링 기본기를 확실히 다질 수 있습니다.',
	'백엔드',
	'초급',
	88000,
	3588
	)

-- lecture 테이블의 모든 행과 열을 출력 --
select * from lecture;

-- lecture 테이블에서 lecPrice가 88000인 행의 lecName을 출력 --
select lecName from lecture where lecPrice=88000;

-- lecture 테이블 안의 lecLevel의 최대 크기 늘림 --
ALTER TABLE lecture MODIFY lecLevel VARCHAR(20);

-- lecture 테이블 안에서 Id가 201000002인 행을 지움 --
delete from lecture where lecId=201000002;
delete from lecture;
