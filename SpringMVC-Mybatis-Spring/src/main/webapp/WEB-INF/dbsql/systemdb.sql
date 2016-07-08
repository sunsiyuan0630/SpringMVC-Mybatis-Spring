/*
 Navicat MySQL Data Transfer

 Source Server         : local
 Source Server Version : 50627
 Source Host           : localhost
 Source Database       : systemdb

 Target Server Version : 50627
 File Encoding         : utf-8

 Date: 02/10/2016 21:14:57 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `tb_customer`
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE `tb_customer` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `customerName` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '客户姓名',
  `customerPhone` varchar(20) DEFAULT NULL COMMENT '客户电话',
  `companyName` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '客户所属公司',
  `customerZone` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '客户所属地区',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `tb_goodrest`
-- ----------------------------
DROP TABLE IF EXISTS `tb_goodrest`;
CREATE TABLE `tb_goodrest` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `goodId` int(30) NOT NULL COMMENT '商品表id',
  `goodNumber` int(11) NOT NULL COMMENT '库存数量',
  `goodSpeci` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '概述',
  `lastUpdateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `lastUpdatePeople` int(10) NOT NULL COMMENT '最后更新人员id',
  PRIMARY KEY (`id`),
  KEY `id` (`goodId`),
  KEY `lastUpdatePeople` (`lastUpdatePeople`),
  CONSTRAINT `id` FOREIGN KEY (`goodId`) REFERENCES `tb_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tb_goodrest`
-- ----------------------------
BEGIN;
INSERT INTO `tb_goodrest` VALUES ('1', '111', '233', null, '2016-01-16 14:38:37', '0'), ('2', '112', '100', null, '2016-01-06 12:15:43', '0'), ('3', '113', '102', null, '2016-01-06 12:15:43', '0'), ('4', '114', '103', null, '2016-01-06 12:15:43', '0'), ('5', '115', '103', null, '2016-01-14 14:13:10', '0'), ('6', '116', '105', null, '2016-01-06 12:15:43', '0'), ('7', '117', '101', null, '2016-01-14 14:15:19', '0'), ('8', '118', '107', null, '2016-01-06 12:15:43', '0'), ('9', '119', '108', null, '2016-01-06 12:15:43', '0'), ('10', '120', '109', null, '2016-01-06 12:15:43', '0'), ('11', '121', '110', null, '2016-01-06 12:15:43', '0'), ('12', '122', '111', null, '2016-01-06 12:15:43', '0'), ('13', '123', '112', null, '2016-01-06 12:15:43', '0'), ('14', '136', '24', null, '2016-01-06 12:15:43', '0'), ('15', '137', '12', null, '2016-01-06 12:15:43', '0'), ('16', '138', '12', null, '2016-01-06 12:15:43', '0'), ('17', '139', '24', 'test15', '2016-01-06 12:15:43', '0'), ('18', '140', '12', 'test15', '2016-01-06 12:15:43', '0'), ('19', '141', '24', 'test15', '2016-01-06 12:15:43', '0'), ('20', '142', '369', '22', '2016-01-06 12:15:43', '0'), ('21', '143', '11', '11', '2016-01-06 12:15:43', '0');
COMMIT;

-- ----------------------------
--  Table structure for `tb_goods`
-- ----------------------------
DROP TABLE IF EXISTS `tb_goods`;
CREATE TABLE `tb_goods` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `goodName` varchar(50) CHARACTER SET gbk NOT NULL COMMENT '商品名称',
  `goodId` varchar(50) NOT NULL COMMENT '商品编号',
  `goodSpeci` varchar(50) CHARACTER SET gbk NOT NULL COMMENT '商品规格',
  `goodSupplier` int(10) DEFAULT NULL COMMENT '商品供应商',
  `people` int(10) DEFAULT NULL COMMENT '信息最后更新人',
  `date` timestamp NULL DEFAULT NULL COMMENT '信息最后更新时间',
  PRIMARY KEY (`id`),
  KEY `goodSupplier` (`goodSupplier`),
  KEY `goodSupplier_2` (`goodSupplier`),
  KEY `people` (`people`),
  CONSTRAINT `people` FOREIGN KEY (`people`) REFERENCES `tb_users` (`id`),
  CONSTRAINT `supplier` FOREIGN KEY (`goodSupplier`) REFERENCES `tb_supplierinfo` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=151 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tb_goods`
-- ----------------------------
BEGIN;
INSERT INTO `tb_goods` VALUES ('111', 'huangfeng', '47324587', 'hxf', '7', null, null), ('112', 'hf', '47324588', 'hxf', '7', null, null), ('113', 'hf1', '47324589', 'hxf', '7', null, null), ('114', 'hf2', '47324590', 'hxf', '7', null, null), ('115', 'hf3', '47324591', 'hxf', '7', null, null), ('116', 'hf4', '47324592', 'hxf', '7', null, null), ('117', 'hf5', '47324593', 'hxf', '7', null, null), ('118', 'hf5', '47324594', 'hxf', '7', null, null), ('119', 'hf', '47324595', 'hxf', '7', null, null), ('120', 'hf', '47324596', 'hxf', '7', null, null), ('121', 'hf', '47324597', 'hxf', '7', null, null), ('122', 'hf', '47324598', 'hxf', '7', null, null), ('123', 'hf', '47324599', 'hxf', '7', null, null), ('124', 'hf', '47324600', 'hxf', '7', null, null), ('135', 'test', 'test', 'test', '7', null, null), ('136', 'test11', 'test', 'test', '7', null, null), ('137', 'test13', 'test13', 'test', '7', null, null), ('138', 'test14', 'test14', 'test', '7', null, null), ('139', 'test15', 'test15', 'test15', '7', null, null), ('140', 'test16', 'test15', 'test15', '7', null, null), ('141', 'test17', 'test15', 'test15', '7', null, null), ('142', 'ts12', 'ts12', '22', '7', null, null), ('143', '222', '221', '11', '7', null, null);
COMMIT;

-- ----------------------------
--  Table structure for `tb_instorage`
-- ----------------------------
DROP TABLE IF EXISTS `tb_instorage`;
CREATE TABLE `tb_instorage` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `goodId` int(30) NOT NULL COMMENT '对应th_goods表的主键',
  `number` int(30) NOT NULL COMMENT '商品数量',
  `price` decimal(10,2) NOT NULL COMMENT '商品单价',
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '入库日期',
  `people` int(10) DEFAULT NULL COMMENT '经手人',
  `maintain_people` int(10) DEFAULT NULL COMMENT '处理该信息的人',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tb_instorage`
-- ----------------------------
BEGIN;
INSERT INTO `tb_instorage` VALUES ('6', '135', '12', '12.00', '2015-10-20 00:00:00', '0', null), ('7', '136', '12', '12.00', '2015-10-20 00:00:00', '0', null), ('8', '136', '12', '12.00', '2015-10-20 00:00:00', '0', null), ('9', '137', '12', '12.00', '2015-10-20 00:00:00', '0', null), ('10', '138', '12', '12.00', '2015-10-20 00:00:00', '0', null), ('11', '139', '12', '12.00', '2015-10-09 00:00:00', '0', null), ('12', '139', '12', '12.00', '2015-10-09 00:00:00', '0', null), ('13', '140', '12', '12.00', '2015-10-09 00:00:00', '0', null), ('14', '141', '12', '12.00', '2015-10-09 00:00:00', '0', null), ('15', '141', '12', '12.00', '2015-10-09 00:00:00', '0', null), ('16', '142', '123', '12.00', '2015-10-08 00:00:00', '333', null), ('17', '142', '123', '12.00', '2015-10-08 00:00:00', '333', null), ('18', '142', '123', '12.00', '2015-10-08 00:00:00', '333', null), ('19', '143', '11', '331.00', '2015-10-08 00:00:00', '11', null), ('20', '111', '5', '3.00', '2016-02-10 21:01:03', '0', '0'), ('21', '114', '2', '7.00', '2016-02-10 21:04:04', '0', '0'), ('22', '117', '41', '3.82', '2016-02-10 21:06:52', '0', '0');
COMMIT;

-- ----------------------------
--  Table structure for `tb_outstorage`
-- ----------------------------
DROP TABLE IF EXISTS `tb_outstorage`;
CREATE TABLE `tb_outstorage` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `goodId` int(30) NOT NULL COMMENT '对应th_goods表的主键',
  `number` int(30) NOT NULL COMMENT '商品数量',
  `sellPrice` decimal(10,2) NOT NULL COMMENT '商品售价',
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '出库日期',
  `people` int(10) DEFAULT NULL COMMENT '经手人',
  `description` varchar(200) CHARACTER SET gbk DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `goodId` (`goodId`),
  CONSTRAINT `goodIdFK` FOREIGN KEY (`goodId`) REFERENCES `tb_goods` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tb_outstorage`
-- ----------------------------
BEGIN;
INSERT INTO `tb_outstorage` VALUES ('1', '111', '2', '1.00', '2016-01-14 13:01:55', null, null), ('2', '111', '2', '1.00', '2016-01-14 12:49:11', '0', null), ('3', '111', '2', '1.00', '2016-01-14 13:09:26', null, 'aaa'), ('4', '111', '1', '1.00', '2016-01-14 13:10:35', '0', 'test4'), ('5', '111', '1', '1.00', '2016-01-14 13:10:35', '0', 'test4'), ('6', '111', '1', '2.00', '2016-01-14 13:12:30', '0', 'test5'), ('7', '111', '1', '2.00', '2016-01-14 13:13:53', '0', 'test6'), ('8', '111', '2', '1.20', '2016-01-14 13:18:30', null, 'aaa'), ('9', '111', '4', '2.90', '2016-01-14 13:18:55', '0', 'test7'), ('10', '115', '1', '3.47', '2016-01-14 14:12:55', '0', '??'), ('11', '117', '5', '9.89', '2016-01-14 14:15:05', '0', '??\n'), ('12', '111', '1', '3.40', '2016-01-16 14:38:20', '0', 'test');
COMMIT;

-- ----------------------------
--  Table structure for `tb_supplierinfo`
-- ----------------------------
DROP TABLE IF EXISTS `tb_supplierinfo`;
CREATE TABLE `tb_supplierinfo` (
  `id` int(30) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET gbk NOT NULL COMMENT '供应商名称',
  `address` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '供应商地址',
  `phone` varchar(50) DEFAULT NULL COMMENT '供应商电话',
  `people` int(11) DEFAULT NULL COMMENT '信息最后维护人',
  `date` timestamp NULL DEFAULT NULL COMMENT '信息维护时间',
  PRIMARY KEY (`id`),
  KEY `people` (`people`),
  CONSTRAINT `lastUpdatePeople` FOREIGN KEY (`people`) REFERENCES `tb_users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tb_supplierinfo`
-- ----------------------------
BEGIN;
INSERT INTO `tb_supplierinfo` VALUES ('6', '黄', '', '', '0', '2016-01-14 16:58:17'), ('7', '黄二凤', '安徽省合肥市望江西路中科大先进技术研究院', '15000020478', '0', '2016-01-16 12:41:24');
COMMIT;

-- ----------------------------
--  Table structure for `tb_users`
-- ----------------------------
DROP TABLE IF EXISTS `tb_users`;
CREATE TABLE `tb_users` (
  `id` int(10) NOT NULL COMMENT '索引id',
  `name` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT '姓名',
  `sex` varchar(5) CHARACTER SET gbk DEFAULT NULL COMMENT '性别',
  `phone` varchar(15) NOT NULL COMMENT '电话',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
--  Records of `tb_users`
-- ----------------------------
BEGIN;
INSERT INTO `tb_users` VALUES ('0', '黄凤', '女', '15000020478'), ('1', '无名氏', '未知', '00000000000');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
