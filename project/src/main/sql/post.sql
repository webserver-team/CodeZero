CREATE TABLE `post` (
  `postId` int NOT NULL,
  `postTitle` varchar(100) NOT NULL,
  `postContent` varchar(10000) NOT NULL,
  `userId` varchar(45) NOT NULL,
  PRIMARY KEY (`postId`)
) 