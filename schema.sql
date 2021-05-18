/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80022
 Source Host           : 127.0.0.1:3306
 Source Schema         : cms

 Target Server Type    : MySQL
 Target Server Version : 80022
 File Encoding         : 65001

 Date: 19/05/2021 00:10:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `author` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `summary` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `image` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------

-- ----------------------------
-- Table structure for client
-- ----------------------------
DROP TABLE IF EXISTS `client`;
CREATE TABLE `client`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  `typeId` int(0) NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `byPhone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `email` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `address` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `fax` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `htje` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `ysh` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT '0.00',
  `yshk` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT '0.00',
  `wshk` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT '0.00',
  `okhk` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT '0.00',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES (1, '测试客户', 8, '1579652251', '18826127550', '819836692@qq.com', NULL, '测试备注', '521-1314', '1200', '0.00', '0.00', '0.00', '0.00', '2021-03-18 14:28:14', '2021-03-29 17:38:19', NULL);
INSERT INTO `client` VALUES (2, '测试客户2', 9, '15555555555', '18888888888', '829338467@emali.com', '测试地址', '测试备注行不行', '567-267992', '1000000', '0.00', '0.00', '0.00', '0.00', '2021-03-25 12:21:04', '2021-03-25 12:43:12', NULL);
INSERT INTO `client` VALUES (3, '测试删除', 10, '15555555555', NULL, NULL, NULL, NULL, NULL, '131400', '0.00', '0.00', '0.00', '0.00', '2021-03-29 17:39:11', '2021-03-29 17:43:44', '2021-03-29 17:43:44');

-- ----------------------------
-- Table structure for client_type
-- ----------------------------
DROP TABLE IF EXISTS `client_type`;
CREATE TABLE `client_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client_type
-- ----------------------------
INSERT INTO `client_type` VALUES (1, '测试类型', '2021-03-14 00:32:59', '2021-03-17 15:30:10', '2021-03-17 15:30:10');
INSERT INTO `client_type` VALUES (2, '测试', '2021-03-14 00:33:27', '2021-03-17 15:30:13', '2021-03-17 15:30:13');
INSERT INTO `client_type` VALUES (3, '测试2', '2021-03-14 00:35:40', '2021-03-17 15:25:17', '2021-03-17 15:25:17');
INSERT INTO `client_type` VALUES (4, '测试3', '2021-03-14 00:36:55', '2021-03-14 01:14:28', '2021-03-14 01:14:28');
INSERT INTO `client_type` VALUES (5, '测试4', '2021-03-14 00:37:05', '2021-03-14 01:14:21', '2021-03-14 01:14:21');
INSERT INTO `client_type` VALUES (6, '测试3', '2021-03-14 01:16:28', '2021-03-17 15:25:16', '2021-03-17 15:25:16');
INSERT INTO `client_type` VALUES (7, '测试4', '2021-03-14 01:16:38', '2021-03-17 15:30:15', '2021-03-17 15:30:15');
INSERT INTO `client_type` VALUES (8, '测试类型1', '2021-03-17 15:17:54', '2021-03-17 15:17:54', NULL);
INSERT INTO `client_type` VALUES (9, '测试类型2', '2021-03-17 15:25:05', '2021-03-17 15:25:05', NULL);
INSERT INTO `client_type` VALUES (10, '测试类型3', '2021-03-17 15:25:11', '2021-03-17 15:25:11', NULL);
INSERT INTO `client_type` VALUES (11, '随意添加', '2021-03-17 15:30:42', '2021-03-17 15:30:45', '2021-03-17 15:30:45');
INSERT INTO `client_type` VALUES (12, '随意', '2021-03-17 15:32:03', '2021-03-17 15:32:08', '2021-03-17 15:32:08');
INSERT INTO `client_type` VALUES (13, '测试类型123', '2021-03-17 15:32:16', '2021-03-17 15:32:21', '2021-03-17 15:32:21');
INSERT INTO `client_type` VALUES (14, '测试类型2333', '2021-03-17 15:34:35', '2021-03-17 15:57:43', '2021-03-17 15:57:43');
INSERT INTO `client_type` VALUES (15, '添加测试1', '2021-03-17 15:42:33', '2021-03-17 15:57:06', '2021-03-17 15:57:06');
INSERT INTO `client_type` VALUES (16, '123', '2021-03-17 15:58:07', '2021-03-17 15:58:10', '2021-03-17 15:58:10');
INSERT INTO `client_type` VALUES (17, '2333', '2021-03-17 15:58:20', '2021-03-17 15:58:25', '2021-03-17 15:58:25');
INSERT INTO `client_type` VALUES (18, '测试233', '2021-03-17 15:59:39', '2021-03-17 16:34:29', '2021-03-17 16:34:29');
INSERT INTO `client_type` VALUES (19, '测试123', '2021-03-17 16:00:37', '2021-03-17 16:34:28', '2021-03-17 16:34:28');
INSERT INTO `client_type` VALUES (20, '添加测试', '2021-03-17 16:06:43', '2021-03-17 16:34:26', '2021-03-17 16:34:26');
INSERT INTO `client_type` VALUES (21, '测试添加', '2021-03-17 16:07:26', '2021-03-17 16:34:23', '2021-03-17 16:34:23');
INSERT INTO `client_type` VALUES (22, '测试1', '2021-03-17 16:07:32', '2021-03-17 16:34:21', '2021-03-17 16:34:21');
INSERT INTO `client_type` VALUES (23, '成功测试', '2021-03-17 16:16:03', '2021-03-17 16:34:19', '2021-03-17 16:34:19');
INSERT INTO `client_type` VALUES (24, '测试成功', '2021-03-17 16:16:39', '2021-03-17 16:34:17', '2021-03-17 16:34:17');
INSERT INTO `client_type` VALUES (25, '测试2', '2021-03-17 16:16:51', '2021-03-17 16:34:15', '2021-03-17 16:34:15');
INSERT INTO `client_type` VALUES (26, '测试3', '2021-03-17 16:32:42', '2021-03-17 16:32:51', '2021-03-17 16:32:51');
INSERT INTO `client_type` VALUES (27, '测试4', '2021-03-17 16:34:33', '2021-03-17 16:44:17', '2021-03-17 16:44:17');
INSERT INTO `client_type` VALUES (28, '测试5', '2021-03-17 16:39:06', '2021-03-17 16:44:16', '2021-03-17 16:44:16');
INSERT INTO `client_type` VALUES (29, '测试6', '2021-03-17 16:42:22', '2021-03-17 16:44:14', '2021-03-17 16:44:14');
INSERT INTO `client_type` VALUES (30, '测试7', '2021-03-17 16:44:09', '2021-03-17 16:44:12', '2021-03-17 16:44:12');
INSERT INTO `client_type` VALUES (31, '测试类型4', '2021-03-17 16:44:27', '2021-03-17 16:44:27', NULL);
INSERT INTO `client_type` VALUES (32, '测试', '2021-03-26 18:58:32', '2021-03-26 18:59:24', '2021-03-26 18:59:24');
INSERT INTO `client_type` VALUES (33, '测试', '2021-03-26 18:59:28', '2021-03-29 17:38:41', '2021-03-29 17:38:41');
INSERT INTO `client_type` VALUES (34, '测试2', '2021-03-26 19:01:01', '2021-03-29 17:38:39', '2021-03-29 17:38:39');

