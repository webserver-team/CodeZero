
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

show tables

desc lecture

insert into lecture values(
	201000000,
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
select lecId from lecture;


-- lecture 테이블에서 lecPrice가 88000인 행의 lecName을 출력 --
select lecName from lecture where lecPrice=88000;

-- lecture 테이블 안의 lecLevel의 최대 크기 늘림 --
ALTER TABLE lecture MODIFY lecLevel VARCHAR(20);
ALTER TABLE lecture MODIFY lecId int not null auto_increment;
-- lecture 테이블 안에서 Id가 201000002인 행을 지움 --
delete from lecture where lecId=201000002;
delete from lecture;

-- 행 추가 --
alter table lecture add fileName varchar(150);
alter table lecture add video varchar(150);

ALTER TABLE lecture CHANGE COLUMN fileName image VARCHAR(100);
