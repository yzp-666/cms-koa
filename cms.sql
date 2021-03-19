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

 Date: 19/03/2021 19:37:26
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `firm_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `linkman` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `link_phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `remark` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
  `user_id` int(0) NULL DEFAULT NULL,
  `create_time` datetime(0) NOT NULL,
  `update_time` datetime(0) NOT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES (1, '浙江我才网络科技有限公司', '浙江省,杭州市,西湖区 浙江杭州西湖区西城博思2幢东单元209室', '杨先生1', '15797652251', '测试地址', 1, '2021-03-19 10:30:11', '2021-03-19 19:27:19', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES (1, '1234', '123', '3', '3', '2021-03-15 23:57:45.000', '2021-03-15 23:57:55.000', NULL);

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
  `addressIDs` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_croatian_ci NULL DEFAULT NULL,
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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_croatian_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client
-- ----------------------------
INSERT INTO `client` VALUES (1, '测试客户', 8, '1579652251', '18826127550', '819836692@qq.com', NULL, NULL, '测试备注', '521-1314', '120', '0.00', '0.00', '0.00', '0.00', '2021-03-18 14:28:14', '2021-03-18 14:29:59', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lin_group
-- ----------------------------
INSERT INTO `lin_group` VALUES (1, 'root', '超级用户组', 1, '2021-03-13 00:04:02.804', '2021-03-13 00:04:02.804', NULL);
INSERT INTO `lin_group` VALUES (2, 'guest', '游客组', 2, '2021-03-13 00:04:02.805', '2021-03-13 00:04:02.805', NULL);
INSERT INTO `lin_group` VALUES (3, 'admin', '管理员', 3, '2021-03-18 16:04:12.000', '2021-03-18 16:04:12.000', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lin_group_permission
-- ----------------------------
INSERT INTO `lin_group_permission` VALUES (1, 3, 1);
INSERT INTO `lin_group_permission` VALUES (2, 3, 2);
INSERT INTO `lin_group_permission` VALUES (3, 3, 3);
INSERT INTO `lin_group_permission` VALUES (4, 3, 4);
INSERT INTO `lin_group_permission` VALUES (5, 3, 5);
INSERT INTO `lin_group_permission` VALUES (6, 3, 6);
INSERT INTO `lin_group_permission` VALUES (7, 3, 7);
INSERT INTO `lin_group_permission` VALUES (8, 3, 8);
INSERT INTO `lin_group_permission` VALUES (10, 3, 9);
INSERT INTO `lin_group_permission` VALUES (9, 3, 10);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lin_log
-- ----------------------------
INSERT INTO `lin_log` VALUES (1, '管理员新建了一个用户', 1, 'root', 201, 'POST', '/cms/user/register', '', '2021-03-18 16:04:52.000', '2021-03-18 16:04:52.000', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lin_permission
-- ----------------------------
INSERT INTO `lin_permission` VALUES (1, '查询所有日志', '日志', 1, '2021-03-13 00:04:11.000', '2021-03-13 00:04:11.000', NULL);
INSERT INTO `lin_permission` VALUES (2, '搜索日志', '日志', 1, '2021-03-13 00:04:11.000', '2021-03-13 00:04:11.000', NULL);
INSERT INTO `lin_permission` VALUES (3, '查询日志记录的用户', '日志', 1, '2021-03-13 00:04:11.000', '2021-03-13 00:04:11.000', NULL);
INSERT INTO `lin_permission` VALUES (4, '测试日志记录', '信息', 1, '2021-03-13 00:04:11.000', '2021-03-13 00:04:11.000', NULL);
INSERT INTO `lin_permission` VALUES (5, '查看lin的信息', '信息', 1, '2021-03-13 00:04:11.000', '2021-03-13 00:04:11.000', NULL);
INSERT INTO `lin_permission` VALUES (6, '删除图书', '图书', 1, '2021-03-13 00:04:11.000', '2021-03-13 00:04:11.000', NULL);
INSERT INTO `lin_permission` VALUES (7, '查询所有客户', '客户', 1, '2021-03-13 00:04:11.000', '2021-03-13 00:04:11.000', NULL);
INSERT INTO `lin_permission` VALUES (8, '删除客户', '客户', 1, '2021-03-13 00:04:11.000', '2021-03-13 00:04:11.000', NULL);
INSERT INTO `lin_permission` VALUES (9, '删除类客户型', '客户类型', 1, '2021-03-14 01:10:09.000', '2021-03-14 01:10:09.000', NULL);
INSERT INTO `lin_permission` VALUES (10, '编辑客户', '客户', 1, '2021-03-15 23:53:42.000', '2021-03-15 23:53:42.000', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lin_user
-- ----------------------------
INSERT INTO `lin_user` VALUES (1, 'root', 'root', NULL, NULL, '2021-03-13 00:04:02.802', '2021-03-13 00:04:02.802', NULL);
INSERT INTO `lin_user` VALUES (2, 'admin', NULL, NULL, NULL, '2021-03-18 16:04:52.000', '2021-03-18 16:04:52.000', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lin_user_group
-- ----------------------------
INSERT INTO `lin_user_group` VALUES (1, 1, 1);
INSERT INTO `lin_user_group` VALUES (2, 2, 3);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lin_user_identity
-- ----------------------------
INSERT INTO `lin_user_identity` VALUES (1, 1, 'USERNAME_PASSWORD', 'root', 'sha1$c419e500$1$84869e5560ebf3de26b6690386484929456d6c07', '2021-03-13 00:04:02.803', '2021-03-13 00:04:02.803', NULL);
INSERT INTO `lin_user_identity` VALUES (2, 2, 'USERNAME_PASSWORD', 'admin', 'sha1$a7880269$1$b300e2122d1d4317056c83a8653324152cdaf978', '2021-03-18 16:04:52.000', '2021-03-18 16:04:52.000', NULL);

SET FOREIGN_KEY_CHECKS = 1;