-- ----------------------------
-- Table structure for demo
-- ----------------------------
DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  `sex` int(0) NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of demo
-- ----------------------------
INSERT INTO `demo` VALUES (1, '测试1', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (2, '测试2', '18888888888', 1, '2021-05-18 15:18:40', '2021-05-18 15:18:40', NULL);
INSERT INTO `demo` VALUES (3, '测试3', '18888888888', 0, '2021-05-18 15:18:59', '2021-05-18 15:18:59', NULL);
INSERT INTO `demo` VALUES (4, '测试4', '18888888888', 2, '2021-05-18 15:18:59', '2021-05-18 15:18:59', NULL);
INSERT INTO `demo` VALUES (5, '测试5', '18888888888', 1, '2021-05-18 15:18:59', '2021-05-18 15:18:59', NULL);
INSERT INTO `demo` VALUES (6, '测试6', '15555555555', 0, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (7, '测试7', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (8, '测试8', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (9, '测试9', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (10, '测试10', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (11, '测试11', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (12, '测试12', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (13, '测试13', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (14, '测试14', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (15, '测试15', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (16, '测试16', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (17, '测试17', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (18, '测试18', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (19, '测试19', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (20, '测试20', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (21, '测试21', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (22, '测试22', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (23, '测试23', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (24, '测试24', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (25, '测试25', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (26, '测试26', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (27, '测试27', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (28, '测试28', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (29, '测试29', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (30, '测试30', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (31, '测试31', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (32, '测试32', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (33, '测试33', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (34, '测试34', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (35, '测试35', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (36, '测试36', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (37, '测试37', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (38, '测试38', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (39, '测试39', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (40, '测试40', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (41, '测试41', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (42, '测试42', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (43, '测试43', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (44, '测试44', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (45, '测试45', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (46, '测试46', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (47, '测试47', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (48, '测试48', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (49, '测试49', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (50, '测试50', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (51, '测试51', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (52, '测试52', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (53, '测试53', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (54, '测试54', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (55, '测试55', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (56, '测试56', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (57, '测试57', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (58, '测试58', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (59, '测试59', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (60, '测试60', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (61, '测试61', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (62, '测试62', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (63, '测试63', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (64, '测试64', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (65, '测试65', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (66, '测试66', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (67, '测试67', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (68, '测试68', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (69, '测试69', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (70, '测试70', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (71, '测试71', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (72, '测试72', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (73, '测试73', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (74, '测试74', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (75, '测试75', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (76, '测试76', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (77, '测试77', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (78, '测试78', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (79, '测试79', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (80, '测试80', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (81, '测试81', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (82, '测试82', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (83, '测试83', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (84, '测试84', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (85, '测试85', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (86, '测试86', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (87, '测试87', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (88, '测试88', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (89, '测试89', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (90, '测试90', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (91, '测试91', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (92, '测试92', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (93, '测试93', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (94, '测试94', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (95, '测试95', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (96, '测试96', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (97, '测试97', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (98, '测试98', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (99, '测试99', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (100, '测试100', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (101, '测试101', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (102, '测试102', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (103, '测试103', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (104, '测试104', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (105, '测试105', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (106, '测试106', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (107, '测试107', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (108, '测试108', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (109, '测试109', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (110, '测试110', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (111, '测试111', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (112, '测试112', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (113, '测试113', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (114, '测试114', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (115, '测试115', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (116, '测试116', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (117, '测试117', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (118, '测试118', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (119, '测试119', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (120, '测试120', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (121, '测试121', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (122, '测试122', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (123, '测试123', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (124, '测试124', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (125, '测试125', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (126, '测试126', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (127, '测试127', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (128, '测试128', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (129, '测试129', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (130, '测试130', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (131, '测试131', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (132, '测试132', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (133, '测试133', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (134, '测试134', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (135, '测试135', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (136, '测试136', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (137, '测试137', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (138, '测试138', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (139, '测试139', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (140, '测试140', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (141, '测试141', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (142, '测试142', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (143, '测试143', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (144, '测试144', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (145, '测试145', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (146, '测试146', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (147, '测试147', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (148, '测试148', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (149, '测试149', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (150, '测试150', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (151, '测试151', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (152, '测试152', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (153, '测试153', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (154, '测试154', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (155, '测试155', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (156, '测试156', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (157, '测试157', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (158, '测试158', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (159, '测试159', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (160, '测试160', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (161, '测试161', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (162, '测试162', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (163, '测试163', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (164, '测试164', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (165, '测试165', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (166, '测试166', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (167, '测试167', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (168, '测试168', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (169, '测试169', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (170, '测试170', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (171, '测试171', '15555555555', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (172, '测试172', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);
INSERT INTO `demo` VALUES (173, '测试173', '18888888888', 2, '2021-05-18 15:18:10', '2021-05-18 15:18:10', NULL);

-- ----------------------------
-- Table structure for lin_file
-- ----------------------------
DROP TABLE IF EXISTS `lin_file`;
CREATE TABLE `lin_file`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `path` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `type` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'LOCAL' COMMENT 'LOCAL 本地，REMOTE 远程',
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `extension` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `size` int(0) NULL DEFAULT NULL,
  `md5` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'md5值，防止上传重复文件',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `md5_del`(`md5`, `delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lin_file
-- ----------------------------

-- ----------------------------
-- Table structure for lin_group
-- ----------------------------
DROP TABLE IF EXISTS `lin_group`;
CREATE TABLE `lin_group`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分组名称，例如：搬砖者',
  `info` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '分组信息：例如：搬砖的人',
  `level` tinyint(0) NOT NULL DEFAULT 3 COMMENT '分组级别 1：root 2：guest 3：user（root、guest分组只能存在一个)',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name_del`(`name`, `delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lin_group
-- ----------------------------
INSERT INTO `lin_group` VALUES (1, 'root', '超级用户组', 1, '2021-05-18 15:12:49.729', '2021-05-18 15:12:49.729', NULL);
INSERT INTO `lin_group` VALUES (2, 'guest', '游客组', 2, '2021-05-18 15:12:49.729', '2021-05-18 15:12:49.729', NULL);

-- ----------------------------
-- Table structure for lin_group_permission
-- ----------------------------
DROP TABLE IF EXISTS `lin_group_permission`;
CREATE TABLE `lin_group_permission`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `group_id` int(0) UNSIGNED NOT NULL COMMENT '分组id',
  `permission_id` int(0) UNSIGNED NOT NULL COMMENT '权限id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `group_id_permission_id`(`group_id`, `permission_id`) USING BTREE COMMENT '联合索引'
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lin_group_permission
-- ----------------------------

-- ----------------------------
-- Table structure for lin_log
-- ----------------------------
DROP TABLE IF EXISTS `lin_log`;
CREATE TABLE `lin_log`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `message` varchar(450) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` int(0) UNSIGNED NOT NULL,
  `username` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status_code` int(0) NULL DEFAULT NULL,
  `method` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `path` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `permission` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lin_log
-- ----------------------------

-- ----------------------------
-- Table structure for lin_permission
-- ----------------------------
DROP TABLE IF EXISTS `lin_permission`;
CREATE TABLE `lin_permission`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限名称，例如：访问首页',
  `module` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '权限所属模块，例如：人员管理',
  `mount` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0：关闭 1：开启',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lin_permission
-- ----------------------------
INSERT INTO `lin_permission` VALUES (1, '查询所有日志', '日志', 1, '2021-05-18 15:14:12.000', '2021-05-18 15:14:12.000', NULL);
INSERT INTO `lin_permission` VALUES (2, '搜索日志', '日志', 1, '2021-05-18 15:14:12.000', '2021-05-18 15:14:12.000', NULL);
INSERT INTO `lin_permission` VALUES (3, '查询日志记录的用户', '日志', 1, '2021-05-18 15:14:12.000', '2021-05-18 15:14:12.000', NULL);
INSERT INTO `lin_permission` VALUES (4, '测试日志记录', '信息', 1, '2021-05-18 15:14:12.000', '2021-05-18 15:14:12.000', NULL);
INSERT INTO `lin_permission` VALUES (5, '查看lin的信息', '信息', 1, '2021-05-18 15:14:12.000', '2021-05-18 15:14:12.000', NULL);
INSERT INTO `lin_permission` VALUES (6, '删除图书', '图书', 1, '2021-05-18 15:14:12.000', '2021-05-18 15:14:12.000', NULL);
INSERT INTO `lin_permission` VALUES (7, '查询demo列表', 'demo', 1, '2021-05-18 15:14:12.000', '2021-05-18 15:14:12.000', NULL);
INSERT INTO `lin_permission` VALUES (8, '删除数据', 'demo', 1, '2021-05-18 15:14:12.000', '2021-05-18 15:14:12.000', NULL);

-- ----------------------------
-- Table structure for lin_user
-- ----------------------------
DROP TABLE IF EXISTS `lin_user`;
CREATE TABLE `lin_user`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户名，唯一',
  `nickname` varchar(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户昵称',
  `avatar` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像url',
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username_del`(`username`, `delete_time`) USING BTREE,
  UNIQUE INDEX `email_del`(`email`, `delete_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lin_user
-- ----------------------------
INSERT INTO `lin_user` VALUES (1, 'root', 'root', NULL, NULL, '2021-05-18 15:12:49.727', '2021-05-18 15:12:49.727', NULL);

-- ----------------------------
-- Table structure for lin_user_group
-- ----------------------------
DROP TABLE IF EXISTS `lin_user_group`;
CREATE TABLE `lin_user_group`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(0) UNSIGNED NOT NULL COMMENT '用户id',
  `group_id` int(0) UNSIGNED NOT NULL COMMENT '分组id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id_group_id`(`user_id`, `group_id`) USING BTREE COMMENT '联合索引'
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lin_user_group
-- ----------------------------
INSERT INTO `lin_user_group` VALUES (1, 1, 1);

-- ----------------------------
-- Table structure for lin_user_identity
-- ----------------------------
DROP TABLE IF EXISTS `lin_user_identity`;
CREATE TABLE `lin_user_identity`  (
  `id` int(0) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(0) UNSIGNED NOT NULL COMMENT '用户id',
  `identity_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `identifier` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `credential` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `update_time` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `delete_time` datetime(3) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lin_user_identity
-- ----------------------------
INSERT INTO `lin_user_identity` VALUES (1, 1, 'USERNAME_PASSWORD', 'root', 'sha1$c419e500$1$84869e5560ebf3de26b6690386484929456d6c07', '2021-05-18 15:12:49.728', '2021-05-18 15:12:49.728', NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  `unit` int(0) NULL DEFAULT 1,
  `types` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `price` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, 'HS1029', '21支棉单面食毛', 1, '[{\"type_id\":0,\"width\":\"170\",\"weight\":\"160\"}]', '36', '测试数据', '2021-03-29 17:10:51', '2021-03-29 17:10:51', NULL);
INSERT INTO `product` VALUES (2, 'HS1060', '印度纱', 1, '[{\"type_id\":0,\"width\":\"170\",\"weight\":\"160\"}]', '52.5', '测试备注', '2021-03-29 17:15:19', '2021-03-29 17:22:24', NULL);

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  `typeId` int(0) NULL DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `byPhone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `email` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `address` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `fax` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `htje` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `ysh` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT '0.00',
  `yshk` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT '0.00',
  `wshk` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT '0.00',
  `okhk` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT '0.00',
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES (1, '测试客户', 8, '1579652251', '18826127550', '819836692@qq.com', '测试地址', '测试备注', '521-1314', '12000000', '0.00', '0.00', '0.00', '0.00', '2021-03-26 13:49:14', '2021-03-29 17:43:54', NULL);
INSERT INTO `supplier` VALUES (2, '测试删除供应商1', 1, NULL, NULL, NULL, NULL, NULL, NULL, '158900000', '0.00', '0.00', '0.00', '0.00', '2021-03-26 13:50:13', '2021-03-26 13:50:16', '2021-03-26 13:50:16');
INSERT INTO `supplier` VALUES (3, '测试供应商3', 10, '213456778', '4567885432', '123', '测试地址14567890', '测试备注23333', '12334-213123', '100000', '0.00', '0.00', '0.00', '0.00', '2021-03-27 16:05:12', '2021-03-27 16:05:12', NULL);

-- ----------------------------
-- Table structure for supplier_type
-- ----------------------------
DROP TABLE IF EXISTS `supplier_type`;
CREATE TABLE `supplier_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NOT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier_type
-- ----------------------------
INSERT INTO `supplier_type` VALUES (1, '测试供应商类型1', '2021-03-26 13:48:22', '2021-03-26 13:48:22', NULL);
INSERT INTO `supplier_type` VALUES (2, '测试供应商类型2', '2021-03-29 17:56:09', '2021-03-29 17:56:09', NULL);
INSERT INTO `supplier_type` VALUES (3, '测试供应商类型3', '2021-03-29 17:59:10', '2021-03-29 17:59:10', NULL);
INSERT INTO `supplier_type` VALUES (4, '删除类型', '2021-03-29 17:59:16', '2021-03-29 17:59:18', '2021-03-29 17:59:18');

SET FOREIGN_KEY_CHECKS = 1;
