
show databases;

CREATE TABLE member(
	user_id VARCHAR(45) NOT NULL,
	password VARCHAR(45) NOT NULL
	)
	
SHOW TABLES;

DESC member;

SELECT * FROM member;

INSERT INTO member (user_id, password) values ('ksy','12345')
INSERT INTO member (user_id, password) values ('kss','123')