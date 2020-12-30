CREATE TABLE `t_user`
(
    `id`       bigint                                                  NOT NULL,
    `user_id`  varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `name`     varchar(100) DEFAULT NULL,
    `password` varchar(255) DEFAULT NULL,
    `birthday` date         DEFAULT NULL,
    `sex`      varchar(2)   DEFAULT NULL,
    `email`    varchar(300) DEFAULT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `index_1` (`user_id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;


CREATE TABLE `t_wish`
(
    `id`           bigint NOT NULL,
    `user_Id`      varchar(100)   DEFAULT NULL,
    `gift_name`    varchar(1000)  DEFAULT NULL,
    `gift_price`   decimal(10, 2) DEFAULT NULL,
    `gift_desc`    varchar(1000)  DEFAULT NULL,
    `gift_picture` varchar(1000)  DEFAULT NULL,
    `gift_url`     varchar(255)   DEFAULT NULL,
    `reason`       varchar(1000)  DEFAULT NULL,
    `category`     varchar(255)   DEFAULT NULL COMMENT '1:生日，2:节日，3:纪念日，4:重要的人，5：其他',
    `create_time`  datetime       DEFAULT NULL,
    `end_date`     date           DEFAULT NULL COMMENT '实现时间',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;