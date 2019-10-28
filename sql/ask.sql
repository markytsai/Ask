/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1-root
Source Server Version : 50724
Source Host           : 127.0.0.1:3306
Source Database       : ask_test2

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-04-23 20:12:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_content` longtext NOT NULL,
  `liked_count` int(11) NOT NULL DEFAULT '0',
  `disliked_count` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00',
  `question_id` int(11) NOT NULL,
  `answer_user_id` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=141755 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for answer_comment
-- ----------------------------
DROP TABLE IF EXISTS `answer_comment`;
CREATE TABLE `answer_comment` (
  `answer_comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '回答评论ID',
  `answer_comment_content` text NOT NULL COMMENT '回答评论内容',
  `liked_count` int(11) NOT NULL DEFAULT '0' COMMENT '回答评论赞同数量',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `at_answer_comment_id` int(11) NOT NULL DEFAULT '0' COMMENT '默认为0代表该评论直接是回答下一级，不是回复其他评论的',
  `at_user_id` varchar(128) DEFAULT '0' COMMENT '默认为0代表该评论直接是回答下一级，不是回复其他评论的，目标可以从answer_id字段得出',
  `at_user_name` varchar(100) DEFAULT '0' COMMENT '默认为0代表该评论直接是回答下一级，不是回复其他评论的，目标可以从answer_id字段得出',
  `answer_id` int(50) NOT NULL DEFAULT '0' COMMENT '回答ID',
  `user_id` varchar(128) DEFAULT '' COMMENT '回答评论作者ID',
  PRIMARY KEY (`answer_comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for favorite
-- ----------------------------
DROP TABLE IF EXISTS `favorite`;
CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL AUTO_INCREMENT,
  `favorite_name` varchar(100) NOT NULL DEFAULT '',
  `create_time` bigint(20) NOT NULL DEFAULT '0',
  `update_time` bigint(20) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `followed_count` int(11) DEFAULT '0',
  PRIMARY KEY (`favorite_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for message_sys
-- ----------------------------
DROP TABLE IF EXISTS `message_sys`;
CREATE TABLE `message_sys` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_type` char(1) NOT NULL DEFAULT '0',
  `message_from` varchar(255) DEFAULT NULL,
  `message_to` varchar(255) DEFAULT NULL,
  `message_content` varchar(255) DEFAULT NULL,
  `message_time` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for message_user
-- ----------------------------
DROP TABLE IF EXISTS `message_user`;
CREATE TABLE `message_user` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `message_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'message_type指的是\r\n1. 问题 \r\n    关注的人 关注了问题\r\n    关注的人 提出了问题\r\n\r\n2.回答\r\n    有人 回答了 关注的问题\r\n    有人 回答了 提出的问题\r\n  \r\n3.评论\r\n     有人评论了 自己的回答\r\n4.关注\r\n     有人 关注了 自己\r\n5. \r\n     有人 点赞了 你的回答\r\n',
  `message_from` varchar(255) DEFAULT NULL,
  `message_to` varchar(255) DEFAULT NULL,
  `message_content` varchar(1000) DEFAULT NULL,
  `message_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `message_status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '读取状态：\r\n0： 未读\r\n1：已读',
  PRIMARY KEY (`message_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for mid_question_topic
-- ----------------------------
DROP TABLE IF EXISTS `mid_question_topic`;
CREATE TABLE `mid_question_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10004 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for mid_user_collect_answer
-- ----------------------------
DROP TABLE IF EXISTS `mid_user_collect_answer`;
CREATE TABLE `mid_user_collect_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(128) CHARACTER SET utf8 NOT NULL,
  `answer_id` int(11) NOT NULL,
  `favorite_id` int(11) NOT NULL COMMENT '收藏夹的编号',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for mid_user_follow_question
-- ----------------------------
DROP TABLE IF EXISTS `mid_user_follow_question`;
CREATE TABLE `mid_user_follow_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_id` varchar(128) NOT NULL COMMENT '用户ID',
  `question_id` int(11) NOT NULL COMMENT '问题ID',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5668490 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for mid_user_follow_topic
-- ----------------------------
DROP TABLE IF EXISTS `mid_user_follow_topic`;
CREATE TABLE `mid_user_follow_topic` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(255) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `follow_topic_status` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8494568 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for mid_user_follow_user
-- ----------------------------
DROP TABLE IF EXISTS `mid_user_follow_user`;
CREATE TABLE `mid_user_follow_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(128) NOT NULL,
  `user_followed_id` varchar(128) NOT NULL,
  `follow_status` int(1) NOT NULL DEFAULT '0' COMMENT '1:following;0:not follow',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for mid_user_vote_answer
-- ----------------------------
DROP TABLE IF EXISTS `mid_user_vote_answer`;
CREATE TABLE `mid_user_vote_answer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(128) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `vote` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'upvate:1;downvote:-1;not vote:0',
  `create_time` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_id` int(11) DEFAULT NULL,
  `question_title` varchar(255) NOT NULL DEFAULT '',
  `question_content` mediumtext,
  `topic_list` varchar(200) NOT NULL DEFAULT '',
  `followed_count` int(11) NOT NULL DEFAULT '1',
  `scanned_count` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_id` varchar(128) NOT NULL DEFAULT '089ec9f361894361b167306fe3b9e8e8',
  `answer_count` int(11) NOT NULL DEFAULT '0',
  `remote_question_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`question_id`),
  KEY `index_userId_creatTime` (`user_id`,`create_time`)
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(9999) NOT NULL DEFAULT '',
  `topic_simple_desc` varchar(9999) DEFAULT '',
  `topic_full_desc` varchar(999) DEFAULT '',
  `topic_full_desc_en` text,
  `topic_image` varchar(255) NOT NULL DEFAULT '/images/topic-internet.png',
  `parent_topic_id` int(11) NOT NULL DEFAULT '1',
  `followed_count` int(11) NOT NULL DEFAULT '0',
  `remote_topic_id` int(11) DEFAULT NULL,
  `topic_followed` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1115 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for topic_coldstart
-- ----------------------------
DROP TABLE IF EXISTS `topic_coldstart`;
CREATE TABLE `topic_coldstart` (
  `topic_id` int(11) NOT NULL,
  `topic_name` varchar(9999) NOT NULL DEFAULT '',
  `topic_simple_desc` varchar(9999) DEFAULT NULL,
  `topic_full_desc` text,
  `topic_full_desc_en` text,
  `topic_image` varchar(255) NOT NULL DEFAULT '/images/topic-internet.png',
  `parent_topic_id` int(11) NOT NULL DEFAULT '1',
  `followed_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for t_log
-- ----------------------------
DROP TABLE IF EXISTS `t_log`;
CREATE TABLE `t_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_username` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `log_desc` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `log_duration` mediumtext,
  `user_ip` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `log_level` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `log_type` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `req_param` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `res_result` blob,
  `req_method` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5167 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(128) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL DEFAULT '',
  `activation_status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '账户状态：0：冻结；1：正常',
  `activation_count` tinyint(1) NOT NULL DEFAULT '0' COMMENT '记录登录失败的次数，连续登录五次失败，当天的账号会锁住，凌晨会解封',
  `join_time` datetime DEFAULT '0000-00-00 00:00:00',
  `username` varchar(50) NOT NULL DEFAULT '',
  `avatar_url` varchar(1000) NOT NULL DEFAULT 'http://localhost:8088/images/20181211191204.png',
  `gender` int(11) NOT NULL DEFAULT '0' COMMENT '0：未设置；1：女性；2：男性',
  `simple_desc` varchar(50) NOT NULL DEFAULT '',
  `residence_place` varchar(255) NOT NULL DEFAULT '',
  `position` varchar(100) NOT NULL DEFAULT '',
  `industry` varchar(100) NOT NULL DEFAULT '',
  `career` varchar(100) NOT NULL DEFAULT '',
  `education` varchar(100) NOT NULL DEFAULT '',
  `full_desc` varchar(3000) NOT NULL DEFAULT '',
  `liked_count` int(11) NOT NULL DEFAULT '0',
  `collected_count` int(11) NOT NULL DEFAULT '0',
  `follow_count` int(11) NOT NULL DEFAULT '0',
  `followed_count` int(11) NOT NULL DEFAULT '0',
  `scanned_count` int(11) NOT NULL DEFAULT '0',
  `weibo_user_id` varchar(30) NOT NULL DEFAULT '',
  `first_login` varchar(3) NOT NULL DEFAULT '103' COMMENT '103:首次登录；104:持续登录',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`,`user_id`),
  KEY `unit_index_1` (`username`,`simple_desc`)
) ENGINE=InnoDB AUTO_INCREMENT=10041 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;


INSERT INTO `ask_test3`.`user` (`user_id`, `email`, `password`, `activation_status`, `activation_count`, `join_time`, `username`, `avatar_url`, `gender`, `simple_desc`, `residence_place`, `position`, `industry`, `career`, `education`, `full_desc`, `liked_count`, `collected_count`, `follow_count`, `followed_count`, `scanned_count`, `weibo_user_id`, `first_login`) VALUES ('00019f0670f94e82b9c81a2abe52d0aa', 'user2874@gamil.com', '123456', '0', '0', '2019-03-20 11:03:08', 'caizhenya2874', 'https://tse1-mm.cn.bing.net/th?id=OIP.yHicHQSTONl19eaOr0vISwHaHa&w=212&h=212&c=7&o=5&pid=1.7', '0', '热爱生活，爱岗敬业', '深圳', '工程师', '互联网', '', '硕士', '热爱生活，喜欢交朋友，擅长聊天', '0', '0', '0', '0', '0', '', '104');
INSERT INTO `ask_test3`.`user` (`user_id`, `email`, `password`, `activation_status`, `activation_count`, `join_time`, `username`, `avatar_url`, `gender`, `simple_desc`, `residence_place`, `position`, `industry`, `career`, `education`, `full_desc`, `liked_count`, `collected_count`, `follow_count`, `followed_count`, `scanned_count`, `weibo_user_id`, `first_login`) VALUES ('0003c24e3b5348088868c63c967d0475', 'user4699@gamil.com', '123456', '0', '0', '2019-03-20 11:03:08', 'caizhenya4699', 'https://tse2-mm.cn.bing.net/th?id=OIP.AQS7x0fTtUsua_2fmKPInQAAAA&w=211&h=212&c=7&o=5&pid=1.7', '1', '热爱生活，爱岗敬业', '深圳', '工程师', '互联网', '', '本科', '热爱生活，喜欢交朋友，擅长聊天', '0', '0', '0', '0', '0', '', '103');
INSERT INTO `ask_test3`.`user` (`user_id`, `email`, `password`, `activation_status`, `activation_count`, `join_time`, `username`, `avatar_url`, `gender`, `simple_desc`, `residence_place`, `position`, `industry`, `career`, `education`, `full_desc`, `liked_count`, `collected_count`, `follow_count`, `followed_count`, `scanned_count`, `weibo_user_id`, `first_login`) VALUES ('0003c6545d644bccb80490091e12b7db', 'user5171@gamil.com', '123456', '0', '0', '2019-03-20 11:03:08', 'caizhenya5171', 'https://tse3-mm.cn.bing.net/th?id=OIP.UUkBYTFvywDIKy1GI5uDOAAAAA&w=188&h=188&c=7&o=5&pid=1.7', '1', '热爱生活，爱岗敬业', '深圳', '工程师', '互联网', '', '硕士', '热爱生活，喜欢交朋友，擅长聊天', '0', '0', '0', '0', '0', '', '103');
INSERT INTO `ask_test3`.`user` (`user_id`, `email`, `password`, `activation_status`, `activation_count`, `join_time`, `username`, `avatar_url`, `gender`, `simple_desc`, `residence_place`, `position`, `industry`, `career`, `education`, `full_desc`, `liked_count`, `collected_count`, `follow_count`, `followed_count`, `scanned_count`, `weibo_user_id`, `first_login`) VALUES ('00082c3ec8b84d8bb37a3a2a98a5ff2c', 'user5127@gamil.com', '123456', '0', '0', '2019-03-20 11:03:08', 'caizhenya5127', 'https://tse4-mm.cn.bing.net/th?id=OIP.RknySJo6KnVgX18CgAtxNQHaHa&w=196&h=196&c=7&o=5&pid=1.7', '1', '热爱生活，爱岗敬业', '深圳', '工程师', '互联网', '', '本科', '热爱生活，喜欢交朋友，擅长聊天', '0', '0', '0', '0', '0', '', '103');
INSERT INTO `ask_test3`.`user` (`user_id`, `email`, `password`, `activation_status`, `activation_count`, `join_time`, `username`, `avatar_url`, `gender`, `simple_desc`, `residence_place`, `position`, `industry`, `career`, `education`, `full_desc`, `liked_count`, `collected_count`, `follow_count`, `followed_count`, `scanned_count`, `weibo_user_id`, `first_login`) VALUES ('000d8f07ba604992915b5fc2279eb32b', 'user1779@gamil.com', '123456', '0', '0', '2019-03-20 11:03:08', 'caizhenya1779', 'https://tse2-mm.cn.bing.net/th?id=OIP.zFHMM1nmacDSqmOp8Y564QHaHa&w=203&h=203&c=7&o=5&pid=1.7', '1', '热爱生活，爱岗敬业', '深圳', '工程师', '互联网', '', '博士', '热爱生活，喜欢交朋友，擅长聊天', '0', '0', '0', '0', '0', '', '103');


-- ----------------------------
-- Table structure for user_recommend_data
-- ----------------------------
DROP TABLE IF EXISTS `user_recommend_data`;
CREATE TABLE `user_recommend_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(128) NOT NULL,
  `question_ids` varchar(255) CHARACTER SET utf8 DEFAULT '[]',
  `similar_user` varchar(255) CHARACTER SET utf8 DEFAULT '[]',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10194 DEFAULT CHARSET=latin1;
DROP TRIGGER IF EXISTS `incre_answerCount_in_question_after_answer_insert`;
DELIMITER ;;
CREATE TRIGGER `incre_answerCount_in_question_after_answer_insert` AFTER INSERT ON `answer` FOR EACH ROW BEGIN
update question set answer_count = answer_count + 1 where question_id = new.question_id;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `modify_collect_after_answer_deleted`;
DELIMITER ;;
CREATE TRIGGER `modify_collect_after_answer_deleted` AFTER DELETE ON `answer` FOR EACH ROW delete from mid_user_collect_answer
where mid_user_collect_answer.answer_id = old.answer_id
;
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `modify_vote_after_answer_deleted`;
DELIMITER ;;
CREATE TRIGGER `modify_vote_after_answer_deleted` AFTER DELETE ON `answer` FOR EACH ROW delete from mid_user_vote_answer
where mid_user_vote_answer.answer_id = old.answer_id
;
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `decre_answerCount_in_question_after_answer_insert`;
DELIMITER ;;
CREATE TRIGGER `decre_answerCount_in_question_after_answer_insert` AFTER DELETE ON `answer` FOR EACH ROW BEGIN
update question set answer_count = answer_count - 1 where question_id = old.question_id;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `incre_followCount_in_question_after_followingUser_insert`;
DELIMITER ;;
CREATE TRIGGER `incre_followCount_in_question_after_followingUser_insert` AFTER INSERT ON `mid_user_follow_question` FOR EACH ROW BEGIN
update question set followed_count = followed_count + 1 where question_id = new.question_id;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `decre_followCount_in_question_after_followingUser_insert`;
DELIMITER ;;
CREATE TRIGGER `decre_followCount_in_question_after_followingUser_insert` AFTER DELETE ON `mid_user_follow_question` FOR EACH ROW BEGIN
update question set followed_count = followed_count - 1 where question_id = old.question_id;
end
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `build_user_follow_user`;
DELIMITER ;;
CREATE TRIGGER `build_user_follow_user` AFTER INSERT ON `user` FOR EACH ROW BEGIN
	INSERT INTO mid_user_follow_user (user_id,user_followed_id)VALUES(NEW.user_id,NEW.user_id);
END
;;
DELIMITER ;
