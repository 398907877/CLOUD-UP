/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50624
Source Host           : localhost:3306
Source Database       : bet

Target Server Type    : MYSQL
Target Server Version : 50624
File Encoding         : 65001

Date: 2016-12-22 13:54:22
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for t_phase_analyse
-- ----------------------------
DROP TABLE IF EXISTS `t_phase_analyse`;
CREATE TABLE `t_phase_analyse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phase` int(12) DEFAULT NULL,
  `opentime` datetime DEFAULT NULL,
  `ranking1` varchar(4) DEFAULT NULL,
  `ranking2` varchar(4) DEFAULT NULL,
  `ranking3` varchar(4) DEFAULT NULL,
  `ranking4` varchar(4) DEFAULT NULL,
  `ranking5` varchar(4) DEFAULT NULL,
  `ranking6` varchar(4) DEFAULT NULL,
  `ranking7` varchar(4) DEFAULT NULL,
  `ranking8` varchar(4) DEFAULT NULL,
  `ranking9` varchar(4) DEFAULT NULL,
  `ranking10` varchar(4) DEFAULT NULL,
  `top2` varchar(4) DEFAULT NULL COMMENT '冠亚和',
  `top2d` varchar(4) DEFAULT NULL COMMENT '单双',
  `top2b` varchar(4) DEFAULT NULL COMMENT '大小',
  `ranking1lh` varchar(4) DEFAULT NULL,
  `ranking2lh` varchar(4) DEFAULT NULL,
  `ranking3lh` varchar(4) DEFAULT NULL,
  `ranking4lh` varchar(4) DEFAULT NULL,
  `ranking5lh` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_phase_analyse
-- ----------------------------
INSERT INTO `t_phase_analyse` VALUES ('1', '593418', '2016-12-22 12:57:30', '05', '07', '09', '01', '10', '04', '08', '06', '03', '02', '12', '双', '大', '龙', '龙', '龙', '虎', '龙');
INSERT INTO `t_phase_analyse` VALUES ('2', '593419', '2016-12-22 13:02:30', '10', '3', '4', '2', '9', '8', '1', '6', '5', '7', '13', '单', '大', '龙', '虎', '虎', '龙', '龙');
INSERT INTO `t_phase_analyse` VALUES ('3', '593424', '2016-12-22 13:27:30', '1', '10', '4', '8', '7', '2', '5', '9', '6', '3', '11', '单', '小', '虎', '龙', '虎', '龙', '龙');
INSERT INTO `t_phase_analyse` VALUES ('4', '593425', '2016-12-22 13:32:30', '3', '2', '8', '10', '4', '6', '1', '5', '7', '9', '5', '单', '小', '虎', '虎', '龙', '龙', '虎');
INSERT INTO `t_phase_analyse` VALUES ('5', '593426', '2016-12-22 13:37:30', '3', '2', '4', '8', '9', '1', '10', '7', '6', '5', '5', '单', '小', '虎', '虎', '虎', '虎', '龙');
INSERT INTO `t_phase_analyse` VALUES ('6', '593427', '2016-12-22 13:42:30', '7', '6', '5', '4', '9', '3', '2', '8', '10', '1', '13', '单', '大', '龙', '虎', '虎', '龙', '龙');
INSERT INTO `t_phase_analyse` VALUES ('7', '593428', '2016-12-22 13:47:30', '8', '5', '10', '3', '4', '7', '6', '9', '1', '2', '13', '单', '大', '龙', '龙', '龙', '虎', '虎');

