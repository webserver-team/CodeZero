CREATE TABLE Cart (
    userId VARCHAR(255),
    lecId INT,
    PRIMARY KEY (userId, lecId),
    FOREIGN KEY (userId) REFERENCES Member(userId) ON DELETE CASCADE,
    FOREIGN KEY (lecId) REFERENCES Lecture(lecId) ON DELETE CASCADE
);

select * from Cart;

DELETE FROM Cart WHERE lecId = 201000049;

drop table Cart;

insert into cart value('admin', 201000052);

alter table Cart 