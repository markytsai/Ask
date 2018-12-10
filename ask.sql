/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : ask

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2018-12-10 21:29:50
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
  `create_time` bigint(20) NOT NULL DEFAULT '0',
  `question_id` varchar(50) NOT NULL DEFAULT '',
  `answer_user_id` varchar(128) NOT NULL,
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO `answer` VALUES ('1', '没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，', '0', '5', '1493522121495', '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('2', '没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，', '0', '4', '1493522128825', '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('3', '没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，', '0', '4', '1493522142803', '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('4', '没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，', '0', '2', '1493522147411', '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('5', '没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，', '0', '1', '1493555276539', '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('6', '没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，', '0', '3', '1493555627945', '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('7', '没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，', '0', '0', '1493617010248', '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('8', '没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，', '0', '0', '1493620560186', '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('9', '没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，', '0', '0', '1493620568125', '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('10', '没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，', '0', '0', '1493620572354', '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('11', '没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，', '0', '1', '1493621303315', '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('12', '没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，', '0', '0', '1493645184138', '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('13', '没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，', '0', '1', '1494318054680', '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('14', '没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，', '0', '1', '1494491024559', '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('15', '没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，', '0', '0', '1494506264036', '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('16', '没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，', '0', '0', '1494522474729', '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('17', '没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，', '0', '1', '1495169959063', '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('18', '没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，', '0', '4', '1496224435146', '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('19', '没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，没有见到过，', '0', '2', '1496465564370', '1', '45e6c1985fe640e09cd770d95e6e2c8b');
INSERT INTO `answer` VALUES ('20', '<p>1、yum安装</p><p><img src=\"http://od6v5lenq.bkt.clouddn.com/b287e10f-36d1-48e0-be78-d8db392c8b4f.png\" alt=\"\" style=\"max-width:100%;\"><br></p><p>1、创建一个工作目录</p><p><img src=\"http://od6v5lenq.bkt.clouddn.com/06799c10-3ac0-4387-9ba0-8456952763ec.png\" alt=\"\" style=\"max-width:100%;\"><br></p><p><br></p>', '0', '1', '1496558878130', '51', '4');
INSERT INTO `answer` VALUES ('21', '<p>你说的是loginToken吗，，这个是标记用户是否登录用的。</p><p>存在cookie里，用户请求后台接口时会去redis里判断用户是否是登录状态。</p>', '0', '2', '1498806371787', '55', '4');
INSERT INTO `answer` VALUES ('22', '<p>sdfsdfsdf</p>', '0', '1', '1499177546480', '47', '11010');
INSERT INTO `answer` VALUES ('23', '<p>6666</p>', '0', '1', '1499244103864', '2', '11014');
INSERT INTO `answer` VALUES ('24', '<p>111<br></p>', '0', '0', '1499494526711', '47', '7');
INSERT INTO `answer` VALUES ('25', '<p>22</p><p><br></p>', '0', '0', '1499494570239', '47', '7');
INSERT INTO `answer` VALUES ('26', '<p></p><pre style=\"max-width:100%;overflow-x:auto;\"><code class=\"cpp hljs\" codemark=\"1\"><span class=\"hljs-meta\">#incldue </span></code></pre><p><br></p>', '0', '0', '1499494624586', '47', '7');
INSERT INTO `answer` VALUES ('27', '<p><img src=\"http://od6v5lenq.bkt.clouddn.com/49864693-b309-4df5-8036-e7bb8ca7c341.jpg\" alt=\"text_img\" style=\"max-width:100%;\"><br></p><p><br></p>', '0', '1', '1499500954995', '55', '11053');
INSERT INTO `answer` VALUES ('28', '<table><tbody><tr><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td></tr><tr><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td></tr><tr><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td></tr><tr><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td></tr><tr><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td></tr><tr><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td><td><span>&nbsp;</span></td></tr></tbody></table><p><br></p>', '0', '1', '1499507779725', '47', '7');
INSERT INTO `answer` VALUES ('29', '<p><b>发现里面的点赞功能没用<br></b></p><p><br></p>', '0', '3', '1499508197788', '55', '7');
INSERT INTO `answer` VALUES ('30', '<p>我是后端er...</p>', '0', '0', '1499523834791', '62', '4');
INSERT INTO `answer` VALUES ('31', '<p><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f2/wg_thumb.gif\"><br></p><p><br></p>', '0', '0', '1499534913975', '2', '3');
INSERT INTO `answer` VALUES ('32', '<p>&lt;/html&gt;</p>', '0', '1', '1499558778781', '2', '11080');
INSERT INTO `answer` VALUES ('33', '<p>前端不太熟~调的蛮久的..</p>', '0', '1', '1499579163364', '65', '4');
INSERT INTO `answer` VALUES ('34', '<p>我既然提了这个问题 应该自动关注啊</p>', '0', '0', '1499680213022', '67', '11151');
INSERT INTO `answer` VALUES ('35', '<p>买个阿里云部署下就行了～</p>', '0', '2', '1499769177469', '73', '3');
INSERT INTO `answer` VALUES ('36', '<p><img src=\"http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/15/j_thumb.gif\"><br></p><p><br></p>', '0', '0', '1499782594681', '70', '4');

-- ----------------------------
-- Table structure for answer_comment
-- ----------------------------
DROP TABLE IF EXISTS `answer_comment`;
CREATE TABLE `answer_comment` (
  `answer_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `answer_comment_content` text,
  `liked_count` int(11) NOT NULL DEFAULT '0',
  `create_time` bigint(20) NOT NULL DEFAULT '0',
  `at_user_id` int(11) DEFAULT NULL,
  `at_user_name` varchar(100) DEFAULT NULL,
  `answer_id` varchar(50) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`answer_comment_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of answer_comment
-- ----------------------------

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection` (
  `collection_id` int(11) NOT NULL AUTO_INCREMENT,
  `collection_name` varchar(100) NOT NULL DEFAULT '',
  `create_time` bigint(20) NOT NULL DEFAULT '0',
  `update_time` bigint(20) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL,
  `followed_count` int(11) DEFAULT '0',
  PRIMARY KEY (`collection_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of collection
-- ----------------------------

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `second_type` int(11) DEFAULT NULL,
  `message_date` varchar(50) DEFAULT NULL,
  `message_time` bigint(20) DEFAULT NULL,
  `from_user_id` int(11) DEFAULT NULL,
  `from_user_name` varchar(50) DEFAULT NULL,
  `question_id` int(11) DEFAULT NULL,
  `question_title` varchar(255) DEFAULT NULL,
  `answer_id` int(11) DEFAULT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`message_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for mid_question_answer
-- ----------------------------
DROP TABLE IF EXISTS `mid_question_answer`;
CREATE TABLE `mid_question_answer` (
  `id` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mid_question_answer
-- ----------------------------

-- ----------------------------
-- Table structure for mid_user_answer
-- ----------------------------
DROP TABLE IF EXISTS `mid_user_answer`;
CREATE TABLE `mid_user_answer` (
  `id` int(11) NOT NULL,
  `user_id` varchar(128) NOT NULL,
  `answer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of mid_user_answer
-- ----------------------------

-- ----------------------------
-- Table structure for mid_user_question
-- ----------------------------
DROP TABLE IF EXISTS `mid_user_question`;
CREATE TABLE `mid_user_question` (
  `id` int(11) NOT NULL COMMENT '序号',
  `user_id` varchar(128) DEFAULT NULL COMMENT '用户ID',
  `question_id` int(11) DEFAULT NULL COMMENT '问题ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of mid_user_question
-- ----------------------------
INSERT INTO `mid_user_question` VALUES ('1', '45e6c1985fe640e09cd770d95e6e2c8b', '1');
INSERT INTO `mid_user_question` VALUES ('2', '45e6c1985fe640e09cd770d95e6e2c8b', '2');
INSERT INTO `mid_user_question` VALUES ('3', '45e6c1985fe640e09cd770d95e6e2c8b', '3');
INSERT INTO `mid_user_question` VALUES ('4', '45e6c1985fe640e09cd770d95e6e2c8b', '4');
INSERT INTO `mid_user_question` VALUES ('5', '45e6c1985fe640e09cd770d95e6e2c8b', '5');
INSERT INTO `mid_user_question` VALUES ('6', '45e6c1985fe640e09cd770d95e6e2c8b', '6');
INSERT INTO `mid_user_question` VALUES ('7', '45e6c1985fe640e09cd770d95e6e2c8b', '7');
INSERT INTO `mid_user_question` VALUES ('8', '45e6c1985fe640e09cd770d95e6e2c8b', '8');
INSERT INTO `mid_user_question` VALUES ('9', '45e6c1985fe640e09cd770d95e6e2c8b', '9');
INSERT INTO `mid_user_question` VALUES ('10', '45e6c1985fe640e09cd770d95e6e2c8b', '10');

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `question_id` varchar(128) NOT NULL,
  `question_title` varchar(255) NOT NULL DEFAULT '',
  `question_content` text,
  `topic_kv_list` varchar(200) NOT NULL DEFAULT '',
  `followed_count` int(11) NOT NULL DEFAULT '0',
  `scanned_count` int(11) NOT NULL DEFAULT '0',
  `create_time` bigint(20) NOT NULL DEFAULT '0',
  `user_id` varchar(128) NOT NULL,
  `answer_count` int(11) DEFAULT '0',
  PRIMARY KEY (`question_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES ('1', '你见过哪些员工因为作死被开除的事情?', '<p>某司员工碰瓷保安，员工被开除。\r\n保安让出示工卡，员工拒绝，接着开始骂保安，然后就倒地说保安打他。\r\n某司员工觉得家里只有一个显示器不方便，大摇大摆的从公司搬了一个显示器回家了，然后就直接被开除了</p>', '{180:\"算法\",40:\"java\"}', '0', '0', '1493520121386', '45e6c1985fe640e09cd770d95e6e2c8b', null);
INSERT INTO `question` VALUES ('10', '什么促使你走上独立开发者之路？', 'muyou', '{184:\"程序员\",96:\"Android 开发\",122:\"iOS 开发\",195:\"独立开发者\",194:\"调查类问题\"}', '0', '0', '1493871339897', '45e6c1985fe640e09cd770d95e6e2c8b', null);
INSERT INTO `question` VALUES ('11', '当你学会了什么之后感觉自己的编程算是入门了?', 'muyou', '{197:\"Java 编程\",196:\"C（编程语言）\",176:\"编程\",198:\"自学编程\",177:\"编程语言\"}', '0', '0', '1493871349052', '45e6c1985fe640e09cd770d95e6e2c8b', null);
INSERT INTO `question` VALUES ('12', '阿里巴巴、美团等各大互联网公司的 Java 类校招对本科生的要求是什么？', 'muyou', '{200:\"BAT（公司集合）\",197:\"Java 编程\",40:\"Java\",176:\"编程\",199:\"互联网\"}', '0', '0', '1493871358259', '45e6c1985fe640e09cd770d95e6e2c8b', null);
INSERT INTO `question` VALUES ('13', '如何用一段简单的代码讲述一个悲伤的故事？', 'muyou', '{184:\"程序员\",3:\"Python\",173:\"Bash\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871358429', '45e6c1985fe640e09cd770d95e6e2c8b', null);
INSERT INTO `question` VALUES ('14', '长沙的计算机行业怎么样？', 'muyou', '{201:\"计算机\",202:\"长沙\",197:\"Java 编程\"}', '0', '0', '1493871358663', '45e6c1985fe640e09cd770d95e6e2c8b', null);
INSERT INTO `question` VALUES ('15', '一个web项目，多个用户从不同的客户端浏览器同时访问需要考虑哪些问题？', 'muyou', '{203:\"高并发\",40:\"Java\"}', '0', '0', '1493871358846', '45e6c1985fe640e09cd770d95e6e2c8b', null);
INSERT INTO `question` VALUES ('16', '会计转行从事IT，如何在一年时间内全职学习？', 'muyou', '{204:\"转行\",201:\"计算机\",40:\"Java\",176:\"编程\",74:\".NET\"}', '0', '0', '1493871359024', '45e6c1985fe640e09cd770d95e6e2c8b', null);
INSERT INTO `question` VALUES ('17', '有哪些IT初学者（新人）成长为技术大牛的真实经历？', 'muyou', '{186:\"IT 行业\",184:\"程序员\",96:\"Android 开发\",199:\"互联网\"}', '0', '0', '1493871359275', '45e6c1985fe640e09cd770d95e6e2c8b', null);
INSERT INTO `question` VALUES ('18', 'IT行业都有哪些职位，初学者（0基础，新人）该如何选择，才能够快速进入这个行业？', 'muyou', '{205:\"产品\",33:\"JavaScript\",40:\"Java\",199:\"互联网\",31:\"CSS\"}', '0', '0', '1493871359469', '45e6c1985fe640e09cd770d95e6e2c8b', null);
INSERT INTO `question` VALUES ('19', '开发一个 Flappy Bird 需要多少行代码，多少时间？', 'muyou', '{207:\"Cocos2d-x\",206:\"手机游戏\",96:\"Android 开发\",208:\"Flappy Bird\",209:\"CocosEditor\"}', '0', '0', '1493871359708', '45e6c1985fe640e09cd770d95e6e2c8b', null);
INSERT INTO `question` VALUES ('2', '国内的用户都用什么 Linux 发行版？', '本人只从认识Linux到现在用了很多个发行版，感觉国人用的多还是ubuntu,虽然deepin也是不错，同时也是国人团队开发定制的，但感觉还是ubuntu比较多点，其次我觉得是arch，在百度还是csdn上这两个的问题还是挺多的，说说我用过的Linux吧，ubuntu,lubuntu,arch,deepin,debian,linux mint,manjaro,elementary,opensuse,还是喜欢ubuntu，觉得用它的人多，解决问题好点', '{160:\"c++\",40:\"java\"}', '0', '0', '1493520177143', '45e6c1985fe640e09cd770d95e6e2c8b', null);
INSERT INTO `question` VALUES ('20', 'IT 大牛是怎样炼成的？', 'muyou', '{186:\"IT 行业\",184:\"程序员\",113:\"Linux\",40:\"Java\",199:\"互联网\"}', '0', '0', '1493871359905', '4', null);
INSERT INTO `question` VALUES ('21', '学习 JAVA，有什么书籍推荐？学习的方法和过程是怎样的？', 'muyou', '{197:\"Java 编程\",40:\"Java\",177:\"编程语言\",210:\"Java EE\"}', '0', '0', '1493871360085', '4', null);
INSERT INTO `question` VALUES ('22', '码农们最常说的谎言是什么？', 'muyou', '{184:\"程序员\",212:\"C / C++\",40:\"Java\",176:\"编程\",211:\"软件开发\"}', '0', '0', '1493871360282', '4', null);
INSERT INTO `question` VALUES ('23', '零基础应该选择学习 java、php、前端 还是 python？', 'muyou', '{51:\"PHP\",184:\"程序员\",3:\"Python\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871360474', '4', null);
INSERT INTO `question` VALUES ('24', '计算机专业即将毕业是否要去培训（Java ）？', 'muyou', '{213:\"电子信息工程\",40:\"Java\"}', '0', '0', '1493871360678', '4', null);
INSERT INTO `question` VALUES ('25', 'Java培训哪家好？', 'muyou', '{187:\"Java 程序员\",214:\"IT 培训\",40:\"Java\",215:\"教育培训机构\"}', '0', '0', '1493871360843', '4', null);
INSERT INTO `question` VALUES ('26', '请问一个JavaScript、java高手，node.js的一个问题？', 'muyou', '{216:\"Java Web\",64:\"Node.js\",40:\"Java\"}', '0', '0', '1493871361050', '4', null);
INSERT INTO `question` VALUES ('27', '程序员带孩子是怎样一种体验？', 'muyou', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\",217:\"IT 男\",218:\"女程序员\"}', '0', '0', '1493871361224', '4', null);
INSERT INTO `question` VALUES ('28', '零基础自学 Android 并去找工作可行性大么？', 'muyou', '{184:\"程序员\",96:\"Android 开发\",197:\"Java 编程\",176:\"编程\"}', '0', '0', '1493871361434', '4', null);
INSERT INTO `question` VALUES ('29', '为什么程序代码被编译成机器码就不能跨平台运行？', 'muyou', '{219:\"计算机科学\",212:\"C / C++\",196:\"C（编程语言）\",40:\"Java\"}', '0', '0', '1493871361605', '4', null);
INSERT INTO `question` VALUES ('3', '非计算机专业学生如何转行 AI，并找到算法 offer？', '如题，AI 大火，很多非科班人想转行，那么如何最快的方式学习和找到算法工作？', '{181:\"javaee\",40:\"java\"}', '0', '0', '1493555405611', '45e6c1985fe640e09cd770d95e6e2c8b', null);
INSERT INTO `question` VALUES ('30', 'Spring，Django，Rails，Express这些框架技术的出现都是为了解决什么问题，现在这些框架都应用在哪些方面？', 'muyou', '{220:\"Ruby on Rails\",221:\"Django（框架）\",222:\"设计模式\",223:\"Express（框架）\",43:\"Spring\"}', '0', '0', '1493871361819', '4', null);
INSERT INTO `question` VALUES ('31', '请问有详细介绍threadlocal的书籍吗？或者有哪位大神能详细说明下threadlocal？', 'muyou', '{40:\"Java\",224:\"ThreadLocal\"}', '0', '0', '1493871362010', '4', null);
INSERT INTO `question` VALUES ('32', '由于高中没怎么学，上了大专，想做java开发，但是看见基本要求就是本科，请问我该继续吗？应该怎么做？', 'muyou', '{186:\"IT 行业\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871362171', '4', null);
INSERT INTO `question` VALUES ('33', 'Java新手如何学习Spring、Struts、Hibernate三大框架？', 'muyou', '{216:\"Java Web\",197:\"Java 编程\",43:\"Spring\",44:\"Hibernate\",45:\"Struts\"}', '0', '0', '1493871362338', '4', null);
INSERT INTO `question` VALUES ('34', '家政服务app开发的发展前景如何？', 'muyou', '{96:\"Android 开发\",97:\"Android\",226:\"移动开发\",122:\"iOS 开发\",225:\"移动互联网\"}', '0', '0', '1493871362553', '4', null);
INSERT INTO `question` VALUES ('35', '测试一下', '<p>这个问题怎么样</p>', '{227:\"问答\"}', '0', '0', '1494318212279', '31', null);
INSERT INTO `question` VALUES ('36', 'qwe', '<p>qweq</p>', '{228:\"qwe\"}', '0', '0', '1494501057712', '31', null);
INSERT INTO `question` VALUES ('37', 'aaaa', '<p>sdasd</p>', '{229:\"sadsa\"}', '0', '0', '1494506307494', '31', null);
INSERT INTO `question` VALUES ('38', 'niaho', '', '{230:\"[i\'[\"}', '0', '0', '1494832881249', '10805', null);
INSERT INTO `question` VALUES ('39', '111', '<p>22222</p>', '{231:\"222\"}', '0', '0', '1495038405362', '10820', null);
INSERT INTO `question` VALUES ('4', '山东省一亿多的人口，为什么不能举全省之力做大一个明星城市，吸引人口？', '最近为一些问题感到很迷茫，感谢大家抽出时间为我答疑解惑，知乎的氛围真好，感谢每位答主。\r\n\r\n以下是原问题。\r\n\r\n—————————————我也是分割线———————————————\r\n\r\n山东就一定要坚持所谓的“群狼经济”吗？不能像现在的成都武汉郑州这样举全省之力做大一个明星城市，吸引人口做大一个市吗。\r\n\r\n全山东一亿多的人口，没有四川湖北那种发展潜力吗？\r\n\r\n不是很懂大家勿喷。\r\n\r\n欢迎大家畅所欲言。', '{40:\"java\"}', '0', '0', '1493796093422', '45e6c1985fe640e09cd770d95e6e2c8b', null);
INSERT INTO `question` VALUES ('40', 'java怎么中怎么调用redis呢？', '<p>java 使用redis的配置和使用方法 可以给我发一些参考资料吗？？或者给我推荐一些博客？？非常感谢感谢</p><p>我的 邮箱是 1374619211@qq.com</p>', '{142:\"redis\",40:\"java\"}', '0', '0', '1495183099210', '10828', null);
INSERT INTO `question` VALUES ('41', 'test', '<p><img src=\"http://od6v5lenq.bkt.clouddn.com/9251b540-bd84-410c-9e9c-efacf47121fc.jpg\" alt=\"Java\" style=\"max-width:100%;\"><br></p><p><br></p>', '{40:\"java\"}', '0', '0', '1495715222731', '10848', null);
INSERT INTO `question` VALUES ('42', 'vkjdhfskdhfsdihisud', '<p>dsbfkdshfkjsdhfdskhdsl</p>', '{232:\"fdsfsdfds\"}', '0', '0', '1495891062877', '10851', null);
INSERT INTO `question` VALUES ('43', '编程', '<p>多撒大所多</p>', '{176:\"编程\"}', '0', '0', '1496217738790', '10855', null);
INSERT INTO `question` VALUES ('44', 'centos6安装vsftps', '', '{117:\"centos\",113:\"linux\"}', '0', '0', '1496557632931', '4', null);
INSERT INTO `question` VALUES ('45', 'htrhtrhjtrjtr', '<p>htrhjtrjhtr</p>', '{233:\"htrhtrhjtr\"}', '0', '0', '1496754587486', '10880', null);
INSERT INTO `question` VALUES ('46', '知乎慕名而来', '<p>请问这个项目的代码量是多少呢，对这个项目很感兴趣</p>', '{234:\"蛤\"}', '0', '0', '1497533564908', '10903', null);
INSERT INTO `question` VALUES ('47', 'aaaa', '<p>aaaa</p>', '{235:\"aaa\"}', '0', '0', '1498324622022', '10954', null);
INSERT INTO `question` VALUES ('48', '不知道在这会不会有人看到。。。。。。。', '<p>在用户模块里的token是干嘛的呀？一直没有理解这个，谢谢<br></p>', '{236:\"token\"}', '0', '0', '1498715827273', '10978', null);
INSERT INTO `question` VALUES ('49', '的淡淡的', '<p>的的的的</p>', '{237:\"的\"}', '0', '0', '1499139633678', '11002', null);
INSERT INTO `question` VALUES ('5', 'Java 的开发效率究竟比 C++ 高在哪里？', 'muyou', '{40:\"Java\",160:\"C++\",182:\"面向对象编程\",183:\"编程语言比较\"}', '0', '0', '1493871294174', '45e6c1985fe640e09cd770d95e6e2c8b', null);
INSERT INTO `question` VALUES ('50', '搜索好像不太能用是吗', '<p>O(∩_∩)O</p>', '{238:\"D~~D\"}', '0', '0', '1499409950503', '11004', null);
INSERT INTO `question` VALUES ('51', 'hi', '<p>hihi</p>', '{239:\"t\"}', '0', '0', '1499493026483', '7', null);
INSERT INTO `question` VALUES ('52', '蛤呢', '<p>蛤蛤蛤</p>', '{240:\"蛤，乎\"}', '0', '0', '1499494404000', '7', null);
INSERT INTO `question` VALUES ('53', '我觉得做的非常棒，大家觉得如何？', '<p>我觉得做的非常棒，大家觉得如何？</p><p><br></p>', '{241:\"发送到\"}', '0', '0', '1499498784247', '11049', null);
INSERT INTO `question` VALUES ('54', 'php已经死了吗', '<p>rt</p>', '{3:\"python\"}', '0', '0', '1499500995774', '11054', null);
INSERT INTO `question` VALUES ('55', '好牛逼的网站啊', '<p>前端就是好，有作品拿出来就进阿里了</p>', '{242:\"对对对\"}', '0', '0', '1499522972644', '11075', null);
INSERT INTO `question` VALUES ('56', '可以的', '<p>test</p>', '{243:\"，，，\"}', '0', '0', '1499523421298', '8', null);
INSERT INTO `question` VALUES ('57', '123', '', '{244:\"123\"}', '0', '0', '1499526679512', '7', null);
INSERT INTO `question` VALUES ('58', '棒棒棒~', '<p>样式是自己改的嘛~厉害</p>', '{245:\"第三方\"}', '0', '0', '1499528049863', '7', null);
INSERT INTO `question` VALUES ('59', '123', '<p>123</p>', '{244:\"123\"}', '0', '0', '1499675233218', '7', null);
INSERT INTO `question` VALUES ('6', '在北京做Java开发如何月薪达到两万，需要技术水平达到什么程度？', 'muyou', '{184:\"程序员\",185:\"互联网工作\",40:\"Java\",176:\"编程\"}', '0', '0', '1493871303329', '45e6c1985fe640e09cd770d95e6e2c8b', null);
INSERT INTO `question` VALUES ('60', '我擦', '<p>牛B呀</p>', '{246:\"羡慕\"}', '0', '0', '1499680190905', '11151', null);
INSERT INTO `question` VALUES ('61', 'sdsd', '<p>ddd</p>', '{247:\"dd\"}', '0', '0', '1499698509558', '7', null);
INSERT INTO `question` VALUES ('62', '不错不错', '', '{248:\"introduction\"}', '0', '0', '1499743553681', '10949', null);
INSERT INTO `question` VALUES ('63', '我爱你', '<p>你爱我吗？</p>', '{249:\"爱你妹啊\"}', '0', '0', '1499746166682', '7', null);
INSERT INTO `question` VALUES ('64', '哈哈哈', '<p>呵呵呵呵</p>', '{40:\"java\"}', '0', '0', '1499754444950', '11027', null);
INSERT INTO `question` VALUES ('65', '哈哈哈', '<p>呵呵呵呵</p>', '{40:\"java\"}', '0', '0', '1499754444953', '11027', null);
INSERT INTO `question` VALUES ('66', '这是哪门课的作业呀~好棒~ ', '<p>怎么做上线的呢~<br></p>', '{250:\"编程；学习；\"}', '0', '0', '1499760469612', '11176', null);
INSERT INTO `question` VALUES ('67', '111', '<p><b>111</b><br></p><p><br></p>', '{251:\"11111\"}', '0', '0', '1499762313883', '5', null);
INSERT INTO `question` VALUES ('68', '哎呀，可以的', '<p>给你一个666666666666666666</p>', '{252:\"发的\"}', '0', '0', '1499772183106', '5', null);
INSERT INTO `question` VALUES ('69', 'dsadas', '<p>dsadas</p>', '{253:\"dddd;\"}', '0', '0', '1499778766471', '11189', null);
INSERT INTO `question` VALUES ('7', '中国现在有多少程序员？', 'muyou', '{186:\"IT 行业\",187:\"Java 程序员\",184:\"程序员\"}', '0', '0', '1493871312466', '45e6c1985fe640e09cd770d95e6e2c8b', null);
INSERT INTO `question` VALUES ('70', '厉害啊', '<p>膜</p>', '{254:\"55\"}', '0', '0', '1499832913241', '11195', null);
INSERT INTO `question` VALUES ('71', '为何左上角有一个分号', '<p>hahahah，是bug吗</p>', '{255:\"啦啦啦啦\"}', '0', '0', '1499832989704', '11195', null);
INSERT INTO `question` VALUES ('72', 'redis如何学习！！！', '', '{256:\"老哥稳\"}', '0', '0', '1499874072940', '11202', null);
INSERT INTO `question` VALUES ('73', '7-13到此一游', '<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; ///////////////////////</p>', '{43:\"spring\",40:\"java  \"}', '0', '0', '1499928433710', '7', null);
INSERT INTO `question` VALUES ('74', '有一句诗不知当念不当念', '<p>0000</p>', '{257:\"人生，诗词\"}', '0', '0', '1500026321404', '5', null);
INSERT INTO `question` VALUES ('75', '今年美国总统是谁', '<p>&nbsp; &nbsp;&nbsp;<br></p><p><br></p>', '{258:\"美国\"}', '0', '0', '1541559507377', '3', null);
INSERT INTO `question` VALUES ('8', '如何评价招行的手机APP和招行信用卡app“掌上生活”？', 'muyou', '{190:\"用户界面设计\",191:\"招商银行\",96:\"Android 开发\",188:\"社交网络\",189:\"手机\"}', '0', '0', '1493871321590', '45e6c1985fe640e09cd770d95e6e2c8b', null);
INSERT INTO `question` VALUES ('9', '如何自学 Android 编程？', 'muyou', '{96:\"Android 开发\",97:\"Android\",176:\"编程\",193:\"Android 应用设计\",192:\"学习方法\"}', '0', '0', '1493871330743', '45e6c1985fe640e09cd770d95e6e2c8b', null);

-- ----------------------------
-- Table structure for question_comment
-- ----------------------------
DROP TABLE IF EXISTS `question_comment`;
CREATE TABLE `question_comment` (
  `question_comment_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_comment_content` text,
  `liked_count` int(11) NOT NULL DEFAULT '0',
  `create_time` bigint(20) NOT NULL DEFAULT '0',
  `at_user_id` int(11) DEFAULT NULL,
  `at_user_name` varchar(100) DEFAULT NULL,
  `question_id` varchar(50) NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`question_comment_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of question_comment
-- ----------------------------

-- ----------------------------
-- Table structure for question_topic
-- ----------------------------
DROP TABLE IF EXISTS `question_topic`;
CREATE TABLE `question_topic` (
  `qt_id` int(11) NOT NULL AUTO_INCREMENT,
  `question_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  PRIMARY KEY (`qt_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=209 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of question_topic
-- ----------------------------

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
  PRIMARY KEY (`topic_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=259 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of topic
-- ----------------------------

-- ----------------------------
-- Table structure for toutiao_ad_click_record
-- ----------------------------
DROP TABLE IF EXISTS `toutiao_ad_click_record`;
CREATE TABLE `toutiao_ad_click_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `adid` varchar(50) DEFAULT NULL,
  `cid` varchar(50) DEFAULT NULL,
  `mac` varchar(50) DEFAULT NULL,
  `os` int(11) DEFAULT NULL,
  `timestamp` varchar(50) DEFAULT NULL,
  `convert_id` varchar(50) DEFAULT NULL,
  `callback_url` text,
  `idfa` varchar(40) DEFAULT NULL,
  `imei` varchar(40) DEFAULT NULL,
  `androidid` varchar(40) DEFAULT NULL,
  `visited` int(11) DEFAULT NULL,
  `success` int(11) DEFAULT NULL,
  `ctime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of toutiao_ad_click_record
-- ----------------------------

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` varchar(128) NOT NULL,
  `email` varchar(50) NOT NULL DEFAULT '',
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
INSERT INTO `user` VALUES ('45e6c1985fe640e09cd770d95e6e2c8b', 'cc@126.com', '123', '0', '', '0', 'caizhenya', '', '1', '热爱生活的呆萌的joyer 热爱生活的呆萌的joyer v热爱生活的呆萌的joyer ', '广东省深圳市广东省深圳市广东省深圳市', '互联网互联网互联网', '实习生实习生实习生', '本科', '呆萌的joyer呆萌的joyer呆萌的joyer呆萌的joyer', '0', '0', '0', '0', '0', '');