-- ----------------------------
-- Table structure for t_s_type
-- ----------------------------
DROP TABLE IF EXISTS `t_s_type`;
CREATE TABLE `t_s_type` (
  `ID` varchar(32) NOT NULL,
  `typecode` varchar(50) DEFAULT NULL,
  `typename` varchar(50) DEFAULT NULL,
  `typepid` varchar(32) DEFAULT NULL,
  `typegroupid` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_nw2b22gy7plh7pqows186odmq` (`typepid`),
  KEY `FK_3q40mr4ebtd0cvx79matl39x1` (`typegroupid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_type
-- ----------------------------
INSERT INTO `t_s_type` VALUES ('297e201047e95ee30147e9baab5c000b', '1', 'common.company', null, '297e201047e95ee30147e9ba56ce0009');
INSERT INTO `t_s_type` VALUES ('297e201047e95ee30147e9baef97000d', '2', 'common.department', null, '297e201047e95ee30147e9ba56ce0009');
INSERT INTO `t_s_type` VALUES ('297e201047e95ee30147e9bb1210000f', '3', 'common.position', null, '297e201047e95ee30147e9ba56ce0009');
INSERT INTO `t_s_type` VALUES ('2c90ac564c9d1734014c9db1e025002d', 'Y', '是', null, '2c90ac564c9d1734014c9db1a167002b');
INSERT INTO `t_s_type` VALUES ('2c90ac564c9d1734014c9db20b0d002f', 'N', '否', null, '2c90ac564c9d1734014c9db1a167002b');
INSERT INTO `t_s_type` VALUES ('402880884883eff4014884180bf80029', '1', '蔷薇七村', null, '402880884883eff401488415cbb60027');
INSERT INTO `t_s_type` VALUES ('402880cd4dbd4baa014dbd9c184f0003', 'WXTP', '图片', null, 'jglongjbtstypegourp2015060400001');
INSERT INTO `t_s_type` VALUES ('402881a151f1af7c0151f1bb1b520004', 'cigong', '辞工', null, '402881a151f1af7c0151f1b9d7f50002');
INSERT INTO `t_s_type` VALUES ('402881a151f1af7c0151f1bc55b10006', 'jicigong', '急辞工', null, '402881a151f1af7c0151f1b9d7f50002');
INSERT INTO `t_s_type` VALUES ('402881a151f1af7c0151f1bca0680008', 'citui', '辞退', null, '402881a151f1af7c0151f1b9d7f50002');
INSERT INTO `t_s_type` VALUES ('402881a151f1af7c0151f1bcbf62000a', 'kaichu', '开除', null, '402881a151f1af7c0151f1b9d7f50002');
INSERT INTO `t_s_type` VALUES ('402881a151f1af7c0151f1bce839000c', 'zidonglizhi', '自动离职', null, '402881a151f1af7c0151f1b9d7f50002');
INSERT INTO `t_s_type` VALUES ('402881e44df713f5014df73ef09a003d', 'table', 'form.db.type.table', null, '402881e44df713f5014df738349c002f');
INSERT INTO `t_s_type` VALUES ('402881e44df713f5014df73f1436003f', 'sql', 'form.db.type.sql', null, '402881e44df713f5014df738349c002f');
INSERT INTO `t_s_type` VALUES ('402881e44df713f5014df73f3f830041', 'clazz', 'form.db.type.clazz', null, '402881e44df713f5014df738349c002f');
INSERT INTO `t_s_type` VALUES ('402881e54dcb624a014dcbf65e5a0010', 'bdfl_ptbd', '普通表单', null, '402881e54dcb624a014dcbf4912b000e');
INSERT INTO `t_s_type` VALUES ('402881e54dcb624a014dcbf6a4620012', 'bdfl_fzbd', '复杂表单', null, '402881e54dcb624a014dcbf4912b000e');
INSERT INTO `t_s_type` VALUES ('402881e54dce16ba014dce17990c0001', 'bdfl_vipbd', 'VIP表单', null, '402881e54dcb624a014dcbf4912b000e');
INSERT INTO `t_s_type` VALUES ('402881e64ca6fd1b014ca7052d930006', 'spline', '曲线图', null, '402881e64ca6fd1b014ca7044c370004');
INSERT INTO `t_s_type` VALUES ('402881e64ca6fd1b014ca705b2b40008', 'column', '柱状图', null, '402881e64ca6fd1b014ca7044c370004');
INSERT INTO `t_s_type` VALUES ('402881e64ca6fd1b014ca7061fb7000a', 'pie', '饼图', null, '402881e64ca6fd1b014ca7044c370004');
INSERT INTO `t_s_type` VALUES ('402881e946e71f5f0146e736c4e80008', 'en', 'common.english', null, '402881e946e71f5f0146e73619bb0002');
INSERT INTO `t_s_type` VALUES ('402881e946e71f5f0146e740dcad0012', 'zh-cn', 'common.chinese', null, '402881e946e71f5f0146e73619bb0002');
INSERT INTO `t_s_type` VALUES ('4028838850c35b6a0150c372e3b10005', '*', '非空', null, '4028838850c35b6a0150c37251e00002');
INSERT INTO `t_s_type` VALUES ('4028838850c35b6a0150c3abef800019', 'n', '数字', null, '4028838850c35b6a0150c37251e00002');
INSERT INTO `t_s_type` VALUES ('4028838850c35b6a0150c3ac17f9001b', 's', '字母', null, '4028838850c35b6a0150c37251e00002');
INSERT INTO `t_s_type` VALUES ('4028838850d2666a0150d267a61e0001', 'p', '邮政编码', null, '4028838850c35b6a0150c37251e00002');
INSERT INTO `t_s_type` VALUES ('4028838850d2666a0150d267d5c10003', 'm', '手机号码', null, '4028838850c35b6a0150c37251e00002');
INSERT INTO `t_s_type` VALUES ('4028838850d2666a0150d26812d40005', 'e', '电子邮件', null, '4028838850c35b6a0150c37251e00002');
INSERT INTO `t_s_type` VALUES ('4028838850d2666a0150d26850210007', 'url', '网址', null, '4028838850c35b6a0150c37251e00002');
INSERT INTO `t_s_type` VALUES ('4028838850d2666a0150d268ae510009', '*6-16', '6到16位任意字符', null, '4028838850c35b6a0150c37251e00002');
INSERT INTO `t_s_type` VALUES ('4028838850d2666a0150d268e229000b', 'n6-16', '6到16位数字', null, '4028838850c35b6a0150c37251e00002');
INSERT INTO `t_s_type` VALUES ('4028838850d2666a0150d26912e2000d', 's6-18', '6到18位字符串', null, '4028838850c35b6a0150c37251e00002');
INSERT INTO `t_s_type` VALUES ('4028b881533ac16a01533adf65370003', 'Pie2D', '2D饼图', null, '4028b881533ac16a01533adb50460001');
INSERT INTO `t_s_type` VALUES ('4028b881533ac16a01533ae0363d0005', 'Pie3D', '3D饼图', null, '4028b881533ac16a01533adb50460001');
INSERT INTO `t_s_type` VALUES ('4028b881533ac16a01533ae2d2a50007', 'Column2D', '2D柱状图', null, '4028b881533ac16a01533adb50460001');
INSERT INTO `t_s_type` VALUES ('4028b881533ac16a01533ae305340009', 'Column3D', '3D柱状图', null, '4028b881533ac16a01533adb50460001');
INSERT INTO `t_s_type` VALUES ('4028b881533ac16a01533ae45759000b', 'Bar2D', '条状图', null, '4028b881533ac16a01533adb50460001');
INSERT INTO `t_s_type` VALUES ('4028b881533ac16a01533ae4c6de000d', 'Area2D', '面积图', null, '4028b881533ac16a01533adb50460001');
INSERT INTO `t_s_type` VALUES ('4028b881533ac16a01533ae50a67000f', 'LineBasic2D', '折线图', null, '4028b881533ac16a01533adb50460001');
INSERT INTO `t_s_type` VALUES ('8a1c7ee54e3e2ca9014e3e520bdc0010', 'spring', 'java.enhance.type.spring', null, '8a1c7ee54e3e2ca9014e3e4b78f90009');
INSERT INTO `t_s_type` VALUES ('8a1c7ee54e3e2ca9014e3e524b560012', 'class', 'java.enhance.type.class', null, '8a1c7ee54e3e2ca9014e3e4b78f90009');
INSERT INTO `t_s_type` VALUES ('8a71b40e4a38319b014a3859a2c1001a', '1', 'common.smsAlertsModel', null, '8a71b40e4a38319b014a3858fca40018');
INSERT INTO `t_s_type` VALUES ('8a71b40e4a38319b014a385a01d1001c', '2', 'common.emailAlertsModel', null, '8a71b40e4a38319b014a3858fca40018');
INSERT INTO `t_s_type` VALUES ('8a71b40e4a38319b014a385d30300020', '1', 'common.smsAlerts', null, '8a71b40e4a38319b014a385cb115001e');
INSERT INTO `t_s_type` VALUES ('8a71b40e4a38319b014a385d86c30022', '2', 'common.emailAlerts', null, '8a71b40e4a38319b014a385cb115001e');
INSERT INTO `t_s_type` VALUES ('8a71b40e4a38319b014a385dc1370024', '3', 'common.sysAlerts', null, '8a71b40e4a38319b014a385cb115001e');
INSERT INTO `t_s_type` VALUES ('8a71b40e4a38319b014a3860603f0028', '1', 'common.didNotSend', null, '8a71b40e4a38319b014a386022bd0026');
INSERT INTO `t_s_type` VALUES ('8a71b40e4a38319b014a38608d98002a', '2', 'common.sendSuccess', null, '8a71b40e4a38319b014a386022bd0026');
INSERT INTO `t_s_type` VALUES ('8a71b40e4a38319b014a3860b181002c', '3', 'common.failToSend', null, '8a71b40e4a38319b014a386022bd0026');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8181f30060', '2', 'menu.icon', null, '8a8ab0b246dc81120146dc8181aa0056');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8181f70061', '1', 'system.icon', null, '8a8ab0b246dc81120146dc8181aa0056');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8181fa0062', 'files', 'common.attachment', null, '8a8ab0b246dc81120146dc8181ca005e');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8181fe0063', '1', 'lang.excellent.order', null, '8a8ab0b246dc81120146dc8181b10057');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182010064', '2', 'lang.normal.order', null, '8a8ab0b246dc81120146dc8181b10057');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182050065', '1', 'lang.contract.customer', null, '8a8ab0b246dc81120146dc8181b50058');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182080066', '2', 'lang.normal.customer', null, '8a8ab0b246dc81120146dc8181b50058');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc81820b0067', '1', 'lang.special.servcie', null, '8a8ab0b246dc81120146dc8181b90059');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182100068', '2', 'lang.normal.service', null, '8a8ab0b246dc81120146dc8181b90059');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182130069', 'single', 'common.single.condition.query', null, '8a8ab0b246dc81120146dc8181bc005a');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc818216006a', 'group', 'common.scope.query', null, '8a8ab0b246dc81120146dc8181bc005a');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc81821a006b', 'Y', 'common.yes', null, '8a8ab0b246dc81120146dc8181c0005b');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc81821d006c', 'N', 'common.no', null, '8a8ab0b246dc81120146dc8181c0005b');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc818221006d', 'Integer', 'common.db.integer', null, '8a8ab0b246dc81120146dc8181c3005c');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc818224006e', 'Date', 'common.db.date', null, '8a8ab0b246dc81120146dc8181c3005c');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc818227006f', 'String', 'common.db.string', null, '8a8ab0b246dc81120146dc8181c3005c');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc81822b0070', 'Long', 'common.db.long', null, '8a8ab0b246dc81120146dc8181c3005c');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc81822f0071', 'act', 'common.workflow.engine.table', null, '8a8ab0b246dc81120146dc8181c6005d');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182320072', 't_s', 'common.system.table', null, '8a8ab0b246dc81120146dc8181c6005d');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182350073', 't_b', 'common.business.table', null, '8a8ab0b246dc81120146dc8181c6005d');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182390074', 't_p', 'common.customer.engine.table', null, '8a8ab0b246dc81120146dc8181c6005d');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc81823c0075', 'news', 'common.news', null, '8a8ab0b246dc81120146dc8181ca005e');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182400076', '0', 'common.male', null, '8a8ab0b246dc81120146dc8181cd005f');
INSERT INTO `t_s_type` VALUES ('8a8ab0b246dc81120146dc8182430077', '1', 'common.female', null, '8a8ab0b246dc81120146dc8181cd005f');
INSERT INTO `t_s_type` VALUES ('8a8ab0ba487c527201487c7863ec001b', 'oracle', 'common.oracle', null, '8a8ab0ba487c527201487c7732790019');
INSERT INTO `t_s_type` VALUES ('8a8ab0ba487c527201487c78aefc001d', 'sqlserver2008', 'common.sqlserver2008', null, '8a8ab0ba487c527201487c7732790019');
INSERT INTO `t_s_type` VALUES ('8a8ab0ba487c527201487c78fbb5001f', 'mysql', 'common.mysql', null, '8a8ab0ba487c527201487c7732790019');
INSERT INTO `t_s_type` VALUES ('f852d85d47ed64a40147ed71f6b40005', '>', '大于', null, 'f852d85d47ed64a40147ed70894c0003');
INSERT INTO `t_s_type` VALUES ('f852d85d47ed64a40147ed72a9dc0007', '>=', '大于等于', null, 'f852d85d47ed64a40147ed70894c0003');
INSERT INTO `t_s_type` VALUES ('f852d85d47ed64a40147ed750e1c0009', '<', '小于', null, 'f852d85d47ed64a40147ed70894c0003');
INSERT INTO `t_s_type` VALUES ('f852d85d47ed64a40147ed753b6f000b', '<=', '小于等于', null, 'f852d85d47ed64a40147ed70894c0003');
INSERT INTO `t_s_type` VALUES ('f852d85d47ed64a40147ed75afe5000d', '=', '等于', null, 'f852d85d47ed64a40147ed70894c0003');
INSERT INTO `t_s_type` VALUES ('f852d85d47ed64a40147ed75ed62000f', 'IN', '包含', null, 'f852d85d47ed64a40147ed70894c0003');
INSERT INTO `t_s_type` VALUES ('f852d85d47ed64a40147ed7638b20011', 'LIKE', '模糊', null, 'f852d85d47ed64a40147ed70894c0003');
INSERT INTO `t_s_type` VALUES ('f852d85d47ed64a40147ed767c240013', '!=', '不等于', null, 'f852d85d47ed64a40147ed70894c0003');
INSERT INTO `t_s_type` VALUES ('ff80808151399d0d015139b0e0b80003', 'hour', '小时', null, '4028ab8c5134f1ed0151350f08d90003');
INSERT INTO `t_s_type` VALUES ('ff80808151399d0d015139b1609d0006', 'day', '天', null, '4028ab8c5134f1ed0151350f08d90003');
INSERT INTO `t_s_type` VALUES ('ff80808151399d0d015139b283a10008', 'perday', '天/人', null, '4028ab8c5134f1ed0151350f08d90003');
INSERT INTO `t_s_type` VALUES ('ff80808151399d0d015139b29550000a', 'permoney', '元/人', null, '4028ab8c5134f1ed0151350f08d90003');
INSERT INTO `t_s_type` VALUES ('ff80808151399d0d015139b2a6e5000c', 'money', '元', null, '4028ab8c5134f1ed0151350f08d90003');
INSERT INTO `t_s_type` VALUES ('ff80808151399d0d015139b2bab4000e', 'age', '岁', null, '4028ab8c5134f1ed0151350f08d90003');
INSERT INTO `t_s_type` VALUES ('ff80808151399d0d015139b2c9ce0010', 'class', '课时', null, '4028ab8c5134f1ed0151350f08d90003');
INSERT INTO `t_s_type` VALUES ('jglongjbtstype201506041030000001', 'WXGZYD', '关注引导', null, 'jglongjbtstypegourp2015060400001');
INSERT INTO `t_s_type` VALUES ('jglongjbtstype201506041030000002', 'WXNRQ', '内容区', null, 'jglongjbtstypegourp2015060400001');
INSERT INTO `t_s_type` VALUES ('jglongjbtstype201506041030000003', 'WXYWYD', '原文引导', null, 'jglongjbtstypegourp2015060400001');
INSERT INTO `t_s_type` VALUES ('jglongjbtstype201506041030000004', 'WXBT', '标题', null, 'jglongjbtstypegourp2015060400001');
INSERT INTO `t_s_type` VALUES ('jglongjbtstype201506041030000005', 'WXFGX', '分隔线', null, 'jglongjbtstypegourp2015060400001');
INSERT INTO `t_s_type` VALUES ('jglongjbtstype201506041030000006', 'WXHTZH', '互推账号', null, 'jglongjbtstypegourp2015060400001');
INSERT INTO `t_s_type` VALUES ('jglongjbtstype201506041030000007', 'WXQT', '其他', null, 'jglongjbtstypegourp2015060400001');
INSERT INTO `t_s_type` VALUES ('jglongjbtstype201506041030000008', 'WXWDYS', '我的样式', null, 'jglongjbtstypegourp2015060400001');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c4d585d0004', '1', '9.7', null, '102881eb591c41c301591c4a79b80009');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c4d585d0001', '2', '9.7', null, '102881eb591c41c301591c4a79b80009');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c4d585d0002', '3', '9.7', null, '102881eb591c41c301591c4a79b80009');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c4d585d0003', '4', '9.7', null, '102881eb591c41c301591c4a79b80009');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c4d585d0005', '5', '9.7', null, '102881eb591c41c301591c4a79b80009');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c4d585d0006', '6', '9.7', null, '102881eb591c41c301591c4a79b80009');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c4d585d0007', '7', '9.7', null, '102881eb591c41c301591c4a79b80009');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c4d585d0008', '8', '9.7', null, '102881eb591c41c301591c4a79b80009');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c4d585d0009', '9', '9.7', null, '102881eb591c41c301591c4a79b80009');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c4d585d0010', '10', '9.7', null, '102881eb591c41c301591c4a79b80009');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c4d585d001', '1', '9.7', null, '202881eb591c41c301591c4a79b80008');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c4d585d002', '2', '9.7', null, '202881eb591c41c301591c4a79b80008');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c4d585d003', '3', '9.7', null, '202881eb591c41c301591c4a79b80008');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c4d585d004', '4', '9.7', null, '202881eb591c41c301591c4a79b80008');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c4d585d005', '5', '9.7', null, '202881eb591c41c301591c4a79b80008');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c4d585d006', '6', '9.7', null, '202881eb591c41c301591c4a79b80008');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c4d585d007', '7', '9.7', null, '202881eb591c41c301591c4a79b80008');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c4d585d008', '8', '9.7', null, '202881eb591c41c301591c4a79b80008');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c4d585d009', '9', '9.7', null, '202881eb591c41c301591c4a79b80008');
INSERT INTO `t_s_type` VALUES ('402883eb591c41c301591c4d585d0010', '10', '9.7', null, '202881eb591c41c301591c4a79b80008');
INSERT INTO `t_s_type` VALUES ('302881eb591c41c301591c4d585d001', '1', '9.7', null, '302881eb591c41c301591c4a79b80007');
INSERT INTO `t_s_type` VALUES ('302881eb591c41c301591c4d585d002', '2', '9.7', null, '302881eb591c41c301591c4a79b80007');
INSERT INTO `t_s_type` VALUES ('302881eb591c41c301591c4d585d003', '3', '9.7', null, '302881eb591c41c301591c4a79b80007');
INSERT INTO `t_s_type` VALUES ('302881eb591c41c301591c4d585d004', '4', '9.7', null, '302881eb591c41c301591c4a79b80007');
INSERT INTO `t_s_type` VALUES ('302881eb591c41c301591c4d585d005', '5', '9.7', null, '302881eb591c41c301591c4a79b80007');
INSERT INTO `t_s_type` VALUES ('302881eb591c41c301591c4d585d006', '6', '9.7', null, '302881eb591c41c301591c4a79b80007');
INSERT INTO `t_s_type` VALUES ('302881eb591c41c301591c4d585d007', '7', '9.7', null, '302881eb591c41c301591c4a79b80007');
INSERT INTO `t_s_type` VALUES ('302881eb591c41c301591c4d585d008', '8', '9.7', null, '302881eb591c41c301591c4a79b80007');
INSERT INTO `t_s_type` VALUES ('302881eb591c41c301591c4d585d009', '9', '9.7', null, '302881eb591c41c301591c4a79b80007');
INSERT INTO `t_s_type` VALUES ('302883eb591c41c301591c4d585d0010', '10', '9.7', null, '302881eb591c41c301591c4a79b80007');
INSERT INTO `t_s_type` VALUES ('202881eb591c41c301591c4d585d001', '1', '9.7', null, '402881eb591c41c301591c4a79b80006');
INSERT INTO `t_s_type` VALUES ('202881eb591c41c301591c4d585d002', '2', '9.7', null, '402881eb591c41c301591c4a79b80006');
INSERT INTO `t_s_type` VALUES ('202881eb591c41c301591c4d585d003', '3', '9.7', null, '402881eb591c41c301591c4a79b80006');
INSERT INTO `t_s_type` VALUES ('202881eb591c41c301591c4d585d004', '4', '9.7', null, '402881eb591c41c301591c4a79b80006');
INSERT INTO `t_s_type` VALUES ('202881eb591c41c301591c4d585d005', '5', '9.7', null, '402881eb591c41c301591c4a79b80006');
INSERT INTO `t_s_type` VALUES ('202881eb591c41c301591c4d585d006', '6', '9.7', null, '402881eb591c41c301591c4a79b80006');
INSERT INTO `t_s_type` VALUES ('202881eb591c41c301591c4d585d007', '7', '9.7', null, '402881eb591c41c301591c4a79b80006');
INSERT INTO `t_s_type` VALUES ('202881eb591c41c301591c4d585d008', '8', '9.7', null, '402881eb591c41c301591c4a79b80006');
INSERT INTO `t_s_type` VALUES ('202881eb591c41c301591c4d585d009', '9', '9.7', null, '402881eb591c41c301591c4a79b80006');
INSERT INTO `t_s_type` VALUES ('202881eb591c41c301591c4d585d0010', '10', '9.7', null, '402881eb591c41c301591c4a79b80006');
INSERT INTO `t_s_type` VALUES ('502881eb591c41c301591c4d585d001', '1', '9.7', null, '502881eb591c41c301591c4a79b80005');
INSERT INTO `t_s_type` VALUES ('502881eb591c41c301591c4d585d002', '2', '9.7', null, '502881eb591c41c301591c4a79b80005');
INSERT INTO `t_s_type` VALUES ('502881eb591c41c301591c4d585d003', '3', '9.7', null, '502881eb591c41c301591c4a79b80005');
INSERT INTO `t_s_type` VALUES ('502881eb591c41c301591c4d585d004', '4', '9.7', null, '502881eb591c41c301591c4a79b80005');
INSERT INTO `t_s_type` VALUES ('502881eb591c41c301591c4d585d005', '5', '9.7', null, '502881eb591c41c301591c4a79b80005');
INSERT INTO `t_s_type` VALUES ('502881eb591c41c301591c4d585d006', '6', '9.7', null, '502881eb591c41c301591c4a79b80005');
INSERT INTO `t_s_type` VALUES ('502881eb591c41c301591c4d585d007', '7', '9.7', null, '502881eb591c41c301591c4a79b80005');
INSERT INTO `t_s_type` VALUES ('502881eb591c41c301591c4d585d008', '8', '9.7', null, '502881eb591c41c301591c4a79b80005');
INSERT INTO `t_s_type` VALUES ('502881eb591c41c301591c4d585d009', '9', '9.7', null, '502881eb591c41c301591c4a79b80005');
INSERT INTO `t_s_type` VALUES ('502881eb591c41c301591c4d585d0010', '10', '9.7', null, '502881eb591c41c301591c4a79b80005');
INSERT INTO `t_s_type` VALUES ('602881eb591c41c301591c4d585d001', '1', '9.7', null, '602881eb591c41c301591c4a79b80004');
INSERT INTO `t_s_type` VALUES ('602881eb591c41c301591c4d585d002', '2', '9.7', null, '602881eb591c41c301591c4a79b80004');
INSERT INTO `t_s_type` VALUES ('602881eb591c41c301591c4d585d003', '3', '9.7', null, '602881eb591c41c301591c4a79b80004');
INSERT INTO `t_s_type` VALUES ('602881eb591c41c301591c4d585d004', '4', '9.7', null, '602881eb591c41c301591c4a79b80004');
INSERT INTO `t_s_type` VALUES ('602881eb591c41c301591c4d585d005', '5', '9.7', null, '602881eb591c41c301591c4a79b80004');
INSERT INTO `t_s_type` VALUES ('602881eb591c41c301591c4d585d006', '6', '9.7', null, '602881eb591c41c301591c4a79b80004');
INSERT INTO `t_s_type` VALUES ('602881eb591c41c301591c4d585d007', '7', '9.7', null, '602881eb591c41c301591c4a79b80004');
INSERT INTO `t_s_type` VALUES ('602881eb591c41c301591c4d585d008', '8', '9.7', null, '602881eb591c41c301591c4a79b80004');
INSERT INTO `t_s_type` VALUES ('602881eb591c41c301591c4d585d009', '9', '9.7', null, '602881eb591c41c301591c4a79b80004');
INSERT INTO `t_s_type` VALUES ('602881eb591c41c301591c4d585d0010', '10', '9.7', null, '602881eb591c41c301591c4a79b80004');
INSERT INTO `t_s_type` VALUES ('702881eb591c41c301591c4d585d001', '1', '9.7', null, '702881eb591c41c301591c4a79b80003');
INSERT INTO `t_s_type` VALUES ('702881eb591c41c301591c4d585d002', '2', '9.7', null, '702881eb591c41c301591c4a79b80003');
INSERT INTO `t_s_type` VALUES ('702881eb591c41c301591c4d585d003', '3', '9.7', null, '702881eb591c41c301591c4a79b80003');
INSERT INTO `t_s_type` VALUES ('702881eb591c41c301591c4d585d004', '4', '9.7', null, '702881eb591c41c301591c4a79b80003');
INSERT INTO `t_s_type` VALUES ('702881eb591c41c301591c4d585d005', '5', '9.7', null, '702881eb591c41c301591c4a79b80003');
INSERT INTO `t_s_type` VALUES ('702881eb591c41c301591c4d585d006', '6', '9.7', null, '702881eb591c41c301591c4a79b80003');
INSERT INTO `t_s_type` VALUES ('702881eb591c41c301591c4d585d007', '7', '9.7', null, '702881eb591c41c301591c4a79b80003');
INSERT INTO `t_s_type` VALUES ('702881eb591c41c301591c4d585d008', '8', '9.7', null, '702881eb591c41c301591c4a79b80003');
INSERT INTO `t_s_type` VALUES ('702881eb591c41c301591c4d585d009', '9', '9.7', null, '702881eb591c41c301591c4a79b80003');
INSERT INTO `t_s_type` VALUES ('702881eb591c41c301591c4d585d0010', '10', '9.7', null, '702881eb591c41c301591c4a79b80003');
INSERT INTO `t_s_type` VALUES ('802881eb591c41c301591c4d585d001', '1', '9.7', null, '802881eb591c41c301591c4a79b80002');
INSERT INTO `t_s_type` VALUES ('802881eb591c41c301591c4d585d002', '2', '9.7', null, '802881eb591c41c301591c4a79b80002');
INSERT INTO `t_s_type` VALUES ('802881eb591c41c301591c4d585d003', '3', '9.7', null, '802881eb591c41c301591c4a79b80002');
INSERT INTO `t_s_type` VALUES ('802881eb591c41c301591c4d585d004', '4', '9.7', null, '802881eb591c41c301591c4a79b80002');
INSERT INTO `t_s_type` VALUES ('802881eb591c41c301591c4d585d005', '5', '9.7', null, '802881eb591c41c301591c4a79b80002');
INSERT INTO `t_s_type` VALUES ('802881eb591c41c301591c4d585d006', '6', '9.7', null, '802881eb591c41c301591c4a79b80002');
INSERT INTO `t_s_type` VALUES ('802881eb591c41c301591c4d585d007', '7', '9.7', null, '802881eb591c41c301591c4a79b80002');
INSERT INTO `t_s_type` VALUES ('802881eb591c41c301591c4d585d008', '8', '9.7', null, '802881eb591c41c301591c4a79b80002');
INSERT INTO `t_s_type` VALUES ('802881eb591c41c301591c4d585d009', '9', '9.7', null, '802881eb591c41c301591c4a79b80002');
INSERT INTO `t_s_type` VALUES ('802881eb591c41c301591c4d585d0010', '10', '9.7', null, '802881eb591c41c301591c4a79b80002');
INSERT INTO `t_s_type` VALUES ('902881eb591c41c301591c4d585d001', '1', '9.7', null, '902848d3591ad1ee01591add2ff10006');
INSERT INTO `t_s_type` VALUES ('902881eb591c41c301591c4d585d002', '2', '9.7', null, '902848d3591ad1ee01591add2ff10006');
INSERT INTO `t_s_type` VALUES ('902881eb591c41c301591c4d585d003', '3', '9.7', null, '902848d3591ad1ee01591add2ff10006');
INSERT INTO `t_s_type` VALUES ('902881eb591c41c301591c4d585d004', '4', '9.7', null, '902848d3591ad1ee01591add2ff10006');
INSERT INTO `t_s_type` VALUES ('902881eb591c41c301591c4d585d005', '5', '9.7', null, '902848d3591ad1ee01591add2ff10006');
INSERT INTO `t_s_type` VALUES ('902881eb591c41c301591c4d585d006', '6', '9.7', null, '902848d3591ad1ee01591add2ff10006');
INSERT INTO `t_s_type` VALUES ('902881eb591c41c301591c4d585d007', '7', '9.7', null, '902848d3591ad1ee01591add2ff10006');
INSERT INTO `t_s_type` VALUES ('902881eb591c41c301591c4d585d008', '8', '9.7', null, '902848d3591ad1ee01591add2ff10006');
INSERT INTO `t_s_type` VALUES ('902881eb591c41c301591c4d585d009', '9', '9.7', null, '902848d3591ad1ee01591add2ff10006');
INSERT INTO `t_s_type` VALUES ('902881eb591c41c301591c4d585d0010', '10', '9.7', null, '902848d3591ad1ee01591add2ff10006');
INSERT INTO `t_s_type` VALUES ('102881eb591c41c301591c4d585d001', '1', '9.7', null, '912848d3591ad1ee01591adc526d0004');
INSERT INTO `t_s_type` VALUES ('102881eb591c41c301591c4d585d002', '2', '9.7', null, '912848d3591ad1ee01591adc526d0004');
INSERT INTO `t_s_type` VALUES ('102881eb591c41c301591c4d585d003', '3', '9.7', null, '912848d3591ad1ee01591adc526d0004');
INSERT INTO `t_s_type` VALUES ('102881eb591c41c301591c4d585d004', '4', '9.7', null, '912848d3591ad1ee01591adc526d0004');
INSERT INTO `t_s_type` VALUES ('102881eb591c41c301591c4d585d005', '5', '9.7', null, '912848d3591ad1ee01591adc526d0004');
INSERT INTO `t_s_type` VALUES ('102881eb591c41c301591c4d585d006', '6', '9.7', null, '912848d3591ad1ee01591adc526d0004');
INSERT INTO `t_s_type` VALUES ('102881eb591c41c301591c4d585d007', '7', '9.7', null, '912848d3591ad1ee01591adc526d0004');
INSERT INTO `t_s_type` VALUES ('102881eb591c41c301591c4d585d008', '8', '9.7', null, '912848d3591ad1ee01591adc526d0004');
INSERT INTO `t_s_type` VALUES ('102881eb591c41c301591c4d585d009', '9', '9.7', null, '912848d3591ad1ee01591adc526d0004');
INSERT INTO `t_s_type` VALUES ('102881eb591c41c301591c4d585d0010', '10', '9.7', null, '912848d3591ad1ee01591adc526d0004');




INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c69e711001d', '3', '40', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6a283a001f', '4', '40', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6a67750021', '5', '20', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6a99050023', '6', '20', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6adc610025', '7', '12', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6b10540028', '8', '12', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6b4d94002a', '9', '9', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6b67e9002c', '10', '9', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6bc6d9002e', '11', '8', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6bee460030', '12', '9', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6c1b810032', '13', '9', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6cb69d0035', '14', '12', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6cf8c30037', '15', '12', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6d7eaf003a', '16', '20', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6daf43003c', '17', '20', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6ddbbc003e', '18', '40', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6e321b0041', '19', '40', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6eb8470043', '冠亚大', '1.9', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6f16e10045', '冠亚小', '1.8', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6f56440047', '冠亚单', '1.9', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c6f7f710049', '冠亚双', '1.8', null, '402881eb591c41c301591c694111001b');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c74b576004b', '大', '1.94', null, '402881eb591c41c301591c5ad8ce0006');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c74d3d6004d', '小', '1.94', null, '402881eb591c41c301591c5ad8ce0006');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c75037c004f', '单', '1.94', null, '402881eb591c41c301591c5ad8ce0006');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c7524050051', '双', '1.94', null, '402881eb591c41c301591c5ad8ce0006');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c7546c50053', '龙', '1.94', null, '402881eb591c41c301591c5ad8ce0006');
INSERT INTO `t_s_type` VALUES ('402881eb591c41c301591c7563e00055', '虎', '1.94', null, '402881eb591c41c301591c5ad8ce0006');
INSERT INTO `t_s_type` VALUES ('202881eb591c41c301591c74b576004b', '大', '1.94', null, '402881eb591c41c301591c5b17c00008');
INSERT INTO `t_s_type` VALUES ('202881eb591c41c301591c74d3d6004d', '小', '1.94', null, '402881eb591c41c301591c5b17c00008');
INSERT INTO `t_s_type` VALUES ('202881eb591c41c301591c75037c004f', '单', '1.94', null, '402881eb591c41c301591c5b17c00008');
INSERT INTO `t_s_type` VALUES ('202881eb591c41c301591c7524050051', '双', '1.94', null, '402881eb591c41c301591c5b17c00008');
INSERT INTO `t_s_type` VALUES ('202881eb591c41c301591c7546c50053', '龙', '1.94', null, '402881eb591c41c301591c5b17c00008');
INSERT INTO `t_s_type` VALUES ('202881eb591c41c301591c7563e00055', '虎', '1.94', null, '402881eb591c41c301591c5b17c00008');
INSERT INTO `t_s_type` VALUES ('302881eb591c41c301591c74b576004b', '大', '1.94', null, '402881eb591c41c301591c5b368e000a');
INSERT INTO `t_s_type` VALUES ('302881eb591c41c301591c74d3d6004d', '小', '1.94', null, '402881eb591c41c301591c5b368e000a');
INSERT INTO `t_s_type` VALUES ('302881eb591c41c301591c75037c004f', '单', '1.94', null, '402881eb591c41c301591c5b368e000a');
INSERT INTO `t_s_type` VALUES ('302881eb591c41c301591c7524050051', '双', '1.94', null, '402881eb591c41c301591c5b368e000a');
INSERT INTO `t_s_type` VALUES ('302881eb591c41c301591c7546c50053', '龙', '1.94', null, '402881eb591c41c301591c5b368e000a');
INSERT INTO `t_s_type` VALUES ('302881eb591c41c301591c7563e00055', '虎', '1.94', null, '402881eb591c41c301591c5b368e000a');
INSERT INTO `t_s_type` VALUES ('102881eb591c41c301591c74b576004b', '大', '1.94', null, '402881eb591c41c301591c5b7891000c');
INSERT INTO `t_s_type` VALUES ('102881eb591c41c301591c74d3d6004d', '小', '1.94', null, '402881eb591c41c301591c5b7891000c');
INSERT INTO `t_s_type` VALUES ('102881eb591c41c301591c75037c004f', '单', '1.94', null, '402881eb591c41c301591c5b7891000c');
INSERT INTO `t_s_type` VALUES ('102881eb591c41c301591c7524050051', '双', '1.94', null, '402881eb591c41c301591c5b7891000c');
INSERT INTO `t_s_type` VALUES ('102881eb591c41c301591c7546c50053', '龙', '1.94', null, '402881eb591c41c301591c5b7891000c');
INSERT INTO `t_s_type` VALUES ('102881eb591c41c301591c7563e00055', '虎', '1.94', null, '402881eb591c41c301591c5b7891000c');
INSERT INTO `t_s_type` VALUES ('502881eb591c41c301591c74b576004b', '大', '1.94', null, '402881eb591c41c301591c5bcc2e000f');
INSERT INTO `t_s_type` VALUES ('502881eb591c41c301591c74d3d6004d', '小', '1.94', null, '402881eb591c41c301591c5bcc2e000f');
INSERT INTO `t_s_type` VALUES ('502881eb591c41c301591c75037c004f', '单', '1.94', null, '402881eb591c41c301591c5bcc2e000f');
INSERT INTO `t_s_type` VALUES ('502881eb591c41c301591c7524050051', '双', '1.94', null, '402881eb591c41c301591c5bcc2e000f');
INSERT INTO `t_s_type` VALUES ('502881eb591c41c301591c7546c50053', '龙', '1.94', null, '402881eb591c41c301591c5bcc2e000f');
INSERT INTO `t_s_type` VALUES ('502881eb591c41c301591c7563e00055', '虎', '1.94', null, '402881eb591c41c301591c5bcc2e000f');
INSERT INTO `t_s_type` VALUES ('602881eb591c41c301591c74b576004b', '大', '1.94', null, '402881eb591c41c301591c5bf7b20011');
INSERT INTO `t_s_type` VALUES ('602881eb591c41c301591c74d3d6004d', '小', '1.94', null, '402881eb591c41c301591c5bf7b20011');
INSERT INTO `t_s_type` VALUES ('602881eb591c41c301591c75037c004f', '单', '1.94', null, '402881eb591c41c301591c5bf7b20011');
INSERT INTO `t_s_type` VALUES ('602881eb591c41c301591c7524050051', '双', '1.94', null, '402881eb591c41c301591c5bf7b20011');
INSERT INTO `t_s_type` VALUES ('702881eb591c41c301591c74b576004b', '大', '1.94', null, '402881eb591c41c301591c5c258a0013');
INSERT INTO `t_s_type` VALUES ('702881eb591c41c301591c74d3d6004d', '小', '1.94', null, '402881eb591c41c301591c5c258a0013');
INSERT INTO `t_s_type` VALUES ('702881eb591c41c301591c75037c004f', '单', '1.94', null, '402881eb591c41c301591c5c258a0013');
INSERT INTO `t_s_type` VALUES ('702881eb591c41c301591c7524050051', '双', '1.94', null, '402881eb591c41c301591c5c258a0013');
INSERT INTO `t_s_type` VALUES ('802881eb591c41c301591c74b576004b', '大', '1.94', null, '402881eb591c41c301591c5c4ce50015');
INSERT INTO `t_s_type` VALUES ('802881eb591c41c301591c74d3d6004d', '小', '1.94', null, '402881eb591c41c301591c5c4ce50015');
INSERT INTO `t_s_type` VALUES ('802881eb591c41c301591c75037c004f', '单', '1.94', null, '402881eb591c41c301591c5c4ce50015');
INSERT INTO `t_s_type` VALUES ('802881eb591c41c301591c7524050051', '双', '1.94', null, '402881eb591c41c301591c5c4ce50015');
INSERT INTO `t_s_type` VALUES ('902881eb591c41c301591c74b576004b', '大', '1.94', null, '402881eb591c41c301591c5ca2070017');
INSERT INTO `t_s_type` VALUES ('902881eb591c41c301591c74d3d6004d', '小', '1.94', null, '402881eb591c41c301591c5ca2070017');
INSERT INTO `t_s_type` VALUES ('902881eb591c41c301591c75037c004f', '单', '1.94', null, '402881eb591c41c301591c5ca2070017');
INSERT INTO `t_s_type` VALUES ('902881eb591c41c301591c7524050051', '双', '1.94', null, '402881eb591c41c301591c5ca2070017');
INSERT INTO `t_s_type` VALUES ('912881eb591c41c301591c74b576004b', '大', '1.94', null, '402881eb591c41c301591c5d38f80019');
INSERT INTO `t_s_type` VALUES ('912881eb591c41c301591c74d3d6004d', '小', '1.94', null, '402881eb591c41c301591c5d38f80019');
INSERT INTO `t_s_type` VALUES ('912881eb591c41c301591c75037c004f', '单', '1.94', null, '402881eb591c41c301591c5d38f80019');
INSERT INTO `t_s_type` VALUES ('912881eb591c41c301591c7524050051', '双', '1.94', null, '402881eb591c41c301591c5d38f80019');

