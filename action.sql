/*
Navicat MySQL Data Transfer

Source Server         : bj-cdb-b6zbk8mv.sql.tencentcdb.com_63759
Source Server Version : 50628
Source Host           : bj-cdb-b6zbk8mv.sql.tencentcdb.com:63759
Source Database       : action

Target Server Type    : MYSQL
Target Server Version : 50628
File Encoding         : 65001

Date: 2018-06-04 15:58:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `bas_bom`
-- ----------------------------
DROP TABLE IF EXISTS `bas_bom`;
CREATE TABLE `bas_bom` (
  `id` varchar(64) NOT NULL,
  `bomName` varchar(64) NOT NULL DEFAULT '' COMMENT 'bom名称',
  `bomVersion` varchar(64) NOT NULL DEFAULT '' COMMENT 'bom版本',
  `product_id` varchar(64) NOT NULL DEFAULT '' COMMENT '产品编号',
  `status` varchar(20) NOT NULL DEFAULT '' COMMENT '状态',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新着',
  `update_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='物料清单';

-- ----------------------------
-- Records of bas_bom
-- ----------------------------
INSERT INTO `bas_bom` VALUES ('4f5d2cc6cd2c41b8bd031acb9aa937d7', '鱿鱼BOM', 'V1.0', '1', '已核审', '1', '2018-05-18 18:39:05', '1', '2018-05-26 17:17:27', null, '0');
INSERT INTO `bas_bom` VALUES ('5e57ceab41f84578824e36e36ae39516', '金枪鱼BOM', 'V2.0', '2', '已核审', '1', '2018-05-18 18:39:27', '1', '2018-05-26 17:17:16', null, '0');
INSERT INTO `bas_bom` VALUES ('74c56abab9844bfba43ba65dffd11944', '马哈鱼BOM', 'V1.0', 'f1754ab55f5847a6963d306b10409db3', '已核审', '1', '2018-05-26 17:35:01', '1', '2018-05-26 17:35:01', null, '0');

-- ----------------------------
-- Table structure for `bas_bom_component`
-- ----------------------------
DROP TABLE IF EXISTS `bas_bom_component`;
CREATE TABLE `bas_bom_component` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL,
  `bom_id` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '物料ID',
  `mname` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '组件名称',
  `mnum` int(11) NOT NULL DEFAULT '0' COMMENT '组件数量',
  `proCode` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '工序编号',
  `proName` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '工序名称',
  `whours` int(11) NOT NULL DEFAULT '0' COMMENT '工时',
  `create_by` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '创建者',
  `create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '更新着',
  `update_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='物料清单组件';

-- ----------------------------
-- Records of bas_bom_component
-- ----------------------------
INSERT INTO `bas_bom_component` VALUES ('61a643fd48204e4aaeddd3c19cc44b6e', '5e57ceab41f84578824e36e36ae39516', '新鲜金枪鱼', '10000', '013', '去头工序', '5', '1', '2018-05-26 17:56:50', '1', '2018-05-26 18:06:07', null, '0');
INSERT INTO `bas_bom_component` VALUES ('94cc05802423423984c1867310bb8c0a', '5e57ceab41f84578824e36e36ae39516', '托盘', '1000', '012', '切片工序', '1', '1', '2018-05-26 15:45:54', '1', '2018-05-26 17:57:03', null, '0');
INSERT INTO `bas_bom_component` VALUES ('b8aae76a97c54957a44828b6f5f870aa', '74c56abab9844bfba43ba65dffd11944', '新鲜马哈鱼', '8000', '015', '挑刺工序', '10', '1', '2018-05-26 18:05:46', '1', '2018-05-26 18:05:56', null, '0');
INSERT INTO `bas_bom_component` VALUES ('d731515512e04a17816598989e977aca', '4f5d2cc6cd2c41b8bd031acb9aa937d7', '新鲜鱿鱼', '2000', '014', '烘烤', '12', '1', '2018-05-26 17:58:32', '1', '2018-05-26 18:06:01', null, '0');
INSERT INTO `bas_bom_component` VALUES ('f8505e8423574700ba3e32cd1d3be79f', '4f5d2cc6cd2c41b8bd031acb9aa937d7', '温度计', '5', '011', '烘烤工序', '22', '1', '2018-05-26 15:44:48', '1', '2018-05-26 17:57:09', null, '0');

-- ----------------------------
-- Table structure for `bas_cardreader`
-- ----------------------------
DROP TABLE IF EXISTS `bas_cardreader`;
CREATE TABLE `bas_cardreader` (
  `qrCode` varchar(20) NOT NULL DEFAULT '' COMMENT '设备条码',
  `type` varchar(64) DEFAULT NULL COMMENT '设备类型id，外键，参照EquipmentType表',
  `spec` varchar(64) DEFAULT NULL COMMENT '设备规格id，外键，参照EquipmentSpec表',
  `supplier` varchar(20) DEFAULT NULL COMMENT '供应商',
  `manufacturer` varchar(20) DEFAULT NULL COMMENT '生产厂商',
  `factoryNumber` varchar(20) DEFAULT NULL COMMENT '出厂编号',
  `purpose` varchar(20) DEFAULT NULL COMMENT '用途',
  `buyDate` date DEFAULT NULL COMMENT '购置时间',
  `person` varchar(20) DEFAULT NULL COMMENT '资产负责人',
  `organization` varchar(20) DEFAULT NULL COMMENT '所有权部门',
  `ip` varchar(32) DEFAULT NULL COMMENT 'ip',
  `comBaudrate` varchar(20) DEFAULT NULL COMMENT 'com波特率',
  `comDataseat` varchar(20) DEFAULT NULL COMMENT 'com数据位',
  `comBegin` varchar(20) DEFAULT NULL COMMENT 'com起始位',
  `comEnd` varchar(20) DEFAULT NULL COMMENT 'com终止位',
  `checkMode` varchar(20) DEFAULT NULL COMMENT '校验方式',
  `sysParam` varchar(20) DEFAULT NULL COMMENT '系统简单属性',
  `readerSpeed` varchar(20) DEFAULT NULL COMMENT '读卡速度',
  `timeInterval` varchar(20) DEFAULT NULL COMMENT '打卡间隔',
  `distance` varchar(20) DEFAULT NULL COMMENT '感应距离',
  `readerType` varchar(20) DEFAULT NULL COMMENT '读卡类型',
  `frequency` varchar(20) DEFAULT NULL COMMENT '读卡频率',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  `id` varchar(64) NOT NULL COMMENT '编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `CardReader_ibfk_1` (`type`),
  KEY `CardReader_ibfk_2` (`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bas_cardreader
-- ----------------------------
INSERT INTO `bas_cardreader` VALUES ('00002', '0002', '0002', '张帅', '黎明', 'P13-22', '读取ID卡', '2015-08-08', '张聪', '5', '202.194.44.15', '72', '63', '47', '36', '6', '没有', '100', '0.2', '10cm', '扫描读卡', '100HZ', '', '0000-00-00 00:00:00', '1', '2018-05-26 16:24:05', null, '0', '0');
INSERT INTO `bas_cardreader` VALUES ('00001', '0002', '0003', '李航', '大众', 'P12-32', '读卡记录', '2018-05-02', '李刚', '6', '123.123.123.123', '72', '02', '11', '36', '05', '无', '100', '0.1', '10cm', '扫描读卡', '100HZ', '1', '2018-05-11 17:01:49', '1', '2018-05-26 16:24:17', null, '0', '1f4a8e4bf43842d5859dd407679daf61');

-- ----------------------------
-- Table structure for `bas_codeprinter`
-- ----------------------------
DROP TABLE IF EXISTS `bas_codeprinter`;
CREATE TABLE `bas_codeprinter` (
  `qrCode` varchar(20) NOT NULL DEFAULT '' COMMENT '设备条码',
  `type` varchar(64) DEFAULT NULL COMMENT '设备类型，外键，对应EquipmentType表',
  `spec` varchar(64) DEFAULT NULL COMMENT '设备规格，外键，对应EquipmentSpec表',
  `supplier` varchar(20) DEFAULT NULL COMMENT '供应商',
  `manufacturer` varchar(20) DEFAULT NULL COMMENT '生产厂商',
  `factoryNumber` varchar(20) DEFAULT NULL COMMENT '出厂编号',
  `purpose` varchar(20) DEFAULT NULL COMMENT '用途',
  `buyDate` date DEFAULT NULL COMMENT '购置时间',
  `person` varchar(20) DEFAULT NULL COMMENT '资产负责人',
  `organization` varchar(20) DEFAULT NULL COMMENT '所有权部门',
  `ip` varchar(32) DEFAULT NULL COMMENT 'ip',
  `comBaudrate` varchar(20) DEFAULT NULL COMMENT 'com波特率',
  `comDataseat` varchar(20) DEFAULT NULL COMMENT 'com数据位',
  `comBegin` varchar(20) DEFAULT NULL COMMENT 'com起始位',
  `comEnd` varchar(20) DEFAULT NULL COMMENT 'com终止位',
  `checkMode` varchar(20) DEFAULT NULL COMMENT '校验方式',
  `sysParam` varchar(20) DEFAULT NULL COMMENT '系统简单属性',
  `cPNumber` varchar(20) DEFAULT NULL COMMENT '型号',
  `mode` varchar(20) DEFAULT NULL COMMENT '打印模式',
  `resolution` varchar(20) DEFAULT NULL COMMENT '分辨率',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  `id` varchar(64) NOT NULL COMMENT '编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `CodePrinter_ibfk_1` (`type`),
  KEY `CodePrinter_ibfk_2` (`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bas_codeprinter
-- ----------------------------
INSERT INTO `bas_codeprinter` VALUES ('0001', '0003', '0003', '王凯', '万驰企业', 'X12-62', '称重', '2018-05-07', '江山', '4', null, null, null, null, null, null, null, '11', '双面打印', '1190*1120', '1', '2018-05-26 14:09:35', '1', '2018-05-26 16:21:20', null, '0', '0f4f2fa3ea864d9fa8441e1c68c2b889');
INSERT INTO `bas_codeprinter` VALUES ('0002', '0003', '0003', '李航', '大众', 'X12-32', '读卡记录', '2015-08-08', '李刚', '6', '202.194.44.15', '72', '63', '47', '36', '11', '没有', '22', '激光扫描', '1920*1080', '1', '2018-05-11 11:55:44', '1', '2018-05-31 17:30:01', '0001', '0', 'd739ccee4f864762bdb2ad4e2bae521c');

-- ----------------------------
-- Table structure for `bas_combination`
-- ----------------------------
DROP TABLE IF EXISTS `bas_combination`;
CREATE TABLE `bas_combination` (
  `id` varchar(64) NOT NULL,
  `combinationName` varchar(64) NOT NULL DEFAULT '' COMMENT '设备组名称',
  `combinationSort` varchar(20) NOT NULL DEFAULT '' COMMENT '设备组序号',
  `fun` varchar(255) DEFAULT '' COMMENT '功能',
  `station_id` varchar(64) NOT NULL DEFAULT '' COMMENT '所属工站',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新着',
  `update_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='设备组';

-- ----------------------------
-- Records of bas_combination
-- ----------------------------
INSERT INTO `bas_combination` VALUES ('2b089b1fb05f4baab13239d5569f0533', '读卡器电子秤', 'Z01', '称重', '63688c609f824834bf0abca0171bc8a7', '1', '2018-05-26 15:15:33', '1', '2018-05-26 16:44:09', null, '0');
INSERT INTO `bas_combination` VALUES ('76ccaac23c8b4a3a953b68ac37d4bd74', '红外对射计数器与ID卡', 'Z02', '读取员工信息', '63688c609f824834bf0abca0171bc8a7', '1', '2018-05-26 15:16:33', '1', '2018-05-26 16:44:00', null, '0');
INSERT INTO `bas_combination` VALUES ('c25dac7cdd3e417bbc54387b7c0c066c', '红外对射计数器与ID卡', 'Z03', '扫码计数', '8021d772bf09424f9dc51674ab419431', '1', '2018-05-26 17:33:16', '1', '2018-05-26 17:33:27', null, '0');

-- ----------------------------
-- Table structure for `bas_combination_equip`
-- ----------------------------
DROP TABLE IF EXISTS `bas_combination_equip`;
CREATE TABLE `bas_combination_equip` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL,
  `combinationID` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '设备组编号',
  `equipName` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '设备名称',
  `equipID` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '设备编号',
  `equip_type` varchar(20) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '设备类型',
  `create_by` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '创建者',
  `create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '更新着',
  `update_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(255) CHARACTER SET utf8 DEFAULT '' COMMENT '备注信息',
  `del_flag` char(1) CHARACTER SET utf8 NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='设备组设备成员';

-- ----------------------------
-- Records of bas_combination_equip
-- ----------------------------

-- ----------------------------
-- Table structure for `bas_electronsteelyard`
-- ----------------------------
DROP TABLE IF EXISTS `bas_electronsteelyard`;
CREATE TABLE `bas_electronsteelyard` (
  `qrCode` varchar(20) NOT NULL DEFAULT '' COMMENT '设备条码',
  `type` varchar(64) DEFAULT NULL COMMENT '设备类型id，外键，参照EquipmentType表',
  `spec` varchar(64) DEFAULT NULL COMMENT '设备规格id，外键，参照EquipmentSpec表',
  `supplier` varchar(20) DEFAULT NULL COMMENT '供应商',
  `manufacturer` varchar(20) DEFAULT NULL COMMENT '生产厂商',
  `factoryNumber` varchar(20) DEFAULT NULL COMMENT '出厂编号',
  `purpose` varchar(20) DEFAULT NULL COMMENT '用途',
  `buyDate` date DEFAULT NULL COMMENT '采购时间',
  `person` varchar(20) DEFAULT NULL COMMENT '资产负责人',
  `organization` varchar(20) DEFAULT NULL COMMENT '所有权部门',
  `ip` varchar(32) DEFAULT NULL COMMENT 'ip',
  `comBaudrate` varchar(20) DEFAULT NULL COMMENT 'com波特率',
  `comDataseat` varchar(20) DEFAULT NULL COMMENT 'com数据位',
  `comBegin` varchar(20) DEFAULT NULL COMMENT 'com起始位',
  `comEnd` varchar(20) DEFAULT NULL COMMENT 'com终止位',
  `checkMode` varchar(20) DEFAULT NULL COMMENT '校验方式',
  `sysParam` varchar(20) DEFAULT NULL COMMENT '系统简单属性',
  `eSName` varchar(20) DEFAULT NULL COMMENT '名称',
  `eSRange` varchar(20) DEFAULT NULL COMMENT '称量范围',
  `eSWeight` varchar(20) DEFAULT NULL COMMENT '重量',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  `id` varchar(64) NOT NULL COMMENT '编号',
  PRIMARY KEY (`qrCode`,`id`) USING BTREE,
  KEY `ElectronSteelyard_ibfk_1` (`type`),
  KEY `ElectronSteelyard_ibfk_2` (`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bas_electronsteelyard
-- ----------------------------
INSERT INTO `bas_electronsteelyard` VALUES ('001', '0001', '0002', '李航', '大众', 'X32-10', '称重', '2018-05-02', '李刚', '3', '123.123.123.123', '72', '02', '11', '36', '11', '没有', '电子秤', '1000Kg', '20Kg', '1', '2018-05-11 10:38:40', '1', '2018-05-31 18:04:35', '0001', '0', '27a2fbbb4f584c27b641adf934ea5405');
INSERT INTO `bas_electronsteelyard` VALUES ('002', '0001', '0002', '利华电子', '长宏电子', 'X32-36', '称重', '2018-05-15', '王开', '5', null, null, null, null, null, null, null, '嘉华', '100kg', '20kg', '509e20b7d0f9447bbb6098c592b7cb28', '2018-05-26 11:57:41', '1', '2018-05-26 16:20:07', '', '0', 'dfd1602cbf30494e970944f7d83e4e60');

-- ----------------------------
-- Table structure for `bas_enterprise`
-- ----------------------------
DROP TABLE IF EXISTS `bas_enterprise`;
CREATE TABLE `bas_enterprise` (
  `id` varchar(64) NOT NULL COMMENT '企业id',
  `enterName` varchar(10) DEFAULT NULL COMMENT '单位名称',
  `enterCode` varchar(20) DEFAULT NULL COMMENT '组织机构代码',
  `enterLevel` varchar(20) DEFAULT NULL COMMENT '单位层次',
  `enterNature` varchar(20) DEFAULT NULL COMMENT '单位性质',
  `enterCapital` varchar(20) DEFAULT NULL COMMENT '企业注册资本',
  `enterLperson` varchar(20) DEFAULT NULL COMMENT '法人',
  `enterLpCard` varchar(20) DEFAULT NULL COMMENT '法人身份证',
  `enterAddress` varchar(20) DEFAULT NULL COMMENT '单位地址',
  `emailCode` varchar(20) DEFAULT NULL COMMENT '邮政编码',
  `enterRemarks` varchar(20) DEFAULT NULL COMMENT '备注',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_by` varchar(64) NOT NULL COMMENT '更新人',
  `update_date` datetime NOT NULL COMMENT '更新日期',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bas_enterprise
-- ----------------------------
INSERT INTO `bas_enterprise` VALUES ('42', '龙大肉食', 'A03', '一级企业', '国有企业', '6亿', '李舜', '07061311502017', '烟台市芝罘区', '276000', '无', '', '0000-00-00 00:00:00', '1', '2018-06-01 13:05:29', null, '0');
INSERT INTO `bas_enterprise` VALUES ('551d6fcf50274890b67875f085e302a9', '烟台喜旺', 'A01', '二级企业', '国有企业', '2亿', '邹佳霖', '37061222802010', '烟台市牟平区', '264000', '无', '1', '2018-05-26 14:18:49', '1', '2018-05-26 16:25:07', null, '0');
INSERT INTO `bas_enterprise` VALUES ('aed5cc0c296241689c0a0b60f258f018', '烟台艾氪森', 'A02', '一级企业', '国有企业', '1亿', '陈媛', '37061219952018', '烟台市莱山区', '264000', '无', '1', '2018-05-26 14:16:50', '1', '2018-05-26 16:25:34', null, '0');

-- ----------------------------
-- Table structure for `bas_factory`
-- ----------------------------
DROP TABLE IF EXISTS `bas_factory`;
CREATE TABLE `bas_factory` (
  `id` varchar(64) NOT NULL COMMENT '工厂id',
  `factoryName` varchar(10) DEFAULT NULL COMMENT '工厂名称',
  `factoryBuildDate` varchar(20) DEFAULT NULL COMMENT '创建日期',
  `factoryAddress` varchar(20) DEFAULT NULL COMMENT '地址',
  `factoryPhone` varchar(20) DEFAULT NULL COMMENT '电话',
  `factoryECode` varchar(20) DEFAULT NULL COMMENT '邮政编码',
  `factoryBuildM` varchar(20) DEFAULT NULL COMMENT '建筑面积',
  `enterprise_id` varchar(64) NOT NULL COMMENT '企业编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新日期',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bas_factory
-- ----------------------------
INSERT INTO `bas_factory` VALUES ('1', '马哈鱼加工厂', '2015-05-01', '高新区科技大道001', '0535449872', '264000', '1000m', 'aed5cc0c296241689c0a0b60f258f018', '', '0000-00-00 00:00:00', '509e20b7d0f9447bbb6098c592b7cb28', '2018-05-26 15:02:37', null, '0');
INSERT INTO `bas_factory` VALUES ('2', '金枪鱼加工厂', '2015-05-08', '高新区银海路756', '0535469426', '264001', '2000m', 'aed5cc0c296241689c0a0b60f258f018', '', '0000-00-00 00:00:00', '509e20b7d0f9447bbb6098c592b7cb28', '2018-05-26 15:02:56', null, '0');
INSERT INTO `bas_factory` VALUES ('9ac24160e2a340079f73c9b84347d621', '鱿鱼加工厂', '2015-04-30', '高新区科技大道001', '0535449872', '264000', '11111m', 'aed5cc0c296241689c0a0b60f258f018', '1', '2018-05-11 17:10:52', '1', '2018-05-26 16:28:54', null, '0');
INSERT INTO `bas_factory` VALUES ('bb033f9d0ab14b05b58aca018f6472c0', '金龙鱼加工厂', '2017-01-01', '烟台莱山区', '0535428115', '264001', '3000m', 'aed5cc0c296241689c0a0b60f258f018', '1', '2018-05-16 12:00:27', '1', '2018-05-26 16:28:24', null, '0');

-- ----------------------------
-- Table structure for `bas_group_user`
-- ----------------------------
DROP TABLE IF EXISTS `bas_group_user`;
CREATE TABLE `bas_group_user` (
  `id` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL DEFAULT '' COMMENT '员工编号',
  `group_id` varchar(64) NOT NULL DEFAULT '' COMMENT '工作组编号',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新着',
  `update_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作组与员工关系';

-- ----------------------------
-- Records of bas_group_user
-- ----------------------------
INSERT INTO `bas_group_user` VALUES ('4f678ac80e6d4f9e8422a5c44c0fe518', '181abcd9d1e04e0fb4f4b310031e2f86', '338cdeaa07554b5aaa510e50310547d6', '1', '2018-05-18 09:14:45', '1', '2018-05-18 09:14:45', null, '1');
INSERT INTO `bas_group_user` VALUES ('a1b0dd8a3add4f9fb71322c242ff43dd', '5a19d195cc47465888a6f66a8a4dfbec', '338cdeaa07554b5aaa510e50310547d6', '1', '2018-05-26 16:43:37', '1', '2018-05-26 16:43:37', null, '0');
INSERT INTO `bas_group_user` VALUES ('c118dc3319c141e0918f68731a56cfc8', '181abcd9d1e04e0fb4f4b310031e2f86', '4c21810692634d50a6bc721e3d3244b1', '1', '2018-05-18 13:36:33', '1', '2018-05-26 15:14:15', null, '0');
INSERT INTO `bas_group_user` VALUES ('ec2a9b060bdd4791a674fdadc9d75794', '61df92229e4b4a57b9ef810bb2cd9e90', '55fa9fcc93ae452da354d2b6faaab4cf', '1', '2018-05-17 17:15:53', '1', '2018-05-26 16:43:26', null, '0');

-- ----------------------------
-- Table structure for `bas_iphoto`
-- ----------------------------
DROP TABLE IF EXISTS `bas_iphoto`;
CREATE TABLE `bas_iphoto` (
  `qrCode` varchar(20) NOT NULL DEFAULT '' COMMENT '设备条码',
  `type` varchar(64) DEFAULT NULL COMMENT '设备类型id，外键，参照EquipmentType表',
  `spec` varchar(64) DEFAULT NULL COMMENT '设备规格id，外键，参照EquipmentSpec表',
  `supplier` varchar(20) DEFAULT NULL COMMENT '供应商',
  `manufacturer` varchar(20) DEFAULT NULL COMMENT '生产厂商',
  `factoryNumber` varchar(20) DEFAULT NULL COMMENT '出厂编号',
  `purpose` varchar(20) DEFAULT NULL COMMENT '用途',
  `buyDate` date DEFAULT NULL COMMENT '采购时间',
  `person` varchar(20) DEFAULT NULL COMMENT '资产负责人',
  `organization` varchar(20) DEFAULT NULL COMMENT '所有权部门',
  `ip` varchar(32) DEFAULT NULL COMMENT 'ip',
  `comBaudrate` varchar(20) DEFAULT NULL COMMENT 'com波特率',
  `comDataseat` varchar(20) DEFAULT NULL COMMENT 'com数据位',
  `comBegin` varchar(20) DEFAULT NULL COMMENT 'com起始位',
  `comEnd` varchar(20) DEFAULT NULL COMMENT 'com终止位',
  `checkMode` varchar(20) DEFAULT NULL COMMENT '校验方式',
  `sysParam` varchar(20) DEFAULT NULL COMMENT '系统简单属性',
  `iphotoDistance` varchar(20) DEFAULT NULL COMMENT '感应距离',
  `iphotoWay` varchar(20) DEFAULT NULL COMMENT '感应方式',
  `workEnvironment` varchar(20) DEFAULT NULL COMMENT '工作环境',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新日期',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  `id` varchar(64) NOT NULL COMMENT '编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `IPhoto_ibfk_1` (`type`),
  KEY `IPhoto_ibfk_2` (`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bas_iphoto
-- ----------------------------
INSERT INTO `bas_iphoto` VALUES ('200', '0005', '0001', '王帅', '富士康', '220', '扫码读取', '2018-05-02', '李刚', '6', null, null, null, null, null, null, null, '70cm', '红外读取', '包装车间', '1', '2018-05-11 14:10:21', '1', '2018-05-26 16:22:07', null, '0', '637ca7dc4d6a4b8d9cb7eb927e8712c4');
INSERT INTO `bas_iphoto` VALUES ('100', '0005', '0001', '刘祥', '李宁', '110', '扫码读取', '2018-05-18', '江山', '5', null, null, null, null, null, null, null, '60cm', '红外读取', '开片车间', '1', '2018-05-26 14:12:04', '1', '2018-05-26 16:22:16', null, '0', '769634924c674dc99fb3ef1a7afc9378');

-- ----------------------------
-- Table structure for `bas_line`
-- ----------------------------
DROP TABLE IF EXISTS `bas_line`;
CREATE TABLE `bas_line` (
  `id` varchar(64) NOT NULL COMMENT '产线id',
  `lineName` varchar(10) DEFAULT NULL COMMENT '产线名称',
  `lineNumber` varchar(20) DEFAULT NULL COMMENT '产线编码',
  `lineMaster` varchar(10) DEFAULT NULL COMMENT '产线负责人',
  `lineDescription` varchar(20) DEFAULT NULL COMMENT '产线描述',
  `workshop_id` varchar(64) NOT NULL COMMENT '所属车间',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新日期',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `lineId` (`id`),
  KEY `lineNumber` (`lineNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bas_line
-- ----------------------------
INSERT INTO `bas_line` VALUES ('50bab7e0a126485cb062534590e05038', '金龙鱼产线', 'J01', '王林', '金龙鱼切片', '94daa213bbe4491eae32971da58abde1', '509e20b7d0f9447bbb6098c592b7cb28', '2018-05-26 14:44:11', '1', '2018-05-26 16:36:30', null, '0');
INSERT INTO `bas_line` VALUES ('689b1cde6dd243538c735e08b954acda', '鱿鱼丝产线', 'Y01', '王坤', '鱿鱼丝烘烤', '330ee50462414b4394dcfc4d874998de', '1', '2018-05-26 16:31:15', '1', '2018-05-26 16:36:21', null, '0');
INSERT INTO `bas_line` VALUES ('794abde5a457437f812eecf712c17578', '金枪鱼产线', 'Q01', '高磊', '金枪鱼去头', 'adbc33cdf66d4891aa1d79e3dda8374b', '1', '2018-05-26 17:22:08', '1', '2018-05-26 17:22:21', null, '0');
INSERT INTO `bas_line` VALUES ('d3b5488ffa5d4d48ad73d45d4a0229a5', '马哈鱼产线', 'M01', '陈凯', '马哈鱼挑刺', '4524c0d903a9448099ef44568174f5dd', '509e20b7d0f9447bbb6098c592b7cb28', '2018-05-26 14:45:21', '1', '2018-05-26 17:22:32', null, '0');

-- ----------------------------
-- Table structure for `bas_pad`
-- ----------------------------
DROP TABLE IF EXISTS `bas_pad`;
CREATE TABLE `bas_pad` (
  `qrCode` varchar(20) NOT NULL DEFAULT '' COMMENT '设备条码',
  `type` varchar(64) NOT NULL COMMENT '设备类型id，外键，对应EquipmentType表',
  `spec` varchar(64) NOT NULL COMMENT '设备规格id，外键，对应EquipmentSpec表',
  `supplier` varchar(20) DEFAULT NULL COMMENT '供应商',
  `manufacturer` varchar(20) DEFAULT NULL COMMENT '生产商',
  `factoryNumber` varchar(20) DEFAULT NULL COMMENT '出厂编号',
  `purpose` varchar(20) DEFAULT NULL COMMENT '用途',
  `buyDate` date DEFAULT NULL COMMENT '采购日期',
  `person` varchar(20) DEFAULT NULL COMMENT '资产负责人',
  `organization` varchar(20) DEFAULT NULL COMMENT '所有权部门',
  `ip` varchar(32) DEFAULT NULL COMMENT 'ip',
  `comBaudrate` varchar(20) DEFAULT NULL COMMENT 'com波特率',
  `comDataseat` varchar(20) DEFAULT NULL COMMENT 'com数据位',
  `comBegin` varchar(20) DEFAULT NULL COMMENT 'com起始位',
  `comEnd` varchar(20) DEFAULT NULL COMMENT 'com终止位',
  `checkMode` varchar(20) DEFAULT NULL COMMENT '校验属性',
  `sysParam` varchar(20) DEFAULT NULL COMMENT '系统简单属性',
  `pADSC` varchar(20) DEFAULT NULL COMMENT '分辨率',
  `pADNucleus` varchar(20) DEFAULT NULL COMMENT '核心数',
  `pADMemory` varchar(20) DEFAULT NULL COMMENT '内存',
  `capacity` varchar(20) DEFAULT NULL COMMENT '电池容量',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  `id` varchar(64) NOT NULL COMMENT '编号',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `AndroidPAD_ibfk_1` (`type`),
  KEY `AndroidPAD_ibfk_2` (`spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bas_pad
-- ----------------------------
INSERT INTO `bas_pad` VALUES ('01', '0004', '0001', '王明', '晨光', 'X52-12', '扫码', '2018-05-15', '张康', '1', null, null, null, null, null, null, null, '1995*1994', '8', '4G', '20000mA', '1', '2018-05-15 18:49:58', '1', '2018-05-26 16:19:47', '', '0', '0b13296847974ba7b962f9861e8b722d');
INSERT INTO `bas_pad` VALUES ('03', '0004', '0003', '三星', '富士康', 'X52-36', '测试用途', '2018-02-09', '李刚', '5', '202.194.44.19', '240bd', '7', '5', '13', '偶校验', '无', '1920*1080', '4', '4G', '10000mA', '1', '2018-05-21 19:31:41', '1', '2018-05-26 16:19:11', '', '0', '16740928400a4496b9140a4d1829de31');
INSERT INTO `bas_pad` VALUES ('02', '0004', '0003', '长电公司', '烟台宏电子', 'X52-01', '读卡记录', '2018-05-07', '李刚', '6', '123.123.123.123', '11', '63', '21', '36', '22', '22', '1980*2000', '11', '11G', '1200mA', '', '0000-00-00 00:00:00', '1', '2018-05-26 16:19:38', '', '0', '3');

-- ----------------------------
-- Table structure for `bas_product`
-- ----------------------------
DROP TABLE IF EXISTS `bas_product`;
CREATE TABLE `bas_product` (
  `id` varchar(64) NOT NULL,
  `productName` varchar(20) DEFAULT NULL COMMENT '产品名称',
  `productAbbr` varchar(10) DEFAULT NULL COMMENT '产品简称',
  `productDesc` varchar(20) DEFAULT NULL COMMENT '产品描述',
  `firstCheck` varchar(20) DEFAULT NULL COMMENT '是否需要首件检查',
  `qrCode` varchar(20) DEFAULT NULL COMMENT '条码',
  `manageWay` varchar(20) DEFAULT NULL COMMENT '管理方式',
  `lotNumber` varchar(20) DEFAULT NULL COMMENT '批次',
  `state` varchar(10) DEFAULT NULL COMMENT '状态',
  `productUnit` varchar(20) DEFAULT NULL COMMENT '产品计量单位',
  `productProp` varchar(20) DEFAULT NULL COMMENT '产品属性',
  `flow_id` varchar(64) DEFAULT NULL COMMENT '生产流程',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新日期',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `productId` (`id`),
  KEY `ProductName` (`productName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bas_product
-- ----------------------------
INSERT INTO `bas_product` VALUES ('1', '鱿鱼丝', 'Y', '鱿鱼丝开袋即食，回味无穷', '1', 'Y01', '通风管理', '1批次', '烘干状态', 'g', '水产', 'd61e6be69be848979fcd6941a6227d0c', '', '0000-00-00 00:00:00', '1', '2018-05-26 16:47:06', null, '0');
INSERT INTO `bas_product` VALUES ('2', '金枪鱼片', 'J', '金枪鱼片，鲜美肥嫩，可生食', '0', 'J01', '冷藏管理', '2批次', '新鲜状态', 'g', '水产', 'd61e6be69be848979fcd6941a6227d0c', '', '0000-00-00 00:00:00', '1', '2018-05-26 16:45:17', null, '0');
INSERT INTO `bas_product` VALUES ('f1754ab55f5847a6963d306b10409db3', '马哈鱼干', 'M', '营养丰富，美味十足', '1', 'D01', '通风管理', '2批次', '烘烤状态', 'g', '水产', 'a190c9f9c57e43f89f7cf4d37b69e6ca', '1', '2018-05-11 17:22:24', '1', '2018-05-26 16:47:43', null, '0');

-- ----------------------------
-- Table structure for `bas_station_group`
-- ----------------------------
DROP TABLE IF EXISTS `bas_station_group`;
CREATE TABLE `bas_station_group` (
  `id` varchar(64) NOT NULL,
  `group_id` varchar(64) NOT NULL DEFAULT '' COMMENT '工作组编号',
  `station_id` varchar(64) NOT NULL DEFAULT '' COMMENT '工站编号',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新着',
  `update_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工站与工作组关系';

-- ----------------------------
-- Records of bas_station_group
-- ----------------------------
INSERT INTO `bas_station_group` VALUES ('30a77093a4444309a01727d980e569c0', '338cdeaa07554b5aaa510e50310547d6', '7e1c273df5334c648142e72f0045876b', '1', '2018-05-26 17:31:58', '1', '2018-05-26 17:31:58', null, '0');
INSERT INTO `bas_station_group` VALUES ('3ce02c2b958448a49b0a0fe080e247e9', 'a7eba34c89f04fe7a0f4ad97ac05140a', '4a6db741b7464ad3b1467aa2b464a3b1', '1', '2018-05-18 10:42:54', '1', '2018-05-18 10:42:54', null, '1');
INSERT INTO `bas_station_group` VALUES ('3f95bead7127458cb3851f9a9d5ec164', '55fa9fcc93ae452da354d2b6faaab4cf', '63688c609f824834bf0abca0171bc8a7', '1', '2018-05-18 13:36:08', '1', '2018-05-26 16:43:46', null, '0');
INSERT INTO `bas_station_group` VALUES ('5cd3b2a99a81401d8fb305fb2934ba68', '338cdeaa07554b5aaa510e50310547d6', 'b704ea7d3af84b9a94a8481891b6526c', '1', '2018-05-26 17:32:08', '1', '2018-05-26 17:32:08', null, '0');
INSERT INTO `bas_station_group` VALUES ('c2e73a6fb32246bcbeb3d387b0456a54', '4c21810692634d50a6bc721e3d3244b1', '8021d772bf09424f9dc51674ab419431', '1', '2018-05-18 10:47:52', '1', '2018-05-26 16:43:50', null, '0');

-- ----------------------------
-- Table structure for `bas_workcell`
-- ----------------------------
DROP TABLE IF EXISTS `bas_workcell`;
CREATE TABLE `bas_workcell` (
  `id` varchar(64) NOT NULL COMMENT '工位id',
  `cellName` varchar(10) DEFAULT NULL COMMENT '工位名',
  `cellNumber` varchar(20) DEFAULT NULL COMMENT '工位编号',
  `cellMaster` varchar(10) DEFAULT NULL COMMENT '工位负责人',
  `cellDescription` varchar(20) DEFAULT NULL COMMENT '工位描述',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新日期',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  `station_id` varchar(64) NOT NULL COMMENT '所属工站',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bas_workcell
-- ----------------------------
INSERT INTO `bas_workcell` VALUES ('30ccd2fb23e6482d9ebe7552cc225b8c', '烘烤工位', 'H01', '李帅', '鱿鱼丝烘烤', '1', '2018-05-26 16:40:35', '1', '2018-05-26 16:40:35', null, '0', 'b704ea7d3af84b9a94a8481891b6526c');
INSERT INTO `bas_workcell` VALUES ('66d2e09e0fe244cba3598e0686d96409', '挑刺工位', 'Q02', '王凯', '马哈鱼挑刺', '509e20b7d0f9447bbb6098c592b7cb28', '2018-05-26 14:50:34', '1', '2018-05-26 17:28:41', null, '0', '8021d772bf09424f9dc51674ab419431');
INSERT INTO `bas_workcell` VALUES ('86bdd12fd951410d9a59f4ee1fdd7469', '去头工站', 'J01', '李成', '金枪鱼去头', '1', '2018-05-26 17:30:30', '1', '2018-05-26 17:30:30', null, '0', '7e1c273df5334c648142e72f0045876b');
INSERT INTO `bas_workcell` VALUES ('c2f0f0924cbe4b5d9f3437355ddaf3c5', '切片工位', 'Q01', '王明', '金龙鱼切片', '509e20b7d0f9447bbb6098c592b7cb28', '2018-05-26 14:51:25', '1', '2018-05-26 17:29:04', null, '0', '63688c609f824834bf0abca0171bc8a7');

-- ----------------------------
-- Table structure for `bas_workgroup`
-- ----------------------------
DROP TABLE IF EXISTS `bas_workgroup`;
CREATE TABLE `bas_workgroup` (
  `id` varchar(64) NOT NULL,
  `groupCode` varchar(20) NOT NULL DEFAULT '' COMMENT '工作组编号',
  `groupName` varchar(64) NOT NULL DEFAULT '' COMMENT '工作组名称',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新着',
  `update_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作组';

-- ----------------------------
-- Records of bas_workgroup
-- ----------------------------
INSERT INTO `bas_workgroup` VALUES ('338cdeaa07554b5aaa510e50310547d6', '003', '三号工作组', '1', '2018-05-17 14:02:57', '1', '2018-05-17 14:03:20', null, '0');
INSERT INTO `bas_workgroup` VALUES ('4c21810692634d50a6bc721e3d3244b1', '002', '二号工作组', '1', '2018-05-17 14:02:14', '1', '2018-05-17 14:02:14', null, '0');
INSERT INTO `bas_workgroup` VALUES ('55fa9fcc93ae452da354d2b6faaab4cf', '001', '一号工作组', '1', '2018-05-17 14:00:50', '1', '2018-05-17 14:00:50', null, '0');

-- ----------------------------
-- Table structure for `bas_workorder`
-- ----------------------------
DROP TABLE IF EXISTS `bas_workorder`;
CREATE TABLE `bas_workorder` (
  `id` varchar(64) NOT NULL COMMENT '订单Id',
  `orderCode` varchar(10) NOT NULL COMMENT '工单条码',
  `unitName` varchar(20) DEFAULT NULL COMMENT '计量单位',
  `orderType` varchar(20) DEFAULT NULL COMMENT '工单类型',
  `amount` int(11) DEFAULT NULL COMMENT '工单生产数量',
  `estStartTime` datetime DEFAULT NULL COMMENT '预计生产时间',
  `estEndTime` datetime DEFAULT NULL COMMENT '预计结束时间',
  `actStartTime` datetime DEFAULT NULL COMMENT '实际生产时间',
  `inAmount` int(11) DEFAULT NULL COMMENT '投入数量',
  `outAmount` int(11) DEFAULT NULL COMMENT '产出数量',
  `scrapAmount` int(11) DEFAULT NULL COMMENT '报废数量',
  `state` varchar(20) DEFAULT NULL COMMENT '工单状态',
  `line_id` varchar(64) NOT NULL DEFAULT '' COMMENT '所属产线',
  `product_id` varchar(64) NOT NULL DEFAULT '' COMMENT '产品',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新日期',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of bas_workorder
-- ----------------------------
INSERT INTO `bas_workorder` VALUES ('138c128f116b4a6e980598243fc57a89', '001', 'Kg', '加班工单', '1000', '2018-05-07 17:50:00', '2018-05-01 17:50:00', '2018-05-22 17:50:00', '1300', '1200', '100', '已发布', '50bab7e0a126485cb062534590e05038', '2', '1', '2018-05-19 17:50:41', '1', '2018-05-28 11:51:14', null, '0');
INSERT INTO `bas_workorder` VALUES ('2c7d15094e1b4c239053c0a6432afd4a', '002', 'Kg', '一般工单', '6000', '2018-05-07 17:54:00', '2018-05-16 17:54:00', '2018-05-16 17:54:00', '6500', '6000', '500', '在制状态', 'd3b5488ffa5d4d48ad73d45d4a0229a5', 'f1754ab55f5847a6963d306b10409db3', '1', '2018-05-19 17:55:11', '1', '2018-05-28 11:51:03', null, '0');
INSERT INTO `bas_workorder` VALUES ('bc2c10afee6542a4b6213fec97baa93b', '003', 'Kg', '加班工单', '5000', '2018-05-08 17:57:00', '2018-05-08 17:57:00', '2018-05-15 17:57:00', '5500', '5000', '500', '交付', '689b1cde6dd243538c735e08b954acda', '1', '1', '2018-05-19 17:58:06', '1', '2018-05-28 11:50:50', null, '0');

-- ----------------------------
-- Table structure for `bas_workshop`
-- ----------------------------
DROP TABLE IF EXISTS `bas_workshop`;
CREATE TABLE `bas_workshop` (
  `id` varchar(64) NOT NULL COMMENT '车间id',
  `shopName` varchar(10) DEFAULT NULL COMMENT '车间名称',
  `shopNo` varchar(20) DEFAULT NULL COMMENT '车间编码',
  `master` varchar(10) DEFAULT NULL COMMENT '车间负责人',
  `description` varchar(20) DEFAULT NULL COMMENT '车间描述',
  `factory_id` varchar(64) NOT NULL COMMENT '所属工厂',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新日期',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL COMMENT '删除信息',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bas_workshop
-- ----------------------------
INSERT INTO `bas_workshop` VALUES ('330ee50462414b4394dcfc4d874998de', '烘烤车间', 'H01', '邹佳霖', '鱿鱼丝烘烤', '9ac24160e2a340079f73c9b84347d621', '1', '2018-05-26 16:29:30', '1', '2018-05-26 16:30:34', null, '0');
INSERT INTO `bas_workshop` VALUES ('4524c0d903a9448099ef44568174f5dd', '挑刺车间', 'P02', '邹佳霖', '马哈鱼挑刺', '1', '1', '2018-05-17 14:18:17', '1', '2018-05-26 17:22:55', null, '0');
INSERT INTO `bas_workshop` VALUES ('94daa213bbe4491eae32971da58abde1', '切片车间', 'Q01', '张聪', '金龙鱼切片', 'bb033f9d0ab14b05b58aca018f6472c0', '509e20b7d0f9447bbb6098c592b7cb28', '2018-05-26 15:06:02', '509e20b7d0f9447bbb6098c592b7cb28', '2018-05-26 15:06:02', null, '0');
INSERT INTO `bas_workshop` VALUES ('adbc33cdf66d4891aa1d79e3dda8374b', '去头车间', 'P01', '王帅', '金龙鱼去头', '2', '1', '2018-05-17 14:08:53', '1', '2018-05-26 17:20:07', null, '0');

-- ----------------------------
-- Table structure for `bas_workstationinfos`
-- ----------------------------
DROP TABLE IF EXISTS `bas_workstationinfos`;
CREATE TABLE `bas_workstationinfos` (
  `id` varchar(64) NOT NULL COMMENT '工站id',
  `stationName` varchar(10) DEFAULT NULL COMMENT '工站名称',
  `stationNo` varchar(20) DEFAULT NULL COMMENT '工站编码',
  `stationMaster` varchar(10) DEFAULT NULL COMMENT '工站负责人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建日期',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新日期',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注',
  `del_flag` char(1) NOT NULL COMMENT '删除标记',
  `line_id` varchar(64) NOT NULL COMMENT '所属产线',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bas_workstationinfos
-- ----------------------------
INSERT INTO `bas_workstationinfos` VALUES ('63688c609f824834bf0abca0171bc8a7', '切片工站', 'J001', '白杰', '1', '2018-05-26 16:37:43', '1', '2018-05-26 16:37:53', null, '0', '50bab7e0a126485cb062534590e05038');
INSERT INTO `bas_workstationinfos` VALUES ('7e1c273df5334c648142e72f0045876b', '去头工站', 'Q001', '鲍迪', '1', '2018-05-26 17:23:32', '1', '2018-05-26 17:23:52', null, '0', '794abde5a457437f812eecf712c17578');
INSERT INTO `bas_workstationinfos` VALUES ('8021d772bf09424f9dc51674ab419431', '挑刺工站', 'M001', '苗琳', '1', '2018-05-26 16:33:30', '1', '2018-05-26 16:37:05', null, '0', 'd3b5488ffa5d4d48ad73d45d4a0229a5');
INSERT INTO `bas_workstationinfos` VALUES ('b704ea7d3af84b9a94a8481891b6526c', '烘烤工站', 'H001', '刘坤', '1', '2018-05-26 16:32:45', '1', '2018-05-26 16:37:13', null, '0', '689b1cde6dd243538c735e08b954acda');

-- ----------------------------
-- Table structure for `equip_fault_report`
-- ----------------------------
DROP TABLE IF EXISTS `equip_fault_report`;
CREATE TABLE `equip_fault_report` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL DEFAULT '' COMMENT '主键',
  `equip_id` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '设备主键',
  `equip_no` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '设备编号',
  `equip_type` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '设备类型',
  `equip_loc` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '所处产线',
  `fault_desc` varchar(200) CHARACTER SET utf8 DEFAULT NULL COMMENT '故障描述',
  `status` varchar(10) CHARACTER SET utf8 DEFAULT NULL COMMENT '状态',
  `report_person` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '上报人姓名',
  `assign_time` datetime DEFAULT NULL COMMENT '指派时间',
  `maintenance_worker` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '维修工人',
  `create_by` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of equip_fault_report
-- ----------------------------
INSERT INTO `equip_fault_report` VALUES ('1e0a9d00ccc14cbb8118429c65ce862e', null, '0005', '0003', 'M01', '机器停止', '0004', '系统管理员', '2018-06-01 16:10:30', '181abcd9d1e04e0fb4f4b310031e2f86', '1', '2018-05-31 15:31:48', '1', '2018-06-01 16:14:58', null, '0');
INSERT INTO `equip_fault_report` VALUES ('20857f1011eb493f8a6a360c6548afb5', 'd739ccee4f864762bdb2ad4e2bae521c', '0005', '0003', 'M01', '11111111111111', '0004', null, '2018-06-01 15:32:43', '6b6c722ef6824ce8ad2625cfd7911603', null, '2018-06-01 14:37:46', null, '2018-06-01 16:15:38', null, '0');
INSERT INTO `equip_fault_report` VALUES ('217a9ecff0324ccc8ec1c45d8a4e001b', '769634924c674dc99fb3ef1a7afc9378', '100', '0005', 'J01', 'ghjjjf', '0001', null, null, null, null, '2018-06-02 15:23:52', null, '2018-06-02 15:23:52', null, '0');
INSERT INTO `equip_fault_report` VALUES ('36a9551326794ff0b1d86a8f60f542df', '', '0002', '0004', 'rfthryh', '屏幕坏了', '0001', null, null, '181abcd9d1e04e0fb4f4b310031e2f86', '1', '2018-05-17 10:27:13', '1', '2018-05-17 17:40:31', null, '0');
INSERT INTO `equip_fault_report` VALUES ('552b43fb4434400b840c4abc57dc0b4b', '27a2fbbb4f584c27b641adf934ea5405', '001', '0001', 'Q01', 'hhhhhh', '0001', null, null, null, null, '2018-06-02 15:28:04', null, '2018-06-02 15:28:04', null, '0');
INSERT INTO `equip_fault_report` VALUES ('691ba62cb72e4d73bcf18868d4a7a3ab', '', '22', '0002', 'M01', '读卡器刷卡无反应', '0002', '系统管理员', '2018-06-02 14:14:44', '61df92229e4b4a57b9ef810bb2cd9e90', '1', '2018-06-01 09:40:47', '1', '2018-06-02 14:14:45', null, '0');
INSERT INTO `equip_fault_report` VALUES ('76b548676bf9433ba645320c6451362a', '27a2fbbb4f584c27b641adf934ea5405', '001', '0001', 'Q01', 'yhjjjj', '0001', null, null, null, null, '2018-06-02 15:26:34', null, '2018-06-02 15:26:34', null, '0');
INSERT INTO `equip_fault_report` VALUES ('92e873c4eef84d4fb4abfd6ba2db4233', '', '0102', '0001', 'M01', '电子秤不标准', '0004', '系统管理员', '2018-06-01 16:15:13', 'ef83ec0c592148c2991b12e6711e5911', '1', '2018-05-26 16:13:03', '1', '2018-06-01 18:26:05', null, '0');
INSERT INTO `equip_fault_report` VALUES ('9fc6f6e21dbb40d482f6815d0ad81b49', '', '0101', '0002', 'M01', '读卡器无法读卡', '0003', '系统管理员', '2018-06-01 18:25:46', '181abcd9d1e04e0fb4f4b310031e2f86', '1', '2018-05-26 16:12:24', '1', '2018-06-04 10:02:44', null, '0');
INSERT INTO `equip_fault_report` VALUES ('f3849749a2df40a98c0035330cca5169', '', '0004', '0002', 'J01', '读卡器读数有误', '0001', '系统管理员', '2018-05-30 17:31:20', '6b6c722ef6824ce8ad2625cfd7911603', '1', '2018-05-30 15:40:59', '1', '2018-05-31 11:25:08', null, '0');
INSERT INTO `equip_fault_report` VALUES ('f4a4262696dc4bd49177cd4a1bdef3ec', '', '0103', '0004', 'J01', '屏幕损坏', '0001', '系统管理员', null, null, '1', '2018-05-26 16:13:41', '1', '2018-05-30 15:42:25', null, '0');

-- ----------------------------
-- Table structure for `equip_maintenance_plan`
-- ----------------------------
DROP TABLE IF EXISTS `equip_maintenance_plan`;
CREATE TABLE `equip_maintenance_plan` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL COMMENT '保养计划主键',
  `equip_type` varchar(20) CHARACTER SET utf8 NOT NULL COMMENT '设备类型',
  `maintenance` varchar(2000) CHARACTER SET utf8 DEFAULT NULL COMMENT '保养内容',
  `cycle` varchar(20) CHARACTER SET utf8 DEFAULT NULL COMMENT '保养周期：周，月，年',
  `warn_time` int(11) DEFAULT NULL COMMENT '预警时间',
  `user_name` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '保养人姓名',
  `user_id` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '保养人',
  `create_by` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of equip_maintenance_plan
-- ----------------------------
INSERT INTO `equip_maintenance_plan` VALUES ('52789bbc5f74430ba84f5b0069255084', '0005', '扫码枪扫码距离敏感度', 'week', '4', '张聪', '181abcd9d1e04e0fb4f4b310031e2f86', '1', '1', '2018-05-16 17:24:46', '2018-05-26 16:00:57', null, '0');
INSERT INTO `equip_maintenance_plan` VALUES ('636ad0d29313444fbe8d81fb36bb3e5b', '0004', '扫码识别时间', 'week', '4', '张震刚', '61df92229e4b4a57b9ef810bb2cd9e90', '1', '1', '2018-05-16 17:14:46', '2018-05-26 16:02:45', null, '0');
INSERT INTO `equip_maintenance_plan` VALUES ('d25bdc8900e34ba38bc0cd390a7db889', '0003', '打印机墨盒剩余量', 'mm', '2', '姚霞', '6b6c722ef6824ce8ad2625cfd7911603', '1', '1', '2018-05-16 17:22:28', '2018-05-26 16:01:29', null, '0');
INSERT INTO `equip_maintenance_plan` VALUES ('de4cf3da74f04a2caed5304cf74e8acc', '0002', '读卡器敏感度', 'week', '4', '张聪', '181abcd9d1e04e0fb4f4b310031e2f86', '1', '1', '2018-05-16 17:23:44', '2018-05-26 16:00:34', null, '0');

-- ----------------------------
-- Table structure for `equip_repair`
-- ----------------------------
DROP TABLE IF EXISTS `equip_repair`;
CREATE TABLE `equip_repair` (
  `id` varchar(64) CHARACTER SET utf8 NOT NULL,
  `mid` varchar(64) CHARACTER SET utf8 DEFAULT NULL COMMENT '报修记录编号',
  `fault_type` varchar(60) CHARACTER SET utf8 DEFAULT NULL COMMENT '故障类型',
  `fault_reason` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '故障原因',
  `fault_desc` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '故障描述',
  `fault_imgs` varchar(500) CHARACTER SET utf8 DEFAULT NULL COMMENT '图片地址',
  `create_by` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) CHARACTER SET utf8 DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` char(1) CHARACTER SET utf8 DEFAULT NULL,
  `remarks` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of equip_repair
-- ----------------------------
INSERT INTO `equip_repair` VALUES ('038bb48ca70e4143aa1d9a3c40f960d6', '6bb8d96498634077b8b2672c52904dc9', '机械故障', '11111', '1111111', null, '1', '2018-05-31 11:21:00', '1', '2018-05-31 11:21:19', '0', null);
INSERT INTO `equip_repair` VALUES ('0e6da33720354bcaa150aba6b16ba1fd', '9fc6f6e21dbb40d482f6815d0ad81b49', '线路老化', '机械故障', '由于线路老化导致的无法刷卡', null, '1', '2018-05-26 16:12:39', '1', '2018-06-04 10:02:44', '0', null);
INSERT INTO `equip_repair` VALUES ('6e03357fecb5414eb60e06415d6da768', '92e873c4eef84d4fb4abfd6ba2db4233', 'hhj', 'hhj', 'hhh', null, null, '2018-06-01 18:25:53', null, '2018-06-01 18:26:05', '0', null);
INSERT INTO `equip_repair` VALUES ('7e4e8560b54945d8bd8019abebc195ca', '691ba62cb72e4d73bcf18868d4a7a3ab', null, null, null, null, '1', '2018-06-01 09:41:13', '1', '2018-06-01 09:42:47', '0', null);
INSERT INTO `equip_repair` VALUES ('964e0136284f4ec9b55fd4747dd4c194', '321ea1db787e445cb67c6c77ea6b5aa4', null, null, null, null, '1', '2018-05-17 17:36:46', '1', '2018-05-17 17:40:51', '0', null);
INSERT INTO `equip_repair` VALUES ('c4b7d39d91864d1faac81fdc8b35032c', 'f4a4262696dc4bd49177cd4a1bdef3ec', null, null, null, null, '1', '2018-05-28 16:40:38', '1', '2018-05-30 15:42:25', '0', null);
INSERT INTO `equip_repair` VALUES ('c6ea49a0dfee451eaadaa8b7ee2788a2', '36a9551326794ff0b1d86a8f60f542df', null, null, null, null, '1', '2018-05-17 17:40:32', '1', '2018-05-17 17:40:32', '0', null);
INSERT INTO `equip_repair` VALUES ('cbb22d3b2da448379a667b55b66332a3', 'f3849749a2df40a98c0035330cca5169', '机械故障', '测试大V是', '而非我无法我无法v', null, '1', '2018-05-30 15:42:20', '1', '2018-05-31 11:25:08', '0', null);
INSERT INTO `equip_repair` VALUES ('cc66b5b785854576960e68b30a6c52c6', '2c3076c75f544defb6a841b016d1dbc4', '螺丝松动', '螺丝磨损', '由于螺丝磨损导致的螺丝松动', null, null, '2018-06-01 10:43:24', null, '2018-06-01 12:06:03', '0', null);
INSERT INTO `equip_repair` VALUES ('e5459d3e931d4bc186bd590cff251060', '20857f1011eb493f8a6a360c6548afb5', '222222', '22222', '222222', null, null, '2018-06-01 16:09:43', null, '2018-06-01 16:15:38', '0', null);
INSERT INTO `equip_repair` VALUES ('e97e3bcedb6248a2b3101fb92915d78d', '2ca94cb2776646179fead1489939d7e9', '机械故障', '螺丝松动', '由于螺丝松动导致的机械卡顿', null, '1', '2018-05-31 08:58:17', '1', '2018-05-31 11:18:10', '0', null);
INSERT INTO `equip_repair` VALUES ('f48105f5c0d541cea4cb0a0d2f772037', '1e0a9d00ccc14cbb8118429c65ce862e', 'gggh', 'bhh', 'ghh', null, null, '2018-06-01 16:10:54', null, '2018-06-01 16:14:58', '0', null);

-- ----------------------------
-- Table structure for `kpi_performtype`
-- ----------------------------
DROP TABLE IF EXISTS `kpi_performtype`;
CREATE TABLE `kpi_performtype` (
  `id` varchar(64) NOT NULL,
  `performTypeName` varchar(64) NOT NULL DEFAULT '' COMMENT '绩效名称',
  `performTypeNum` double NOT NULL DEFAULT '0' COMMENT '绩效数值',
  `performTypeUnit` varchar(5) NOT NULL DEFAULT '' COMMENT '绩效单位',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新着',
  `update_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='绩效方式表';

-- ----------------------------
-- Records of kpi_performtype
-- ----------------------------
INSERT INTO `kpi_performtype` VALUES ('130ff5ce02ca4b60a50e15a240417928', 'Packages', '100', '袋', '1', '2018-05-26 09:30:08', '1', '2018-05-26 09:30:08', null, '0');
INSERT INTO `kpi_performtype` VALUES ('241736b3134e43fea1cd7761f313995f', 'CutPiece', '50', '片', '1', '2018-05-26 09:28:16', '1', '2018-05-26 09:28:16', null, '0');
INSERT INTO `kpi_performtype` VALUES ('585d471d624644f09ea81578365fc6e2', 'Boxing', '100', '箱', '1', '2018-05-26 09:30:58', '1', '2018-05-26 09:30:58', null, '0');
INSERT INTO `kpi_performtype` VALUES ('c8c8d911577c40148940dd741d36bcf2', 'ChopingBiz', '200', '盘', '1', '2018-05-26 09:31:23', '1', '2018-05-26 09:31:23', null, '0');
INSERT INTO `kpi_performtype` VALUES ('ef9a6650d58e43dbb091938900b0912b', 'Decaptitating', '555', 'KG', '1', '2018-05-26 09:25:03', '1', '2018-05-26 09:25:03', null, '0');
INSERT INTO `kpi_performtype` VALUES ('f340f478edf0483798005c6ed0a3b550', 'RemoveFishBone', '500', '盘', '1', '2018-05-26 09:29:33', '1', '2018-05-26 09:29:33', null, '0');

-- ----------------------------
-- Table structure for `kpi_SalaryConfig`
-- ----------------------------
DROP TABLE IF EXISTS `kpi_SalaryConfig`;
CREATE TABLE `kpi_SalaryConfig` (
  `id` varchar(32) NOT NULL,
  `workType` varchar(255) DEFAULT NULL,
  `pay` int(11) DEFAULT NULL,
  `creatorId` varchar(32) DEFAULT NULL,
  `creatorName` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifer` varchar(255) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of kpi_SalaryConfig
-- ----------------------------
INSERT INTO `kpi_SalaryConfig` VALUES ('1', 'CutPiece', '50', null, null, null, null, null, null);
INSERT INTO `kpi_SalaryConfig` VALUES ('2', 'Decaptitating', '555', null, null, null, null, null, null);
INSERT INTO `kpi_SalaryConfig` VALUES ('3', 'RemoveFishBone', '500', null, null, null, null, null, null);
INSERT INTO `kpi_SalaryConfig` VALUES ('4', 'Packages', '100', null, null, null, null, null, null);
INSERT INTO `kpi_SalaryConfig` VALUES ('5', 'Boxing', '100', null, null, null, null, null, null);
INSERT INTO `kpi_SalaryConfig` VALUES ('6', 'ChopingBiz', '200', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `log_BoxingBizRecords`
-- ----------------------------
DROP TABLE IF EXISTS `log_BoxingBizRecords`;
CREATE TABLE `log_BoxingBizRecords` (
  `id` varchar(32) NOT NULL,
  `serialNumber` varchar(255) DEFAULT NULL,
  `workGroupId` varchar(255) DEFAULT NULL,
  `workGroupName` varchar(255) DEFAULT NULL,
  `workCellId` varchar(255) DEFAULT NULL,
  `workCellName` varchar(255) DEFAULT NULL,
  `combineId` varchar(255) DEFAULT NULL,
  `combineName` varchar(255) DEFAULT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `creatorId` varchar(32) DEFAULT NULL,
  `creatorName` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifer` varchar(255) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_BoxingBizRecords
-- ----------------------------
INSERT INTO `log_BoxingBizRecords` VALUES ('4028811962e106430162e10ced83003c', 'caaf4656-a85f-4c4f-be03-abb88d8b4a7a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-04-20 11:15:43', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('4028811962e106430162e10d08b60041', '6d23b379-d7ef-4168-82dc-970f64a8ba62', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-04-20 11:15:50', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('4028811962e106430162e10d17b10042', '8ff08569-0b53-47c4-9a25-fdb89dac883d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-04-20 11:15:54', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('4028811962e106430162e1127ac6005f', 'bfbbd474-6223-43b4-903b-5016472b51c0', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-04-20 11:21:47', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('4028811962e106430162e112934d0060', '6a8582e6-f784-4615-8b7b-7a974c9ae8cf', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-04-20 11:21:53', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('4028811962e106430162e1260e120095', 'b81f62d5-c6c2-448c-897f-3505ad968fa6', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-04-20 11:43:10', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('4028811962e106430162e1c6a1d100d2', '1602b36b-a837-406f-ba49-0df5a3174a8f', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-04-20 14:38:33', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('4028811962e106430162e1c6f04800d3', 'b2fa8d94-940f-4bda-9f9b-0b342437aa38', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-04-20 14:38:53', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('4028811962e106430162e1c7131100d4', 'f0d12da6-9af6-4d2a-84aa-60a529da3d3d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-04-20 14:39:02', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('4028811962e106430162e1c7153300d5', '56e03e02-4322-406b-b320-55db0fc1cc44', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-04-20 14:39:03', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('4028811962e106430162e1c71a0900d6', '1f2782f9-220f-48d1-97bb-d80803ba1874', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-04-20 14:39:04', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('4028811962e106430162e1c7284300d7', '08c059f0-e9a7-4aad-b35f-a7b53ee5a6df', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-04-20 14:39:08', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347994e4a0000', '019b59a0-3c43-444c-95ac-833b5bb71846', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 09:10:16', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e0163479952620001', '7e9758cc-e4fa-4f40-9745-71971bf2d5c5', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 09:10:19', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347e15d5d0049', '2cdf23b9-ae40-44f6-8760-9d6b71854c93', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:29:01', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347e166de004a', '89636f95-5008-4427-b196-94ec983a283d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:29:04', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347e173c3004b', '44f52c74-71cc-41b1-8a03-36dad64ee938', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:29:07', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347e175fb004c', '2e446acb-cd89-4daa-bff7-359604e68d9f', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:29:08', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347e18a37004d', '60692d3d-b5e6-4537-beb2-4b7eace5212a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:29:13', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347e1918a004e', '002bcff5-1865-4437-8d59-7bd0ef434faa', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:29:15', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347e1968c004f', '82592460-483b-4874-b656-ff8a5f100651', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:29:16', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347e198e60050', '32a79d3c-c543-4f5f-a979-6d26731823ce', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:29:17', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347e1a01c0051', 'f21c4413-8d34-430e-8952-fb9f5d5f1f1e', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:29:18', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347e1a7d90052', 'c21efd7a-e336-4946-87f6-e9e6736e860e', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:29:20', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347e1a9cb0053', 'f824bf0f-b65c-4883-bc43-ffa64235ef08', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:29:21', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347e1aed90054', '60beabe5-feae-4939-8abf-f35ca866a843', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:29:22', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347e1b14d0055', '0a23f263-ba29-4da6-9c3c-8740e1e90cf7', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:29:23', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347e1b3330056', '631572a8-665c-4c20-8070-4d1a33ffa302', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:29:23', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347e1b7f10057', 'ea519a7f-49cb-46dc-9660-8b69cc922052', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:29:24', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347e1ba2c0058', '8151923e-4f8e-443a-b6c7-bc64c6a21ed5', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:29:25', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347e1bee50059', '96c71cb5-23ef-4a44-a105-378246dfda97', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:29:26', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f50f370079', 'b0e1a32e-431f-42f7-a1af-5d316210f465', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:50:32', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f51248007a', 'c698d39f-7591-4899-afd0-db6250e9cdbf', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:50:33', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f513af007b', '53d5a757-30f0-4a1b-a2c0-9599a9362c63', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:50:33', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f52d02007c', '5d5407c9-ea00-4d27-ba84-e863bb58308a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:50:40', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f52f3e007d', 'ec338c48-3d66-4ff1-84b4-1c711a656ed8', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:50:40', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f574c8007e', 'f5451328-911a-4d5c-a625-46378b9b2416', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:50:58', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f576fa007f', 'f5cb4b87-535b-45e9-96e4-b1ae997098f8', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:50:59', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f57a0a0080', '38f1bfc9-9b5b-4c33-b9ae-04a18c6b054d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:50:59', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f57b850081', '70c7e46c-12f1-41b6-9e79-690c03e34b17', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:51:00', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f594a20082', 'a36dd53b-2438-40df-a6fc-0c54319866ea', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:51:06', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f5a2170083', 'a065e12f-5871-49d4-b6a2-6edc16b5453b', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:51:10', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f5a90b0084', '79172f90-885d-4f5e-89ee-3c6a6cef87dd', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:51:11', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f5b8950085', 'aa215b0c-f794-4a80-a6ea-885c55d0a5c0', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:51:15', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f5c0060086', 'f1a7b6bc-ae11-4023-b0dc-fb85cb28e2b5', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:51:17', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f5c2600087', 'f233e4fd-e463-48f7-a0db-0598d48e905c', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:51:18', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f5c9970088', '4b4da5d9-e848-46d2-93b0-f64ce6661c74', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:51:20', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f5cbc90089', '7e198102-1ef4-41dc-9728-ae6865701cb3', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:51:20', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f5d2f7008a', '25e80a72-46d4-4bf6-aa42-1c7fb448de25', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:51:22', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f5d582008b', 'edc8e80a-921f-4daa-a163-68230ffe6670', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:51:23', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f61563008c', '24a40e39-7d6f-4680-aea1-9de5dafbd07b', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:51:39', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f61796008d', 'd20f8276-57f1-4e87-98c6-db192683d512', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:51:40', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f619b6008e', '449d6779-80b6-4366-bfa3-2f158ab18d9d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:51:40', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f7a86a0090', '2424b9bb-e325-4f71-8518-c4c7995a17a3', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:53:22', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f7aa280091', '159c3b15-6ef9-4c0e-a49a-41a408631c37', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:53:23', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881966347958e016347f7adee0092', '786d2eeb-a7a3-41bc-80cb-7873268696f1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-10 10:53:23', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881a4628f0e7b01628f1467ef0001', 'a855742b-b8e6-4636-b473-5dd630ce3816', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', 'USB100036', null, '2018-04-04 13:15:01', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881a4628f0e7b01628f1469d10002', '0777983e-cdac-48f2-adca-affa6fef3bcf', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', 'USB100036', null, '2018-04-04 13:15:02', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881a862eadfdb0162eae1482a0001', '923f9456-050a-4feb-9a4c-2774f3be66a3', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-04-22 09:04:14', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881a862eadfdb0162eaefe40c003e', '3e9eba64-4ea7-4882-aa6f-f21add0b69a2', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-04-22 09:20:12', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881a862eadfdb0162eaeff4af003f', 'f5982bc4-869f-4ab1-acf3-76ed038f99dd', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-04-22 09:20:16', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881a862eadfdb0162eaf021610040', 'db9b057d-186f-4fa5-a6d0-f31b77b8d7e2', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-04-22 09:20:28', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881a96339166c0163391895570002', '3087b2b6-7dc5-4d7d-ba48-430e7cc6d2dc', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-07 13:35:02', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881a96339166c0163394a8f930028', 'f5530b52-2481-4390-a4ad-9f42612895ff', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-07 14:29:37', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881a96339166c0163394a91bf0029', '69992f67-dcf3-4f06-bea2-3b1681812598', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-07 14:29:38', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881a96339166c0163394a9653002a', '079e149c-6a61-4749-8911-5e68f05c8442', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-07 14:29:39', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881a96339166c0163394a9d94002b', 'e617c5a8-9c9a-4ff9-ace8-688fee64b7d6', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-07 14:29:41', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('402881a96339166c0163394aae53002c', 'db40a1f8-69a6-4565-b3ef-4c960827c089', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '扫码枪', '6970427272004', null, '2018-05-07 14:29:45', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a12616402e501616410e89d0004', '90bfd9c9-560c-4439-81fe-67d1bc3ce222', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-05 11:44:45', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a12616402e50161641160c10005', '22204456-7168-494c-9045-2cc8290bf919', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272059', null, '2018-02-05 11:45:15', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261642eb201616434afb70001', '62a32ef6-82e8-417f-a69f-0de20fd47010', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-05 12:23:49', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261642eb201616434cab60002', 'cc197bf3-00de-4343-a530-a54f5c972edf', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-05 12:23:56', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261642eb20161645649c4003d', 'cb658d5b-092f-49ac-83e6-be277ea1a9ef', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-05 13:00:31', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261642eb201616457a9730044', 'c611887e-25ad-4933-8a2c-ee59431a0ddb', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-05 13:02:01', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261642eb201616457bb1e0045', '741fe0e9-5954-4268-a00d-68d64802e20f', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-05 13:02:06', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261642eb201616457c9ad0046', '608ba5f6-e05d-4d2b-b433-2dfea233d63d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-05 13:02:10', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261642eb201616457df420047', '30a180c3-5595-477e-b7cc-38d4978b1834', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272059', null, '2018-02-05 13:02:15', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec10161693363fc0000', '9445171a-cdf1-4c19-a464-ccc9c88a689a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-06 11:40:28', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec10161693396390001', '175d6fff-5fad-409f-bfc9-f70ee02e2eba', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272059', null, '2018-02-06 11:40:43', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec10161693cce21005c', '3d38bf26-bbf1-4cea-b185-0072fa363db4', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-06 11:50:47', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec10161693fa27700bd', '2e7161c6-ae19-43e1-bf25-8e9b094a3622', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272059', null, '2018-02-06 11:53:53', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec10161693fb03c00be', 'cefc831d-1b93-4839-94ca-bf978e6f99be', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272059', null, '2018-02-06 11:53:56', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec10161693fba1200bf', '0187d691-89b6-40f2-a954-26a568f3e4e9', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272059', null, '2018-02-06 11:53:59', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec10161693fc80d00c0', '5079b59c-279b-426b-871e-89eb15eb1074', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272059', null, '2018-02-06 11:54:02', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec10161693fcd0300c1', '2021e8e9-dab0-4089-92b6-9ec46160b0ca', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272059', null, '2018-02-06 11:54:04', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec10161693fdf2c00c2', '4ee6fbd0-fb43-442c-8e29-8d5b342c0993', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272059', null, '2018-02-06 11:54:08', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec10161693ff64000c3', 'e2650017-c1b8-495d-bf92-79b1d1b16720', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-06 11:54:14', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec1016169406e6300c4', 'fdfe8a08-e83c-435a-8625-2e3a9efaa508', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-06 11:54:45', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec10161694075cd00c5', 'f731b459-2603-4803-8895-8bc8a6a86482', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-06 11:54:47', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec1016169407ce500c6', 'a872f700-bd07-48c7-be12-6ebe5f45e226', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-06 11:54:49', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec101616940850700c7', '42d76c23-d3ed-4d77-aa58-d212f3f56a9f', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-06 11:54:51', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec1016169408b7800c8', 'a2be775c-82cf-421e-827d-e8668740ff07', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-06 11:54:53', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec101616940922700c9', '031b5449-78f1-49a9-b2de-46a25d1f87ac', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-06 11:54:54', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec101616940994700ca', '2e580382-00dc-444c-a2a7-8a29d520151b', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-06 11:54:56', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec101616940a1da00cb', '5437265c-59fe-44f9-ba12-a028e8102f6b', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-06 11:54:58', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec101616940a98e00cc', '3fea59ae-40f1-4beb-a430-0a2bd03d1dc8', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-06 11:55:00', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec101616940b2e600cd', '4a54bd37-c8dc-40af-bd2d-27939b3c21b4', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-06 11:55:03', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec101616946bff80120', '4518d18d-6ae6-4025-93ee-fc4296056ddc', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-06 12:01:39', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec10161694b860d0128', '9646f68d-330d-4893-97c4-85734a27f3bf', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-06 12:06:52', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a1261692ec10161694b99d60129', 'ff324b81-264a-4ccd-9c74-4f3a4bc0998d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-06 12:06:57', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a12616de60401616de893ed0004', '79432fa2-dbb1-4661-a052-7e8922f2f3ed', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272059', null, '2018-02-07 09:36:54', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a12616de60401616de9a4d2000d', 'd727f578-55ee-4c97-bb5a-0a2d3be690b3', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-07 09:38:03', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a12616de60401616e6868570053', 'b9d71866-babc-4240-92a6-22a65c22d1a2', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-07 11:56:31', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a12616de60401616e6870a10054', 'd01b383b-bc0b-41d4-9705-bf335972cf16', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-07 11:56:33', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a12616de60401616e688dfd0055', '74f7b09d-117f-43e7-8a20-bc42594e5553', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-07 11:56:41', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a12616de60401616e68a60e0056', 'b6f15df5-3336-43d6-a76b-cf0ab059399b', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-07 11:56:47', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a12616de60401616e6a6b65005e', '115240e8-ba0d-40c5-b68c-7dcd8ecfbb66', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-07 11:58:43', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a12616de60401616e6a772a005f', '5eacca96-fca5-4e0c-a8c1-669db5725080', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-07 11:58:46', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a12616ef51e01616ef799970004', '083715a9-fdd1-46b0-beb3-7e0e8fb731c8', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-07 14:32:55', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a12616ef51e01616ef7b1a50005', '012d3a54-8a78-461b-8ec0-e51441dba468', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-07 14:33:01', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a12616ef51e01616ef7bc840006', 'edebdde4-c395-4c37-891c-bb70176b0376', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-07 14:33:04', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a126178ad3801617a05c8d30019', '9d6a255f-0b72-4bb3-b219-52efa645281b', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272059', null, '2018-02-09 18:04:17', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a126178ad3801617a05de82001a', '203342a0-47df-4f9f-9563-2e8b795f355e', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272059', null, '2018-02-09 18:04:23', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a126178ad3801617a05f4a7001b', '51bdf898-eb2b-4346-a1e0-0112a4ca756a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-09 18:04:28', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a126178ad3801617a0730d90027', 'a1a6a808-f7a6-4cd1-a080-ebecbc054552', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-09 18:05:49', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a126178ad3801617a0738550028', '57288a46-8b15-406c-ba69-63b418fcf9f0', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-09 18:05:51', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a126178ad3801617a07585a0029', '31268108-23cf-495e-99b4-0db3003577d8', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272059', null, '2018-02-09 18:05:59', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a126178ad3801617a083c18002a', '99147798-2db4-4573-b34b-cfae179d9ebe', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-09 18:06:58', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a126178ad3801617a084cbf002b', 'b89d08a1-2ddf-4696-af3c-03518328d7dd', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-09 18:07:02', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a126178ad3801617a0b77100032', '06f9399f-6ae5-4560-9024-89d109d44a1a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-09 18:10:29', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a126178ad3801617a1aa389003a', '796feb85-94e7-4a06-817f-677353880896', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-09 18:27:03', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a126178ad3801617a1b5165004a', '98d40087-d3b4-45ca-9978-49d77e89c51a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272059', null, '2018-02-09 18:27:47', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a126178ad3801617a1b6541004b', '57b4d616-5ccc-49ff-b8d8-ea4ff0a69ee6', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272059', null, '2018-02-09 18:27:52', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a126178ad3801617a3bce8d0061', '9257a273-bce0-400c-a7db-10b65515a8e9', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272059', null, '2018-02-09 19:03:16', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a126178ad3801617d31b6a80149', '4585f306-08b4-4f31-b3bd-0923a23f8263', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-10 08:51:05', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a12617d3d9501617d421e940000', 'c0f80567-4439-479e-9bec-cb659cbfa0a8', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272059', null, '2018-02-10 09:09:03', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a12617d3d9501617d422bd70001', 'b847c722-f61e-4541-9c43-d5f700444e3c', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272059', null, '2018-02-10 09:09:08', null, null, null, null, null, null);
INSERT INTO `log_BoxingBizRecords` VALUES ('8a8a8a12617d3d9501617d4246ea0002', '77833239-b767-4469-bbd2-4cda7141fd82', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '电子秤', '6970427272004', null, '2018-02-10 09:09:15', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `log_ChopingBizRecords`
-- ----------------------------
DROP TABLE IF EXISTS `log_ChopingBizRecords`;
CREATE TABLE `log_ChopingBizRecords` (
  `id` varchar(32) NOT NULL,
  `serialNumber` varchar(255) DEFAULT NULL,
  `cardId` varchar(255) DEFAULT NULL,
  `personId` varchar(255) DEFAULT NULL,
  `personName` varchar(255) NOT NULL,
  `workGroupId` varchar(255) DEFAULT NULL,
  `workGroupName` varchar(255) DEFAULT NULL,
  `workCellId` varchar(255) DEFAULT NULL,
  `workCellName` varchar(255) DEFAULT NULL,
  `combineId` varchar(255) DEFAULT NULL,
  `combineName` varchar(255) DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `creatorId` varchar(32) DEFAULT NULL,
  `creatorName` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifer` varchar(255) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_ChopingBizRecords
-- ----------------------------
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e10c5d860021', '803bd37c-8218-464a-9e9f-a28d156bf265', '2531785', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:15:06', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e10c5f7d0022', 'b08f48e2-48a4-4885-9581-39a47e448760', '2531785', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:15:07', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e10c6e900024', '5ebfcf99-337d-4cf0-99f2-42379781f91f', '2540681', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:15:10', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e10c711a0025', '82ec97a2-e32e-4976-8e6a-4c6a955b8be6', '2540681', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:15:11', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e111d8c90057', '1778cf69-aa90-4c04-b2ea-4304b94711f7', '2569438', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:21:05', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e111db3c0058', '641bde85-7ac9-4732-a677-1e99aead1205', '2569438', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:21:06', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e111ddbb0059', '8da7d78e-bfeb-4107-9579-6c1a3191d6bd', '2569438', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:21:07', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e111e05a005a', '7dd6a24a-caf7-4e9e-837f-0f16b3a97241', '2569438', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:21:07', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e111e2c2005b', '135ae88d-d5c3-444c-b116-00dd05269372', '2569438', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:21:08', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e1bed41d00ad', '1475be46-ba8a-45ea-9418-a14316216d89', '2961624656', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:30:02', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e1c2c5f200bc', '39bc2adc-9117-4a39-a37f-be50aeb115c6', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:34:20', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e1c2c8b900bd', '4f4e1b03-bde6-4416-b7bb-15b8b22abc7c', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:34:21', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e1c2cb3a00be', '9d43f36d-8232-41d5-bc05-d0e81ff07950', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:34:22', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e1c2d02500bf', 'f6640575-2cf0-490c-b9f9-f6dc46e7491d', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:34:23', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e1c2d28200c0', 'ffe76b31-878d-4a6d-ac63-78b23442ab49', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:34:24', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e1c2d51600c1', '5180ad6f-fbb8-4eb6-b93b-5c0d50cc4254', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:34:24', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e1c2d76200c2', 'd2013144-805e-4ef3-9f14-28bd38b9be8a', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:34:25', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e1cb006200da', '7092020b-c74d-49c4-a367-83155b63719a', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:43:20', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e1cc842e00db', '56c0a197-8308-4f6b-ae53-2eeb6d166376', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:44:59', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e1cc891d00dc', '0612e0d3-0566-4802-966d-cee0349ac143', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:45:00', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e1d222b500dd', '1ab91c21-2b46-4477-9d00-4ac089923215', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:51:07', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e1d2252600de', '444d3104-0181-4c49-ba25-ec76e21e6a1f', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:51:08', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e1d5e5b000df', '08e03179-5821-4cac-aa7a-eae72ce1b4ef', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:55:14', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('4028811962e106430162e1d60adf00e0', 'ac1533e4-1cd6-42e9-9de8-969324638744', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:55:23', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881966347958e016347996c4e0002', 'e1ad7de4-a959-4be8-847d-c41cc024c1b9', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 09:10:26', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881966347958e016347996efe0003', '37538a80-5dc5-462f-bb27-fa9996fa597d', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 09:10:27', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881966347958e0163479977060004', '2709e1c5-4dec-4c53-9d48-9d2fce35fd94', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 09:10:28', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881966347958e01634799790a0005', '91d2da78-f148-40a3-aa9a-4db31668b388', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 09:10:30', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881966347958e016347997a8e0006', 'f0d21f65-b735-4c5b-a2fe-65d608982559', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 09:10:30', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881966347958e0163479981cf0007', '32cca4f8-2e92-4386-af6e-fd6cf57225a8', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 09:10:31', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881966347958e0163479984500008', 'f608644e-5d8a-448e-85e5-06d88bb0aa15', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 09:10:32', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881966347958e0163479991fa0009', 'c8341c5f-650f-4a0b-a91a-2dd345d106ff', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 09:10:36', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881966347958e016347999513000a', '70b75bdf-40ce-4fce-90f1-2d43e3b75b3d', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 09:10:37', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881966347958e016347999811000b', 'e7f7223e-510f-4cc6-912b-f3c3bece47f1', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 09:10:37', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881966347958e016347999a97000c', 'fefc1166-6165-4887-9b5b-12475dd219f0', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 09:10:38', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881966347958e016347999e9f000d', '5bea7af1-a0cf-4706-94b4-3b1461dfb171', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 09:10:39', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881966347958e016347df389a0040', 'a0dead47-baef-4c60-891a-4a4d2c0dec03', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:26:41', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881966347958e016347df3b250041', '77203138-8030-40e1-b761-7546cc37ebdb', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:26:41', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881966347958e016347e047180042', 'b5fa88c6-0364-4db2-88f1-93b09383777f', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:27:50', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881966347958e016347e049a90043', '73d0c35f-2b74-483c-ac62-2680e1176095', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:27:51', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881966347958e016347e04c7b0044', '5f47c61a-3861-4562-a4ed-2d017fb8ad23', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:27:51', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881966347958e016347e0567f0045', 'eaf4877d-ac26-4778-afa9-429ec3a09046', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:27:54', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a4628e92d001628ef31f12000d', '257d6fe2-e02b-4eda-acb8-f690adaf5d84', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-04 12:38:40', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a4628f0e7b01628f1574230011', 'ec374ac4-dc6d-42b5-a3d8-777b1d97cb64', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-04 13:16:10', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a4628f0e7b01628f1588da0012', '91b8efbd-76aa-43ad-a709-48e1de59d77c', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-04 13:16:15', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a4628f0e7b01628f1593700013', '71230f8d-274d-468b-9288-0d3eeadc7ee3', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-04 13:16:18', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a4628f0e7b01628f200d8e0014', '2224c424-d464-417e-827d-c4d29b2e8073', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-04 13:27:45', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a862eadfdb0162eae2190b0011', 'cf2de69f-157d-4e89-8a8f-488989b603e5', '2560603', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:05:08', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a862eadfdb0162eae228280012', '3580b6c7-a3c6-439b-ac71-c7a36b507841', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:05:12', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a862eadfdb0162eae22add0013', '0b72e452-00b7-470c-9e59-7fac67c6b456', '2560603', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:05:13', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a862eadfdb0162eaed54b30022', '46b0cac1-aa14-4426-9345-96a29bc36e6e', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:24', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a862eadfdb0162eaed57520023', 'ffec93f0-3676-4c79-b45b-f60af490bda6', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:25', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a862eadfdb0162eaed59ed0024', 'cc608ad2-51f2-4bae-b13f-e3d110a1d199', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:26', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a862eadfdb0162eaed5c350025', '12e52c1f-7dd3-4d5c-aab8-0e134b8db643', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:26', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a862eadfdb0162eaed5edf0026', '3ee34498-997b-4762-a046-8ea01db14353', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:27', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a862eadfdb0162eaed613a0027', '1df9620d-062e-4874-97bc-45a597981462', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:28', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a862eadfdb0162eaed63e70028', 'fe07be7c-5a49-42ed-aac1-8f1ff814b28b', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:28', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a862eadfdb0162eaed66460029', '1de21a02-aef1-45bc-9112-ddfd70e21a1c', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:29', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a862eadfdb0162eaed6901002a', 'e9ded10d-3003-41e2-80eb-6e24d2ed877e', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:30', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a862eadfdb0162eaed6b4d002b', '56908b6a-17ea-467d-8fbb-4b74b41024ff', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:30', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a862eadfdb0162eaed6dd4002c', 'd3b74787-6fba-49e4-8e61-e76b91579738', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:31', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a862eadfdb0162eaed704b002d', '9dc5e4ec-01b2-4af5-a65a-c300e89c0a93', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:31', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a862eadfdb0162eaed72cc002e', '34ea80f3-dde2-42f9-ad09-45360d0863bd', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:32', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a862eadfdb0162eaed7593002f', 'd69989e9-e3ff-460d-b1d9-47a99cf1b67e', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:33', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a862eadfdb0162eaed77e00030', '288880d1-c9de-4bab-8d85-7498056e76a5', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:33', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a96339166c0163391a2da8000f', '3df3cfb8-3fea-4702-8f42-75bb471dfb8d', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 13:36:46', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a96339166c0163391a30ef0010', '46bb4013-bad5-4607-b630-181a30f5241a', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 13:36:47', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a96339166c0163391a33f00011', '373066fc-db9c-4dd9-b839-5490a2398cf1', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 13:36:48', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a96339166c0163391a3bb70012', 'ee69882e-fb49-46ee-8157-6b0786a42a76', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 13:36:50', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a96339166c0163391a40ae0013', '63e54092-c025-495d-8e75-9aab5816fe26', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 13:36:51', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a96339166c01633949dd120024', '0e86d8c9-7070-4795-abd5-3aefc3477b8c', '2584945', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 14:28:51', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a96339166c01633949f3070025', 'de08361c-9b93-4179-9410-fdc2a3b6509b', '2584945', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 14:28:57', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a96339166c01633949f58e0026', '40cf02c5-eaab-4c9d-ae21-4d339d78334e', '2584945', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 14:28:58', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('402881a96339166c0163394a04c20027', '9fc8ba12-53f8-45a8-ab71-ba6c7a5e457f', '2560603', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '切段', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 14:29:02', null, null, null, null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('8a11c48c61413e5d01614144d95504e2', '12', '123', '1455', '1569', '2333', '126592', '3364', '65656', '5666', '5686', '2', 'pian', '2018-01-26 00:00:00', '8a11c2d06121d76d016121de297500de', '系统管理员', '2018-01-29 17:34:46', null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('8a11c48c61413e5d01614145dc4804e4', '1', '1', '1', '1', '33', '133', '33', '333', '1333', '3333', '33', '1333', '2018-01-23 00:00:00', '8a11c2d06121d76d016121de297500de', '系统管理员', '2018-01-29 17:35:52', '系统管理员', '2018-01-29 17:36:39', null);
INSERT INTO `log_ChopingBizRecords` VALUES ('8a11c48c61413e5d01614148022504e6', '1111 ', '1111', '1111', '1111', '1111', '1111', '1111', '1111', '1111', '1111', '1111', '1111', '2018-01-18 00:00:00', '8a11c2d06121d76d016121de297500de', '系统管理员', '2018-01-29 17:38:13', null, null, null);
INSERT INTO `log_ChopingBizRecords` VALUES ('8a11c48c61413e5d01614148fa4a04e7', '1110', '1110', '1110', '1110', '1110', '1110', '1110', '1110', '110', '110', '1', '1', '2018-01-29 00:00:00', '8a11c2d06121d76d016121de297500de', '系统管理员', '2018-01-29 17:39:16', '系统管理员', '2018-01-29 17:43:50', null);
INSERT INTO `log_ChopingBizRecords` VALUES ('8a11c48c614149950161414b54280000', '33', '333', '33', '33', '33', '33', '333', '333', '33', '33', '5', 'kg', '2018-01-15 00:00:00', '8a11c2d06121d76d016121de297500de', '系统管理员', '2018-01-29 17:41:51', null, null, null);

-- ----------------------------
-- Table structure for `log_CutPieceBizRecords`
-- ----------------------------
DROP TABLE IF EXISTS `log_CutPieceBizRecords`;
CREATE TABLE `log_CutPieceBizRecords` (
  `id` varchar(32) NOT NULL,
  `serialNumber` varchar(255) DEFAULT NULL,
  `cardId` varchar(255) DEFAULT NULL,
  `personId` varchar(255) DEFAULT NULL,
  `personName` varchar(255) NOT NULL,
  `workGroupId` varchar(255) DEFAULT NULL,
  `workGroupName` varchar(255) DEFAULT NULL,
  `workCellId` varchar(255) DEFAULT NULL,
  `workCellName` varchar(255) DEFAULT NULL,
  `combineId` varchar(255) DEFAULT NULL,
  `combineName` varchar(255) DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `creatorId` varchar(32) DEFAULT NULL,
  `creatorName` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifer` varchar(255) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_CutPieceBizRecords
-- ----------------------------
INSERT INTO `log_CutPieceBizRecords` VALUES ('', null, null, null, '', null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('1', null, null, null, '', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e109ab490001', '43c394be-be4e-48b4-b9b8-48780b60931e', '2584945', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:12:09', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e10a4d8d0002', 'e4ba37e1-b7ff-4891-94de-fb0f4bdb6f5f', '2584945', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:12:50', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e10a50600003', '6d58ac93-7067-4135-a2ed-625952309277', '2584945', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:12:51', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e10a53160004', '3311055a-07fb-483a-ab95-dc380f9a5d8d', '2584945', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:12:52', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e10a557b0005', 'af8af9a1-7d92-460c-81af-60e388262fb3', '2584945', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:12:53', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e10a70970006', 'f7629585-80dc-43c7-be96-cad88e84b3f7', '2584945', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:13:00', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e10a72f00007', '0c49ba89-c629-4451-b050-786b62e79239', '2584945', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:13:00', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e10a762f0008', 'a6e7830d-0209-47b2-a94c-5cf54de25949', '2584945', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:13:01', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e10a77e20009', '0e462289-3b29-44df-8748-c46f756ce6cc', '2584945', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:13:02', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e1118da1004d', '652c4872-506b-4931-994a-6c86e972ab0d', '2569438', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:20:46', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e1119012004e', 'f7310820-fef8-44e1-931b-bd882ca230a5', '2569438', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:20:47', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e1119294004f', 'a059a016-f8e1-4217-9288-7e0c2ab6515a', '2569438', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:20:47', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e11195380050', 'c0a98b05-1340-4630-a393-41ba009121f3', '2569438', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:20:48', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e11197750051', '8fe7e40a-d658-474f-9cc6-623e0b6144f2', '2569438', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:20:49', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e113a1b6006c', '12583cd2-bc90-49f9-b9a2-9af122f5cbb9', '2560603', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:23:02', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e113a449006d', '6fb23c62-2851-4a3a-b994-baef5375afe1', '2560603', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:23:03', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e113a687006e', '0eba1a3d-6919-460a-8172-51c10e114837', '2560603', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:23:04', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e113a93b006f', 'f15f9992-6a0d-48b2-bb7e-182ddb8cb78e', '2560603', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:23:04', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e113abdb0070', '260bd2ce-3081-46e4-a7f5-c711dd4a24ab', '2560603', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:23:05', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e113ae500071', '05b2d400-6773-4a1c-a416-3d13de5bd458', '2560603', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:23:06', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e113b0d60072', 'b7eff184-3030-4b63-add0-68fdbbc56b02', '2560603', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:23:06', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e113b3520073', 'e48a96ad-e2ee-4c0a-aa5c-c6f477fe617a', '2560603', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:23:07', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e114300c0078', 'a9f62fc5-1dc4-4fcd-a178-d66908a4b91d', '2559207', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:23:39', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e11432cb0079', 'dbe72411-13a8-4525-bb0e-a188ac9209f4', '2559207', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:23:39', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e1143551007a', '86e56a9e-7fe1-468d-8213-9369700a9cb1', '2559207', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:23:40', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e11437f0007b', 'aef567f4-bc33-4bd6-8646-9c4b04f424a3', '2559207', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:23:41', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e1be8744009f', '584fa09a-f99f-4698-803c-e1b59f071e65', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:29:42', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e1be8bf600a0', 'b5ef2429-a211-4691-8012-c8b872e4e442', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:29:43', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e1be8e7500a1', '7b32e1aa-8744-4ff2-9da3-09d1321ed204', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:29:44', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e1be93c900a2', 'a64e3594-2d5c-43e1-a0f2-012d383df56c', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:29:45', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e1be962600a3', '265bccf0-cb9b-4963-9f4b-1d3d26c080ea', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:29:46', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e1be987b00a4', 'cb1cf73b-5ac3-4f83-b934-8cf37d336b04', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:29:47', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e1beb92e00a5', 'c6af1c57-e16d-420d-8251-cf621afc0a58', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:29:55', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e1bebb4c00a6', '8556a53a-df69-4b7f-8f87-1deedfd3914b', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:29:56', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e1bebe4200a7', '1c040705-ed87-4e13-8aa2-1f330068c74c', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:29:56', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e1bec0c400a8', 'e84a5e38-e9c9-4bc9-9029-1df6091186d4', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:29:57', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e1bec37c00a9', 'a3cec515-939b-4d82-9538-b327f903b43a', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:29:58', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e1bec63900aa', 'dd8cfd2b-ee5b-48e3-8491-653a9a5c3b41', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:29:58', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e1bec89c00ab', '5f50c23f-fc1e-4a1e-888e-378efa2a6ae4', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:29:59', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e1becaf300ac', '0c33db1d-679a-4c1e-b78f-757fc3864b0c', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:30:00', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('4028811962e106430162e1c8322100d9', '21c8d0ac-9745-476c-a2ec-23bad357601a', '4227883836', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:40:16', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e0163479ade800029', '675ee58f-cf13-49e6-93f8-ccd0b264943a', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 09:12:01', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e0163479ae187002a', '51c6e80f-cc9d-43e7-9c7f-f827d1c0ccef', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 09:12:02', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e016347dd9f880034', '876b6a43-a813-4439-89a5-7d6dcaa1ccf6', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:24:56', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e016347dda9780035', '2116234b-10ba-40a2-a31c-b6d9ab4e1a4a', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:24:59', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e016347ddaece0036', 'f2356457-cf32-4686-a95a-29ad007b83b3', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:25:00', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e016347dde96f0037', 'ea08827f-ccbb-402e-8e81-e73700f52b00', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:25:15', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e016347ddec240038', '8429e12f-d364-4a72-872f-048cfdc908af', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:25:16', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e016347ddeeff0039', '96dca18f-c7b8-4b83-8658-967fb0ee03ed', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:25:16', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e016347de05d6003a', '3198ccd7-d894-4a4a-ae26-03ff5aadf46f', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:25:22', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e016347de08cb003b', 'ab1c8c1f-59de-4b26-8a36-c5313430ccd7', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:25:23', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e016347de202f003c', 'c53386b9-a4a9-4687-918e-68e2f2e0c565', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:25:29', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e016347f05da10067', '507e3a55-a0c2-449f-b15f-7bfb43b322cb', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:45:24', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e016347f060190068', '35cb84c8-2e17-47e3-8d96-c5b3852391e3', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:45:25', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e016347f06a670069', 'f2cb58cd-6776-49ff-8cea-0d703a53c66f', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:45:28', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e016347f0893a006a', 'bacbf466-f43a-4af6-aa50-4a9d9e5497de', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:45:36', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e016347f099d5006b', '5843918a-fb3b-4f29-b6e0-b4ec58ee1e6c', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:45:39', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e016347f0b50b006c', '5e344ef2-989a-4567-a021-121b41b790e7', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:45:47', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e016347f0b7e5006d', '0580e54b-fc4a-4506-a7bb-5112094df0b1', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:45:48', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e016347f0c78b006e', '75b11d3c-2fe7-4e56-b930-54dfe93eea5e', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:45:52', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881966347958e016347f0cf6c006f', '9f2dcbbc-78a0-4306-a52e-8240ce20bbb6', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:45:53', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881a4628e92d001628ef5a8b2000f', 'e78db389-aac1-46b7-8660-57ceea41806c', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-04 12:41:26', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881a4628f0e7b01628f1505d80009', 'e4f0bf67-1219-451b-8db8-09b404225d3c', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-04 13:15:42', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881a4628f0e7b01628f151d81000a', '68e159c9-767d-4192-a065-c55cfb7f87b2', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-04 13:15:48', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881a862eadfdb0162eae1ac770007', '6137e286-786e-4540-8f2b-810ab51ee101', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:04:40', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881a862eadfdb0162eae1b66e0008', 'b63c59cb-3252-4fb7-8be7-3cf1137a1bc4', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:04:43', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881a862eadfdb0162eaebfdab0017', '5a955b5b-1b5a-4757-ae96-e12b6de33f1d', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:15:57', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881a862eadfdb0162eaec07930018', 'dc0c93cf-16a4-4381-991b-78648c460dd2', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:15:59', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881a862eadfdb0162eaec32630019', 'da3f4584-a748-4de0-b182-40c70d775089', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:16:10', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881a862eadfdb0162eaec3c4c001a', 'fb5c73dc-6ca6-4129-b836-37b52843e23f', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:16:13', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881a96339166c0163391867a80001', '300fe05d-058a-4247-b78a-6e235cac6af7', '1086399392', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 13:34:50', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881a96339166c01633919ecfd000a', 'c42c9bd9-43c2-4373-a66d-541f22b0cb7d', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 13:36:29', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881a96339166c01633919f9e0000b', '734cdc3e-9559-4033-9a10-b9a2e7f3044d', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 13:36:33', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881a96339166c016339484d51001c', 'f646c5d2-bbf0-460f-81a3-2e8ecee9bd19', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 14:27:09', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881a96339166c016339487072001d', '355b2f0b-bfa9-481d-bb71-35806d9dd80e', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 14:27:18', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881a96339166c016339487a37001e', 'f047d155-0bc6-457c-ac4f-fa20a74aaad0', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 14:27:21', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('402881a96339166c0163394883ef001f', '57748f87-4001-408e-912d-0f6566fc47a4', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '开片', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 14:27:23', null, null, null, null, null, null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('8a11c48c6140ca17016140d4a9c10003', '1', '2569319', '1', '11', '11', '1', '1', '11222', '11122', '11112222', '1', '1', '2018-01-29 00:00:00', '8a11c2d06121d76d016121de297500de', '系统管理员', '2018-01-29 15:32:14', '系统管理员', '2018-01-29 15:51:44', null);
INSERT INTO `log_CutPieceBizRecords` VALUES ('8a11c48c6140da6d016140e749500000', '23', '2569319', '3', '3', '333', '33', '333', '22', '3', '3', '1', '3', '2018-01-29 00:00:00', '8a11c2d06121d76d016121de297500de', '系统管理员', '2018-01-29 15:52:34', '系统管理员', '2018-01-29 15:52:49', null);

-- ----------------------------
-- Table structure for `log_DecaptitatingBizRecords`
-- ----------------------------
DROP TABLE IF EXISTS `log_DecaptitatingBizRecords`;
CREATE TABLE `log_DecaptitatingBizRecords` (
  `id` varchar(32) NOT NULL,
  `serialNumber` varchar(255) DEFAULT NULL,
  `cardId` varchar(255) DEFAULT NULL,
  `personId` varchar(255) DEFAULT NULL,
  `personName` varchar(255) NOT NULL,
  `workGroupId` varchar(255) DEFAULT NULL,
  `workGroupName` varchar(255) DEFAULT NULL,
  `workCellId` varchar(255) DEFAULT NULL,
  `workCellName` varchar(255) DEFAULT NULL,
  `combineId` varchar(255) DEFAULT NULL,
  `combineName` varchar(255) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `creatorId` varchar(32) DEFAULT NULL,
  `creatorName` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifer` varchar(255) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_DecaptitatingBizRecords
-- ----------------------------
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('2569319', '537c15f9-6793-4ea3-8c39-4c636effeeeb', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 08:00:00', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('4028811962e106430162e10a83bd000c', '659866bb-4ca2-4844-80bc-42da3ad7e995', '2540681', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '90.75', '公斤', '2018-04-20 11:13:04', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('4028811962e106430162e10af029000f', '72155b9e-7866-4120-a6c8-6830b4386ebf', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '91.02', '公斤', '2018-04-20 11:13:32', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('4028811962e106430162e10b11290012', '79fcb7e7-6e66-4a70-8604-ef88347a1c83', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '91.26', '公斤', '2018-04-20 11:13:41', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('4028811962e106430162e10b22a90015', '7f1c8a4a-233e-40c1-89d7-2e278ef6d6ab', '2540681', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '91.01', '公斤', '2018-04-20 11:13:45', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('4028811962e106430162e10bd4080018', '7a032186-c536-4615-bb52-7d697d6143aa', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '83.64', '公斤', '2018-04-20 11:14:31', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('4028811962e106430162e10bf906001b', 'c95e36f8-3bba-48a4-9239-5390123fbe8e', '2531785', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '90.2', '公斤', '2018-04-20 11:14:40', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('4028811962e106430162e10c391a001e', 'f8b2a765-0f48-4499-a779-1449f87e64ee', '2531772', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '71.87', '公斤', '2018-04-20 11:14:57', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('4028811962e106430162e112fc6a0064', '58f41c2c-dc5b-4129-ab07-024cc8e5ca58', '2560603', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '90.82', '公斤', '2018-04-20 11:22:20', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('4028811962e106430162e11310730067', 'ee2eda60-3d21-4136-88ce-4d5441cfae2f', '2560603', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '90.82', '公斤', '2018-04-20 11:22:25', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('4028811962e106430162e113270c006a', '1f47d2bf-7dd3-4a16-bd3a-34aae75b799b', '2560603', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '90.77', '公斤', '2018-04-20 11:22:31', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('4028811962e106430162e1142e5f0077', '00ecb1fb-0364-40ff-9571-d6aadb17b149', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.27', '公斤', '2018-04-20 11:23:38', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('4028811962e106430162e1144a96007e', 'b0a3adc3-976b-44be-9321-71dde302c20c', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '91', '公斤', '2018-04-20 11:23:45', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('4028811962e106430162e11548fc0084', 'f41316e4-b7b7-4595-862c-d8bce291dd08', '2560603', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '-0.09', '公斤', '2018-04-20 11:24:51', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('4028811962e106430162e1bce419009b', '92b6a556-f429-4d6c-8579-144c006a5300', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '94.35', '公斤', '2018-04-20 14:27:55', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('4028811962e106430162e1bd388c009e', '81533694-ce93-414a-a385-a046e973569d', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '93.12', '公斤', '2018-04-20 14:28:16', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('402881966347958e0163479ab9bc0025', 'f9918cb8-7dbd-4a29-9e87-af6681656a7f', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '95.42', '公斤', '2018-05-10 09:11:51', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('402881966347958e016347db54c10030', '23bf3a75-aa3f-4f2e-9709-4d83c27a9afb', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '66.91', '公斤', '2018-05-10 10:22:26', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('402881966347958e016347dccf5a0033', 'ca873f84-ca33-41b3-b465-8312070184fc', '2549137', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '95.17', '公斤', '2018-05-10 10:24:03', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('402881966347958e016347eab587005c', '4291c988-3697-42fd-9f60-cbe51a996cb1', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '46.27', '公斤', '2018-05-10 10:39:13', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('402881966347958e016347ead920005f', 'c0276816-800b-4f53-84e2-4fbaf62b57f4', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '64.53', '公斤', '2018-05-10 10:39:23', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('402881966347958e016347eb2dd20063', 'ffed5ff1-1cb6-4829-b617-f23fbb7a6cf6', '2560603', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '61.95', '公斤', '2018-05-10 10:39:44', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('402881966347958e016347ef97c50066', '1f9e11cb-7bb9-4b42-a3b9-e77715140ffc', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '71.72', '公斤', '2018-05-10 10:44:34', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('402881a4628e92d001628eeb18f40003', 'd75759cd-8e26-479e-8610-8843101df66c', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.53', '公斤', '2018-04-04 12:29:53', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('402881a4628e92d001628ef6c84d001d', '60ddf1f0-90f9-47cb-8072-4a0b3501642c', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.53', '公斤', '2018-04-04 12:42:40', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('402881a4628e92d001628ef6d7f60020', '026f2bde-eb3c-4a6b-9f73-542790a0b223', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.53', '公斤', '2018-04-04 12:42:44', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('402881a4628f0e7b01628f14cbbe0005', '7411053e-b52a-42d2-96ca-b9550a0587d6', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.53', '公斤', '2018-04-04 13:15:26', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('402881a4628f0e7b01628f14e83a0008', 'ea5c02bc-022c-4b10-b969-f06f8d1476b2', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.53', '公斤', '2018-04-04 13:15:34', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('402881a862eadfdb0162eae153070004', 'ec3390d1-f4b0-4287-bdfb-0bc04519cab2', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '72.98', '公斤', '2018-04-22 09:04:17', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('402881a862eadfdb0162eaeb18350016', '6405f163-9130-447d-96c5-54f81f23f858', '2560603', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '66.99', '公斤', '2018-04-22 09:14:58', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('402881a96339166c0163391960150006', 'd6c1d9a0-e9bc-4675-a0da-44848042ca90', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '94.67', '公斤', '2018-05-07 13:35:53', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('402881a96339166c01633919ad140009', '8fd7376e-d48a-41df-b876-920fb16103d4', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '91.04', '公斤', '2018-05-07 13:36:12', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('402881a96339166c01633947c1300018', 'ba3416ca-13a9-4a51-8ff9-68e00359ae65', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '94.52', '公斤', '2018-05-07 14:26:33', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('402881a96339166c01633947e90d001b', '112691ff-c3f6-43e4-a4d9-94580b2c095a', '2560603', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '去头', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '93.23', '公斤', '2018-05-07 14:26:43', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('40288a2761592efe016159608d7c0020', 'd465adba-04e5-41b3-ae97-1e9bae20e084', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 09:55:38', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('40288a2761592efe0161596780d10023', 'c2e0390d-02b8-44d6-9b38-0ded61f89591', '1056970111', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 10:00:04', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('40288a2761592efe0161596792f20026', 'e240736c-d93a-4b96-910f-436f8da1aeab', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 10:03:16', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('40288a2761592efe01615967a51c0029', 'b3f3acc1-7ea7-4806-be58-4092c9b758da', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 10:03:39', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('40288a2761592efe01615967af14002c', 'ddc8ddfa-83d3-4b58-8d07-a6cf42447dae', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 10:03:42', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('40288a2761592efe0161596fe078002f', '6c780ca9-561e-4b01-a6e2-0c4b723cb905', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 10:12:38', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('40288a2761592efe01615972d6de0032', '25123f57-63e4-47f4-8526-da61703cfb4e', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 10:15:53', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('40288a2761592efe01615973028b0035', '53e12193-ea08-406c-8522-11430eae274a', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 10:16:04', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('40288a2761592efe01615973133d0038', '99f49e88-ff00-424a-8647-011883539835', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 10:16:09', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('40288a2761592efe0161597bd35a003b', '02cc7d50-e2bb-457b-8652-ae994c95bb43', '1218445315', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 10:25:42', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('40288a2761592efe01615a4eaf18003e', 'd536d621-b334-475b-a8de-3a544b3430c0', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 14:16:00', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('40288a2761592efe01615a4ec1940041', '65f96814-a85f-4065-bcaa-3feeddc9241b', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-03 14:16:06', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12615b15f901615b1f088e0002', '8e279e2f-aecd-4b21-8c98-78a6e4ccb16f', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 18:03:25', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12615b15f901615b1f13a00005', 'c6bcebf4-171f-4c67-a7ca-4fda304d8280', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 18:03:38', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12615b15f901615b1f1a9a0008', '06b69439-8567-4e0a-90bc-f9c22cde87af', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 18:03:40', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12615b15f901615b1f24a6000b', 'c4901b33-9aeb-4fb7-97f3-cb2b1e8fa15e', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-03 18:03:42', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12615b15f901615b1f2f01000e', 'c8dccc91-30d7-45f6-b605-b4d38336ec09', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-03 18:03:45', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12615b15f901615b1f7fe20011', '0b0d86fb-9785-485d-aecb-8378ff660336', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-03 18:04:06', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12615b15f901615b1fa0420014', '7fd89508-eff7-4d6c-adf3-6c2e4c56b567', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '95.6', '公斤', '2018-02-03 18:04:14', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12615b15f901615b1fae960017', '11e537d9-7cdf-4b65-8267-c08c8f7f620e', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '95.97', '公斤', '2018-02-03 18:04:18', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12615b15f901615b1fb0b9001a', '06c49962-80a3-465c-a37c-cc4c3f2d9001', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '95.19', '公斤', '2018-02-03 18:04:18', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12615b15f901615b1fb243001d', '99bb9eaa-9f87-4724-8f04-6663ec5d1744', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '95.89', '公斤', '2018-02-03 18:04:19', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12615b15f901615b1fda580020', '472a1b37-bcc3-4ed5-937a-dfbe5c39299c', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '95.9', '公斤', '2018-02-03 18:04:29', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12615b15f901615b211bf10023', '823f2585-aac9-4adb-a32e-9adac5dfe06a', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-03 18:05:51', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12615b15f901615b2127640026', '742922a3-a73f-466e-bee0-a8b0e55afd98', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 18:05:54', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12615b15f901615b2221380029', '66aee7aa-dc7c-4446-a58e-3e6aac7b7ffa', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 18:06:58', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12615b15f901615b22233d002c', 'f8350f57-234e-4560-8e02-c6462b18f164', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 18:06:59', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12615b15f901615b222844002f', '179f77e0-48c7-4235-ab87-53355418274d', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 18:07:00', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12615b15f901615b222edd0032', 'efb96ac8-e4dc-42ac-a3f8-b332a753a82d', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 18:07:02', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12615b15f901615b2234860035', '5cb63a60-287d-4574-bd85-f84e6ec7974b', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-03 18:07:03', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12615b15f901615b223c9a0038', '16148d58-baa7-45ff-a41f-a92319253554', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-03 18:07:05', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261639f01016163bd1f300002', 'c4a41932-f2bb-4103-8741-730c6aa44ec8', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-05 10:13:13', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261639f01016163bd35f10005', 'caf8df34-d095-400a-a698-3b3f13f7bf54', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-05 10:13:19', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261639f01016163c24c260008', '9ba7dab6-86e2-403b-9a63-ac3c096266a7', '3487184384', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-05 10:18:53', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261639f01016163de466a000b', 'ea28c627-b2d3-4133-b122-2d7a1d6ff3ff', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 10:49:26', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb201616434f6780005', '74027083-b908-4e26-a2f3-e6a2bc2562fb', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 12:24:07', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb2016164350b5d0008', '289f1e32-b18b-4fba-9c64-1bc5732e3fcb', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 12:24:12', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb2016164388432000b', 'f70d19ff-6ae2-47cb-96e3-6c60f481680c', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 12:28:00', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161643a3bbc0016', '29b8fcf1-b2e7-425c-a5dd-65e10254fa8a', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 12:29:53', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161643a54480019', '1e6c715f-7994-46f7-a5f0-89e6d1c31c8e', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 12:29:59', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161643a6dde001c', '77f7b03c-79e4-469f-845d-4007547f338c', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 12:30:06', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161643a8464001f', 'ff76d944-c4bb-48e6-b87f-c5026fae05b6', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 12:30:11', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161643a96dc0022', '61fcca2b-837d-4fcd-bf77-d9e5f749bb0b', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 12:30:16', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161643aae9f0025', '389d461d-4a2b-4985-b103-ee6203fb7a53', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 12:30:22', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb2016164557b80002c', 'be36d836-1239-4556-9d41-202d2759a498', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 12:59:38', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb2016164559452002f', '0b7c5219-83e4-4e40-a682-a2ca28fc644f', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 12:59:45', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb201616455ab090032', '39e6a32e-195b-4248-af6b-84e0066d73fa', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 12:59:51', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb201616455c9d30035', '3d71074b-850e-4980-badc-2f940d767e40', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 12:59:59', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb2016164571f840040', '265dd4a7-712c-401e-b3e7-cf80fa55d111', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 13:01:26', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb2016164572ba50043', 'f1846b00-33ba-4a83-a453-045989fd21a6', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 13:01:29', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645862b60056', 'bc7312cf-daa7-4c7b-a0cf-bf07282fa1d9', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 13:02:49', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645878100059', 'c3cc202e-d88b-40d9-b344-64806a8a8715', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 13:02:54', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb201616458a3a1005c', 'ba030d7c-0b36-4c7b-9b65-2500bfb48181', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 13:03:05', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb201616458be5b005f', '74f90809-6150-4ba1-8ec9-1c186a3368f2', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 13:03:12', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb201616458ee300062', 'fa8d3f49-0b35-46de-b81a-691de6dd85ee', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 13:03:24', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb2016164598bc90065', '6adfe1a8-f156-40f8-ac3e-47f003c275c8', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:05', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb201616459d88a0068', 'bf0db400-cb79-4e5e-b8b2-cb8274e64ba0', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:25', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb201616459ea06006b', 'df2418a0-a461-44b0-97d1-7568862daef3', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:29', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb201616459ecd2006e', 'dee4c9ae-c7aa-4d3f-834c-3b0a702d5608', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:30', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb201616459f7f20071', 'c9f50e02-83f8-45a9-b230-6fe4cd4dc611', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:32', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb201616459fabd0074', 'ccee73f7-a946-4673-a084-c40c52420e70', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:33', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a00eb0077', '86dfc02f-efd1-4a81-9ece-efc7926dd501', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:35', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a02fb007a', '1ef3b379-8b6b-44f4-9257-f667a34e0e28', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:35', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a157d007d', '7c454e32-3959-4b0a-b138-ae0d529bdeb4', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:40', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a1ea30080', '4f18429d-e9ef-416b-96f6-0897aa6bd226', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:42', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a27150083', '0c11fd30-6f6a-4790-8dc2-3a2e600ae4fb', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:45', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a2e830086', '910f4a8c-c696-4dd8-9efa-5cc7d0d21f33', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:46', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a377f0089', '8b53fa83-0090-493b-af21-ab61f51fd81f', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:49', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a39cb008c', '6315fa99-641d-4623-9289-88683ed4f579', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:49', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a3b99008f', '3544dbc8-ed1f-4d01-8860-4252d03c816f', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:50', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a3e450092', '497881df-9602-478a-8157-22c760ff9982', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:51', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a44060095', '92dcf6c6-b507-4d5b-802f-b19aab57ce9e', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:52', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a48c20098', '43e4c555-83fa-4be0-9c0c-66d79766f843', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:53', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a4db5009b', '96da74ec-03b6-4c7d-8740-26190bedd024', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:54', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a5020009e', 'e5a9ba6d-4b81-4c90-afe6-389c2b26e75e', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:04:55', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a623c00a1', '0014fd5f-8486-4601-ac7e-74774794b80c', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:05:00', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a92aa00a4', 'e55c0ab0-c64d-4c83-9f48-243cb46a73b7', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-05 13:05:12', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a977e00a8', '1719f728-9105-4342-b5d6-8b3a078a36d0', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 13:05:13', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a998c00ab', '2e843702-779f-4c46-8ccc-f634e13ec44c', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 13:05:14', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a9c9700ae', 'c7dd22d9-7ac3-43d0-9926-6f42a4031559', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 13:05:15', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645a9f8200b1', 'c7c36b88-c61e-4d5b-83eb-63bce067d101', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 13:05:15', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645aa25600b4', '2a97f7d4-c324-4b7f-a56d-bd9a6cc2df8f', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 13:05:16', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645aabca00b7', 'f53d6c6e-130f-4f35-a9b3-ef41edf48d59', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-05 13:05:19', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645b038f00ba', 'f0a45386-105b-43de-9535-9ce892b18e71', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '91.39', '公斤', '2018-02-05 13:05:41', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645b147f00bd', 'c08b67ce-3728-4a89-a8ce-ecc0dff18e52', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '91.24', '公斤', '2018-02-05 13:05:45', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645b262900c0', '8e1ea196-4248-4120-b93c-b726d8d8bbd2', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '91.26', '公斤', '2018-02-05 13:05:50', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645b366d00c3', 'cbda9a9f-f41c-4661-91e2-0cea4fb2f153', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '91.25', '公斤', '2018-02-05 13:05:54', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261642eb20161645b42e100c6', '5eb99806-e932-42b0-a857-8478af354791', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '91.25', '公斤', '2018-02-05 13:05:57', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec101616933f9d0000d', 'f4467ff8-885a-4351-b4e4-3e222c9de193', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-06 11:41:09', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec10161693411470010', 'fbf51350-4765-40ea-ab11-0dc2b7930616', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-06 11:41:15', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec101616934387d0013', 'a0da2210-8fc1-4a32-a966-d011dc472ccc', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-06 11:41:25', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec1016169343ac50016', 'a185b595-c44a-47e7-9e78-b8c2400f7873', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-06 11:41:25', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec101616934484c0019', 'd32825ea-c928-4e43-90ce-5798e769592b', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-06 11:41:29', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec101616934552a001c', '81313701-95ca-49cf-94f3-20013925730b', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-06 11:41:32', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec1016169345727001f', '6ba184cb-d080-4fd5-b1fd-1d0173105c24', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-06 11:41:33', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec10161693465190022', '91d94422-0815-44e4-b73e-6d81cfd1bde9', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-06 11:41:36', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec101616934672f0025', 'fd622f24-e64f-42cb-a6e4-8ebaf6e6f785', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-06 11:41:37', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec101616934759e0028', '47ca1635-489a-442a-8d6d-14ee73c0dc2e', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-06 11:41:40', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec1016169348335002b', '1f30416f-1294-488b-9e44-aca73598bfe7', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-06 11:41:44', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec1016169348cdf002e', '078a088e-3014-433a-b4d8-96059a1c3b81', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-06 11:41:46', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec10161693496240031', 'c834e0bb-4cda-485c-93da-2d9ee1803437', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-06 11:41:49', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec101616934be730034', '8dc479dd-01fd-4fbd-be3e-f8288746a714', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '90.46', '公斤', '2018-02-06 11:41:59', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec101616934c7e70037', '38001d39-1d3e-4108-a900-c5396cbcc221', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '90.52', '公斤', '2018-02-06 11:42:01', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec101616934d0fd003a', '8b2aff45-3297-4b21-a77b-23111918338b', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '91.58', '公斤', '2018-02-06 11:42:04', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec101616934e06e003d', '1ab466d3-7197-477f-b47a-cf39a752522c', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '90.72', '公斤', '2018-02-06 11:42:08', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec101616934ed380040', '97cbe84e-e71d-4682-b4c1-548153153675', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '90.6', '公斤', '2018-02-06 11:42:11', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec101616934f6940043', 'd8e38f21-5836-45ec-a01e-a6161593299b', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '90.45', '公斤', '2018-02-06 11:42:13', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec1016169375f020046', '503527b0-b1fa-4120-b099-e9062b5579d4', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 11:44:51', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec101616937def30049', 'bb3274c4-96a1-491a-81c9-5246ce7db2cd', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 11:45:24', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec101616937ea94004c', '7271d47b-cd98-4b6f-b570-00cbdeb24396', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 11:45:27', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec101616937f996004f', '8f02b21e-4a2d-424c-ae0f-8f7072f59b09', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 11:45:31', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec101616938083e0052', 'ad43fc15-1ee0-41fd-a0b7-2be63c3a4897', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 11:45:35', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec1016169381fd10055', 'a32456c7-1aa7-4af3-99e6-b91cee48d9da', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 11:45:41', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec101616938356a0058', '2302a583-dd1c-4e4e-9e66-df2107536281', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 11:45:46', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec10161693cdfe7005f', '4b511978-ed52-47c3-bee2-e1736a13107d', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 11:50:52', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec101616946ce280123', '8d82854f-2ee5-4ad8-8c90-c48663a02404', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 12:01:43', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec101616946e8960126', '4ca1ea7d-34a6-4b4e-a401-9bd2810faaa8', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 12:01:50', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec10161696402600132', 'fb9ab6d3-06fa-4e26-beec-697eb0fe208f', '2617245776', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 12:33:37', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec10161698e10c40137', '5be455a2-5954-4b92-93b6-1aaab730e2c5', '269068128', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 13:19:33', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec10161699c770a013a', '2acb461f-fe0c-4076-b60f-5a0a9eb7a726', '12582912', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-06 13:35:17', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a1261692ec1016169a87f91013d', 'afaf0a92-1ba5-44a9-86f1-9182498a97e6', '2785074941', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-06 13:48:25', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a5016169b740c50002', '9c0f86e5-2c2a-4eab-9401-f908edf12372', '1778417528', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-06 14:04:30', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a5016169e663490016', '367d21d1-82c9-4d40-babb-21c683dcf78c', '1778384907', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-06 14:56:01', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a5016169fa23c50019', '298fcde7-7122-4290-ba80-17045fba3464', '3481010176', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-06 15:17:36', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a501616a332431001c', 'c55e0acb-7c91-4eb3-8d77-e4740cb57f9f', '3758206595', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-06 16:19:51', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a501616a3ed5fa001f', 'b6e742f5-a3e8-4270-abce-d66d45cf4864', '1', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-06 16:32:38', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a501616a654e3a0029', 'd0686602-ec30-4392-9c2d-4459fa446087', '2046950906', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 17:14:39', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a501616a964c84002c', 'ac7c82fe-abe1-4bd9-833c-8c33584c5269', '3925868559', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 18:08:10', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a501616aaa8594002f', '341bdb63-459b-44ea-a301-526adb8a28a2', '3785359372', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 18:30:15', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a501616ab92da70032', '6998285b-a220-43d9-b64c-d5e5fded3e64', '2415919120', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 18:46:15', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a501616abc577c0035', '521489eb-d237-44db-a58a-f6223b6895d7', '3489660983', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 18:49:43', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a501616ac6d9840039', 'e2b01cc4-3355-4a78-a112-ed380a904a20', '3187671054', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 19:01:11', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a501616ac83cec003c', 'f33c32d8-53fb-4df9-9cab-c569a899bf76', '1570766849', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 19:02:42', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a501616ac8c695003f', '9d7e9ae6-4ecf-4d8e-b28a-eee98627fab7', '2852126767', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 19:03:18', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a501616accb00e0042', 'b8499d5f-f820-4f85-94b8-60427294d46f', '3120562190', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 19:07:34', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a501616acf4f320045', '91639cf5-c490-4d2f-a974-efac70a3f9e1', '2181038094', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 19:10:26', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a501616adec98f0048', '7c73fe09-3016-4f59-a5e4-3605d9f1c119', '4227858439', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 19:27:20', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a501616ae01bc9004b', 'fbdbdeee-073e-4888-9b41-27b7a4de3a3f', '1639972864', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 19:28:47', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a501616af2656b0052', 'a9751e17-d861-4ba4-81e8-568d8dbd1a9c', '4194304007', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 19:48:45', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a501616b0328930055', 'ceaf036c-30b5-4fa3-9ab6-d8a04495dacd', '1426063486', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 20:07:04', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a501616b09a4ec0058', 'ee761c7f-072c-4509-a658-ea123f0c620e', '3019898889', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 20:14:09', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a501616b150c53005b', 'af252a1c-d978-46d1-a628-192a59bcca7a', '243662848', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 20:26:36', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126169b5a501616b20be6c005e', 'c24f9c11-5947-459f-888d-0c272e04e1c7', '32505856', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-06 20:39:23', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616de850f00003', '91af669e-1a50-4b99-84d5-78181ea08d13', '2976717087', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-07 09:36:35', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616de9bc3f0011', 'f05e0286-16d0-4b0b-a2aa-4054485860a4', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-07 09:38:09', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616de9cf0d0014', '63bda97f-188a-4e0a-9c99-4766ea2ce0f3', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-07 09:38:14', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616de9e3610017', 'b61aa3ce-3c1b-4769-ac17-79e8acad2bd4', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-07 09:38:19', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616df3cb5d001d', 'bfc7da4e-c6f7-4f16-bf49-fbd5345d0995', '6', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-07 09:49:09', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616df3dbc00020', 'c6ed31e2-3068-43e2-bf83-cfa647023ff2', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.68', '公斤', '2018-02-07 09:49:13', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616df6fea30023', 'e616327d-3741-483c-8ddb-4bef6f15e883', '130482176', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-07 09:52:38', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616df9d9b60026', '2cb68d8a-e240-4d58-9dfc-cd8f9bd6bbca', '50335745', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-07 09:55:46', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616e26fbf90029', '4f2502c2-d9f9-415a-b68f-4bd9a34a9913', '3840', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.67', '公斤', '2018-02-07 10:45:03', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616e5449ea002c', '26bc5742-2c14-4eb0-a51e-b1cab3a2645a', '4261412873', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-07 11:34:32', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616e67d4b20043', '4818a9ae-9742-4d5a-8bcd-161114995720', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-07 11:55:53', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616e67fc910046', '52c8bff7-1f2f-4848-b36a-1a7492d6476e', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-07 11:56:03', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616e680d4a0049', 'dbe5b848-e915-44f2-9835-7ecf43019158', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-07 11:56:08', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616e6815de004c', '6168fdca-6cf7-4ecc-94b3-635aacede7fa', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-07 11:56:10', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616e6820bb004f', '955c61ec-45c7-4956-93a3-b41ac04133f4', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-07 11:56:13', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616e6842fd0052', 'cb111984-8c8c-4f54-93ba-5abca5f20f00', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-07 11:56:21', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616e6a9a450062', '045573aa-cd50-4028-8f6a-f3e970c91340', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-07 11:58:55', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616e6a9c320065', '985e3c72-1543-4fe2-bdd5-1edeff7c44cc', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-07 11:58:55', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616e6aa6cc0068', '20308337-c91f-4aac-bb10-9cc917b8e722', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-07 11:58:58', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616e6ab165006b', 'f6441bce-fa33-4934-84cb-4b799143d895', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-07 11:59:01', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616e6ab2f8006e', 'f5ba5ad7-6a2a-4b30-937d-dcbf2980d08b', '2592231', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-07 11:59:01', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616e6abb4b0071', '8276d797-1968-4c7c-8904-e963bb5387dc', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '4.66', '公斤', '2018-02-07 11:59:03', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616e6dc6080074', '8db8be6b-fa2b-4680-9e97-880707fdebeb', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.82', '公斤', '2018-02-07 12:02:23', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616e6dd48c0077', '20f52eb6-f973-4615-b646-3e631a772f55', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.82', '公斤', '2018-02-07 12:02:26', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616e7fc1e8007a', '4f22819c-90f0-4706-b57b-c59e8618814d', '3959422977', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.81', '公斤', '2018-02-07 12:22:01', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616e89dd3f007e', '5f48c869-a75f-44fb-8aca-fb2f83e0aaf6', '262834688', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.81', '公斤', '2018-02-07 12:33:04', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616de60401616ea0b72d0081', '3c477441-951e-4f0b-adac-6b5c548072a8', '3274281472', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.81', '公斤', '2018-02-07 12:58:01', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616ef51e01616ef78d7b0003', '80b1fa53-c17a-43a4-8ea2-2bacad6fa983', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.81', '公斤', '2018-02-07 14:32:51', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616ef51e01616f4726000010', '074bb6e9-0262-4d0a-a268-97ea7d6da5e9', '7', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.82', '公斤', '2018-02-07 15:59:48', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12616ef51e01616f4bb2a60013', '6ccf8546-4748-4219-8691-cd90456a6df2', '2226043392', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.82', '公斤', '2018-02-07 16:04:47', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad380161799363fc0002', 'bb25e7ff-f4ea-431c-b6af-000fccbcf625', '2584544', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-09 15:59:14', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad380161799368410005', '133545cb-4016-49c0-a763-66791276cfa1', '2538444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-09 15:59:18', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad38016179936b3d0008', '9404358a-e11b-4ef9-b036-89911e24c5c0', '2584544', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-09 15:59:19', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad38016179936de6000b', '13c02a17-0837-4675-b20a-50dabf5c3174', '2538444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-09 15:59:20', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad38016179937b7e000e', 'ffa3b31b-3f3a-481c-ae4a-aa3e0a43b79a', '2538444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-09 15:59:23', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad380161799380690011', 'ae1f6a72-18e4-4f62-9167-c1c3d3700c3c', '2584544', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-09 15:59:24', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad38016179938bce0014', '241152fd-811a-4579-b0d3-086b1f17f1f1', '2538444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-09 15:59:27', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a05b2930018', '5299912a-9312-4df4-a6d5-fc90a437aaf4', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-09 18:04:11', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a1a671f0037', '52009fd7-b785-453e-9a7b-7f4b7a18bdec', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '0', '公斤', '2018-02-09 18:26:47', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a1af3b00041', '70aa785d-223e-4cd7-bbb4-fb521f60904c', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-09 18:27:23', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a1b053c0044', '940194b2-416b-4505-b252-a73de3964cb4', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-09 18:27:28', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a1b19f00047', 'a96c702b-900b-413b-aac9-b7cc72b555c0', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-09 18:27:33', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a218de6004e', '827aef43-1484-4fd8-8ee2-b0c9cf21c334', '473039328', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 18:34:36', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a29dbd80051', 'c1e023ee-749a-479e-bc24-24936e966293', '2135175472', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-09 18:43:40', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a3408ef0054', '4d4691b6-d389-4417-b243-4dc5af1ddd81', '2472067072', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-09 18:54:47', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a3bb032005d', '0f9af45c-c04f-4382-9bba-594e3bec53ef', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-09 19:03:09', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a3bbaf00060', '33eaabee-dbd5-4be5-9eeb-a39799daa0ec', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-09 19:03:11', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a46b8f10064', '8501d9af-6d67-4b2b-934e-1c3ad3e15102', '1342726912', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-09 19:15:12', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a5d583c0067', '6c569c00-5d42-4cad-8f74-121d753e019f', '32580', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-09 19:39:54', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a61e5c8006a', 'c179bc7e-8fe8-4e2d-afe7-fdfe9d997024', '21164038', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 19:44:53', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a6d7738006d', '793e79f4-76b8-4678-8975-1de82c9e2ed2', '32509952', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 19:57:31', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a6e13ce0070', 'fe0ff3bc-e537-43cb-bfaf-29ac0c299d41', '1908523008', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-09 19:58:11', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a6e3fae0073', '062861f9-1f33-42d5-8cfc-f6bdf29b8f85', '201326595', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 19:58:22', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a70d45c0076', 'e7a33311-23b5-49cf-9cf6-d7d2c234aec9', '256', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-09 20:01:11', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a78643a0079', '14110e00-b0c5-451b-92b7-2a2c529841d5', '1', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-09 20:09:27', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a923ecd007c', '4ea9adca-b548-4830-9e6c-370a47c15faa', '560896', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 20:37:41', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a98db9a007f', '6b23d823-0a6c-4a53-88b7-feef8fd4fc10', '258048', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 20:44:54', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617a9ef6360082', '8d443611-71b4-49d3-b537-30bdc59d8180', '608591872', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 20:51:34', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617aac99360085', 'e101e225-5dc6-45f4-8947-c397fefb66f1', '2687979776', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 21:06:28', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617ab4bc640088', '85e2d8e5-aa57-4ebc-a75d-c4c7022ceebd', '17695', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 21:15:21', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617abee8ff008b', '631bc7c6-298e-4fd9-8ecd-2c4a92b3c6e5', '1560316380', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 21:26:28', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617ac2502d008e', 'fe006ba8-65eb-438d-bebc-bb0cceb2b872', '850648736', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 21:30:11', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617ac5a2a70091', '241a1b3e-fde7-4c7f-84e0-b9830172bac3', '537657371', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 21:33:49', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617adb930f0094', '200d2007-51c4-49d2-b777-f56dfa768dd2', '1', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 21:57:46', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617ae30aa30097', 'c7b95cda-d942-403f-b7c6-3e225c8079d1', '983040', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 22:05:56', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617ae8d453009a', '442677cb-78d5-4d1b-ad51-674bd5f53b95', '55', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 22:12:15', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617aeb69a7009d', '4889bfe7-9a1a-4691-aebb-e77c1ac17ab1', '15', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 22:15:04', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617af1f35600a0', 'fcdc7ebe-208a-4dfa-956e-56cbca190f78', '1835264', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 22:22:13', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617af68c5200a3', '19ad3e89-3198-4575-96bf-cdaf3240de2b', '768', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-09 22:27:14', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617af6ffb900a6', '8d2c0e14-f3fd-4fd9-9f6b-648e3b16162d', '2046645180', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 22:27:44', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617afa331b00a9', '9fd89bc3-fcfb-4e92-a7f1-2259e74a73b3', '204', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 22:31:13', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617afb52cd00ac', '51abff3e-cf82-48e8-8bfd-770099cc636b', '61440', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 22:32:27', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617afb659a00af', 'f4ee29f5-58b2-4031-be5c-06e6615dc498', '3690990964', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 22:32:32', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617b07e41a00b2', '84a7d456-084d-496c-b833-aab4a567475c', '6', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 22:46:11', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617b0cfbd000b5', '8059a618-be64-4cf4-b483-f61de4a700e5', '119', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 22:51:44', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617b132e2900b8', '77c54323-3860-44d8-9117-3c6d9111dac9', '207', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 22:58:30', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617b147bc800bb', '120c819a-27ae-4683-96c0-b04faad2b67f', '44909', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 22:59:56', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617b16b11b00be', '4118c70a-2a1a-4cc7-b7cf-680e280f3d2c', '220', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 23:02:21', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617b17f2f500c1', '931643b2-bc5a-43fd-8935-730684d80ac5', '6913', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 23:03:43', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617b20fb0800c4', 'e70a4a1a-df29-448c-b7d2-8c310350b400', '2', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 23:13:35', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617b21e59200c7', '00d1ce7b-6338-4234-aeab-9a5ef3d70f58', '6292262', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 23:14:35', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617b24cefb00ca', 'de66f7c3-a5b0-4839-9dea-060a232854f1', '2294284288', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 23:17:46', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617b2d02c400cd', '8f324d4c-2725-487f-8083-32c4bc774aa5', '3194880', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 23:26:43', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617b2d3ed700d0', '58e4fef7-b37d-4aa2-b87d-2997570f605d', '1288957952', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 23:26:58', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617b31815500d3', '2ca1c9d2-2748-4be4-9c8e-cad459963739', '10', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 23:31:38', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617b35f0e900d6', 'b702645f-9187-43cf-83c8-2fe23db080b3', '997319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 23:36:28', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617b39648400d9', '2a474f50-113e-4192-b52d-0f887cb6660f', '7', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 23:40:15', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617b430cd100dc', '95059956-685a-4361-bdc9-58a83f23ea42', '12582912', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 23:50:47', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617b482d9300df', '48c539d4-4e0d-4a4b-bb86-9abc270b01e4', '65541', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-09 23:56:23', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617b77129200e2', '6a82f224-d466-4c90-afbf-bae640b11f4f', '4287415808', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-10 00:47:37', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617ba424e200e5', 'b85c1107-50fd-4940-9fd5-e03ff019e38c', '7352444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-10 01:36:50', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617bc0f1e600e8', '43f2e0a7-d461-45b0-a245-d280cf74032a', '106986910', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-10 02:08:18', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617c00f85600eb', '163bb130-312f-40bd-8064-7c99ef13e63e', '3317094794', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-10 03:18:13', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617c2b722e00ee', 'e1aef8d3-1ebf-42cb-af5d-a2054ea021e7', '3221274356', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.88', '公斤', '2018-02-10 04:04:37', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617c2d243600f1', '53dff0fc-7773-4853-8449-63078d0dc4dc', '786944', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-10 04:06:28', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617c358d7e00f4', '8e1dbb2d-1cc8-4156-bdd7-b35854ec9b6f', '3291827589', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-10 04:15:39', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617c45769300f7', '3436c4e4-5e4f-4665-9a22-a7116ecb49cc', '114688', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-10 04:33:02', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617c485cd700fa', 'a62f0ec0-3d42-4699-90cf-bce7a152a4df', '2613547289', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-10 04:36:12', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617c4af54800fd', '2ec07e56-d15d-4a53-a329-3d74b8ac3519', '4227861505', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-10 04:39:02', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617c4c24520100', '2f904982-ddbc-4c09-b454-ef236abf4c9e', '520100864', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-10 04:40:20', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617c53ae5f0103', 'ba81e5e7-c75c-4d69-962e-447373431490', '29556737', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-10 04:48:34', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617c58291a0106', 'ed11e1d6-db68-4e30-9e95-d9d0f934711b', '1879048193', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-10 04:53:27', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617c6388f80109', '3f044231-199c-40f6-9af1-01fb2ac673cb', '394013', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-10 05:05:53', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617c656ff6010c', 'a6add397-9ba2-4616-a181-3c62bbff99c0', '3959424960', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-10 05:07:58', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617c90dec1010f', 'ab0aca26-d0b6-40d5-82bb-0366201541bb', '29288672', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-10 05:55:24', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617cadae690112', 'ec92d7f2-3a50-40e0-9c08-85c3e3aea14c', '2035', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.88', '公斤', '2018-02-10 06:26:52', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617cc213250115', '855afcc7-9302-44c4-a9a3-9f8bbc86ed29', '12582913', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-10 06:49:08', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617ce80c0e0118', 'd8ccf81a-81fb-4167-948a-962c36143c33', '3260140442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-10 07:30:37', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617cedab3f011b', '316ec1d2-ea8f-411e-b418-abdbeb5fdd65', '3474159111', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.87', '公斤', '2018-02-10 07:36:45', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617d269d06011e', '941588d6-93c8-43cb-96c9-d4168fb96ab1', '294672128', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-10 08:38:57', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617d2803ea0121', 'f2bddd94-5da7-4714-b1fa-40b140184588', '1029341184', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-10 08:40:29', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617d288bd60124', 'a863851d-507e-4c4f-a5bf-db15355f7eac', '26', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-10 08:41:04', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617d2cdac50127', 'f793e9e8-915e-4e88-9a0d-6f8dffbce8bb', '3857', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-10 08:45:46', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617d2d4bdd012a', 'ba30334a-0c71-4d0e-acda-f4d2008bff39', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-10 08:46:15', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617d2d67d9012d', 'd9771e64-947c-4aa1-8f44-7f05298f4f45', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-10 08:46:22', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617d2dd8f70130', '491affad-899f-4f8b-8ae8-5e3e38542814', '12', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.85', '公斤', '2018-02-10 08:46:50', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617d3170210136', '46fccaf2-df29-4ae2-a09a-2a9ce885ebe8', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-10 08:50:46', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617d3175e00139', 'f39855b1-d79b-4513-a407-5ede102b53ac', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-10 08:50:48', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617d3177f2013c', '0e0ea0ea-eb67-4a6f-b63f-bcae21fedf57', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-10 08:50:48', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617d317bcd013f', '867aa3ec-169e-4cc2-a87d-6dbee82cb18a', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-10 08:50:49', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617d317db70142', '73ec78e7-37d9-42c4-a8dc-9540f4dabcb6', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-10 08:50:50', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617d3181f60145', '1dd60b6c-d8ff-4697-94bd-977b7c667c7d', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-10 08:50:51', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a126178ad3801617d31875c0148', '13f63d88-d9c5-4fef-9187-1435ac111014', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.86', '公斤', '2018-02-10 08:50:52', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d425d6c0005', '8ef0b6e9-cc0b-4f82-9d77-8eb1191069df', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.85', '公斤', '2018-02-10 09:09:20', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d426aa30008', '5617ac14-9559-4ef5-849d-008b2ce6e730', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.85', '公斤', '2018-02-10 09:09:24', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d427ca9000b', '6cd0731b-6ec9-4ed2-8795-09ae366a3066', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.85', '公斤', '2018-02-10 09:09:29', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d428615000e', '8c016d67-bb85-43c5-8369-5fef5dccb8d2', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.85', '公斤', '2018-02-10 09:09:31', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d4292df0011', '600a8fd0-3b13-469a-bd18-e1135f808828', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.85', '公斤', '2018-02-10 09:09:34', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d4295390014', 'bbf15cb2-ad39-49f1-86a3-ac17f8c9cf63', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.85', '公斤', '2018-02-10 09:09:35', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d42971b0017', '735d030b-e831-4b01-bb60-4e8c0553676b', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.85', '公斤', '2018-02-10 09:09:36', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d42991d001a', 'ace0a0c0-228d-49cb-846d-4385d78919d2', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.85', '公斤', '2018-02-10 09:09:36', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d4884fd0020', '1eb9e2e5-5fea-424c-a768-9092df165875', '3810122176', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.85', '公斤', '2018-02-10 09:16:04', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d4b67d60023', '551083d1-faed-439a-a2b6-c521f9f764dd', '6292729', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.85', '公斤', '2018-02-10 09:19:13', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d5e644d0026', 'a851f3ea-17f4-4772-b24d-e2cd4d46ca0c', '199', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.84', '公斤', '2018-02-10 09:39:57', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d619b230029', 'b39a20b8-b48c-4587-88cd-270bf8b5abdc', '2086', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.84', '公斤', '2018-02-10 09:43:28', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d716f4b002c', '8fbbd274-21d3-494b-a2fc-508c6585f58e', '3221422080', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.83', '公斤', '2018-02-10 10:00:45', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d734a11002f', 'dd711127-799e-4a4a-b730-014b129295d4', '134', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.84', '公斤', '2018-02-10 10:02:47', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d7699a30032', '42227811-17a9-48fd-8e27-48853f7f7a48', '471007232', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.83', '公斤', '2018-02-10 10:06:24', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d7759040035', '80376dbe-1963-4531-b46c-d20036fdc5ed', '12', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.83', '公斤', '2018-02-10 10:07:13', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d7917280038', '21986d3c-049b-4b35-87d2-e68bdd977a2e', '12', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.84', '公斤', '2018-02-10 10:09:07', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d8af5ee003b', 'bfb9902f-1496-4f3f-bebc-2a2ba4ddae63', '1', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.83', '公斤', '2018-02-10 10:28:38', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d8c21b1003e', 'd007921c-f321-41db-b83e-f1e03460d264', '15', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.83', '公斤', '2018-02-10 10:29:55', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d9164a80046', 'eac62c36-f801-4e19-bb16-b217e1efdab1', '2210324502', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.83', '公斤', '2018-02-10 10:35:40', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617d94a4030049', '5bd2fe0e-6eab-4a39-aadb-63e80540d190', '327680', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.83', '公斤', '2018-02-10 10:39:13', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617da76e0e004c', '6f0488db-0b0b-4075-b283-d5130c9e05d0', '113639424', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.83', '公斤', '2018-02-10 10:59:44', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617daa95cf004f', 'e6760247-3c6b-4958-9051-7630469cb750', '507', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.83', '公斤', '2018-02-10 11:03:11', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617dad9cf70052', 'd43b0bbc-e780-4a68-94ab-3d99cdceb04c', '2678816768', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.83', '公斤', '2018-02-10 11:06:29', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617dadd7990055', 'd72f6baf-195f-4bac-8d1c-e705dea186e6', '2268332032', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.83', '公斤', '2018-02-10 11:06:44', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617dbf2fb80058', '8ef0f977-f251-43e1-8260-0477605f58e2', '1', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.82', '公斤', '2018-02-10 11:25:41', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617dc29013005b', 'c9fb3d39-c09d-4abb-83a4-bdd9fa28678a', '1', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.82', '公斤', '2018-02-10 11:29:22', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617dcf0b8f0060', '40280e53-8c69-4a46-9c7b-d8e77c7aa252', '1', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.82', '公斤', '2018-02-10 11:43:00', null, null, null, null, null, null);
INSERT INTO `log_DecaptitatingBizRecords` VALUES ('8a8a8a12617d3d9501617dd0849d0063', '00e22713-4afb-4029-b80b-6b1c71cc5ac7', '61440', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '去头工站', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', '3.81', '公斤', '2018-02-10 11:44:37', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `log_PackageBizRecords`
-- ----------------------------
DROP TABLE IF EXISTS `log_PackageBizRecords`;
CREATE TABLE `log_PackageBizRecords` (
  `id` varchar(32) NOT NULL,
  `serialNumber` varchar(255) DEFAULT NULL,
  `workGroupId` varchar(255) DEFAULT NULL,
  `workGroupName` varchar(255) DEFAULT NULL,
  `workCellId` varchar(255) DEFAULT NULL,
  `workCellName` varchar(255) DEFAULT NULL,
  `combineId` varchar(255) DEFAULT NULL,
  `combineName` varchar(255) DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `creatorId` varchar(32) DEFAULT NULL,
  `creatorName` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifer` varchar(255) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_PackageBizRecords
-- ----------------------------
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e109a6b90000', 'c8daa0bc-736d-4220-819f-1fc650c825ba', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '240', '2018-04-20 11:12:05', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10c8a180029', 'fbd8fa30-0d37-4683-bb24-3646fac2d4da', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '241', '2018-04-20 11:15:18', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10c8cb5002a', '019cd6fd-5a1b-4a35-bcc5-2fdefee7ea0f', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '242', '2018-04-20 11:15:18', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10c91a7002b', 'b38c9c56-5ff8-498b-9ab8-7195c4b9ed0b', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '244', '2018-04-20 11:15:19', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10c968f002c', '4e726bb5-ea50-48c8-bb5e-98011a5fa6ca', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '245', '2018-04-20 11:15:21', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10c9b75002d', '9ce50719-9781-4cc6-8c5e-669e1434d155', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '246', '2018-04-20 11:15:22', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10ca079002e', 'd6a5c857-8365-4144-9a5f-aa0d7c20e268', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '247', '2018-04-20 11:15:23', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10ca552002f', '478c4eb3-2540-4ea3-af48-5fb2cb1077d3', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '248', '2018-04-20 11:15:25', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10cbbde0030', '408599b2-8117-46bf-b2f5-b1662e1e3d41', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '249', '2018-04-20 11:15:30', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10cbe900031', '287b4649-94ee-4553-a570-f2fa629b63d8', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '250', '2018-04-20 11:15:31', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10cc36f0032', '05b0d1ac-a623-4f3a-9447-3890d7aa2e7e', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '251', '2018-04-20 11:15:32', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10cc6090033', '48bc9f7c-198c-49e2-909a-5e6649a7a102', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '252', '2018-04-20 11:15:33', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10ccb380034', 'f6122117-0bbe-4848-bf27-14c470b5f51a', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '255', '2018-04-20 11:15:34', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10ccdef0035', '0fb08f81-f23f-423a-8a7d-5862a26201cd', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '256', '2018-04-20 11:15:35', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10cda3f0036', '6a61ec67-654f-4b06-8367-ff61e2aca8b0', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '257', '2018-04-20 11:15:38', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10cdf520037', '893486d2-1813-4828-add7-7ed9cc9869e1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '258', '2018-04-20 11:15:39', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10ce1ac0038', 'ad30445c-18c7-414b-a84e-f6579e8db715', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '259', '2018-04-20 11:15:40', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10ce43c0039', '96de6cdc-d282-49d4-ae3a-0abb9ec6ddc2', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '260', '2018-04-20 11:15:41', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10ce6c8003a', '2e669c78-5274-4fc7-8c81-216b971a3798', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '261', '2018-04-20 11:15:41', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10cebb9003b', '75902ce4-8e8f-4bff-81db-7faf5e6e6ff8', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '262', '2018-04-20 11:15:43', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10cee70003d', '68aa98b0-08bb-4808-befd-0b4a6196436d', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '263', '2018-04-20 11:15:43', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10cf096003e', '2d0d836b-d47b-4c95-8799-93b80b3fdb30', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '264', '2018-04-20 11:15:44', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10cf573003f', 'd1cee104-b0ce-4dc8-b2cd-ffaa4fe04ff2', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '265', '2018-04-20 11:15:45', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10cf7f50040', 'a4a3bc97-adcc-4aa3-8201-c0431d10d04d', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '266', '2018-04-20 11:15:46', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10d19190043', 'f174d938-8a8a-43df-8ece-ea6855757295', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '267', '2018-04-20 11:15:54', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e10eeb050049', '7b5a303d-2a33-4bad-bad3-d1d52e45d47f', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '268', '2018-04-20 11:17:53', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1103e1c004a', '825accce-8fa8-4152-b8b5-0490a41fd470', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '269', '2018-04-20 11:19:20', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1111723004b', '1684ddfc-e14e-4d93-8129-e6b249a3f1b7', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '270', '2018-04-20 11:20:16', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1111e7d004c', '27eb05c0-4f2f-4837-a86c-d5ede6187691', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '271', '2018-04-20 11:20:18', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e111b28e0052', '1bca3aa7-fc1a-4b1e-ba71-9efde2dcca1c', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '272', '2018-04-20 11:20:56', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1121e76005c', '9a9cad4f-4f46-40f2-9a66-5a7d523ead20', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '273', '2018-04-20 11:21:23', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1122d63005d', 'b9fb86f3-3559-408e-a54b-de94662cc62e', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '274', '2018-04-20 11:21:27', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1124e2f005e', 'ac4ab68f-a781-4ddc-bd0e-9c174fec5723', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '275', '2018-04-20 11:21:35', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e112e92e0061', '742670c8-bf69-4f8c-875d-4948d2ce44bc', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '276', '2018-04-20 11:22:15', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e11384b3006b', '5b42e9a1-38f9-4ab0-a163-86a0de802099', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '277', '2018-04-20 11:22:55', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e11420520074', '2f447e7b-6b1e-4be5-a313-232d7fa64599', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '278', '2018-04-20 11:23:35', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e114b906007f', '4ad2d05c-293f-4a32-9e81-dd7d5f9cffbd', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '279', '2018-04-20 11:24:14', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e114f01b0080', '47e41edd-88ff-4111-9034-aca3b2cd9a68', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '280', '2018-04-20 11:24:28', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e114f5090081', '7dddf92e-dcdd-4a61-a6ed-9d0d56e18b85', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '283', '2018-04-20 11:24:29', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e11553cc0085', '3c9ee069-6b8d-4b01-a00c-b20dcf7e1f51', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '284', '2018-04-20 11:24:54', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e115f0070086', 'd81b9ccc-a7ff-48e3-b143-16bdd3ff0297', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '285', '2018-04-20 11:25:33', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e11689e10087', 'b7f859fd-3a2d-4bc0-827a-7d85525de895', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '286', '2018-04-20 11:26:13', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e11723b40088', '0db233a4-782d-4210-810d-4d20fae491f1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '287', '2018-04-20 11:26:52', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e117bfc20089', '3cee5a15-0805-4d9e-9823-14df8ebebef3', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '288', '2018-04-20 11:27:32', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e11857a6008a', '4284ca47-96f0-4428-8573-1c6e66bedd55', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '289', '2018-04-20 11:28:11', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e118f0f2008b', '234a2319-77aa-402e-b130-8310f79fe25c', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '290', '2018-04-20 11:28:50', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e11988d3008c', '82a176bb-fd99-4dba-80e2-276d5f5658f9', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '291', '2018-04-20 11:29:29', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e11a2438008d', '4dc72378-d109-4b08-8367-95f8b3a1e425', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '292', '2018-04-20 11:30:09', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e11abbb3008e', '28c754e3-a272-4e94-9d7f-178aa128a1a8', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '293', '2018-04-20 11:30:48', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e11b5613008f', 'd8955660-8454-4f3e-a15f-6528fddd6f08', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '294', '2018-04-20 11:31:27', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e11bf5bb0090', 'f49c796a-afe0-4df3-ab93-7c92954cdd04', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '295', '2018-04-20 11:32:08', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e11c860a0091', '32f6c2d2-f656-4c30-a974-2e47201bcf39', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '296', '2018-04-20 11:32:45', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e11d1f630092', '511b4654-d7fa-420c-bf57-6d7e8db4edb6', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '297', '2018-04-20 11:33:24', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e124dcab0093', '63380035-4c24-4180-bf49-6a0efeabcc3c', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '298', '2018-04-20 11:41:52', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e12577e00094', '730aad6e-0a2c-4c97-89d7-08c512a0e3f4', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '299', '2018-04-20 11:42:31', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c1290100b6', 'db6e966f-e292-480a-b8b8-6daa3719b3c0', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '300', '2018-04-20 14:32:35', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c12daf00b7', '15897cbe-1aed-40f9-b9cd-8d4796802038', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '301', '2018-04-20 14:32:36', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c22d9500b8', '081084ac-ae54-4266-93d2-bc0fc724b533', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '302', '2018-04-20 14:33:41', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c22fee00b9', '852f3fad-3c2b-4451-8f83-3b486fd344a2', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '304', '2018-04-20 14:33:42', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c2585700ba', '8b65fdc6-719e-4f95-a78c-64011afcfc98', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '305', '2018-04-20 14:33:52', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c264ab00bb', 'ea91f294-1e82-41b8-8384-d3eb998e1493', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '307', '2018-04-20 14:33:56', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c3459e00c3', '96c6df57-63f8-4bc4-94cc-2bda0503663f', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '308', '2018-04-20 14:34:53', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c3572400c4', '2236fa6f-143a-4e00-85c2-37cc3b48e9f6', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '309', '2018-04-20 14:34:58', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c3777d00c5', '87a7dd88-f84b-4fb6-8969-ae6e28a9ab21', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '310', '2018-04-20 14:35:06', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c3e58700c6', '58c5254b-9c02-4a1b-b9b5-44a9a79d77f2', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '311', '2018-04-20 14:35:34', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c3ecec00c7', 'f538f7b9-41f1-4b49-8948-a39b2a0f4b9c', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '312', '2018-04-20 14:35:36', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c3f1cb00c8', '3b446d43-7729-4c08-893a-cd9dcfe94e48', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '313', '2018-04-20 14:35:37', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c3fbe600c9', '8e43b320-465b-4412-83bf-7d917ce9cd7c', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '314', '2018-04-20 14:35:40', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c4683100ca', '691c6bee-aa8f-4955-9dc1-11f7b381e3e3', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '315', '2018-04-20 14:36:08', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c4869e00cb', '317e569b-ab7f-48fa-9ed2-ddb4b6e9dbf7', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '316', '2018-04-20 14:36:15', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c497ff00cc', '0a94b76d-07cb-46b8-8ce7-2c5d53ff4565', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '317', '2018-04-20 14:36:20', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c4a46b00cd', 'e2c5b74a-fe27-4b43-a7cc-9b0df3d75a2e', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '318', '2018-04-20 14:36:23', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c502bc00ce', '2bfe6ee0-2044-4f50-aa00-0b85b801f932', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '319', '2018-04-20 14:36:47', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c50a5f00cf', '8428c6bd-8c21-4f38-bff2-48696e5d4506', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '320', '2018-04-20 14:36:49', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c5147000d0', 'd8414a9a-64e6-4eb0-be2b-6087c254fdef', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '321', '2018-04-20 14:36:52', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('4028811962e106430162e1c7df8000d8', '7cb23f97-1695-4165-8963-98452942dc8b', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '324', '2018-04-20 14:39:55', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479a2acb0010', '3978f669-e634-4cbc-91b7-735c4e652fed', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '2', '2018-05-10 09:11:15', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479a2c6c0011', '0ab0ce04-9965-4fd2-84bc-3f51110ad721', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '3', '2018-05-10 09:11:16', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479a2d7d0012', '26a2d777-984e-462e-ba48-66d124e38bea', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '7', '2018-05-10 09:11:16', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479a2f470013', 'fa493bb0-5a74-4c7f-8d5b-4636b7defaa9', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '9', '2018-05-10 09:11:16', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479a306b0014', '5db648b0-d67e-410b-b7c0-d7db9bd4f3f9', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '12', '2018-05-10 09:11:17', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479a31930015', '13283417-29e1-461a-8cef-5027380b22f3', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '13', '2018-05-10 09:11:17', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479a330e0016', 'e7e2f2f0-508d-4472-b828-79569aeee6bc', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '14', '2018-05-10 09:11:17', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479a34180017', '2f8f092d-c22f-4b3a-b2ed-7fe509fb0723', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '15', '2018-05-10 09:11:18', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479a35420018', '8ac3744a-9328-4146-b542-4350b294ff02', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '17', '2018-05-10 09:11:18', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479a367f0019', '4440e671-59ec-4d24-87f5-fd26d35e10d2', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '20', '2018-05-10 09:11:18', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479a37a2001a', '22ff06d0-1133-4e6b-8ee7-9400b3db6e12', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '22', '2018-05-10 09:11:19', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479a389b001b', '09b71b55-eae0-46d1-83f3-b98ad0ebcbe2', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '23', '2018-05-10 09:11:19', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479a399c001c', '0d35ef85-ace7-41f9-a500-a09f2080560c', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '24', '2018-05-10 09:11:19', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479a3ae5001d', '13f55075-bb68-481a-9c52-10c04c0544b6', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '28', '2018-05-10 09:11:19', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479a3c15001e', 'b4f51590-c816-40fb-9684-beb583e69721', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '31', '2018-05-10 09:11:20', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479a3d6f001f', '69df0c9a-cfe8-4654-a650-bab4c81be7db', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '33', '2018-05-10 09:11:20', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479a3eb90020', 'f495f35c-eb8f-456c-93cb-5d202a10d506', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '34', '2018-05-10 09:11:20', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479a40d90021', '92ea0331-50e2-437b-9160-a0f537cad05a', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '35', '2018-05-10 09:11:21', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479a42150022', '46f42c07-c9df-4f57-a0fc-23a640ebfb6b', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '37', '2018-05-10 09:11:21', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479ac66c0026', '39acd3d8-5269-426a-b6c0-0ceedd5f7305', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '38', '2018-05-10 09:11:55', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479ac9ef0027', '4eaa9452-3ab5-4a63-bd5f-50088d82a3b3', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '39', '2018-05-10 09:11:56', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e0163479ad5a80028', 'f86d87cf-5afb-4240-8c98-c381e67c0bdd', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '42', '2018-05-10 09:11:59', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e016347e094ca0046', '6a5fd677-c568-4942-bbd4-d9cf66855401', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '43', '2018-05-10 10:28:10', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e016347e0b5ee0047', '558e1c00-6b4b-4763-bce3-1ef0d330e2ec', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '44', '2018-05-10 10:28:18', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e016347e0d5120048', 'd6b1e51c-eb3f-4bc8-b713-9e9fc74d64ea', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '45', '2018-05-10 10:28:26', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e016347f47f320071', 'd678c9f0-9172-4d38-8069-cb50ee18d58b', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '46', '2018-05-10 10:49:55', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e016347f48cb40072', 'f9a85010-b75f-464b-a122-95225ca0d20d', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '47', '2018-05-10 10:49:59', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e016347f48f450073', '53081768-5608-4502-816c-9fd661e618a3', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '48', '2018-05-10 10:49:59', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e016347f4946f0074', 'f9679901-cc57-4e9e-88ec-e7fdece326fb', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '49', '2018-05-10 10:50:01', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e016347f4bdcb0075', '48241f36-e105-446a-b691-bc78190e4a9f', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '50', '2018-05-10 10:50:11', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e016347f4cb640076', '608830ea-87d9-48c4-9c7c-be5b23defe53', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '51', '2018-05-10 10:50:14', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e016347f4cf9c0077', '56609a62-a6ea-4cee-9a63-05847920076a', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '52', '2018-05-10 10:50:16', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881966347958e016347f4d4e90078', 'd97c4961-9361-408e-bf3b-aff5a0f11a33', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '54', '2018-05-10 10:50:17', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a4628e92d001628eeaa9680000', 'dd74d9ed-c78a-4795-b9bf-1c9c9f673481', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '224', '2018-04-04 12:29:23', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a4628e92d001628ef6407f0010', 'dbb192b4-74d1-4430-a68d-09a26adf21f0', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '225', '2018-04-04 12:42:05', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a4628e92d001628ef643180011', 'ef05db8f-3e3a-47be-91de-1485fe934470', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '226', '2018-04-04 12:42:06', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a4628e92d001628ef6484d0012', '829faf02-4213-497e-9698-def4aa9a7b4d', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '230', '2018-04-04 12:42:07', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a4628e92d001628ef64ae00013', 'e7d9059f-a821-4bf8-b678-860f966a2fdf', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '233', '2018-04-04 12:42:08', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a4628e92d001628ef64d6c0014', '2cffa38e-3335-4f79-bc93-99c01f2f52da', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '234', '2018-04-04 12:42:09', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a4628e92d001628ef650170015', 'a00cf726-350e-4120-a55a-7bfe48fd3207', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '235', '2018-04-04 12:42:09', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a4628e92d001628ef652950016', '96783dd2-0d55-4c6e-a95b-49baf936d133', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '236', '2018-04-04 12:42:10', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a4628e92d001628ef655380017', '44ac3e88-5766-40fb-b17b-21473474cfe4', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '237', '2018-04-04 12:42:10', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a4628e92d001628ef657ba0018', 'f14208b9-cf53-41a0-9862-adc135fa98ad', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '238', '2018-04-04 12:42:11', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a4628e92d001628ef65a580019', 'c759c8f0-aeac-4a40-979d-defe6c8ba2df', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '239', '2018-04-04 12:42:12', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a4628e92d001628ef6773e001a', 'c4860eba-c44e-4783-9663-902940909726', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '240', '2018-04-04 12:42:19', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a4628f0e7b01628f142c550000', '8db4ec14-9b4d-4437-8256-3c4b289d9c67', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '240', '2018-04-04 13:14:44', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a862eadfdb0162eae1280d0000', '0ec1e030-9c0e-44c6-af35-a1800593f8f6', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '324', '2018-04-22 09:04:04', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a862eadfdb0162eae177a30005', '4348c8a5-d3e6-4418-8d6b-d0af3766d240', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '325', '2018-04-22 09:04:27', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a862eadfdb0162eae189160006', '90f33e50-b1bc-4abd-b691-37298094b147', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '326', '2018-04-22 09:04:31', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a862eadfdb0162eaee5ada0032', 'dbcf4358-5ee8-4ccd-851b-732bfcbcd3b8', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '327', '2018-04-22 09:18:32', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a862eadfdb0162eaee7b410033', '8c82904a-aa48-454e-af8f-1be26ad48c48', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '328', '2018-04-22 09:18:40', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a862eadfdb0162eaee80230034', '4715e921-1e69-41af-9d8c-d2bf8b605483', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '329', '2018-04-22 09:18:41', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a862eadfdb0162eaee98b10035', '5e40ec98-2d9f-4306-8111-17d8a951b8a7', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '330', '2018-04-22 09:18:47', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a862eadfdb0162eaeec7620036', 'cb96e9e1-2641-4b2e-aff0-b26fe84c45ac', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '331', '2018-04-22 09:18:59', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a862eadfdb0162eaeee8120037', '965ad86a-3a65-47f7-84f7-b3be0df3cb57', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '332', '2018-04-22 09:19:08', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a862eadfdb0162eaef039f0038', 'e5aa6807-17d7-4f4e-9d1f-ad502cfa55c6', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '333', '2018-04-22 09:19:15', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a862eadfdb0162eaef06170039', 'f8f38ab8-0c62-4196-a15f-52a4aefcbacb', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '334', '2018-04-22 09:19:15', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a862eadfdb0162eaef0d73003a', '8001bf96-615c-448c-932b-0fb0d3a1a76f', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '335', '2018-04-22 09:19:17', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a862eadfdb0162eaef0ff6003b', '6c49adca-97dc-478a-a64e-5d9af1abcdf3', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '336', '2018-04-22 09:19:18', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a862eadfdb0162eaef1267003c', '51ab605e-98bf-4a5a-a083-31903410cff4', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '337', '2018-04-22 09:19:19', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a862eadfdb0162eaef14c5003d', '9023dec2-2d99-456b-8f32-2072233162ed', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '338', '2018-04-22 09:19:19', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a96339166c01633918bc860003', 'b73fc6c8-3e21-4d02-a7ce-0174d430bf92', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '338', '2018-05-07 13:35:12', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a96339166c0163391a5be50014', 'd0d8b5fd-2576-4c80-8e5c-9451e01d73c3', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '339', '2018-05-07 13:36:58', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('402881a96339166c0163391acaf40015', '44da3f32-09ef-4ea1-90ac-02388256629c', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装袋工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '340', '2018-05-07 13:37:27', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616402e50161640c8ae30000', '9950fe41-1cad-4500-8847-df22bee30a4b', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1748', '2018-02-05 11:39:56', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616402e50161640ca5580001', '892bdc48-234f-4540-9a46-3fbb31acf39b', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1749', '2018-02-05 11:40:05', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616402e50161640cb0c90002', '5e8cfe62-8c86-46e7-868f-8e298a024766', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1750', '2018-02-05 11:40:08', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616402e501616410d5640003', '55350e26-71cc-4436-91fd-42e887a0f06f', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1750', '2018-02-05 11:44:39', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb20161643496d10000', '94b7c8f0-c8de-4b0f-bf8c-a516f3c597a4', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1750', '2018-02-05 12:23:41', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb201616438cde4000c', 'dd05a940-f400-4553-9133-66fe6dfcd78b', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1751', '2018-02-05 12:28:19', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb201616438d419000d', 'a164ca71-2c66-4391-a785-f991a39746f3', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1752', '2018-02-05 12:28:21', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb20161643931f1000e', '9cb5545f-f9f0-4f17-b5fc-4519d2370f71', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1757', '2018-02-05 12:28:45', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb201616439704b000f', '7ee70307-f6d3-4c5f-b57e-03a0e356e293', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1759', '2018-02-05 12:29:01', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb20161643a068b0010', '841f2c38-a12a-4932-a1bf-5cc9901583eb', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1773', '2018-02-05 12:29:39', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb20161643a0b7b0011', 'd4242c9b-5e2f-46c6-b681-a6753fd59ce6', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1774', '2018-02-05 12:29:40', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb20161643a10860012', '35e4de65-066e-42f0-b832-88eb39c909a2', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1775', '2018-02-05 12:29:42', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb20161643a13ce0013', 'dfe187ba-e2cc-4b6b-a7cc-342b2552ef5a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1776', '2018-02-05 12:29:43', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb20161644303070026', 'e7c82172-7462-432f-832c-d632a980bac5', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1784', '2018-02-05 12:39:28', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb20161644366910027', '3f52bc10-0fbe-4ea3-a01b-d18a35459c8d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1790', '2018-02-05 12:39:54', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb201616443718a0028', '9b898329-cc1e-483a-8402-5ac53fb755e2', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1791', '2018-02-05 12:39:56', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb2016164555b950029', '0f31f288-5613-4a2e-9df8-6d10cc8403ce', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1776', '2018-02-05 12:59:30', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb201616455fe9f0036', '4e83f9c1-5f2e-44f4-946e-29cea06f08cd', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1777', '2018-02-05 13:00:12', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb20161645603530037', '0ba667cd-8ac1-4c5a-88e4-b2e08abb85bb', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1778', '2018-02-05 13:00:13', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb201616456068e0038', '29a96694-76e4-4b1b-9e0b-8cefcddf3bb5', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1779', '2018-02-05 13:00:14', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb20161645608d30039', 'a25195f7-9f02-4eb6-a2ca-3e8cde33f7b8', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1780', '2018-02-05 13:00:15', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb2016164560b0c003a', 'fdf1bc12-1126-48ad-924f-ba571576c8f1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1781', '2018-02-05 13:00:15', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb2016164560bff003b', '47e2daad-533a-4db9-b44c-158ecdcfd0a3', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1782', '2018-02-05 13:00:16', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb2016164562247003c', '8da75362-f5ed-4866-9b42-affe80846b9d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1783', '2018-02-05 13:00:21', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb201616457ebda0048', '4a4871fc-6c7d-4d29-82a3-e9cd05d6b267', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1784', '2018-02-05 13:02:19', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb201616457f36a0049', 'f074b1d5-90e0-4596-affa-c24a6fd7a031', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1785', '2018-02-05 13:02:20', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb201616457fab8004a', '3707fdd2-635e-406c-af71-e9c303bc00d6', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1786', '2018-02-05 13:02:22', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb2016164580354004b', '4d91564d-5937-4d88-8943-bc6c385afff3', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1787', '2018-02-05 13:02:24', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb2016164580e4c004c', '656b2d10-8e32-4f88-a5d1-a2f12d185542', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1788', '2018-02-05 13:02:27', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb201616458166f004d', '84b9df23-f7fc-4d72-8f2c-29f63eec862f', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1789', '2018-02-05 13:02:29', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb2016164581f34004e', '5f2def45-1337-4993-8195-a44182cf3c2f', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1790', '2018-02-05 13:02:32', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb2016164582d5f004f', '18a253fb-ebac-4107-8b2c-5efe3285d477', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1791', '2018-02-05 13:02:35', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb20161645835a80050', 'f493250f-7285-4e96-8555-fb9c05295a49', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1792', '2018-02-05 13:02:37', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb2016164583f590051', '5e77f54a-5a19-4674-8a56-e108ea51b3e0', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1793', '2018-02-05 13:02:40', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb20161645846d70052', 'd820beea-908d-490f-b4e3-5828ee50bb3e', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1794', '2018-02-05 13:02:42', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb2016164584d920053', '1574a355-0c20-4e8b-9c88-9505274e39e2', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1795', '2018-02-05 13:02:44', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261642eb20161645a95ac00a5', 'b0c6f452-07bf-48ff-9774-edadd3012da4', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1795', '2018-02-05 13:05:13', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616933b2e00002', '04918dd4-cbf6-4eef-b400-4dbfbf555301', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1817', '2018-02-06 11:40:50', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616933bae50003', 'e51ab767-82c6-4395-af3f-909036b9735a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1818', '2018-02-06 11:40:53', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616933c4b30004', '4c897d9b-7dbe-4381-8c5b-ad7e0cc5919d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1819', '2018-02-06 11:40:55', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616933ccfa0005', 'e75c9588-9cac-420d-ac2e-8a2296b4cfe4', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1820', '2018-02-06 11:40:57', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616933d4a10006', '9e6973a8-afb2-4ad8-be04-6c8c6929b012', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1821', '2018-02-06 11:40:59', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616933d5cf0007', 'c3d066e6-1514-4531-a68a-ac6b1712acff', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1822', '2018-02-06 11:41:00', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616933d6e80008', '7a3a892d-b6af-490c-b245-287dd98aa5cb', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1823', '2018-02-06 11:41:00', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616933dd240009', '5e4e37f3-f64f-4b02-8241-c9ec8e6d323a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1824', '2018-02-06 11:41:01', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616933de5d000a', '9a7ed56c-c2e9-4d90-954a-9ac725411e3f', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1825', '2018-02-06 11:41:02', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169384dc30059', 'e192423d-20e6-426a-9ced-24b898933064', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1826', '2018-02-06 11:45:53', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616939e560005a', 'b8d20ed5-0a68-4f70-908b-2bf00c3cbe5f', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '1827', '2018-02-06 11:47:37', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693cae55005b', '7e024e2f-d756-4570-b9c8-da88fdb28307', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '17', '2018-02-06 11:50:39', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693d23d60060', 'd3bc37d1-f4de-4bbc-b3b3-fb03e0e6e64c', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '18', '2018-02-06 11:51:09', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693d35320061', 'bf074cf1-6cf9-417e-a101-1f1f5e7e7b94', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '19', '2018-02-06 11:51:14', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693d3a760062', '5c02208d-ca33-4a99-9cde-7947adfdd2bb', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '20', '2018-02-06 11:51:15', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693d40770063', '95f4d7d9-727e-4677-905d-bff19b46a884', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '21', '2018-02-06 11:51:17', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693d46e60064', '1d9fbcc0-d6bd-4c21-aa9f-b180d4033f75', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '22', '2018-02-06 11:51:18', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693d4d760065', 'adef0077-b94d-481a-8e35-d112f0f07836', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '23', '2018-02-06 11:51:20', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693d52a80066', '59fa4648-293d-4567-b60a-39bca1588988', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '24', '2018-02-06 11:51:21', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693d58350067', '021da484-753d-4acf-b1cd-124d17282009', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '25', '2018-02-06 11:51:23', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693d5d980068', 'a7253973-a122-4fd5-badf-9ef6a2a6d543', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '26', '2018-02-06 11:51:24', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693d638c0069', '3caf543e-8777-4318-812c-b1f70edd9d1d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '27', '2018-02-06 11:51:26', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693d68b2006a', '74abfc96-efdc-4699-b863-b7e36a958d6b', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '28', '2018-02-06 11:51:27', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693d728c006b', 'edc30137-6009-4a02-bcd2-98e3efe7c0c5', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '29', '2018-02-06 11:51:30', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693d7a6b006c', '7c5b5382-46dd-4e7f-b4a2-768e25a21cac', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '30', '2018-02-06 11:51:32', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693d7fbf006d', 'a421ed08-a43d-48cc-afc3-e257de5496f6', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '31', '2018-02-06 11:51:33', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693d84f1006e', '94468e9e-574a-4bfe-b145-ea5fdd0e1c9e', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '32', '2018-02-06 11:51:34', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693d8cc1006f', 'bf089437-532c-4137-99d2-29e900c7603a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '33', '2018-02-06 11:51:36', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693d94550070', '6a9d747e-4e02-44b3-b299-5c1c589e1198', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '34', '2018-02-06 11:51:38', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693d991e0071', '9113c6f2-ad95-44f0-8dd9-bcd48e82c976', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '35', '2018-02-06 11:51:39', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693d9e560072', 'd897951c-f7e3-4d2f-9924-2bc65f74f51c', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '36', '2018-02-06 11:51:41', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693dbbbc0073', '2fea7277-297e-47ff-8903-02bbddee28d8', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '37', '2018-02-06 11:51:48', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693dc3160074', '9c251b43-0f68-4783-95c9-6a347e3e24b9', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '38', '2018-02-06 11:51:50', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693dc3ef0075', '164f3097-85bb-410c-8aa0-4ad90f22a79c', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '39', '2018-02-06 11:51:50', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693dcd750076', 'd19fb546-0f56-4e44-a11f-04fdabc858d5', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '40', '2018-02-06 11:51:53', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693dd6590077', 'ecdc421d-3e9f-4dbe-ae56-6ae1c34b187a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '41', '2018-02-06 11:51:55', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693ddd150078', '3bc18423-30b6-46de-b43d-2867a1b0cbc2', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '42', '2018-02-06 11:51:57', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693de1560079', '34bb3ef7-cc88-4bbe-94b5-8b36141379f8', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '43', '2018-02-06 11:51:58', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693de63e007a', 'c34333e9-eeb2-43b6-8e7d-a9529a92b0e6', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '44', '2018-02-06 11:51:59', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693dead2007b', '8d1b8623-12f4-4621-9abf-c92f1beb3ae9', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '45', '2018-02-06 11:52:00', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693def76007c', '93c7b667-9d99-4e9e-a972-a1d62b378c69', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '46', '2018-02-06 11:52:02', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693df3b8007d', '857558a3-5cba-43fa-8390-22325d2aef51', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '47', '2018-02-06 11:52:03', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693df7a2007e', 'cf2d3ec8-d737-4c3d-b9e9-92b00eef6df6', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '48', '2018-02-06 11:52:04', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693dfbde007f', '6840db1f-1c11-447a-96d8-424960baa763', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '49', '2018-02-06 11:52:05', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e0b570080', '3c62a210-a499-498a-b0eb-d4fe22c44ff2', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '50', '2018-02-06 11:52:09', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e10280081', '49009259-4409-476e-8798-56866d7c6e5f', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '51', '2018-02-06 11:52:10', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e14870082', '84a2b58d-4f7b-4d0b-ba80-95de9ffeddef', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '52', '2018-02-06 11:52:11', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e18eb0083', 'dd338e06-5e55-426e-aa3c-d36250980bb7', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '53', '2018-02-06 11:52:12', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e1e270084', '84c5b14f-47cb-4051-b3b6-608bc533f322', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '54', '2018-02-06 11:52:14', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e22b80085', 'c50e10f6-458e-4994-913d-4d0e7372b5c4', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '55', '2018-02-06 11:52:15', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e27570086', '71ebc887-d5ad-4c7f-8441-bab23cc90b61', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '56', '2018-02-06 11:52:16', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e35cd0087', 'dabed6b3-0c6b-4514-b01f-039db7796c95', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '57', '2018-02-06 11:52:20', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e3a280088', '5b090020-6bb6-4831-a839-50148e7efc22', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '58', '2018-02-06 11:52:21', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e3e000089', 'b91b9414-3510-41a5-8dd5-aa10c3c0b579', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '59', '2018-02-06 11:52:22', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e402d008a', '0e3a9b22-f88c-453a-a808-9ffb839c2ebf', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '60', '2018-02-06 11:52:22', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e60c2008b', '98ba84ed-7496-4e3c-bc90-9be2d59abfec', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '61', '2018-02-06 11:52:31', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e6496008c', '2f278e64-75f3-4584-a764-0dc7adca0c26', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '62', '2018-02-06 11:52:32', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e67e1008d', 'ab335388-cf8a-4935-9d5e-831dbf572029', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '63', '2018-02-06 11:52:32', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e6b81008e', '72415a5c-ad76-48e6-b5ca-0e88870d2546', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '64', '2018-02-06 11:52:33', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e6f54008f', 'd26887ff-30aa-44d7-8682-387ff5bb9d4f', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '65', '2018-02-06 11:52:34', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e73170090', '3e8fc9ec-ce67-4b69-837a-e6526333a86a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '66', '2018-02-06 11:52:35', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e770b0091', 'edacc8f9-fd45-495a-89b8-612718a97ef2', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '67', '2018-02-06 11:52:36', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e7a070092', 'a4e3cd95-1400-474f-98a1-e6d12186e5d5', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '68', '2018-02-06 11:52:37', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e7e070093', 'b5716d6e-22a9-4d8e-8029-154cd995668a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '69', '2018-02-06 11:52:38', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e81950094', '703ce939-9057-4306-863e-fb242b06d4ca', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '70', '2018-02-06 11:52:39', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693e9d3e0095', 'cbc19974-e9c4-48bc-8419-df43d84c305c', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '71', '2018-02-06 11:52:46', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693ea1610096', '3ac9663f-cf31-4ebe-96b3-8595632a2293', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '72', '2018-02-06 11:52:47', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693ea4c60097', '9437d37e-a6e7-4cbe-8013-0fa084857596', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '73', '2018-02-06 11:52:48', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693ea8320098', '264c7e29-de14-45a9-977e-bf5ea6157b0d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '74', '2018-02-06 11:52:49', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693eabbc0099', '9783a39a-ff27-4b72-9059-f5132969c00b', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '75', '2018-02-06 11:52:50', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693eaf31009a', '056466ea-bcfa-44d9-baf4-1835e504f663', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '76', '2018-02-06 11:52:51', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693eb2c0009b', '403e4f04-9313-48ee-96fd-e63336c90675', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '77', '2018-02-06 11:52:52', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693eb603009c', '52d1bf86-fdb3-4786-b0ee-b6ec155076b4', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '78', '2018-02-06 11:52:52', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693eb9cd009d', '9eb7ef75-de0e-478d-9dba-7dc8d92a31f0', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '79', '2018-02-06 11:52:53', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693ebd28009e', 'dba19184-04bb-4fd5-9063-0d79c0ac8033', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '80', '2018-02-06 11:52:54', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693ed297009f', '63c285de-08bc-47c6-8e62-c7f311bd530b', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '81', '2018-02-06 11:53:00', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693ed60e00a0', '1a4cc605-9580-4682-87bb-5ec16f322695', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '82', '2018-02-06 11:53:01', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693ed9a000a1', '233baa41-cb2b-4390-b4eb-a93d2ad5ec32', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '83', '2018-02-06 11:53:02', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693edd6700a2', '3cf0c21c-a4b9-458b-9bb6-2938017ceff7', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '84', '2018-02-06 11:53:02', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693ee16300a3', '0934d4eb-79c3-481b-88e2-8a464ad2b476', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '85', '2018-02-06 11:53:04', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693ee50f00a4', '1e87f111-543a-4ca3-8afd-506f2ca7cef6', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '86', '2018-02-06 11:53:04', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693ee89700a5', '8bc1794f-e895-401c-b4e4-635a4c914713', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '87', '2018-02-06 11:53:05', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693eec8c00a6', '4395ba64-52fa-4be1-b4d4-3077773cd7b1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '88', '2018-02-06 11:53:06', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693ef04b00a7', '67f6a1b5-a5c7-487c-8819-abad622f9348', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '89', '2018-02-06 11:53:07', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693ef41300a8', '97ac992a-cd89-49b0-9967-991cfe348335', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '90', '2018-02-06 11:53:08', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f057e00a9', 'a5abb34b-9c08-41dc-b06f-3372c54b2521', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '91', '2018-02-06 11:53:13', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f093900aa', 'd303745d-640f-4b8b-8b0b-2365cf4018c7', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '92', '2018-02-06 11:53:14', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f0cd100ab', 'ba46c7a1-0e32-47f4-bd67-0cd9709b9dee', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '93', '2018-02-06 11:53:15', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f106d00ac', '44e267f4-e452-4447-aa1d-dbf43736228b', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '94', '2018-02-06 11:53:16', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f139d00ad', '0aa2f673-2de9-480f-befb-0c11ca140013', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '95', '2018-02-06 11:53:16', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f179400ae', '51de0310-6e03-4b86-a5b0-2929d5f239f2', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '96', '2018-02-06 11:53:17', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f1b2800af', '33fab336-8dc9-4a0f-9dac-52c1a34dc05a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '97', '2018-02-06 11:53:18', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f1ef400b0', '48cb6590-8eb2-4ae5-a407-d6b04e48e1cf', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '98', '2018-02-06 11:53:19', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f227200b1', '3fc4082b-b696-4bb6-8d3c-a29c5bce0e61', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '99', '2018-02-06 11:53:20', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f268d00b2', 'ea647ee5-c40f-48c7-a9b3-7b04b574b690', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '100', '2018-02-06 11:53:21', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f3cf100b3', '994a1dee-e29b-4b88-b875-81ad20fa3a69', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '101', '2018-02-06 11:53:27', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f409500b4', '9bc169fc-3f74-4bda-bb7f-534281e43a9e', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '102', '2018-02-06 11:53:28', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f446500b5', '2f43ee78-fc5e-484c-8d52-4046fdff8a2a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '103', '2018-02-06 11:53:29', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f47f700b6', 'dccb362d-57a6-43ff-b2a6-eb271cc841ac', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '104', '2018-02-06 11:53:30', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f4b6200b7', 'cf53156b-fbdd-43b1-b4f8-aac5e4380682', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '105', '2018-02-06 11:53:31', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f4efd00b8', '9d3f5ebd-2265-43ab-98e6-68c72b76cb9a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '106', '2018-02-06 11:53:32', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f52ee00b9', 'b4c13fc2-502b-458c-97cc-6d7fc7f9a8e7', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '107', '2018-02-06 11:53:33', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f574c00ba', '2ac65592-fc12-4173-9917-087bde74ed21', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '108', '2018-02-06 11:53:34', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f5ac300bb', '7e9af49d-c312-4539-b814-7076026c674c', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '109', '2018-02-06 11:53:35', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161693f5e2a00bc', '5bd38326-c4b4-4a6f-b2ab-0540bb48d9dd', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '110', '2018-02-06 11:53:35', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169410aef00ce', 'a44ff1ec-1751-4e9b-b631-dd9f7d9d0c1a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '111', '2018-02-06 11:55:25', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169410db900cf', '2e5cd719-5f4d-4272-a31f-54d4f7e85726', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '112', '2018-02-06 11:55:26', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169411ce400d0', '92ca56f8-5b21-4edb-acb7-fe4037fd4e47', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '113', '2018-02-06 11:55:30', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161694120ab00d1', 'a9e5c1f7-76d8-40fb-9e62-175dac8ed4c4', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '114', '2018-02-06 11:55:31', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616941262700d2', '94d20c5b-3116-4dca-a82c-ea383995db2a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '115', '2018-02-06 11:55:32', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616941348c00d3', 'f4e32d8b-fe78-4056-854b-af97585e0127', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '116', '2018-02-06 11:55:36', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161694137bb00d4', '50ffb2eb-5d2a-441f-bfe9-24025af6d7ac', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '117', '2018-02-06 11:55:37', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169414ae500d5', '2e1061f8-3887-4b16-8a47-7788037b8dff', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '118', '2018-02-06 11:55:42', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616941504200d6', 'fae75072-f93d-49ed-a564-7baa5dc78806', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '119', '2018-02-06 11:55:43', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616941565b00d7', 'afa09d0c-e01a-4ba7-b4a5-81585d3b4963', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '120', '2018-02-06 11:55:45', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169415c4800d8', 'd4836dcb-58d5-4266-bac9-8eaa7a2a9c1b', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '121', '2018-02-06 11:55:46', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616941e6c500d9', 'd610d6b9-1f40-4e61-866d-eb9b1c4cda00', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '122', '2018-02-06 11:56:21', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616941f00900da', '1be13b13-c894-4c36-a94f-63190c843749', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '123', '2018-02-06 11:56:24', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616941f3ff00db', '1a77f83b-609b-45fc-ac1d-03e4b7697908', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '124', '2018-02-06 11:56:25', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616941f82100dc', '4142fdea-e992-4ecb-9009-ac4e34130c2e', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '125', '2018-02-06 11:56:26', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616941fe1a00dd', '7155fed5-b6d3-47c9-981e-30f5f72d0687', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '126', '2018-02-06 11:56:27', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942020c00de', '56d342aa-e6a7-47f5-9b7b-e9fdef62238e', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '127', '2018-02-06 11:56:28', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942088f00df', '8b43ee15-cc5b-4852-ad85-f04a563c3178', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '128', '2018-02-06 11:56:30', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169420ce500e0', 'c1e3e06c-f41b-4765-8a19-775df3fa164c', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '129', '2018-02-06 11:56:31', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942107100e1', '68e4ac8b-b6d3-4755-9f15-6adc6a7e89ea', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '130', '2018-02-06 11:56:32', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942149c00e2', '26556524-7fae-4ad0-b293-c1cfa9c20ff9', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '131', '2018-02-06 11:56:33', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942186a00e3', 'a77a2048-922b-453e-bef5-251283605583', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '132', '2018-02-06 11:56:34', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169421ca100e4', 'c7ce5abd-4811-4c1b-88e0-6ac39aabf6b6', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '133', '2018-02-06 11:56:35', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161694220d100e5', '3f390cb5-b210-4841-8469-c31edcf8a416', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '134', '2018-02-06 11:56:36', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942248c00e6', '25cc0ef7-a381-403b-b1ef-95b932df7728', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '135', '2018-02-06 11:56:37', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161694228e000e7', '2c2107d5-9d72-45da-9fe4-f2187d3c3185', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '136', '2018-02-06 11:56:38', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169422ce300e8', '6291831e-cea8-4b8c-8144-8533e41a287d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '137', '2018-02-06 11:56:39', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942310a00e9', '01de155d-e934-4fcf-9e4d-baf96be0f7a1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '138', '2018-02-06 11:56:41', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942355f00ea', 'afbdbcb2-ef4a-4112-9b05-d54e838e6dc1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '139', '2018-02-06 11:56:42', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161694239b700eb', 'f37c4dd6-e373-4362-9d91-b4c535793775', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '140', '2018-02-06 11:56:43', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169423d8b00ec', 'fe3fb5aa-d023-453f-a0f4-0aff850d68cb', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '141', '2018-02-06 11:56:44', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169424b2600ed', 'a9cd9160-f160-4320-aca4-c09b85452555', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '142', '2018-02-06 11:56:47', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942508f00ee', '6cb4fe9a-9076-4271-8683-1180a8853f13', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '143', '2018-02-06 11:56:49', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942545900ef', 'b952c1f1-b13c-434c-ac58-617b6c899230', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '144', '2018-02-06 11:56:50', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161694258c800f0', '0d064708-1e66-4b90-ba5d-f0bd1ff168eb', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '145', '2018-02-06 11:56:51', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169425c5800f1', 'b1dcd347-bc15-4a9a-a5d7-af23aa891d80', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '146', '2018-02-06 11:56:52', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942605200f2', 'def8d278-b5e4-463f-9743-994d32b0c9c9', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '147', '2018-02-06 11:56:53', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942642200f3', '15d76fca-1a81-4e72-8a2e-f2c9cc1ed220', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '148', '2018-02-06 11:56:54', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942681900f4', 'd7e09bfc-d18b-4a21-a033-678c3cda24a4', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '149', '2018-02-06 11:56:55', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169426c0300f5', '94283dac-49c2-4dea-b588-c668020b8452', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '150', '2018-02-06 11:56:56', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169426ff300f6', '328b2a68-b9f4-47a7-825b-d7382a03c4bb', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '151', '2018-02-06 11:56:57', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161694273c800f7', '9dc79735-c4c8-4e1b-8a16-ea99d56323cc', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '152', '2018-02-06 11:56:58', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942778300f8', 'e321560d-c969-4c6e-994e-b3d8c85086db', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '153', '2018-02-06 11:56:59', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169427bb200f9', '106274a9-4907-4ed2-b751-e3c89ea0670a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '154', '2018-02-06 11:57:00', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942801500fa', 'fd4f7ef7-5232-4385-96c8-568dd23f4a2c', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '155', '2018-02-06 11:57:01', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942837900fb', 'ac150628-a139-4bd2-8f45-d2306e213913', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '156', '2018-02-06 11:57:02', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942877200fc', '1f7c7869-20a4-427d-b72b-737a4ce23d9d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '157', '2018-02-06 11:57:03', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169428aff00fd', 'ebc71a30-70ce-4515-a76b-ec8d261f57eb', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '158', '2018-02-06 11:57:04', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169428eb800fe', '0565701e-e046-40ea-a5c0-99fe7b500544', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '159', '2018-02-06 11:57:04', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161694292db00ff', '10d36c78-b190-44f9-b5cd-adb1e97d7279', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '160', '2018-02-06 11:57:06', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161694296a10100', '7e1f2984-9ca7-49a0-895e-c7598e62a7d2', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '161', '2018-02-06 11:57:07', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169429a660101', 'f122fd25-7f1f-4743-b8d4-ae9887223eaf', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '162', '2018-02-06 11:57:07', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169429e540102', '45bfd8ae-f560-4b2d-8410-02569788dfba', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '163', '2018-02-06 11:57:08', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942a1e70103', 'e011bbd0-73c2-41e1-a3c3-7fadc4cdc041', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '164', '2018-02-06 11:57:09', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942a6320104', '8cc7e262-476f-4cc4-9800-8dcc7a817123', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '165', '2018-02-06 11:57:11', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942aa320105', 'b5a16da9-c74c-4b3d-8daf-6b4b280002d6', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '166', '2018-02-06 11:57:12', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942adcd0106', '647ae76d-f50e-4a64-86e7-ee936d96a051', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '167', '2018-02-06 11:57:12', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942b2290107', 'a9f0850e-7132-4409-8a95-b3c3ad631faa', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '168', '2018-02-06 11:57:14', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942b5ca0108', '6303afe1-d866-44af-a419-a0fc506da302', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '169', '2018-02-06 11:57:14', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942b95c0109', '4db76e6c-6093-4196-9cb2-0550c6a8b4ff', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '170', '2018-02-06 11:57:15', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942bd94010a', '61aef540-e628-4cac-a077-688fb1bba875', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '171', '2018-02-06 11:57:16', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942c126010b', '6002a2ff-d48b-4a90-ac80-11b86889f595', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '172', '2018-02-06 11:57:17', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942c4ec010c', 'a51669d9-5946-4333-8f8b-eaf00ebb1a37', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '173', '2018-02-06 11:57:18', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942c8b4010d', 'b86a400a-9687-4be7-8b66-7eb866f162fe', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '174', '2018-02-06 11:57:19', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942ccae010e', 'df978a28-fdb2-4c84-8595-791943cccbbf', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '175', '2018-02-06 11:57:20', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942d070010f', 'c6c79665-577f-4179-8b7f-7e5c6f122480', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '176', '2018-02-06 11:57:21', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942d4400110', 'fe7c8efb-5010-42f8-975e-be3234d4c297', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '177', '2018-02-06 11:57:22', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942d83d0111', 'acd90982-d071-4edd-bf3c-382dcf6e458f', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '178', '2018-02-06 11:57:23', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942dc010112', '002d404d-8dad-4927-a870-fbeca4c685aa', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '179', '2018-02-06 11:57:24', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942dfbd0113', '9742cd0e-b4e4-4e52-933d-77e0d735f841', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '180', '2018-02-06 11:57:25', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942e3b20114', 'ca521fb0-e5d8-4722-bb99-84df3701aaff', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '181', '2018-02-06 11:57:26', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942e7a90115', '1ac36227-69bb-4fac-af4e-ce520ee56f83', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '182', '2018-02-06 11:57:27', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942eb730116', '672ca817-1a7d-4a26-a0b3-48eca8c17511', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '183', '2018-02-06 11:57:28', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942eed90117', 'd3bae17d-e11e-4a89-a2e6-c93c20992ee4', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '184', '2018-02-06 11:57:29', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942f2f90118', '8bffd115-9c69-4209-a9b1-8b534d76be5a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '185', '2018-02-06 11:57:30', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942f6fc0119', 'cb6f47b3-cc95-4147-a2d2-e6fe02ccd13b', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '186', '2018-02-06 11:57:31', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942fac8011a', '3a374992-9170-47ac-929f-bed702bad82b', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '187', '2018-02-06 11:57:32', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616942fec6011b', '4077030e-76a1-40d4-97c1-dff96c246c4d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '188', '2018-02-06 11:57:33', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616943027b011c', 'f959b1da-23ff-4557-9aa4-4f71eb736ba3', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '189', '2018-02-06 11:57:34', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161694306ce011d', 'e4701311-9dbb-46de-9f98-1db53fa9dea3', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '190', '2018-02-06 11:57:35', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161694697ec011e', 'ec38c560-d523-4d14-86a3-41f91f2055c1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '191', '2018-02-06 12:01:29', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616946a327011f', '88a7e18d-4239-40d8-8a84-88378a0ffceb', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '192', '2018-02-06 12:01:32', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161694b7df90127', 'feb7ab04-2406-4d8c-9ff7-bb661c700afd', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '193', '2018-02-06 12:06:50', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161694bc257012a', 'da2db1a8-abf4-4dd7-b007-24ef2f402253', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '194', '2018-02-06 12:07:08', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161694bc9a5012b', 'da7b7b23-b8a5-4905-a67c-61edc3772d3a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '195', '2018-02-06 12:07:09', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616954ebc3012c', '4dff5aac-3795-432f-94e0-dba897e0fb31', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '196', '2018-02-06 12:17:08', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616954f0c0012d', 'bd23cf1d-26cf-4775-9b75-c3366c0191ee', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '197', '2018-02-06 12:17:09', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec101616954f696012e', '598d979a-f735-4ddf-a0fd-75f8560969f0', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '198', '2018-02-06 12:17:11', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169553823012f', '6f46c89d-4f34-4814-91bc-97d2e515bb3b', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '199', '2018-02-06 12:17:27', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec10161698468d10133', 'dc5b658b-5917-4a02-aaca-83b3f521be43', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '200', '2018-02-06 13:09:00', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169847cfd0134', 'ca194364-c995-4877-8e68-cba3d96645b9', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '201', '2018-02-06 13:09:05', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169b3c3cb013e', 'db1c0ee4-6a67-49fc-bef3-76d5e0420a86', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '202', '2018-02-06 14:00:44', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169b3cf1d013f', '8267779c-d955-453f-8e5c-f98840c16d02', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '203', '2018-02-06 14:00:47', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169b3d3b10140', '2966a7f3-ea13-4f0b-8986-c7fecf71fc79', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '204', '2018-02-06 14:00:48', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169b3d6b50141', '19105267-aac0-4f8b-ad0f-09cf173e69ce', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '205', '2018-02-06 14:00:48', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169b3d9510142', '8b699e54-529f-4956-822f-0e69973c8f8c', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '206', '2018-02-06 14:00:49', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169b3dc850143', 'b9e267f4-f4df-444d-bc6d-2431e311de16', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '207', '2018-02-06 14:00:50', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169b3dffa0144', '445bd4cd-4dbc-4d17-ae6b-c2f2a27fd17d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '208', '2018-02-06 14:00:51', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169b3e2900145', '6744409a-d660-4826-914b-241476ad3fd1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '209', '2018-02-06 14:00:52', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a1261692ec1016169b3e5c70146', 'f72207ea-c901-4d7e-8ca0-62d9d7ec0736', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '210', '2018-02-06 14:00:52', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a5016169b75ff80003', '5e6b01ca-adc1-45e5-a1b0-c1e572bc920d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '211', '2018-02-06 14:04:40', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a5016169b789d20004', '9c4be9a1-e7aa-4376-a489-f70b61c9dc46', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '212', '2018-02-06 14:04:51', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a5016169b791cf0005', '8eb5962c-bef0-4f26-9917-ca59cc62c4ff', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '213', '2018-02-06 14:04:53', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a5016169b798ec0006', '43a81146-4f21-47c8-ae05-87804c24a454', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '214', '2018-02-06 14:04:55', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a5016169b7a1cc0007', 'abdf3c6f-f0cf-468d-95cb-c5da9fb22b39', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '215', '2018-02-06 14:04:57', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a5016169b7a8ed0008', '4a499600-82ac-418a-91b6-b7e2888cdea7', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '216', '2018-02-06 14:04:59', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a5016169b7aece0009', '1200fb68-0ccf-4fc4-bb35-58d4fe1d8b35', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '217', '2018-02-06 14:05:00', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a5016169b7b439000a', '1ee63af5-db32-4548-b8f7-a7402d6dfc48', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '218', '2018-02-06 14:05:02', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a5016169b7b926000b', 'a49fbf17-7c83-4fb1-9616-e7dde05b7617', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '219', '2018-02-06 14:05:03', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a5016169b7be8d000c', '9a767772-4d95-4c8c-bf86-75bb4b7aaeaa', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '220', '2018-02-06 14:05:04', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a5016169ba7f34000d', '39d5f1e8-44eb-4bf0-9982-f068edb7ade3', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '220', '2018-02-06 14:08:05', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a5016169ba8671000e', 'ff53e2a4-37c7-4903-b94a-c1d9d2c2cbf1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '221', '2018-02-06 14:08:07', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a5016169ba89e0000f', '1ef33bc9-55f6-429d-a102-8f3b1e380fcd', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '222', '2018-02-06 14:08:08', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a5016169ba8e050010', 'dec21c11-95ba-421b-9a6a-6a5f8736854e', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '223', '2018-02-06 14:08:09', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a5016169baa5970011', '75a571cd-e1c3-491a-99c9-b487f59c31f6', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '224', '2018-02-06 14:08:15', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a5016169baaa620012', 'd7f01adc-494b-4195-b705-211d901136f5', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '225', '2018-02-06 14:08:16', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a5016169baaf0e0013', '17b4f9cd-3c12-4021-bb50-7e05e42de6d2', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '226', '2018-02-06 14:08:17', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a501616a51e8bb0020', 'f697a862-67c9-4f5c-9257-afaa52a23a4e', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '227', '2018-02-06 16:53:28', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a501616a51e98a0021', 'd4ef9459-ed35-499e-8ee7-b02537743f05', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '228', '2018-02-06 16:53:28', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a501616a52cfff0022', '55e7eb58-e832-4708-be70-2bf5e5cbbc31', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '229', '2018-02-06 16:54:27', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a501616a52d3c30023', '8f8f45ed-8fc1-4b0a-84f9-e95c2f6d637d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '230', '2018-02-06 16:54:28', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a501616a52d8000024', '705ac7a9-8c4a-47a7-9605-70f256f6a1f4', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '231', '2018-02-06 16:54:29', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a501616a52f1f40025', '6ae51a93-5bd2-4f84-ad11-32cef4a42181', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '232', '2018-02-06 16:54:36', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a501616a52f81e0026', '24a8021c-0463-4205-95ed-109f9e761a0f', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '233', '2018-02-06 16:54:37', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a501616ac00a320036', '826aad4c-899d-45e6-8072-bcd7dfe5595a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '234', '2018-02-06 18:53:45', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a501616ae4cc07004c', '6201e42e-d800-44f1-a85d-bc3967d63e27', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '235', '2018-02-06 19:33:54', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a501616af12a6e004d', '569c7201-6048-48b5-9012-8c92e73b49ec', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '236', '2018-02-06 19:47:25', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a501616af12e05004e', 'cb86da7f-f2d8-4ec0-af3d-5b718bb834bb', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '237', '2018-02-06 19:47:26', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126169b5a501616af12ee6004f', 'fa3f07ab-574f-4f4a-b6ae-70ffb99298b0', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '238', '2018-02-06 19:47:26', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616de84bda0000', '680c0ebf-4901-4237-93c3-24b3836cf9fd', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '238', '2018-02-07 09:36:33', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616de92df50005', '0c1351d5-117c-49d7-99e2-18caaf88fa34', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '247', '2018-02-07 09:37:33', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616de9390c0006', 'e93c78bb-fe11-4dba-9308-2389dc14dc67', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '248', '2018-02-07 09:37:35', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616de93ab70007', '8b8580b6-f629-4eb7-a842-89c48ec60b18', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '249', '2018-02-07 09:37:36', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616de93e470008', '5e2735d0-60f7-459c-8bd3-da9fe006c388', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '250', '2018-02-07 09:37:37', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616de978970009', '4a84e8d5-28f0-409c-8799-52bc41f0a768', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '251', '2018-02-07 09:37:52', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616de97e07000a', 'b56636d7-bfc6-41b6-95ab-810b8b1dc13c', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '252', '2018-02-07 09:37:54', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616de9831f000b', 'd50d5e12-2c52-42a9-8c9a-920970f7f61a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '253', '2018-02-07 09:37:55', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616de987c2000c', '51c0b088-1f9a-4256-8ab6-d4f096358bef', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '254', '2018-02-07 09:37:56', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616de9b34e000e', '7c75c807-d9c7-4d06-b6b5-cfa02eed4ca1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '255', '2018-02-07 09:38:07', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616df39bcf0018', 'dfb60001-1c44-488a-bf0a-8cec8517b917', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '256', '2018-02-07 09:48:57', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616df39ce00019', 'c49ec00f-8d18-4a1a-936a-4fce3719b071', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '257', '2018-02-07 09:48:57', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616df39e41001a', '9478bb88-071f-4700-8240-86dd191221bd', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '258', '2018-02-07 09:48:57', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e63dd81002d', '3119d7d5-d502-4ac7-a652-c6b6b2256725', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '259', '2018-02-07 11:51:33', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e63e0e2002e', 'ebe99dff-d8bf-437a-8537-30dc7e5bf770', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '260', '2018-02-07 11:51:34', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e63e965002f', '83ecc188-3f16-44e3-8e83-a4cf924225ca', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '261', '2018-02-07 11:51:36', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e63ebed0030', '437e196e-1066-43c9-9013-d8ee94068b62', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '262', '2018-02-07 11:51:37', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e63efa80031', 'a6823961-855b-42a3-bfbc-366523b1e82e', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '263', '2018-02-07 11:51:38', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e63f6890032', '50f0dd52-2dae-45a4-94e6-bfe1f43f39f8', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '264', '2018-02-07 11:51:40', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e63f75f0033', 'fa90f6a6-721b-468d-9233-705778a00603', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '265', '2018-02-07 11:51:40', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e63f8c90034', '7cf42577-fe95-4c9c-b480-bfb5db2421b3', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '266', '2018-02-07 11:51:40', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e63fa260035', '2891de23-de11-4066-a4a9-75741c5b79fa', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '267', '2018-02-07 11:51:41', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e63fd4a0036', '8984c9f4-0853-41f9-9bb5-bf56f1cd1dab', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '268', '2018-02-07 11:51:42', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e6408c00037', '4b7f3d71-70c0-4721-ad87-cc754cfd0f25', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '269', '2018-02-07 11:51:44', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e640dc00038', '4e7a59de-efe2-46f9-927b-13b46164c289', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '270', '2018-02-07 11:51:46', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e6410cb0039', '5f91b410-44f8-4795-8034-926197495d2f', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '271', '2018-02-07 11:51:47', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e64126d003a', 'c4bb996a-af02-4394-88d4-850a68649681', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '272', '2018-02-07 11:51:47', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e64195a003b', 'd3f40d90-1b23-48a5-9ea0-5ddd45b035a0', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '273', '2018-02-07 11:51:49', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e67ac40003c', '9669cd9c-058c-48fe-9686-efbc3d4e082d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '274', '2018-02-07 11:55:43', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e67b628003d', 'ca4b1c27-5eab-4a24-a3fd-f8a99180f6bf', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '275', '2018-02-07 11:55:45', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e67ba17003e', 'dbcbeb05-b6ad-4282-9943-f54d2f3f3750', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '276', '2018-02-07 11:55:47', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e67c056003f', '8f877910-3a06-4376-97b1-bd07c8932e1a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '277', '2018-02-07 11:55:48', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e67c84f0040', 'bb7f128f-bc0e-4768-990e-6447b06a3a8d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '278', '2018-02-07 11:55:50', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e69fabe0057', 'ac336515-5931-4033-a841-82343a1c0db0', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '279', '2018-02-07 11:58:14', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e6a044a0058', '05497b26-9566-4b98-a44f-b330add7c303', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '280', '2018-02-07 11:58:17', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e6a20780059', 'd925ee7e-7c8e-429f-831f-335c00854742', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '281', '2018-02-07 11:58:24', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e6a2792005a', '345f4f21-6b3e-43ed-9c66-d8aa9acd7569', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '282', '2018-02-07 11:58:26', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e6a32c8005b', 'af12e077-38a1-400d-83eb-3491b3f05ecc', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '283', '2018-02-07 11:58:28', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e6a3863005c', '9c79ed8c-64b8-4c77-a7ca-1afbbc9fb7bc', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '284', '2018-02-07 11:58:30', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e6a4b68005d', 'b9d41c17-c7a7-4d80-accb-47701595c0c8', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '285', '2018-02-07 11:58:35', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616e8382d4007b', '2612f3e9-6b54-4c83-a55f-71fa6fdd03d5', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '286', '2018-02-07 12:26:07', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616ee498980082', '8c9cfd7c-3a20-4dfa-b2da-3c57da8681db', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '289', '2018-02-07 14:12:10', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616ee499910083', '2ee29749-af3b-40a4-a0d9-d287b4a40d86', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '290', '2018-02-07 14:12:10', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616ee49af50084', '0327fd27-a954-4e23-8f62-853d745b4770', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '291', '2018-02-07 14:12:11', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616ee7a8f40085', 'd41ba086-d1e2-44c1-bcf8-67785124f2bd', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '292', '2018-02-07 14:15:31', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616ee9f2690086', '24e35190-cfde-419f-8f55-6bb14cec0414', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '293', '2018-02-07 14:18:01', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616de60401616ee9f4d50087', '0525e552-f337-4d74-86e7-422b75637f66', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '294', '2018-02-07 14:18:01', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616ef51e01616ef77a160000', '6fea0cfa-ef19-4a88-98ca-206fd610b939', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '294', '2018-02-07 14:32:46', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616ef51e01616ef7ce040007', '4cd9cf21-0308-4e1b-a0fd-ca984c949663', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '295', '2018-02-07 14:33:09', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616ef51e01616ef7cf080008', '63b2a1f6-80d5-468b-98e8-4775be159900', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '296', '2018-02-07 14:33:09', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616ef51e01616ef7d7fa0009', 'f17c5d2f-de8e-456a-babc-1010dc15e5fc', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '298', '2018-02-07 14:33:11', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616ef51e01616ef7d932000a', 'da677993-fb76-49f7-a239-ada7ae2faf3d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '299', '2018-02-07 14:33:12', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616ef51e01616ef7df14000b', '119795a7-851a-445f-9e5a-85e4b7f4479a', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '301', '2018-02-07 14:33:13', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616ef51e01616ef7e4bd000c', '6ebcf0a6-c4f0-4cf4-b302-e0f0610fc63c', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '302', '2018-02-07 14:33:15', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616ef51e01616f0e4839000d', 'a222978f-fbe5-4c5c-86a8-8244186c4f26', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '303', '2018-02-07 14:57:42', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12616ef51e01616f4e1c0e0014', 'ab1aaca2-a0cd-42a8-8974-93f0caab2edd', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '304', '2018-02-07 16:07:25', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a059def0015', '2d9eddb1-0a48-4e78-9f8d-4599dd817dc5', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '21', '2018-02-09 18:04:06', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a06c9ee001c', 'fae10888-44bc-4220-a569-95011390a5d1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '21', '2018-02-09 18:05:23', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a06de3c001d', '6d9edbe0-b0c9-441b-b7ce-2a2f560eebc4', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '22', '2018-02-09 18:05:28', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a06e19b001e', '0da3cae4-9071-44c1-affe-b08c5d9c018f', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '23', '2018-02-09 18:05:29', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a06e57c001f', 'bc42dd73-32ef-4173-bc88-9b770d3c78a6', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '24', '2018-02-09 18:05:30', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a06f9a80020', 'b25191b0-a0e7-4f2c-8818-550b7eccf1c4', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '25', '2018-02-09 18:05:35', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a06febe0021', '57f83120-c823-4376-be52-179be637dfb8', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '26', '2018-02-09 18:05:36', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a0703bf0022', 'f18f72f7-8d63-4d5f-9f52-84aa479b67bb', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '27', '2018-02-09 18:05:38', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a0709710023', 'a6083cee-d39b-4465-ad8e-7674ab899d20', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '28', '2018-02-09 18:05:39', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a070e910024', '8dd30916-403b-4e60-8675-9cca15b9b18c', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '29', '2018-02-09 18:05:40', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a0713fc0025', 'c9821792-a67c-4cd7-a859-06aab21eef99', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '30', '2018-02-09 18:05:42', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a0718a00026', '22bdddea-febf-4364-ae02-0e2a8a4235a2', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '31', '2018-02-09 18:05:43', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a0a7ef0002c', 'f37a1b46-c819-4904-9963-746339a40275', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '31', '2018-02-09 18:09:25', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a0af67a002d', '58152e19-a0d8-460d-9413-da8dea43d766', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '32', '2018-02-09 18:09:56', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a0afa82002e', '9a65a9f4-0499-474b-b90b-62fe0724f99f', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '33', '2018-02-09 18:09:57', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a0b02b6002f', '94d8fecc-9a24-4c16-a74e-a322b5dc4a07', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '34', '2018-02-09 18:09:59', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a0b08940030', '034592d0-f361-4573-89fb-7a80534e3486', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '35', '2018-02-09 18:10:01', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a0b0d800031', 'ca9510fc-9077-4c6c-9bbb-afac400e6ad7', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '36', '2018-02-09 18:10:02', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a0ddd520033', 'a501af8c-7294-43ef-b2a0-4ccf8f5bceae', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '36', '2018-02-09 18:13:06', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a1357ae0034', '10612eab-1a5c-4cd9-9603-ec4caab739b5', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '37', '2018-02-09 18:19:05', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a1a684d0038', '96bf2aac-0b65-41fa-b7ad-98d63c8fe63d', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '37', '2018-02-09 18:26:48', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a1a80b60039', '34d8f663-bb5a-4079-a8d6-795057e185f7', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '38', '2018-02-09 18:26:54', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a1aab01003b', '331fff40-fead-4b7a-9638-4fa708169065', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '39', '2018-02-09 18:27:05', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a1ad643003c', '09fa88de-f714-41fe-9fc1-ee2c5cd401f1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '40', '2018-02-09 18:27:16', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a1adf70003d', 'deab875e-762b-44a5-9fc0-f305fea153b7', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '41', '2018-02-09 18:27:18', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a1ae66e003e', '5325eaaf-94f6-4e10-9c03-610b086788dc', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '42', '2018-02-09 18:27:20', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a1b34d40048', 'ef541947-b558-42de-9a90-cd52e11bf230', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '43', '2018-02-09 18:27:40', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a1b3b7b0049', 'd572f72c-0744-479a-9ee1-002e98af2c06', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '44', '2018-02-09 18:27:42', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a37f48f0055', 'fb531f7e-f813-4079-a2bf-08a8f7148680', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '45', '2018-02-09 18:59:04', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a37f9860056', '7404bff3-e89f-4b6a-be8c-cbbc03829df6', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '46', '2018-02-09 18:59:05', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a3a923a0057', 'c24d0551-b9fb-4691-9c98-c08b7e7f84de', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '47', '2018-02-09 19:01:55', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a3a93330058', '6645b682-a3a2-434a-bf70-610b186913f4', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '48', '2018-02-09 19:01:56', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a3b994e0059', '669bd8b1-e7aa-43db-9dab-86216626aab6', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '49', '2018-02-09 19:03:03', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617a3ba2a4005a', '04cc3a4f-2d5b-4884-920c-8de6f23a09b9', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '50', '2018-02-09 19:03:05', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617d314e180131', '98e2d9f7-79f4-487d-b06f-2b0c3bf1f2f4', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '51', '2018-02-10 08:50:38', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617d31533c0132', '5666565a-34ac-4d1b-a082-8f439e886dc1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '52', '2018-02-10 08:50:39', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617d3158df0133', '36524305-26f4-40d7-b001-170f6636ad66', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '53', '2018-02-10 08:50:41', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617d3761e2014a', '2cfe15ca-f14e-495d-8803-3ac03701032f', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '54', '2018-02-10 08:57:16', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a126178ad3801617d3762f9014b', '936e9689-cea0-48de-897a-9ada9e6b0e8f', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '56', '2018-02-10 08:57:16', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12617d3d9501617d42b519001b', '0e1f5a98-f244-4fad-b12d-9d889cc3b4d6', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '58', '2018-02-10 09:09:43', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12617d3d9501617d42c2fe001c', 'a071969e-6601-42ee-9c28-f8bfb8a8d318', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '59', '2018-02-10 09:09:47', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12617d3d9501617d42c3ea001d', '2d913bbf-8e21-4745-ab17-994057be9897', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '60', '2018-02-10 09:09:47', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12617d3d9501617d8c8aed003f', 'de2f20cd-6d45-4aa6-962d-331ce856fc8f', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '61', '2018-02-10 10:30:22', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12617d3d9501617d8c90fe0040', '846f07fd-e27b-47d8-8b8b-9bf3a70e1101', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '62', '2018-02-10 10:30:24', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12617d3d9501617d8c97bd0041', '099d8c75-267b-458a-bef3-0cb5bd778473', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '63', '2018-02-10 10:30:25', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12617d3d9501617d8c9dab0042', 'ea90f388-450f-4c78-b685-9e40b7aea91c', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '64', '2018-02-10 10:30:27', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12617d3d9501617d8ca6ac0043', '9d6e0685-bea5-49cf-9de2-3fd61e0ea938', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '65', '2018-02-10 10:30:29', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12617d3d9501617dcec165005c', '04a99df2-da3a-4de5-8785-3b936ab6f77c', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '66', '2018-02-10 11:42:41', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12617d3d9501617dcec248005d', '2e3e25b7-d600-4a85-8e83-9c764beecaf9', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '67', '2018-02-10 11:42:42', null, null, null, null, null, null);
INSERT INTO `log_PackageBizRecords` VALUES ('8a8a8a12617d3d9501617dd277890064', '57746c0e-c967-4421-a218-11c62fa41ebf', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工作组1', '8a8a8a0b614aac9d01614abaae0d0006', '装箱工站', '8a8a8a0b614aac9d01614abaae0d0006', '红外对射计数器', '68', '2018-02-10 11:46:44', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `log_RemoveFishBoneBizRecords`
-- ----------------------------
DROP TABLE IF EXISTS `log_RemoveFishBoneBizRecords`;
CREATE TABLE `log_RemoveFishBoneBizRecords` (
  `id` varchar(32) NOT NULL,
  `serialNumber` varchar(255) DEFAULT NULL,
  `cardId` varchar(255) DEFAULT NULL,
  `personId` varchar(255) DEFAULT NULL,
  `personName` varchar(255) NOT NULL,
  `workGroupId` varchar(255) DEFAULT NULL,
  `workGroupName` varchar(255) DEFAULT NULL,
  `workCellId` varchar(255) DEFAULT NULL,
  `workCellName` varchar(255) DEFAULT NULL,
  `combineId` varchar(255) DEFAULT NULL,
  `combineName` varchar(255) DEFAULT NULL,
  `weight` float DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  `creatorId` varchar(32) DEFAULT NULL,
  `creatorName` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifer` varchar(255) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_RemoveFishBoneBizRecords
-- ----------------------------
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e10c5815001f', '2261dd48-5e55-4eea-8890-6e030852e37e', '2584945', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:15:05', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e10c5ac00020', '141d0365-081d-4277-99fb-f8804fa78285', '2584945', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:15:05', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e10c6c3b0023', '5342d31c-e0cc-432f-b43a-c5343b17196f', '2584945', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:15:10', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e10c72270026', 'ab728c14-932e-4291-a12d-48f69209add2', '2584945', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:15:11', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e10c74220027', 'debf39ce-50cd-499f-a68c-c46ae7796063', '2584945', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:15:12', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e10c76a10028', '6af048e0-539a-4076-9756-2f65246dc608', '2584945', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:15:13', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e10df6110044', '625e3df6-c55e-42dc-9e60-561ee6178760', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:16:51', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e10df8300045', '778d050c-55f4-4415-877e-84a374982061', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:16:51', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e10dfaa20046', '1310d44c-a453-4e09-ad66-0202cdf26e87', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:16:52', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e10dfd5d0047', 'bc719ba8-c9cf-44d7-9f16-1c0dad2f6ace', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:16:53', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e10dffa10048', '6cc9f7bf-1e82-453f-9be2-d16931074a92', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:16:53', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e111b5ce0053', 'e22fe8fb-d755-4123-aea1-4bc9cd8dc671', '2569438', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:20:56', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e111b8620054', 'a24fa3bd-8bce-4b52-ad6d-59ab9e3090b3', '2569438', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:20:57', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e111baaf0055', 'e5bb9ea8-b5b4-4617-99d5-2f43331bd9c1', '2569438', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:20:58', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e111bd400056', 'd9d4fb01-ed52-4bd1-a436-0a85f441e4d5', '2569438', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:20:58', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e13061910096', '317050c3-eeec-4b10-920f-1f2e8aa4933f', '516', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 11:54:26', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e15082fc0097', '8d6e1c5e-671d-4ea4-aa40-772f7e7e28f4', '2044160', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 12:29:32', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e16974bb0098', '21d4e490-7241-4c9c-add2-7f576c766a20', '12', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 12:56:47', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e1c0665200ae', 'b9ab5464-9973-4f3e-b7f4-99cda1ef947a', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:31:45', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e1c0690600af', '6e6d1b74-6746-4a0c-98dd-fbecec9e634b', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:31:46', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e1c06b8600b0', '6ea9149a-7eab-4a4f-93b2-ed57ecafc49f', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:31:46', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e1c06dfc00b1', '2d3bc4c7-c1f7-41f3-80cd-7ee4bcb46df6', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:31:47', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e1c0707f00b2', 'f40f8ea7-a88b-4b4b-9ece-0d66f14c47eb', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:31:47', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e1c0730f00b3', '1abe4215-6045-40c0-953d-0ea3322c771f', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:31:48', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e1c0757700b4', '15d1ab7b-49f1-45ea-88c8-56d2718ca3fc', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:31:49', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e1c0785f00b5', 'ce6044d5-b3f1-4cc3-b78e-ebe67e8b6a44', '2550444', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:31:49', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('4028811962e106430162e1c5baf600d1', '5aebe6b3-5415-4523-ae07-762af4a1a0b5', '1592054', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-20 14:37:34', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881966347958e01634799a6f3000e', 'ace40ebd-f611-431a-937e-9078018b7be6', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 09:10:41', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881966347958e01634799e918000f', 'd6445fc9-f8a1-4ce7-a185-bf0e7f11af3a', '2560614', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 09:10:49', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881966347958e0163479afaae002b', '066bd6fa-a9a2-4b74-b0cf-e30baab46463', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 09:12:08', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881966347958e0163479afd0f002c', '37909248-14a8-48ea-a076-c55eee18f7b8', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 09:12:09', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881966347958e016347befe91002d', '5e2f25dd-c6d9-4b05-bf78-e012fa5a17d0', '120324223', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 09:51:29', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881966347958e016347de8f18003d', '0138f895-cc96-40ff-ad04-11d11028f7a2', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:25:57', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881966347958e016347de9169003e', 'dc214bb3-4a59-453b-ad23-4af16699baed', '2568230', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:25:58', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881966347958e016347dea5e9003f', '408b261f-9e5d-4f7c-8f2a-50039394af20', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:26:03', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881966347958e016347eb0b660060', 'bdee7041-0694-4c5d-84ec-9880708fbceb', '1107364339', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:39:36', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881966347958e016347f255800070', 'aa0d93c8-1cad-46d0-b24d-724f9fa36b1c', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:47:33', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881966347958e016347f64400008f', '2b0cacc5-a50d-4155-a505-233a0d70137a', '2153514940', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-10 10:51:51', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a4628e92d001628ef4bf27000e', '4020ae55-8ea6-4a92-a9fb-cdea03974243', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-04 12:40:27', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a4628f0e7b01628f15378d000b', 'b5334aa8-a321-4f09-bbc3-c3ade7d8bcfd', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-04 13:15:54', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a4628f0e7b01628f1544ae000c', 'bc0a134d-8a8f-401d-88f2-b0cca7ea835d', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-04 13:15:58', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a4628f0e7b01628f154f39000d', '25f57851-ebce-4acd-b650-21cf3f580dcf', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-04 13:16:01', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a4628f0e7b01628f155998000e', '6792c941-bc0e-413f-8756-423fc49d800b', '2589435', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-04 13:16:03', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a4628f0e7b01628f155f91000f', '4ecafa13-106e-40a1-bf2f-9c749adcd8f2', '2542014', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-04 13:16:05', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a4628f0e7b01628f15699a0010', '9d96e3c2-525b-4d40-a694-8ffbccdfa240', '2569319', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-04 13:16:07', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a4628f0e7b01628f201b150015', '20f53a3d-8212-43f8-9e7c-806a352cef80', '2547828', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-04 13:27:48', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a862eadfdb0162eae1ef3a0009', '6f473d45-ab3a-4d1b-8dae-7551f274bd7d', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:04:58', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a862eadfdb0162eae1f17d000a', 'c58ae1cd-827e-4aa8-ac23-d521eb19ab69', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:04:58', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a862eadfdb0162eae1f400000b', '7a5a49a4-e255-4b6b-aa77-461f83c5b978', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:04:59', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a862eadfdb0162eae1f6a2000c', '1213077c-a62c-4b0a-916d-293174bbc493', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:04:59', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a862eadfdb0162eae1f900000d', 'ba00a72b-6caa-417a-a68a-c1d328e6f7f9', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:05:00', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a862eadfdb0162eae1fbc6000e', '4bbc3e73-a9be-4983-87b0-afcc9af40667', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:05:01', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a862eadfdb0162eae1fe02000f', 'ebff7116-c396-4356-8678-064514a6f897', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:05:01', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a862eadfdb0162eae2006c0010', '2bb1c871-3978-43b0-bc9c-80b86e742a15', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:05:02', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a862eadfdb0162eaed0a98001b', 'f25181f7-f4c1-4a23-bf9f-8465de35b4b5', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:05', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a862eadfdb0162eaed0d1d001c', 'e6ab3f7f-5a01-4178-8356-54eb218d9dd1', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:06', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a862eadfdb0162eaed0fb7001d', '8c99efdc-6ae1-4402-8d2a-b8858d50d971', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:07', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a862eadfdb0162eaed121c001e', '26a0f436-5ca1-496e-8c65-31500c76119c', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:07', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a862eadfdb0162eaed14af001f', 'dc58d011-c2e7-4496-8b54-ffdcb83f243d', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:08', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a862eadfdb0162eaed175c0020', '07a9d0a7-b775-4ae8-adbc-a118f645db11', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:09', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a862eadfdb0162eaed19de0021', 'af102b20-0c01-4015-b82e-7007629a7ac2', '2569423', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:09', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a862eadfdb0162eaed78d00031', '6ff9ae26-d524-4a92-adbe-6e7c85a48eca', '5247173', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:17:34', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a862eadfdb0162eaf31bb20041', 'a1326c17-9f0f-4f92-b61c-11ae227b6568', '204472560', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-04-22 09:23:43', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a96339166c0163391863e70000', 'b6e84d90-cf7f-44f8-a276-1501bf4365b7', '15781328', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 13:34:46', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a96339166c0163391a1523000c', 'cefb4a34-b9f8-4229-b5ae-7ef3e490d700', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 13:36:40', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a96339166c0163391a1f22000d', '515125ff-b3c8-4327-a38d-4e0f69d01516', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 13:36:43', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a96339166c0163391a22cb000e', '4c6e0b03-c267-47ca-b427-a06555ae5da5', '2550442', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 13:36:43', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a96339166c01633948f8890020', '04dfb98b-50fe-4cf8-84da-9781b7dff6a5', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 14:27:53', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a96339166c01633948fff50021', 'e5f6615c-1e8c-4079-9982-3a50e4bffc2f', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 14:27:55', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a96339166c0163394918ba0022', 'ed2a0fbf-15a5-478e-bf66-3b595f033fd8', '2549222', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 14:28:01', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a96339166c0163394972ee0023', 'fe912e3d-d73a-4a87-8ea0-a5cae67c59c2', '166724035', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 14:28:24', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('402881a96339166c01633965dbd9002d', 'de5cd62b-85da-4050-8d33-b2034a729425', '3244294144', '8a11c2d061260eae01612665cf6202fd', 'haohu333', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '挑刺', '8a8a8a0b614aac9d01614abaae0d0006', '读卡器', null, null, '2018-05-07 14:59:26', null, null, null, null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('8a11c48c614111670161411c996404e1', '0', '2569319', '0', '0', '0', '0', '0', '0', '0', '0', '3', '0', '2018-01-30 00:00:00', '8a11c2d06121d76d016121de297500de', '系统管理员', '2018-01-29 16:50:48', null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('8a11c48c614111670161411d001804e2', '1111', '2569319', '1', '11', '1', '11', '1', '11', '1', '1', '2', '1', '2018-01-29 00:00:00', '8a11c2d06121d76d016121de297500de', '系统管理员', '2018-01-29 16:51:15', null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('8a11c48c614111670161411d4b0804e3', '33', '2569319', '3', '33', '3', '3', '333', '', '3', '3', '6', '3', '2018-01-28 00:00:00', '8a11c2d06121d76d016121de297500de', '系统管理员', '2018-01-29 16:51:34', null, null, null);
INSERT INTO `log_RemoveFishBoneBizRecords` VALUES ('8a11c48c614111670161411ea82f04e5', '6666', '2569319', '3333', '3333', '3333', '33333', '3333', '3333', '333', '3333', '2', '2 ', '2018-01-29 00:00:00', '8a11c2d06121d76d016121de297500de', '系统管理员', '2018-01-29 16:53:03', '系统管理员', '2018-01-29 16:53:55', null);

-- ----------------------------
-- Table structure for `log_ToastBizRecords`
-- ----------------------------
DROP TABLE IF EXISTS `log_ToastBizRecords`;
CREATE TABLE `log_ToastBizRecords` (
  `id` varchar(32) NOT NULL,
  `serialNumber` varchar(255) DEFAULT NULL,
  `cardId` varchar(255) DEFAULT NULL,
  `personId` varchar(255) DEFAULT NULL,
  `personName` varchar(255) NOT NULL,
  `workGroupId` varchar(255) DEFAULT NULL,
  `workGroupName` varchar(255) DEFAULT NULL,
  `workCellId` varchar(255) DEFAULT NULL,
  `workCellName` varchar(255) DEFAULT NULL,
  `combineId` varchar(255) DEFAULT NULL,
  `combineName` varchar(255) DEFAULT NULL,
  `begin` datetime DEFAULT NULL,
  `end` datetime DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `creatorId` varchar(32) DEFAULT NULL,
  `creatorName` varchar(255) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL,
  `modifer` varchar(255) DEFAULT NULL,
  `modifiedDate` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of log_ToastBizRecords
-- ----------------------------

-- ----------------------------
-- Table structure for `qc_abnormal_process`
-- ----------------------------
DROP TABLE IF EXISTS `qc_abnormal_process`;
CREATE TABLE `qc_abnormal_process` (
  `id` varchar(64) NOT NULL,
  `pro_id` varchar(64) NOT NULL DEFAULT '' COMMENT '工序ID',
  `problem` varchar(200) NOT NULL DEFAULT '' COMMENT '问题描述',
  `report_user` varchar(64) NOT NULL DEFAULT '' COMMENT '上报人',
  `report_time` datetime NOT NULL COMMENT '上报时间',
  `test` varchar(200) NOT NULL DEFAULT '' COMMENT '检测描述',
  `test_user` varchar(64) NOT NULL DEFAULT '' COMMENT '检测人人',
  `test_time` datetime NOT NULL COMMENT '检测时间',
  `state` varchar(64) NOT NULL DEFAULT '' COMMENT '状态',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新着',
  `update_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='异常工序检测';

-- ----------------------------
-- Records of qc_abnormal_process
-- ----------------------------
INSERT INTO `qc_abnormal_process` VALUES ('2a552128179b4918a66518a032b662f1', 'a2ca4fff0f844f09848a33d80f151b1c', '温度计温度不标准', 'fe10556bf83e4b4eb8ad4c10c117aeba', '2018-05-08 17:17:00', '本批次的温度计问题', '5a19d195cc47465888a6f66a8a4dfbec', '2018-05-22 17:17:00', '已解决', '1', '2018-05-24 17:17:41', '1', '2018-05-26 17:09:52', null, '0');
INSERT INTO `qc_abnormal_process` VALUES ('9dafef1376944ea0aa2c59eebeb56c46', '953719098b464d9699ff0258786bd058', '读卡器无法读取信息', 'ef83ec0c592148c2991b12e6711e5911', '2018-05-08 17:07:00', '读卡器内部线路烧坏', '181abcd9d1e04e0fb4f4b310031e2f86', '2018-05-09 17:08:00', '已解决', '1', '2018-05-26 17:09:44', '1', '2018-05-26 17:09:44', null, '0');

-- ----------------------------
-- Table structure for `qc_inperfections`
-- ----------------------------
DROP TABLE IF EXISTS `qc_inperfections`;
CREATE TABLE `qc_inperfections` (
  `id` varchar(64) NOT NULL COMMENT '主键',
  `pn` varchar(64) DEFAULT NULL COMMENT '产品编号',
  `bn` varchar(20) DEFAULT NULL COMMENT '批次编号',
  `wo_id` varchar(64) DEFAULT NULL COMMENT '工单编号',
  `desc` varchar(200) DEFAULT NULL,
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qc_inperfections
-- ----------------------------
INSERT INTO `qc_inperfections` VALUES ('289601b693994a3b98e33e683c2f01c7', '1', '1批次', 'bc2c10afee6542a4b6213fec97baa93b', '烘烤温度控制不恰当', '1', '2018-05-24 13:32:25', '1', '2018-06-01 16:50:53', '0', null);
INSERT INTO `qc_inperfections` VALUES ('fbd39092e382482c99c290aa5d7df66e', 'f1754ab55f5847a6963d306b10409db3', '2批次', '2c7d15094e1b4c239053c0a6432afd4a', '冷藏温度不合适', '1', '2018-05-26 15:55:23', '1', '2018-06-01 16:51:02', '0', null);

-- ----------------------------
-- Table structure for `qc_violaction`
-- ----------------------------
DROP TABLE IF EXISTS `qc_violaction`;
CREATE TABLE `qc_violaction` (
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT '主键',
  `station_id` varchar(64) DEFAULT NULL COMMENT '工站编号',
  `pro_id` varchar(64) DEFAULT NULL COMMENT '工序编号',
  `group_id` varchar(64) DEFAULT NULL COMMENT '工作组编号',
  `userName` varchar(64) DEFAULT NULL COMMENT '违规人员',
  `violation_des` varchar(200) DEFAULT NULL COMMENT '违规描述',
  `violation_time` datetime DEFAULT NULL COMMENT '违规世间',
  `create_by` varchar(64) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(64) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  `remarks` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qc_violaction
-- ----------------------------
INSERT INTO `qc_violaction` VALUES ('65cc673de3ea46c49ca2df9d015d2937', '7e1c273df5334c648142e72f0045876b', 'c5df22578c3246a499bfdc23be0d35d9', '338cdeaa07554b5aaa510e50310547d6', '张三', '在工作区抽烟', '2018-05-26 16:21:00', '1', '2018-05-26 16:20:11', '1', '2018-06-01 16:29:00', '0', null);
INSERT INTO `qc_violaction` VALUES ('702600b98503453e8639117e6bc8d519', '63688c609f824834bf0abca0171bc8a7', '8112b7c264604d5bbf6b0f0e3af5651a', '55fa9fcc93ae452da354d2b6faaab4cf', '刘平', '上班时间玩手机', '2018-05-09 17:06:00', '1', '2018-05-26 17:06:14', '1', '2018-05-30 14:21:08', '0', null);

-- ----------------------------
-- Table structure for `sys_area`
-- ----------------------------
DROP TABLE IF EXISTS `sys_area`;
CREATE TABLE `sys_area` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) DEFAULT NULL COMMENT '区域类型',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_area_parent_id` (`parent_id`),
  KEY `sys_area_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='区域表';

-- ----------------------------
-- Records of sys_area
-- ----------------------------
INSERT INTO `sys_area` VALUES ('1', '0', '0,', '中国', '10', '100000', '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_area` VALUES ('1eddac4de095495f9d9f413d322d2a23', '2', 'null2,', '烟台市', '30', '00003', '3', '509e20b7d0f9447bbb6098c592b7cb28', '2018-05-26 11:47:11', '509e20b7d0f9447bbb6098c592b7cb28', '2018-05-26 11:47:11', '', '0');
INSERT INTO `sys_area` VALUES ('2', '1', '0,1,', '山东省', '20', '110000', '2', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for `sys_dict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict`;
CREATE TABLE `sys_dict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `value` varchar(100) NOT NULL COMMENT '数据值',
  `label` varchar(100) NOT NULL COMMENT '标签名',
  `type` varchar(100) NOT NULL COMMENT '类型',
  `description` varchar(100) NOT NULL COMMENT '描述',
  `sort` decimal(10,0) NOT NULL COMMENT '排序（升序）',
  `parent_id` varchar(64) DEFAULT '0' COMMENT '父级编号',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_dict_value` (`value`),
  KEY `sys_dict_label` (`label`),
  KEY `sys_dict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字典表';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO `sys_dict` VALUES ('032a60a572594daebd5bb6efd9718677', '一般工单', '一般工单', 'workorder_type', '工单类型', '10', '0', '1', '2018-05-19 15:01:33', '1', '2018-05-19 17:54:13', '', '0');
INSERT INTO `sys_dict` VALUES ('1', '0', '正常', 'del_flag', '删除标记', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('10', 'yellow', '黄色', 'color', '颜色值', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('105', '1', '会议通告', 'oa_notify_type', '通知通告类型', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('106', '2', '奖惩通告', 'oa_notify_type', '通知通告类型', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('107', '3', '活动通告', 'oa_notify_type', '通知通告类型', '30', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('108', '0', '草稿', 'oa_notify_status', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('109', '1', '发布', 'oa_notify_status', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('11', 'orange', '橙色', 'color', '颜色值', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('110', '0', '未读', 'oa_notify_read', '通知通告状态', '10', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('111', '1', '已读', 'oa_notify_read', '通知通告状态', '20', '0', '1', '2013-11-08 08:00:00', '1', '2013-11-08 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('12', 'default', '默认主题', 'theme', '主题方案', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('13', 'cerulean', '天蓝主题', 'theme', '主题方案', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('14', 'readable', '橙色主题', 'theme', '主题方案', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('15', 'united', '红色主题', 'theme', '主题方案', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('16', 'flat', 'Flat主题', 'theme', '主题方案', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('17', '1', '国家', 'sys_area_type', '区域类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('170f790abba444678f6d6899e51621ab', 'mm', '月', 'equip_cycle', '设备保养周期', '20', '0', '1', '2018-05-16 16:37:13', '1', '2018-05-16 16:37:13', '', '0');
INSERT INTO `sys_dict` VALUES ('18', '2', '省份、直辖市', 'sys_area_type', '区域类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('19', '3', '地市', 'sys_area_type', '区域类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('2', '1', '删除', 'del_flag', '删除标记', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('20', '4', '区县', 'sys_area_type', '区域类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('21', '1', '公司', 'sys_office_type', '机构类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('21496be344114f31bf7d2c1c4a71006c', 'manage_001', '零售', 'manage_type', '产品管理', '10', '0', '1', '2018-05-14 13:16:07', '1', '2018-05-14 13:24:51', '产品管理方式', '0');
INSERT INTO `sys_dict` VALUES ('22', '2', '部门', 'sys_office_type', '机构类型', '70', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('23', '3', '小组', 'sys_office_type', '机构类型', '80', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('24', '4', '其它', 'sys_office_type', '机构类型', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('25', '1', '综合部', 'sys_office_common', '快捷通用部门', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('26', '2', '开发部', 'sys_office_common', '快捷通用部门', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('264b41fa7b26444cb79b2ec115b0bd1c', 'yy', '年', 'equip_cycle', '设备保养周期', '20', '0', '1', '2018-05-16 16:37:26', '1', '2018-05-16 16:37:26', '', '0');
INSERT INTO `sys_dict` VALUES ('27', '3', '人力部', 'sys_office_common', '快捷通用部门', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('28', '1', '一级', 'sys_office_grade', '机构等级', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('29', '2', '二级', 'sys_office_grade', '机构等级', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('290bc1ef6f93485d8fb8f3d5fbf28ebd', '0002', '重量', 'equip_spec', '设备规格', '20', '0', '1', '2018-05-15 17:40:57', '1', '2018-05-15 17:40:57', '重量', '0');
INSERT INTO `sys_dict` VALUES ('29f1868d069647588bf0f8ef90c03cee', '0005', '扫码枪', 'equip_type', '设备类型', '20', '0', '1', '2018-05-15 17:38:23', '1', '2018-05-15 17:38:23', '扫码枪', '0');
INSERT INTO `sys_dict` VALUES ('3', '1', '显示', 'show_hide', '显示/隐藏', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('30', '3', '三级', 'sys_office_grade', '机构等级', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('31', '4', '四级', 'sys_office_grade', '机构等级', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('32', '1', '所有数据', 'sys_data_scope', '数据范围', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('33', '2', '所在公司及以下数据', 'sys_data_scope', '数据范围', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('34', '3', '所在公司数据', 'sys_data_scope', '数据范围', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('35', '4', '所在部门及以下数据', 'sys_data_scope', '数据范围', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('36', '5', '所在部门数据', 'sys_data_scope', '数据范围', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('37', '8', '仅本人数据', 'sys_data_scope', '数据范围', '90', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('37ecbb08093b430f8725c790a753bbc2', '0003', '体积', 'equip_spec', '设备规格', '20', '0', '1', '2018-05-15 17:41:14', '1', '2018-05-15 17:41:14', '体积', '0');
INSERT INTO `sys_dict` VALUES ('38', '9', '按明细设置', 'sys_data_scope', '数据范围', '100', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('39', '1', '系统管理', 'sys_user_type', '用户类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('39d8dabf5ca548fe8f3a147072c7b2cc', '新建', '新建', 'workorder_state', '工单状态', '10', '0', '1', '2018-05-19 14:45:30', '1', '2018-05-19 17:52:34', '', '0');
INSERT INTO `sys_dict` VALUES ('3da5f35be09f4d1abe49632f3bdb34ae', '0001', '上报', 'eqiup_maintenance', '报修记录状态', '10', '0', '1', '2018-05-17 10:51:57', '1', '2018-05-17 10:51:57', '', '0');
INSERT INTO `sys_dict` VALUES ('3e877bc90c7a4ab88f1725a8a314532e', 'week', '周', 'equip_cycle', '设备保养周期', '10', '0', '1', '2018-05-16 16:36:56', '1', '2018-05-16 16:36:56', '设备保养周期', '0');
INSERT INTO `sys_dict` VALUES ('4', '0', '隐藏', 'show_hide', '显示/隐藏', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('40', '2', '部门经理', 'sys_user_type', '用户类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('40077f0c1aed4ed0ac17d9adf2670c10', '0005', '无效', 'eqiup_maintenance', '报修记录状态', '20', '0', '1', '2018-05-17 11:21:30', '1', '2018-05-17 11:21:30', '', '0');
INSERT INTO `sys_dict` VALUES ('41', '3', '普通用户', 'sys_user_type', '用户类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('42', 'basic', '基础主题', 'cms_theme', '站点主题', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('43', 'blue', '蓝色主题', 'cms_theme', '站点主题', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('44', 'red', '红色主题', 'cms_theme', '站点主题', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('45', 'article', '文章模型', 'cms_module', '栏目模型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('46', 'picture', '图片模型', 'cms_module', '栏目模型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('47', 'download', '下载模型', 'cms_module', '栏目模型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('47ece1219f2d481d82cf284acc621e03', 'type_002', '扫描枪', 'eq_type', '设备类型', '10', '0', '1', '2018-05-10 15:10:21', '1', '2018-05-10 15:17:21', '', '0');
INSERT INTO `sys_dict` VALUES ('48', 'link', '链接模型', 'cms_module', '栏目模型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('49', 'special', '专题模型', 'cms_module', '栏目模型', '50', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '1');
INSERT INTO `sys_dict` VALUES ('4f9fc96eb2ae41d4b67ae02574d9c15f', '是', '是', 'yesorno', '是/否', '10', '0', '1', '2018-05-21 09:31:46', '1', '2018-05-21 09:31:46', '', '1');
INSERT INTO `sys_dict` VALUES ('5', '1', '是', 'yes_no', '是/否', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('50', '0', '默认展现方式', 'cms_show_modes', '展现方式', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('51', '1', '首栏目内容列表', 'cms_show_modes', '展现方式', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('51f1b47e230b4f21a25bb383eea92f9e', '0004', '完工', 'eqiup_maintenance', '报修记录状态', '20', '0', '1', '2018-05-17 10:53:09', '1', '2018-05-17 10:53:09', '', '0');
INSERT INTO `sys_dict` VALUES ('52', '2', '栏目第一条内容', 'cms_show_modes', '展现方式', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('53', '0', '发布', 'cms_del_flag', '内容状态', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('54', '1', '删除', 'cms_del_flag', '内容状态', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('5456cece6bd843b0bf4b0111beeca6ab', '0001', '电子秤', 'equip_type', '设备类型', '30', '0', '1', '2018-05-15 17:37:37', '1', '2018-05-16 14:17:49', '电子秤', '0');
INSERT INTO `sys_dict` VALUES ('55', '2', '审核', 'cms_del_flag', '内容状态', '15', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('56', '1', '首页焦点图', 'cms_posid', '推荐位', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('57', '2', '栏目页文章推荐', 'cms_posid', '推荐位', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('58', '1', '咨询', 'cms_guestbook', '留言板分类', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('59', '2', '建议', 'cms_guestbook', '留言板分类', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('59cc88dc49e244728360f7e2d859b7c8', '0001', '长度', 'equip_spec', '设备规格', '10', '0', '1', '2018-05-15 17:40:41', '1', '2018-05-15 17:40:41', '长度', '0');
INSERT INTO `sys_dict` VALUES ('5f7fce065fb34bccba30214231e619e5', '已发布', '已发布', 'workorder_state', '工单状态', '20', '0', '1', '2018-05-19 14:46:42', '1', '2018-05-19 17:52:45', '', '0');
INSERT INTO `sys_dict` VALUES ('6', '0', '否', 'yes_no', '是/否', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('60', '3', '投诉', 'cms_guestbook', '留言板分类', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('61', '4', '其它', 'cms_guestbook', '留言板分类', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('610165b33b7347fba28b32260268e29b', 'spec_001', '手持式', 'eq_spec', '设备规格', '10', '0', '1', '2018-05-10 15:18:52', '1', '2018-05-10 15:19:42', '', '0');
INSERT INTO `sys_dict` VALUES ('62', '1', '公休', 'oa_leave_type', '请假类型', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('63', '2', '病假', 'oa_leave_type', '请假类型', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('64', '3', '事假', 'oa_leave_type', '请假类型', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('65', '4', '调休', 'oa_leave_type', '请假类型', '40', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('66', '5', '婚假', 'oa_leave_type', '请假类型', '60', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('67', '1', '接入日志', 'sys_log_type', '日志类型', '30', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('68', '2', '异常日志', 'sys_log_type', '日志类型', '40', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('69', 'leave', '请假流程', 'act_type', '流程类型', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('7', 'red', '红色', 'color', '颜色值', '10', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('70', 'test_audit', '审批测试流程', 'act_type', '流程类型', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('71', '1', '分类1', 'act_category', '流程分类', '10', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('72', '2', '分类2', 'act_category', '流程分类', '20', '0', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('8', 'green', '绿色', 'color', '颜色值', '20', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('8e95a67beef640029d8fe2867cd00733', '0002', '读卡器', 'equip_type', '设备类型', '20', '0', '1', '2018-05-15 17:37:54', '1', '2018-05-16 14:17:56', '读卡器', '0');
INSERT INTO `sys_dict` VALUES ('9', 'blue', '蓝色', 'color', '颜色值', '30', '0', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('902ea3bd07ec4c70b63b2b7af2538a5d', '0003', '维修', 'eqiup_maintenance', '报修记录状态', '20', '0', '1', '2018-05-17 10:52:42', '1', '2018-05-17 10:52:42', '', '0');
INSERT INTO `sys_dict` VALUES ('96', '1', '男', 'sex', '性别', '10', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('968eb751319248b9af60a2ea218b6975', '确认', '确认', 'workorder_state', '工单状态', '60', '0', '1', '2018-05-19 14:49:17', '1', '2018-05-19 17:53:38', '', '0');
INSERT INTO `sys_dict` VALUES ('97', '2', '女', 'sex', '性别', '20', '0', '1', '2013-10-28 08:00:00', '1', '2013-10-28 08:00:00', null, '0');
INSERT INTO `sys_dict` VALUES ('9c5bb4e441fd4249b696ab68c389c901', '0003', '打印机', 'equip_type', '设备类型', '20', '0', '1', '2018-05-16 09:42:34', '1', '2018-05-16 14:18:02', '', '0');
INSERT INTO `sys_dict` VALUES ('9ead79935de5488a92c835fb1d76621d', '0002', '派工', 'eqiup_maintenance', '报修记录状态', '20', '0', '1', '2018-05-17 10:52:16', '1', '2018-05-17 10:52:16', '', '0');
INSERT INTO `sys_dict` VALUES ('b45bfa0412ff4291a538c3c6cfc930d6', '材料短缺', '材料短缺', 'workorder_state', '工单状态', '80', '0', '1', '2018-05-19 14:49:53', '1', '2018-05-19 17:53:56', '', '0');
INSERT INTO `sys_dict` VALUES ('b55e89bc735e4a2c9458e6f947fe5ed0', '加班工单', '加班工单', 'workorder_type', '工单类型', '20', '0', '1', '2018-05-19 15:01:48', '1', '2018-05-19 17:54:26', '', '0');
INSERT INTO `sys_dict` VALUES ('bd2049b3961a4899a774a5e3c26db0ab', 'spec_002', '固定式', 'eq_spec', '设备规格', '20', '0', '1', '2018-05-10 15:19:29', '1', '2018-05-10 15:19:29', '', '0');
INSERT INTO `sys_dict` VALUES ('c8b1db2e89d34c5da2fd86d55c36a078', 'manage_002', '批发', 'manage_type', '产品管理', '20', '0', '1', '2018-05-14 13:24:23', '1', '2018-05-14 13:25:08', '产品管理方式', '0');
INSERT INTO `sys_dict` VALUES ('d4d5ae6bf8fd46ffabab0e8d32f2827d', '技术完成', '技术完成', 'workorder_state', '工单状态', '40', '0', '1', '2018-05-19 14:48:32', '1', '2018-05-19 17:53:21', '', '0');
INSERT INTO `sys_dict` VALUES ('e01016dc6c1b4464a43d1089e85ea94e', 'type_001', '计数器', 'eq_type', '设备类型', '10', '0', '1', '2018-05-10 15:09:45', '1', '2018-05-10 15:17:29', '', '0');
INSERT INTO `sys_dict` VALUES ('e4fa1ca4fcb041728ea583070d2390b2', '0004', 'PAD', 'equip_type', '设备类型', '20', '0', '1', '2018-05-15 18:34:38', '1', '2018-05-16 14:18:09', '安卓PAD', '0');
INSERT INTO `sys_dict` VALUES ('e9e2bb79fc7f4f3a838272762faa4c0f', '交付', '交付', 'workorder_state', '工单状态', '70', '0', '1', '2018-05-19 14:49:37', '1', '2018-05-19 17:53:46', '', '0');
INSERT INTO `sys_dict` VALUES ('eb2295f158d44a4eb0e863ca480d74e7', '在制状态', '在制状态', 'workorder_state', '工单状态', '30', '0', '1', '2018-05-19 14:48:08', '1', '2018-05-19 17:53:10', '', '0');
INSERT INTO `sys_dict` VALUES ('f8b4dbe0701841c0bafb1ac4b842758b', '部分确认', '部分确认', 'workorder_state', '工单状态', '50', '0', '1', '2018-05-19 14:49:01', '1', '2018-05-19 17:53:30', '', '0');

-- ----------------------------
-- Table structure for `sys_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `type` char(1) DEFAULT '1' COMMENT '日志类型',
  `title` varchar(255) DEFAULT '' COMMENT '日志标题',
  `create_by` varchar(64) DEFAULT NULL COMMENT '创建者',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  `remote_addr` varchar(255) DEFAULT NULL COMMENT '操作IP地址',
  `user_agent` varchar(255) DEFAULT NULL COMMENT '用户代理',
  `request_uri` varchar(255) DEFAULT NULL COMMENT '请求URI',
  `method` varchar(5) DEFAULT NULL COMMENT '操作方式',
  `params` text COMMENT '操作提交的数据',
  `exception` text COMMENT '异常信息',
  PRIMARY KEY (`id`),
  KEY `sys_log_create_by` (`create_by`),
  KEY `sys_log_request_uri` (`request_uri`),
  KEY `sys_log_type` (`type`),
  KEY `sys_log_create_date` (`create_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日志表';

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES ('013a0f7e59224e91b830c80268705bd4', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 16:51:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('01651191c62841e3a1536d951c2261ba', '1', '系统设置-机构用户-用户管理-修改', '1', '2018-05-02 18:32:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/save', 'POST', 'id=5&photo=&company.id=1&company.name=山东省总公司&office.id=5&office.name=技术部&no=0005&name=技术部&oldLoginName=sd_jsb&loginName=sd_jsb&newPassword=&confirmNewPassword=&email=&phone=&mobile=&loginFlag=1&userType=&roleIdList=6&_roleIdList=on&remarks=', '');
INSERT INTO `sys_log` VALUES ('020b21613ae047248b84d1d026f717ed', '1', '系统设置-机构用户-机构管理', '1', '2018-05-02 13:07:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/office/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('022fc22f8bfa48a9bd49fa4bbfbd13ae', '1', '我的面板-个人信息-个人信息', '1', '2018-05-02 14:48:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('02b1034a9e264fdd92b4ba4bcf7dc1be', '1', '内容管理-内容管理-内容发布', '1', '2018-05-02 15:26:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('02d69c63123143449a147e086a932efb', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 18:24:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('03550ffa52f447e6a42bda2a6bd0ef5b', '1', '在线办公-通知通告-我的通告', '1', '2018-05-02 14:48:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/oa/oaNotify/self', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0466081dd1a142d589aed928ef483521', '1', '在线办公-通知通告-通告管理', '1', '2018-05-02 15:25:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/oa/oaNotify', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('04d4094848974547b1721f21a44744d6', '1', '系统登录', '5', '2018-05-02 18:30:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('05454057b3a14126840650036bcd46f9', '1', '在线办公-通知通告-我的通告', '3', '2018-05-02 18:29:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/oa/oaNotify/self', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0689a4092078417f99cfe24cf1659988', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 14:48:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('087723ad1e834f8498a1070b75381d1b', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 18:32:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('08e52ec838bf4e53bc40b5178a56f7e5', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 19:04:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('091e5684e981499bb07474423be03e94', '1', '内容管理-内容管理', '1', '2018-05-02 18:27:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('093710bdd85144098cc210431ef36ad5', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 18:39:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', 'id=6', '');
INSERT INTO `sys_log` VALUES ('093bbc7e265b489198db43c8cfb0f2c3', '1', '系统设置-机构用户-区域管理', '1', '2018-05-02 13:07:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('09b4f544c3dc43afb68cc4e75ebab26c', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 18:01:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0a303e7049fb4e5fb60e79bb094930da', '1', '代码生成-生成示例-测试用户', '5', '2018-05-02 18:39:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testUser', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0a3c21ccc5334ef6aa01651ebd14d0b6', '1', '系统设置-系统设置-字典管理', '1', '2018-05-02 15:28:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0b6602ae4ee84481b0c3a0ea2de000fb', '1', '内容管理-栏目设置-站点设置', '1', '2018-05-02 13:07:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/site/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0b92829b79f3466bacc78ce4246c1d37', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 18:31:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', 'id=6', '');
INSERT INTO `sys_log` VALUES ('0bba2cd5fa7943f59811b34ed5604626', '1', '系统设置-机构用户-用户管理-查看', '3', '2018-05-02 18:28:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0c134ca24507419bbe8454d025317089', '1', '系统设置-系统设置-菜单管理', '3', '2018-05-02 18:28:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0c48b574743c42a8a5589fb2c5389992', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 15:28:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0ca956cd89594329bb6b401919a81639', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 18:26:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('0ce11695261b4403bbd25d4d70a05709', '1', '系统登录', '5', '2018-05-02 18:32:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('0dd99700ff924afa83e8d811d4252f3f', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-05-02 18:26:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 'id=a89f30f6a8c1471c9f5c53cb8e36e175', '');
INSERT INTO `sys_log` VALUES ('0ea490b21bb4410a82c231e9acd76048', '1', '内容管理-统计分析-信息量统计', '1', '2018-05-02 13:07:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/stats/article', 'POST', 'categoryId=&categoryName=&officeId=&officeName=&beginDate=2018-05-01&endDate=2018-05-31', '');
INSERT INTO `sys_log` VALUES ('0ee58a6ed4644965bdba7cd2f653a278', '1', '系统设置-系统设置-字典管理', '1', '2018-05-02 13:10:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/dict/', 'POST', 'pageNo=3&pageSize=30&type=&description=', '');
INSERT INTO `sys_log` VALUES ('105cd7a65bef47a187fccb460d076149', '1', '系统设置-系统设置-字典管理', '3', '2018-05-02 18:29:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('105dbe80cc484092b309daf3f1892c1a', '1', '在线办公-个人办公-我的任务', '1', '2018-05-02 13:02:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/act/task/todo/', 'GET', 'procDefKey=leave&beginDate=&endDate=', '');
INSERT INTO `sys_log` VALUES ('128e2024568b44c69d29a6b081e65fa5', '1', '我的面板-个人信息-个人信息', '1', '2018-05-02 13:08:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('12912d22f1224bfc82bfa28ed30a5998', '1', '内容管理-内容管理', '1', '2018-05-02 13:07:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1331747e79e446658be4f395be0862a9', '1', '系统设置-系统设置-角色管理-修改', '1', '2018-05-02 18:27:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/assign', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('141ea8ce41994cf99d88bb19ad7911ab', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 19:01:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('148e1b559e5f4a9b81a6fb5faf6cc721', '1', '系统登录', '1', '2018-05-02 18:30:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('14af4218fd5846eda960da56d9da9979', '1', '我的面板-个人信息-个人信息', '1', '2018-05-02 18:27:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('153df40048504053869880cf20023600', '1', '内容管理-内容管理-内容发布', '1', '2018-05-02 13:07:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('166c9963d43e45c38cc079d76c0032e1', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 18:26:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('17a6a290fd0a48868b46afdbf69a0189', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 18:31:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('17cf3fd231a146d89325eceb3d3e7b6b', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 13:04:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1857562809e14a75bdb973b820bf7365', '1', '代码生成-生成示例-树结构-查看', '1', '2018-05-02 13:06:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree/', 'POST', 'name=', '');
INSERT INTO `sys_log` VALUES ('19937817b4d749c8abc5725a75d3bb8e', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 18:38:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1996d613ec204860ab126d59e33adb6c', '1', '代码生成-生成示例-树结构-查看', '1', '2018-05-02 13:06:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1a15f2ab159b4a1587c2b1398776fe6f', '1', '系统设置-系统设置-字典管理', '1', '2018-05-02 13:06:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1c020ea502af40a2b08ceb0cdf04c444', '1', '系统设置-机构用户-机构管理-查看', '1', '2018-05-02 15:29:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('1d7cf8049a344a76bb51f0200592c2c6', '1', '内容管理-内容管理', '1', '2018-05-02 13:08:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1e0bd1f427084c57b3735a15038d2718', '1', '代码生成-代码生成-生成方案配置', '1', '2018-05-02 19:02:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('1e9c77a240f14c26a4aa57bf04b784b9', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2018-05-02 11:36:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/article/', 'GET', 'category.id=5', '');
INSERT INTO `sys_log` VALUES ('1ed963100dcd456e90d52314d029d8da', '1', '代码生成-生成示例-树结构-查看', '1', '2018-05-02 13:06:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree/', 'POST', 'name=', '');
INSERT INTO `sys_log` VALUES ('1f6b951c52ae4e2a9851cacb284015f1', '1', '系统设置-系统设置-角色管理-修改', '1', '2018-05-02 13:04:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/assign', 'GET', 'id=7', '');
INSERT INTO `sys_log` VALUES ('1f6f6140f8a746bfa9a92e1f227a25e6', '1', '系统登录', '1', '2018-05-02 14:48:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('1fc5cf98fe984adfad1f19cf12db7ee2', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 18:31:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', 'id=5', '');
INSERT INTO `sys_log` VALUES ('205cc830c18f439ab54b887b41345932', '1', '内容管理-内容管理-公共留言-查看', '1', '2018-05-02 13:08:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/guestbook/', 'GET', 'status=2', '');
INSERT INTO `sys_log` VALUES ('2150f41b185c43d8934ec09a23f70f82', '1', '内容管理-内容管理', '3', '2018-05-02 18:29:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('217da6e54cf2470f8df4bcc34606da46', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 16:51:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('21d18b8065fb49bb98fccd68330b348a', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 14:48:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2204b4b0465a46efbcc1cc537d612b14', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 18:58:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2214350278e4441681d65512a4b53b68', '1', '我的面板-个人信息-个人信息', '1', '2018-05-02 19:04:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('222a145a033c461fa70171fa705ca296', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 15:28:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2390cb2d96714186af2801d06cea800c', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 16:49:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2399276a980843b6955050eea342581d', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-05-02 18:26:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 'parent.id=a89f30f6a8c1471c9f5c53cb8e36e175', '');
INSERT INTO `sys_log` VALUES ('2515811fbc1e4311bfb0cddc6ddbc874', '1', '代码生成-生成示例-树结构', '1', '2018-05-02 19:02:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('252836021b1a47458ed2fab7ba7cb1fe', '1', '系统登录', '1', '2018-05-02 11:36:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('25937071b31b4c8cb509f064baa4e913', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-05-02 18:22:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 'parent.id=3c92c17886944d0687e73e286cada573', '');
INSERT INTO `sys_log` VALUES ('2597c20ca79b4e47b6c595f1bbd9e0a2', '1', '内容管理-栏目设置-站点设置', '1', '2018-05-02 13:07:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/site/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2680460b4b8b47659ac8a8dcbcbd750e', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 13:12:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('278220d067804a0eb1815b15f9510b07', '1', '代码生成-生成示例-树结构-查看', '1', '2018-05-02 13:06:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree/', 'POST', 'name=', '');
INSERT INTO `sys_log` VALUES ('283b32ed7d9444d88192cc909983e6ea', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 18:26:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('286e760a6de943599be40312fa98b7d6', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-05-02 16:49:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 'id=56', '');
INSERT INTO `sys_log` VALUES ('294ac8f39dc1451f984ae12f2691d32e', '1', '代码生成-生成示例-单表-查看', '1', '2018-05-02 11:37:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testData/', 'POST', 'pageNo=1&pageSize=30&user.id=&user.name=&office.id=6&office.name=研发部&area.id=5&area.name=历下区&name=&beginInDate=&endInDate=', '');
INSERT INTO `sys_log` VALUES ('29b269defb124aef9f4bbc206cef1cd1', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 18:31:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2a78a44801364b52aafe5e6b7e9dc837', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-05-02 18:24:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 'id=&parent.id=1&parent.name=功能菜单&name=测试用户&href=/test/testUser&target=&icon=user&sort=5030&isShow=1&permission=&remarks=', '');
INSERT INTO `sys_log` VALUES ('2ab99206ef0646af921e0b51d48ed645', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 13:03:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2c70315ab20f49999187379493080f6a', '1', '代码生成-代码生成-生成方案配置', '3', '2018-05-02 18:28:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2d595297b4ec4b90be72b8446a786ec6', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 18:31:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', 'id=4', '');
INSERT INTO `sys_log` VALUES ('2edf802384db4288b6a73f8337ad9550', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 18:27:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2f3b993cca2e40479db63d89476f1d9c', '1', '系统设置-系统设置-角色管理-修改', '1', '2018-05-02 18:39:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/save', 'POST', 'id=6&office.id=1&office.name=山东省总公司&oldName=普通用户&name=普通用户&oldEnname=d&enname=d&roleType=assignment&sysData=1&useable=1&dataScope=8&menuIds=1,79,3c92c17886944d0687e73e286cada573,a89f30f6a8c1471c9f5c53cb8e36e175&officeIds=&remarks=', '');
INSERT INTO `sys_log` VALUES ('2f3be150310f4f99924cff440c7daab4', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 11:36:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2f651383f6294e2db763bff0068afcab', '1', '内容管理-栏目设置-栏目管理-查看', '1', '2018-05-02 13:07:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/category/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2fb6a00a295a4b389218c8c9574f6ce2', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 15:26:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('2fcd5904fd9c41f5b0f04cdad9a74f2f', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 13:06:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('32b10937f07e41e081a2dcf2d603434e', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 18:31:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3369cdcdd68c46dd8fce1844e25fdde7', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 15:29:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=2', '');
INSERT INTO `sys_log` VALUES ('33c51e2464624f26a739dd7aaaee6b33', '1', '代码生成-生成示例-主子表-查看', '1', '2018-05-02 17:26:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testDataMain/', 'POST', 'pageNo=1&pageSize=30&user.id=&user.name=&name=&sex=', '');
INSERT INTO `sys_log` VALUES ('340537d0d34f48b89af16101fc833a7f', '1', '系统登录', '1', '2018-05-02 19:01:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('344b6618ea5e4f03a5f8421fef9bf5b5', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 11:36:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('34a54c4877b64d7091ce267c81633c6c', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 18:57:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('362a45e8ef644eadad803364f6ca1207', '1', '代码生成-生成示例-测试用户', '1', '2018-05-02 19:05:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testUser', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('365658e68b32409e9e061f017774fd97', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 18:26:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('36bded8891474a719e11a82a37aa9b6a', '1', '内容管理-栏目设置-切换站点', '1', '2018-05-02 13:07:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/site/select', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('36fbcbd245664b85a9c75099221ed28c', '1', '代码生成-生成示例-树结构-查看', '1', '2018-05-02 11:40:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('375ba2a71fb742b992ba0b7fdf697265', '1', '代码生成-代码生成-业务表配置', '3', '2018-05-02 18:28:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('380f55efab1c4a1393de4d6741d78ae6', '1', '内容管理-栏目设置-切换站点', '1', '2018-05-02 13:07:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/site/select', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('3817022df3fa4ad9adb746eb45786e70', '1', '代码生成-代码生成-生成方案配置', '1', '2018-05-02 18:05:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('38654b9a33a94454846ee9ad680f54ca', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 18:26:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('39cbcbb0c30c490f86600a04147c50c2', '1', '在线办公-通知通告-我的通告', '1', '2018-05-02 13:08:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/oa/oaNotify/self', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3a4b00998dfa4bed983fa2c19548096a', '1', '我的面板-个人信息-个人信息', '1', '2018-05-02 11:36:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3c3a11b634d8412f826daab6ca734380', '1', '代码生成-生成示例-树结构-查看', '1', '2018-05-02 17:26:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3c5f25af21dc4ca2bf7ed2a70fda4cb1', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 18:27:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3d6958c831f84fb79a520f5cff5e0dbf', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 19:01:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3deb65f4a9824f188b3cf5aba8ab0c4e', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 17:26:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3dfc5e23aabd438dbb9789d6af58d1de', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-05-02 18:24:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 'id=30', '');
INSERT INTO `sys_log` VALUES ('3e2a40016abf42f9a0567f45ea7754d8', '1', '代码生成-生成示例-树结构', '1', '2018-05-02 13:06:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('3ef34a992c4f4f7f9799bed207362efd', '1', '代码生成-生成示例-单表', '1', '2018-05-02 11:36:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testData', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('406fb652a5234e7d92332acb85222eb4', '1', '系统设置-系统设置-字典管理', '1', '2018-05-02 13:04:42', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('40907d67c7024b62928ac8dd6d39c58e', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 18:31:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4090cb7bb60c45a9b2a8613a13716b7a', '1', '系统设置-系统设置-角色管理-修改', '1', '2018-05-02 16:52:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/assign', 'GET', 'id=7', '');
INSERT INTO `sys_log` VALUES ('412bf41828d341cb8245c551105901ce', '1', '我的面板-个人信息-个人信息', '1', '2018-05-02 18:57:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('41ffb04a20f743dbbb620fc22656c82e', '1', '我的面板-个人信息-修改密码', '1', '2018-05-02 11:38:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('42363ea48c6c4a76b64e7bc2f9f4655f', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 18:31:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4249fae4d2e04da78f5cd427e8243e59', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 11:38:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('42ee030f688f4dcfb7883fbc65c6b585', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 18:22:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('433de537152c443792572689744bc02d', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 18:38:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('43597c0bb69d4469bd7347c620defa76', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 18:24:07', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4437a5614e314f528c368015ffe9d928', '1', '系统设置-机构用户-机构管理-查看', '1', '2018-05-02 13:07:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('448033815c584a4994331befb8b2a733', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 15:28:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('453cc1e4e8ab43e0a2535da26406c0d0', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 19:02:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('46c566e5a8414ee5802683565c0145e4', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-05-02 18:26:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 'id=a89f30f6a8c1471c9f5c53cb8e36e175&parent.id=3c92c17886944d0687e73e286cada573&parent.name=生成示例&name=测试用户&href=/test/testUser&target=&icon=user&sort=5030&isShow=1&permission=&remarks=', '');
INSERT INTO `sys_log` VALUES ('47cdcc24beaa48679e24f62212081883', '1', '代码生成-代码生成-生成方案配置', '1', '2018-05-02 18:57:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('486aae48f90c4635a4a90d4f874d890b', '1', '系统设置-机构用户-区域管理', '1', '2018-05-02 16:51:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/area/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4896eee6ab3443e2b7aae8adac55da40', '1', '系统登录', '1', '2018-05-02 19:08:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('490b12de4ff042989274f1e67cf50c05', '1', '在线办公-流程管理-流程管理', '1', '2018-05-02 15:33:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/act/process', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4beab533f62244219315c0309bb37d97', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 14:48:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4dcc255de016481eb3a985179dbf5e47', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 15:29:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/usertorole', 'POST', 'id=2&___t0.14573206586785092=', '');
INSERT INTO `sys_log` VALUES ('4ea9e28c9c5940d4abe76a7245f80670', '1', '系统设置-系统设置-角色管理-修改', '1', '2018-05-02 16:52:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/assign', 'GET', 'id=4', '');
INSERT INTO `sys_log` VALUES ('4fb890a8dcc84210b044c9f1848f5410', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 18:38:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('4fd35c2285fc4b8687a83d1733c05bc8', '1', '系统登录', '5', '2018-05-02 18:39:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('51732418c33941dd9d9303f710cc1649', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 16:49:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('51f7919471614a6d8b123c2a3aa0739c', '1', '我的面板-个人信息-个人信息', '1', '2018-05-02 18:21:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5311d89f6df34c859ff2e8b695d84536', '1', '代码生成-生成示例-树结构', '1', '2018-05-02 17:26:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5377806e869a4e2b9c1b2715c41abd2f', '1', '代码生成-生成示例-树结构', '1', '2018-05-02 11:40:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5457b07516e54487ba7992d5678524eb', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 18:32:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5521cfa834a44be98f1f76564ca50357', '1', '内容管理-内容管理-内容发布', '1', '2018-05-02 13:08:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('55df981c01d94782af10b97298ae5ab3', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 16:51:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('58604361c9e94572b846e37487e249f9', '1', '代码生成-生成示例-树结构-查看', '1', '2018-05-02 13:06:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree/', 'POST', 'name=', '');
INSERT INTO `sys_log` VALUES ('5945837b5187434caf53eeae6abd245b', '1', '在线办公-个人办公-审批测试', '1', '2018-05-02 15:25:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/oa/testAudit', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('59ec31f4a41e4f089113d0d9c2603928', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 13:08:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5b02f22ef9394225ab812ca20bc68b90', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-05-02 18:38:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/delete', 'GET', 'id=c83f74e7f73a4921ab4936905da881b8', '');
INSERT INTO `sys_log` VALUES ('5b3917c68d2a4ca4b132dc656b5c2e61', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 15:29:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=10', '');
INSERT INTO `sys_log` VALUES ('5bdf9d1afb6845398ef1cf3d3652afc4', '1', '内容管理-内容管理-内容发布', '1', '2018-05-02 11:36:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5bec561035c34bb18167021ca54fd8af', '1', '在线办公-流程管理-模型管理', '1', '2018-05-02 15:35:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/act/model', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5d215dd94b7b4e648c4fe4b162fadf1e', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 16:51:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5d2389105aaf45149c9179494b1513b9', '1', '代码生成-代码生成-生成方案配置', '1', '2018-05-02 18:21:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5d9f076ee14c4cb49461ada8ae98d9bd', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 15:29:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=4', '');
INSERT INTO `sys_log` VALUES ('5e9000f265214d37b24868cd82b213d0', '1', '系统设置-日志查询-日志查询', '1', '2018-05-02 13:04:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/log', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5ed74fc095cb45629702ea20e206e9dc', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 13:11:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('5fad2b044bf54ca0af7908282a3e4ef1', '1', '系统设置-系统设置-角色管理-查看', '3', '2018-05-02 18:29:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', 'id=4', '');
INSERT INTO `sys_log` VALUES ('603e92998823481abf009ee5d7588f96', '1', '代码生成-生成示例-单表-查看', '1', '2018-05-02 17:26:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testData/', 'POST', 'pageNo=1&pageSize=30&user.id=&user.name=&office.id=&office.name=&area.id=&area.name=&name=&beginInDate=&endInDate=', '');
INSERT INTO `sys_log` VALUES ('60a467875b1443be87daee309f72f919', '1', '代码生成-生成示例-主子表', '1', '2018-05-02 11:37:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testDataMain', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('60a72712aadd4869b882ea1871238e43', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 15:29:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=8', '');
INSERT INTO `sys_log` VALUES ('6171f00ed30d4233819d850eb9048ea3', '1', '在线办公-通知通告-我的通告', '1', '2018-05-02 13:08:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/oa/oaNotify/self', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('61a535b95b9e431dbe2d724ed8f1cfa8', '1', '代码生成-生成示例-单表', '1', '2018-05-02 13:11:50', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testData', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('61f094b7a6b94d449d2e224b2c09841b', '1', '系统设置-机构用户-机构管理', '1', '2018-05-02 16:51:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/office/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6275a35a13334a0bace4d17f0a2d910e', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 18:32:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6326ec6166b4428395f2d160ba6d0cd6', '1', '在线办公-个人办公-我的任务', '1', '2018-05-02 13:02:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/act/task/todo/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('63cfd34c3de447aa834ded217fea9c07', '1', '我的面板-个人信息-个人信息', '1', '2018-05-02 18:37:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6529e9d87e9e4dd1bf4343b2a53bee80', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 15:29:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=9', '');
INSERT INTO `sys_log` VALUES ('65ef3c8f738c4b0eb7ca8df841a07eda', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 15:28:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6655975a92514966963a2c87505f74a4', '1', '我的面板-个人信息-个人信息', '1', '2018-05-02 11:36:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('67fa1024c29a40d7aed4088acafc4340', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 16:49:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('68fde16d7c664d2a906c7500980e6eb0', '1', '内容管理-栏目设置-栏目管理', '1', '2018-05-02 13:07:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6b11bf2c96754f59a139f27a08295e84', '1', '系统设置-系统设置-字典管理-查看', '1', '2018-05-02 13:11:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/dict/form', 'GET', 'id=39', '');
INSERT INTO `sys_log` VALUES ('6d2dbe50e3764b948020c221a631da10', '1', '内容管理-内容管理', '1', '2018-05-02 11:36:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6de3f38022394f0ca3e90461dc40edd7', '1', '内容管理-内容管理', '1', '2018-05-02 15:26:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6e0d5a0be1ed4fdfa0baa2941d3a72c5', '1', '代码生成-代码生成-业务表配置', '3', '2018-05-02 18:29:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('6fce012b8bb348cdbb69f96cf1efc291', '1', '在线办公-流程管理-流程管理', '1', '2018-05-02 13:03:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/act/process', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('705aaaa357d44c8b89309cbdb2924de0', '1', '在线办公-个人办公-我的任务', '1', '2018-05-02 15:25:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/act/task/todo/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('71fc5a373c3846d3a4d1c6d16cb060d8', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-05-02 18:24:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 'id=df7ce823c5b24ff9bada43d992f373e2', '');
INSERT INTO `sys_log` VALUES ('72e299b7da6e404494efd1c75b143e5a', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 18:38:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7317d0428c0b474ba26df424a014486d', '1', '系统登录', '3', '2018-05-02 18:28:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('735b8cac5622411185dafcd7cbefd5b9', '1', '在线办公-通知通告-我的通告', '1', '2018-05-02 19:02:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/oa/oaNotify/self', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('737a281285f24357961c150123ec35be', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 13:03:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', 'office.id=13&office.name=公司领导', '');
INSERT INTO `sys_log` VALUES ('7387261ea2a9416cb0ac74af1fe75a52', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 15:29:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7469478a487b4727a71104282307354c', '1', '系统登录', '1', '2018-05-02 18:57:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('74976c07456141cf97626d4b59cf283a', '1', '系统设置-机构用户-用户管理', '3', '2018-05-02 18:30:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('755d9a95fe8245e0b38b852f925278e6', '1', '系统设置-机构用户-用户管理-修改', '1', '2018-05-02 18:28:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/checkLoginName', 'GET', 'oldLoginName=sd_zhb&loginName=sd_zhb', '');
INSERT INTO `sys_log` VALUES ('7604b474dcf14511bca935f697d9356b', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 17:26:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('767f4447839e476dbc826a9b35d81602', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 18:23:53', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('768a0b906526409ab964feab3b65bbaf', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-05-02 18:38:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 'id=a89f30f6a8c1471c9f5c53cb8e36e175&parent.id=3c92c17886944d0687e73e286cada573&parent.name=生成示例&name=测试用户&href=/test/testUser&target=&icon=user&sort=5030&isShow=1&permission=test:testUser:view,test:testUser:edit&remarks=', '');
INSERT INTO `sys_log` VALUES ('7856be8a9dd34fa6895ab26f76898d5d', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 18:22:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('78c5eb65a9aa44f2af10c80e06501d93', '1', '在线办公-流程管理-流程管理', '1', '2018-05-02 15:26:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/act/process', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('791ce179863b422cbfbd979f77bd53d4', '1', '代码生成-生成示例-树结构-查看', '1', '2018-05-02 13:06:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree/', 'POST', 'name=', '');
INSERT INTO `sys_log` VALUES ('794510f6b11d4ec89418a7d74e11b30d', '1', '系统设置-机构用户-机构管理-查看', '1', '2018-05-02 16:51:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('79ba871159a94ae49b80f82b51abc040', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 18:28:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('79fc1324979c4c7ab183bdb791ca699d', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-05-02 18:24:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7c1b0c9d122f4cb3b961972257069f15', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 18:26:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7cd34662474946988813a5bdddd0eb6d', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 19:02:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7d60b93f87704ae9b0d9053be5eeea79', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 16:52:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7debb7ea60dd42188a3cbc5d8470d539', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 13:12:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7f177ac9fb614577b4d24c59c8653d71', '1', '内容管理-栏目设置-切换站点', '1', '2018-05-02 13:07:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/site/select', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('7f94b18b3cf644cc88e9a8697cf505b7', '1', '内容管理-内容管理', '1', '2018-05-02 13:07:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7f9b72b8ba7b420abe50cd92d4fa69e3', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 13:04:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/usertorole', 'POST', 'id=7&___t0.8199803413066871=', '');
INSERT INTO `sys_log` VALUES ('7fa5bbc6cb9f4d4896cf61329e4e1103', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 13:04:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('7fa76debe80544c682f1c3297ee54771', '1', '我的面板-个人信息-个人信息', '1', '2018-05-02 18:01:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('80250979f61c4291861a44a09b35d2f1', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-05-02 18:26:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 'id=&parent.id=a89f30f6a8c1471c9f5c53cb8e36e175&parent.name=测试用户&name=编辑&href=&target=&icon=&sort=60&isShow=1&permission=test:testUser:edit&remarks=', '');
INSERT INTO `sys_log` VALUES ('80cc48bfea9a4062af9890bb656d63b0', '1', '系统设置-机构用户-用户管理-修改', '1', '2018-05-02 18:32:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/checkLoginName', 'GET', 'oldLoginName=sd_jsb&loginName=sd_jsb', '');
INSERT INTO `sys_log` VALUES ('80fc80a7fea44840b4279212dc8f5b23', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-05-02 18:26:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 'id=a89f30f6a8c1471c9f5c53cb8e36e175', '');
INSERT INTO `sys_log` VALUES ('8260a2146d33447198452c733d9af790', '1', '代码生成-生成示例-树结构-查看', '1', '2018-05-02 13:06:20', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree/', 'POST', 'name=', '');
INSERT INTO `sys_log` VALUES ('826823f58a9441ae8012c2a44bcd7b46', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 16:52:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('832524fb11c84a79b6da1a207199517d', '1', '我的面板-个人信息-个人信息', '1', '2018-05-02 19:08:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('83b4a557f4a7485e97aa2b6ff6dae1c3', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 18:27:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('849488505be3478cb08a4901189456bb', '1', '系统设置-系统设置-字典管理', '1', '2018-05-02 13:10:49', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/dict/', 'POST', 'pageNo=2&pageSize=30&type=&description=', '');
INSERT INTO `sys_log` VALUES ('877b851e17b04550aa4c5b564e45b5e8', '1', '代码生成-代码生成-生成方案配置', '1', '2018-05-02 19:05:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('888dce77e102466bacf1cfbad40e70a0', '1', '系统设置-机构用户-用户管理', '3', '2018-05-02 18:29:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('88c67245247d46fd80b410b3ddba826b', '1', '内容管理-内容管理-内容发布', '1', '2018-05-02 19:01:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('88f9954be1fd40158235e889ad6b8ae7', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 19:01:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8915e25a0dfe401891dd245f1c1edf1e', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 15:29:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=6', '');
INSERT INTO `sys_log` VALUES ('89701ecc6be4443497f09086eaee9ef3', '1', '系统设置-日志查询-日志查询', '1', '2018-05-02 13:07:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/log', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('89a775b5b0324664b77d8102b5b813a0', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 16:52:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/usertorole', 'POST', 'id=4&___t0.15616215416806933=', '');
INSERT INTO `sys_log` VALUES ('8a0d2428627a44b39b6623b036ee24e9', '1', '系统设置-系统设置-角色管理', '3', '2018-05-02 18:29:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8c26c1a4efdc46748b34989a18f677f7', '1', '系统设置-系统设置-字典管理', '1', '2018-05-02 13:10:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8c2f6353c3514b7cb39a8e71dc061a23', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 18:27:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8c6d0761256d4f8a9c2a0208e2a80f54', '1', '内容管理-内容管理', '1', '2018-05-02 11:36:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8d3358e6e34c4ac492df977eabe4a91e', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 18:31:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8e157c5ef7164e149bf6c1e84abe76d7', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-05-02 18:26:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/save', 'POST', 'id=&parent.id=a89f30f6a8c1471c9f5c53cb8e36e175&parent.name=测试用户&name=查看&href=&target=&icon=&sort=30&isShow=1&permission=test:testUser:view&remarks=', '');
INSERT INTO `sys_log` VALUES ('8e32ea16db71420886c791c956f6f11b', '1', '代码生成-生成示例-测试用户', '1', '2018-05-02 19:05:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testUser', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8e80d1cca0424671a7f6f6a7d6cacd67', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 18:37:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8e87210764c84e1e9b66488a89cf719f', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 13:03:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8e8b1fbf923740ee97c0a73ece821244', '1', '我的面板-个人信息-个人信息', '1', '2018-05-02 19:01:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8e99d9d294de4adb87308cd63befbe47', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 18:31:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8ec9c0fb29a64bd9b867f9833f94a63f', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2018-05-02 11:36:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/article/', 'GET', 'category.id=3', '');
INSERT INTO `sys_log` VALUES ('8f0b985c1e4f414d9ba585bfa1c144a4', '1', '内容管理-内容管理-内容发布', '1', '2018-05-02 13:03:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8f230d78aabc47dca88604384f1256f0', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 13:04:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('8fcbc73c634149179b3f94ff8af70bf6', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 13:12:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('905db877c1684a55874d585a247e683d', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 18:39:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('911a45b5b96b4afcb56d983d7b134955', '1', '系统设置-系统设置-角色管理-修改', '1', '2018-05-02 15:29:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/assign', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('91330a4d53094379a3a745e29b8b0736', '1', '系统设置-机构用户-用户管理-查看', '3', '2018-05-02 18:29:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9483dcb60ae4496bb8baa7534287c220', '1', '代码生成-生成示例-单表', '1', '2018-05-02 19:02:17', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testData', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('968a2183507549ee8179aa317f81fe16', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 13:08:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('979a232ead2c46eda6b6b2d491bfe156', '1', '系统登录', '1', '2018-05-02 19:04:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('98f8962ae81842c08c2de9d98be6fd45', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 15:28:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('995aea2164364a549a6cf7db45bd3c69', '1', '系统设置-系统设置-菜单管理-修改', '1', '2018-05-02 18:38:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/delete', 'GET', 'id=0a34f5c83c9e4096b5268135d0ae200a', '');
INSERT INTO `sys_log` VALUES ('9976efd4219240a581cc5e1b7ddfc69d', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 15:26:39', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('99aba90bd5944f4f8007490260b57d42', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 13:03:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9a205ab1851844ceabb713d4ad970f1c', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 15:29:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=13', '');
INSERT INTO `sys_log` VALUES ('9aa65c40320f4189857dd6182f700594', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 13:06:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9ac1cdf31263461094f8d0812b098f61', '1', '内容管理-内容管理-内容发布', '3', '2018-05-02 18:29:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9ad5af7cf6ba4bae828dfddba1667649', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 18:25:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9b3c33105e6843669c47dd8fd3f929cd', '1', '代码生成-生成示例-主子表', '1', '2018-05-02 17:26:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testDataMain', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9b5de2b3675c40929c110c44dee879bb', '1', '代码生成-生成示例-树结构-查看', '1', '2018-05-02 17:26:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree/', 'POST', 'name=', '');
INSERT INTO `sys_log` VALUES ('9b9f89c264b34aedb40fbcf9d931ca7f', '1', '代码生成-生成示例-树结构', '1', '2018-05-02 19:02:10', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9c07d2e439e54ea2881d7dfa36082c67', '1', '我的面板-个人信息-个人信息', '1', '2018-05-02 11:37:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9c9f4e1c9ad54cda8b8ab9f000b8ef13', '1', '代码生成-生成示例-测试用户', '1', '2018-05-02 19:08:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testUser', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9d787b07f66d46e797d1e8b4bc53b8b3', '1', '在线办公-通知通告-我的通告', '1', '2018-05-02 11:36:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/oa/oaNotify/self', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9e2e3c234f9d49e99eb01850d5ebd4bc', '1', '系统设置-机构用户-用户管理', '3', '2018-05-02 18:28:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9e38803b281e4d47b305d12fb1856445', '1', '内容管理-内容管理', '1', '2018-05-02 19:02:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('9ed40bf913d54d508dd3780fa089cc8a', '1', '内容管理-栏目设置-切换站点', '1', '2018-05-02 13:07:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/site/select', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('a03939b4817e4322910f997ad2998864', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 18:27:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a0489f240e2f419790231d601b211aff', '1', '代码生成-生成示例-单表', '1', '2018-05-02 11:37:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testData', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a230fe36a9044abc9861c64d7b6dff4b', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 18:31:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', 'id=6', '');
INSERT INTO `sys_log` VALUES ('a278a730d7ae451788aec27553fb34d2', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 18:38:04', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a39043136c66418c867ed49256d4e831', '1', '代码生成-代码生成-生成方案配置', '1', '2018-05-02 18:58:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a4bf8791c3db47cdbd3cd53811f5647e', '1', '内容管理-内容管理-公共留言-查看', '1', '2018-05-02 13:07:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/guestbook/', 'GET', 'status=2', '');
INSERT INTO `sys_log` VALUES ('a4ca7f6e5931440eaa73fe0ded873917', '1', '代码生成-生成示例-树结构-查看', '1', '2018-05-02 13:06:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree/', 'POST', 'name=', '');
INSERT INTO `sys_log` VALUES ('a4dd67ad3f224382ad3510a561a6d9f4', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-05-02 18:25:45', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 'parent.id=a89f30f6a8c1471c9f5c53cb8e36e175', '');
INSERT INTO `sys_log` VALUES ('a54446487e6a4bef84d5d64443351f7e', '1', '系统设置-机构用户-用户管理-查看', '3', '2018-05-02 18:29:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', 'id=3', '');
INSERT INTO `sys_log` VALUES ('a554649058d34a0691ffab6f5132da8e', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 17:25:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a58826b2340c4c78a7e3d906288bd812', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 18:22:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a5af5719fc994f879ce07c25e7dc37e4', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 11:36:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a6291df135094b17888f0490e74e8c8c', '1', '代码生成-生成示例-主子表', '1', '2018-05-02 11:37:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testDataMain', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a6491c8c36944e22bd945adf78404096', '1', '在线办公-个人办公-审批测试', '1', '2018-05-02 13:03:22', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/oa/testAudit', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a79b261fc715401f81f7072b82a55039', '1', '代码生成-生成示例-树结构-查看', '1', '2018-05-02 13:06:06', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('a933fb1b84ce49eda5bb028e45ce6b96', '1', '系统登录', '1', '2018-05-02 18:37:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a', 'GET', 'login=', '');
INSERT INTO `sys_log` VALUES ('a93c48f4eb4743af834d32390bf6b80e', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 18:24:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('aa36b223c4694824ba41521bb079330d', '1', '我的面板-个人信息-个人信息', '1', '2018-05-02 11:40:08', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('aac87c0d453a49fb9f1fd79f2c9fb3a1', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 18:28:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', 'id=3', '');
INSERT INTO `sys_log` VALUES ('ac0463718ffb4d86afafe0b97e763dcf', '1', '在线办公-流程管理-模型管理', '1', '2018-05-02 15:33:37', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/act/model', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ac8cdc3e634f43659229e9b6a2f4cb4d', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-05-02 18:25:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 'parent.id=a89f30f6a8c1471c9f5c53cb8e36e175', '');
INSERT INTO `sys_log` VALUES ('adb10d3ca7d34d229bc70fafc2426c7f', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-05-02 18:38:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 'id=a89f30f6a8c1471c9f5c53cb8e36e175', '');
INSERT INTO `sys_log` VALUES ('af3a5ba41caa46a5a1146302dea0bb91', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-05-02 18:23:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 'id=ba8092291b40482db8fe7fc006ea3d76', '');
INSERT INTO `sys_log` VALUES ('af4212f5cb2143cb8107c3b0203434db', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 18:31:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b072c68dd9d943be8e5d5ff998d9fd4d', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 16:51:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b0f07d04a7c9439e832905948d249918', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-05-02 18:25:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 'id=ba8092291b40482db8fe7fc006ea3d76', '');
INSERT INTO `sys_log` VALUES ('b1d0eed8347d4bbca04560a0e6612bfb', '1', '在线办公-通知通告-我的通告', '1', '2018-05-02 15:33:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/oa/oaNotify/self', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b226a70d236b4bff879ab49bc19c8305', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 18:32:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('b3cbb5ac5d6f475d91f9baa2b80193cb', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 16:49:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b46c89ad327649dd8f74a0cb7f3482ba', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 18:28:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', 'id=3', '');
INSERT INTO `sys_log` VALUES ('b53629c9db0c49d8ae942a557c9e069c', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 13:06:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('b731b214503748e5ae73106f8362e8e3', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-05-02 15:28:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 'parent.id=27', '');
INSERT INTO `sys_log` VALUES ('b97e01f7498b42e8a8363d8ba1b215cb', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 18:26:43', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bb09add87c6748fa9b3f45ce59144294', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 18:32:14', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', 'id=5', '');
INSERT INTO `sys_log` VALUES ('bb778eee218247ff96d8a3bb984b8428', '1', '我的面板-个人信息-个人信息', '1', '2018-05-02 19:02:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bbe5bc5bc31d4b978fc44c806216c851', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 17:26:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bcc7a53ce6594b658071d4a6338c5115', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 18:30:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bd7575f4f67e48ccb4aca5d3c56ca569', '1', '代码生成-生成示例-树结构-查看', '1', '2018-05-02 17:26:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bdea188ee8784fc794a9ffb45761fc9c', '1', '内容管理-内容管理', '1', '2018-05-02 15:26:29', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('be039487ebc143a0b1cc8123bc6e34e6', '1', '代码生成-生成示例-测试用户', '5', '2018-05-02 18:39:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testUser', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('be177d232d1944d8bfeaf522e57aa993', '1', '系统设置-机构用户-用户管理-查看', '3', '2018-05-02 18:30:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bf7653f03a044b94b01e734dc5ae0164', '1', '内容管理-栏目设置-栏目管理', '1', '2018-05-02 13:07:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/category/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('bfcbf6218dd747bc81621fba9cd37872', '1', '内容管理-内容管理', '1', '2018-05-02 18:27:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c023eb209a574e34bbc38f53ed5f5115', '1', '系统设置-机构用户-机构管理', '1', '2018-05-02 16:51:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/office/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c0c343f21ba4468184209ea742ed7684', '1', '内容管理-内容管理', '1', '2018-05-02 19:01:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c1c2a7743db04f99abe09d26bd750dfc', '1', '系统设置-机构用户-用户管理-查看', '3', '2018-05-02 18:29:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c1c4117daef44d2da54af8b41e72f808', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-05-02 18:25:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 'id=df7ce823c5b24ff9bada43d992f373e2', '');
INSERT INTO `sys_log` VALUES ('c1dfaa5462514c2685fdb75f7426b7ab', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 13:12:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c27b9236ba714bf3a5b02afcdeff0fee', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 18:37:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c2c4d406495b480ba7e6f5128ca26546', '1', '系统设置-机构用户-机构管理', '1', '2018-05-02 15:29:55', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/office/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c33f22d6990447079d3fc796369dea71', '1', '系统设置-系统设置-字典管理-查看', '1', '2018-05-02 13:04:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/dict/form', 'GET', 'sort=10', '');
INSERT INTO `sys_log` VALUES ('c44ce1ca5d85484abdd16da043efea3d', '1', '系统设置-日志查询-日志查询', '1', '2018-05-02 13:11:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/log', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c5f308126cb241a3806b86382b857b72', '1', '代码生成-生成示例-树结构-查看', '1', '2018-05-02 13:06:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree/', 'POST', 'name=', '');
INSERT INTO `sys_log` VALUES ('c6aac05303e84752ae54e1279842deec', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 18:28:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c6fd979e437a45ac9289070720068d06', '1', '内容管理-内容管理', '1', '2018-05-02 13:03:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/none', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c879914e813844d0b61efdeb75aff8eb', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 18:31:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('c8af08f574ee44c0a9125a708122b2d7', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 18:25:15', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cba76e84f64940159e81eb41b4005b5d', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 13:10:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cc0f7e0fe5bc4a68ac1713a6ef24231a', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 18:28:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cc9b29cb39894db48fbf6c9a84eb6e3c', '1', '内容管理-内容管理', '3', '2018-05-02 18:29:26', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ccc04001c2a1415b8c0c40d1de17f336', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 13:06:35', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/form', 'GET', 'id=2', '');
INSERT INTO `sys_log` VALUES ('cccec3832e844aff983ff572b50c4685', '1', '代码生成-生成示例-测试用户', '1', '2018-05-02 19:02:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testUser', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cd2876edc4264b69920cfa86216e6b0c', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 13:06:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cd4fa18525d54a84a109d6281084630c', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 13:10:27', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cd84a30adf674df1be6e688ec9335619', '1', '我的面板-个人信息-个人信息', '1', '2018-05-02 13:08:19', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ce15a017268a44518e83991b58c33b94', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 13:12:13', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ce1a8280bb6e4773b690ecee229e10ee', '1', '系统设置-系统设置-角色管理-修改', '1', '2018-05-02 18:32:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/save', 'POST', 'id=6&office.id=1&office.name=山东省总公司&oldName=普通用户&name=普通用户&oldEnname=d&enname=d&roleType=assignment&sysData=1&useable=1&dataScope=8&menuIds=1,79,3c92c17886944d0687e73e286cada573,a89f30f6a8c1471c9f5c53cb8e36e175,c83f74e7f73a4921ab4936905d...&officeIds=&remarks=', '');
INSERT INTO `sys_log` VALUES ('cf61545c2cca4aae8679f605ad92b0f3', '1', '代码生成-生成示例-单表', '1', '2018-05-02 17:26:18', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testData', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('cf879dd408054534b9a7e586d47a45dc', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 15:28:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d01bb8a70bc84621884697042dcc7554', '1', '系统设置-系统设置-字典管理', '1', '2018-05-02 13:07:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/dict/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d0a00118d4f14d9398191592cff2af29', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 16:52:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d3479095d4d6413880e816003be2a13c', '1', '内容管理-内容管理-内容发布-文章模型', '1', '2018-05-02 11:36:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/article/', 'GET', 'category.id=4', '');
INSERT INTO `sys_log` VALUES ('d42b23e324874674808e6629d6b201d3', '1', '代码生成-生成示例-主子表', '1', '2018-05-02 15:28:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testDataMain', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d4c2e26438414f4bbdfff626c054639a', '1', '我的面板-个人信息-修改密码', '1', '2018-05-02 13:02:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d52a71b7deb143c88360803793266eef', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 13:06:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d5f177aa8579429eb0e792cd047c5ef6', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 18:26:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d60606b45b2841e485e2adce7b198989', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 18:38:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d69baaa4a46846c4926448b56260b423', '1', '在线办公-通知通告-我的通告', '1', '2018-05-02 14:48:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/oa/oaNotify/self', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d707f896bcf1490ca8499a145382ce4e', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 19:01:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d73e17a1fa6f48c985ea03aef0d3e1f6', '1', '代码生成-代码生成-生成方案配置', '1', '2018-05-02 15:27:56', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d745151e7609400dbb65b7f440601372', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 18:27:33', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d7c66a225602466a86109768a486f53f', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 19:01:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d800570e70964f7d84c437dd00057b3c', '1', '在线办公-流程管理-模型管理', '1', '2018-05-02 15:34:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/act/model', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d91789151f734971ba9f77fb99a1f2af', '1', '代码生成-生成示例-树结构-查看', '1', '2018-05-02 13:06:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree/', 'POST', 'name=', '');
INSERT INTO `sys_log` VALUES ('d9290bf3652f40ffbc172264206f57eb', '1', '内容管理-内容管理', '1', '2018-05-02 13:08:01', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('d9aca427844b4fb5b6ed4e8aaf77fda7', '1', '系统设置-机构用户-用户管理', '3', '2018-05-02 18:29:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('da5eb7763a4042ffa0eec294c501aea9', '1', '我的面板-个人信息-修改密码', '1', '2018-05-02 11:36:16', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/modifyPwd', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('dc05ff314d4e428a94b78c2741ab50fd', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 19:08:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('dc385bdae0164adda2d2897aeae7da26', '1', '在线办公-通知通告-我的通告', '1', '2018-05-02 13:02:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/oa/oaNotify/self', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('dd78a95158104340b8b6636a2d404e46', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 17:25:51', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', 'id=1', '');
INSERT INTO `sys_log` VALUES ('de1f0a0ba3004430a3fcf1383ff8c65c', '1', '我的面板-个人信息-个人信息', '3', '2018-05-02 18:28:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('de77836e21fc45a7918d767d767bab10', '1', '系统设置-系统设置-菜单管理-查看', '1', '2018-05-02 18:25:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/form', 'GET', 'id=a89f30f6a8c1471c9f5c53cb8e36e175', '');
INSERT INTO `sys_log` VALUES ('deceed89bf6d4020935945da91d3abef', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 18:31:44', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', 'id=3', '');
INSERT INTO `sys_log` VALUES ('ded60fb867384e8783a3869130ee7ccd', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 13:10:02', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('dffb87c04ef845a59b503ccd77a1f37e', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 15:29:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e08b3b9e86a44c4a8b287fde693cc505', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 16:52:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e1fcec737ecb416f8110aa686ba26a38', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 18:39:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', 'repage=', '');
INSERT INTO `sys_log` VALUES ('e4eeedf37d8046e6b7affc70839a7bac', '1', '内容管理-统计分析-信息量统计', '1', '2018-05-02 13:07:54', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/stats/article', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e52f218127764f4f92ff085abd123b91', '1', '代码生成-代码生成-生成方案配置', '1', '2018-05-02 11:36:48', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e6a4abf968414937ace265a47017cda2', '1', '在线办公-流程管理-模型管理', '1', '2018-05-02 15:25:58', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/act/model', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e7a9c6a071304101a6b9987f412b4bc2', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 13:03:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e80ead5952ae4e339bc0949c23dd4896', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 13:03:52', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e84adcec6ab94bf49dc9b04000e7d2a2', '1', '代码生成-生成示例-单表-查看', '1', '2018-05-02 13:11:59', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testData/', 'POST', 'pageNo=1&pageSize=30&user.id=3&user.name=综合部&office.id=&office.name=&area.id=&area.name=&name=&beginInDate=&endInDate=', '');
INSERT INTO `sys_log` VALUES ('e860415b9ae747e7aab721ae0f6d4c5e', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 18:25:03', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e868bfa339894348abb2c9521135c99a', '1', '我的面板-个人信息-个人信息', '1', '2018-05-02 15:33:21', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('e9690ff5d0e143c180e7470183114f84', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 15:29:30', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=3', '');
INSERT INTO `sys_log` VALUES ('e9b66a7981b74f75b1b8ce9e71dbdd6e', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 18:37:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('eb61ee4fe1a74907abf902531d1fa791', '1', '系统设置-机构用户-机构管理-查看', '1', '2018-05-02 16:51:46', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/office/list', 'GET', 'id=&parentIds=', '');
INSERT INTO `sys_log` VALUES ('ebf5f692b1e5425289774b02421b833a', '1', '内容管理-内容管理-内容发布', '1', '2018-05-02 18:27:36', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ed31882303e2493985806a7723d73fd2', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 15:26:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('edf677341f7a4ed19c7c3376ee86e5d9', '1', '代码生成-代码生成-生成方案配置', '1', '2018-05-02 18:37:28', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genScheme', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ee03bb40f5eb46f185a35fdcecbc0d8e', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 16:49:40', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/form', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('ee0c14f92aac45beaf4ab7507f747547', '1', '系统设置-系统设置-角色管理-查看', '1', '2018-05-02 15:29:31', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/users', 'GET', 'officeId=5', '');
INSERT INTO `sys_log` VALUES ('f1dea32e85aa418d9347dc61c568254f', '1', '系统设置-系统设置-角色管理', '1', '2018-05-02 15:29:12', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/role/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f297119668c5491d8f6abbdc29349754', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 18:25:34', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f2cc0dc7de244de7bfcd8c6f240dffb3', '1', '我的面板-个人信息-个人信息', '1', '2018-05-02 18:30:57', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f3849b32ca54432f9b0a15d03d09e7f6', '1', '代码生成-生成示例-树结构-查看', '1', '2018-05-02 13:06:05', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree/', 'POST', 'name=', '');
INSERT INTO `sys_log` VALUES ('f3a58aac16ff43e1ac482659706dfcd3', '1', '代码生成-生成示例-树结构-查看', '1', '2018-05-02 13:06:25', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/test/testTree/', 'POST', 'name=', '');
INSERT INTO `sys_log` VALUES ('f3a95e8743594f32bee19777167e6e30', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 18:31:00', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f47655dd5c864cb2b09ab87f61567a1e', '1', '在线办公-流程管理-模型管理', '1', '2018-05-02 13:03:38', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/act/model', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f580e90c478e4e588747ca83fe445fb1', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 17:26:09', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f6463b43a6d547b4a3a161fd9633cb90', '1', '系统设置-机构用户-用户管理', '1', '2018-05-02 13:08:23', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/index', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f727c784daa34cef996aedb1a1621e3a', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 18:37:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f901f902f9ab4057aec4d56029e4fa70', '1', '我的面板-个人信息-个人信息', '3', '2018-05-02 18:29:24', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/info', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('f9d95b75061649fd81c6e0c899c3647c', '1', '代码生成-代码生成-业务表配置', '1', '2018-05-02 18:21:11', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/gen/genTable', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fb989f39291a4427b6bd8fb0fe8a1f0b', '1', '内容管理-内容管理', '1', '2018-05-02 13:03:47', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/cms/tree', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fb9bd3378e964275ba129527b2ec1699', '1', '系统设置-系统设置-菜单管理', '1', '2018-05-02 18:25:41', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/menu/', 'GET', '', '');
INSERT INTO `sys_log` VALUES ('fc7a10263970411a9bf8a5619cc41cbf', '1', '系统设置-机构用户-用户管理-查看', '1', '2018-05-02 16:51:32', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/66.0.3359.139 Safari/537.36', '/jeesite/a/sys/user/list', 'GET', '', '');

-- ----------------------------
-- Table structure for `sys_mdict`
-- ----------------------------
DROP TABLE IF EXISTS `sys_mdict`;
CREATE TABLE `sys_mdict` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_mdict_parent_id` (`parent_id`),
  KEY `sys_mdict_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='多级字典表';

-- ----------------------------
-- Records of sys_mdict
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `href` varchar(2000) DEFAULT NULL COMMENT '链接',
  `target` varchar(20) DEFAULT NULL COMMENT '目标',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标',
  `is_show` char(1) NOT NULL COMMENT '是否在菜单中显示',
  `permission` varchar(200) DEFAULT NULL COMMENT '权限标识',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_menu_parent_id` (`parent_id`),
  KEY `sys_menu_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('0354fe46ecd24a1090e1d37d780f3d1e', '9db337df085145159a90ab810624e92a', 'null198ebe5385c74214914194d13e18eac5,9db337df085145159a90ab810624e92a,', '挑刺工站', '90', '/kpi/removeFishBone', '', '', '1', '', '1', '2018-05-25 15:23:19', '1', '2018-05-25 15:23:19', '', '0');
INSERT INTO `sys_menu` VALUES ('083f84925703427997df6cd8710ba1eb', 'f27dc4ee0ab7417c8146daf68f5b209b', 'nullf27dc4ee0ab7417c8146daf68f5b209b,', '车间', '90', '/bas/workShop', '', '', '1', '', '1', '2018-05-09 14:33:32', '1', '2018-05-10 15:34:44', '', '0');
INSERT INTO `sys_menu` VALUES ('0925db880feb4735824d10acc5741fe8', 'f494e85a935d44e3a071cfe007b67b05', 'nullf494e85a935d44e3a071cfe007b67b05,', '组织机构', '30', '/bas/organization', '', '', '0', '', '1', '2018-05-09 14:31:28', '1', '2018-05-11 17:46:19', '', '0');
INSERT INTO `sys_menu` VALUES ('0cac1a5f9fcc484dabb9feb9816ac2d6', 'f494e85a935d44e3a071cfe007b67b05', 'nullf494e85a935d44e3a071cfe007b67b05,', '员工信息', '60', '', '', '', '1', '', '1', '2018-05-09 14:32:50', '1', '2018-05-09 14:32:50', '', '0');
INSERT INTO `sys_menu` VALUES ('0e80c03c5a06424581c6090de6fedba8', 'd380e37f05bc4270b474e207a8ff5696', 'nullbe3ae032104041568621e5724fb750dd,d380e37f05bc4270b474e207a8ff5696,', '工单', '90', '/bas/workOrder', '', '', '1', '', '1', '2018-05-09 14:43:37', '1', '2018-05-14 15:23:15', '', '1');
INSERT INTO `sys_menu` VALUES ('1', '0', '0,', '功能菜单', '0', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('10', '3', '0,1,2,3,', '字典管理', '60', '/sys/dict/', null, 'th-list', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('11d1e99f639b4dc69543976945831d5f', 'f27dc4ee0ab7417c8146daf68f5b209b', 'null821da4927c5d420891ddbf20ff46ed58,f27dc4ee0ab7417c8146daf68f5b209b,', '设备组', '1140', '/bas/combination', '', '', '1', '', '1', '2018-05-18 14:37:32', '1', '2018-05-18 14:37:32', '', '0');
INSERT INTO `sys_menu` VALUES ('13', '2', '0,1,2,', '机构用户', '970', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('14', '13', '0,1,2,13,', '区域管理', '50', '/sys/area/', null, 'th', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('147a5f2c8f354f3eab5a911c42566ea1', '821da4927c5d420891ddbf20ff46ed58', 'null821da4927c5d420891ddbf20ff46ed58,', '设备基础资料', '30', '', '', '', '1', '', '1', '2018-05-09 13:47:20', '1', '2018-05-14 10:02:52', '', '0');
INSERT INTO `sys_menu` VALUES ('17', '13', '0,1,2,13,', '机构管理', '40', '/sys/office/', null, 'th-large', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('198ebe5385c74214914194d13e18eac5', '38e12856aa084ee0b541d09552b5941e', 'null38e12856aa084ee0b541d09552b5941e,', '绩效管理', '30', '', '', '', '1', '', '1', '2018-05-14 10:14:27', '1', '2018-05-14 10:14:27', '', '0');
INSERT INTO `sys_menu` VALUES ('1bbb262f5eda4982969bd76cc699481d', 'f27dc4ee0ab7417c8146daf68f5b209b', 'nullf27dc4ee0ab7417c8146daf68f5b209b,', '产线', '960', '/bas/line', '', '', '1', '', '1', '2018-05-09 14:36:48', '1', '2018-05-10 15:35:07', '', '0');
INSERT INTO `sys_menu` VALUES ('1c99e12a568f4c839301ad11b0f5c154', '147a5f2c8f354f3eab5a911c42566ea1', 'null147a5f2c8f354f3eab5a911c42566ea1,', '红外对射枪', '180', '/bas/iPhoto', '', '', '1', '', '1', '2018-05-09 14:28:55', '1', '2018-05-11 16:27:51', '', '0');
INSERT INTO `sys_menu` VALUES ('1f2c7ad96430409ab5cdc3aa1857d79e', 'f27dc4ee0ab7417c8146daf68f5b209b', 'nullf27dc4ee0ab7417c8146daf68f5b209b,', '工厂', '60', '/bas/factory', '', '', '1', '', '1', '2018-05-09 14:33:19', '1', '2018-05-10 15:34:16', '', '0');
INSERT INTO `sys_menu` VALUES ('2', '1', '0,1,', '系统设置', '900', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('20', '13', '0,1,2,13,', '用户管理', '30', '/sys/user/index', null, 'user', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('22f682f746ba487ca1b8dea98fee09b5', 'e93acdc44f6246caafd6234ecdc39ff4', 'null655854fb056a443bb02e89b21c56349a,e93acdc44f6246caafd6234ecdc39ff4,', '工艺基础数据维护', '30', '/tec/process', '', '', '1', '', '1', '2018-05-14 10:21:32', '1', '2018-05-24 17:34:13', '', '0');
INSERT INTO `sys_menu` VALUES ('254f67e24e544885a7a11d1886b3586e', '947ec5a840f847ad98cd2d7443a8116e', 'null821da4927c5d420891ddbf20ff46ed58,947ec5a840f847ad98cd2d7443a8116e,', 'BOM物料', '60', '/bas/bom', '', '', '1', '', '1', '2018-05-09 14:43:16', '1', '2018-05-18 17:41:09', '', '0');
INSERT INTO `sys_menu` VALUES ('27', '1', '0,1,', '我的面板', '100', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('28', '27', '0,1,27,', '个人信息', '30', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('29', '28', '0,1,27,28,', '个人信息', '30', '/sys/user/info', null, 'user', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('2a589b154b174e2c8db2ecd1cd63b678', 'b671fe13f0fc457ab42473203ef8b304', 'null56bbcfb7e5fb4250b9940309d6298866,b671fe13f0fc457ab42473203ef8b304,', '设备台账', '30', '/equip/equip', '', '', '1', '', '1', '2018-05-14 10:15:31', '1', '2018-05-16 14:32:36', '', '0');
INSERT INTO `sys_menu` VALUES ('2b438a3a7fe547fb8ff4dcfa51f8dabf', 'f7f6cebd3894464e83e69942fb8c7857', 'nullaf879e38b8af44f9b3521df7e2382062,f7f6cebd3894464e83e69942fb8c7857,', '违规管理', '30', '/qc/violaction', '', '', '1', '', '1', '2018-05-14 10:12:41', '1', '2018-05-24 09:09:41', '', '0');
INSERT INTO `sys_menu` VALUES ('2f048dbd81694d92a19a7b3a47970922', 'f27dc4ee0ab7417c8146daf68f5b209b', 'nullf27dc4ee0ab7417c8146daf68f5b209b,', '企业', '30', '/bas/enterprise', '', '', '1', '', '1', '2018-05-09 14:33:08', '1', '2018-05-09 17:44:51', '', '0');
INSERT INTO `sys_menu` VALUES ('3', '2', '0,1,2,', '系统设置', '980', null, null, null, '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('30', '28', '0,1,27,28,', '修改密码', '40', '/sys/user/modifyPwd', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('329165aeb8a841c7a46714ce87f9fbcd', '147a5f2c8f354f3eab5a911c42566ea1', 'null147a5f2c8f354f3eab5a911c42566ea1,', '设备规格', '240', '', '', '', '1', '', '1', '2018-05-09 14:29:47', '1', '2018-05-09 14:29:47', '', '1');
INSERT INTO `sys_menu` VALUES ('33d1a188f3884f7ca08c7faff340a042', 'f27dc4ee0ab7417c8146daf68f5b209b', 'nullf27dc4ee0ab7417c8146daf68f5b209b,', '工站', '990', '/bas/workStationInfos', '', '', '1', '', '1', '2018-05-09 14:37:12', '1', '2018-05-11 09:33:23', '', '0');
INSERT INTO `sys_menu` VALUES ('35c927c93e354f3388d7c9c5b9bfebb7', 'd4e8ff6fe7d1458ab00ca946971a22da', 'null6a53863d5f9649158e6cde52250c5bd3,d4e8ff6fe7d1458ab00ca946971a22da,', '原材料追溯', '30', '/trace/traceBomComponent', '', '', '1', '', '1', '2018-05-14 10:17:00', '1', '2018-05-26 11:19:04', '', '0');
INSERT INTO `sys_menu` VALUES ('360480a8ba0f438eaef27a2b9f5f1e60', '147a5f2c8f354f3eab5a911c42566ea1', 'null147a5f2c8f354f3eab5a911c42566ea1,', '电子秤', '90', '/bas/electronSteelyard', '', '', '1', '', '1', '2018-05-09 14:26:40', '1', '2018-05-11 10:00:59', '', '0');
INSERT INTO `sys_menu` VALUES ('38e12856aa084ee0b541d09552b5941e', '1', 'null1,', '绩效管理', '1050', '', '', '', '1', '', '1', '2018-05-14 10:01:03', '1', '2018-05-14 10:01:03', '', '0');
INSERT INTO `sys_menu` VALUES ('4', '3', '0,1,2,3,', '菜单管理', '30', '/sys/menu/', null, 'list-alt', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('41ca3011072b47fc91d1f1943fce97c5', 'b671fe13f0fc457ab42473203ef8b304', 'null56bbcfb7e5fb4250b9940309d6298866,b671fe13f0fc457ab42473203ef8b304,', '设备报修派工记录', '90', '/equip/report', '', '', '1', '', '1', '2018-05-16 18:50:02', '1', '2018-05-17 11:21:02', '', '0');
INSERT INTO `sys_menu` VALUES ('425c47f8cb144ade837aa6d6d657d385', '198ebe5385c74214914194d13e18eac5', 'null38e12856aa084ee0b541d09552b5941e,198ebe5385c74214914194d13e18eac5,', '绩效参数配置', '30', '/bas/performType', '', '', '1', '', '1', '2018-05-14 10:19:55', '1', '2018-05-21 15:01:46', '', '0');
INSERT INTO `sys_menu` VALUES ('56bbcfb7e5fb4250b9940309d6298866', '1', 'null1,', '设备管理', '1080', '', '', '', '1', '', '1', '2018-05-14 10:01:15', '1', '2018-05-14 10:01:15', '', '0');
INSERT INTO `sys_menu` VALUES ('56ee5d4912854427a90e11d5e6ba2e4c', 'f7f6cebd3894464e83e69942fb8c7857', 'nullaf879e38b8af44f9b3521df7e2382062,f7f6cebd3894464e83e69942fb8c7857,', '异常工序检测', '90', '/qc/abnormalProcess', '', '', '1', '', '1', '2018-05-14 10:13:47', '1', '2018-05-24 16:14:32', '', '0');
INSERT INTO `sys_menu` VALUES ('59', '56', '0,1,27,40,56,', '修改', '50', null, null, null, '0', 'cms:ckfinder:edit', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('5ee0577f976a4de79c143d0160391750', 'f7f6cebd3894464e83e69942fb8c7857', 'nullf7f6cebd3894464e83e69942fb8c7857,', '质量报表', '120', '', '', '', '1', '', '1', '2018-05-14 10:14:02', '1', '2018-05-14 10:14:02', '', '0');
INSERT INTO `sys_menu` VALUES ('5efd3a0e30a54c198d6d202ff9105771', '147a5f2c8f354f3eab5a911c42566ea1', 'null147a5f2c8f354f3eab5a911c42566ea1,', '设备类型', '210', '', '', '', '1', '', '1', '2018-05-09 14:29:38', '1', '2018-05-09 14:29:38', '', '1');
INSERT INTO `sys_menu` VALUES ('61c22282b36c44e98bd3d8b30dbc05ea', 'b671fe13f0fc457ab42473203ef8b304', 'null56bbcfb7e5fb4250b9940309d6298866,b671fe13f0fc457ab42473203ef8b304,', '设备维修记录', '150', '/equip/report/repairlist', '', '', '1', '', '1', '2018-05-17 15:37:29', '1', '2018-05-17 16:24:35', '', '0');
INSERT INTO `sys_menu` VALUES ('6410a688d9f84f3c846cdfbc0158c23c', 'f27dc4ee0ab7417c8146daf68f5b209b', 'null821da4927c5d420891ddbf20ff46ed58,f27dc4ee0ab7417c8146daf68f5b209b,', '工作组与员工关系', '1080', '/bas/groupUser', '', '', '1', '', '1', '2018-05-17 16:00:57', '1', '2018-05-17 18:17:28', '', '0');
INSERT INTO `sys_menu` VALUES ('655854fb056a443bb02e89b21c56349a', '1', 'null1,', '工艺管理', '960', '', '', '', '1', '', '1', '2018-05-14 09:59:55', '1', '2018-05-14 09:59:55', '', '0');
INSERT INTO `sys_menu` VALUES ('67', '2', '0,1,2,', '日志查询', '985', null, null, null, '1', null, '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('6702b1298ca84bffab2113bc6441e364', 'f27dc4ee0ab7417c8146daf68f5b209b', 'nullf27dc4ee0ab7417c8146daf68f5b209b,', '工站类型', '1050', '/bas/workStationType', '', '', '1', '', '1', '2018-05-09 14:37:38', '1', '2018-05-10 17:11:47', '', '1');
INSERT INTO `sys_menu` VALUES ('67eb0d89f09945a1a088edd8698392ff', '9db337df085145159a90ab810624e92a', 'null198ebe5385c74214914194d13e18eac5,9db337df085145159a90ab810624e92a,', '装袋工站', '150', '/kpi/packages', '', '', '1', '', '1', '2018-05-25 16:27:19', '1', '2018-05-25 17:14:01', '', '0');
INSERT INTO `sys_menu` VALUES ('68', '67', '0,1,2,67,', '日志查询', '30', '/sys/log', null, 'pencil', '1', 'sys:log:view', '1', '2013-06-03 08:00:00', '1', '2013-06-03 08:00:00', null, '1');
INSERT INTO `sys_menu` VALUES ('6a53863d5f9649158e6cde52250c5bd3', '1', 'null1,', '产品追溯性管理', '1110', '', '', '', '0', '', '1', '2018-05-14 10:01:27', '1', '2018-05-14 11:16:27', '', '0');
INSERT INTO `sys_menu` VALUES ('6d88acd0de0f42c6b6449c85bdf03afe', '1', 'null1,', '基础资料', '930', '', '', '', '1', '', '1', '2018-05-08 14:34:42', '1', '2018-05-08 14:34:42', '', '1');
INSERT INTO `sys_menu` VALUES ('6fe4ac323b324e8591e6cbfc81408644', '947ec5a840f847ad98cd2d7443a8116e', 'null947ec5a840f847ad98cd2d7443a8116e,', '产品', '30', '/bas/product', '', '', '1', '', '1', '2018-05-09 14:42:50', '1', '2018-05-11 09:59:24', '', '0');
INSERT INTO `sys_menu` VALUES ('7', '3', '0,1,2,3,', '角色管理', '50', '/sys/role/', null, 'lock', '1', null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('72fa06bf23874c16b8004f9120e05c9c', '947ec5a840f847ad98cd2d7443a8116e', 'null947ec5a840f847ad98cd2d7443a8116e,', '产品类型', '120', '/bas/productType', '', '', '1', '', '1', '2018-05-09 14:43:48', '1', '2018-05-11 10:00:48', '', '1');
INSERT INTO `sys_menu` VALUES ('757ef2df975c4373ac332a358db2088d', 'b671fe13f0fc457ab42473203ef8b304', 'null56bbcfb7e5fb4250b9940309d6298866,b671fe13f0fc457ab42473203ef8b304,', '设备保养计划', '60', '/equip/maintenance', '', '', '1', '', '1', '2018-05-14 10:15:56', '1', '2018-05-16 16:29:25', '', '0');
INSERT INTO `sys_menu` VALUES ('7788447acd244ffb96808309446ac493', 'e93acdc44f6246caafd6234ecdc39ff4', 'null655854fb056a443bb02e89b21c56349a,e93acdc44f6246caafd6234ecdc39ff4,', '工序与工站关系', '120', '/tec/processStation', '', '', '1', '', '1', '2018-05-23 13:48:27', '1', '2018-05-24 17:34:58', '', '0');
INSERT INTO `sys_menu` VALUES ('810357a5a848490b94f62c4eb38bb53a', 'e93acdc44f6246caafd6234ecdc39ff4', 'null655854fb056a443bb02e89b21c56349a,e93acdc44f6246caafd6234ecdc39ff4,', '工艺路由维护', '60', '/tec/flow', '', '', '1', '', '1', '2018-05-14 10:21:48', '1', '2018-05-24 17:34:32', '', '0');
INSERT INTO `sys_menu` VALUES ('821da4927c5d420891ddbf20ff46ed58', '1', 'null1,', '基础资料管理', '930', '', '', '', '1', '', '1', '2018-05-09 13:45:18', '1', '2018-05-14 09:59:39', '', '0');
INSERT INTO `sys_menu` VALUES ('822d2d342500413fac4752a623441f21', '947ec5a840f847ad98cd2d7443a8116e', 'null821da4927c5d420891ddbf20ff46ed58,947ec5a840f847ad98cd2d7443a8116e,', 'BOM物料组件', '90', '/bas/bomComponent', '', '', '1', '', '1', '2018-05-19 10:41:56', '1', '2018-05-19 10:41:56', '', '0');
INSERT INTO `sys_menu` VALUES ('84f341d19e8346daa918698f9d569caa', 'd4e8ff6fe7d1458ab00ca946971a22da', 'null6a53863d5f9649158e6cde52250c5bd3,d4e8ff6fe7d1458ab00ca946971a22da,', '工艺流程追溯', '60', '/trace/traceProcess', '', '', '1', '', '1', '2018-05-14 10:17:21', '1', '2018-05-26 15:03:13', '', '0');
INSERT INTO `sys_menu` VALUES ('85', '76', '0,1,75,76,', '行政区域', '80', '/../static/map/map-city.html', null, null, '1', null, '1', '2013-10-22 08:00:00', '1', '2013-10-22 08:00:00', null, '0');
INSERT INTO `sys_menu` VALUES ('8b2f8164e1f74e798c2de67bdb03afb8', '147a5f2c8f354f3eab5a911c42566ea1', 'null147a5f2c8f354f3eab5a911c42566ea1,', '触摸屏', '30', '/bas/touchScreen', '', '', '1', '', '1', '2018-05-09 14:26:01', '1', '2018-05-11 09:49:23', '', '1');
INSERT INTO `sys_menu` VALUES ('8d39580f5bec461d9ae5fb7d9f0fe9c3', '9db337df085145159a90ab810624e92a', 'null198ebe5385c74214914194d13e18eac5,9db337df085145159a90ab810624e92a,', '开片工站', '60', '/kpi/cutPiece', '', '', '1', '', '1', '2018-05-25 14:13:43', '1', '2018-05-25 14:13:43', '', '0');
INSERT INTO `sys_menu` VALUES ('947ec5a840f847ad98cd2d7443a8116e', '821da4927c5d420891ddbf20ff46ed58', 'null821da4927c5d420891ddbf20ff46ed58,', 'BOM资料管理', '120', '', '', '', '1', '', '1', '2018-05-09 13:54:26', '1', '2018-05-14 10:03:36', '', '0');
INSERT INTO `sys_menu` VALUES ('964cd22cbd0b4b538e545bdaac9788e0', '147a5f2c8f354f3eab5a911c42566ea1', 'null147a5f2c8f354f3eab5a911c42566ea1,', '读卡器', '270', '/bas/cardReader', '', '', '1', '', '1', '2018-05-09 14:30:32', '1', '2018-05-11 16:36:22', '', '0');
INSERT INTO `sys_menu` VALUES ('9c7cdfc6ee0b42e989cd5f8062ba4ad2', '1', 'null1,', '生产订单管理', '990', '', '', '', '1', '', '1', '2018-05-14 10:00:21', '1', '2018-05-14 10:09:41', '', '0');
INSERT INTO `sys_menu` VALUES ('9db337df085145159a90ab810624e92a', '198ebe5385c74214914194d13e18eac5', 'null198ebe5385c74214914194d13e18eac5,', '绩效报表', '60', '', '', '', '1', '', '1', '2018-05-14 10:20:07', '1', '2018-05-14 10:20:07', '', '0');
INSERT INTO `sys_menu` VALUES ('9db9a90f2a444e7bb761184f2a7d6076', '9db337df085145159a90ab810624e92a', 'null198ebe5385c74214914194d13e18eac5,9db337df085145159a90ab810624e92a,', '去头工站', '30', '/kpi/decaptitating', '', '', '1', '', '1', '2018-05-25 11:15:38', '1', '2018-05-25 11:15:38', '', '0');
INSERT INTO `sys_menu` VALUES ('a6e77a77b4244200a05e3634a0d4917c', '38e12856aa084ee0b541d09552b5941e', 'null38e12856aa084ee0b541d09552b5941e,', '绩效参数配置', '60', '', '', '', '1', '', '1', '2018-05-14 10:14:43', '1', '2018-05-14 10:14:43', '', '1');
INSERT INTO `sys_menu` VALUES ('a771eff126ab4a029c5834d343ea18b7', 'f27dc4ee0ab7417c8146daf68f5b209b', 'null821da4927c5d420891ddbf20ff46ed58,f27dc4ee0ab7417c8146daf68f5b209b,', '工站与工作组关系', '1110', '/bas/stationGroup', '', '', '1', '', '1', '2018-05-18 10:16:50', '1', '2018-05-18 10:35:29', '', '0');
INSERT INTO `sys_menu` VALUES ('af879e38b8af44f9b3521df7e2382062', '1', 'null1,', '质量管理', '1020', '', '', '', '1', '', '1', '2018-05-14 10:00:42', '1', '2018-05-14 10:00:42', '', '0');
INSERT INTO `sys_menu` VALUES ('b3a63a91787d4a69917ec31b90d5bd04', 'f27dc4ee0ab7417c8146daf68f5b209b', 'null821da4927c5d420891ddbf20ff46ed58,f27dc4ee0ab7417c8146daf68f5b209b,', '工作组', '1050', '/bas/workGroup', '', '', '1', '', '1', '2018-05-17 13:36:20', '1', '2018-05-17 13:51:47', '', '0');
INSERT INTO `sys_menu` VALUES ('b4c4553b6a8f492297c8d472a8690b4f', 'e93acdc44f6246caafd6234ecdc39ff4', 'null655854fb056a443bb02e89b21c56349a,e93acdc44f6246caafd6234ecdc39ff4,', '工艺路由与工序关系', '90', '/tec/flowProcess', '', '', '1', '', '1', '2018-05-23 10:50:47', '1', '2018-05-24 17:35:20', '', '0');
INSERT INTO `sys_menu` VALUES ('b671fe13f0fc457ab42473203ef8b304', '56bbcfb7e5fb4250b9940309d6298866', 'null56bbcfb7e5fb4250b9940309d6298866,', '设备管理', '30', '', '', '', '1', '', '1', '2018-05-14 10:15:14', '1', '2018-05-14 10:15:14', '', '0');
INSERT INTO `sys_menu` VALUES ('b9262d06229241ad82f853c8488038a3', '147a5f2c8f354f3eab5a911c42566ea1', 'null147a5f2c8f354f3eab5a911c42566ea1,', '设备类型', '300', '/bas/equipType', '', '', '1', '', '1', '2018-05-09 15:31:44', '1', '2018-05-10 14:07:16', '', '1');
INSERT INTO `sys_menu` VALUES ('b9f606e5f7b34c3698b48e4e8e4dfaba', 'f27dc4ee0ab7417c8146daf68f5b209b', 'nullf27dc4ee0ab7417c8146daf68f5b209b,', '工位', '1020', '/bas/workCell', '', '', '1', '', '1', '2018-05-09 14:37:26', '1', '2018-05-10 17:12:22', '', '0');
INSERT INTO `sys_menu` VALUES ('bae14cd841df4358a52c581550a8ac9b', '821da4927c5d420891ddbf20ff46ed58', 'null821da4927c5d420891ddbf20ff46ed58,', '电磁门锁', '150', '', '', '', '1', '', '1', '2018-05-09 14:26:52', '1', '2018-05-09 14:27:35', '', '1');
INSERT INTO `sys_menu` VALUES ('be3ae032104041568621e5724fb750dd', '9c7cdfc6ee0b42e989cd5f8062ba4ad2', 'null9c7cdfc6ee0b42e989cd5f8062ba4ad2,', '工单管理', '30', '', '', '', '1', '', '1', '2018-05-14 10:09:57', '1', '2018-05-14 10:09:57', '', '0');
INSERT INTO `sys_menu` VALUES ('c4c2f8796867427880b1ac75292d8612', '147a5f2c8f354f3eab5a911c42566ea1', 'null147a5f2c8f354f3eab5a911c42566ea1,', '设备规格', '330', '/bas/equipSpec', '', '', '0', '', '1', '2018-05-09 15:31:56', '1', '2018-05-11 17:46:36', '', '1');
INSERT INTO `sys_menu` VALUES ('c5596aa99cd54fd8981682eaf79ffb89', 'f7f6cebd3894464e83e69942fb8c7857', 'nullaf879e38b8af44f9b3521df7e2382062,f7f6cebd3894464e83e69942fb8c7857,', '残次品上报管理', '60', '/qc/inperfections', '', '', '1', '', '1', '2018-05-14 10:13:21', '1', '2018-05-24 11:25:03', '', '0');
INSERT INTO `sys_menu` VALUES ('c666c10050714730b9f943c4d9c47c05', 'b671fe13f0fc457ab42473203ef8b304', 'null56bbcfb7e5fb4250b9940309d6298866,b671fe13f0fc457ab42473203ef8b304,', '设备故障上报', '120', '/equip/report/form', '', '', '1', '', '1', '2018-05-16 19:22:44', '1', '2018-05-16 19:22:44', '', '0');
INSERT INTO `sys_menu` VALUES ('c72025961c354c3ba96ba53a0339dae0', '38e12856aa084ee0b541d09552b5941e', 'null38e12856aa084ee0b541d09552b5941e,', '绩效报表', '90', '', '', '', '1', '', '1', '2018-05-14 10:14:54', '1', '2018-05-14 10:14:54', '', '1');
INSERT INTO `sys_menu` VALUES ('c96965c03ecc470096385f77171755a3', 'd4e8ff6fe7d1458ab00ca946971a22da', 'null6a53863d5f9649158e6cde52250c5bd3,d4e8ff6fe7d1458ab00ca946971a22da,', '订单追溯', '90', '/trace/traceWorkOrder', '', '', '1', '', '1', '2018-05-14 10:17:37', '1', '2018-05-26 17:53:39', '', '0');
INSERT INTO `sys_menu` VALUES ('c9853ea7d0c8433db0fa467f1338ecf2', '147a5f2c8f354f3eab5a911c42566ea1', 'null147a5f2c8f354f3eab5a911c42566ea1,', '电磁门锁', '120', '/bas/eleDoor', '', '', '1', '', '1', '2018-05-09 14:28:14', '1', '2018-05-11 11:24:49', '', '1');
INSERT INTO `sys_menu` VALUES ('ce08ca9b8ef0467e943d4aec1f5e67bc', '147a5f2c8f354f3eab5a911c42566ea1', 'null147a5f2c8f354f3eab5a911c42566ea1,', '条码打印机', '150', '/bas/codePrinter', '', '', '1', '', '1', '2018-05-09 14:28:31', '1', '2018-05-11 11:54:09', '', '0');
INSERT INTO `sys_menu` VALUES ('cec73bb87f6247fbbab8f83198d6b63a', '9db337df085145159a90ab810624e92a', 'null198ebe5385c74214914194d13e18eac5,9db337df085145159a90ab810624e92a,', '切段工站', '120', '/kpi/chopingBiz', '', '', '1', '', '1', '2018-05-25 15:56:26', '1', '2018-05-30 15:09:35', '', '0');
INSERT INTO `sys_menu` VALUES ('d380e37f05bc4270b474e207a8ff5696', 'be3ae032104041568621e5724fb750dd', 'null9c7cdfc6ee0b42e989cd5f8062ba4ad2,be3ae032104041568621e5724fb750dd,', '工单维护', '30', '/bas/workOrder', '', '', '1', '', '1', '2018-05-14 10:10:38', '1', '2018-05-22 16:53:47', '', '0');
INSERT INTO `sys_menu` VALUES ('d4e8ff6fe7d1458ab00ca946971a22da', '6a53863d5f9649158e6cde52250c5bd3', 'null6a53863d5f9649158e6cde52250c5bd3,', '产品追溯性管理', '30', '', '', '', '1', '', '1', '2018-05-14 10:16:41', '1', '2018-05-14 10:16:41', '', '0');
INSERT INTO `sys_menu` VALUES ('df348560c3794621a3dd6e146b0d001e', '9db337df085145159a90ab810624e92a', 'null198ebe5385c74214914194d13e18eac5,9db337df085145159a90ab810624e92a,', '装箱工站', '180', '/kpi/boxing', '', '', '1', '', '1', '2018-05-25 17:35:46', '1', '2018-05-25 17:35:46', '', '0');
INSERT INTO `sys_menu` VALUES ('e93acdc44f6246caafd6234ecdc39ff4', '655854fb056a443bb02e89b21c56349a', 'null655854fb056a443bb02e89b21c56349a,', '工艺资料管理', '30', '', '', '', '1', '', '1', '2018-05-14 10:07:02', '1', '2018-05-14 10:07:02', '', '0');
INSERT INTO `sys_menu` VALUES ('f27dc4ee0ab7417c8146daf68f5b209b', '821da4927c5d420891ddbf20ff46ed58', 'null821da4927c5d420891ddbf20ff46ed58,', '资源基础资料', '90', '', '', '', '1', '', '1', '2018-05-09 13:54:12', '1', '2018-05-14 10:03:07', '', '0');
INSERT INTO `sys_menu` VALUES ('f494e85a935d44e3a071cfe007b67b05', '821da4927c5d420891ddbf20ff46ed58', 'null821da4927c5d420891ddbf20ff46ed58,', '组织', '60', '', '', '', '1', '', '1', '2018-05-09 13:49:15', '1', '2018-05-09 14:31:19', '', '1');
INSERT INTO `sys_menu` VALUES ('f7f6cebd3894464e83e69942fb8c7857', 'af879e38b8af44f9b3521df7e2382062', 'nullaf879e38b8af44f9b3521df7e2382062,', '质量管理', '30', '', '', '', '1', '', '1', '2018-05-14 10:11:24', '1', '2018-05-14 10:11:24', '', '0');
INSERT INTO `sys_menu` VALUES ('f87e6fcfe87b4a07b3f69165dfe59add', '147a5f2c8f354f3eab5a911c42566ea1', 'null147a5f2c8f354f3eab5a911c42566ea1,', '安卓PAD', '60', '/bas/androidPAD', '', '', '1', '', '1', '2018-05-09 14:26:16', '1', '2018-05-10 17:20:55', '', '0');
INSERT INTO `sys_menu` VALUES ('fa5cbee4e51044558967f4d326b7019e', '947ec5a840f847ad98cd2d7443a8116e', 'null947ec5a840f847ad98cd2d7443a8116e,', '产品规格', '150', '/bas/productSpec', '', '', '1', '', '1', '2018-05-09 14:43:57', '1', '2018-05-11 10:01:09', '', '1');

-- ----------------------------
-- Table structure for `sys_office`
-- ----------------------------
DROP TABLE IF EXISTS `sys_office`;
CREATE TABLE `sys_office` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `parent_id` varchar(64) NOT NULL COMMENT '父级编号',
  `parent_ids` varchar(2000) NOT NULL COMMENT '所有父级编号',
  `name` varchar(100) NOT NULL COMMENT '名称',
  `sort` decimal(10,0) NOT NULL COMMENT '排序',
  `area_id` varchar(64) NOT NULL COMMENT '归属区域',
  `code` varchar(100) DEFAULT NULL COMMENT '区域编码',
  `type` char(1) NOT NULL COMMENT '机构类型',
  `grade` char(1) NOT NULL COMMENT '机构等级',
  `address` varchar(255) DEFAULT NULL COMMENT '联系地址',
  `zip_code` varchar(100) DEFAULT NULL COMMENT '邮政编码',
  `master` varchar(100) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `fax` varchar(200) DEFAULT NULL COMMENT '传真',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `USEABLE` varchar(64) DEFAULT NULL COMMENT '是否启用',
  `PRIMARY_PERSON` varchar(64) DEFAULT NULL COMMENT '主负责人',
  `DEPUTY_PERSON` varchar(64) DEFAULT NULL COMMENT '副负责人',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_office_parent_id` (`parent_id`),
  KEY `sys_office_del_flag` (`del_flag`),
  KEY `sys_office_type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='机构表';

-- ----------------------------
-- Records of sys_office
-- ----------------------------
INSERT INTO `sys_office` VALUES ('1', '0', '0,', '烟台艾氪森数字科技有限公司', '10', '2', '100000', '1', '1', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2018-05-14 11:33:37', '', '0');
INSERT INTO `sys_office` VALUES ('2', '1', '0,1,', '公司领导', '10', '2', '100001', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('3', '1', '0,1,', '生产部', '20', '2', '100002', '2', '1', '', '', '', '', '', '', '1', '', '', '1', '2013-05-27 08:00:00', '1', '2018-05-14 11:34:36', '', '0');
INSERT INTO `sys_office` VALUES ('34ec46d711744bb9af8eda10aac85b6e', '3', '0,1,3,', '机加车间', '30', '2', '100002001', '2', '1', '', '', '', '', '', '', '1', '181abcd9d1e04e0fb4f4b310031e2f86', '', 'ef83ec0c592148c2991b12e6711e5911', '2018-05-15 18:54:14', 'ef83ec0c592148c2991b12e6711e5911', '2018-05-15 18:54:14', '', '0');
INSERT INTO `sys_office` VALUES ('4', '1', '0,1,', '市场部', '30', '2', '100003', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('5', '1', '0,1,', '技术部', '40', '2', '100004', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_office` VALUES ('6', '1', '0,1,', '研发部', '50', '2', '100005', '2', '1', null, null, null, null, null, null, '1', null, null, '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `office_id` varchar(64) DEFAULT NULL COMMENT '归属机构',
  `name` varchar(100) NOT NULL COMMENT '角色名称',
  `enname` varchar(255) DEFAULT NULL COMMENT '英文名称',
  `role_type` varchar(255) DEFAULT NULL COMMENT '角色类型',
  `data_scope` char(1) DEFAULT NULL COMMENT '数据范围',
  `is_sys` varchar(64) DEFAULT NULL COMMENT '是否系统数据',
  `useable` varchar(64) DEFAULT NULL COMMENT '是否可用',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_role_del_flag` (`del_flag`),
  KEY `sys_role_enname` (`enname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '1', '系统管理员', 'dept', 'assignment', '1', '1', '1', '1', '2013-05-27 08:00:00', '1', '2018-05-25 17:36:02', '', '0');
INSERT INTO `sys_role` VALUES ('2', '1', '公司管理员', 'hr', 'assignment', '2', '1', '1', '1', '2013-05-27 08:00:00', '1', '2018-05-17 13:42:38', '', '0');
INSERT INTO `sys_role` VALUES ('3', '1', '本公司管理员', 'a', 'assignment', '3', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('4', '1', '部门管理员', 'b', 'assignment', '4', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('5', '1', '本部门管理员', 'c', 'assignment', '5', null, '1', '1', '2013-05-27 08:00:00', '1', '2013-05-27 08:00:00', null, '0');
INSERT INTO `sys_role` VALUES ('6', '1', '普通用户', 'd', 'assignment', '8', '1', '1', '1', '2013-05-27 08:00:00', '1', '2018-05-02 18:39:09', '', '0');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `menu_id` varchar(64) NOT NULL COMMENT '菜单编号',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-菜单';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('1', '0354fe46ecd24a1090e1d37d780f3d1e');
INSERT INTO `sys_role_menu` VALUES ('1', '083f84925703427997df6cd8710ba1eb');
INSERT INTO `sys_role_menu` VALUES ('1', '0925db880feb4735824d10acc5741fe8');
INSERT INTO `sys_role_menu` VALUES ('1', '0cac1a5f9fcc484dabb9feb9816ac2d6');
INSERT INTO `sys_role_menu` VALUES ('1', '1');
INSERT INTO `sys_role_menu` VALUES ('1', '10');
INSERT INTO `sys_role_menu` VALUES ('1', '11d1e99f639b4dc69543976945831d5f');
INSERT INTO `sys_role_menu` VALUES ('1', '13');
INSERT INTO `sys_role_menu` VALUES ('1', '14');
INSERT INTO `sys_role_menu` VALUES ('1', '147a5f2c8f354f3eab5a911c42566ea1');
INSERT INTO `sys_role_menu` VALUES ('1', '17');
INSERT INTO `sys_role_menu` VALUES ('1', '198ebe5385c74214914194d13e18eac5');
INSERT INTO `sys_role_menu` VALUES ('1', '1bbb262f5eda4982969bd76cc699481d');
INSERT INTO `sys_role_menu` VALUES ('1', '1c99e12a568f4c839301ad11b0f5c154');
INSERT INTO `sys_role_menu` VALUES ('1', '1f2c7ad96430409ab5cdc3aa1857d79e');
INSERT INTO `sys_role_menu` VALUES ('1', '2');
INSERT INTO `sys_role_menu` VALUES ('1', '20');
INSERT INTO `sys_role_menu` VALUES ('1', '22f682f746ba487ca1b8dea98fee09b5');
INSERT INTO `sys_role_menu` VALUES ('1', '254f67e24e544885a7a11d1886b3586e');
INSERT INTO `sys_role_menu` VALUES ('1', '27');
INSERT INTO `sys_role_menu` VALUES ('1', '28');
INSERT INTO `sys_role_menu` VALUES ('1', '29');
INSERT INTO `sys_role_menu` VALUES ('1', '2a589b154b174e2c8db2ecd1cd63b678');
INSERT INTO `sys_role_menu` VALUES ('1', '2b438a3a7fe547fb8ff4dcfa51f8dabf');
INSERT INTO `sys_role_menu` VALUES ('1', '2f048dbd81694d92a19a7b3a47970922');
INSERT INTO `sys_role_menu` VALUES ('1', '3');
INSERT INTO `sys_role_menu` VALUES ('1', '30');
INSERT INTO `sys_role_menu` VALUES ('1', '33d1a188f3884f7ca08c7faff340a042');
INSERT INTO `sys_role_menu` VALUES ('1', '35c927c93e354f3388d7c9c5b9bfebb7');
INSERT INTO `sys_role_menu` VALUES ('1', '360480a8ba0f438eaef27a2b9f5f1e60');
INSERT INTO `sys_role_menu` VALUES ('1', '38e12856aa084ee0b541d09552b5941e');
INSERT INTO `sys_role_menu` VALUES ('1', '4');
INSERT INTO `sys_role_menu` VALUES ('1', '41ca3011072b47fc91d1f1943fce97c5');
INSERT INTO `sys_role_menu` VALUES ('1', '425c47f8cb144ade837aa6d6d657d385');
INSERT INTO `sys_role_menu` VALUES ('1', '56bbcfb7e5fb4250b9940309d6298866');
INSERT INTO `sys_role_menu` VALUES ('1', '56ee5d4912854427a90e11d5e6ba2e4c');
INSERT INTO `sys_role_menu` VALUES ('1', '59');
INSERT INTO `sys_role_menu` VALUES ('1', '5ee0577f976a4de79c143d0160391750');
INSERT INTO `sys_role_menu` VALUES ('1', '61c22282b36c44e98bd3d8b30dbc05ea');
INSERT INTO `sys_role_menu` VALUES ('1', '6410a688d9f84f3c846cdfbc0158c23c');
INSERT INTO `sys_role_menu` VALUES ('1', '655854fb056a443bb02e89b21c56349a');
INSERT INTO `sys_role_menu` VALUES ('1', '67eb0d89f09945a1a088edd8698392ff');
INSERT INTO `sys_role_menu` VALUES ('1', '6a53863d5f9649158e6cde52250c5bd3');
INSERT INTO `sys_role_menu` VALUES ('1', '6fe4ac323b324e8591e6cbfc81408644');
INSERT INTO `sys_role_menu` VALUES ('1', '7');
INSERT INTO `sys_role_menu` VALUES ('1', '757ef2df975c4373ac332a358db2088d');
INSERT INTO `sys_role_menu` VALUES ('1', '7788447acd244ffb96808309446ac493');
INSERT INTO `sys_role_menu` VALUES ('1', '810357a5a848490b94f62c4eb38bb53a');
INSERT INTO `sys_role_menu` VALUES ('1', '821da4927c5d420891ddbf20ff46ed58');
INSERT INTO `sys_role_menu` VALUES ('1', '822d2d342500413fac4752a623441f21');
INSERT INTO `sys_role_menu` VALUES ('1', '84f341d19e8346daa918698f9d569caa');
INSERT INTO `sys_role_menu` VALUES ('1', '85');
INSERT INTO `sys_role_menu` VALUES ('1', '8d39580f5bec461d9ae5fb7d9f0fe9c3');
INSERT INTO `sys_role_menu` VALUES ('1', '947ec5a840f847ad98cd2d7443a8116e');
INSERT INTO `sys_role_menu` VALUES ('1', '964cd22cbd0b4b538e545bdaac9788e0');
INSERT INTO `sys_role_menu` VALUES ('1', '9c7cdfc6ee0b42e989cd5f8062ba4ad2');
INSERT INTO `sys_role_menu` VALUES ('1', '9db337df085145159a90ab810624e92a');
INSERT INTO `sys_role_menu` VALUES ('1', '9db9a90f2a444e7bb761184f2a7d6076');
INSERT INTO `sys_role_menu` VALUES ('1', 'a771eff126ab4a029c5834d343ea18b7');
INSERT INTO `sys_role_menu` VALUES ('1', 'af879e38b8af44f9b3521df7e2382062');
INSERT INTO `sys_role_menu` VALUES ('1', 'b3a63a91787d4a69917ec31b90d5bd04');
INSERT INTO `sys_role_menu` VALUES ('1', 'b4c4553b6a8f492297c8d472a8690b4f');
INSERT INTO `sys_role_menu` VALUES ('1', 'b671fe13f0fc457ab42473203ef8b304');
INSERT INTO `sys_role_menu` VALUES ('1', 'b9f606e5f7b34c3698b48e4e8e4dfaba');
INSERT INTO `sys_role_menu` VALUES ('1', 'be3ae032104041568621e5724fb750dd');
INSERT INTO `sys_role_menu` VALUES ('1', 'c5596aa99cd54fd8981682eaf79ffb89');
INSERT INTO `sys_role_menu` VALUES ('1', 'c666c10050714730b9f943c4d9c47c05');
INSERT INTO `sys_role_menu` VALUES ('1', 'c96965c03ecc470096385f77171755a3');
INSERT INTO `sys_role_menu` VALUES ('1', 'ce08ca9b8ef0467e943d4aec1f5e67bc');
INSERT INTO `sys_role_menu` VALUES ('1', 'cec73bb87f6247fbbab8f83198d6b63a');
INSERT INTO `sys_role_menu` VALUES ('1', 'd380e37f05bc4270b474e207a8ff5696');
INSERT INTO `sys_role_menu` VALUES ('1', 'd4e8ff6fe7d1458ab00ca946971a22da');
INSERT INTO `sys_role_menu` VALUES ('1', 'df348560c3794621a3dd6e146b0d001e');
INSERT INTO `sys_role_menu` VALUES ('1', 'e93acdc44f6246caafd6234ecdc39ff4');
INSERT INTO `sys_role_menu` VALUES ('1', 'f27dc4ee0ab7417c8146daf68f5b209b');
INSERT INTO `sys_role_menu` VALUES ('1', 'f7f6cebd3894464e83e69942fb8c7857');
INSERT INTO `sys_role_menu` VALUES ('1', 'f87e6fcfe87b4a07b3f69165dfe59add');
INSERT INTO `sys_role_menu` VALUES ('2', '083f84925703427997df6cd8710ba1eb');
INSERT INTO `sys_role_menu` VALUES ('2', '0925db880feb4735824d10acc5741fe8');
INSERT INTO `sys_role_menu` VALUES ('2', '0cac1a5f9fcc484dabb9feb9816ac2d6');
INSERT INTO `sys_role_menu` VALUES ('2', '0e80c03c5a06424581c6090de6fedba8');
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '10');
INSERT INTO `sys_role_menu` VALUES ('2', '13');
INSERT INTO `sys_role_menu` VALUES ('2', '14');
INSERT INTO `sys_role_menu` VALUES ('2', '147a5f2c8f354f3eab5a911c42566ea1');
INSERT INTO `sys_role_menu` VALUES ('2', '17');
INSERT INTO `sys_role_menu` VALUES ('2', '1bbb262f5eda4982969bd76cc699481d');
INSERT INTO `sys_role_menu` VALUES ('2', '1c99e12a568f4c839301ad11b0f5c154');
INSERT INTO `sys_role_menu` VALUES ('2', '1f2c7ad96430409ab5cdc3aa1857d79e');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '20');
INSERT INTO `sys_role_menu` VALUES ('2', '254f67e24e544885a7a11d1886b3586e');
INSERT INTO `sys_role_menu` VALUES ('2', '27');
INSERT INTO `sys_role_menu` VALUES ('2', '28');
INSERT INTO `sys_role_menu` VALUES ('2', '29');
INSERT INTO `sys_role_menu` VALUES ('2', '2f048dbd81694d92a19a7b3a47970922');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '30');
INSERT INTO `sys_role_menu` VALUES ('2', '33d1a188f3884f7ca08c7faff340a042');
INSERT INTO `sys_role_menu` VALUES ('2', '360480a8ba0f438eaef27a2b9f5f1e60');
INSERT INTO `sys_role_menu` VALUES ('2', '4');
INSERT INTO `sys_role_menu` VALUES ('2', '59');
INSERT INTO `sys_role_menu` VALUES ('2', '6fe4ac323b324e8591e6cbfc81408644');
INSERT INTO `sys_role_menu` VALUES ('2', '7');
INSERT INTO `sys_role_menu` VALUES ('2', '821da4927c5d420891ddbf20ff46ed58');
INSERT INTO `sys_role_menu` VALUES ('2', '85');
INSERT INTO `sys_role_menu` VALUES ('2', '947ec5a840f847ad98cd2d7443a8116e');
INSERT INTO `sys_role_menu` VALUES ('2', '964cd22cbd0b4b538e545bdaac9788e0');
INSERT INTO `sys_role_menu` VALUES ('2', 'b3a63a91787d4a69917ec31b90d5bd04');
INSERT INTO `sys_role_menu` VALUES ('2', 'b9f606e5f7b34c3698b48e4e8e4dfaba');
INSERT INTO `sys_role_menu` VALUES ('2', 'ce08ca9b8ef0467e943d4aec1f5e67bc');
INSERT INTO `sys_role_menu` VALUES ('2', 'f27dc4ee0ab7417c8146daf68f5b209b');
INSERT INTO `sys_role_menu` VALUES ('2', 'f87e6fcfe87b4a07b3f69165dfe59add');
INSERT INTO `sys_role_menu` VALUES ('3', '1');
INSERT INTO `sys_role_menu` VALUES ('3', '10');
INSERT INTO `sys_role_menu` VALUES ('3', '11');
INSERT INTO `sys_role_menu` VALUES ('3', '12');
INSERT INTO `sys_role_menu` VALUES ('3', '13');
INSERT INTO `sys_role_menu` VALUES ('3', '14');
INSERT INTO `sys_role_menu` VALUES ('3', '15');
INSERT INTO `sys_role_menu` VALUES ('3', '16');
INSERT INTO `sys_role_menu` VALUES ('3', '17');
INSERT INTO `sys_role_menu` VALUES ('3', '18');
INSERT INTO `sys_role_menu` VALUES ('3', '19');
INSERT INTO `sys_role_menu` VALUES ('3', '2');
INSERT INTO `sys_role_menu` VALUES ('3', '20');
INSERT INTO `sys_role_menu` VALUES ('3', '21');
INSERT INTO `sys_role_menu` VALUES ('3', '22');
INSERT INTO `sys_role_menu` VALUES ('3', '23');
INSERT INTO `sys_role_menu` VALUES ('3', '24');
INSERT INTO `sys_role_menu` VALUES ('3', '25');
INSERT INTO `sys_role_menu` VALUES ('3', '26');
INSERT INTO `sys_role_menu` VALUES ('3', '27');
INSERT INTO `sys_role_menu` VALUES ('3', '28');
INSERT INTO `sys_role_menu` VALUES ('3', '29');
INSERT INTO `sys_role_menu` VALUES ('3', '3');
INSERT INTO `sys_role_menu` VALUES ('3', '30');
INSERT INTO `sys_role_menu` VALUES ('3', '31');
INSERT INTO `sys_role_menu` VALUES ('3', '32');
INSERT INTO `sys_role_menu` VALUES ('3', '33');
INSERT INTO `sys_role_menu` VALUES ('3', '34');
INSERT INTO `sys_role_menu` VALUES ('3', '35');
INSERT INTO `sys_role_menu` VALUES ('3', '36');
INSERT INTO `sys_role_menu` VALUES ('3', '37');
INSERT INTO `sys_role_menu` VALUES ('3', '38');
INSERT INTO `sys_role_menu` VALUES ('3', '39');
INSERT INTO `sys_role_menu` VALUES ('3', '4');
INSERT INTO `sys_role_menu` VALUES ('3', '40');
INSERT INTO `sys_role_menu` VALUES ('3', '41');
INSERT INTO `sys_role_menu` VALUES ('3', '42');
INSERT INTO `sys_role_menu` VALUES ('3', '43');
INSERT INTO `sys_role_menu` VALUES ('3', '44');
INSERT INTO `sys_role_menu` VALUES ('3', '45');
INSERT INTO `sys_role_menu` VALUES ('3', '46');
INSERT INTO `sys_role_menu` VALUES ('3', '47');
INSERT INTO `sys_role_menu` VALUES ('3', '48');
INSERT INTO `sys_role_menu` VALUES ('3', '49');
INSERT INTO `sys_role_menu` VALUES ('3', '5');
INSERT INTO `sys_role_menu` VALUES ('3', '50');
INSERT INTO `sys_role_menu` VALUES ('3', '51');
INSERT INTO `sys_role_menu` VALUES ('3', '52');
INSERT INTO `sys_role_menu` VALUES ('3', '53');
INSERT INTO `sys_role_menu` VALUES ('3', '54');
INSERT INTO `sys_role_menu` VALUES ('3', '55');
INSERT INTO `sys_role_menu` VALUES ('3', '56');
INSERT INTO `sys_role_menu` VALUES ('3', '57');
INSERT INTO `sys_role_menu` VALUES ('3', '58');
INSERT INTO `sys_role_menu` VALUES ('3', '59');
INSERT INTO `sys_role_menu` VALUES ('3', '6');
INSERT INTO `sys_role_menu` VALUES ('3', '60');
INSERT INTO `sys_role_menu` VALUES ('3', '61');
INSERT INTO `sys_role_menu` VALUES ('3', '62');
INSERT INTO `sys_role_menu` VALUES ('3', '63');
INSERT INTO `sys_role_menu` VALUES ('3', '64');
INSERT INTO `sys_role_menu` VALUES ('3', '65');
INSERT INTO `sys_role_menu` VALUES ('3', '66');
INSERT INTO `sys_role_menu` VALUES ('3', '67');
INSERT INTO `sys_role_menu` VALUES ('3', '68');
INSERT INTO `sys_role_menu` VALUES ('3', '69');
INSERT INTO `sys_role_menu` VALUES ('3', '7');
INSERT INTO `sys_role_menu` VALUES ('3', '70');
INSERT INTO `sys_role_menu` VALUES ('3', '71');
INSERT INTO `sys_role_menu` VALUES ('3', '72');
INSERT INTO `sys_role_menu` VALUES ('3', '73');
INSERT INTO `sys_role_menu` VALUES ('3', '74');
INSERT INTO `sys_role_menu` VALUES ('3', '75');
INSERT INTO `sys_role_menu` VALUES ('3', '76');
INSERT INTO `sys_role_menu` VALUES ('3', '77');
INSERT INTO `sys_role_menu` VALUES ('3', '78');
INSERT INTO `sys_role_menu` VALUES ('3', '79');
INSERT INTO `sys_role_menu` VALUES ('3', '8');
INSERT INTO `sys_role_menu` VALUES ('3', '80');
INSERT INTO `sys_role_menu` VALUES ('3', '81');
INSERT INTO `sys_role_menu` VALUES ('3', '82');
INSERT INTO `sys_role_menu` VALUES ('3', '83');
INSERT INTO `sys_role_menu` VALUES ('3', '84');
INSERT INTO `sys_role_menu` VALUES ('3', '85');
INSERT INTO `sys_role_menu` VALUES ('3', '86');
INSERT INTO `sys_role_menu` VALUES ('3', '87');
INSERT INTO `sys_role_menu` VALUES ('3', '88');
INSERT INTO `sys_role_menu` VALUES ('3', '89');
INSERT INTO `sys_role_menu` VALUES ('3', '9');
INSERT INTO `sys_role_menu` VALUES ('3', '90');
INSERT INTO `sys_role_menu` VALUES ('6', '1');
INSERT INTO `sys_role_menu` VALUES ('6', '3c92c17886944d0687e73e286cada573');
INSERT INTO `sys_role_menu` VALUES ('6', '79');
INSERT INTO `sys_role_menu` VALUES ('6', 'a89f30f6a8c1471c9f5c53cb8e36e175');

-- ----------------------------
-- Table structure for `sys_role_office`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_office`;
CREATE TABLE `sys_role_office` (
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  `office_id` varchar(64) NOT NULL COMMENT '机构编号',
  PRIMARY KEY (`role_id`,`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色-机构';

-- ----------------------------
-- Records of sys_role_office
-- ----------------------------
INSERT INTO `sys_role_office` VALUES ('7', '10');
INSERT INTO `sys_role_office` VALUES ('7', '11');
INSERT INTO `sys_role_office` VALUES ('7', '12');
INSERT INTO `sys_role_office` VALUES ('7', '13');
INSERT INTO `sys_role_office` VALUES ('7', '14');
INSERT INTO `sys_role_office` VALUES ('7', '15');
INSERT INTO `sys_role_office` VALUES ('7', '16');
INSERT INTO `sys_role_office` VALUES ('7', '17');
INSERT INTO `sys_role_office` VALUES ('7', '18');
INSERT INTO `sys_role_office` VALUES ('7', '19');
INSERT INTO `sys_role_office` VALUES ('7', '20');
INSERT INTO `sys_role_office` VALUES ('7', '21');
INSERT INTO `sys_role_office` VALUES ('7', '22');
INSERT INTO `sys_role_office` VALUES ('7', '23');
INSERT INTO `sys_role_office` VALUES ('7', '24');
INSERT INTO `sys_role_office` VALUES ('7', '25');
INSERT INTO `sys_role_office` VALUES ('7', '26');
INSERT INTO `sys_role_office` VALUES ('7', '7');
INSERT INTO `sys_role_office` VALUES ('7', '8');
INSERT INTO `sys_role_office` VALUES ('7', '9');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` varchar(64) NOT NULL COMMENT '编号',
  `company_id` varchar(64) NOT NULL COMMENT '归属公司',
  `office_id` varchar(64) NOT NULL COMMENT '归属部门',
  `login_name` varchar(100) NOT NULL COMMENT '登录名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `no` varchar(100) DEFAULT NULL COMMENT '工号',
  `name` varchar(100) NOT NULL COMMENT '姓名',
  `email` varchar(200) DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(200) DEFAULT NULL COMMENT '电话',
  `mobile` varchar(200) DEFAULT NULL COMMENT '手机',
  `user_type` char(1) DEFAULT NULL COMMENT '用户类型',
  `photo` varchar(1000) DEFAULT NULL COMMENT '用户头像',
  `login_ip` varchar(100) DEFAULT NULL COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `login_flag` varchar(64) DEFAULT NULL COMMENT '是否可登录',
  `create_by` varchar(64) NOT NULL COMMENT '创建者',
  `create_date` datetime NOT NULL COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL COMMENT '更新者',
  `update_date` datetime NOT NULL COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`),
  KEY `sys_user_office_id` (`office_id`),
  KEY `sys_user_login_name` (`login_name`),
  KEY `sys_user_company_id` (`company_id`),
  KEY `sys_user_update_date` (`update_date`),
  KEY `sys_user_del_flag` (`del_flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '1', '2', 'admin', 'admin', '0001', '系统管理员', 'gaojl@163.com', '8675', '8675', null, null, '0:0:0:0:0:0:0:1', '2018-05-02 19:08:01', '1', '1', '2013-05-27 08:00:00', '1', '2018-05-26 11:22:38', '最高管理员', '0');
INSERT INTO `sys_user` VALUES ('181abcd9d1e04e0fb4f4b310031e2f86', '1', '2', 'jialin', 'admin', '0001', '系统管理员', 'gaojl@163.com', '8675', '8675', '', null, null, null, '1', '1', '2018-05-14 11:59:21', '181abcd9d1e04e0fb4f4b310031e2f86', '2018-06-01 10:08:22', '最高管理员', '0');
INSERT INTO `sys_user` VALUES ('509e20b7d0f9447bbb6098c592b7cb28', '1', '5', 'zjl', 'admin', '0001', '系统管理员', 'gaojl@163.com', '8675', '8675', '', null, null, null, '1', '1', '2018-05-14 12:04:41', '509e20b7d0f9447bbb6098c592b7cb28', '2018-05-26 14:35:07', '最高管理员', '0');
INSERT INTO `sys_user` VALUES ('5a19d195cc47465888a6f66a8a4dfbec', '1', '3', 'ACTION20180302', '5ca1468c8b5e60162a3a02f8042456166f16f748f84193a01323914b', 'ACTION20180302', '王坤', '', '', '', '3', null, null, null, '0', '1', '2018-05-14 12:03:20', '1', '2018-05-14 12:03:20', '', '0');
INSERT INTO `sys_user` VALUES ('61df92229e4b4a57b9ef810bb2cd9e90', '1', '3', 'ACTION20180303', '853263f13da256307453130c605e122dcd231ac2345cda614a462aeb', 'ACTION20180303', '张震刚', '', '', '', '3', null, null, null, '0', '1', '2018-05-14 12:03:50', '1', '2018-05-14 12:03:50', '', '0');
INSERT INTO `sys_user` VALUES ('6b6c722ef6824ce8ad2625cfd7911603', '1', '5', 'action', 'fe71e9eeeb7c68c9fdb37000aa614a1d9a38581bab46d8f3f04d3b54', '20133748', '姚霞', '', '', '', '3', null, null, null, '1', '1', '2018-05-26 11:44:39', '1', '2018-05-26 11:44:39', '', '0');
INSERT INTO `sys_user` VALUES ('ef83ec0c592148c2991b12e6711e5911', '1', '3', 'ACTION20180306', 'c027b6f965425b5d46a566630fbeef736552095f686ab7f8c6744b04', 'ACTION20180306', '韩兆玉', '', '', '', '3', null, null, null, '0', '1', '2018-05-14 12:05:06', '1', '2018-05-14 12:05:06', '', '0');
INSERT INTO `sys_user` VALUES ('fe10556bf83e4b4eb8ad4c10c117aeba', '1', '5', 'ws', 'admin', '0001', '系统管理员', 'gaojl@163.com', '8675', '8675', '', null, null, null, '1', '1', '2018-05-14 12:04:14', 'fe10556bf83e4b4eb8ad4c10c117aeba', '2018-05-26 14:34:16', '最高管理员', '0');

-- ----------------------------
-- Table structure for `sys_user_cell`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_cell`;
CREATE TABLE `sys_user_cell` (
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '用户编号',
  `cell_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL COMMENT '工位编号',
  PRIMARY KEY (`user_id`,`cell_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of sys_user_cell
-- ----------------------------

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` varchar(64) NOT NULL COMMENT '用户编号',
  `role_id` varchar(64) NOT NULL COMMENT '角色编号',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-角色';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('1', '2');
INSERT INTO `sys_user_role` VALUES ('10', '2');
INSERT INTO `sys_user_role` VALUES ('11', '3');
INSERT INTO `sys_user_role` VALUES ('12', '4');
INSERT INTO `sys_user_role` VALUES ('13', '5');
INSERT INTO `sys_user_role` VALUES ('14', '6');
INSERT INTO `sys_user_role` VALUES ('181abcd9d1e04e0fb4f4b310031e2f86', '1');
INSERT INTO `sys_user_role` VALUES ('181abcd9d1e04e0fb4f4b310031e2f86', '2');
INSERT INTO `sys_user_role` VALUES ('181abcd9d1e04e0fb4f4b310031e2f86', '3');
INSERT INTO `sys_user_role` VALUES ('181abcd9d1e04e0fb4f4b310031e2f86', '4');
INSERT INTO `sys_user_role` VALUES ('181abcd9d1e04e0fb4f4b310031e2f86', '5');
INSERT INTO `sys_user_role` VALUES ('181abcd9d1e04e0fb4f4b310031e2f86', '6');
INSERT INTO `sys_user_role` VALUES ('2', '1');
INSERT INTO `sys_user_role` VALUES ('3', '2');
INSERT INTO `sys_user_role` VALUES ('4', '3');
INSERT INTO `sys_user_role` VALUES ('5', '4');
INSERT INTO `sys_user_role` VALUES ('5', '6');
INSERT INTO `sys_user_role` VALUES ('509e20b7d0f9447bbb6098c592b7cb28', '1');
INSERT INTO `sys_user_role` VALUES ('509e20b7d0f9447bbb6098c592b7cb28', '2');
INSERT INTO `sys_user_role` VALUES ('509e20b7d0f9447bbb6098c592b7cb28', '3');
INSERT INTO `sys_user_role` VALUES ('509e20b7d0f9447bbb6098c592b7cb28', '4');
INSERT INTO `sys_user_role` VALUES ('509e20b7d0f9447bbb6098c592b7cb28', '5');
INSERT INTO `sys_user_role` VALUES ('509e20b7d0f9447bbb6098c592b7cb28', '6');
INSERT INTO `sys_user_role` VALUES ('5a19d195cc47465888a6f66a8a4dfbec', '6');
INSERT INTO `sys_user_role` VALUES ('6', '5');
INSERT INTO `sys_user_role` VALUES ('61df92229e4b4a57b9ef810bb2cd9e90', '6');
INSERT INTO `sys_user_role` VALUES ('6b6c722ef6824ce8ad2625cfd7911603', '6');
INSERT INTO `sys_user_role` VALUES ('7', '2');
INSERT INTO `sys_user_role` VALUES ('7', '7');
INSERT INTO `sys_user_role` VALUES ('8', '2');
INSERT INTO `sys_user_role` VALUES ('9', '1');
INSERT INTO `sys_user_role` VALUES ('ef83ec0c592148c2991b12e6711e5911', '6');
INSERT INTO `sys_user_role` VALUES ('fe10556bf83e4b4eb8ad4c10c117aeba', '1');
INSERT INTO `sys_user_role` VALUES ('fe10556bf83e4b4eb8ad4c10c117aeba', '2');
INSERT INTO `sys_user_role` VALUES ('fe10556bf83e4b4eb8ad4c10c117aeba', '3');
INSERT INTO `sys_user_role` VALUES ('fe10556bf83e4b4eb8ad4c10c117aeba', '4');
INSERT INTO `sys_user_role` VALUES ('fe10556bf83e4b4eb8ad4c10c117aeba', '5');
INSERT INTO `sys_user_role` VALUES ('fe10556bf83e4b4eb8ad4c10c117aeba', '6');

-- ----------------------------
-- Table structure for `tec_flow`
-- ----------------------------
DROP TABLE IF EXISTS `tec_flow`;
CREATE TABLE `tec_flow` (
  `id` varchar(64) NOT NULL,
  `flowCode` varchar(64) NOT NULL DEFAULT '' COMMENT '流程编号',
  `version` varchar(64) NOT NULL DEFAULT '' COMMENT '版本',
  `flowName` varchar(64) NOT NULL DEFAULT '' COMMENT '流程名称',
  `flowDesc` varchar(255) NOT NULL DEFAULT '0' COMMENT '描述',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新着',
  `update_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工艺路由维护（流程）';

-- ----------------------------
-- Records of tec_flow
-- ----------------------------
INSERT INTO `tec_flow` VALUES ('7a438722f41a4ce6846d2ea6af086aca', '003', 'V 0.2', '马哈鱼挑刺', '马哈鱼挑刺流程', '1', '2018-05-26 16:56:43', '1', '2018-05-26 16:56:55', null, '0');
INSERT INTO `tec_flow` VALUES ('a190c9f9c57e43f89f7cf4d37b69e6ca', '002', 'V 0.2', '鱿鱼丝烘烤', '金枪鱼烘烤流程', '1', '2018-05-23 10:53:44', '1', '2018-05-26 16:56:03', null, '0');
INSERT INTO `tec_flow` VALUES ('d61e6be69be848979fcd6941a6227d0c', '001', 'V 0.1', '金枪鱼加工', '金枪鱼去头流程', '1', '2018-05-19 14:28:32', '1', '2018-05-26 17:38:22', null, '0');

-- ----------------------------
-- Table structure for `tec_flow_process`
-- ----------------------------
DROP TABLE IF EXISTS `tec_flow_process`;
CREATE TABLE `tec_flow_process` (
  `id` varchar(64) NOT NULL,
  `flow_id` varchar(64) NOT NULL DEFAULT '' COMMENT '流程ID',
  `pro_id` varchar(64) NOT NULL DEFAULT '' COMMENT '工序ID',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序号',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新着',
  `update_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工艺路由与工序关系';

-- ----------------------------
-- Records of tec_flow_process
-- ----------------------------
INSERT INTO `tec_flow_process` VALUES ('27518bd914c445ceaf32cb1837ed2df6', '7a438722f41a4ce6846d2ea6af086aca', '953719098b464d9699ff0258786bd058', '1', '1', '2018-05-24 17:36:23', '1', '2018-05-26 16:57:48', null, '0');
INSERT INTO `tec_flow_process` VALUES ('a0189463b1d243e8a5e82f908a949fd9', 'd61e6be69be848979fcd6941a6227d0c', 'a2ca4fff0f844f09848a33d80f151b1c', '3', '1', '2018-05-23 10:53:24', '1', '2018-05-26 15:49:22', null, '0');
INSERT INTO `tec_flow_process` VALUES ('c12111a355af41078faa2af85cf920bb', 'a190c9f9c57e43f89f7cf4d37b69e6ca', 'a2ca4fff0f844f09848a33d80f151b1c', '2', '1', '2018-05-23 10:53:52', '1', '2018-05-26 15:49:17', null, '0');
INSERT INTO `tec_flow_process` VALUES ('d0c09c1844494fdd97b08eccd52380a8', 'd61e6be69be848979fcd6941a6227d0c', '8112b7c264604d5bbf6b0f0e3af5651a', '4', '1', '2018-05-23 10:53:11', '1', '2018-05-26 17:38:43', null, '0');

-- ----------------------------
-- Table structure for `tec_process`
-- ----------------------------
DROP TABLE IF EXISTS `tec_process`;
CREATE TABLE `tec_process` (
  `id` varchar(64) NOT NULL,
  `proCode` varchar(64) NOT NULL DEFAULT '' COMMENT '工序编号',
  `proName` varchar(64) NOT NULL DEFAULT '' COMMENT '工序名称',
  `proDesc` varchar(255) NOT NULL DEFAULT '0' COMMENT '描述',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新着',
  `update_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工艺基础数据维护（工序）';

-- ----------------------------
-- Records of tec_process
-- ----------------------------
INSERT INTO `tec_process` VALUES ('8112b7c264604d5bbf6b0f0e3af5651a', '002', '切片工序', '金龙鱼切片', '1', '2018-05-19 13:48:13', '1', '2018-05-26 17:38:07', null, '0');
INSERT INTO `tec_process` VALUES ('953719098b464d9699ff0258786bd058', '003', '挑刺工序', '马哈鱼挑刺', '1', '2018-05-26 16:55:20', '1', '2018-05-26 16:55:35', null, '0');
INSERT INTO `tec_process` VALUES ('a2ca4fff0f844f09848a33d80f151b1c', '001', '烘烤工序', '鱿鱼丝烘烤', '1', '2018-05-19 13:45:06', '1', '2018-05-26 15:46:59', null, '0');
INSERT INTO `tec_process` VALUES ('c5df22578c3246a499bfdc23be0d35d9', '004', '去头工序', '金枪鱼去头', '1', '2018-05-26 17:37:55', '1', '2018-05-26 17:37:55', null, '0');

-- ----------------------------
-- Table structure for `tec_process_station`
-- ----------------------------
DROP TABLE IF EXISTS `tec_process_station`;
CREATE TABLE `tec_process_station` (
  `id` varchar(64) NOT NULL,
  `pro_id` varchar(64) NOT NULL DEFAULT '' COMMENT '工序ID',
  `station_id` varchar(64) NOT NULL DEFAULT '' COMMENT '工站编号',
  `line_id` varchar(64) NOT NULL DEFAULT '' COMMENT '产线编号',
  `create_by` varchar(64) NOT NULL DEFAULT '' COMMENT '创建者',
  `create_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '创建时间',
  `update_by` varchar(64) NOT NULL DEFAULT '' COMMENT '更新着',
  `update_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '更新时间',
  `remarks` varchar(255) DEFAULT '' COMMENT '备注信息',
  `del_flag` char(1) NOT NULL DEFAULT '0' COMMENT '删除标记',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工序与工站关系';

-- ----------------------------
-- Records of tec_process_station
-- ----------------------------
INSERT INTO `tec_process_station` VALUES ('1178e17b669f4f169012ab8e53e8e93e', 'a2ca4fff0f844f09848a33d80f151b1c', 'b704ea7d3af84b9a94a8481891b6526c', '50bab7e0a126485cb062534590e05038', '1', '2018-05-23 13:54:07', '1', '2018-05-26 17:02:04', null, '0');
INSERT INTO `tec_process_station` VALUES ('856b1486ef4649acb76f4109166993ec', 'c5df22578c3246a499bfdc23be0d35d9', '7e1c273df5334c648142e72f0045876b', '794abde5a457437f812eecf712c17578', '1', '2018-05-26 17:46:20', '1', '2018-05-26 17:46:30', null, '0');
INSERT INTO `tec_process_station` VALUES ('8bf15c5db1a84ab39574a69f7a68de0c', '8112b7c264604d5bbf6b0f0e3af5651a', '63688c609f824834bf0abca0171bc8a7', 'd3b5488ffa5d4d48ad73d45d4a0229a5', '1', '2018-05-23 13:54:27', '1', '2018-05-26 17:00:28', null, '0');
INSERT INTO `tec_process_station` VALUES ('d35f58a92992435da4f990768d8a36b1', '953719098b464d9699ff0258786bd058', '8021d772bf09424f9dc51674ab419431', '689b1cde6dd243538c735e08b954acda', '1', '2018-05-26 17:03:34', '1', '2018-05-26 17:03:34', null, '0');
