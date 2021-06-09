create database TTMS;
use TTMS;
/*
 Navicat Premium Data Transfer

 Source Server         : Local
 Source Server Type    : MySQL
 Source Server Version : 50520
 Source Host           : localhost:3306
 Source Schema         : ttmsnew

 Target Server Type    : MySQL
 Target Server Version : 50520
 File Encoding         : 65001

 Date: 20/01/2021 12:05:53
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for customer
-- ----------------------------
DROP TABLE IF EXISTS `customer`;
CREATE TABLE `customer`  (
  `cus_id` int(11) NOT NULL AUTO_INCREMENT,
  `cus_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cus_telnum` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cus_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `cus_pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '登陆密码',
  `cus_vip` smallint(6) DEFAULT 0 COMMENT '说明：\r\n            0：禁用\r\n            1：启用',
  `cus_balance` decimal(10, 0) DEFAULT 1000 COMMENT '账户余额',
  `cus_paypwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL COMMENT '支付密码',
  PRIMARY KEY (`cus_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

INSERT INTO customer(cus_name,cus_telnum,cus_email,cus_pwd) VALUES('LYY','13279505680','2193560021@qq.com','liuyng01253217');
INSERT INTO customer(cus_name,cus_telnum,cus_email,cus_pwd) VALUES('FJW','15830599166','123456@qq.com','123456');
INSERT INTO customer(cus_name,cus_telnum,cus_email,cus_pwd) VALUES('ZJQ','18791307612','234567@qq.com','234567');
INSERT INTO customer(cus_name,cus_telnum,cus_email,cus_pwd) VALUES('ZRP','15129072144','345678@qq.com','345678');
INSERT INTO customer(cus_name,cus_telnum,cus_email,cus_pwd) VALUES('XZL','17764752350','567890@qq.com','567890');
INSERT INTO customer(cus_name,cus_telnum,cus_email,cus_pwd) VALUES('QPY','15771831001','67890@qq.com','67890');

-- ----------------------------
-- Table structure for data_dict
-- ----------------------------
DROP TABLE IF EXISTS `data_dict`;
CREATE TABLE `data_dict`  (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT,
  `super_dict_id` int(11) DEFAULT NULL COMMENT '父id',
  `dict_index` int(11) DEFAULT NULL COMMENT '同级顺序',
  `dict_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  PRIMARY KEY (`dict_id`) USING BTREE,
  INDEX `FK_super_child_dict`(`super_dict_id`) USING BTREE,
  CONSTRAINT `FK_super_child_dict` FOREIGN KEY (`super_dict_id`) REFERENCES `data_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of data_dict
-- ----------------------------
INSERT INTO `data_dict` VALUES (1, NULL, 1, '数据字典', '根');
INSERT INTO `data_dict` VALUES (2, 1, 1, 'PLAYTYPE', '影片类型');
INSERT INTO `data_dict` VALUES (3, 1, 2, 'PLAYLANG', '影片语言');
INSERT INTO `data_dict` VALUES (4, 1, 3, '锁失效时间', '10');
INSERT INTO `data_dict` VALUES (5, 2, 1, 'History', '历史');
INSERT INTO `data_dict` VALUES (6, 2, 2, 'Anime', '动漫');
INSERT INTO `data_dict` VALUES (7, 2, 3, 'Drama', '生活');
INSERT INTO `data_dict` VALUES (8, 2, 4, 'Horror', '恐怖');
INSERT INTO `data_dict` VALUES (9, 2, 5, 'War', '战争');
INSERT INTO `data_dict` VALUES (10, 2, 6, 'Sci-Fi', '科幻');
INSERT INTO `data_dict` VALUES (11, 2, 7, 'Romance', '爱情');
INSERT INTO `data_dict` VALUES (12, 2, 8, 'Comedy', '喜剧');
INSERT INTO `data_dict` VALUES (13, 2, 9, 'Action', '动作');
INSERT INTO `data_dict` VALUES (14, 3, 1, 'Chinese', '国语');
INSERT INTO `data_dict` VALUES (15, 3, 2, 'English', '英语');
INSERT INTO `data_dict` VALUES (16, 3, 3, 'Japanese', '日语');
INSERT INTO `data_dict` VALUES (17, 3, 4, 'Korean', '韩语');

-- ----------------------------
-- Table structure for employee
-- ----------------------------
DROP TABLE IF EXISTS `employee`;
CREATE TABLE `employee`  (
  `emp_id` int(11) NOT NULL AUTO_INCREMENT,
  `dict_id` int(11) DEFAULT NULL,
  `emp_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `emp_gender` smallint(6) DEFAULT 1 COMMENT '说明：\r\n            0：女\r\n            1：男',
  `emp_telnum` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `emp_email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `emp_pwd` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `emp_status` smallint(6) DEFAULT 1 COMMENT '说明：\r\n            0：禁用\r\n            1：启用',
  PRIMARY KEY (`emp_id`) USING BTREE,
  INDEX `FK_emp_position`(`dict_id`) USING BTREE,
  CONSTRAINT `FK_emp_position` FOREIGN KEY (`dict_id`) REFERENCES `data_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

INSERT INTO employee(emp_name,emp_email,emp_pwd) VALUES('LYY','2193560021@qq.com','liuyng01253217');
INSERT INTO employee(emp_name,emp_email,emp_pwd) VALUES('FJW','123456@qq.com','123456');
INSERT INTO employee(emp_name,emp_email,emp_pwd) VALUES('ZJQ','234567@qq.com','234567');
INSERT INTO employee(emp_name,emp_email,emp_pwd) VALUES('ZRP','345678@qq.com','345678');
INSERT INTO employee(emp_name,emp_email,emp_pwd) VALUES('XZL','567890@qq.com','567890');
INSERT INTO employee(emp_name,emp_email,emp_pwd) VALUES('QPY','67890@qq.com','67890');


-- ----------------------------
-- Table structure for play
-- ----------------------------
DROP TABLE IF EXISTS `play`;
CREATE TABLE `play`  (
  `play_id` int(11) NOT NULL AUTO_INCREMENT,
  `dict_type_id` int(11) DEFAULT NULL,
  `dict_lang_id` int(11) DEFAULT NULL,
  `play_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `play_kind` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `play_introduction` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `play_image` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `play_image_bg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `play_video` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `play_length` int(11) DEFAULT NULL,
  `play_ticket_price` int(5) DEFAULT NULL,
  `play_status` smallint(6) DEFAULT NULL COMMENT '取值含义：\r\n            0：待安排演出\r\n            1：已安排演出\r\n            -1：下线',
  PRIMARY KEY (`play_id`) USING BTREE,
  INDEX `FK_dict_lan_play`(`dict_lang_id`) USING BTREE,
  INDEX `FK_dict_type_play`(`dict_type_id`) USING BTREE,
  CONSTRAINT `FK_dict_lan_play` FOREIGN KEY (`dict_lang_id`) REFERENCES `data_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_dict_type_play` FOREIGN KEY (`dict_type_id`) REFERENCES `data_dict` (`dict_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of play
-- ----------------------------






<............................................................>



INSERT INTO play(play_name,play_introduction,play_length,play_ticket_price) VALUES ('寂静之地2 A Quiet Place: Part II','故事紧承上一部展开。在丈夫为保护家人牺牲后，伊芙琳（艾米莉·布朗特 饰）不得不独自带着孩子们（米莉森·西蒙斯、诺亚·尤佩 饰）面对全新的生存挑战。他们将被迫离开家园，踏上一段未知的旅途。在无声的世界里，除了要躲避“猎声怪物”的捕杀，铺满细沙的道路尽头还暗藏着新的危机。
',97,37);



INSERT INTO play(play_name,play_introduction,play_length,play_ticket_price) VALUES ('你的婚礼','游泳特长生周潇齐（许光汉 饰）在一次打架事件中，对初来乍到的转校生尤咏慈（章若楠 饰）一见钟情，周潇齐对尤咏慈默默守护，接踵而至的却是女孩的不告而别。随后的人生，周潇齐并没有考上大学，在做网管的间隙突然发现了尤咏慈的踪迹，于是周潇齐复读考上了尤咏慈的大学，为的只是再次站在她面前再续前缘。两人的相遇并没有像想象中那种甜蜜，“恋爱的时机”总是不属于周潇齐，尽管死党张放（丁冠森 饰）等人想尽办法帮助周潇齐追爱，可尤咏慈的身边已经有了学长（梁靖康 饰）的陪伴。毕业后的两人天各一方，命运却再次让他们相遇，此后的人生，15年的爱情长跑。你的婚礼，也是我的成人礼。',115,32);
INSERT INTO play(play_name,play_introduction,play_length,play_ticket_price) VALUES ('名侦探柯南：绯色的子弹 名探偵コナン 緋色の弾丸','故事发生于东京，在全球最大体育盛事WSG即将召开之际，知名企业的高官却接连在赞助商酒会现场遭到绑架，而自新名古屋站至东京的最高时速1000km的真空超导磁悬浮列车也被卷入其中，一场牵动国际目光的重大案件就此展开。',110,35);

INSERT INTO play(play_name,play_introduction,play_length,play_ticket_price) VALUES ('扫黑·决战','该片是国内首部以“扫黑除恶”行动为题材、展现全国扫黑办督办案件的影视化作品，讲述某扫黑专案组组长宋一锐带领组员由一起征地案深入调查，突破层层阻挠，与幕后的黑恶势力展开激烈斗争，最终揭开腐败官员利用公职权力充当犯罪保护伞的虚伪面具，将犯罪分子绳之以法的故事。
',112,38);

INSERT INTO play(play_name,play_introduction,play_length,play_ticket_price) VALUES ('招魂3 The Conjuring: The Devil Made Me Do It','这是现实生活中超自然现象调查员埃德·沃伦和洛林·沃伦的档案中最耸人听闻的案件之一：一名小男孩被谋杀，而嫌疑人在美国史上首次声称恶魔附身作为辩护。',112,33);
INSERT INTO play(play_name,play_introduction,play_length,play_ticket_price) VALUES ('我的姐姐','影片围绕失去父母的姐姐在面对追求个人独立生活还是抚养弟弟的问题上展开了一段细腻感人的亲情故事。',127,35);
INSERT INTO play(play_name,play_introduction,play_length,play_ticket_price) VALUES ('夏目友人帐：石起和可疑来访者 夏目友人帳 石起こしと怪しき来訪者','以短篇集的形式，推出两篇人气故事“唤石”与“可疑访客”。讲述天生拥有能够看见妖怪能力的夏目，和强大妖怪“斑”组成跨越人与妖怪的组合，为夏目崭新的高中生涯带来众多不同的邂逅…
　　《唤石》篇
　　夏目在森林中遇见小妖怪－「三美」，据它说，它身负著名为「唤石」的职责，负责将具备神格名叫「岩铁」的妖怪从沉睡中唤醒。
　　不过猫咪老师和妖怪们垂涎任务完成后能得到的美酒奖赏，计画要夺取唤石一职。
　　夏目担心三美，决心出手相助――。
　　《可疑的访客》篇
　　田沼身边出现一位不可思议的客人。每天都会出现在他身边，只跟他说了一些话便离去。
　　夏目得知该位客人的真实身分是妖怪后
　　虽然很担心田沼，但田沼本人却对跟妖怪的交流乐在其中。
　　虽然这妖怪似乎无意作恶，但田沼的身体却日渐虚弱。
',51,20);
INSERT INTO play(play_name,play_introduction,play_length,play_ticket_price) VALUES ('白蛇传·情','首部4K全景声粤剧电影，取材自民间故事《白蛇传》，那白蛇的故事，远久流传...
　　白素贞修炼千年，只为人间寻那许仙，再续兰因前缘。
　　说什么人妖殊途，法理难容此爱恋。昆仑雪寒金山水漫，白素贞拼尽所有，只求天地人心情真一片。
　　纵天谴又如何？再困塔里千年亦甘愿！
　　彼此守望，哪天，佛陀花开，你我再见！',101,32);

<............................................................>
-- ----------------------------
-- Table structure for resource
-- ----------------------------
DROP TABLE IF EXISTS `resource`;
CREATE TABLE `resource`  (
  `res_id` int(11) NOT NULL AUTO_INCREMENT,
  `res_parent` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `res_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `res_URL` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`res_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for role_resource
-- ----------------------------
DROP TABLE IF EXISTS `role_resource`;
CREATE TABLE `role_resource`  (
  `role_res_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) DEFAULT NULL,
  `res_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`role_res_id`) USING BTREE,
  INDEX `FK_res_role`(`res_id`) USING BTREE,
  INDEX `FK_role_resource`(`role_id`) USING BTREE,
  CONSTRAINT `FK_res_role` FOREIGN KEY (`res_id`) REFERENCES `resource` (`res_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_role_resource` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sale
-- ----------------------------
DROP TABLE IF EXISTS `sale`;
CREATE TABLE `sale`  (
  `sale_ID` bigint(20) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `cus_id` int(11) DEFAULT NULL,
  `sale_time` datetime DEFAULT NULL,
  `sale_payment` decimal(10, 2) DEFAULT NULL,
  `sale_change` decimal(10, 2) DEFAULT NULL,
  `sale_type` smallint(6) DEFAULT NULL COMMENT '类别取值含义：\r\n            1：销售单\r\n            -1：退款单',
  `sale_status` smallint(6) DEFAULT NULL COMMENT '销售单状态如下：\r\n            0：代付款\r\n            1：已付款',
  `sale_sort` smallint(6) DEFAULT NULL COMMENT '取值说明：\r\n            1：顾客自购/退票\r\n            0：售票员销售/退票',
  PRIMARY KEY (`sale_ID`) USING BTREE,
  INDEX `FK_customer_sale`(`cus_id`) USING BTREE,
  INDEX `FK_employee_sale`(`emp_id`) USING BTREE,
  CONSTRAINT `FK_customer_sale` FOREIGN KEY (`cus_id`) REFERENCES `customer` (`cus_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_employee_sale` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for sale_item
-- ----------------------------
DROP TABLE IF EXISTS `sale_item`;
CREATE TABLE `sale_item`  (
  `sale_item_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ticket_id` bigint(20) DEFAULT NULL,
  `sale_ID` bigint(20) DEFAULT NULL,
  `sale_item_price` decimal(10, 2) DEFAULT NULL,
  PRIMARY KEY (`sale_item_id`) USING BTREE,
  INDEX `FK_sale_sale_item`(`sale_ID`) USING BTREE,
  INDEX `FK_ticket_sale_item`(`ticket_id`) USING BTREE,
  CONSTRAINT `FK_sale_sale_item` FOREIGN KEY (`sale_ID`) REFERENCES `sale` (`sale_ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ticket_sale_item` FOREIGN KEY (`ticket_id`) REFERENCES `ticket` (`ticket_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for schedule
-- ----------------------------
DROP TABLE IF EXISTS `schedule`;
CREATE TABLE `schedule`  (
  `sched_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_id` int(11) DEFAULT NULL,
  `play_id` int(11) DEFAULT NULL,
  `play_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `sched_time` datetime NOT NULL,
  `sched_ticket_price` decimal(10, 2) DEFAULT NULL,
  `sched_status` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`sched_id`) USING BTREE,
  INDEX `FK_play_sched`(`play_id`) USING BTREE,
  INDEX `FK_studio_sched`(`studio_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;



insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (2,10,'哆啦A梦：伴我同行',"2021-5-28 09:35",35);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (4,10,'哆啦A梦：伴我同行',"2021-5-28 12:55",35);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (5,10,'哆啦A梦：伴我同行',"2021-5-28 19:25",35);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (1,11,'寂静之地2 ',"2021-5-28 9:25",37);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (3,11,'寂静之地2 ',"2021-5-28 14:35",37);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (5,11,'寂静之地2 ',"2021-5-28 22:25",37);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (2,12,'九零后',"2021-5-29 10:55",38);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (3,12,'九零后',"2021-5-29 16:25",38);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (4,12,'九零后',"2021-5-29 23:15",38);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (1,13,'匹诺曹',"2021-6-1 08:15",35);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (1,13,'匹诺曹',"2021-6-1 12:25",35);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (5,13,'匹诺曹',"2021-6-1 21:10",35);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (1,14,'扫黑·决战',"2021-5-1 11:10",38);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (3,14,'扫黑·决战',"2021-5-1 15:20",38);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (4,14,'扫黑·决战',"2021-5-1 19:20",38);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (1,15,'速度与激情9',"2021-5-21 09:20",38);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (5,15,'速度与激情9',"2021-5-21 15:10",38);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (4,15,'速度与激情9',"2021-5-21 23:35",38);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (4,16,'悬崖之上',"2021-4-30 09:35",35);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (5,16,'悬崖之上',"2021-4-30 12:45",35);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (5,16,'悬崖之上',"2021-4-30 21:35",35);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (2,17,'我要我们在一起',"2021-5-20 8:45",37);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (5,17,'我要我们在一起',"2021-5-20 11:35",37);
insert into schedule (studio_id,play_id,play_name,sched_time,sched_ticket_price) values (4,17,'我要我们在一起',"2021-5-20 19:45",37);


-- ----------------------------
-- Table structure for seat
-- ----------------------------
DROP TABLE IF EXISTS `seat`;
CREATE TABLE `seat`  (
  `seat_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_id` int(11) DEFAULT NULL,
  `seat_row` int(11) DEFAULT NULL,
  `seat_column` int(11) DEFAULT NULL,
  `seat_status` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`seat_id`) USING BTREE,
  INDEX `FK_studio_seat`(`studio_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

insert into seat (studio_id,seat_row,seat_column) values(2,6,6);
insert into seat (studio_id,seat_row,seat_column) values(4,3,5);
insert into seat (studio_id,seat_row,seat_column) values(5,9,4);
insert into seat (studio_id,seat_row,seat_column) values(3,7,9);
insert into seat (studio_id,seat_row,seat_column) values(4,6,4);

-- ----------------------------
-- Table structure for studio
-- ----------------------------
DROP TABLE IF EXISTS `studio`;
CREATE TABLE `studio`  (
  `studio_id` int(11) NOT NULL AUTO_INCREMENT,
  `studio_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `studio_row_count` int(11) DEFAULT NULL,
  `studio_col_count` int(11) DEFAULT NULL,
  `studio_introduction` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `studio_status` smallint(6) DEFAULT 1 COMMENT '说明：\r\n   0：禁用\r\n   1：启用',
  PRIMARY KEY (`studio_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of studio
-- ----------------------------
INSERT INTO `studio` VALUES (1, '1号厅', 8, 8, '1号厅', 1);
INSERT INTO `studio` VALUES (2, '激光MAX厅', 8, 8, '激光MAX厅', 1);
INSERT INTO `studio` VALUES (3, '全景声MAX厅', 10, 10, '全景声MAX厅', 1);
INSERT INTO `studio` VALUES (4, 'VIP厅', 8, 8, 'VIP厅', 1);
INSERT INTO `studio` VALUES (5, '杜比厅', 9, 9, '杜比厅', 1);

-- ----------------------------
-- Table structure for ticket
-- ----------------------------
DROP TABLE IF EXISTS `ticket`;
CREATE TABLE `ticket`  (
  `ticket_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `seat_id` int(11) DEFAULT NULL,
  `sched_id` int(11) DEFAULT NULL,
  `ticket_price` decimal(10, 2) DEFAULT NULL,
  `ticket_status` smallint(6) DEFAULT NULL COMMENT '含义如下：\r\n            0：待销售\r\n            1：锁定\r\n            9：卖出',
  `ticket_locktime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '加锁时间(下单后加锁)',
  PRIMARY KEY (`ticket_id`) USING BTREE,
  INDEX `FK_sched_ticket`(`sched_id`) USING BTREE,
  INDEX `FK_seat_ticket`(`seat_id`) USING BTREE,
  CONSTRAINT `FK_sched_ticket` FOREIGN KEY (`sched_id`) REFERENCES `schedule` (`sched_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_seat_ticket` FOREIGN KEY (`seat_id`) REFERENCES `seat` (`seat_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for usr_role
-- ----------------------------
DROP TABLE IF EXISTS `usr_role`;
CREATE TABLE `usr_role`  (
  `usr_role_id` int(11) NOT NULL AUTO_INCREMENT,
  `emp_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`usr_role_id`) USING BTREE,
  INDEX `FK_role_user`(`role_id`) USING BTREE,
  INDEX `FK_user_role`(`emp_id`) USING BTREE,
  CONSTRAINT `FK_role_user` FOREIGN KEY (`role_id`) REFERENCES `roles` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_user_role` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;

