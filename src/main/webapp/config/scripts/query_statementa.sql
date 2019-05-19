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

 Date: 19/05/2019 17:32:47
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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of query_statementa
-- ----------------------------
INSERT INTO `query_statementa` VALUES (1, 1, '2019-05-19 17:19:05', NULL, 'home', b'0', 'count', '[]', 'select count(*) from Progress progress', '当前进度', NULL);
INSERT INTO `query_statementa` VALUES (2, 2, '2019-05-19 17:19:05', NULL, 'home', b'0', 'count', '[]', 'select count(*) from SystemStatus systemStatus where systemStatus.userName is not null', '登陆情况', NULL);
INSERT INTO `query_statementa` VALUES (3, 1, '2019-05-19 17:19:05', NULL, 'home', b'0', 'list', '[max, offset]', 'from Progress progress order by regDate desc', '当前进度', 'listProgressHome');
INSERT INTO `query_statementa` VALUES (4, 0, '2019-05-19 17:19:28', NULL, 'home', b'0', 'count', '[]', NULL, '我的科研', NULL);
INSERT INTO `query_statementa` VALUES (5, 0, '2019-05-19 17:19:28', NULL, 'home', b'0', 'count', '[]', NULL, '我的教学', NULL);
INSERT INTO `query_statementa` VALUES (6, 0, '2019-05-19 17:19:28', NULL, 'home', b'0', 'list', '[max, offset]', NULL, '我的科研', NULL);
INSERT INTO `query_statementa` VALUES (7, 0, '2019-05-19 17:19:30', NULL, 'home', b'0', 'list', '[max, offset]', NULL, '我的教学', NULL);
INSERT INTO `query_statementa` VALUES (8, 1, '2019-05-19 00:00:00', NULL, 'operation4QueryStatementA', b'0', 'count', '[]', 'select count(*) from QueryStatementA queryStatementA', '查询维护', NULL);
INSERT INTO `query_statementa` VALUES (9, 1, '2019-05-19 00:00:00', NULL, 'operation4QueryStatementA', b'0', 'list', '[max, offset]', 'from QueryStatementA queryStatementA order by controllerName, actionName', '查询维护', 'listQueryStatementA');
INSERT INTO `query_statementa` VALUES (10, 2, '2019-05-19 17:25:06', NULL, 'home', b'0', 'list', '[max, offset]', 'from SystemStatus systemStatus  where systemStatus.userName is not null order by loginTime desc', '登陆情况', 'listSystemStatus');

SET FOREIGN_KEY_CHECKS = 1;
