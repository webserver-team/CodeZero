CREATE TABLE `member` (
  `userId` varchar(45) NOT NULL,
  `passwd` varchar(45) NOT NULL,
  `name` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci

INSERT INTO `member` (`userId`, `passwd`) VALUES ('ksy', '1234');
INSERT INTO `member` (`userId`, `passwd`) VALUES ('admin', '1234');

select * from member