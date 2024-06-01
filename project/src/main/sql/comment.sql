CREATE TABLE `comment` (
  `commentId` int NOT NULL,
  `postId` int NOT NULL,
  `userId` varchar(45) NOT NULL,
  `comment` varchar(1000) NOT NULL,
  PRIMARY KEY (`commentId`),
  KEY `postId_idx` (`postId`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `postId` FOREIGN KEY (`postId`) REFERENCES `post` (`postId`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `member` (`userId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci