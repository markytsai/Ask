/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : ask

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2018-12-18 21:29:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for answer
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_content` text,
  `disliked_count` int(11) unsigned NOT NULL DEFAULT '0',
  `liked_count` int(11) NOT NULL DEFAULT '0',
  `create_time` datetime DEFAULT NULL,
  `question_id` int(11) NOT NULL,
  `answer_user_id` varchar(128) NOT NULL,
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('1', '测试', '1212', '12', null, '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('33', '<p>前端不太熟~调的蛮久的..</p>', '12', '1', null, '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('34', '<p>我既然提了这个问题 应该自动关注啊</p>', '12', '0', null, '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('35', '<p>买个阿里云部署下就行了～</p>', '12', '2', null, '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('36', '<p><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/15/j_thumb.gif\"><br></p><p><br></p>', '0', '0', null, '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('42', '测试一下', '122', '213', null, '2', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('44', 'qaaaaaa', '2', '1212', null, '2', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('45', '222222222222222', '0', '0', null, '2', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('46', '33333333', '0', '0', null, '2', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('63', '11111212312312312', '0', '0', null, '3', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('65', '可视区域宽 ：document.documentElement.clientWidth  （width + padding）\n\n可视区域高 ：document.documentElement.clientHeight （height + padding）\n\n可视区域宽： document.body.offsetWidth (包括边线的宽： width + padding + border)\n\n可视区域高： document.body.offsetHeight (包括边线的高：height + padding + border)\n\n内容高 ： document.body.scrollHeight\n\n文档高 ： document.body.offsetHeight\n\n纵向滚动的距离 ： document.body.scrollTop || document.documentElement.scrollTop\n\n横向滚动的距离 ： document.body.scrollLeft || document.documentElement.scrollLeft', '0', '0', null, '3', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('66', '啊啊啊啊', '0', '1', null, '45', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('67', '不不不', '0', '0', null, '45', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('68', '踩踩踩踩踩踩', '0', '0', null, '45', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('69', '顶顶顶顶顶顶', '0', '0', null, '45', '45e6c1985fe640e09cd770d95e6e2c8b');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mid_user_collect_answer
-- ----------------------------
INSERT INTO `mid_user_collect_answer` VALUES ('24', '45e6c1985fe640e09cd770d95e6e2c8b', '47', '1');
INSERT INTO `mid_user_collect_answer` VALUES ('25', '45e6c1985fe640e09cd770d95e6e2c8b', '48', '1');

-- ----------------------------
-- Table structure for mid_user_follow_question
-- ----------------------------
DROP TABLE IF EXISTS `mid_user_follow_question`;
CREATE TABLE `mid_user_follow_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '序号',
  `user_id` varchar(128) DEFAULT NULL COMMENT '用户ID',
  `question_id` int(11) DEFAULT NULL COMMENT '问题ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mid_user_follow_question
-- ----------------------------
INSERT INTO `mid_user_follow_question` VALUES ('4', '45e6c1985fe640e09cd770d95e6e2c8b', '4');
INSERT INTO `mid_user_follow_question` VALUES ('5', '45e6c1985fe640e09cd770d95e6e2c8b', '5');
INSERT INTO `mid_user_follow_question` VALUES ('6', '45e6c1985fe640e09cd770d95e6e2c8b', '6');
INSERT INTO `mid_user_follow_question` VALUES ('23', '45e6c1985fe640e09cd770d95e6e2c8b', '3');
INSERT INTO `mid_user_follow_question` VALUES ('24', '45e6c1985fe640e09cd770d95e6e2c8b', '1');
INSERT INTO `mid_user_follow_question` VALUES ('25', '45e6c1985fe640e09cd770d95e6e2c8b', '2');
INSERT INTO `mid_user_follow_question` VALUES ('26', '45e6c1985fe640e09cd770d95e6e2c8b', '32');
INSERT INTO `mid_user_follow_question` VALUES ('27', '45e6c1985fe640e09cd770d95e6e2c8b', '33');
INSERT INTO `mid_user_follow_question` VALUES ('28', '45e6c1985fe640e09cd770d95e6e2c8b', '34');
INSERT INTO `mid_user_follow_question` VALUES ('29', '45e6c1985fe640e09cd770d95e6e2c8b', '35');
INSERT INTO `mid_user_follow_question` VALUES ('30', '45e6c1985fe640e09cd770d95e6e2c8b', '36');
INSERT INTO `mid_user_follow_question` VALUES ('31', '45e6c1985fe640e09cd770d95e6e2c8b', '37');
INSERT INTO `mid_user_follow_question` VALUES ('32', '45e6c1985fe640e09cd770d95e6e2c8b', '38');
INSERT INTO `mid_user_follow_question` VALUES ('33', '45e6c1985fe640e09cd770d95e6e2c8b', '45');

