/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50718
Source Host           : localhost:3306
Source Database       : sciencedb

Target Server Type    : MYSQL
Target Server Version : 50718
File Encoding         : 65001

Date: 2019-02-16 20:31:45
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_login_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_login_record`;
CREATE TABLE `sys_login_record` (
  `id` int(11) NOT NULL,
  `user_id` varchar(36) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `login_ip` varchar(50) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `operate_content` varchar(350) DEFAULT NULL,
  `operate_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_login_record
-- ----------------------------
INSERT INTO `sys_login_record` VALUES ('0', '201500208', 'admin', '127.0.0.1', '2019-02-16 19:30:06', '密码错误，登录失败', '1');

-- ----------------------------
-- Table structure for sys_right
-- ----------------------------
DROP TABLE IF EXISTS `sys_right`;
CREATE TABLE `sys_right` (
  `right_id` varchar(50) NOT NULL COMMENT '权限编号',
  `right_name` varchar(50) DEFAULT NULL COMMENT '权限名称',
  `resource_path` varchar(250) DEFAULT NULL COMMENT '资源路径',
  `right_type` varchar(45) DEFAULT NULL COMMENT '权限类别',
  `right_sort_order` int(4) DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`right_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_right
-- ----------------------------
INSERT INTO `sys_right` VALUES ('addBook', '添加图书', '', '3', '10');
INSERT INTO `sys_right` VALUES ('addRight', '添加权限', null, null, '1');
INSERT INTO `sys_right` VALUES ('addRole', '添加角色', null, null, '2');
INSERT INTO `sys_right` VALUES ('addUser', '添加用户', null, null, '3');
INSERT INTO `sys_right` VALUES ('deleteRight', '删除权限', null, null, '4');
INSERT INTO `sys_right` VALUES ('deleteRole', '删除角色', null, null, '5');
INSERT INTO `sys_right` VALUES ('deleteUser', '删除用户', null, null, '6');
INSERT INTO `sys_right` VALUES ('editRight', '修改权限', null, null, '9');
INSERT INTO `sys_right` VALUES ('editRole', '修改角色', null, null, '8');
INSERT INTO `sys_right` VALUES ('editUser', '修改用户', null, null, '7');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` varchar(50) NOT NULL COMMENT '角色编号',
  `role_name` varchar(250) DEFAULT NULL COMMENT '角色名称',
  `role_sort_order` int(4) DEFAULT NULL COMMENT '排序序号',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('admin', '超级管理员', '0');
INSERT INTO `sys_role` VALUES ('researchAssistant', '科研项目助理', '4');
INSERT INTO `sys_role` VALUES ('teacher-admin', '平台管理员', '1');
INSERT INTO `sys_role` VALUES ('teamLeader', '科研项目组长', '3');

-- ----------------------------
-- Table structure for sys_role_right
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_right`;
CREATE TABLE `sys_role_right` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(50) DEFAULT NULL COMMENT '角色id',
  `right_id` varchar(50) DEFAULT NULL COMMENT '权限id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_role_right
-- ----------------------------
INSERT INTO `sys_role_right` VALUES ('1', 'admin', 'addRight');
INSERT INTO `sys_role_right` VALUES ('3', 'admin', 'addRole');
INSERT INTO `sys_role_right` VALUES ('5', 'admin', 'addUser');
INSERT INTO `sys_role_right` VALUES ('7', 'admin', 'deleteRight');
INSERT INTO `sys_role_right` VALUES ('9', 'admin', 'deleteRole');
INSERT INTO `sys_role_right` VALUES ('11', 'admin', 'deleteUser');
INSERT INTO `sys_role_right` VALUES ('13', 'admin', 'editUser');
INSERT INTO `sys_role_right` VALUES ('15', 'admin', 'editRole');
INSERT INTO `sys_role_right` VALUES ('17', 'admin', 'editRight');
INSERT INTO `sys_role_right` VALUES ('19', 'teamLeader', 'addUser');
INSERT INTO `sys_role_right` VALUES ('23', 'researchAssistant', 'addUser');
INSERT INTO `sys_role_right` VALUES ('25', 'researchAssistant', 'deleteUser');
INSERT INTO `sys_role_right` VALUES ('27', 'researchAssistant', 'editUser');
INSERT INTO `sys_role_right` VALUES ('29', 'researchAssistant', 'editRole');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(50) DEFAULT NULL,
  `user_name` varchar(50) DEFAULT NULL,
  `user_password` varchar(150) NOT NULL,
  `user_telephone` varchar(35) DEFAULT NULL,
  `user_email` varchar(75) DEFAULT NULL,
  `user_real_name` varchar(50) DEFAULT NULL,
  `user_sex` int(4) DEFAULT NULL,
  `user_age` int(4) DEFAULT NULL,
  `user_type` int(4) NOT NULL,
  `user_address` varchar(350) DEFAULT NULL,
  `user_qq` varchar(20) DEFAULT NULL,
  `studentClass` varchar(255) DEFAULT NULL,
  `studentType` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('11', '201500208', 'admin', '7c890babc4808b2acffc30b5a48ab21d62542343d238a1de8010e8b06798f747ff5b0056f5b77f80', '18345921563', null, 'admin', '1', null, '0', null, '1554548523', null, null);
INSERT INTO `sys_user` VALUES ('13', '201500208414', '小靖', '020e6fb4eaa69d12c66f39b24cb0173b84feb483f3ad510bac4f2adc65fbd0af90a530e1d187346a', '15847692451', null, '小靖', '0', '22', '1', null, '452641231', null, '3');
INSERT INTO `sys_user` VALUES ('15', '201500208125', '张三', '02ac450471ec94da359560e5254c345980c572e14884568b22cadd498857e43a8731a8450e58f792', '15263541258', null, '张三', '1', '23', '1', null, '2546234', null, '3');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` varchar(50) DEFAULT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', 'admin', 'admin');
INSERT INTO `sys_user_role` VALUES ('9', 'admin', '201500208');

-- ----------------------------
-- Table structure for t_assetbuy
-- ----------------------------
DROP TABLE IF EXISTS `t_assetbuy`;
CREATE TABLE `t_assetbuy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pjId` varchar(45) DEFAULT NULL,
  `pjName` varchar(50) DEFAULT NULL,
  `pjLeader` varchar(50) DEFAULT NULL,
  `goods` varchar(200) DEFAULT NULL,
  `reason` text,
  `date` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_assetbuy
-- ----------------------------

-- ----------------------------
-- Table structure for t_assistant
-- ----------------------------
DROP TABLE IF EXISTS `t_assistant`;
CREATE TABLE `t_assistant` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pjId` varchar(45) DEFAULT NULL,
  `pjName` varchar(50) DEFAULT NULL,
  `userId` varchar(20) DEFAULT NULL,
  `userName` varchar(30) DEFAULT NULL,
  `work` varchar(500) DEFAULT NULL,
  `approver` varchar(30) DEFAULT NULL,
  `applyTime` datetime DEFAULT NULL,
  `approveTime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_assistant
-- ----------------------------

-- ----------------------------
-- Table structure for t_bookinfo
-- ----------------------------
DROP TABLE IF EXISTS `t_bookinfo`;
CREATE TABLE `t_bookinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookNo` varchar(20) DEFAULT NULL,
  `bookName
bookName` varchar(70) DEFAULT NULL,
  `fClass` varchar(70) DEFAULT NULL,
  `sClass` varchar(70) DEFAULT NULL,
  `imagePath` varchar(255) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `catalog` text,
  `summary` text,
  `page` varchar(10) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `pubdate` varchar(255) DEFAULT NULL,
  `binding` varchar(255) DEFAULT NULL,
  `publisher` varchar(255) DEFAULT NULL,
  `bookTotal` int(11) DEFAULT NULL,
  `borrowTotal` int(11) DEFAULT NULL,
  `remainNumber` int(11) DEFAULT NULL,
  `commentNumber` int(11) DEFAULT NULL,
  `collection` int(11) DEFAULT NULL,
  `recommended` int(11) DEFAULT NULL,
  `caseId` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_bookinfo
-- ----------------------------

-- ----------------------------
-- Table structure for t_borrow
-- ----------------------------
DROP TABLE IF EXISTS `t_borrow`;
CREATE TABLE `t_borrow` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `readerId` varchar(20) DEFAULT NULL,
  `bookNo` varchar(20) DEFAULT NULL,
  `bookName` varchar(70) DEFAULT NULL,
  `borrowTime` datetime DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `backTimeIdeal` varchar(70) DEFAULT NULL,
  `backTimereality` varchar(70) DEFAULT NULL,
  `ifback` int(11) DEFAULT NULL,
  `overdueState` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_borrow
-- ----------------------------

-- ----------------------------
-- Table structure for t_capital
-- ----------------------------
DROP TABLE IF EXISTS `t_capital`;
CREATE TABLE `t_capital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pjName` varchar(50) DEFAULT NULL,
  `pjLeader` varchar(30) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `capital` varchar(30) DEFAULT NULL,
  `addTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_capital
-- ----------------------------

-- ----------------------------
-- Table structure for t_collection
-- ----------------------------
DROP TABLE IF EXISTS `t_collection`;
CREATE TABLE `t_collection` (
  `collectionId` int(11) NOT NULL AUTO_INCREMENT,
  `bookNo` varchar(20) DEFAULT NULL,
  `readerId` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`collectionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_collection
-- ----------------------------

-- ----------------------------
-- Table structure for t_comment
-- ----------------------------
DROP TABLE IF EXISTS `t_comment`;
CREATE TABLE `t_comment` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `bookNo` varchar(20) DEFAULT NULL,
  `bookName` varchar(70) DEFAULT NULL,
  `readerId` varchar(20) DEFAULT NULL,
  `commentContent` text,
  `commentTime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`commentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_comment
-- ----------------------------

-- ----------------------------
-- Table structure for t_downproject
-- ----------------------------
DROP TABLE IF EXISTS `t_downproject`;
CREATE TABLE `t_downproject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pjId` varchar(45) DEFAULT NULL,
  `pjName` varchar(50) DEFAULT NULL,
  `pjLeader` varchar(50) DEFAULT NULL,
  `capital` varchar(30) DEFAULT NULL,
  `reseach` varchar(500) DEFAULT NULL,
  `setTime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_downproject
-- ----------------------------

-- ----------------------------
-- Table structure for t_ebook
-- ----------------------------
DROP TABLE IF EXISTS `t_ebook`;
CREATE TABLE `t_ebook` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ebookNo` varchar(20) DEFAULT NULL,
  `ebookName` varchar(70) DEFAULT NULL,
  `fClass` varchar(70) DEFAULT NULL,
  `sClass` varchar(70) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `sharer` varchar(30) DEFAULT NULL,
  `catalog` text,
  `summary` text,
  `page` varchar(10) DEFAULT NULL,
  `appendix` varchar(255) DEFAULT NULL,
  `commentNumber` int(11) DEFAULT NULL,
  `collection` int(11) DEFAULT NULL,
  `recommended` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_ebook
-- ----------------------------

-- ----------------------------
-- Table structure for t_equipment
-- ----------------------------
DROP TABLE IF EXISTS `t_equipment`;
CREATE TABLE `t_equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipId` varchar(20) DEFAULT NULL,
  `equipName` varchar(30) DEFAULT NULL,
  `buyTime` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `remainder` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_equipment
-- ----------------------------

-- ----------------------------
-- Table structure for t_equipuse
-- ----------------------------
DROP TABLE IF EXISTS `t_equipuse`;
CREATE TABLE `t_equipuse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipId` varchar(20) DEFAULT NULL,
  `equipName` varchar(50) DEFAULT NULL,
  `pjId` varchar(45) DEFAULT NULL,
  `pjName` varchar(50) DEFAULT NULL,
  `pjLeader` varchar(50) DEFAULT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_equipuse
-- ----------------------------

-- ----------------------------
-- Table structure for t_intelligence
-- ----------------------------
DROP TABLE IF EXISTS `t_intelligence`;
CREATE TABLE `t_intelligence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `intelId` varchar(20) DEFAULT NULL,
  `intelName` varchar(70) DEFAULT NULL,
  `bookNo` varchar(20) DEFAULT NULL,
  `commentId` int(11) DEFAULT NULL,
  `ebookNo` varchar(20) DEFAULT NULL,
  `planNo` varchar(20) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_intelligence
-- ----------------------------

-- ----------------------------
-- Table structure for t_leave
-- ----------------------------
DROP TABLE IF EXISTS `t_leave`;
CREATE TABLE `t_leave` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `massage` text,
  `writer` varchar(20) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `leaveTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_leave
-- ----------------------------

-- ----------------------------
-- Table structure for t_mission
-- ----------------------------
DROP TABLE IF EXISTS `t_mission`;
CREATE TABLE `t_mission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pjId` varchar(45) DEFAULT NULL,
  `pjStageId` varchar(50) DEFAULT NULL,
  `missionId` varchar(50) DEFAULT NULL,
  `missionInfo` text,
  `userName` varchar(30) DEFAULT NULL,
  `missionType` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_mission
-- ----------------------------

-- ----------------------------
-- Table structure for t_notice
-- ----------------------------
DROP TABLE IF EXISTS `t_notice`;
CREATE TABLE `t_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `notice` text,
  `writer` varchar(30) DEFAULT NULL,
  `publishTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_notice
-- ----------------------------

-- ----------------------------
-- Table structure for t_pjapexpense
-- ----------------------------
DROP TABLE IF EXISTS `t_pjapexpense`;
CREATE TABLE `t_pjapexpense` (
  `id
id` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `pjId` varchar(45) DEFAULT NULL,
  `pjName` varchar(50) DEFAULT NULL,
  `pjLeader` varchar(50) DEFAULT NULL,
  `expensing` varchar(30) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `reason` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id
id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pjapexpense
-- ----------------------------

-- ----------------------------
-- Table structure for t_pjexpense
-- ----------------------------
DROP TABLE IF EXISTS `t_pjexpense`;
CREATE TABLE `t_pjexpense` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` datetime DEFAULT NULL,
  `pjId` varchar(45) DEFAULT NULL,
  `pjName` varchar(50) DEFAULT NULL,
  `pjLeader` varchar(50) DEFAULT NULL,
  `pjBudget` varchar(30) DEFAULT NULL,
  `expensed` varchar(30) DEFAULT NULL,
  `expensing` varchar(30) DEFAULT NULL,
  `reason` varchar(300) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `operator` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pjexpense
-- ----------------------------

-- ----------------------------
-- Table structure for t_pristutask
-- ----------------------------
DROP TABLE IF EXISTS `t_pristutask`;
CREATE TABLE `t_pristutask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `readerId` varchar(20) DEFAULT NULL,
  `taskNo` varchar(20) DEFAULT NULL,
  `taskName` varchar(70) DEFAULT NULL,
  `taskinfo` varchar(255) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  `appendix` varchar(255) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pristutask
-- ----------------------------

-- ----------------------------
-- Table structure for t_private
-- ----------------------------
DROP TABLE IF EXISTS `t_private`;
CREATE TABLE `t_private` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pbookNo` varchar(20) DEFAULT NULL,
  `pbookName` varchar(70) DEFAULT NULL,
  `fClass` varchar(70) DEFAULT NULL,
  `sClass` varchar(70) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `owner` varchar(30) DEFAULT NULL,
  `catalog` text,
  `summary` text,
  `page` varchar(10) DEFAULT NULL,
  `appendix` varchar(255) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_private
-- ----------------------------

-- ----------------------------
-- Table structure for t_project
-- ----------------------------
DROP TABLE IF EXISTS `t_project`;
CREATE TABLE `t_project` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pjId` varchar(45) DEFAULT NULL,
  `pjName` varchar(50) DEFAULT NULL,
  `pjLeader` varchar(50) DEFAULT NULL,
  `pjBudget` varchar(30) DEFAULT NULL,
  `research` text,
  `setTime` datetime DEFAULT NULL,
  `memberNum` int(11) DEFAULT NULL,
  `startTime` varchar(50) DEFAULT NULL,
  `ETendTime` varchar(50) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `expensed` int(11) DEFAULT NULL,
  `menber` varchar(500) DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_project
-- ----------------------------

-- ----------------------------
-- Table structure for t_projectfile
-- ----------------------------
DROP TABLE IF EXISTS `t_projectfile`;
CREATE TABLE `t_projectfile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fileId` varchar(20) DEFAULT NULL,
  `fileName` varchar(70) DEFAULT NULL,
  `pjId` varchar(45) DEFAULT NULL,
  `pjName` varchar(50) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `sharer` varchar(30) DEFAULT NULL,
  `appendix` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_projectfile
-- ----------------------------

-- ----------------------------
-- Table structure for t_pubstutask
-- ----------------------------
DROP TABLE IF EXISTS `t_pubstutask`;
CREATE TABLE `t_pubstutask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taskNo` varchar(20) DEFAULT NULL,
  `taskName` varchar(70) DEFAULT NULL,
  `taskinfo` varchar(500) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_pubstutask
-- ----------------------------

-- ----------------------------
-- Table structure for t_repair
-- ----------------------------
DROP TABLE IF EXISTS `t_repair`;
CREATE TABLE `t_repair` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `equipId` varchar(20) DEFAULT NULL,
  `equipName` varchar(30) DEFAULT NULL,
  `repairMan` varchar(50) DEFAULT NULL,
  `repairNum` int(11) DEFAULT NULL,
  `repairTime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_repair
-- ----------------------------

-- ----------------------------
-- Table structure for t_setproject
-- ----------------------------
DROP TABLE IF EXISTS `t_setproject`;
CREATE TABLE `t_setproject` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pjId` varchar(45) DEFAULT NULL,
  `pjName` varchar(50) DEFAULT NULL,
  `pjLeader` varchar(50) DEFAULT NULL,
  `pjBudget` varchar(30) DEFAULT NULL,
  `reseach` text,
  `setTime` datetime DEFAULT NULL,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_setproject
-- ----------------------------

-- ----------------------------
-- Table structure for t_stage
-- ----------------------------
DROP TABLE IF EXISTS `t_stage`;
CREATE TABLE `t_stage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pjId` varchar(45) DEFAULT NULL,
  `pjStageId` varchar(50) DEFAULT NULL,
  `stage` int(11) DEFAULT NULL,
  `stageInfo` text,
  `state` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_stage
-- ----------------------------

-- ----------------------------
-- Table structure for t_studyplan
-- ----------------------------
DROP TABLE IF EXISTS `t_studyplan`;
CREATE TABLE `t_studyplan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `planNo` varchar(20) DEFAULT NULL,
  `planName` varchar(70) DEFAULT NULL,
  `fClass` varchar(70) DEFAULT NULL,
  `sClass` varchar(70) DEFAULT NULL,
  `appendix` varchar(255) DEFAULT NULL,
  `author` varchar(30) DEFAULT NULL,
  `createTime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of t_studyplan
-- ----------------------------
