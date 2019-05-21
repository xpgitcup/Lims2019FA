/*
 Navicat Premium Data Transfer

 Source Server         : sample
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : lims2019dba

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 21/05/2019 17:58:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for query_statementa
-- ----------------------------
DROP TABLE IF EXISTS `query_statementa`;
CREATE TABLE `query_statementa`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `format_string` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `controller_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `issql` bit(1) NOT NULL,
  `action_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `params_string` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `query_string` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `key_string` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `view_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 46 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of query_statementa
-- ----------------------------
INSERT INTO `query_statementa` VALUES (1, 1, '2019-05-19 17:19:05', NULL, 'home', b'0', 'count', '[]', 'select count(*) from Progress progress', '当前进度', NULL);
INSERT INTO `query_statementa` VALUES (2, 2, '2019-05-19 17:19:05', NULL, 'home', b'0', 'count', '[]', 'select count(*) from SystemStatus systemStatus where systemStatus.userName is not null', '登陆情况', NULL);
INSERT INTO `query_statementa` VALUES (3, 1, '2019-05-19 17:19:05', NULL, 'home', b'0', 'list', '[max, offset]', 'from Progress progress order by regDate desc', '当前进度', 'listProgressHome');
INSERT INTO `query_statementa` VALUES (8, 1, '2019-05-19 00:00:00', NULL, 'operation4QueryStatementA', b'0', 'count', '[]', 'select count(*) from QueryStatementA queryStatementA', '查询维护', NULL);
INSERT INTO `query_statementa` VALUES (9, 1, '2019-05-19 00:00:00', NULL, 'operation4QueryStatementA', b'0', 'list', '[max, offset]', 'from QueryStatementA queryStatementA order by controllerName, actionName', '查询维护', 'listQueryStatementA');
INSERT INTO `query_statementa` VALUES (10, 2, '2019-05-19 17:25:06', NULL, 'home', b'0', 'list', '[max, offset]', 'from SystemStatus systemStatus  where systemStatus.userName is not null order by loginTime desc', '登陆情况', 'listSystemStatus');
INSERT INTO `query_statementa` VALUES (11, 1, '2019-05-19 00:00:00', NULL, 'operation4QueryStatementA', b'0', 'count', '[]', 'select count(*) from QueryStatementA queryStatementA where queryStatementA.queryString=null', '查询维护待编辑', NULL);
INSERT INTO `query_statementa` VALUES (12, 2, '2019-05-19 00:00:00', NULL, 'operation4QueryStatementA', b'0', 'list', '[max, offset]', 'from QueryStatementA queryStatementA where queryStatementA.queryString=null order by updateTime desc, controllerName, actionName,keyString', '查询维护待编辑', 'listQueryStatementA');
INSERT INTO `query_statementa` VALUES (13, 1, '2019-05-19 20:25:20', NULL, 'operation4QueryStatementA', b'0', 'count', '[like]', 'select count(*) from QueryStatementA queryStatementA where queryStatementA.keyString like :like', '查询维护', NULL);
INSERT INTO `query_statementa` VALUES (14, 1, '2019-05-19 20:25:20', NULL, 'operation4QueryStatementA', b'0', 'list', '[like, max, offset]', 'from QueryStatementA queryStatementA where queryStatementA.keyString like :like order by controllerName, actionName,keyString', '查询维护', 'listQueryStatementA');
INSERT INTO `query_statementa` VALUES (20, 3, '2019-05-19 22:10:07', NULL, 'home', b'0', 'count', '[myself]', 'select count(*) from Progress progress where progress.contributor=:myself', '我的进展', NULL);
INSERT INTO `query_statementa` VALUES (21, 2, '2019-05-19 22:10:07', NULL, 'home', b'0', 'count', '[myself]', 'select count(*) from SystemStatus systemStatus where systemStatus.userName=:myself', '我的登录', NULL);
INSERT INTO `query_statementa` VALUES (22, 2, '2019-05-19 22:10:07', NULL, 'home', b'0', 'list', '[max, myself, offset]', 'from SystemStatus systemStatus where systemStatus.userName=:myself', '我的登录', 'listSystemStatus');
INSERT INTO `query_statementa` VALUES (23, 4, '2019-05-19 22:10:09', NULL, 'home', b'0', 'list', '[max, myself, offset]', 'from Progress progress where progress.contributor=:myself order by regDate desc', '我的进展', 'listProgressHome');
INSERT INTO `query_statementa` VALUES (24, 1, '2019-05-19 22:42:44', NULL, 'operation4DataRootPath', b'0', 'count', '[]', 'select count(*) from DataRootPath dataRootPath', '数据根目录', NULL);
INSERT INTO `query_statementa` VALUES (25, 1, '2019-05-19 22:42:44', NULL, 'operation4DataRootPath', b'0', 'list', '[max, offset]', 'from DataRootPath dataRootPath order by keyString', '数据根目录', 'listDataRootPath');
INSERT INTO `query_statementa` VALUES (26, 0, '2019-05-19 22:54:13', NULL, 'home', b'0', 'count', '[]', NULL, '我的进展', NULL);
INSERT INTO `query_statementa` VALUES (27, 0, '2019-05-19 22:54:13', NULL, 'home', b'0', 'count', '[]', NULL, '我的登录', NULL);
INSERT INTO `query_statementa` VALUES (28, 0, '2019-05-19 22:54:13', NULL, 'home', b'0', 'list', '[max, offset]', NULL, '我的进展', NULL);
INSERT INTO `query_statementa` VALUES (29, 0, '2019-05-20 19:49:48', NULL, 'operation4SystemUser', b'0', 'list', '[max, offset]', NULL, 'SystemUser', NULL);
INSERT INTO `query_statementa` VALUES (30, 1, '2019-05-20 20:20:11', NULL, 'operation4SystemUser', b'0', 'count', '[]', 'select count(*) from SystemUser systemUser', '用户维护', NULL);
INSERT INTO `query_statementa` VALUES (31, 2, '2019-05-20 20:20:12', NULL, 'operation4SystemUser', b'0', 'list', '[max, offset]', 'from SystemUser systemUser order by userName', '用户维护', 'listSystemUser');
INSERT INTO `query_statementa` VALUES (32, 1, '2019-05-20 21:33:17', NULL, 'operation4SystemUser', b'0', 'count', '[like]', 'select count(*) from SystemUser systemUser where appendAttribute like :like', '用户维护', NULL);
INSERT INTO `query_statementa` VALUES (33, 1, '2019-05-20 21:33:17', NULL, 'operation4SystemUser', b'0', 'list', '[like, max, offset]', 'from SystemUser systemuser where appendAttribute like :like', '用户维护', 'listSystemUser');
INSERT INTO `query_statementa` VALUES (34, 0, '2019-05-21 17:18:49', NULL, 'person', b'0', 'count', '[]', NULL, '教师', NULL);
INSERT INTO `query_statementa` VALUES (35, 0, '2019-05-21 17:18:49', NULL, 'person', b'0', 'count', '[]', NULL, '学生', NULL);
INSERT INTO `query_statementa` VALUES (36, 0, '2019-05-21 17:18:49', NULL, 'person', b'0', 'count', '[]', NULL, '专业', NULL);
INSERT INTO `query_statementa` VALUES (37, 0, '2019-05-21 17:18:49', NULL, 'person', b'0', 'count', '[]', NULL, '年级', NULL);
INSERT INTO `query_statementa` VALUES (38, 1, '2019-05-21 17:18:50', NULL, 'operation4Person', b'0', 'list', '[max, offset]', 'from Teacher teacher order by name', '教师', 'listTeacher');
INSERT INTO `query_statementa` VALUES (39, 1, '2019-05-21 17:18:52', NULL, 'operation4Person', b'0', 'list', '[max, offset]', 'from Student student  order by personTitle, supervisor, gradeName,  major, code', '学生', 'listStudent');
INSERT INTO `query_statementa` VALUES (40, 1, '2019-05-21 17:18:53', NULL, 'operation4Person', b'0', 'list', '[max, offset]', 'from Major major order by name', '专业', 'listMajor');
INSERT INTO `query_statementa` VALUES (41, 1, '2019-05-21 17:18:53', NULL, 'operation4Person', b'1', 'list', '[max, offset]', 'SELECT DISTINCT person.grade_name FROM person WHERE person.grade_name IS NOT NULL limit %d,%d', '年级', 'listGradeName');
INSERT INTO `query_statementa` VALUES (42, 1, '2019-05-21 17:53:26', NULL, 'operation4Person', b'0', 'count', '[]', 'select count(*) from Teacher teacher', '教师', NULL);
INSERT INTO `query_statementa` VALUES (43, 1, '2019-05-21 17:53:26', NULL, 'operation4Person', b'0', 'count', '[]', 'select count(*) from Student student', '学生', NULL);
INSERT INTO `query_statementa` VALUES (44, 1, '2019-05-21 17:53:26', NULL, 'operation4Person', b'0', 'count', '[]', 'select count(*) from Major major', '专业', NULL);
INSERT INTO `query_statementa` VALUES (45, 1, '2019-05-21 17:53:26', NULL, 'operation4Person', b'0', 'count', '[]', 'SELECT Count(DISTINCT person.grade_name) FROM person WHERE person.grade_name IS NOT NULL', '年级', NULL);

SET FOREIGN_KEY_CHECKS = 1;
