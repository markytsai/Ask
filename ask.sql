/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : ask

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2019-01-13 17:25:19
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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('52', '\n\n                        aaaaa', '0', '0', '1546425832762', '9', '3bad1b8a3c284cab8d19d441651c7615');
INSERT INTO `answer` VALUES ('53', '<span>蔡振亚的小号</span> <span>蔡振亚的小号</span> 问题', '2', '0', '1546425866694', '1', '3bad1b8a3c284cab8d19d441651c7615');
INSERT INTO `answer` VALUES ('81', '<h1>11111问题java</h1>', '0', '0', '1546506595626', '3', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('82', '\n                                \n                                \n                                \n                                \n                                \n                                    \n                                \n                                \n                                \n                                \n                                \n                                \n                                \n                                \n                                \n                                \n                                    \n                                    3333\n                                \n                                \n                                \n                                \n                                \n                                \n                            ', '0', '0', '1546609620039', '10', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('83', '\n\n                        <div><span style=\"color: rgb(51, 51, 51);\">java工程师</span></div>', '0', '0', '1547292825997', '1', '45e6c1985fe640e09cd770d95e6e2c8b');

-- ----------------------------
-- Table structure for answer_comment
-- ----------------------------
DROP TABLE IF EXISTS `answer_comment`;
CREATE TABLE `answer_comment` (
  `answer_comment_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '回答评论ID',
  `answer_comment_content` text NOT NULL COMMENT '回答评论内容',
  `liked_count` int(11) NOT NULL DEFAULT '0' COMMENT '回答评论赞同数量',
  `create_time` bigint(20) NOT NULL DEFAULT '0',
  `at_user_id` varchar(11) DEFAULT '',
  `at_user_name` varchar(100) DEFAULT '',
  `answer_id` int(50) NOT NULL DEFAULT '0' COMMENT '回答ID',
  `user_id` varchar(128) DEFAULT '' COMMENT '回答评论作者ID',
  PRIMARY KEY (`answer_comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answer_comment
-- ----------------------------
INSERT INTO `answer_comment` VALUES ('1', '展讯萌超越mtk吗？感觉难。。拿着补贴打价格战刷销量。。至于中芯国际和台积电，就更没办法比了，这不是技术问题，而是先进的光刻机都被外国封锁了，怎么在超越？巧妇难为无米之炊啊。。', '0', '1493605918130', null, null, '53', '6a99cf86555243ba8b23927c0748b562');
INSERT INTO `answer_comment` VALUES ('2', '展讯不行有海思，海思不行还有其他。smic现在是有差距，不过以前差距更大，不过高端光刻机这点我是不认同的，想搞一定能搞到，不要人云亦云。我不回避差距，但无疑我们现在有正视问题的经济实力，缺的是点恒心。', '0', '1493644376202', null, null, '53', '6a99cf86555243ba8b23927c0748b562');
INSERT INTO `answer_comment` VALUES ('3', '而且很多人都很清醒，我觉得这是好事。另外光刻机这事我没法给你举例子和渠道。你就随便听听吧。主要是管中窥豹举个栗子，说说台湾问题。', '0', '1494319166237', null, null, '53', '6a99cf86555243ba8b23927c0748b562');
INSERT INTO `answer_comment` VALUES ('4', '和我同年生，我92年，帝都某学校医学硕士，毕业得回省会了，在北京太没意思了，不愿意费尽一生的精力就为了一个睡觉的地方，况且，光是住就费劲了自己的精力，那其他所谓城市的优势和我不会有任何关系的', '0', '1494319193706', '31', 'fanfan', '53', '6a99cf86555243ba8b23927c0748b562');
INSERT INTO `answer_comment` VALUES ('5', '加油！我大三了 双非破烂二本我都幻想自己可以在这里扎下根，觉的自己还真是年少无知……', '0', '1494494102802', null, null, '53', '6a99cf86555243ba8b23927c0748b562');
INSERT INTO `answer_comment` VALUES ('6', '加油啦，你自己有想留下来的信念比什么都重要！我就是比较不坚定才会觉得不开心。而且就留北京这件事来说，驻京高校比起京外高校还是有一定优势的嘛', '0', '1494494115474', null, null, '53', '6a99cf86555243ba8b23927c0748b562');
INSERT INTO `answer_comment` VALUES ('7', '福利~~我当时就是不知道户口重要，稀里糊涂去了外企，现在虽然有房，但孩子户口还没地方放呢。', '0', '1494506267077', null, null, '53', '6a99cf86555243ba8b23927c0748b562');
INSERT INTO `answer_comment` VALUES ('35', '地ask的发掘士大夫上来打飞机收到发', '0', '1547368116850', '', '', '53', '6a99cf86555243ba8b23927c0748b562');
INSERT INTO `answer_comment` VALUES ('36', '同样的状况，差不多时间入职，户口违约金30万，服务年限10年，每年递减10%，工作没干劲，想走暂时走不了，又要面临离职带来的违约金赔偿，其他生活问题就太多了。', '0', '1547369544888', '', '', '83', '6a99cf86555243ba8b23927c0748b562');
INSERT INTO `answer_comment` VALUES ('37', '我在一家店打工两年了，店员都非常随和有礼貌，起初大家都还都不熟，所以说的话都是一本正经，后来就有点画风诡异…店里的男生店员也好女生店员也好，经常讨论他们的那些恋爱故事，跟我混熟之后也会来跟我讲他们是怎么脚踏N条船的，或者某些“恋爱密话”，店里的厨师都是单身，但是今年有两个男士闪婚了，都是奉子成婚，并且其中一个在老婆怀孕期间还公开表示想和我们店里另一个可爱的女生约会并且让我去帮他联系……这也就算了，刚交到女朋友的副厨还十分为他的稀有行为沾沾自喜\n\n', '0', '1547369551278', '', '', '83', '6a99cf86555243ba8b23927c0748b562');
INSERT INTO `answer_comment` VALUES ('39', '我去', '0', '1547369594152', '', '', '83', '6a99cf86555243ba8b23927c0748b562');
INSERT INTO `answer_comment` VALUES ('41', '是么', '0', '1547370619562', '', '', '53', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer_comment` VALUES ('42', 'is that so?', '0', '1547370627209', '', '', '53', '45e6c1985fe640e09cd770d95e6e2c8b');

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
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mid_question_topic
-- ----------------------------
INSERT INTO `mid_question_topic` VALUES ('1', '1', '2');
INSERT INTO `mid_question_topic` VALUES ('2', '18', '2');
INSERT INTO `mid_question_topic` VALUES ('4', '19', '2');
INSERT INTO `mid_question_topic` VALUES ('5', '987', '2');
INSERT INTO `mid_question_topic` VALUES ('6', '988', '179');
INSERT INTO `mid_question_topic` VALUES ('7', '989', '179');
INSERT INTO `mid_question_topic` VALUES ('8', '990', '179');
INSERT INTO `mid_question_topic` VALUES ('9', '992', '2');
INSERT INTO `mid_question_topic` VALUES ('10', '993', '8');
INSERT INTO `mid_question_topic` VALUES ('11', '993', '8');
INSERT INTO `mid_question_topic` VALUES ('12', '993', '8');
INSERT INTO `mid_question_topic` VALUES ('13', '993', '8');
INSERT INTO `mid_question_topic` VALUES ('14', '994', '7');
INSERT INTO `mid_question_topic` VALUES ('15', '994', '7');
INSERT INTO `mid_question_topic` VALUES ('16', '994', '7');
INSERT INTO `mid_question_topic` VALUES ('17', '995', '3');
INSERT INTO `mid_question_topic` VALUES ('18', '995', '3');
INSERT INTO `mid_question_topic` VALUES ('19', '996', '3');
INSERT INTO `mid_question_topic` VALUES ('20', '996', '3');
INSERT INTO `mid_question_topic` VALUES ('21', '997', '2');
INSERT INTO `mid_question_topic` VALUES ('22', '997', '3');
INSERT INTO `mid_question_topic` VALUES ('23', '997', '12');
INSERT INTO `mid_question_topic` VALUES ('24', '998', '4');
INSERT INTO `mid_question_topic` VALUES ('25', '998', '5');
INSERT INTO `mid_question_topic` VALUES ('26', '999', '69');
INSERT INTO `mid_question_topic` VALUES ('27', '1000', '3');
INSERT INTO `mid_question_topic` VALUES ('28', '1001', '3');
INSERT INTO `mid_question_topic` VALUES ('29', '1002', '3');
INSERT INTO `mid_question_topic` VALUES ('30', '1003', '3');
INSERT INTO `mid_question_topic` VALUES ('31', '1004', '3');
INSERT INTO `mid_question_topic` VALUES ('32', '1005', '5');
INSERT INTO `mid_question_topic` VALUES ('33', '1006', '5');
INSERT INTO `mid_question_topic` VALUES ('34', '1007', '5');
INSERT INTO `mid_question_topic` VALUES ('35', '1008', '5');
INSERT INTO `mid_question_topic` VALUES ('36', '1009', '5');
INSERT INTO `mid_question_topic` VALUES ('37', '1010', '3');
INSERT INTO `mid_question_topic` VALUES ('38', '1011', '5');
INSERT INTO `mid_question_topic` VALUES ('39', '1012', '3');
INSERT INTO `mid_question_topic` VALUES ('40', '1013', '5');
INSERT INTO `mid_question_topic` VALUES ('41', '1014', '5');
INSERT INTO `mid_question_topic` VALUES ('42', '1015', '5');
INSERT INTO `mid_question_topic` VALUES ('43', '1016', '5');
INSERT INTO `mid_question_topic` VALUES ('44', '1017', '5');
INSERT INTO `mid_question_topic` VALUES ('45', '1018', '5');
INSERT INTO `mid_question_topic` VALUES ('46', '1019', '5');
INSERT INTO `mid_question_topic` VALUES ('47', '1020', '5');
INSERT INTO `mid_question_topic` VALUES ('48', '1021', '5');
INSERT INTO `mid_question_topic` VALUES ('49', '1022', '5');
INSERT INTO `mid_question_topic` VALUES ('50', '1023', '5');
INSERT INTO `mid_question_topic` VALUES ('51', '1024', '5');
INSERT INTO `mid_question_topic` VALUES ('52', '1025', '5');
INSERT INTO `mid_question_topic` VALUES ('53', '1026', '5');
INSERT INTO `mid_question_topic` VALUES ('54', '1027', '5');
INSERT INTO `mid_question_topic` VALUES ('55', '1028', '244');
INSERT INTO `mid_question_topic` VALUES ('56', '1029', '5');
INSERT INTO `mid_question_topic` VALUES ('57', '1030', '5');
INSERT INTO `mid_question_topic` VALUES ('58', '1031', '5');
INSERT INTO `mid_question_topic` VALUES ('59', '1032', '20');

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mid_user_collect_answer
-- ----------------------------
INSERT INTO `mid_user_collect_answer` VALUES ('52', '45e6c1985fe640e09cd770d95e6e2c8b', '53', '1', '1547362009737');

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
) ENGINE=InnoDB AUTO_INCREMENT=82 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mid_user_follow_question
-- ----------------------------
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
INSERT INTO `mid_user_follow_question` VALUES ('27', '45e6c1985fe640e09cd770d95e6e2c8b', '12', '1546927214061');
INSERT INTO `mid_user_follow_question` VALUES ('28', '45e6c1985fe640e09cd770d95e6e2c8b', '13', '1546927279889');
INSERT INTO `mid_user_follow_question` VALUES ('29', '45e6c1985fe640e09cd770d95e6e2c8b', '14', '1546927362094');
INSERT INTO `mid_user_follow_question` VALUES ('30', '45e6c1985fe640e09cd770d95e6e2c8b', '15', '1546927591125');
INSERT INTO `mid_user_follow_question` VALUES ('31', '45e6c1985fe640e09cd770d95e6e2c8b', '16', '1546927636830');
INSERT INTO `mid_user_follow_question` VALUES ('32', '45e6c1985fe640e09cd770d95e6e2c8b', '17', '1546927774870');
INSERT INTO `mid_user_follow_question` VALUES ('33', '45e6c1985fe640e09cd770d95e6e2c8b', '18', '1546929688990');
INSERT INTO `mid_user_follow_question` VALUES ('34', '45e6c1985fe640e09cd770d95e6e2c8b', '19', '1546934343055');
INSERT INTO `mid_user_follow_question` VALUES ('35', '45e6c1985fe640e09cd770d95e6e2c8b', '987', '1547018076443');
INSERT INTO `mid_user_follow_question` VALUES ('36', '45e6c1985fe640e09cd770d95e6e2c8b', '988', '1547018835389');
INSERT INTO `mid_user_follow_question` VALUES ('37', '45e6c1985fe640e09cd770d95e6e2c8b', '989', '1547018939994');
INSERT INTO `mid_user_follow_question` VALUES ('38', '45e6c1985fe640e09cd770d95e6e2c8b', '990', '1547019699242');
INSERT INTO `mid_user_follow_question` VALUES ('39', '45e6c1985fe640e09cd770d95e6e2c8b', '991', '1547042892891');
INSERT INTO `mid_user_follow_question` VALUES ('40', '45e6c1985fe640e09cd770d95e6e2c8b', '992', '1547042930308');
INSERT INTO `mid_user_follow_question` VALUES ('41', '45e6c1985fe640e09cd770d95e6e2c8b', '993', '1547043030188');
INSERT INTO `mid_user_follow_question` VALUES ('42', '45e6c1985fe640e09cd770d95e6e2c8b', '994', '1547050689950');
INSERT INTO `mid_user_follow_question` VALUES ('43', '45e6c1985fe640e09cd770d95e6e2c8b', '995', '1547050762507');
INSERT INTO `mid_user_follow_question` VALUES ('44', '45e6c1985fe640e09cd770d95e6e2c8b', '996', '1547050875761');
INSERT INTO `mid_user_follow_question` VALUES ('45', '45e6c1985fe640e09cd770d95e6e2c8b', '997', '1547051040364');
INSERT INTO `mid_user_follow_question` VALUES ('46', '45e6c1985fe640e09cd770d95e6e2c8b', '998', '1547089348147');
INSERT INTO `mid_user_follow_question` VALUES ('47', '45e6c1985fe640e09cd770d95e6e2c8b', '999', '1547089408691');
INSERT INTO `mid_user_follow_question` VALUES ('48', '45e6c1985fe640e09cd770d95e6e2c8b', '1000', '1547093820359');
INSERT INTO `mid_user_follow_question` VALUES ('49', '45e6c1985fe640e09cd770d95e6e2c8b', '1001', '1547095328721');
INSERT INTO `mid_user_follow_question` VALUES ('50', '45e6c1985fe640e09cd770d95e6e2c8b', '1002', '1547096395946');
INSERT INTO `mid_user_follow_question` VALUES ('51', '45e6c1985fe640e09cd770d95e6e2c8b', '1003', '1547096848112');
INSERT INTO `mid_user_follow_question` VALUES ('52', '45e6c1985fe640e09cd770d95e6e2c8b', '1004', '1547098160563');
INSERT INTO `mid_user_follow_question` VALUES ('53', '45e6c1985fe640e09cd770d95e6e2c8b', '1005', '1547098864622');
INSERT INTO `mid_user_follow_question` VALUES ('54', '45e6c1985fe640e09cd770d95e6e2c8b', '1006', '1547100613954');
INSERT INTO `mid_user_follow_question` VALUES ('55', '45e6c1985fe640e09cd770d95e6e2c8b', '1007', '1547100663354');
INSERT INTO `mid_user_follow_question` VALUES ('56', '45e6c1985fe640e09cd770d95e6e2c8b', '1008', '1547100837044');
INSERT INTO `mid_user_follow_question` VALUES ('57', '45e6c1985fe640e09cd770d95e6e2c8b', '1009', '1547100962522');
INSERT INTO `mid_user_follow_question` VALUES ('58', '45e6c1985fe640e09cd770d95e6e2c8b', '1010', '1547101217805');
INSERT INTO `mid_user_follow_question` VALUES ('59', '45e6c1985fe640e09cd770d95e6e2c8b', '1011', '1547101520911');
INSERT INTO `mid_user_follow_question` VALUES ('60', '45e6c1985fe640e09cd770d95e6e2c8b', '1012', '1547102831077');
INSERT INTO `mid_user_follow_question` VALUES ('61', '45e6c1985fe640e09cd770d95e6e2c8b', '1013', '1547102855872');
INSERT INTO `mid_user_follow_question` VALUES ('62', '45e6c1985fe640e09cd770d95e6e2c8b', '1014', '1547102897501');
INSERT INTO `mid_user_follow_question` VALUES ('63', '45e6c1985fe640e09cd770d95e6e2c8b', '1015', '1547102925505');
INSERT INTO `mid_user_follow_question` VALUES ('64', '45e6c1985fe640e09cd770d95e6e2c8b', '1016', '1547102997616');
INSERT INTO `mid_user_follow_question` VALUES ('65', '45e6c1985fe640e09cd770d95e6e2c8b', '1017', '1547103135829');
INSERT INTO `mid_user_follow_question` VALUES ('66', '45e6c1985fe640e09cd770d95e6e2c8b', '1018', '1547105995511');
INSERT INTO `mid_user_follow_question` VALUES ('67', '45e6c1985fe640e09cd770d95e6e2c8b', '1019', '1547106061768');
INSERT INTO `mid_user_follow_question` VALUES ('68', '45e6c1985fe640e09cd770d95e6e2c8b', '1020', '1547106196356');
INSERT INTO `mid_user_follow_question` VALUES ('69', '45e6c1985fe640e09cd770d95e6e2c8b', '1021', '1547106298934');
INSERT INTO `mid_user_follow_question` VALUES ('70', '3bad1b8a3c284cab8d19d441651c7615', '1022', '1547106950771');
INSERT INTO `mid_user_follow_question` VALUES ('71', '3bad1b8a3c284cab8d19d441651c7615', '1023', '1547106979771');
INSERT INTO `mid_user_follow_question` VALUES ('72', '3bad1b8a3c284cab8d19d441651c7615', '1024', '1547107080674');
INSERT INTO `mid_user_follow_question` VALUES ('73', '3bad1b8a3c284cab8d19d441651c7615', '1025', '1547107220756');
INSERT INTO `mid_user_follow_question` VALUES ('74', '3bad1b8a3c284cab8d19d441651c7615', '1026', '1547107383562');
INSERT INTO `mid_user_follow_question` VALUES ('75', '3bad1b8a3c284cab8d19d441651c7615', '1027', '1547107625800');
INSERT INTO `mid_user_follow_question` VALUES ('76', '45e6c1985fe640e09cd770d95e6e2c8b', '1028', '1547110484010');
INSERT INTO `mid_user_follow_question` VALUES ('77', '45e6c1985fe640e09cd770d95e6e2c8b', '1029', '1547110700302');
INSERT INTO `mid_user_follow_question` VALUES ('78', '45e6c1985fe640e09cd770d95e6e2c8b', '1030', '1547110898342');
INSERT INTO `mid_user_follow_question` VALUES ('79', '45e6c1985fe640e09cd770d95e6e2c8b', '1031', '1547110966376');
INSERT INTO `mid_user_follow_question` VALUES ('80', '45e6c1985fe640e09cd770d95e6e2c8b', '1032', '1547197911362');
INSERT INTO `mid_user_follow_question` VALUES ('81', '45e6c1985fe640e09cd770d95e6e2c8b', '1', '1547260889784');

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mid_user_follow_topic
-- ----------------------------
INSERT INTO `mid_user_follow_topic` VALUES ('3', '45e6c1985fe640e09cd770d95e6e2c8b', '2', '0');
INSERT INTO `mid_user_follow_topic` VALUES ('4', '45e6c1985fe640e09cd770d95e6e2c8b', '3', '1');

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
INSERT INTO `mid_user_follow_user` VALUES ('5', '45e6c1985fe640e09cd770d95e6e2c8b', '6a99cf86555243ba8b23927c0748b562', '0', '1547257501808');

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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mid_user_vote_answer
-- ----------------------------
INSERT INTO `mid_user_vote_answer` VALUES ('9', '45e6c1985fe640e09cd770d95e6e2c8b', '53', '1', '1547024917634');
INSERT INTO `mid_user_vote_answer` VALUES ('11', '45e6c1985fe640e09cd770d95e6e2c8b', '79', '1', '1546492981705');
INSERT INTO `mid_user_vote_answer` VALUES ('13', '45e6c1985fe640e09cd770d95e6e2c8b', '81', '0', '1546506615115');
INSERT INTO `mid_user_vote_answer` VALUES ('14', '3bad1b8a3c284cab8d19d441651c7615', '53', '1', '1547034809065');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `question_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_title` varchar(255) NOT NULL DEFAULT '',
  `question_content` mediumtext,
  `topic_kv_list` varchar(200) NOT NULL DEFAULT '',
  `followed_count` int(11) NOT NULL DEFAULT '0',
  `scanned_count` int(11) NOT NULL DEFAULT '0',
  `create_time` bigint(13) NOT NULL DEFAULT '0',
  `user_id` varchar(128) NOT NULL,
  `answer_count` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1033 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', 'java开发，入职半年。对未来迷茫，如何发展？', '各位前辈你们好。今年三月实习到最近转正，工作了这半年，现在感觉对未来很迷茫。我想努力提升自己的能力，在工作中，大部分时间都在写着重复的业务代码。感觉成长很低。自己每天上下班五个小时，都在车上看视频学习技术，但是在实际的公司开发中，都用不到。因为公司用的后端技术比较旧，还是用的servlet加jsp和公司自己封装的很多组件api进行开发。我想努力成为一名真正的java开发工程师，一步一步。自己该如何走下去？现在在公司，脑子里面全是如何提升自己的技术，我该学习哪些技术呢？现在自己自学了ssm和ssh。', '', '3', '0', '1546138996000', '45e6c1985fe640e09cd770d95e6e2c8b', '2');
INSERT INTO `question` VALUES ('2', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '', '1', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('3', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '1');
INSERT INTO `question` VALUES ('4', '如何看待大疆员工猝死？', '才刚毕业几个月就去世了,真让人心寒', '', '1', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('5', 'PowerPoint 到底有多厉害？', '因为见识了Excel 到底有多厉害？ - 软件，所以想看看PPT的过人之处', '', '2', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('6', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('7', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('8', '有没有bootstrap 学习的例子?', '有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?有没有 SpringMVC + Angular + bootstrap 学习的例子?v', '', '1', '0', '1546138993520', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('9', '小号的第一个问题', '', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('10', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('17', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('18', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('19', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('20', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('21', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('22', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('23', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('24', 'Java 的开发效率究竟比 C++ 高在哪里', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('25', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('26', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('27', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('28', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('29', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('30', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('31', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '45e6c1985fe640e09cd770d95e6e2c8b', '0');
INSERT INTO `question` VALUES ('32', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('33', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('34', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('35', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('36', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('37', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('38', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('39', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('40', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('41', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('42', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('43', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('44', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('45', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('46', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('47', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('48', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('49', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('50', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('51', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('52', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('53', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('54', '测试一下', '测试一下测试一下', '{227:\"问答\"}', '0', '0', '1494318212279', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('55', 'qwe', 'qweqwe', '{228:\"qwe\"}', '0', '0', '1494501057712', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('56', 'aaaa', 'aaaaaaaa', '{229:\"sadsa\"}', '0', '0', '1494506307494', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('57', 'niaho', 'niahoniaho', '{230:\"[i\'[\"}', '0', '0', '1494832881249', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('58', '111', '111111', '{231:\"222\"}', '0', '0', '1495038405362', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('59', 'java怎么中怎么调用redis呢？', 'java怎么中怎么调用redis呢？java怎么中怎么调用redis呢？', '{142:\"redis\",40:\"java\"}', '0', '0', '1495183099210', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('60', 'test', 'testtest', '{40:\"java\"}', '0', '0', '1495715222731', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('61', 'vkjdhfskdhfsdihisud', 'vkjdhfskdhfsdihisudvkjdhfskdhfsdihisud', '{232:\"fdsfsdfds\"}', '0', '0', '1495891062877', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('62', '编程', '编程编程', '{176:\"编程\"}', '0', '0', '1496217738790', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('63', 'centos6安装vsftps', 'centos6安装vsftpscentos6安装vsftps', '{117:\"centos\",113:\"linux\"}', '0', '0', '1496557632931', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('64', 'htrhtrhjtrjtr', 'htrhtrhjtrjtrhtrhtrhjtrjtr', '{233:\"htrhtrhjtr\"}', '0', '0', '1496754587486', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('65', '知乎慕名而来', '知乎慕名而来知乎慕名而来', '{234:\"蛤\"}', '0', '0', '1497533564908', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('66', 'aaaa', 'aaaaaaaa', '{235:\"aaa\"}', '0', '0', '1498324622022', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('67', '不知道在这会不会有人看到。。。。。。。', '不知道在这会不会有人看到。。。。。。。不知道在这会不会有人看到。。。。。。。', '{236:\"token\"}', '0', '0', '1498715827273', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('68', '的淡淡的', '的淡淡的的淡淡的', '{237:\"的\"}', '0', '0', '1499139633678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('69', '搜索好像不太能用是吗', '搜索好像不太能用是吗搜索好像不太能用是吗', '{238:\"D~~D\"}', '0', '0', '1499409950503', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('70', 'hi', 'hihi', '{239:\"t\"}', '0', '0', '1499493026483', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('71', '蛤呢', '蛤呢蛤呢', '{240:\"蛤，乎\"}', '0', '0', '1499494404000', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('72', '我觉得做的非常棒，大家觉得如何？', '我觉得做的非常棒，大家觉得如何？我觉得做的非常棒，大家觉得如何？', '{241:\"发送到\"}', '0', '0', '1499498784247', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('73', 'php已经死了吗', 'php已经死了吗php已经死了吗', '{3:\"python\"}', '0', '0', '1499500995774', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('74', '好牛逼的网站啊', '好牛逼的网站啊好牛逼的网站啊', '{242:\"对对对\"}', '0', '0', '1499522972644', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('75', '可以的', '可以的可以的', '{243:\"，，，\"}', '0', '0', '1499523421298', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('76', '123', '123123', '{244:\"123\"}', '0', '0', '1499526679512', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('77', '棒棒棒~', '棒棒棒~棒棒棒~', '{245:\"第三方\"}', '0', '0', '1499528049863', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('78', '123', '123123', '{244:\"123\"}', '0', '0', '1499675233218', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('79', '我擦', '我擦我擦', '{246:\"羡慕\"}', '0', '0', '1499680190905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('80', 'sdsd', 'sdsdsdsd', '{247:\"dd\"}', '0', '0', '1499698509558', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('81', '不错不错', '不错不错不错不错', '{248:\"introduction\"}', '0', '0', '1499743553681', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('82', '我爱你', '我爱你我爱你', '{249:\"爱你妹啊\"}', '0', '0', '1499746166682', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('83', '哈哈哈', '哈哈哈哈哈哈', '{40:\"java\"}', '0', '0', '1499754444950', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('84', '哈哈哈', '哈哈哈哈哈哈', '{40:\"java\"}', '0', '0', '1499754444953', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('85', '这是哪门课的作业呀~好棒~ ', '这是哪门课的作业呀~好棒~ 这是哪门课的作业呀~好棒~ ', '{250:\"编程；学习；\"}', '0', '0', '1499760469612', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('86', '111', '111111', '{251:\"11111\"}', '0', '0', '1499762313883', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('87', '哎呀，可以的', '哎呀，可以的哎呀，可以的', '{252:\"发的\"}', '0', '0', '1499772183106', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('88', 'dsadas', 'dsadasdsadas', '{253:\"dddd;\"}', '0', '0', '1499778766471', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('89', '厉害啊', '厉害啊厉害啊', '{254:\"55\"}', '0', '0', '1499832913241', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('90', '为何左上角有一个分号', '为何左上角有一个分号为何左上角有一个分号', '{255:\"啦啦啦啦\"}', '0', '0', '1499832989704', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('91', 'redis如何学习！！！', 'redis如何学习！！！redis如何学习！！！', '{256:\"老哥稳\"}', '0', '0', '1499874072940', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('92', '7-13到此一游', '7-13到此一游7-13到此一游', '{43:\"spring\",40:\"java  \"}', '0', '0', '1499928433710', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('93', '有一句诗不知当念不当念', '有一句诗不知当念不当念有一句诗不知当念不当念', '{257:\"人生，诗词\"}', '0', '0', '1500026321404', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('94', 'java开发，入职半年。对未来迷茫，如何发展？', 'java开发，入职半年。对未来迷茫，如何发展？java开发，入职半年。对未来迷茫，如何发展？', '', '3', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '3');
INSERT INTO `question` VALUES ('95', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('96', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('97', '如何看待大疆员工猝死？', '如何看待大疆员工猝死？如何看待大疆员工猝死？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('98', 'PowerPoint 到底有多厉害？', 'PowerPoint 到底有多厉害？PowerPoint 到底有多厉害？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('99', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('100', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('101', '有没有bootstrap 学习的例子?', '有没有bootstrap 学习的例子?有没有bootstrap 学习的例子?', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('102', '小号的第一个问题', '小号的第一个问题小号的第一个问题', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('103', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('104', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('105', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('106', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('107', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('108', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('109', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('110', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('111', 'Java 的开发效率究竟比 C++ 高在哪里？', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('112', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('113', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('114', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('115', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('116', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('117', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('118', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('119', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('120', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('121', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('122', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('123', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('124', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('125', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('126', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('127', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('128', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('129', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('130', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('131', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('132', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('133', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('134', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('135', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('136', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('137', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('138', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('139', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('140', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('141', 'java开发，入职半年。对未来迷茫，如何发展？', 'java开发，入职半年。对未来迷茫，如何发展？java开发，入职半年。对未来迷茫，如何发展？', '', '3', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '3');
INSERT INTO `question` VALUES ('142', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('143', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('144', '如何看待大疆员工猝死？', '如何看待大疆员工猝死？如何看待大疆员工猝死？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('145', 'PowerPoint 到底有多厉害？', 'PowerPoint 到底有多厉害？PowerPoint 到底有多厉害？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('146', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('147', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('148', '有没有bootstrap 学习的例子?', '有没有bootstrap 学习的例子?有没有bootstrap 学习的例子?', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('149', '小号的第一个问题', '小号的第一个问题小号的第一个问题', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('150', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('151', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('152', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('153', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('154', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('155', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('156', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('157', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('158', 'Java 的开发效率究竟比 C++ 高在哪里？', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('159', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('160', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('161', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('162', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('163', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('164', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('165', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('166', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('167', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('168', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('169', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('170', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('171', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('172', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('173', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('174', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('175', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('176', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('177', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('178', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('179', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('180', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('181', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('182', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('183', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('184', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('185', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('186', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('187', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('188', 'java开发，入职半年。对未来迷茫，如何发展？', 'java开发，入职半年。对未来迷茫，如何发展？java开发，入职半年。对未来迷茫，如何发展？', '', '3', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '3');
INSERT INTO `question` VALUES ('189', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('190', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('191', '如何看待大疆员工猝死？', '如何看待大疆员工猝死？如何看待大疆员工猝死？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('192', 'PowerPoint 到底有多厉害？', 'PowerPoint 到底有多厉害？PowerPoint 到底有多厉害？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('193', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('194', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('195', '有没有bootstrap 学习的例子?', '有没有bootstrap 学习的例子?有没有bootstrap 学习的例子?', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('196', '小号的第一个问题', '小号的第一个问题小号的第一个问题', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('197', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('198', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('199', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('200', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('201', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('202', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('203', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('204', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('205', 'Java 的开发效率究竟比 C++ 高在哪里？', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('206', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('207', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('208', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('209', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('210', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('211', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('212', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('213', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('214', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('215', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('216', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('217', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('218', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('219', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('220', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('221', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('222', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('223', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('224', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('225', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('226', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('227', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('228', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('229', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('230', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('231', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('232', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('233', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('234', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('235', 'java开发，入职半年。对未来迷茫，如何发展？', 'java开发，入职半年。对未来迷茫，如何发展？java开发，入职半年。对未来迷茫，如何发展？', '', '3', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '3');
INSERT INTO `question` VALUES ('236', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('237', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('238', '如何看待大疆员工猝死？', '如何看待大疆员工猝死？如何看待大疆员工猝死？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('239', 'PowerPoint 到底有多厉害？', 'PowerPoint 到底有多厉害？PowerPoint 到底有多厉害？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('240', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('241', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('242', '有没有bootstrap 学习的例子?', '有没有bootstrap 学习的例子?有没有bootstrap 学习的例子?', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('243', '小号的第一个问题', '小号的第一个问题小号的第一个问题', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('244', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('245', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('246', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('247', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('248', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('249', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('250', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('251', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('252', 'Java 的开发效率究竟比 C++ 高在哪里？', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('253', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('254', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('255', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('256', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('257', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('258', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('259', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('260', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('261', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('262', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('263', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('264', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('265', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('266', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('267', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('268', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('269', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('270', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('271', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('272', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('273', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('274', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('275', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('276', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('277', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('278', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('279', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('280', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('281', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('282', 'java开发，入职半年。对未来迷茫，如何发展？', 'java开发，入职半年。对未来迷茫，如何发展？java开发，入职半年。对未来迷茫，如何发展？', '', '3', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '3');
INSERT INTO `question` VALUES ('283', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('284', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('285', '如何看待大疆员工猝死？', '如何看待大疆员工猝死？如何看待大疆员工猝死？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('286', 'PowerPoint 到底有多厉害？', 'PowerPoint 到底有多厉害？PowerPoint 到底有多厉害？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('287', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('288', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('289', '有没有bootstrap 学习的例子?', '有没有bootstrap 学习的例子?有没有bootstrap 学习的例子?', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('290', '小号的第一个问题', '小号的第一个问题小号的第一个问题', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('291', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('292', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('293', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('294', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('295', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('296', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('297', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('298', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('299', 'Java 的开发效率究竟比 C++ 高在哪里？', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('300', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('301', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('302', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('303', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('304', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('305', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('306', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('307', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('308', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('309', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('310', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('311', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('312', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('313', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('314', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('315', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('316', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('317', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('318', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('319', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('320', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('321', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('322', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('323', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('324', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('325', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('326', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('327', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('328', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('329', 'java开发，入职半年。对未来迷茫，如何发展？', 'java开发，入职半年。对未来迷茫，如何发展？java开发，入职半年。对未来迷茫，如何发展？', '', '3', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '3');
INSERT INTO `question` VALUES ('330', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('331', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('332', '如何看待大疆员工猝死？', '如何看待大疆员工猝死？如何看待大疆员工猝死？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('333', 'PowerPoint 到底有多厉害？', 'PowerPoint 到底有多厉害？PowerPoint 到底有多厉害？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('334', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('335', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('336', '有没有bootstrap 学习的例子?', '有没有bootstrap 学习的例子?有没有bootstrap 学习的例子?', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('337', '小号的第一个问题', '小号的第一个问题小号的第一个问题', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('338', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('339', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('340', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('341', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('342', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('343', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('344', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('345', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('346', 'Java 的开发效率究竟比 C++ 高在哪里？', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('347', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('348', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('349', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('350', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('351', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('352', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('353', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('354', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('355', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('356', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('357', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('358', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('359', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('360', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('361', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('362', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('363', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('364', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('365', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('366', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('367', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('368', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('369', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('370', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('371', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('372', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('373', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('374', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('375', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('376', 'java开发，入职半年。对未来迷茫，如何发展？', 'java开发，入职半年。对未来迷茫，如何发展？java开发，入职半年。对未来迷茫，如何发展？', '', '3', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '3');
INSERT INTO `question` VALUES ('377', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('378', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('379', '如何看待大疆员工猝死？', '如何看待大疆员工猝死？如何看待大疆员工猝死？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('380', 'PowerPoint 到底有多厉害？', 'PowerPoint 到底有多厉害？PowerPoint 到底有多厉害？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('381', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('382', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('383', '有没有bootstrap 学习的例子?', '有没有bootstrap 学习的例子?有没有bootstrap 学习的例子?', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('384', '小号的第一个问题', '小号的第一个问题小号的第一个问题', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('385', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('386', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('387', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('388', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('389', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('390', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('391', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('392', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('393', 'Java 的开发效率究竟比 C++ 高在哪里？', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('394', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('395', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('396', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('397', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('398', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('399', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('400', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('401', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('402', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('403', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('404', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('405', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('406', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('407', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('408', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('409', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('410', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('411', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('412', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('413', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('414', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('415', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('416', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('417', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('418', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('419', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('420', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('421', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('422', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('423', 'java开发，入职半年。对未来迷茫，如何发展？', 'java开发，入职半年。对未来迷茫，如何发展？java开发，入职半年。对未来迷茫，如何发展？', '', '3', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '3');
INSERT INTO `question` VALUES ('424', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('425', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('426', '如何看待大疆员工猝死？', '如何看待大疆员工猝死？如何看待大疆员工猝死？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('427', 'PowerPoint 到底有多厉害？', 'PowerPoint 到底有多厉害？PowerPoint 到底有多厉害？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('428', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('429', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('430', '有没有bootstrap 学习的例子?', '有没有bootstrap 学习的例子?有没有bootstrap 学习的例子?', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('431', '小号的第一个问题', '小号的第一个问题小号的第一个问题', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('432', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('433', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('434', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('435', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('436', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('437', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('438', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('439', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('440', 'Java 的开发效率究竟比 C++ 高在哪里？', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('441', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('442', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('443', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('444', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('445', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('446', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('447', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('448', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('449', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('450', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('451', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('452', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('453', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('454', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('455', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('456', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('457', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('458', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('459', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('460', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('461', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('462', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('463', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('464', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('465', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('466', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('467', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('468', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('469', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('470', 'java开发，入职半年。对未来迷茫，如何发展？', 'java开发，入职半年。对未来迷茫，如何发展？java开发，入职半年。对未来迷茫，如何发展？', '', '3', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '3');
INSERT INTO `question` VALUES ('471', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('472', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('473', '如何看待大疆员工猝死？', '如何看待大疆员工猝死？如何看待大疆员工猝死？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('474', 'PowerPoint 到底有多厉害？', 'PowerPoint 到底有多厉害？PowerPoint 到底有多厉害？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('475', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('476', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('477', '有没有bootstrap 学习的例子?', '有没有bootstrap 学习的例子?有没有bootstrap 学习的例子?', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('478', '小号的第一个问题', '小号的第一个问题小号的第一个问题', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('479', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('480', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('481', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('482', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('483', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('484', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('485', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('486', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('487', 'Java 的开发效率究竟比 C++ 高在哪里？', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('488', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('489', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('490', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('491', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('492', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('493', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('494', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('495', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('496', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('497', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('498', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('499', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('500', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('501', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('502', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('503', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('504', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('505', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('506', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('507', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('508', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('509', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('510', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('511', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('512', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('513', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('514', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('515', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('516', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('517', 'java开发，入职半年。对未来迷茫，如何发展？', 'java开发，入职半年。对未来迷茫，如何发展？java开发，入职半年。对未来迷茫，如何发展？', '', '3', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '3');
INSERT INTO `question` VALUES ('518', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('519', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('520', '如何看待大疆员工猝死？', '如何看待大疆员工猝死？如何看待大疆员工猝死？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('521', 'PowerPoint 到底有多厉害？', 'PowerPoint 到底有多厉害？PowerPoint 到底有多厉害？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('522', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('523', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('524', '有没有bootstrap 学习的例子?', '有没有bootstrap 学习的例子?有没有bootstrap 学习的例子?', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('525', '小号的第一个问题', '小号的第一个问题小号的第一个问题', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('526', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('527', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('528', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('529', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('530', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('531', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('532', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('533', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('534', 'Java 的开发效率究竟比 C++ 高在哪里？', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('535', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('536', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('537', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('538', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('539', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('540', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('541', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('542', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('543', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('544', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('545', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('546', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('547', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('548', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('549', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('550', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('551', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('552', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('553', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('554', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('555', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('556', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('557', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('558', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('559', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('560', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('561', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('562', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('563', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('564', 'java开发，入职半年。对未来迷茫，如何发展？', 'java开发，入职半年。对未来迷茫，如何发展？java开发，入职半年。对未来迷茫，如何发展？', '', '3', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '3');
INSERT INTO `question` VALUES ('565', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('566', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('567', '如何看待大疆员工猝死？', '如何看待大疆员工猝死？如何看待大疆员工猝死？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('568', 'PowerPoint 到底有多厉害？', 'PowerPoint 到底有多厉害？PowerPoint 到底有多厉害？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('569', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('570', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('571', '有没有bootstrap 学习的例子?', '有没有bootstrap 学习的例子?有没有bootstrap 学习的例子?', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('572', '小号的第一个问题', '小号的第一个问题小号的第一个问题', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('573', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('574', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('575', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('576', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('577', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('578', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('579', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('580', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('581', 'Java 的开发效率究竟比 C++ 高在哪里？', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('582', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('583', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('584', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('585', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('586', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('587', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('588', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('589', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('590', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('591', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('592', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('593', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('594', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('595', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('596', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('597', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('598', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('599', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('600', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('601', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('602', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('603', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('604', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('605', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('606', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('607', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('608', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('609', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('610', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('611', 'java开发，入职半年。对未来迷茫，如何发展？', 'java开发，入职半年。对未来迷茫，如何发展？java开发，入职半年。对未来迷茫，如何发展？', '', '3', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '3');
INSERT INTO `question` VALUES ('612', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('613', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('614', '如何看待大疆员工猝死？', '如何看待大疆员工猝死？如何看待大疆员工猝死？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('615', 'PowerPoint 到底有多厉害？', 'PowerPoint 到底有多厉害？PowerPoint 到底有多厉害？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('616', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('617', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('618', '有没有bootstrap 学习的例子?', '有没有bootstrap 学习的例子?有没有bootstrap 学习的例子?', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('619', '小号的第一个问题', '小号的第一个问题小号的第一个问题', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('620', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('621', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('622', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('623', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('624', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('625', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('626', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('627', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('628', 'Java 的开发效率究竟比 C++ 高在哪里？', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('629', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('630', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('631', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('632', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('633', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('634', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('635', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('636', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('637', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('638', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('639', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('640', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('641', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('642', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('643', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('644', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('645', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('646', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('647', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('648', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('649', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('650', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('651', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('652', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('653', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('654', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('655', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('656', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('657', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('658', 'java开发，入职半年。对未来迷茫，如何发展？', 'java开发，入职半年。对未来迷茫，如何发展？java开发，入职半年。对未来迷茫，如何发展？', '', '3', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '3');
INSERT INTO `question` VALUES ('659', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('660', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('661', '如何看待大疆员工猝死？', '如何看待大疆员工猝死？如何看待大疆员工猝死？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('662', 'PowerPoint 到底有多厉害？', 'PowerPoint 到底有多厉害？PowerPoint 到底有多厉害？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('663', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('664', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('665', '有没有bootstrap 学习的例子?', '有没有bootstrap 学习的例子?有没有bootstrap 学习的例子?', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('666', '小号的第一个问题', '小号的第一个问题小号的第一个问题', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('667', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('668', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('669', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('670', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('671', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('672', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('673', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('674', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('675', 'Java 的开发效率究竟比 C++ 高在哪里？', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('676', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('677', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('678', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('679', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('680', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('681', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('682', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('683', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('684', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('685', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('686', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('687', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('688', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('689', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('690', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('691', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('692', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('693', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('694', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('695', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('696', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('697', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('698', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('699', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('700', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('701', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('702', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('703', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('704', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('705', 'java开发，入职半年。对未来迷茫，如何发展？', 'java开发，入职半年。对未来迷茫，如何发展？java开发，入职半年。对未来迷茫，如何发展？', '', '3', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '3');
INSERT INTO `question` VALUES ('706', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('707', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('708', '如何看待大疆员工猝死？', '如何看待大疆员工猝死？如何看待大疆员工猝死？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('709', 'PowerPoint 到底有多厉害？', 'PowerPoint 到底有多厉害？PowerPoint 到底有多厉害？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('710', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('711', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('712', '有没有bootstrap 学习的例子?', '有没有bootstrap 学习的例子?有没有bootstrap 学习的例子?', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('713', '小号的第一个问题', '小号的第一个问题小号的第一个问题', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('714', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('715', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('716', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('717', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('718', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('719', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('720', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('721', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('722', 'Java 的开发效率究竟比 C++ 高在哪里？', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('723', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('724', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('725', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('726', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('727', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('728', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('729', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('730', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('731', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('732', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('733', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('734', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('735', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('736', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('737', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('738', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('739', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('740', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('741', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('742', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('743', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('744', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('745', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('746', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('747', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('748', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('749', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('750', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('751', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('752', 'java开发，入职半年。对未来迷茫，如何发展？', 'java开发，入职半年。对未来迷茫，如何发展？java开发，入职半年。对未来迷茫，如何发展？', '', '3', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '3');
INSERT INTO `question` VALUES ('753', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('754', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('755', '如何看待大疆员工猝死？', '如何看待大疆员工猝死？如何看待大疆员工猝死？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('756', 'PowerPoint 到底有多厉害？', 'PowerPoint 到底有多厉害？PowerPoint 到底有多厉害？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('757', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('758', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('759', '有没有bootstrap 学习的例子?', '有没有bootstrap 学习的例子?有没有bootstrap 学习的例子?', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('760', '小号的第一个问题', '小号的第一个问题小号的第一个问题', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('761', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('762', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('763', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('764', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('765', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('766', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('767', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('768', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('769', 'Java 的开发效率究竟比 C++ 高在哪里？', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('770', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('771', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('772', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('773', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('774', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('775', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('776', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('777', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('778', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('779', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('780', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('781', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('782', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('783', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('784', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('785', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('786', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('787', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('788', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('789', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('790', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('791', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('792', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('793', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('794', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('795', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('796', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('797', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('798', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('799', 'java开发，入职半年。对未来迷茫，如何发展？', 'java开发，入职半年。对未来迷茫，如何发展？java开发，入职半年。对未来迷茫，如何发展？', '', '3', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '3');
INSERT INTO `question` VALUES ('800', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('801', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('802', '如何看待大疆员工猝死？', '如何看待大疆员工猝死？如何看待大疆员工猝死？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('803', 'PowerPoint 到底有多厉害？', 'PowerPoint 到底有多厉害？PowerPoint 到底有多厉害？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('804', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('805', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('806', '有没有bootstrap 学习的例子?', '有没有bootstrap 学习的例子?有没有bootstrap 学习的例子?', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('807', '小号的第一个问题', '小号的第一个问题小号的第一个问题', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('808', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('809', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('810', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('811', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('812', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('813', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('814', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('815', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('816', 'Java 的开发效率究竟比 C++ 高在哪里？', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('817', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('818', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('819', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('820', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('821', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('822', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('823', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('824', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('825', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('826', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('827', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('828', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('829', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('830', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('831', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('832', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('833', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('834', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('835', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('836', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('837', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('838', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('839', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('840', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('841', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('842', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('843', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('844', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('845', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('846', 'java开发，入职半年。对未来迷茫，如何发展？', 'java开发，入职半年。对未来迷茫，如何发展？java开发，入职半年。对未来迷茫，如何发展？', '', '3', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '3');
INSERT INTO `question` VALUES ('847', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('848', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('849', '如何看待大疆员工猝死？', '如何看待大疆员工猝死？如何看待大疆员工猝死？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('850', 'PowerPoint 到底有多厉害？', 'PowerPoint 到底有多厉害？PowerPoint 到底有多厉害？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('851', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('852', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('853', '有没有bootstrap 学习的例子?', '有没有bootstrap 学习的例子?有没有bootstrap 学习的例子?', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('854', '小号的第一个问题', '小号的第一个问题小号的第一个问题', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('855', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('856', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('857', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('858', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('859', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('860', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('861', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('862', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('863', 'Java 的开发效率究竟比 C++ 高在哪里？', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('864', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('865', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('866', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('867', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('868', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('869', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('870', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('871', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('872', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('873', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('874', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('875', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('876', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('877', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('878', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('879', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('880', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('881', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('882', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('883', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('884', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('885', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('886', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('887', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('888', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('889', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('890', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('891', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('892', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('893', 'java开发，入职半年。对未来迷茫，如何发展？', 'java开发，入职半年。对未来迷茫，如何发展？java开发，入职半年。对未来迷茫，如何发展？', '', '3', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '3');
INSERT INTO `question` VALUES ('894', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('895', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('896', '如何看待大疆员工猝死？', '如何看待大疆员工猝死？如何看待大疆员工猝死？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('897', 'PowerPoint 到底有多厉害？', 'PowerPoint 到底有多厉害？PowerPoint 到底有多厉害？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('898', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('899', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('900', '有没有bootstrap 学习的例子?', '有没有bootstrap 学习的例子?有没有bootstrap 学习的例子?', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('901', '小号的第一个问题', '小号的第一个问题小号的第一个问题', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('902', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('903', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('904', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('905', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('906', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('907', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('908', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('909', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('910', 'Java 的开发效率究竟比 C++ 高在哪里？', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('911', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('912', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('913', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('914', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('915', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('916', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('917', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('918', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('919', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('920', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('921', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('922', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('923', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('924', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('925', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('926', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('927', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('928', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('929', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('930', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('931', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('932', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('933', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('934', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('935', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('936', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('937', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('938', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('939', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('940', 'java开发，入职半年。对未来迷茫，如何发展？', 'java开发，入职半年。对未来迷茫，如何发展？java开发，入职半年。对未来迷茫，如何发展？', '', '3', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '3');
INSERT INTO `question` VALUES ('941', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊为什么手机只能围绕其中两个很大的特别重对称轴稳定的旋转？这个不太明白啊啊啊啊啊啊', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('942', '霸王龙前面两只小手手是干嘛用的？', '霸王龙前面两只小手手是干嘛用的？霸王龙前面两只小手手是干嘛用的？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('943', '如何看待大疆员工猝死？', '如何看待大疆员工猝死？如何看待大疆员工猝死？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('944', 'PowerPoint 到底有多厉害？', 'PowerPoint 到底有多厉害？PowerPoint 到底有多厉害？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('945', '如何优雅地使用 Jupyter？', '如何优雅地使用 Jupyter？如何优雅地使用 Jupyter？', '', '2', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('946', '不爱睡觉怎么办？', '不爱睡觉怎么办？不爱睡觉怎么办？', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('947', '有没有bootstrap 学习的例子?', '有没有bootstrap 学习的例子?有没有bootstrap 学习的例子?', '', '1', '0', '1546138993520', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('948', '小号的第一个问题', '小号的第一个问题小号的第一个问题', '', '1', '0', '1546320447149', '3bad1b8a3c284cab8d19d441651c7615', '1');
INSERT INTO `question` VALUES ('949', '小号的第二个问题', '小号的第二个问题小号的第二个问题', '', '1', '0', '1546323690120', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('950', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546927774849', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('951', '今天星期几？', '今天星期几？今天星期几？', '', '1', '0', '1546929688874', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('952', 'Cape Verde', 'Cape VerdeCape Verde', '', '1', '0', '1546934343030', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('953', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('954', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('955', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('956', '呀', '呀呀', '{40:\"java\"}', '0', '0', '1493796093422', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('957', 'Java 的开发效率究竟比 C++ 高在哪里？', 'Java 的开发效率究竟比 C++ 高在哪里？Java 的开发效率究竟比 C++ 高在哪里？', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('958', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('959', '中国现在有多少程序员？', '中国现在有多少程序员？中国现在有多少程序员？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('960', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', '如何评价招行的手机APP和招行信用卡app“掌上生活”？如何评价招行的手机APP和招行信用卡app“掌上生活”？', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('961', '如何自学 Android 编程？', '如何自学 Android 编程？如何自学 Android 编程？', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('962', '什么促使你走上独立开发者之路？', '什么促使你走上独立开发者之路？什么促使你走上独立开发者之路？', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('963', '当你学会了什么之后感觉自己的编程算是入门了?', '当你学会了什么之后感觉自己的编程算是入门了?当你学会了什么之后感觉自己的编程算是入门了?', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('964', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('965', '如何用一段简单的代码讲述一个悲伤的故事？', '如何用一段简单的代码讲述一个悲伤的故事？如何用一段简单的代码讲述一个悲伤的故事？', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('966', '长沙的计算机行业怎么样？', '长沙的计算机行业怎么样？长沙的计算机行业怎么样？', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('967', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('968', '会计转行从事IT，如何在一年时间内全职学习？', '会计转行从事IT，如何在一年时间内全职学习？会计转行从事IT，如何在一年时间内全职学习？', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('969', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', '有哪些IT初学者（新人）成长为技术大牛的真实经历？有哪些IT初学者（新人）成长为技术大牛的真实经历？', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('970', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('971', '开发一个 Flappy Bird 需要多少行代码，多少时间？', '开发一个 Flappy Bird 需要多少行代码，多少时间？开发一个 Flappy Bird 需要多少行代码，多少时间？', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('972', 'IT 大牛是怎样炼成的？', 'IT 大牛是怎样炼成的？IT 大牛是怎样炼成的？', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('973', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('974', '码农们最常说的谎言是什么？', '码农们最常说的谎言是什么？码农们最常说的谎言是什么？', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('975', '零基础应该选择学习 java、php、前端 还是 python？', '零基础应该选择学习 java、php、前端 还是 python？零基础应该选择学习 java、php、前端 还是 python？', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('976', '计算机专业即将毕业是否要去培训（Java ）？', '计算机专业即将毕业是否要去培训（Java ）？计算机专业即将毕业是否要去培训（Java ）？', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('977', 'Java培训哪家好？', 'Java培训哪家好？Java培训哪家好？', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('978', '请问一个JavaScript、java高手，node.js的一个问题？', '请问一个JavaScript、java高手，node.js的一个问题？请问一个JavaScript、java高手，node.js的一个问题？', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('979', '程序员带孩子是怎样一种体验？', '程序员带孩子是怎样一种体验？程序员带孩子是怎样一种体验？', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('980', '零基础自学 Android 并去找工作可行性大么？', '零基础自学 Android 并去找工作可行性大么？零基础自学 Android 并去找工作可行性大么？', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('981', '为什么程序代码被编译成机器码就不能跨平台运行？', '为什么程序代码被编译成机器码就不能跨平台运行？为什么程序代码被编译成机器码就不能跨平台运行？', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('982', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('983', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('984', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('985', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'Java新手如何学习Spring、Struts、Hibernate三大框架？Java新手如何学习Spring、Struts、Hibernate三大框架？', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('986', '家政服务app开发的发展前景如何？', '家政服务app开发的发展前景如何？家政服务app开发的发展前景如何？', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('1031', '1111111', '<p><img src=\"http://pknhrkp8l.bkt.clouddn.com/questionTitle-1111111-No.1.jpeg\"><img src=\"http://pknhrkp8l.bkt.clouddn.com/questionTitle-1111111-No.2.jpeg\"></p>', '', '1', '0', '1547110966369', '3bad1b8a3c284cab8d19d441651c7615', '0');
INSERT INTO `question` VALUES ('1032', '今天星期几？', '<h1>啊啊啊啊啊啊啊啊</h1>', '', '1', '0', '1547197911285', '45e6c1985fe640e09cd770d95e6e2c8b', '0');

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
INSERT INTO `topic` VALUES ('163', 'pop', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '157', '0');
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
INSERT INTO `topic` VALUES ('199', '互联网+', '', '暂无描述', '', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '0');
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
INSERT INTO `user` VALUES ('3bad1b8a3c284cab8d19d441651c7615', 'tsai@gmail.com', '123456', '0', '', '0', '小号', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-3bad1b8a3c284cab8d19d441651c7615-20181211191204.png', '1', '蔡振亚的小号问题蔡振亚的小号问题蔡振亚的小号问题啊', '广东省深圳市', 'java工程师', '互联网行业', '深圳市弘长科技有限公司', '深圳大学小号', '啦啦啦啦啦啦啦啦啦', '0', '0', '0', '0', '0', '');
INSERT INTO `user` VALUES ('45e6c1985fe640e09cd770d95e6e2c8b', 'cc@126.com', '123456', '0', '1212313', '0', 'tsaizhenya', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-45e6c1985fe640e09cd770d95e6e2c8b-author.jpg', '1', '社会主义的接班人，社会主义的接班人，社会主义的接班人', '深圳市', 'java工程师', '互联网行业', '杭州有赞科技有限公司', '深圳大学蔡振亚', '世界上最聪明的人', '12', '23', '34', '345', '3454', '2312312');
INSERT INTO `user` VALUES ('6a99cf86555243ba8b23927c0748b562', '992085263@qq.com', '123456', '0', '', '0', '滕飞', 'http://pknhrkp8l.bkt.clouddn.com/userId-avatar-6a99cf86555243ba8b23927c0748b562-tengfei.jpg', '1', '世界上最帅最帅最帅的人问题', '深圳市', '学生', '金融', '', '深圳大学滕飞', '', '3', '234', '345', '45', '345', '');
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
