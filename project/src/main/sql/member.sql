CREATE TABLE `member` (
  `id` varchar(45) NOT NULL,
  `passwd` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
)