-- ----------------------------
-- Table structure for mid_user_vote_answer
-- ----------------------------
DROP TABLE IF EXISTS `mid_user_vote_answer`;
CREATE TABLE `mid_user_vote_answer` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` varchar(128) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `vote` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'upvate:1;downvote:-1;not vote:0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mid_user_vote_answer
-- ----------------------------
INSERT INTO `mid_user_vote_answer` VALUES ('1', '45e6c1985fe640e09cd770d95e6e2c8b', '1', '0');
INSERT INTO `mid_user_vote_answer` VALUES ('2', '45e6c1985fe640e09cd770d95e6e2c8b', '47', '0');
INSERT INTO `mid_user_vote_answer` VALUES ('3', '45e6c1985fe640e09cd770d95e6e2c8b', '48', '0');
INSERT INTO `mid_user_vote_answer` VALUES ('4', '45e6c1985fe640e09cd770d95e6e2c8b', '66', '0');

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
  `create_time` bigint(20) NOT NULL DEFAULT '0',
  `user_id` varchar(128) NOT NULL,
  `answer_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', '高在哪里？', '高在哪里？啊啊啊啊啊啊啊啊啊啊啊', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '123', '1493871294174', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('2', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊啊', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '123', '1493871303329', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('3', '中国现在有多少程序员？', '中国现在有多少程序员？啊啊啊啊啊啊啊啊', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '3', '1493871312466', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('32', 'Java培训哪家好？', 'muyou', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('33', '请问一个JavaScript、java高手，node.js的一个问题？', 'muyou', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('34', '程序员带孩子是怎样一种体验？', 'muyou', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('35', '零基础自学 Android 并去找工作可行性大么？', 'muyou', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('36', '为什么程序代码被编译成机器码就不能跨平台运行？', 'muyou', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('37', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'muyou', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('38', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', 'muyou', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('39', 'aaaaa', 'aaaaaaaaaaaa', '', '0', '0', '0', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('40', 'bbbbb', 'bbbbb', '', '0', '0', '0', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('41', 'bbbbb', 'bbbbb', '', '0', '0', '0', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('42', 'bbbbb', 'bbbbb', '', '0', '0', '0', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('43', 'bbbbb', 'bbbbb', '', '0', '0', '0', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('44', 'ccc', 'ccccccc', '', '0', '0', '0', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('45', 'dddd', 'dddddd', '', '0', '0', '0', '45e6c1985fe640e09cd770d95e6e2c8b', '0');

-- ----------------------------
-- Table structure for topic
-- ----------------------------
DROP TABLE IF EXISTS `topic`;
CREATE TABLE `topic` (
  `topic_id` int(11) NOT NULL AUTO_INCREMENT,
  `topic_name` varchar(30) NOT NULL DEFAULT '',
  `topic_desc` text,
  `topic_image` varchar(255) NOT NULL DEFAULT 'http://localhost/image/topic3.png',
  `parent_topic_id` int(11) DEFAULT '1',
  `followed_count` int(11) DEFAULT '0',
  PRIMARY KEY (`topic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of topic
-- ----------------------------
INSERT INTO `topic` VALUES ('1', '根话题', '根话题', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0', '0');
INSERT INTO `topic` VALUES ('2', 'Python 开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0', '0');
INSERT INTO `topic` VALUES ('3', 'python', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '2', '1');
INSERT INTO `topic` VALUES ('4', 'list', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '2', '0');
INSERT INTO `topic` VALUES ('5', 'django', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '2', '0');
INSERT INTO `topic` VALUES ('6', 'flask', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '2', '0');
INSERT INTO `topic` VALUES ('7', 'tornado', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '2', '0');
INSERT INTO `topic` VALUES ('8', 'web.py', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '2', '0');
INSERT INTO `topic` VALUES ('9', 'sqlalchemy', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '2', '0');
INSERT INTO `topic` VALUES ('10', 'virtualenv', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '2', '0');
INSERT INTO `topic` VALUES ('11', '搜索', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0', '0');
INSERT INTO `topic` VALUES ('12', '搜索引擎', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '11', '0');
INSERT INTO `topic` VALUES ('13', '中文分词', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '11', '0');
INSERT INTO `topic` VALUES ('14', '全文检索', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '11', '0');
INSERT INTO `topic` VALUES ('15', 'lucene', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '11', '0');
INSERT INTO `topic` VALUES ('16', 'solr', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '11', '0');
INSERT INTO `topic` VALUES ('17', 'sphinx', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '11', '0');
INSERT INTO `topic` VALUES ('18', 'analyzer', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '11', '0');
INSERT INTO `topic` VALUES ('19', 'elasticsearch', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '11', '0');
INSERT INTO `topic` VALUES ('20', '开放平台', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0', '0');
INSERT INTO `topic` VALUES ('21', '新浪微博', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '20', '0');
INSERT INTO `topic` VALUES ('22', '人人网', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '20', '0');
INSERT INTO `topic` VALUES ('23', '微信', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '20', '0');
INSERT INTO `topic` VALUES ('24', '腾讯微博', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '20', '0');
INSERT INTO `topic` VALUES ('25', '百度', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '20', '0');
INSERT INTO `topic` VALUES ('26', 'facebook', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '20', '0');
INSERT INTO `topic` VALUES ('27', 'twitter', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '20', '0');
INSERT INTO `topic` VALUES ('28', '前端开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0', '0');
INSERT INTO `topic` VALUES ('29', 'html', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '28', '0');
INSERT INTO `topic` VALUES ('30', 'html5', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '28', '0');
INSERT INTO `topic` VALUES ('31', 'css', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '28', '0');
INSERT INTO `topic` VALUES ('32', 'css3', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '28', '0');
INSERT INTO `topic` VALUES ('33', 'javascript', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '28', '0');
INSERT INTO `topic` VALUES ('34', 'jquery', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '28', '0');
INSERT INTO `topic` VALUES ('35', 'json', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '28', '0');
INSERT INTO `topic` VALUES ('36', 'ajax', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '28', '0');
INSERT INTO `topic` VALUES ('37', '正则表达式', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '28', '0');
INSERT INTO `topic` VALUES ('38', 'bootstrap', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '28', '0');
INSERT INTO `topic` VALUES ('39', 'JAVA 开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0', '3');
INSERT INTO `topic` VALUES ('40', 'java', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '39', '10');
INSERT INTO `topic` VALUES ('41', 'java-ee', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '39', '0');
INSERT INTO `topic` VALUES ('42', 'jar', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '39', '0');
INSERT INTO `topic` VALUES ('43', 'spring', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '39', '2');
INSERT INTO `topic` VALUES ('44', 'hibernate', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '39', '0');
INSERT INTO `topic` VALUES ('45', 'struts', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '39', '0');
INSERT INTO `topic` VALUES ('46', 'tomcat', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '39', '0');
INSERT INTO `topic` VALUES ('47', 'maven', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '39', '0');
INSERT INTO `topic` VALUES ('48', 'eclipse', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '39', '0');
INSERT INTO `topic` VALUES ('49', 'intellij-idea', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '39', '0');
INSERT INTO `topic` VALUES ('50', 'PHP 开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0', '0');
INSERT INTO `topic` VALUES ('51', 'php', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '50', '0');
INSERT INTO `topic` VALUES ('52', 'mysql', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '50', '0');
INSERT INTO `topic` VALUES ('53', 'apache', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '50', '0');
INSERT INTO `topic` VALUES ('54', 'nginx', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '50', '0');
INSERT INTO `topic` VALUES ('55', 'mvc', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '50', '0');
INSERT INTO `topic` VALUES ('56', 'codeigniter', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '50', '0');
INSERT INTO `topic` VALUES ('57', 'symfony', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '50', '0');
INSERT INTO `topic` VALUES ('58', 'zend-framework', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '50', '0');
INSERT INTO `topic` VALUES ('59', 'composer', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '50', '0');
INSERT INTO `topic` VALUES ('60', 'laravel', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '50', '0');
INSERT INTO `topic` VALUES ('61', 'JavaScript 开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0', '0');
INSERT INTO `topic` VALUES ('62', 'javascript', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '61', '2');
INSERT INTO `topic` VALUES ('63', 'jquery', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '61', '0');
INSERT INTO `topic` VALUES ('64', 'node.js', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '61', '0');
INSERT INTO `topic` VALUES ('65', 'chrome', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '61', '0');
INSERT INTO `topic` VALUES ('66', 'firefox', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '61', '0');
INSERT INTO `topic` VALUES ('67', 'internet-explorer', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '61', '0');
INSERT INTO `topic` VALUES ('68', 'angular.js', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '61', '0');
INSERT INTO `topic` VALUES ('69', 'typescript', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '61', '0');
INSERT INTO `topic` VALUES ('70', 'ecmascript', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '61', '0');
INSERT INTO `topic` VALUES ('71', 'vue.js', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '61', '0');
INSERT INTO `topic` VALUES ('72', 'react.js', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '61', '0');
INSERT INTO `topic` VALUES ('73', '.NET 开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0', '0');
INSERT INTO `topic` VALUES ('74', '.net', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '73', '0');
INSERT INTO `topic` VALUES ('75', 'c#', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '73', '0');
INSERT INTO `topic` VALUES ('76', 'asp.net', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '73', '0');
INSERT INTO `topic` VALUES ('77', 'visual-studio', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '73', '0');
INSERT INTO `topic` VALUES ('78', 'mvc', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '73', '0');
INSERT INTO `topic` VALUES ('79', 'microsoft', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '73', '0');
INSERT INTO `topic` VALUES ('80', '开发工具', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0', '0');
INSERT INTO `topic` VALUES ('81', 'vim', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '80', '0');
INSERT INTO `topic` VALUES ('82', 'emacs', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '80', '0');
INSERT INTO `topic` VALUES ('83', 'ide', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '80', '0');
INSERT INTO `topic` VALUES ('84', 'eclipse', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '80', '0');
INSERT INTO `topic` VALUES ('85', 'xcode', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '80', '0');
INSERT INTO `topic` VALUES ('86', 'intellij-idea', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '80', '0');
INSERT INTO `topic` VALUES ('87', 'textmate', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '80', '0');
INSERT INTO `topic` VALUES ('88', 'sublime-text', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '80', '0');
INSERT INTO `topic` VALUES ('89', 'visual-studio', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '80', '0');
INSERT INTO `topic` VALUES ('90', 'git', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '80', '0');
INSERT INTO `topic` VALUES ('91', 'github', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '80', '0');
INSERT INTO `topic` VALUES ('92', 'svn', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '80', '0');
INSERT INTO `topic` VALUES ('93', 'hg', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '80', '0');
INSERT INTO `topic` VALUES ('94', 'docker', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '80', '0');
INSERT INTO `topic` VALUES ('95', 'ci', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '80', '0');
INSERT INTO `topic` VALUES ('96', 'Android 开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0', '0');
INSERT INTO `topic` VALUES ('97', 'android', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '96', '0');
INSERT INTO `topic` VALUES ('98', 'java', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '96', '0');
INSERT INTO `topic` VALUES ('99', 'eclipse', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '96', '0');
INSERT INTO `topic` VALUES ('100', 'xml', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '96', '0');
INSERT INTO `topic` VALUES ('101', 'phonegap', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '96', '0');
INSERT INTO `topic` VALUES ('102', 'json', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '96', '0');
INSERT INTO `topic` VALUES ('103', 'webview', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '96', '0');
INSERT INTO `topic` VALUES ('104', 'android-studio', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '96', '0');
INSERT INTO `topic` VALUES ('105', 'Ruby 开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0', '0');
INSERT INTO `topic` VALUES ('106', 'ruby', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '105', '0');
INSERT INTO `topic` VALUES ('107', 'ruby-on-rails', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '105', '0');
INSERT INTO `topic` VALUES ('108', 'rubygems', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '105', '0');
INSERT INTO `topic` VALUES ('109', 'rvm', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '105', '0');
INSERT INTO `topic` VALUES ('110', 'macosx', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '105', '0');
INSERT INTO `topic` VALUES ('111', 'bundle', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '105', '0');
INSERT INTO `topic` VALUES ('112', '服务器', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0', '0');
INSERT INTO `topic` VALUES ('113', 'linux', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '112', '0');
INSERT INTO `topic` VALUES ('114', 'unix', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '112', '0');
INSERT INTO `topic` VALUES ('115', 'ubuntu', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '112', '0');
INSERT INTO `topic` VALUES ('116', 'windows-server', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '112', '0');
INSERT INTO `topic` VALUES ('117', 'centos', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '112', '0');
INSERT INTO `topic` VALUES ('118', '负载均衡', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '112', '0');
INSERT INTO `topic` VALUES ('119', '缓存', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '112', '0');
INSERT INTO `topic` VALUES ('120', 'apache', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '112', '0');
INSERT INTO `topic` VALUES ('121', 'nginx', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '112', '0');
INSERT INTO `topic` VALUES ('122', 'iOS 开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0', '0');
INSERT INTO `topic` VALUES ('123', 'ios', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '122', '0');
INSERT INTO `topic` VALUES ('124', 'objective-c', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '122', '0');
INSERT INTO `topic` VALUES ('125', 'sqlite', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '122', '0');
INSERT INTO `topic` VALUES ('126', 'safari', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '122', '0');
INSERT INTO `topic` VALUES ('127', 'xcode', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '122', '0');
INSERT INTO `topic` VALUES ('128', 'phonegap', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '122', '0');
INSERT INTO `topic` VALUES ('129', 'cocoa', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '122', '0');
INSERT INTO `topic` VALUES ('130', 'javascript', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '122', '0');
INSERT INTO `topic` VALUES ('131', 'macos', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '122', '0');
INSERT INTO `topic` VALUES ('132', 'iphone', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '122', '0');
INSERT INTO `topic` VALUES ('133', 'ipad', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '122', '0');
INSERT INTO `topic` VALUES ('134', 'swift', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '122', '0');
INSERT INTO `topic` VALUES ('135', '数据库', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0', '0');
INSERT INTO `topic` VALUES ('136', '数据库', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '135', '0');
INSERT INTO `topic` VALUES ('137', 'mysql', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '135', '0');
INSERT INTO `topic` VALUES ('138', 'sqlite', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '135', '0');
INSERT INTO `topic` VALUES ('139', 'oracle', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '135', '0');
INSERT INTO `topic` VALUES ('140', 'sql', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '135', '0');
INSERT INTO `topic` VALUES ('141', 'nosql', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '135', '0');
INSERT INTO `topic` VALUES ('142', 'redis', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '135', '0');
INSERT INTO `topic` VALUES ('143', 'mongodb', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '135', '0');
INSERT INTO `topic` VALUES ('144', 'memcached', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '135', '0');
INSERT INTO `topic` VALUES ('145', 'postgresql', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '135', '0');
INSERT INTO `topic` VALUES ('146', '云计算', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0', '0');
INSERT INTO `topic` VALUES ('147', '云计算', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '146', '0');
INSERT INTO `topic` VALUES ('148', '又拍云存储', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '146', '0');
INSERT INTO `topic` VALUES ('149', '七牛云存储', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '146', '0');
INSERT INTO `topic` VALUES ('150', 'google-app-engine', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '146', '0');
INSERT INTO `topic` VALUES ('151', 'sina-app-engine', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '146', '0');
INSERT INTO `topic` VALUES ('152', 'amazon-web-services', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '146', '0');
INSERT INTO `topic` VALUES ('153', '百度云', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '146', '0');
INSERT INTO `topic` VALUES ('154', '金山云', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '146', '0');
INSERT INTO `topic` VALUES ('155', '美团云', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '146', '0');
INSERT INTO `topic` VALUES ('156', '腾讯云', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '146', '0');
INSERT INTO `topic` VALUES ('157', '开发语言', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '0', '0');
INSERT INTO `topic` VALUES ('158', 'java', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '157', '0');
INSERT INTO `topic` VALUES ('159', 'c', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '157', '0');
INSERT INTO `topic` VALUES ('160', 'c++', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '157', '1');
INSERT INTO `topic` VALUES ('161', 'php', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '157', '0');
INSERT INTO `topic` VALUES ('162', 'perl', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '157', '0');
INSERT INTO `topic` VALUES ('163', 'python', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '157', '0');
INSERT INTO `topic` VALUES ('164', 'javascript', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '157', '0');
INSERT INTO `topic` VALUES ('165', 'c#', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '157', '0');
INSERT INTO `topic` VALUES ('166', 'ruby', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '157', '0');
INSERT INTO `topic` VALUES ('167', 'objective-c', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '157', '0');
INSERT INTO `topic` VALUES ('168', 'go', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '157', '0');
INSERT INTO `topic` VALUES ('169', 'lua', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '157', '0');
INSERT INTO `topic` VALUES ('170', 'node.js', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '157', '0');
INSERT INTO `topic` VALUES ('171', 'erlang', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '157', '0');
INSERT INTO `topic` VALUES ('172', 'scala', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '157', '0');
INSERT INTO `topic` VALUES ('173', 'bash', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '157', '0');
INSERT INTO `topic` VALUES ('174', 'actionscript', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '157', '0');
INSERT INTO `topic` VALUES ('176', '编程', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '1');
INSERT INTO `topic` VALUES ('177', '编程语言', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('178', '数据结构', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('179', '', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('180', '算法', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('181', 'javaee', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('182', '面向对象编程', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '2');
INSERT INTO `topic` VALUES ('183', '编程语言比较', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('184', '程序员', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('185', '互联网工作', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('186', 'IT 行业', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('187', 'Java 程序员', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('188', '社交网络', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('189', '手机', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('190', '用户界面设计', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('191', '招商银行', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('192', '学习方法', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('193', 'Android 应用设计', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('194', '调查类问题', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('195', '独立开发者', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('196', 'C（编程语言）', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('197', 'Java 编程', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('198', '自学编程', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('199', '互联网', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('200', 'BAT（公司集合）', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('201', '计算机', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('202', '长沙', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('203', '高并发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('204', '转行', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('205', '产品', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('206', '手机游戏', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('207', 'Cocos2d-x', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('208', 'Flappy Bird', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('209', 'CocosEditor', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('210', 'Java EE', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('211', '软件开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('212', 'C / C++', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('213', '电子信息工程', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('214', 'IT 培训', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('215', '教育培训机构', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('216', 'Java Web', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('217', 'IT 男', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('218', '女程序员', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('219', '计算机科学', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('220', 'Ruby on Rails', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('221', 'Django（框架）', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('222', '设计模式', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('223', 'Express（框架）', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('224', 'ThreadLocal', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('225', '移动互联网', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('226', '移动开发', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('227', '问答', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('228', 'qwe', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('229', 'sadsa', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('230', '[i\'[', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('231', '222', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('232', 'fdsfsdfds', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('233', 'htrhtrhjtr', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('234', '蛤', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('235', 'aaa', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('236', 'token', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('237', '的', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('238', 'D~~D', '暂无描述', 'http://od6v5lenq.bkt.clouddn.com/f3da5acb-8cf6-4d78-9dff-9ca23c1f7b85.jpg', '1', '0');
INSERT INTO `topic` VALUES ('239', 't', '暂无描述', 'http://localhost/image/topic3.png', '1', '0');
INSERT INTO `topic` VALUES ('240', '蛤，乎', '暂无描述', 'http://localhost/image/topic3.png', '1', '0');
INSERT INTO `topic` VALUES ('241', '发送到', '暂无描述', 'http://localhost/image/topic3.png', '1', '0');
INSERT INTO `topic` VALUES ('242', '对对对', '暂无描述', 'http://localhost/image/topic3.png', '1', '0');
INSERT INTO `topic` VALUES ('243', '，，，', '暂无描述', 'http://localhost/image/topic3.png', '1', '0');
INSERT INTO `topic` VALUES ('244', '123', '暂无描述', 'http://localhost/image/topic3.png', '1', '0');
INSERT INTO `topic` VALUES ('245', '第三方', '暂无描述', 'http://localhost/image/topic3.png', '1', '0');
INSERT INTO `topic` VALUES ('246', '羡慕', '暂无描述', 'http://localhost/image/topic3.png', '1', '0');
INSERT INTO `topic` VALUES ('247', 'dd', '暂无描述', 'http://localhost/image/topic3.png', '1', '0');
INSERT INTO `topic` VALUES ('248', 'introduction', '暂无描述', 'http://localhost/image/topic3.png', '1', '0');
INSERT INTO `topic` VALUES ('249', '爱你妹啊', '暂无描述', 'http://localhost/image/topic3.png', '1', '0');
INSERT INTO `topic` VALUES ('250', '编程；学习；', '暂无描述', 'http://localhost/image/topic3.png', '1', '1');
INSERT INTO `topic` VALUES ('251', '11111', '暂无描述', 'http://localhost/image/topic3.png', '1', '0');
INSERT INTO `topic` VALUES ('252', '发的', '暂无描述', 'http://localhost/image/topic3.png', '1', '0');
INSERT INTO `topic` VALUES ('253', 'dddd;', '暂无描述', 'http://localhost/image/topic3.png', '1', '0');
INSERT INTO `topic` VALUES ('254', '55', '暂无描述', 'http://localhost/image/topic3.png', '1', '0');
INSERT INTO `topic` VALUES ('255', '啦啦啦啦', '暂无描述', 'http://localhost/image/topic3.png', '1', '0');
INSERT INTO `topic` VALUES ('256', '老哥稳', '暂无描述', 'http://localhost/image/topic3.png', '1', '0');
INSERT INTO `topic` VALUES ('257', '人生，诗词', '暂无描述', 'http://localhost/image/topic3.png', '1', '0');

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
  `avatar_url` varchar(200) NOT NULL DEFAULT '',
  `gender` int(11) NOT NULL DEFAULT '1',
  `simple_desc` varchar(50) NOT NULL DEFAULT '',
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
INSERT INTO `user` VALUES ('45e6c1985fe640e09cd770d95e6e2c8b', 'cc@126.com', '123', '0', '1212313', '0', 'caizhenya', 'http://localhost:8088/images/20181211191204.png', '1', '世界上最聪明的人', '学生', '互联网', 'java实习生', '本科', '修改密码', '0', '0', '0', '0', '0', '2312312');
INSERT INTO `user` VALUES ('6a99cf86555243ba8b23927c0748b562', '992085263@qq.com', '123456', '0', '', '0', 'tengfei', '', '1', '', '', '', '', '', '', '0', '0', '0', '0', '0', '');
