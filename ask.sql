/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : ask

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-01-07 23:49:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` int(11) NOT NULL,
  `create_time` bigint(13) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of activity
-- ----------------------------

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_content` longtext NOT NULL,
  `liked_count` int(11) NOT NULL DEFAULT '0',
  `disliked_count` int(11) unsigned NOT NULL DEFAULT '0',
  `create_time` bigint(13) DEFAULT '0',
  `question_id` int(11) NOT NULL,
  `answer_user_id` varchar(128) NOT NULL,
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('52', '\n\n                        aaaaa', '0', '0', '1546425832762', '9', '3bad1b8a3c284cab8d19d441651c7615');
INSERT INTO `answer` VALUES ('53', '<span>蔡振亚的小号</span> <span>蔡振亚的小号</span> 问题', '0', '0', '1546425866694', '1', '3bad1b8a3c284cab8d19d441651c7615');
INSERT INTO `answer` VALUES ('81', '11111问题java', '0', '0', '1546506595626', '3', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('82', '\n                                \n                                \n                                \n                                \n                                \n                                    \n                                \n                                \n                                \n                                \n                                \n                                \n                                \n                                \n                                \n                                \n                                    \n                                    3333\n                                \n                                \n                                \n                                \n                                \n                                \n                            ', '0', '0', '1546609620039', '11', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('83', '111', '0', '0', '1546667108819', '2', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('84', '滕飞', '0', '0', '1546781861810', '1', '6a99cf86555243ba8b23927c0748b562');
INSERT INTO `answer` VALUES ('85', '12', '0', '0', '1546830008180', '1', '45e6c1985fe640e09cd770d95e6e2c8b');

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
-- Records of favorite
-- ----------------------------

-- ----------------------------
-- Table structure for mid_question_contain_topic
-- ----------------------------
DROP TABLE IF EXISTS `mid_question_contain_topic`;
CREATE TABLE `mid_question_contain_topic` (
  `qt_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`qt_id`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mid_question_contain_topic
-- ----------------------------
INSERT INTO `mid_question_contain_topic` VALUES ('1', '1', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('2', '1', '180');
INSERT INTO `mid_question_contain_topic` VALUES ('3', '2', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('4', '2', '160');
INSERT INTO `mid_question_contain_topic` VALUES ('5', '3', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('6', '3', '181');
INSERT INTO `mid_question_contain_topic` VALUES ('7', '4', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('8', '5', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('9', '5', '182');
INSERT INTO `mid_question_contain_topic` VALUES ('10', '5', '160');
INSERT INTO `mid_question_contain_topic` VALUES ('11', '5', '183');
INSERT INTO `mid_question_contain_topic` VALUES ('12', '6', '184');
INSERT INTO `mid_question_contain_topic` VALUES ('13', '6', '176');
INSERT INTO `mid_question_contain_topic` VALUES ('14', '6', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('15', '6', '185');
INSERT INTO `mid_question_contain_topic` VALUES ('16', '7', '184');
INSERT INTO `mid_question_contain_topic` VALUES ('17', '7', '186');
INSERT INTO `mid_question_contain_topic` VALUES ('18', '7', '187');
INSERT INTO `mid_question_contain_topic` VALUES ('19', '8', '188');
INSERT INTO `mid_question_contain_topic` VALUES ('20', '8', '189');
INSERT INTO `mid_question_contain_topic` VALUES ('21', '8', '96');
INSERT INTO `mid_question_contain_topic` VALUES ('22', '8', '190');
INSERT INTO `mid_question_contain_topic` VALUES ('23', '8', '191');
INSERT INTO `mid_question_contain_topic` VALUES ('24', '9', '176');
INSERT INTO `mid_question_contain_topic` VALUES ('25', '9', '96');
INSERT INTO `mid_question_contain_topic` VALUES ('26', '9', '192');
INSERT INTO `mid_question_contain_topic` VALUES ('27', '9', '97');
INSERT INTO `mid_question_contain_topic` VALUES ('28', '9', '193');
INSERT INTO `mid_question_contain_topic` VALUES ('29', '10', '184');
INSERT INTO `mid_question_contain_topic` VALUES ('30', '10', '194');
INSERT INTO `mid_question_contain_topic` VALUES ('31', '10', '122');
INSERT INTO `mid_question_contain_topic` VALUES ('32', '10', '195');
INSERT INTO `mid_question_contain_topic` VALUES ('33', '10', '96');
INSERT INTO `mid_question_contain_topic` VALUES ('34', '11', '177');
INSERT INTO `mid_question_contain_topic` VALUES ('35', '11', '176');
INSERT INTO `mid_question_contain_topic` VALUES ('36', '11', '196');
INSERT INTO `mid_question_contain_topic` VALUES ('37', '11', '197');
INSERT INTO `mid_question_contain_topic` VALUES ('38', '11', '198');
INSERT INTO `mid_question_contain_topic` VALUES ('39', '12', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('40', '12', '182');
INSERT INTO `mid_question_contain_topic` VALUES ('41', '12', '160');
INSERT INTO `mid_question_contain_topic` VALUES ('42', '12', '183');
INSERT INTO `mid_question_contain_topic` VALUES ('43', '13', '184');
INSERT INTO `mid_question_contain_topic` VALUES ('44', '13', '176');
INSERT INTO `mid_question_contain_topic` VALUES ('45', '13', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('46', '13', '185');
INSERT INTO `mid_question_contain_topic` VALUES ('47', '14', '184');
INSERT INTO `mid_question_contain_topic` VALUES ('48', '14', '186');
INSERT INTO `mid_question_contain_topic` VALUES ('49', '14', '187');
INSERT INTO `mid_question_contain_topic` VALUES ('50', '15', '188');
INSERT INTO `mid_question_contain_topic` VALUES ('51', '15', '189');
INSERT INTO `mid_question_contain_topic` VALUES ('52', '15', '96');
INSERT INTO `mid_question_contain_topic` VALUES ('53', '15', '190');
INSERT INTO `mid_question_contain_topic` VALUES ('54', '15', '191');
INSERT INTO `mid_question_contain_topic` VALUES ('55', '16', '176');
INSERT INTO `mid_question_contain_topic` VALUES ('56', '16', '96');
INSERT INTO `mid_question_contain_topic` VALUES ('57', '16', '192');
INSERT INTO `mid_question_contain_topic` VALUES ('58', '16', '97');
INSERT INTO `mid_question_contain_topic` VALUES ('59', '16', '193');
INSERT INTO `mid_question_contain_topic` VALUES ('60', '17', '184');
INSERT INTO `mid_question_contain_topic` VALUES ('61', '17', '194');
INSERT INTO `mid_question_contain_topic` VALUES ('62', '17', '122');
INSERT INTO `mid_question_contain_topic` VALUES ('63', '17', '195');
INSERT INTO `mid_question_contain_topic` VALUES ('64', '17', '96');
INSERT INTO `mid_question_contain_topic` VALUES ('65', '18', '177');
INSERT INTO `mid_question_contain_topic` VALUES ('66', '18', '176');
INSERT INTO `mid_question_contain_topic` VALUES ('67', '18', '196');
INSERT INTO `mid_question_contain_topic` VALUES ('68', '18', '197');
INSERT INTO `mid_question_contain_topic` VALUES ('69', '18', '198');
INSERT INTO `mid_question_contain_topic` VALUES ('70', '19', '199');
INSERT INTO `mid_question_contain_topic` VALUES ('71', '19', '176');
INSERT INTO `mid_question_contain_topic` VALUES ('72', '19', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('73', '19', '197');
INSERT INTO `mid_question_contain_topic` VALUES ('74', '19', '200');
INSERT INTO `mid_question_contain_topic` VALUES ('75', '20', '184');
INSERT INTO `mid_question_contain_topic` VALUES ('76', '20', '3');
INSERT INTO `mid_question_contain_topic` VALUES ('77', '20', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('78', '20', '196');
INSERT INTO `mid_question_contain_topic` VALUES ('79', '20', '173');
INSERT INTO `mid_question_contain_topic` VALUES ('80', '21', '201');
INSERT INTO `mid_question_contain_topic` VALUES ('81', '21', '202');
INSERT INTO `mid_question_contain_topic` VALUES ('82', '21', '197');
INSERT INTO `mid_question_contain_topic` VALUES ('83', '22', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('84', '22', '203');
INSERT INTO `mid_question_contain_topic` VALUES ('85', '23', '176');
INSERT INTO `mid_question_contain_topic` VALUES ('86', '23', '201');
INSERT INTO `mid_question_contain_topic` VALUES ('87', '23', '204');
INSERT INTO `mid_question_contain_topic` VALUES ('88', '23', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('89', '23', '74');
INSERT INTO `mid_question_contain_topic` VALUES ('90', '24', '199');
INSERT INTO `mid_question_contain_topic` VALUES ('91', '24', '184');
INSERT INTO `mid_question_contain_topic` VALUES ('92', '24', '96');
INSERT INTO `mid_question_contain_topic` VALUES ('93', '24', '186');
INSERT INTO `mid_question_contain_topic` VALUES ('94', '25', '199');
INSERT INTO `mid_question_contain_topic` VALUES ('95', '25', '31');
INSERT INTO `mid_question_contain_topic` VALUES ('96', '25', '205');
INSERT INTO `mid_question_contain_topic` VALUES ('97', '25', '33');
INSERT INTO `mid_question_contain_topic` VALUES ('98', '25', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('99', '26', '206');
INSERT INTO `mid_question_contain_topic` VALUES ('100', '26', '96');
INSERT INTO `mid_question_contain_topic` VALUES ('101', '26', '207');
INSERT INTO `mid_question_contain_topic` VALUES ('102', '26', '208');
INSERT INTO `mid_question_contain_topic` VALUES ('103', '26', '209');
INSERT INTO `mid_question_contain_topic` VALUES ('104', '27', '199');
INSERT INTO `mid_question_contain_topic` VALUES ('105', '27', '184');
INSERT INTO `mid_question_contain_topic` VALUES ('106', '27', '113');
INSERT INTO `mid_question_contain_topic` VALUES ('107', '27', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('108', '27', '186');
INSERT INTO `mid_question_contain_topic` VALUES ('109', '28', '177');
INSERT INTO `mid_question_contain_topic` VALUES ('110', '28', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('111', '28', '197');
INSERT INTO `mid_question_contain_topic` VALUES ('112', '28', '210');
INSERT INTO `mid_question_contain_topic` VALUES ('113', '29', '184');
INSERT INTO `mid_question_contain_topic` VALUES ('114', '29', '211');
INSERT INTO `mid_question_contain_topic` VALUES ('115', '29', '176');
INSERT INTO `mid_question_contain_topic` VALUES ('116', '29', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('117', '29', '212');
INSERT INTO `mid_question_contain_topic` VALUES ('118', '30', '184');
INSERT INTO `mid_question_contain_topic` VALUES ('119', '30', '3');
INSERT INTO `mid_question_contain_topic` VALUES ('120', '30', '51');
INSERT INTO `mid_question_contain_topic` VALUES ('121', '30', '176');
INSERT INTO `mid_question_contain_topic` VALUES ('122', '30', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('123', '31', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('124', '31', '213');
INSERT INTO `mid_question_contain_topic` VALUES ('125', '32', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('126', '32', '214');
INSERT INTO `mid_question_contain_topic` VALUES ('127', '32', '187');
INSERT INTO `mid_question_contain_topic` VALUES ('128', '32', '215');
INSERT INTO `mid_question_contain_topic` VALUES ('129', '33', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('130', '33', '64');
INSERT INTO `mid_question_contain_topic` VALUES ('131', '33', '216');
INSERT INTO `mid_question_contain_topic` VALUES ('132', '34', '184');
INSERT INTO `mid_question_contain_topic` VALUES ('133', '34', '217');
INSERT INTO `mid_question_contain_topic` VALUES ('134', '34', '186');
INSERT INTO `mid_question_contain_topic` VALUES ('135', '34', '218');
INSERT INTO `mid_question_contain_topic` VALUES ('136', '34', '187');
INSERT INTO `mid_question_contain_topic` VALUES ('137', '35', '184');
INSERT INTO `mid_question_contain_topic` VALUES ('138', '35', '176');
INSERT INTO `mid_question_contain_topic` VALUES ('139', '35', '96');
INSERT INTO `mid_question_contain_topic` VALUES ('140', '35', '197');
INSERT INTO `mid_question_contain_topic` VALUES ('141', '36', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('142', '36', '196');
INSERT INTO `mid_question_contain_topic` VALUES ('143', '36', '219');
INSERT INTO `mid_question_contain_topic` VALUES ('144', '36', '212');
INSERT INTO `mid_question_contain_topic` VALUES ('145', '37', '220');
INSERT INTO `mid_question_contain_topic` VALUES ('146', '37', '221');
INSERT INTO `mid_question_contain_topic` VALUES ('147', '37', '43');
INSERT INTO `mid_question_contain_topic` VALUES ('148', '37', '222');
INSERT INTO `mid_question_contain_topic` VALUES ('149', '37', '223');
INSERT INTO `mid_question_contain_topic` VALUES ('150', '38', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('151', '38', '224');
INSERT INTO `mid_question_contain_topic` VALUES ('152', '39', '176');
INSERT INTO `mid_question_contain_topic` VALUES ('153', '39', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('154', '39', '186');
INSERT INTO `mid_question_contain_topic` VALUES ('155', '40', '45');
INSERT INTO `mid_question_contain_topic` VALUES ('156', '40', '197');
INSERT INTO `mid_question_contain_topic` VALUES ('157', '40', '43');
INSERT INTO `mid_question_contain_topic` VALUES ('158', '40', '44');
INSERT INTO `mid_question_contain_topic` VALUES ('159', '40', '216');
INSERT INTO `mid_question_contain_topic` VALUES ('160', '41', '225');
INSERT INTO `mid_question_contain_topic` VALUES ('161', '41', '122');
INSERT INTO `mid_question_contain_topic` VALUES ('162', '41', '96');
INSERT INTO `mid_question_contain_topic` VALUES ('163', '41', '97');
INSERT INTO `mid_question_contain_topic` VALUES ('164', '41', '226');
INSERT INTO `mid_question_contain_topic` VALUES ('165', '42', '227');
INSERT INTO `mid_question_contain_topic` VALUES ('166', '43', '228');
INSERT INTO `mid_question_contain_topic` VALUES ('167', '44', '229');
INSERT INTO `mid_question_contain_topic` VALUES ('168', '45', '230');
INSERT INTO `mid_question_contain_topic` VALUES ('169', '46', '231');
INSERT INTO `mid_question_contain_topic` VALUES ('170', '47', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('171', '47', '142');
INSERT INTO `mid_question_contain_topic` VALUES ('172', '48', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('173', '49', '232');
INSERT INTO `mid_question_contain_topic` VALUES ('174', '50', '176');
INSERT INTO `mid_question_contain_topic` VALUES ('175', '51', '117');
INSERT INTO `mid_question_contain_topic` VALUES ('176', '51', '113');
INSERT INTO `mid_question_contain_topic` VALUES ('177', '52', '233');
INSERT INTO `mid_question_contain_topic` VALUES ('178', '53', '234');
INSERT INTO `mid_question_contain_topic` VALUES ('179', '54', '235');
INSERT INTO `mid_question_contain_topic` VALUES ('180', '55', '236');
INSERT INTO `mid_question_contain_topic` VALUES ('181', '56', '237');
INSERT INTO `mid_question_contain_topic` VALUES ('182', '57', '238');
INSERT INTO `mid_question_contain_topic` VALUES ('183', '58', '239');
INSERT INTO `mid_question_contain_topic` VALUES ('184', '59', '240');
INSERT INTO `mid_question_contain_topic` VALUES ('185', '60', '241');
INSERT INTO `mid_question_contain_topic` VALUES ('186', '61', '3');
INSERT INTO `mid_question_contain_topic` VALUES ('187', '62', '242');
INSERT INTO `mid_question_contain_topic` VALUES ('188', '63', '243');
INSERT INTO `mid_question_contain_topic` VALUES ('189', '64', '244');
INSERT INTO `mid_question_contain_topic` VALUES ('190', '65', '245');
INSERT INTO `mid_question_contain_topic` VALUES ('191', '66', '244');
INSERT INTO `mid_question_contain_topic` VALUES ('192', '67', '246');
INSERT INTO `mid_question_contain_topic` VALUES ('193', '68', '247');
INSERT INTO `mid_question_contain_topic` VALUES ('194', '69', '248');
INSERT INTO `mid_question_contain_topic` VALUES ('195', '70', '249');
INSERT INTO `mid_question_contain_topic` VALUES ('196', '71', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('197', '72', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('198', '73', '250');
INSERT INTO `mid_question_contain_topic` VALUES ('199', '74', '251');
INSERT INTO `mid_question_contain_topic` VALUES ('200', '75', '252');
INSERT INTO `mid_question_contain_topic` VALUES ('201', '76', '253');
INSERT INTO `mid_question_contain_topic` VALUES ('202', '77', '254');
INSERT INTO `mid_question_contain_topic` VALUES ('203', '78', '255');
INSERT INTO `mid_question_contain_topic` VALUES ('204', '79', '256');
INSERT INTO `mid_question_contain_topic` VALUES ('205', '80', '40');
INSERT INTO `mid_question_contain_topic` VALUES ('206', '80', '43');
INSERT INTO `mid_question_contain_topic` VALUES ('207', '81', '257');

-- ----------------------------
-- Table structure for mid_question_topic
-- ----------------------------
DROP TABLE IF EXISTS `mid_question_topic`;
CREATE TABLE `mid_question_topic` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mid_question_topic
-- ----------------------------
INSERT INTO `mid_question_topic` VALUES ('1', '1', '2');

-- ----------------------------
-- Table structure for mid_user_collect_answer
-- ----------------------------
DROP TABLE IF EXISTS `mid_user_collect_answer`;
CREATE TABLE `mid_user_collect_answer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(128) CHARACTER SET utf8 NOT NULL,
  `answer_id` int(11) NOT NULL,
  `favorite_id` int(11) NOT NULL COMMENT '收藏夹的编号',
  `create_time` bigint(13) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mid_user_collect_answer
-- ----------------------------
INSERT INTO `mid_user_collect_answer` VALUES ('47', '45e6c1985fe640e09cd770d95e6e2c8b', '53', '1', '1546501643307');

-- ----------------------------
-- Table structure for mid_user_follow_question
-- ----------------------------
DROP TABLE IF EXISTS `mid_user_follow_question`;
CREATE TABLE `mid_user_follow_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_id` varchar(128) NOT NULL COMMENT '用户ID',
  `question_id` int(11) NOT NULL COMMENT '问题ID',
  `create_time` bigint(13) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mid_user_follow_question
-- ----------------------------
INSERT INTO `mid_user_follow_question` VALUES ('6', '45e6c1985fe640e09cd770d95e6e2c8b', '1', '1546183629283');
INSERT INTO `mid_user_follow_question` VALUES ('8', '45e6c1985fe640e09cd770d95e6e2c8b', '2', '1546183629283');
INSERT INTO `mid_user_follow_question` VALUES ('9', '45e6c1985fe640e09cd770d95e6e2c8b', '3', '1546183629283');
INSERT INTO `mid_user_follow_question` VALUES ('10', '45e6c1985fe640e09cd770d95e6e2c8b', '4', '1546183629283');
INSERT INTO `mid_user_follow_question` VALUES ('11', '45e6c1985fe640e09cd770d95e6e2c8b', '6', '1546183629283');
INSERT INTO `mid_user_follow_question` VALUES ('12', '45e6c1985fe640e09cd770d95e6e2c8b', '8', '1546183629283');
INSERT INTO `mid_user_follow_question` VALUES ('13', '45e6c1985fe640e09cd770d95e6e2c8b', '7', '1546183629283');
INSERT INTO `mid_user_follow_question` VALUES ('14', '45e6c1985fe640e09cd770d95e6e2c8b', '5', '1546183629283');
INSERT INTO `mid_user_follow_question` VALUES ('17', '6a99cf86555243ba8b23927c0748b562', '5', '1546183629283');
INSERT INTO `mid_user_follow_question` VALUES ('18', '6a99cf86555243ba8b23927c0748b562', '6', '1546183629283');
INSERT INTO `mid_user_follow_question` VALUES ('22', '6a99cf86555243ba8b23927c0748b562', '1', '1546183629283');
INSERT INTO `mid_user_follow_question` VALUES ('23', '3bad1b8a3c284cab8d19d441651c7615', '9', '1546320466979');
INSERT INTO `mid_user_follow_question` VALUES ('24', '3bad1b8a3c284cab8d19d441651c7615', '10', '1546323708663');
INSERT INTO `mid_user_follow_question` VALUES ('25', '3bad1b8a3c284cab8d19d441651c7615', '1', '1546433107606');
INSERT INTO `mid_user_follow_question` VALUES ('26', '45e6c1985fe640e09cd770d95e6e2c8b', '11', '1546609308796');

-- ----------------------------
-- Table structure for mid_user_follow_user
-- ----------------------------
DROP TABLE IF EXISTS `mid_user_follow_user`;
CREATE TABLE `mid_user_follow_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(128) NOT NULL,
  `user_followed_id` varchar(128) NOT NULL,
  `follow_status` int(1) NOT NULL DEFAULT '0' COMMENT '1:following;0:not follow',
  `create_time` bigint(13) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mid_user_follow_user
-- ----------------------------
INSERT INTO `mid_user_follow_user` VALUES ('1', '6a99cf86555243ba8b23927c0748b562', '45e6c1985fe640e09cd770d95e6e2c8b', '0', '1546183629283');
INSERT INTO `mid_user_follow_user` VALUES ('2', '3bad1b8a3c284cab8d19d441651c7615', '45e6c1985fe640e09cd770d95e6e2c8b', '0', '1546322274739');
INSERT INTO `mid_user_follow_user` VALUES ('3', '45e6c1985fe640e09cd770d95e6e2c8b', '3bad1b8a3c284cab8d19d441651c7615', '1', '1546851270339');
INSERT INTO `mid_user_follow_user` VALUES ('4', '45e6c1985fe640e09cd770d95e6e2c8b', '45e6c1985fe640e09cd770d95e6e2c8b', '0', '1546763038804');
INSERT INTO `mid_user_follow_user` VALUES ('5', '45e6c1985fe640e09cd770d95e6e2c8b', '6a99cf86555243ba8b23927c0748b562', '1', '1546851278441');

-- ----------------------------
-- Table structure for mid_user_vote_answer
-- ----------------------------
DROP TABLE IF EXISTS `mid_user_vote_answer`;
CREATE TABLE `mid_user_vote_answer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(128) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `vote` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'upvate:1;downvote:-1;not vote:0',
  `create_time` bigint(13) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mid_user_vote_answer
-- ----------------------------
INSERT INTO `mid_user_vote_answer` VALUES ('9', '45e6c1985fe640e09cd770d95e6e2c8b', '53', '0', '1546757447216');
INSERT INTO `mid_user_vote_answer` VALUES ('11', '45e6c1985fe640e09cd770d95e6e2c8b', '79', '1', '1546492981705');
INSERT INTO `mid_user_vote_answer` VALUES ('13', '45e6c1985fe640e09cd770d95e6e2c8b', '81', '0', '1546506615115');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_title` varchar(255) NOT NULL DEFAULT '',
  `question_content` text,
  `topic_kv_list` varchar(200) NOT NULL DEFAULT '',
  `followed_count` int(11) NOT NULL DEFAULT '0',
  `scanned_count` int(11) NOT NULL DEFAULT '0',
  `create_time` bigint(13) NOT NULL DEFAULT '0',
  `user_id` varchar(128) NOT NULL,
  `answer_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', 'java开发，入职半年。对未来迷茫，如何发展？', '各位前辈你们好。今年三月实习到最近转正，工作了这半年，现在感觉对未来很迷茫。我想努力提升自己的能力，在工作中，大部分时间都在写着重复的业务代码。感觉成长很低。自己每天上下班五个小时，都在车上看视频学习技术，但是在实际的公司开发中，都用不到。因为公司用的后端技术比较旧，还是用的servlet加jsp和公司自己封装的很多组件api进行开发。我想努力成为一名真正的java开发工程师，一步一步。自己该如何走下去？现在在公司，脑子里面全是如何提升自己的技术，我该学习哪些技术呢？现在自己自学了ssm和ssh。', '', '3', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '3');
INSERT INTO `question` VALUES ('2', '为什么手机只能围绕三个对称轴其中的两个稳定地旋转？', '', '', '1', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '1');
INSERT INTO `question` VALUES ('3', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '1');
INSERT INTO `question` VALUES ('4', '如何看待大疆员工猝死？', '才刚毕业几个月就去世了,真让人心寒', '', '1', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('5', 'PowerPoint 到底有多厉害？', '因为见识了Excel 到底有多厉害？ - 软件，所以想看看PPT的过人之处', '', '2', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('6', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('7', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('8', '有没有 SpringMVC + Angular + bootstrap 学习的例子?', '有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?v', '', '1', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('9', '小号的第一个问题', '', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('10', '小号的第二个问题', '', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('11', '今天星期几？', '今天星期几？今天星期几？今天星期几？今天星期几？今天星期几？', '', '1', '0', '1546609308736', '45e6c1985fe640e09cd770d95e6e2c8b', '1');

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(30) NOT NULL DEFAULT '',
  `topic_simple_desc` varchar(255) NOT NULL,
  `topic_full_desc` text NOT NULL,
  `topic_full_desc_en` text NOT NULL,
  `topic_image` varchar(255) NOT NULL DEFAULT '/images/topic-internet.png',
  `parent_topic_id` int(11) DEFAULT '1',
  `followed_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', '根话题', '', '根话题', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '0', '0');
INSERT INTO `topic` VALUES ('2', '互联网', '互联网是由一些使用公用语言互相通信的计算机连接而成的网络，即广域网、局域网及单机按照一定的通讯协议组成的国际计算机网络。', '<p><b>互联网</b>（<span class=\"LangWithName\">英语：<span lang=\"en\">Internet</span></span>），是<a href=\"/wiki/21%E4%B8%96%E7%B4%80\" class=\"mw-redirect\" title=\"21世纪\">21世纪</a>之始<a href=\"/wiki/%E7%B6%B2%E8%B7%AF\" class=\"mw-redirect mw-disambig\" title=\"网络\">网络</a>与网络之间所串连成的庞大网络，这些网络以一组标准的网络<a href=\"/wiki/TCP/IP%E5%8D%8F%E8%AE%AE%E6%97%8F\" title=\"TCP/IP协议族\">TCP/IP协议族</a>相连，连接全世界几十亿个设备，形成逻辑上的单一巨大国际网络。<sup id=\"cite_ref-1\" class=\"reference\"><a href=\"#cite_note-1\">&#91;1&#93;</a></sup>它是由从地方到全球范围内几百万个私人的、学术界的、企业的和政府的网络所构成，通过电子，无线和光纤网络技术等等一系列广泛的技术联系在一起。这种将计算机网络互相联接在一起的方法可称作“网络互联”，在这基础上发展出覆盖全世界的全球性互联网络称互联网，即是互相连接一起的网络。互联网并不等同<a href=\"/wiki/%E4%B8%87%E7%BB%B4%E7%BD%91\" title=\"万维网\">万维网</a>（WWW），万维网只是一个基于<a href=\"/wiki/%E8%B6%85%E6%96%87%E6%9C%AC\" title=\"超文本\">超文本</a>相互链接而成的全球性系统，且是互联网所能提供的服务其中之一。互联网带有范围广泛的信息资源和服务，例如相互关系的超文本文件，还有万维网的应用，支持<a href=\"/wiki/%E9%9B%BB%E5%AD%90%E9%83%B5%E4%BB%B6\" class=\"mw-redirect\" title=\"邮箱\">邮箱</a>的基础设施，<a href=\"/wiki/%E5%AF%B9%E7%AD%89%E7%BD%91%E7%BB%9C\" class=\"mw-redirect\" title=\"对等网络\">点对点网络</a>，<a href=\"/wiki/%E6%AA%94%E6%A1%88%E5%88%86%E4%BA%AB\" title=\"文件分享\">文件共享</a>，以及<a href=\"/wiki/%E7%B6%B2%E9%9A%9B%E5%8D%94%E8%AD%B0%E9%80%9A%E8%A9%B1%E6%8A%80%E8%A1%93\" class=\"mw-redirect\" title=\"网际协议通话技术\">IP电话</a>服务。', '<p>The <b>Internet</b> (<a href=\"https://en.wikipedia.org/wiki/Contraction_(grammar)\" title=\"Contraction (grammar)\">contraction</a> of <b>interconnected network</b>) is the global system of interconnected <a href=\"https://en.wikipedia.org/wiki/Computer_network\" title=\"Computer network\">computer networks</a> that use the <a href=\"https://en.wikipedia.org/wiki/Internet_protocol_suite\" title=\"Internet protocol suite\">Internet protocol suite</a> (TCP/IP) to link devices worldwide. It is a <i>network of networks</i> that consists of private, public, academic, business, and government networks of local to global scope, linked by a broad array of electronic, wireless, and optical networking technologies. The Internet carries a vast range of information resources and services, such as the inter-linked <a href=\"https://en.wikipedia.org/wiki/Hypertext\" title=\"Hypertext\">hypertext</a> documents and <a href=\"https://en.wikipedia.org/wiki/Web_application\" title=\"Web application\">applications</a> of the <a href=\"https://en.wikipedia.org/wiki/World_Wide_Web\" title=\"World Wide Web\">World Wide Web</a> (WWW), <a href=\"https://en.wikipedia.org/wiki/Email\" title=\"Email\">electronic mail</a>, <a href=\"https://en.wikipedia.org/wiki/Voice_over_IP\" title=\"Voice over IP\">telephony</a>, and <a href=\"https://en.wikipedia.org/wiki/File_sharing\" title=\"File sharing\">file sharing</a>.\r\n</p><p>The origins of the Internet date back to research commissioned by the <a href=\"https://en.wikipedia.org/wiki/Federal_government_of_the_United_States\" title=\"Federal government of the United States\">federal government of the United States</a> in the 1960s to build robust, fault-tolerant communication with computer networks.<sup id=\"cite_ref-1\" class=\"reference\"><a href=\"#cite_note-1\">&#91;1&#93;</a></sup> The primary precursor network, the <a href=\"https://en.wikipedia.org/wiki/ARPANET\" title=\"ARPANET\">ARPANET</a>, initially served as a backbone for interconnection of regional academic and military networks in the 1980s. The funding of the <a href=\"https://en.wikipedia.org/wiki/National_Science_Foundation_Network\" title=\"National Science Foundation Network\">National Science Foundation Network</a> as a new backbone in the 1980s, as well as private funding for other commercial extensions, led to worldwide participation in the development of new networking technologies, and the merger of many networks.<sup id=\"cite_ref-2\" class=\"reference\"><a href=\"#cite_note-2\">&#91;2&#93;</a></sup> The linking of commercial networks and enterprises by the early 1990s marked the beginning of the transition to the modern Internet,<sup id=\"cite_ref-3\" class=\"reference\"><a href=\"#cite_note-3\">&#91;3&#93;</a></sup> and generated a sustained exponential growth as generations of institutional, <a href=\"https://en.wikipedia.org/wiki/Personal_computer\" title=\"Personal computer\">personal</a>, and <a href=\"https://en.wikipedia.org/wiki/Mobile_device\" title=\"Mobile device\">mobile</a> computers were connected to the network. Although the Internet was widely used by <a href=\"https://en.wikipedia.org/wiki/Academia\" class=\"mw-redirect\" title=\"Academia\">academia</a> since the 1980s, <a href=\"https://en.wikipedia.org/wiki/Commercialization_of_the_Internet\" title=\"Commercialization of the Internet\">commercialization</a> incorporated its services and technologies into virtually every aspect of modern life.\r\n</p><p>Most traditional communications media, including telephony, radio, television, paper mail and newspapers are reshaped, redefined, or even bypassed by the Internet, giving birth to new services such as <a href=\"https://en.wikipedia.org/wiki/Email\" title=\"Email\">email</a>, <a href=\"https://en.wikipedia.org/wiki/Internet_telephony\" class=\"mw-redirect\" title=\"Internet telephony\">Internet telephony</a>, <a href=\"https://en.wikipedia.org/wiki/Internet_television\" class=\"mw-redirect\" title=\"Internet television\">Internet television</a>, <a href=\"https://en.wikipedia.org/wiki/Online_music\" class=\"mw-redirect\" title=\"Online music\">online music</a>, digital newspapers, and <a href=\"https://en.wikipedia.org/wiki/Video_streaming\" class=\"mw-redirect\" title=\"Video streaming\">video streaming</a> websites. Newspaper, book, and other print publishing are adapting to <a href=\"https://en.wikipedia.org/wiki/Web_site\" class=\"mw-redirect\" title=\"Web site\">website</a> technology, or are reshaped into <a href=\"https://en.wikipedia.org/wiki/Blogging\" class=\"mw-redirect\" title=\"Blogging\">blogging</a>, <a href=\"https://en.wikipedia.org/wiki/Web_feed\" title=\"Web feed\">web feeds</a> and online <a href=\"https://en.wikipedia.org/wiki/News_aggregator\" title=\"News aggregator\">news aggregators</a>. The Internet has enabled and accelerated new forms of personal interactions through <a href=\"https://en.wikipedia.org/wiki/Instant_messaging\" title=\"Instant messaging\">instant messaging</a>, <a href=\"https://en.wikipedia.org/wiki/Internet_forum\" title=\"Internet forum\">Internet forums</a>, and <a href=\"https://en.wikipedia.org/wiki/Social_network_service\" class=\"mw-redirect\" title=\"Social network service\">social networking</a>. <a href=\"https://en.wikipedia.org/wiki/Online_shopping\" title=\"Online shopping\">Online shopping</a> has grown exponentially both for major retailers and <a href=\"https://en.wikipedia.org/wiki/Small_business\" title=\"Small business\">small businesses</a> and <a href=\"https://en.wikipedia.org/wiki/Entrepreneur\" class=\"mw-redirect\" title=\"Entrepreneur\">entrepreneurs</a>, as it enables firms to extend their \"<a href=\"https://en.wikipedia.org/wiki/Brick_and_mortar\" title=\"Brick and mortar\">brick and mortar</a>\" presence to serve a larger market or even <a href=\"https://en.wikipedia.org/wiki/Online_store\" class=\"mw-redirect\" title=\"Online store\">sell goods and services entirely online</a>.  <a href=\"https://en.wikipedia.org/wiki/Business-to-business\" title=\"Business-to-business\">Business-to-business</a> and <a href=\"https://en.wikipedia.org/wiki/Financial_services\" title=\"Financial services\">financial services</a> on the Internet affect <a href=\"https://en.wikipedia.org/wiki/Supply_chain\" title=\"Supply chain\">supply chains</a> across entire industries.\r\n</p><p>The Internet has no centralized governance in either technological implementation or policies for access and usage; each constituent network sets its own policies.<sup id=\"cite_ref-4\" class=\"reference\"><a href=\"#cite_note-4\">&#91;4&#93;</a></sup> Only the overreaching definitions of the two principal <a href=\"https://en.wikipedia.org/wiki/Name_space\" class=\"mw-redirect\" title=\"Name space\">name spaces</a> in the Internet, the <a href=\"https://en.wikipedia.org/wiki/IP_address\" title=\"IP address\">Internet Protocol address</a> (IP address) space and the <a href=\"https://en.wikipedia.org/wiki/Domain_Name_System\" title=\"Domain Name System\">Domain Name System</a> (DNS), are directed by a maintainer organization, the <a href=\"https://en.wikipedia.org/wiki/Internet_Corporation_for_Assigned_Names_and_Numbers\" class=\"mw-redirect\" title=\"Internet Corporation for Assigned Names and Numbers\">Internet Corporation for Assigned Names and Numbers</a> (ICANN). The technical underpinning and standardization of the core protocols is an activity of the <a href=\"https://en.wikipedia.org/wiki/Internet_Engineering_Task_Force\" title=\"Internet Engineering Task Force\">Internet Engineering Task Force</a> (IETF), a non-profit organization of loosely affiliated international participants that anyone may associate with by contributing technical expertise.<sup id=\"cite_ref-5\" class=\"reference\"><a href=\"#cite_note-5\">&#91;5&#93;</a></sup> In November 2006, the Internet was included on <i><a href=\"https://en.wikipedia.org/wiki/USA_Today\" title=\"USA Today\">USA Today</a>\'</i>s list of <i><a href=\"https://en.wikipedia.org/wiki/Wonders_of_the_World#USA_Today&#39;s_New_Seven_Wonders\" title=\"Wonders of the World\">New Seven Wonders</a></i>.<sup id=\"cite_ref-6\" class=\"reference\"><a href=\"#cite_note-6\">&#91;6&#93;</a></sup>\r\n</p>', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '0', '0');
INSERT INTO `topic` VALUES ('3', 'python', 'Python（英国发音：/ˈpaɪθən/ 美国发音：/ˈpaɪθɑːn/），是一种广泛使用的高级编程语言，属于通用型编程语言，由吉多·范罗苏姆创造，第一版发布于1991年。可以视之为一种改良（加入一些其他编程语言的优点，如面向对象）的LISP。', '<p><b>Python</b>（<small>英国发音：</small><span title=\"IPA标音\" class=\"IPA\"><a href=\"/wiki/Wikipedia:%E5%9C%8B%E9%9A%9B%E9%9F%B3%E6%A8%99%E8%8B%B1%E8%AA%9E%E7%99%BC%E9%9F%B3\" class=\"mw-redirect\" title=\"Wikipedia:国际音标英语发音\">/ˈpaɪθən/</a></span><small></small> <small>美国发音：</small><span title=\"IPA标音\" class=\"IPA\"><a href=\"/wiki/Wikipedia:%E5%9C%8B%E9%9A%9B%E9%9F%B3%E6%A8%99%E8%8B%B1%E8%AA%9E%E7%99%BC%E9%9F%B3\" class=\"mw-redirect\" title=\"Wikipedia:国际音标英语发音\">/ˈpaɪθɑːn/</a></span><small></small>），是一种广泛使用的<a href=\"/wiki/%E9%AB%98%E7%BA%A7%E8%AF%AD%E8%A8%80\" title=\"高级语言\">高级编程语言</a>，属于<a href=\"/wiki/%E9%80%9A%E7%94%A8%E7%BC%96%E7%A8%8B%E8%AF%AD%E8%A8%80\" title=\"通用编程语言\">通用型编程语言</a>，由<a href=\"/wiki/%E5%90%89%E5%A4%9A%C2%B7%E8%8C%83%E7%BD%97%E8%8B%8F%E5%A7%86\" title=\"吉多·范罗苏姆\">吉多·范罗苏姆</a>创造，第一版发布于1991年。可以视之为一种改良（加入一些其他编程语言的优点，如面向对象）的LISP。作为一种<a href=\"/wiki/%E7%9B%B4%E8%AD%AF%E8%AA%9E%E8%A8%80\" title=\"解释型语言\">解释型语言</a>，Python的设计哲学强调代码的<a href=\"/wiki/%E5%8F%AF%E8%AF%BB%E6%80%A7\" title=\"可读性\">可读性</a>和简洁的语法（尤其是使用<a href=\"/wiki/%E8%B6%8A%E4%BD%8D%E8%A7%84%E5%88%99\" title=\"越位规则\">空格缩进</a>划分代码块，而非使用大括号或者关键词）。相比于C++或Java，Python让开发者能够用更少的代码表达想法。不管是小型还是大型程序，该语言都试图让程序的结构清晰明了。\r\n</p><p>与<a href=\"/wiki/Scheme\" title=\"Scheme\">Scheme</a>、<a href=\"/wiki/Ruby\" title=\"Ruby\">Ruby</a>、<a href=\"/wiki/Perl\" title=\"Perl\">Perl</a>、<a href=\"/wiki/Tcl\" title=\"Tcl\">Tcl</a>等动态类型编程语言一样，Python拥有<a href=\"/wiki/%E9%A1%9E%E5%9E%8B%E7%B3%BB%E7%B5%B1\" title=\"类型系统\">动态类型系统</a>和<a href=\"/wiki/%E5%9E%83%E5%9C%BE%E5%9B%9E%E6%94%B6_(%E8%A8%88%E7%AE%97%E6%A9%9F%E7%A7%91%E5%AD%B8)\" title=\"垃圾回收 (计算机科学)\">垃圾回收</a>功能，能够自动管理内存使用，并且支持多种编程范式，包括面向对象、命令式、函数式和过程式编程。其本身拥有一个巨大而广泛的标准库。\r\n</p><p>Python <a href=\"/wiki/%E8%A7%A3%E9%87%8A%E5%99%A8\" class=\"mw-redirect\" title=\"解释器\">解释器</a>本身几乎可以在所有的<a href=\"/wiki/%E6%93%8D%E4%BD%9C%E7%B3%BB%E7%BB%9F\" title=\"操作系统\">操作系统</a>中运行。Python的正式<a href=\"/wiki/%E7%9B%B4%E8%AD%AF%E5%99%A8\" title=\"解释器\">解释器</a><a href=\"/wiki/CPython\" title=\"CPython\">CPython</a>是用<a href=\"/wiki/C%E8%AF%AD%E8%A8%80\" title=\"C语言\">C语言</a>编写的、是一个由社群驱动的自由<a href=\"/wiki/%E8%BB%9F%E9%AB%94\" class=\"mw-redirect\" title=\"软件\">软件</a>，当前由<a href=\"/wiki/Python%E8%BB%9F%E9%AB%94%E5%9F%BA%E9%87%91%E6%9C%83\" title=\"Python软件基金会\">Python软件基金会</a>管理。\r\n</p>', '<p><b>Python</b> is an <a href=\"/wiki/Interpreted_language\" title=\"Interpreted language\">interpreted</a>, <a href=\"/wiki/High-level_programming_language\" title=\"High-level programming language\">high-level</a>, <a href=\"/wiki/General-purpose_programming_language\" title=\"General-purpose programming language\">general-purpose programming language</a>. Created by <a href=\"/wiki/Guido_van_Rossum\" title=\"Guido van Rossum\">Guido van Rossum</a> and first released in 1991, Python has a design philosophy that emphasizes <a href=\"/wiki/Code_readability\" class=\"mw-redirect\" title=\"Code readability\">code readability</a>, notably using <a href=\"/wiki/Significant_whitespace\" class=\"mw-redirect\" title=\"Significant whitespace\">significant whitespace</a>. It provides constructs that enable clear programming on both small and large scales.<sup id=\"cite_ref-AutoNT-7_26-0\" class=\"reference\"><a href=\"#cite_note-AutoNT-7-26\">&#91;26&#93;</a></sup> In July 2018, Van Rossum stepped down as the leader in the language community.<sup id=\"cite_ref-27\" class=\"reference\"><a href=\"#cite_note-27\">&#91;27&#93;</a></sup><sup id=\"cite_ref-28\" class=\"reference\"><a href=\"#cite_note-28\">&#91;28&#93;</a></sup>\r\n</p><p>Python features a <a href=\"/wiki/Dynamic_type\" class=\"mw-redirect\" title=\"Dynamic type\">dynamic type</a> system and automatic <a href=\"/wiki/Memory_management\" title=\"Memory management\">memory management</a>. It supports multiple <a href=\"/wiki/Programming_paradigm\" title=\"Programming paradigm\">programming paradigms</a>, including <a href=\"/wiki/Object-oriented_programming\" title=\"Object-oriented programming\">object-oriented</a>, <a href=\"/wiki/Imperative_programming\" title=\"Imperative programming\">imperative</a>, <a href=\"/wiki/Functional_programming\" title=\"Functional programming\">functional</a> and <a href=\"/wiki/Procedural_programming\" title=\"Procedural programming\">procedural</a>, and has a large and comprehensive <a href=\"/wiki/Standard_library\" title=\"Standard library\">standard library</a>.<sup id=\"cite_ref-About_29-0\" class=\"reference\"><a href=\"#cite_note-About-29\">&#91;29&#93;</a></sup>\r\n</p><p>Python interpreters are available for many <a href=\"/wiki/Operating_system\" title=\"Operating system\">operating systems</a>. <a href=\"/wiki/CPython\" title=\"CPython\">CPython</a>, the <a href=\"/wiki/Reference_implementation\" title=\"Reference implementation\">reference implementation</a> of Python, is <a href=\"/wiki/Open-source_software\" title=\"Open-source software\">open source</a> software<sup id=\"cite_ref-30\" class=\"reference\"><a href=\"#cite_note-30\">&#91;30&#93;</a></sup> and has a community-based development model, as do nearly all of Python\'s other implementations. Python and CPython are managed by the non-profit <a href=\"/wiki/Python_Software_Foundation\" title=\"Python Software Foundation\">Python Software Foundation</a>.\r\n</p>', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '2', '1');
INSERT INTO `topic` VALUES ('4', 'list', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '2', '0');
INSERT INTO `topic` VALUES ('5', 'django', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '2', '0');
INSERT INTO `topic` VALUES ('6', 'flask', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '2', '0');
INSERT INTO `topic` VALUES ('7', 'tornado', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '2', '0');
INSERT INTO `topic` VALUES ('8', 'web.py', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '2', '0');
INSERT INTO `topic` VALUES ('9', 'sqlalchemy', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '2', '0');
INSERT INTO `topic` VALUES ('10', 'virtualenv', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '2', '0');
INSERT INTO `topic` VALUES ('11', '搜索', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '0', '0');
INSERT INTO `topic` VALUES ('12', '搜索引擎', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '11', '0');
INSERT INTO `topic` VALUES ('13', '中文分词', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '11', '0');
INSERT INTO `topic` VALUES ('14', '全文检索', '<p>从文本或数据库中，不限定数据字段，自由地萃取出消息的技术。\r\n</p><p>运行全文检索任务的程序，一般称作<a href=\"/wiki/%E6%90%9C%E5%B0%8B%E5%BC%95%E6%93%8E\" class=\"mw-redirect\" title=\"搜索引擎\">搜索引擎</a>，它将用户随意输入的文字，试图从数据库中，找到匹配的内容。\r\n</p>', '<p>从文本或数据库中，不限定数据字段，自由地萃取出消息的技术。\r\n</p><p>运行全文检索任务的程序，一般称作<a href=\"/wiki/%E6%90%9C%E5%B0%8B%E5%BC%95%E6%93%8E\" class=\"mw-redirect\" title=\"搜索引擎\">搜索引擎</a>，它将用户随意输入的文字，试图从数据库中，找到匹配的内容。\r\n</p>', '<p>In <a href=\"/wiki/Text_retrieval\" class=\"mw-redirect\" title=\"Text retrieval\">text retrieval</a>, <b>full-text search</b> refers to techniques for searching a single <a href=\"/wiki/Computer\" title=\"Computer\">computer</a>-stored <a href=\"/wiki/Document\" title=\"Document\">document</a> or a collection in a <a href=\"/wiki/Full-text_database\" title=\"Full-text database\">full-text database</a>. Full-text search is distinguished from searches based on <a href=\"/wiki/Metadata\" title=\"Metadata\">metadata</a> or on parts of the original texts represented in databases (such as titles, abstracts, selected sections, or bibliographical references).\r\n</p><p>In a full-text search, a <a href=\"/wiki/Search_engine\" class=\"mw-redirect\" title=\"Search engine\">search engine</a> examines all of the words in every stored document as it tries to match search criteria (for example, text specified by a user). Full-text-searching techniques became common in online <a href=\"/wiki/Bibliographic_databases\" class=\"mw-redirect\" title=\"Bibliographic databases\">bibliographic databases</a> in the 1990s.<sup class=\"noprint Inline-Template\" style=\"white-space:nowrap;\">&#91;<i><a href=\"/wiki/Wikipedia:Verifiability\" title=\"Wikipedia:Verifiability\"><span title=\"The material near this tag needs to be fact-checked with the cited source(s). (October 2008)\">verification needed</span></a></i>&#93;</sup> Many websites and application programs (such as <a href=\"/wiki/Word_processing\" class=\"mw-redirect\" title=\"Word processing\">word processing</a> software) provide full-text-search capabilities. Some web search engines, such as <a href=\"/wiki/AltaVista\" title=\"AltaVista\">AltaVista</a>, employ full-text-search techniques, while others index only a portion of the web pages examined by their indexing systems.<sup id=\"cite_ref-1\" class=\"reference\"><a href=\"#cite_note-1\">&#91;1&#93;</a></sup>\r\n</p>', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '11', '0');
INSERT INTO `topic` VALUES ('15', 'lucene', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '11', '0');
INSERT INTO `topic` VALUES ('16', 'solr', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '11', '0');
INSERT INTO `topic` VALUES ('17', 'sphinx', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '11', '0');
INSERT INTO `topic` VALUES ('18', 'analyzer', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '11', '0');
INSERT INTO `topic` VALUES ('19', 'elasticsearch', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '11', '0');
INSERT INTO `topic` VALUES ('20', '开放平台', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '0', '0');
INSERT INTO `topic` VALUES ('21', '新浪微博', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '20', '0');
INSERT INTO `topic` VALUES ('22', '人人网', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '20', '0');
INSERT INTO `topic` VALUES ('23', '微信', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '20', '0');
INSERT INTO `topic` VALUES ('24', '腾讯微博', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '20', '0');
INSERT INTO `topic` VALUES ('25', '百度', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '20', '0');
INSERT INTO `topic` VALUES ('26', 'facebook', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '20', '0');
INSERT INTO `topic` VALUES ('27', 'twitter', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '20', '0');
INSERT INTO `topic` VALUES ('28', '前端开发', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '0', '0');
INSERT INTO `topic` VALUES ('29', 'html', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '28', '0');
INSERT INTO `topic` VALUES ('30', 'html5', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '28', '0');
INSERT INTO `topic` VALUES ('31', 'css', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '28', '0');
INSERT INTO `topic` VALUES ('32', 'css3', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '28', '0');
INSERT INTO `topic` VALUES ('33', 'javascript', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '28', '0');
INSERT INTO `topic` VALUES ('34', 'jquery', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '28', '0');
INSERT INTO `topic` VALUES ('35', 'json', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '28', '0');
INSERT INTO `topic` VALUES ('36', 'ajax', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '28', '0');
INSERT INTO `topic` VALUES ('37', '正则表达式', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '28', '0');
INSERT INTO `topic` VALUES ('38', 'bootstrap', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '28', '0');
INSERT INTO `topic` VALUES ('39', 'JAVA 开发', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '0', '3');
INSERT INTO `topic` VALUES ('40', 'java', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '39', '10');
INSERT INTO `topic` VALUES ('41', 'java-ee', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '39', '0');
INSERT INTO `topic` VALUES ('42', 'jar', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '39', '0');
INSERT INTO `topic` VALUES ('43', 'spring', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '39', '2');
INSERT INTO `topic` VALUES ('44', 'hibernate', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '39', '0');
INSERT INTO `topic` VALUES ('45', 'struts', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '39', '0');
INSERT INTO `topic` VALUES ('46', 'tomcat', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '39', '0');
INSERT INTO `topic` VALUES ('47', 'maven', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '39', '0');
INSERT INTO `topic` VALUES ('48', 'eclipse', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '39', '0');
INSERT INTO `topic` VALUES ('49', 'intellij-idea', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '39', '0');
INSERT INTO `topic` VALUES ('50', 'PHP 开发', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '0', '0');
INSERT INTO `topic` VALUES ('51', 'php', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '50', '0');
INSERT INTO `topic` VALUES ('52', 'mysql', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '50', '0');
INSERT INTO `topic` VALUES ('53', 'apache', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '50', '0');
INSERT INTO `topic` VALUES ('54', 'nginx', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '50', '0');
INSERT INTO `topic` VALUES ('55', 'mvc', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '50', '0');
INSERT INTO `topic` VALUES ('56', 'codeigniter', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '50', '0');
INSERT INTO `topic` VALUES ('57', 'symfony', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '50', '0');
INSERT INTO `topic` VALUES ('58', 'zend-framework', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '50', '0');
INSERT INTO `topic` VALUES ('59', 'composer', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '50', '0');
INSERT INTO `topic` VALUES ('60', 'laravel', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '50', '0');
INSERT INTO `topic` VALUES ('61', 'JavaScript 开发', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '0', '0');
INSERT INTO `topic` VALUES ('62', 'javascript', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '61', '2');
INSERT INTO `topic` VALUES ('63', 'jquery', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '61', '0');
INSERT INTO `topic` VALUES ('64', 'node.js', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '61', '0');
INSERT INTO `topic` VALUES ('65', 'chrome', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '61', '0');
INSERT INTO `topic` VALUES ('66', 'firefox', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '61', '0');
INSERT INTO `topic` VALUES ('67', 'internet-explorer', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '61', '0');
INSERT INTO `topic` VALUES ('68', 'angular.js', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '61', '0');
INSERT INTO `topic` VALUES ('69', 'typescript', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '61', '0');
INSERT INTO `topic` VALUES ('70', 'ecmascript', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '61', '0');
INSERT INTO `topic` VALUES ('71', 'vue.js', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '61', '0');
INSERT INTO `topic` VALUES ('72', 'react.js', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '61', '0');
INSERT INTO `topic` VALUES ('73', '.NET 开发', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '0', '0');
INSERT INTO `topic` VALUES ('74', '.net', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '73', '0');
INSERT INTO `topic` VALUES ('75', 'c#', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '73', '0');
INSERT INTO `topic` VALUES ('76', 'asp.net', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '73', '0');
INSERT INTO `topic` VALUES ('77', 'visual-studio', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '73', '0');
INSERT INTO `topic` VALUES ('78', 'mvc', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '73', '0');
INSERT INTO `topic` VALUES ('79', 'microsoft', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '73', '0');
INSERT INTO `topic` VALUES ('80', '开发工具', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '0', '0');
INSERT INTO `topic` VALUES ('81', 'vim', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '80', '0');
INSERT INTO `topic` VALUES ('82', 'emacs', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '80', '0');
INSERT INTO `topic` VALUES ('83', 'ide', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '80', '0');
INSERT INTO `topic` VALUES ('84', 'eclipse', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '80', '0');
INSERT INTO `topic` VALUES ('85', 'xcode', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '80', '0');
INSERT INTO `topic` VALUES ('86', 'intellij-idea', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '80', '0');
INSERT INTO `topic` VALUES ('87', 'textmate', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '80', '0');
INSERT INTO `topic` VALUES ('88', 'sublime-text', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '80', '0');
INSERT INTO `topic` VALUES ('89', 'visual-studio', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '80', '0');
INSERT INTO `topic` VALUES ('90', 'git', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '80', '0');
INSERT INTO `topic` VALUES ('91', 'github', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '80', '0');
INSERT INTO `topic` VALUES ('92', 'svn', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '80', '0');
INSERT INTO `topic` VALUES ('93', 'hg', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '80', '0');
INSERT INTO `topic` VALUES ('94', 'docker', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '80', '0');
INSERT INTO `topic` VALUES ('95', 'ci', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '80', '0');
INSERT INTO `topic` VALUES ('96', 'Android 开发', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '0', '0');
INSERT INTO `topic` VALUES ('97', 'android', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '96', '0');
INSERT INTO `topic` VALUES ('98', 'java', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '96', '0');
INSERT INTO `topic` VALUES ('99', 'eclipse', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '96', '0');
INSERT INTO `topic` VALUES ('100', 'xml', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '96', '0');
INSERT INTO `topic` VALUES ('101', 'phonegap', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '96', '0');
INSERT INTO `topic` VALUES ('102', 'json', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '96', '0');
INSERT INTO `topic` VALUES ('103', 'webview', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '96', '0');
INSERT INTO `topic` VALUES ('104', 'android-studio', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '96', '0');
INSERT INTO `topic` VALUES ('105', 'Ruby 开发', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '0', '0');
INSERT INTO `topic` VALUES ('106', 'ruby', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '105', '0');
INSERT INTO `topic` VALUES ('107', 'ruby-on-rails', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '105', '0');
INSERT INTO `topic` VALUES ('108', 'rubygems', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '105', '0');
INSERT INTO `topic` VALUES ('109', 'rvm', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '105', '0');
INSERT INTO `topic` VALUES ('110', 'macosx', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '105', '0');
INSERT INTO `topic` VALUES ('111', 'bundle', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '105', '0');
INSERT INTO `topic` VALUES ('112', '服务器', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '0', '0');
INSERT INTO `topic` VALUES ('113', 'linux', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '112', '0');
INSERT INTO `topic` VALUES ('114', 'unix', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '112', '0');
INSERT INTO `topic` VALUES ('115', 'ubuntu', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '112', '0');
INSERT INTO `topic` VALUES ('116', 'windows-server', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '112', '0');
INSERT INTO `topic` VALUES ('117', 'centos', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '112', '0');
INSERT INTO `topic` VALUES ('118', '负载均衡', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '112', '0');
INSERT INTO `topic` VALUES ('119', '缓存', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '112', '0');
INSERT INTO `topic` VALUES ('120', 'apache', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '112', '0');
INSERT INTO `topic` VALUES ('121', 'nginx', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '112', '0');
INSERT INTO `topic` VALUES ('122', 'iOS 开发', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '0', '0');
INSERT INTO `topic` VALUES ('123', 'ios', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '122', '0');
INSERT INTO `topic` VALUES ('124', 'objective-c', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '122', '0');
INSERT INTO `topic` VALUES ('125', 'sqlite', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '122', '0');
INSERT INTO `topic` VALUES ('126', 'safari', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '122', '0');
INSERT INTO `topic` VALUES ('127', 'xcode', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '122', '0');
INSERT INTO `topic` VALUES ('128', 'phonegap', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '122', '0');
INSERT INTO `topic` VALUES ('129', 'cocoa', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '122', '0');
INSERT INTO `topic` VALUES ('130', 'javascript', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '122', '0');
INSERT INTO `topic` VALUES ('131', 'macos', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '122', '0');
INSERT INTO `topic` VALUES ('132', 'iphone', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '122', '0');
INSERT INTO `topic` VALUES ('133', 'ipad', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '122', '0');
INSERT INTO `topic` VALUES ('134', 'swift', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '122', '0');
INSERT INTO `topic` VALUES ('135', '数据库', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '0', '0');
INSERT INTO `topic` VALUES ('136', '数据库', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '135', '0');
INSERT INTO `topic` VALUES ('137', 'mysql', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '135', '0');
INSERT INTO `topic` VALUES ('138', 'sqlite', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '135', '0');
INSERT INTO `topic` VALUES ('139', 'oracle', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '135', '0');
INSERT INTO `topic` VALUES ('140', 'sql', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '135', '0');
INSERT INTO `topic` VALUES ('141', 'nosql', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '135', '0');
INSERT INTO `topic` VALUES ('142', 'redis', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '135', '0');
INSERT INTO `topic` VALUES ('143', 'mongodb', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '135', '0');
INSERT INTO `topic` VALUES ('144', 'memcached', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '135', '0');
INSERT INTO `topic` VALUES ('145', 'postgresql', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '135', '0');
INSERT INTO `topic` VALUES ('146', '云计算', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '0', '0');
INSERT INTO `topic` VALUES ('147', '云计算', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '146', '0');
INSERT INTO `topic` VALUES ('148', '又拍云存储', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '146', '0');
INSERT INTO `topic` VALUES ('149', '七牛云存储', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '146', '0');
INSERT INTO `topic` VALUES ('150', 'google-app-engine', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '146', '0');
INSERT INTO `topic` VALUES ('151', 'sina-app-engine', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '146', '0');
INSERT INTO `topic` VALUES ('152', 'amazon-web-services', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '146', '0');
INSERT INTO `topic` VALUES ('153', '百度云', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '146', '0');
INSERT INTO `topic` VALUES ('154', '金山云', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '146', '0');
INSERT INTO `topic` VALUES ('155', '美团云', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '146', '0');
INSERT INTO `topic` VALUES ('156', '腾讯云', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '146', '0');
INSERT INTO `topic` VALUES ('157', '开发语言', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '0', '0');
INSERT INTO `topic` VALUES ('158', 'java', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '157', '0');
INSERT INTO `topic` VALUES ('159', 'c', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '157', '0');
INSERT INTO `topic` VALUES ('160', 'c++', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '157', '1');
INSERT INTO `topic` VALUES ('161', 'php', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '157', '0');
INSERT INTO `topic` VALUES ('162', 'perl', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '157', '0');
INSERT INTO `topic` VALUES ('163', 'python', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '157', '0');
INSERT INTO `topic` VALUES ('164', 'javascript', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '157', '0');
INSERT INTO `topic` VALUES ('165', 'c#', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '157', '0');
INSERT INTO `topic` VALUES ('166', 'ruby', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '157', '0');
INSERT INTO `topic` VALUES ('167', 'objective-c', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '157', '0');
INSERT INTO `topic` VALUES ('168', 'go', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '157', '0');
INSERT INTO `topic` VALUES ('169', 'lua', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '157', '0');
INSERT INTO `topic` VALUES ('170', 'node.js', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '157', '0');
INSERT INTO `topic` VALUES ('171', 'erlang', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '157', '0');
INSERT INTO `topic` VALUES ('172', 'scala', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '157', '0');
INSERT INTO `topic` VALUES ('173', 'bash', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '157', '0');
INSERT INTO `topic` VALUES ('174', 'actionscript', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '157', '0');
INSERT INTO `topic` VALUES ('176', '编程', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '1');
INSERT INTO `topic` VALUES ('177', '编程语言', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('178', '数据结构', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('179', '', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('180', '算法', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('181', 'javaee', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('182', '面向对象编程', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '2');
INSERT INTO `topic` VALUES ('183', '编程语言比较', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('184', '程序员', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('185', '互联网工作', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('186', 'IT 行业', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('187', 'Java 程序员', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('188', '社交网络', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('189', '手机', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('190', '用户界面设计', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('191', '招商银行', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('192', '学习方法', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('193', 'Android 应用设计', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('194', '调查类问题', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('195', '独立开发者', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('196', 'C（编程语言）', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('197', 'Java 编程', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('198', '自学编程', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('199', '互联网', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('200', 'BAT（公司集合）', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('201', '计算机', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('202', '长沙', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('203', '高并发', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('204', '转行', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('205', '产品', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('206', '手机游戏', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('207', 'Cocos2d-x', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('208', 'Flappy Bird', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('209', 'CocosEditor', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('210', 'Java EE', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('211', '软件开发', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('212', 'C / C++', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('213', '电子信息工程', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('214', 'IT 培训', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('215', '教育培训机构', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('216', 'Java Web', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('217', 'IT 男', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('218', '女程序员', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('219', '计算机科学', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('220', 'Ruby on Rails', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('221', 'Django（框架）', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('222', '设计模式', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('223', 'Express（框架）', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('224', 'ThreadLocal', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('225', '移动互联网', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('226', '移动开发', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('227', '问答', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('228', 'qwe', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('229', 'sadsa', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('230', '[i\'[', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('231', '222', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('232', 'fdsfsdfds', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('233', 'htrhtrhjtr', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('234', '蛤', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('235', 'aaa', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('236', 'token', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('237', '的', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('238', 'D~~D', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('239', 't', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('240', '蛤，乎', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('241', '发送到', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('242', '对对对', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('243', '，，，', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('244', '123', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('245', '第三方', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('246', '羡慕', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('247', 'dd', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('248', 'introduction', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('249', '爱你妹啊', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('250', '编程；学习；', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '1');
INSERT INTO `topic` VALUES ('251', '11111', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('252', '发的', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('253', 'dddd;', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('254', '55', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('255', '啦啦啦啦', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('256', '老哥稳', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
INSERT INTO `topic` VALUES ('257', '人生，诗词', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(128) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL DEFAULT '',
  `activation_state` int(11) NOT NULL DEFAULT '0',
  `activation_code` varchar(50) NOT NULL DEFAULT '',
  `join_time` bigint(20) NOT NULL DEFAULT '0',
  `username` varchar(50) NOT NULL DEFAULT '',
  `avatar_url` varchar(400) NOT NULL DEFAULT 'http://localhost:8088/images/20181211191204.png',
  `gender` int(11) NOT NULL DEFAULT '1',
  `simple_desc` varchar(50) NOT NULL DEFAULT '',
  `residence_place` varchar(255) NOT NULL DEFAULT '',
  `position` varchar(100) NOT NULL DEFAULT '',
  `industry` varchar(100) NOT NULL DEFAULT '',
  `career` varchar(100) NOT NULL DEFAULT '',
  `education` varchar(100) NOT NULL DEFAULT '',
  `full_desc` varchar(300) NOT NULL DEFAULT '',
  `liked_count` int(11) NOT NULL DEFAULT '0',
  `collected_count` int(11) NOT NULL DEFAULT '0',
  `follow_count` int(11) NOT NULL DEFAULT '0',
  `followed_count` int(11) NOT NULL DEFAULT '0',
  `scanned_count` int(11) NOT NULL DEFAULT '0',
  `weibo_user_id` varchar(30) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`) USING BTREE,
  KEY `unit_index_1` (`username`,`simple_desc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3bad1b8a3c284cab8d19d441651c7615', 'tsai@gmail.com', '123456', '0', '', '0', '小号', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-3bad1b8a3c284cab8d19d441651c7615-20181211191204.png', '1', '蔡振亚的小号问题蔡振亚的小号问题蔡振亚的小号问题啊', '广东省深圳市', 'java工程师', '互联网行业', '深圳市弘长科技有限公司', '深圳大学', '啦啦啦啦啦啦啦啦啦', '0', '0', '0', '0', '0', '');
INSERT INTO `user` VALUES ('45e6c1985fe640e09cd770d95e6e2c8b', 'cc@126.com', '123', '0', '1212313', '0', 'tsaizhenya', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '社会主义的接班人，社会主义的接班人，社会主义的接班人', '深圳市', 'java工程师', '互联网行业', '杭州有赞科技有限公司', '本科', '世界上最聪明的人', '12', '23', '34', '345', '3454', '2312312');
INSERT INTO `user` VALUES ('6a99cf86555243ba8b23927c0748b562', '992085263@qq.com', '123456', '0', '', '0', '滕飞', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-6a99cf86555243ba8b23927c0748b562-tengfei.jpg', '1', '世界上最帅最帅最帅的人问题', '深圳市', '学生', '金融', '', '本科', '', '3', '234', '345', '45', '345', '');
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
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `modify_vote_after_answer_deleted`;
DELIMITER ;;
CREATE TRIGGER `modify_vote_after_answer_deleted` AFTER DELETE ON `answer` FOR EACH ROW delete from mid_user_vote_answer
where mid_user_vote_answer.answer_id = old.answer_id
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