-- ----------------------------
-- Table structure for t_s_typegroup
-- ----------------------------
DROP TABLE IF EXISTS `t_s_typegroup`;
CREATE TABLE `t_s_typegroup` (
  `ID` varchar(32) NOT NULL,
  `typegroupcode` varchar(50) DEFAULT NULL,
  `typegroupname` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_s_typegroup
-- ----------------------------
INSERT INTO `t_s_typegroup` VALUES ('297e201047e95ee30147e9ba56ce0009', 'orgtype', 'common.org.type');
INSERT INTO `t_s_typegroup` VALUES ('2c90ac564c9d1734014c9db1a167002b', 'sf_yn', '是否YN');
INSERT INTO `t_s_typegroup` VALUES ('402880884883eff401488415cbb60027', 'smsTplType', '模板类型');
INSERT INTO `t_s_typegroup` VALUES ('402881a151f1af7c0151f1b9d7f50002', 'outType', '离职方式');
INSERT INTO `t_s_typegroup` VALUES ('402881e44df713f5014df738349c002f', 'formDbType', 'form.db.type');
INSERT INTO `t_s_typegroup` VALUES ('402881e54dcb624a014dcbf4912b000e', 'bdfl', '表单分类');
INSERT INTO `t_s_typegroup` VALUES ('402881e64ca6fd1b014ca7044c370004', 'tblx', '图表类型');
INSERT INTO `t_s_typegroup` VALUES ('402881e946e71f5f0146e73619bb0002', 'lang', 'common.mutilang');
INSERT INTO `t_s_typegroup` VALUES ('4028838850c35b6a0150c37251e00002', 'dataType', '校验规则');
INSERT INTO `t_s_typegroup` VALUES ('4028ab8c5134f1ed0151350f08d90003', 'units', '常用单位');
INSERT INTO `t_s_typegroup` VALUES ('4028b881533ac16a01533adb50460001', 'graphType', '动态图表类型');
INSERT INTO `t_s_typegroup` VALUES ('4028efa25219c9f0015219d1d2720004', 'leaveType', '请假类别');
INSERT INTO `t_s_typegroup` VALUES ('8a1c7ee54e3e2ca9014e3e4b78f90009', 'enhanceType', 'java.enhance.type');
INSERT INTO `t_s_typegroup` VALUES ('8a71b40e4a38319b014a3858fca40018', 'msgTplType', '消息模板分类');
INSERT INTO `t_s_typegroup` VALUES ('8a71b40e4a38319b014a385cb115001e', 'msgType', '消息类别');
INSERT INTO `t_s_typegroup` VALUES ('8a71b40e4a38319b014a386022bd0026', 'msgStatus', '消息发送状态');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181aa0056', 'icontype', 'common.icon.type');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181b10057', 'order', 'lang.order.type');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181b50058', 'custom', 'lang.customer.type');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181b90059', 'service', 'lang.service.item.type');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181bc005a', 'searchmode', 'common.query.module');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181c0005b', 'yesorno', 'common.logic.condition');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181c3005c', 'fieldtype', 'field.type');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181c6005d', 'database', 'common.data.table');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181ca005e', 'fieltype', 'common.document.category');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0b246dc81120146dc8181cd005f', 'sex', 'common.sex.type');
INSERT INTO `t_s_typegroup` VALUES ('8a8ab0ba487c527201487c7732790019', 'dbtype', 'common.dbtype');
INSERT INTO `t_s_typegroup` VALUES ('f852d85d47ed64a40147ed70894c0003', 'rulecon', '规则条件');
INSERT INTO `t_s_typegroup` VALUES ('jglongjbtstypegourp2015060400001', 'weixin', '微信模板类型');
INSERT INTO `t_s_typegroup` VALUES ('912848d3591ad1ee01591adc526d0004', 'RANKING10', '第10名');
INSERT INTO `t_s_typegroup` VALUES ('902848d3591ad1ee01591add2ff10006', 'RANKING9', '第9名');
INSERT INTO `t_s_typegroup` VALUES ('802881eb591c41c301591c4a79b80002', 'RANKING8', '第8名');
INSERT INTO `t_s_typegroup` VALUES ('702881eb591c41c301591c4a79b80003', 'RANKING7', '第7名');
INSERT INTO `t_s_typegroup` VALUES ('602881eb591c41c301591c4a79b80004', 'RANKING6', '第6名');
INSERT INTO `t_s_typegroup` VALUES ('502881eb591c41c301591c4a79b80005', 'RANKING5', '第5名');
INSERT INTO `t_s_typegroup` VALUES ('402881eb591c41c301591c4a79b80006', 'RANKING4', '第4名');
INSERT INTO `t_s_typegroup` VALUES ('302881eb591c41c301591c4a79b80007', 'RANKING3', '第3名');
INSERT INTO `t_s_typegroup` VALUES ('202881eb591c41c301591c4a79b80008', 'RANKING2', '亚军');
INSERT INTO `t_s_typegroup` VALUES ('102881eb591c41c301591c4a79b80009', 'RANKING1', '冠军');
INSERT INTO `t_s_typegroup` VALUES ('402881eb591c41c301591c5ad8ce0006', 'TWO1', '冠军');
INSERT INTO `t_s_typegroup` VALUES ('402881eb591c41c301591c5b17c00008', 'TWO2', '亚军');
INSERT INTO `t_s_typegroup` VALUES ('402881eb591c41c301591c5b368e000a', 'TWO3', '第3名');
INSERT INTO `t_s_typegroup` VALUES ('402881eb591c41c301591c5b7891000c', 'TWO4', '第4名');
INSERT INTO `t_s_typegroup` VALUES ('402881eb591c41c301591c5bcc2e000f', 'TWO5', '第5名');
INSERT INTO `t_s_typegroup` VALUES ('402881eb591c41c301591c5bf7b20011', 'TWO6', '第6名');
INSERT INTO `t_s_typegroup` VALUES ('402881eb591c41c301591c5c258a0013', 'TWO7', '第7名');
INSERT INTO `t_s_typegroup` VALUES ('402881eb591c41c301591c5c4ce50015', 'TWO8', '第8名');
INSERT INTO `t_s_typegroup` VALUES ('402881eb591c41c301591c5ca2070017', 'TWO9', '第9名');
INSERT INTO `t_s_typegroup` VALUES ('402881eb591c41c301591c5d38f80019', 'TWO10', '第10名');
INSERT INTO `t_s_typegroup` VALUES ('402881eb591c41c301591c694111001b', 'TOP2', '冠亚组合');
