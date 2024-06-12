
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

select * from lecture
show tables;

desc lecture;

insert into lecture (lecName, teacherName, lecDescription, lecCategory, lecLevel, lecPrice, lecReviewCount, image, video) values(
	'스프링 핵심 원리 - 심화편',
	'김영한',
	'스프링 입문자가 예제를 만들어가면서 스프링의 핵심 원리를 이해하고, 스프링 기본기를 확실히 다질 수 있습니다.',
	'게임 기획',
	'중급',
	88000,
	3588,
	'333308.png',
	'java.mov'
	)

-- lecture 테이블의 모든 행과 열을 출력 --
select * from lecture;
select image from lecture;


-- lecture 테이블에서 lecPrice가 88000인 행의 lecName을 출력 --
select lecName from lecture where lecPrice=88000;

-- lecture 테이블 안의 lecLevel의 최대 크기 늘림 --
ALTER TABLE lecture MODIFY lecLevel VARCHAR(20);
ALTER TABLE lecture MODIFY lecId int not null auto_increment;
-- lecture 테이블 안에서 Id가 201000002인 행을 지움 --
delete from lecture where lecId=201000002;
delete from lecture;
delete from lecture where lecId=201000049;

-- 열 추가 --
alter table lecture add lecCategory2 varchar(15);
alter table lecture add fileName varchar(150);
alter table lecture add video varchar(150);

-- 열 삭제 --
ALTER TABLE lecture DROP COLUMN lecCategory2;

--열 이름 변경--
ALTER TABLE lecture CHANGE lecCategory1 lecCategory VARCHAR(15);

ALTER TABLE lecture CHANGE COLUMN fileName image VARCHAR(100);
