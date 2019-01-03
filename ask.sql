/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : ask

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-01-03 13:20:06
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
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('52', '\n\n                        aaaaa', '0', '0', '1546425832762', '9', '3bad1b8a3c284cab8d19d441651c7615');
INSERT INTO `answer` VALUES ('53', '<span>蔡振亚的小号</span> <span>蔡振亚的小号</span> ', '0', '0', '1546425866694', '1', '3bad1b8a3c284cab8d19d441651c7615');

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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mid_user_collect_answer
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mid_user_follow_user
-- ----------------------------
INSERT INTO `mid_user_follow_user` VALUES ('1', '6a99cf86555243ba8b23927c0748b562', '45e6c1985fe640e09cd770d95e6e2c8b', '0', '1546183629283');
INSERT INTO `mid_user_follow_user` VALUES ('2', '3bad1b8a3c284cab8d19d441651c7615', '45e6c1985fe640e09cd770d95e6e2c8b', '0', '1546322274739');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mid_user_vote_answer
-- ----------------------------
INSERT INTO `mid_user_vote_answer` VALUES ('9', '45e6c1985fe640e09cd770d95e6e2c8b', '53', '0', '1546486863602');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', 'java开发，入职半年。对未来迷茫，如何发展？', '各位前辈你们好。今年三月实习到最近转正，工作了这半年，现在感觉对未来很迷茫。我想努力提升自己的能力，在工作中，大部分时间都在写着重复的业务代码。感觉成长很低。自己每天上下班五个小时，都在车上看视频学习技术，但是在实际的公司开发中，都用不到。因为公司用的后端技术比较旧，还是用的servlet加jsp和公司自己封装的很多组件api进行开发。我想努力成为一名真正的java开发工程师，一步一步。自己该如何走下去？现在在公司，脑子里面全是如何提升自己的技术，我该学习哪些技术呢？现在自己自学了ssm和ssh。', '', '3', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '1');
INSERT INTO `question` VALUES ('2', '为什么手机只能围绕三个对称轴其中的两个稳定地旋转？', '', '', '1', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('3', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('4', '如何看待大疆员工猝死？', '才刚毕业几个月就去世了,真让人心寒', '', '1', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('5', 'PowerPoint 到底有多厉害？', '因为见识了Excel 到底有多厉害？ - 软件，所以想看看PPT的过人之处', '', '2', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('6', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('7', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('8', '有没有 SpringMVC + Angular + bootstrap 学习的例子?', '有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?v', '', '1', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('9', '小号的第一个问题', '', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('10', '小号的第二个问题', '', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(30) NOT NULL DEFAULT '',
  `topic_desc` text,
  `topic_image` varchar(255) NOT NULL DEFAULT 'http://localhost/image/topic3.png',
  `followed_count` int(11) DEFAULT '0',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('2', 'Python 开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('3', 'python', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1');
INSERT INTO `topic` VALUES ('4', 'list', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('5', 'django', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('6', 'flask', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('7', 'tornado', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('8', 'web.py', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('9', 'sqlalchemy', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('10', 'virtualenv', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('11', '搜索', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('12', '搜索引擎', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('13', '中文分词', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('14', '全文检索', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('15', 'lucene', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('16', 'solr', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('17', 'sphinx', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('18', 'analyzer', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('19', 'elasticsearch', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('20', '开放平台', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('21', '新浪微博', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('22', '人人网', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('23', '微信', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('24', '腾讯微博', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('25', '百度', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('26', 'facebook', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('27', 'twitter', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('28', '前端开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('29', 'html', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('30', 'html5', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('31', 'css', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('32', 'css3', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('33', 'javascript', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('34', 'jquery', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('35', 'json', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('36', 'ajax', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('37', '正则表达式', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('38', 'bootstrap', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('39', 'JAVA 开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '3');
INSERT INTO `topic` VALUES ('40', 'java', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '10');
INSERT INTO `topic` VALUES ('41', 'java-ee', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('42', 'jar', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('43', 'spring', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '2');
INSERT INTO `topic` VALUES ('44', 'hibernate', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('45', 'struts', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('46', 'tomcat', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('47', 'maven', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('48', 'eclipse', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('49', 'intellij-idea', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('50', 'PHP 开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('51', 'php', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('52', 'mysql', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('53', 'apache', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('54', 'nginx', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('55', 'mvc', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('56', 'codeigniter', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('57', 'symfony', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('58', 'zend-framework', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('59', 'composer', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('60', 'laravel', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('61', 'JavaScript 开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('62', 'javascript', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '2');
INSERT INTO `topic` VALUES ('63', 'jquery', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('64', 'node.js', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('65', 'chrome', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('66', 'firefox', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('67', 'internet-explorer', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('68', 'angular.js', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('69', 'typescript', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('70', 'ecmascript', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('71', 'vue.js', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('72', 'react.js', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('73', '.NET 开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('74', '.net', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('75', 'c#', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('76', 'asp.net', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('77', 'visual-studio', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('78', 'mvc', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('79', 'microsoft', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('80', '开发工具', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('81', 'vim', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('82', 'emacs', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('83', 'ide', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('84', 'eclipse', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('85', 'xcode', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('86', 'intellij-idea', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('87', 'textmate', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('88', 'sublime-text', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('89', 'visual-studio', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('90', 'git', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('91', 'github', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('92', 'svn', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('93', 'hg', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('94', 'docker', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('95', 'ci', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('96', 'Android 开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('97', 'android', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('98', 'java', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('99', 'eclipse', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('100', 'xml', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('101', 'phonegap', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('102', 'json', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('103', 'webview', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('104', 'android-studio', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('105', 'Ruby 开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('106', 'ruby', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('107', 'ruby-on-rails', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('108', 'rubygems', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('109', 'rvm', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('110', 'macosx', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('111', 'bundle', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('112', '服务器', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('113', 'linux', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('114', 'unix', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('115', 'ubuntu', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('116', 'windows-server', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('117', 'centos', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('118', '负载均衡', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('119', '缓存', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('120', 'apache', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('121', 'nginx', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('122', 'iOS 开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('123', 'ios', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('124', 'objective-c', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('125', 'sqlite', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('126', 'safari', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('127', 'xcode', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('128', 'phonegap', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('129', 'cocoa', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('130', 'javascript', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('131', 'macos', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('132', 'iphone', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('133', 'ipad', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('134', 'swift', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('135', '数据库', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('136', '数据库', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('137', 'mysql', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('138', 'sqlite', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('139', 'oracle', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('140', 'sql', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('141', 'nosql', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('142', 'redis', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('143', 'mongodb', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('144', 'memcached', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('145', 'postgresql', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('146', '云计算', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('147', '云计算', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('148', '又拍云存储', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('149', '七牛云存储', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('150', 'google-app-engine', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('151', 'sina-app-engine', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('152', 'amazon-web-services', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('153', '百度云', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('154', '金山云', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('155', '美团云', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('156', '腾讯云', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('157', '开发语言', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('158', 'java', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('159', 'c', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('160', 'c++', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1');
INSERT INTO `topic` VALUES ('161', 'php', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('162', 'perl', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('163', 'python', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('164', 'javascript', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('165', 'c#', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('166', 'ruby', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('167', 'objective-c', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('168', 'go', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('169', 'lua', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('170', 'node.js', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('171', 'erlang', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('172', 'scala', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('173', 'bash', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('174', 'actionscript', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('176', '编程', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1');
INSERT INTO `topic` VALUES ('177', '编程语言', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('178', '数据结构', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('179', '', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('180', '算法', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('181', 'javaee', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('182', '面向对象编程', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '2');
INSERT INTO `topic` VALUES ('183', '编程语言比较', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('184', '程序员', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('185', '互联网工作', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('186', 'IT 行业', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('187', 'Java 程序员', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('188', '社交网络', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('189', '手机', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('190', '用户界面设计', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('191', '招商银行', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('192', '学习方法', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('193', 'Android 应用设计', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('194', '调查类问题', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('195', '独立开发者', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('196', 'C（编程语言）', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('197', 'Java 编程', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('198', '自学编程', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('199', '互联网', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('200', 'BAT（公司集合）', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('201', '计算机', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('202', '长沙', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('203', '高并发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('204', '转行', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('205', '产品', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('206', '手机游戏', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('207', 'Cocos2d-x', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('208', 'Flappy Bird', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('209', 'CocosEditor', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('210', 'Java EE', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('211', '软件开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('212', 'C / C++', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('213', '电子信息工程', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('214', 'IT 培训', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('215', '教育培训机构', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('216', 'Java Web', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('217', 'IT 男', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('218', '女程序员', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('219', '计算机科学', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('220', 'Ruby on Rails', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('221', 'Django（框架）', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('222', '设计模式', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('223', 'Express（框架）', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('224', 'ThreadLocal', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('225', '移动互联网', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('226', '移动开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('227', '问答', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('228', 'qwe', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('229', 'sadsa', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('230', '[i\'[', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('231', '222', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('232', 'fdsfsdfds', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('233', 'htrhtrhjtr', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('234', '蛤', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('235', 'aaa', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('236', 'token', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('237', '的', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('238', 'D~~D', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0');
INSERT INTO `topic` VALUES ('239', 't', '暂无描述', 'http://localhost/image/topic3.png', '0');
INSERT INTO `topic` VALUES ('240', '蛤，乎', '暂无描述', 'http://localhost/image/topic3.png', '0');
INSERT INTO `topic` VALUES ('241', '发送到', '暂无描述', 'http://localhost/image/topic3.png', '0');
INSERT INTO `topic` VALUES ('242', '对对对', '暂无描述', 'http://localhost/image/topic3.png', '0');
INSERT INTO `topic` VALUES ('243', '，，，', '暂无描述', 'http://localhost/image/topic3.png', '0');
INSERT INTO `topic` VALUES ('244', '123', '暂无描述', 'http://localhost/image/topic3.png', '0');
INSERT INTO `topic` VALUES ('245', '第三方', '暂无描述', 'http://localhost/image/topic3.png', '0');
INSERT INTO `topic` VALUES ('246', '羡慕', '暂无描述', 'http://localhost/image/topic3.png', '0');
INSERT INTO `topic` VALUES ('247', 'dd', '暂无描述', 'http://localhost/image/topic3.png', '0');
INSERT INTO `topic` VALUES ('248', 'introduction', '暂无描述', 'http://localhost/image/topic3.png', '0');
INSERT INTO `topic` VALUES ('249', '爱你妹啊', '暂无描述', 'http://localhost/image/topic3.png', '0');
INSERT INTO `topic` VALUES ('250', '编程；学习；', '暂无描述', 'http://localhost/image/topic3.png', '1');
INSERT INTO `topic` VALUES ('251', '11111', '暂无描述', 'http://localhost/image/topic3.png', '0');
INSERT INTO `topic` VALUES ('252', '发的', '暂无描述', 'http://localhost/image/topic3.png', '0');
INSERT INTO `topic` VALUES ('253', 'dddd;', '暂无描述', 'http://localhost/image/topic3.png', '0');
INSERT INTO `topic` VALUES ('254', '55', '暂无描述', 'http://localhost/image/topic3.png', '0');
INSERT INTO `topic` VALUES ('255', '啦啦啦啦', '暂无描述', 'http://localhost/image/topic3.png', '0');
INSERT INTO `topic` VALUES ('256', '老哥稳', '暂无描述', 'http://localhost/image/topic3.png', '0');
INSERT INTO `topic` VALUES ('257', '人生，诗词', '暂无描述', 'http://localhost/image/topic3.png', '0');

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
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3bad1b8a3c284cab8d19d441651c7615', 'tsai@gmail.com', '123456', '0', '', '0', '小号', '/images/avatar-defualt.jpg', '1', '蔡振亚的小号', '', '', '', '', '', '', '0', '0', '0', '0', '0', '');
INSERT INTO `user` VALUES ('45e6c1985fe640e09cd770d95e6e2c8b', 'cc@126.com', '123', '0', '1212313', '0', 'tsaizhenya', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '社会主义的接班人', '深圳市', '软件工程师', '互联网行业', '杭州有赞科技有限公司java工程师', '本科', '世界上最聪明的人', '12', '23', '34', '345', '3454', '2312312');
INSERT INTO `user` VALUES ('6a99cf86555243ba8b23927c0748b562', '992085263@qq.com', '123456', '0', '', '0', '滕飞', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-6a99cf86555243ba8b23927c0748b562-tengfei.jpg', '1', '世界上最帅最帅最帅的人', '深圳市', '学生', '金融', '', '本科', '', '3', '234', '345', '45', '345', '');
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
