/*
 Navicat Premium Data Transfer

 Source Server         : 本地数据库
 Source Server Type    : MySQL
 Source Server Version : 80027
 Source Host           : localhost:3306
 Source Schema         : tourism_products

 Target Server Type    : MySQL
 Target Server Version : 80027
 File Encoding         : 65001

 Date: 15/05/2022 23:05:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `orderNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderTime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `peopleCount` int NULL DEFAULT NULL,
  `orderDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `payType` int NULL DEFAULT NULL,
  `orderStatus` int NULL DEFAULT NULL,
  `productId` int NULL DEFAULT NULL,
  `memberId` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (3, '7f8cee60-62b6-45c6-9ab1-8f21aaad08ff', '2022-05-15 20:42:24', 3, '请尽快出发,我们已经迫不及待了', 0, 1, 1, 3);
INSERT INTO `orders` VALUES (4, '5f3fdafe-b46e-4dc7-895a-2dd7130dd0de', '2022-05-15 21:32:12', 5, '好期待呀', 0, 0, 4, 14);
INSERT INTO `orders` VALUES (5, '4c03d2d3-f3f0-47e0-a74a-96fc99683d61', '2022-05-15 21:36:42', 2, '我们是去武功山看日出的', 0, 0, 4, 14);
INSERT INTO `orders` VALUES (6, 'faf60601-2cf6-44a6-88e3-ed934f034f79', '2022-05-15 21:38:05', 8, '早就想去张家界玩了,一直没时间去,这次终于有时间啦', 1, 1, 1, 14);
INSERT INTO `orders` VALUES (7, 'b65d4374-1ac8-4d3a-8d70-a7988a6d0c79', '2022-05-15 22:48:50', 10, '我们是旅行团', 0, 1, 4, 7);
INSERT INTO `orders` VALUES (8, 'fe72dac0-d19d-4533-9b0d-fc13199d41bd', '2022-05-15 22:51:45', 4, '好想去长沙玩呀', 1, 0, 1, 7);
INSERT INTO `orders` VALUES (9, 'e0defa41-bc14-4c7d-8be2-4866382b3580', '2022-05-15 22:54:35', 2, '请快点出发', 0, 1, 1, 7);

-- ----------------------------
-- Table structure for passenger
-- ----------------------------
DROP TABLE IF EXISTS `passenger`;
CREATE TABLE `passenger`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phoneNum` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `credentialsType` int NULL DEFAULT NULL,
  `credentialsNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `travellerType` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of passenger
-- ----------------------------
INSERT INTO `passenger` VALUES (1, '张三', '男', '18611112222', 0, '16524096311652409631', 0);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `productNum` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cityName` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `departtureTime` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productPrice` decimal(7, 2) NULL DEFAULT NULL,
  `productDesc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `productStatus` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '857dcd5b-d0f3-41dc-8f08-7e4d7b1ba640', '张家界七日游', '长沙', '2022-06-12', 288.00, '第一天我们先去五一街,第二天我们去张家界的玻璃栈道,第三天再去橘子洲头打卡', 1);
INSERT INTO `product` VALUES (4, '857dcd5b-d0f3-41dc-8f08-7e4d7b1ba644', '武功山三日游', '萍乡', '2022-05-15', 299.00, '我们先徒步爬上武功山,然后我们可以入住温泉酒店泡温泉,然后第二天我们去滑草场', 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '无意义',
  `username` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `password` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `identity` int NULL DEFAULT NULL COMMENT '身份标识[0-普通用户,1-管理员用户]',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `用户名唯一`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'admin', 1);
INSERT INTO `user` VALUES (3, 'user', '12345', 0);
INSERT INTO `user` VALUES (4, 'zhangsan', '54321', 1);
INSERT INTO `user` VALUES (7, 'zhaoliu', '12345', 0);
INSERT INTO `user` VALUES (10, 'beibei', '12345', 0);
INSERT INTO `user` VALUES (11, 'jingjing', '12345', 0);
INSERT INTO `user` VALUES (12, 'huanhuan', '12345', 1);
INSERT INTO `user` VALUES (13, 'yingying', '12345', 0);
INSERT INTO `user` VALUES (14, 'nini', '12345', 0);

SET FOREIGN_KEY_CHECKS = 1;
