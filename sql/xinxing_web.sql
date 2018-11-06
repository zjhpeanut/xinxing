/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50642
Source Host           : localhost:3306
Source Database       : xinxing_web

Target Server Type    : MYSQL
Target Server Version : 50642
File Encoding         : 65001

Date: 2018-11-06 13:57:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `qrtz_blob_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_calendars`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_cron_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------
INSERT INTO `qrtz_cron_triggers` VALUES ('XinXingScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai');
INSERT INTO `qrtz_cron_triggers` VALUES ('XinXingScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');

-- ----------------------------
-- Table structure for `qrtz_fired_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_job_details`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------
INSERT INTO `qrtz_job_details` VALUES ('XinxingScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', null, 'com.xinxing.quartz.util.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720020636F6D2E78696E78696E672E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720022636F6D2E78696E78696E672E636F6D6D6F6E2E626173652E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000130740001317800);
INSERT INTO `qrtz_job_details` VALUES ('XinxingScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', null, 'com.xinxing.quartz.util.ScheduleJob', '0', '0', '0', '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720020636F6D2E78696E78696E672E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720022636F6D2E78696E78696E672E636F6D6D6F6E2E626173652E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002727974000130740001317800);

-- ----------------------------
-- Table structure for `qrtz_locks`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('XinxingScheduler', 'STATE_ACCESS');
INSERT INTO `qrtz_locks` VALUES ('XinxingScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for `qrtz_paused_trigger_grps`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_scheduler_state`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------
INSERT INTO `qrtz_scheduler_state` VALUES ('XinXingScheduler', 'zjh1541473076823', '1541481165562', '15000');

-- ----------------------------
-- Table structure for `qrtz_simple_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_simprop_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for `qrtz_triggers`
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------
INSERT INTO `qrtz_triggers` VALUES ('XinXingScheduler', '__TASK_CLASS_NAME__1', 'DEFAULT', '__TASK_CLASS_NAME__1', 'DEFAULT', null, '1539929520000', '-1', '5', 'PAUSED', 'CRON', '1539929514000', '0', null, '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720020636F6D2E78696E78696E672E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720022636F6D2E78696E78696E672E636F6D6D6F6E2E626173652E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000174000672795461736B74000A72794E6F506172616D7374000074000130740001317800);
INSERT INTO `qrtz_triggers` VALUES ('XinXingScheduler', '__TASK_CLASS_NAME__2', 'DEFAULT', '__TASK_CLASS_NAME__2', 'DEFAULT', null, '1539929520000', '-1', '5', 'PAUSED', 'CRON', '1539929517000', '0', null, '0', 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61708208E8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D617013E62EAD28760ACE0200025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC1C31660D103000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C770800000010000000017400135F5F5441534B5F50524F504552544945535F5F73720020636F6D2E78696E78696E672E71756172747A2E646F6D61696E2E5379734A6F6200000000000000010200084C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C000C6D6574686F64506172616D7371007E00094C000D6D697366697265506F6C69637971007E00094C000673746174757371007E000978720022636F6D2E78696E78696E672E636F6D6D6F6E2E626173652E42617365456E7469747900000000000000010200074C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C0006706172616D7371007E00034C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A81014B59741903000078707708000001622CDE29E0787074000070707074000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC8F23DF0200014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC951D0B94E08B0200007870000000000000000274000672795461736B7400087279506172616D73740002787874000130740001317800);

-- ----------------------------
-- Table structure for `sys_config`
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-default', 'Y', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '默认 skin-default、蓝色 skin-blue、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '初始化密码 123456');

-- ----------------------------
-- Table structure for `sys_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT '' COMMENT '负责人',
  `phone` varchar(11) DEFAULT '' COMMENT '联系电话',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '新星科技', '0', '新星', '15888888888', 'xinx@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '太原总公司', '1', '新星', '13623450423', 'zhangjinhai517@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-10-13 13:49:31');
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '新星', '15888888888', 'xinx@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '新星', '15888888888', 'xinx@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '新星', '15888888888', 'xinx@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '新星', '15888888888', 'xinx@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '新星', '15888888888', 'xinx@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '新星', '15888888888', 'xinx@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00');
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '新星', '15888888888', 'xinx@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-10-13 13:52:01');
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '新星', '15888888888', 'xinx@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00');

-- ----------------------------
-- Table structure for `sys_dict_data`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT '' COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT '' COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '通知');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '公告');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '新增操作');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '修改操作');
INSERT INTO `sys_dict_data` VALUES ('18', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '删除操作');
INSERT INTO `sys_dict_data` VALUES ('19', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '授权操作');
INSERT INTO `sys_dict_data` VALUES ('20', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '导出操作');
INSERT INTO `sys_dict_data` VALUES ('21', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '导入操作');
INSERT INTO `sys_dict_data` VALUES ('22', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '强退操作');
INSERT INTO `sys_dict_data` VALUES ('23', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '生成操作');
INSERT INTO `sys_dict_data` VALUES ('24', '8', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '清空操作');
INSERT INTO `sys_dict_data` VALUES ('25', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '正常状态');
INSERT INTO `sys_dict_data` VALUES ('26', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '停用状态');

-- ----------------------------
-- Table structure for `sys_dict_type`
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('6', '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('8', '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('9', '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '登录状态列表');

-- ----------------------------
-- Table structure for `sys_job`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '0' COMMENT '计划执行错误策略（0默认 1继续 2等待 3放弃）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', 'ryTask', '系统默认（无参）', 'ryNoParams', '', '0/10 * * * * ?', '0', '1', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_job` VALUES ('2', 'ryTask', '系统默认（有参）', 'ryParams', 'xx', '0/20 * * * * ?', '0', '1', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for `sys_job_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` text COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------
INSERT INTO `sys_job_log` VALUES ('1', 'ryTask', '系统默认（无参）', 'ryNoParams', '', 'ryTask 总共耗时：4毫秒', '0', null, '2018-10-09 17:44:15');
INSERT INTO `sys_job_log` VALUES ('2', 'ryTask', '系统默认（无参）', 'ryNoParams', '', 'ryTask 总共耗时：1毫秒', '0', null, '2018-10-09 17:44:27');

-- ----------------------------
-- Table structure for `sys_logininfor`
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-08 14:44:41');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '退出成功', '2018-10-08 14:50:15');
INSERT INTO `sys_logininfor` VALUES ('102', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-08 14:50:35');
INSERT INTO `sys_logininfor` VALUES ('105', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-08 15:18:03');
INSERT INTO `sys_logininfor` VALUES ('106', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-09 13:42:16');
INSERT INTO `sys_logininfor` VALUES ('107', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '退出成功', '2018-10-09 13:56:14');
INSERT INTO `sys_logininfor` VALUES ('108', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-09 14:47:10');
INSERT INTO `sys_logininfor` VALUES ('109', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '退出成功', '2018-10-09 14:47:45');
INSERT INTO `sys_logininfor` VALUES ('110', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-09 14:47:47');
INSERT INTO `sys_logininfor` VALUES ('111', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-09 14:50:55');
INSERT INTO `sys_logininfor` VALUES ('112', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '退出成功', '2018-10-09 14:51:07');
INSERT INTO `sys_logininfor` VALUES ('113', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-09 17:08:38');
INSERT INTO `sys_logininfor` VALUES ('114', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '退出成功', '2018-10-09 17:17:35');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-09 17:17:36');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-09 17:24:07');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-13 11:45:04');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-13 11:56:09');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-13 13:36:44');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-13 13:45:26');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-15 15:06:22');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-15 15:28:37');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-15 15:32:28');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-17 14:00:37');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-17 14:21:47');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-18 09:57:43');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-19 15:07:42');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '退出成功', '2018-10-19 15:11:01');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-19 15:11:06');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-19 15:13:30');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '退出成功', '2018-10-19 15:16:14');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-19 15:16:18');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-19 15:39:23');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '退出成功', '2018-10-19 15:46:43');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-19 16:18:04');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-19 16:24:12');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-19 16:38:17');
INSERT INTO `sys_logininfor` VALUES ('138', 'admin', '127.0.0.1', 'XX XX', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-19 16:40:28');
INSERT INTO `sys_logininfor` VALUES ('139', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-21 19:51:30');
INSERT INTO `sys_logininfor` VALUES ('140', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-22 14:36:13');
INSERT INTO `sys_logininfor` VALUES ('141', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '退出成功', '2018-10-22 14:40:41');
INSERT INTO `sys_logininfor` VALUES ('142', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-22 14:45:24');
INSERT INTO `sys_logininfor` VALUES ('143', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-22 16:24:19');
INSERT INTO `sys_logininfor` VALUES ('144', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '退出成功', '2018-10-22 16:32:14');
INSERT INTO `sys_logininfor` VALUES ('145', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-22 16:49:36');
INSERT INTO `sys_logininfor` VALUES ('146', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '退出成功', '2018-10-22 16:50:28');
INSERT INTO `sys_logininfor` VALUES ('147', 'xinxin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-22 16:50:40');
INSERT INTO `sys_logininfor` VALUES ('148', 'xinxin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '退出成功', '2018-10-22 16:51:04');
INSERT INTO `sys_logininfor` VALUES ('149', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-22 16:51:26');
INSERT INTO `sys_logininfor` VALUES ('150', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-22 21:21:24');
INSERT INTO `sys_logininfor` VALUES ('151', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-29 15:58:45');
INSERT INTO `sys_logininfor` VALUES ('152', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '退出成功', '2018-10-29 15:59:53');
INSERT INTO `sys_logininfor` VALUES ('153', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-29 15:59:55');
INSERT INTO `sys_logininfor` VALUES ('154', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '退出成功', '2018-10-29 15:59:57');
INSERT INTO `sys_logininfor` VALUES ('155', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-29 15:59:58');
INSERT INTO `sys_logininfor` VALUES ('156', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '退出成功', '2018-10-29 16:00:03');
INSERT INTO `sys_logininfor` VALUES ('157', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-29 16:00:11');
INSERT INTO `sys_logininfor` VALUES ('158', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-29 16:40:35');
INSERT INTO `sys_logininfor` VALUES ('159', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-10-29 17:57:48');
INSERT INTO `sys_logininfor` VALUES ('160', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-11-02 14:52:58');
INSERT INTO `sys_logininfor` VALUES ('161', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-11-05 17:27:17');
INSERT INTO `sys_logininfor` VALUES ('162', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-11-05 20:45:30');
INSERT INTO `sys_logininfor` VALUES ('163', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-11-05 21:24:52');
INSERT INTO `sys_logininfor` VALUES ('164', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-11-06 09:34:10');
INSERT INTO `sys_logininfor` VALUES ('165', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-11-06 10:04:23');
INSERT INTO `sys_logininfor` VALUES ('166', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-11-06 10:06:13');
INSERT INTO `sys_logininfor` VALUES ('167', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-11-06 10:21:22');
INSERT INTO `sys_logininfor` VALUES ('168', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-11-06 10:34:12');
INSERT INTO `sys_logininfor` VALUES ('169', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-11-06 10:42:33');
INSERT INTO `sys_logininfor` VALUES ('170', 'admin', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', '0', '登录成功', '2018-11-06 10:54:12');

-- ----------------------------
-- Table structure for `sys_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT '' COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1056 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', '#', 'M', '0', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '系统工具目录');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-10-19 15:46:32', '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', '/system/notice', 'C', '0', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', '#', 'M', '0', '', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '表单构建', '3', '1', '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('113', '代码生成', '3', '2', '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('114', '系统接口', '3', '3', '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1005', '重置密码', '100', '5', '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1006', '角色查询', '101', '1', '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1007', '角色新增', '101', '2', '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1008', '角色修改', '101', '3', '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1009', '角色删除', '101', '4', '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1010', '角色导出', '101', '4', '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1011', '菜单查询', '102', '1', '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单新增', '102', '2', '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单修改', '102', '3', '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单删除', '102', '4', '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1015', '部门查询', '103', '1', '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1016', '部门新增', '103', '2', '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1017', '部门修改', '103', '3', '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1018', '部门删除', '103', '4', '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1019', '岗位查询', '104', '1', '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位新增', '104', '2', '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位修改', '104', '3', '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位删除', '104', '4', '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位导出', '104', '4', '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1024', '字典查询', '105', '1', '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1025', '字典新增', '105', '2', '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1026', '字典修改', '105', '3', '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1027', '字典删除', '105', '4', '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1028', '字典导出', '105', '4', '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1029', '参数查询', '106', '1', '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1030', '参数新增', '106', '2', '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1031', '参数修改', '106', '3', '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1032', '参数删除', '106', '4', '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1033', '参数导出', '106', '4', '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1034', '公告查询', '107', '1', '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1035', '公告新增', '107', '2', '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1036', '公告修改', '107', '3', '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1037', '公告删除', '107', '4', '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1038', '操作查询', '500', '1', '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1039', '操作删除', '500', '2', '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1040', '详细信息', '500', '3', '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1041', '日志导出', '500', '3', '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1042', '登录查询', '501', '1', '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1043', '登录删除', '501', '2', '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1044', '日志导出', '501', '2', '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1045', '在线查询', '109', '1', '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1046', '批量强退', '109', '2', '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1047', '单条强退', '109', '3', '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1048', '任务查询', '110', '1', '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1049', '任务新增', '110', '2', '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1050', '任务修改', '110', '3', '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1051', '任务删除', '110', '4', '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1052', '状态修改', '110', '5', '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1053', '任务导出', '110', '5', '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1054', '生成查询', '113', '1', '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_menu` VALUES ('1055', '生成代码', '113', '2', '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for `sys_notice`
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) NOT NULL COMMENT '公告标题',
  `notice_type` char(2) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` varchar(500) NOT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 新星新版本发布啦', '2', '新版本内容', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-10-22 16:57:01', '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01新星系统凌晨维护', '1', '维护内容', '0', 'admin', '2018-03-16 11:33:00', 'admin', '2018-10-22 17:03:41', '管理员');

-- ----------------------------
-- Table structure for `sys_oper_log`
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(30) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(255) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '用户管理', '5', 'com.ruoyi.web.controller.system.UserController.export()', '1', 'admin', '研发部门', '/system/user/export', '127.0.0.1', 'XX XX', '{\r\n  \"deptId\" : [ \"\" ],\r\n  \"parentId\" : [ \"\" ],\r\n  \"loginName\" : [ \"\" ],\r\n  \"phonenumber\" : [ \"\" ],\r\n  \"status\" : [ \"\" ],\r\n  \"params[beginTime]\" : [ \"\" ],\r\n  \"params[endTime]\" : [ \"\" ]\r\n}', '0', null, '2018-10-08 14:45:06');
INSERT INTO `sys_oper_log` VALUES ('101', '登陆日志', '3', 'com.ruoyi.web.controller.monitor.LogininforController.remove()', '1', 'admin', '研发部门', '/monitor/logininfor/remove', '127.0.0.1', 'XX XX', '{\r\n  \"ids\" : [ \"104,103\" ]\r\n}', '0', null, '2018-10-08 15:12:42');
INSERT INTO `sys_oper_log` VALUES ('102', '个人信息', '2', 'com.ruoyi.web.controller.system.ProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', 'XX XX', '{\r\n  \"userId\" : [ \"1\" ]\r\n}', '0', null, '2018-10-08 15:18:10');
INSERT INTO `sys_oper_log` VALUES ('103', '个人信息', '2', 'com.ruoyi.web.controller.system.ProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', 'XX XX', '{\r\n  \"userId\" : [ \"1\" ]\r\n}', '0', null, '2018-10-08 15:18:28');
INSERT INTO `sys_oper_log` VALUES ('104', '菜单管理', '1', 'com.ruoyi.web.controller.system.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', 'XX XX', '{\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"用户管理\" ],\r\n  \"url\" : [ \"\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"fa fa-address-book\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2018-10-09 17:09:36');
INSERT INTO `sys_oper_log` VALUES ('105', '菜单管理', '2', 'com.ruoyi.web.controller.system.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\r\n  \"menuId\" : [ \"1056\" ],\r\n  \"parentId\" : [ \"0\" ],\r\n  \"menuType\" : [ \"M\" ],\r\n  \"menuName\" : [ \"用户管理\" ],\r\n  \"url\" : [ \"#\" ],\r\n  \"perms\" : [ \"\" ],\r\n  \"orderNum\" : [ \"4\" ],\r\n  \"icon\" : [ \"fa fa-address-book\" ],\r\n  \"visible\" : [ \"1\" ]\r\n}', '0', null, '2018-10-09 17:10:44');
INSERT INTO `sys_oper_log` VALUES ('106', '菜单管理', '1', 'com.ruoyi.web.controller.system.MenuController.addSave()', '1', 'admin', '研发部门', '/system/menu/add', '127.0.0.1', 'XX XX', '{\r\n  \"parentId\" : [ \"1056\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"用户信息\" ],\r\n  \"url\" : [ \"444\" ],\r\n  \"perms\" : [ \"444\" ],\r\n  \"orderNum\" : [ \"55\" ],\r\n  \"icon\" : [ \"\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2018-10-09 17:11:34');
INSERT INTO `sys_oper_log` VALUES ('107', '个人信息', '2', 'com.ruoyi.web.controller.system.ProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', 'XX XX', '{\r\n  \"userId\" : [ \"1\" ]\r\n}', '0', null, '2018-10-09 17:26:10');
INSERT INTO `sys_oper_log` VALUES ('108', '部门管理', '2', 'com.ruoyi.web.controller.system.DeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', 'XX XX', '{\r\n  \"deptId\" : [ \"108\" ],\r\n  \"parentId\" : [ \"102\" ],\r\n  \"parentName\" : [ \"长沙分公司\" ],\r\n  \"deptName\" : [ \"市场部门\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"leader\" : [ \"若依\" ],\r\n  \"phone\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"status\" : [ \"1\" ]\r\n}', '0', null, '2018-10-09 17:31:25');
INSERT INTO `sys_oper_log` VALUES ('109', '用户管理', '1', 'com.ruoyi.web.controller.system.UserController.addSave()', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', 'XX XX', '{\r\n  \"deptId\" : [ \"103\" ],\r\n  \"loginName\" : [ \"zjh\" ],\r\n  \"userName\" : [ \"嗨嗨\" ],\r\n  \"password\" : [ \"123456\" ],\r\n  \"email\" : [ \"zhangjinhai517@163.com\" ],\r\n  \"phonenumber\" : [ \"13623450423\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"\" ', '0', null, '2018-10-09 17:37:17');
INSERT INTO `sys_oper_log` VALUES ('110', '用户管理', '3', 'com.ruoyi.web.controller.system.UserController.remove()', '1', 'admin', '研发部门', '/system/user/remove', '127.0.0.1', 'XX XX', '{\r\n  \"ids\" : [ \"3\" ]\r\n}', '0', null, '2018-10-09 17:39:00');
INSERT INTO `sys_oper_log` VALUES ('111', '用户管理', '3', 'com.ruoyi.web.controller.system.UserController.remove()', '1', 'admin', '研发部门', '/system/user/remove', '127.0.0.1', 'XX XX', '{\r\n  \"ids\" : [ \"1\" ]\r\n}', '0', null, '2018-10-09 17:39:20');
INSERT INTO `sys_oper_log` VALUES ('112', '定时任务', '5', 'com.ruoyi.web.controller.monitor.JobController.export()', '1', 'admin', '研发部门', '/monitor/job/export', '127.0.0.1', 'XX XX', '{\r\n  \"jobName\" : [ \"\" ],\r\n  \"methodName\" : [ \"\" ],\r\n  \"status\" : [ \"\" ]\r\n}', '0', null, '2018-10-09 17:43:13');
INSERT INTO `sys_oper_log` VALUES ('113', '定时任务', '2', 'com.ruoyi.web.controller.monitor.JobController.run()', '1', 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', 'XX XX', '{\r\n  \"jobId\" : [ \"1\" ]\r\n}', '0', null, '2018-10-09 17:44:15');
INSERT INTO `sys_oper_log` VALUES ('114', '定时任务', '2', 'com.ruoyi.web.controller.monitor.JobController.run()', '1', 'admin', '研发部门', '/monitor/job/run', '127.0.0.1', 'XX XX', '{\r\n  \"jobId\" : [ \"1\" ]\r\n}', '0', null, '2018-10-09 17:44:27');
INSERT INTO `sys_oper_log` VALUES ('115', '重置密码', '2', 'com.ruoyi.web.controller.system.UserController.resetPwd()', '1', 'admin', '研发部门', '/system/user/resetPwd/2', '127.0.0.1', 'XX XX', '{ }', '0', null, '2018-10-13 11:59:22');
INSERT INTO `sys_oper_log` VALUES ('116', '用户管理', '2', 'com.ruoyi.web.controller.system.UserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', 'XX XX', '{\r\n  \"userId\" : [ \"2\" ],\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"phonenumber\" : [ \"15666666666\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"status\" : [ \"1\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"2\" ]\r\n}', '0', null, '2018-10-13 12:00:12');
INSERT INTO `sys_oper_log` VALUES ('117', '个人信息', '2', 'com.ruoyi.web.controller.system.ProfileController.update()', '1', 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', 'XX XX', '{\r\n  \"userId\" : [ \"1\" ],\r\n  \"loginName\" : [ \"admin\" ],\r\n  \"dept.deptName\" : [ \"研发部门\" ],\r\n  \"userName\" : [ \"新星\" ],\r\n  \"email\" : [ \"zhangjinhai@163.com\" ],\r\n  \"phonenumber\" : [ \"13623450424\" ],\r\n  \"sex\" : [ \"0\" ]\r\n}', '0', null, '2018-10-13 13:46:31');
INSERT INTO `sys_oper_log` VALUES ('118', '个人信息', '2', 'com.ruoyi.web.controller.system.ProfileController.update()', '1', 'admin', '研发部门', '/system/user/profile/update', '127.0.0.1', 'XX XX', '{\r\n  \"userId\" : [ \"1\" ],\r\n  \"loginName\" : [ \"admin\" ],\r\n  \"dept.deptName\" : [ \"研发部门\" ],\r\n  \"userName\" : [ \"新星\" ],\r\n  \"email\" : [ \"zhangjinhai517@163.com\" ],\r\n  \"phonenumber\" : [ \"13623450423\" ],\r\n  \"sex\" : [ \"0\" ]\r\n}', '0', null, '2018-10-13 13:47:35');
INSERT INTO `sys_oper_log` VALUES ('119', '用户管理', '2', 'com.ruoyi.web.controller.system.UserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', 'XX XX', '{\r\n  \"userId\" : [ \"2\" ],\r\n  \"deptId\" : [ \"105\" ],\r\n  \"userName\" : [ \"若依\" ],\r\n  \"email\" : [ \"ry@qq.com\" ],\r\n  \"phonenumber\" : [ \"15666666666\" ],\r\n  \"sex\" : [ \"1\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"postIds\" : [ \"2\" ]\r\n}', '0', null, '2018-10-13 13:48:34');
INSERT INTO `sys_oper_log` VALUES ('120', '部门管理', '2', 'com.ruoyi.web.controller.system.DeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', 'XX XX', '{\r\n  \"deptId\" : [ \"101\" ],\r\n  \"parentId\" : [ \"100\" ],\r\n  \"parentName\" : [ \"若依科技\" ],\r\n  \"deptName\" : [ \"太原总公司\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"leader\" : [ \"新星\" ],\r\n  \"phone\" : [ \"13623450423\" ],\r\n  \"email\" : [ \"zhangjinhai517@qq.com\" ],\r\n  \"status\" : [ \"0\"', '0', null, '2018-10-13 13:49:31');
INSERT INTO `sys_oper_log` VALUES ('121', '部门管理', '2', 'com.ruoyi.web.controller.system.DeptController.editSave()', '1', 'admin', '研发部门', '/system/dept/edit', '127.0.0.1', 'XX XX', '{\r\n  \"deptId\" : [ \"108\" ],\r\n  \"parentId\" : [ \"102\" ],\r\n  \"parentName\" : [ \"长沙分公司\" ],\r\n  \"deptName\" : [ \"市场部门\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"leader\" : [ \"新星\" ],\r\n  \"phone\" : [ \"15888888888\" ],\r\n  \"email\" : [ \"xinx@qq.com\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '0', null, '2018-10-13 13:52:01');
INSERT INTO `sys_oper_log` VALUES ('122', '个人信息', '2', 'com.ruoyi.web.controller.system.ProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', 'XX XX', '{\r\n  \"userId\" : [ \"1\" ]\r\n}', '0', null, '2018-10-13 14:41:27');
INSERT INTO `sys_oper_log` VALUES ('123', '个人信息', '2', 'com.ruoyi.web.controller.system.ProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', 'XX XX', '{\r\n  \"userId\" : [ \"1\" ]\r\n}', '0', null, '2018-10-13 14:42:03');
INSERT INTO `sys_oper_log` VALUES ('124', '个人信息', '2', 'com.ruoyi.web.controller.system.ProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', 'XX XX', '{\r\n  \"userId\" : [ \"1\" ]\r\n}', '0', null, '2018-10-13 14:43:45');
INSERT INTO `sys_oper_log` VALUES ('125', '个人信息', '2', 'com.ruoyi.web.controller.system.ProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', 'XX XX', '{\r\n  \"userId\" : [ \"1\" ]\r\n}', '0', null, '2018-10-13 14:43:46');
INSERT INTO `sys_oper_log` VALUES ('126', '用户管理', '3', 'com.ruoyi.web.controller.system.UserController.remove()', '1', 'admin', '研发部门', '/system/user/remove', '127.0.0.1', 'XX XX', '{\r\n  \"ids\" : [ \"2\" ]\r\n}', '0', null, '2018-10-13 14:55:35');
INSERT INTO `sys_oper_log` VALUES ('127', '用户管理', '1', 'com.ruoyi.web.controller.system.UserController.addSave()', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', 'XX XX', '{\r\n  \"deptId\" : [ \"103\" ],\r\n  \"loginName\" : [ \"xinxing\" ],\r\n  \"userName\" : [ \"新星\" ],\r\n  \"password\" : [ \"123456\" ],\r\n  \"email\" : [ \"xx@163.com\" ],\r\n  \"phonenumber\" : [ \"13623450424\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"2\" ],\r\n  \"', '0', null, '2018-10-13 15:16:54');
INSERT INTO `sys_oper_log` VALUES ('128', '用户管理', '3', 'com.ruoyi.web.controller.system.UserController.remove()', '1', 'admin', '研发部门', '/system/user/remove', '127.0.0.1', 'XX XX', '{\r\n  \"ids\" : [ \"4\" ]\r\n}', '0', null, '2018-10-15 15:35:41');
INSERT INTO `sys_oper_log` VALUES ('129', '用户管理', '3', 'com.ruoyi.web.controller.system.UserController.remove()', '1', 'admin', '研发部门', '/system/user/remove', '127.0.0.1', 'XX XX', '{\r\n  \"ids\" : [ \"4\" ]\r\n}', '0', null, '2018-10-15 15:55:47');
INSERT INTO `sys_oper_log` VALUES ('130', '菜单管理', '2', 'com.ruoyi.web.controller.system.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\r\n  \"menuId\" : [ \"1057\" ],\r\n  \"parentId\" : [ \"1056\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"用户信息\" ],\r\n  \"url\" : [ \"444\" ],\r\n  \"perms\" : [ \"444\" ],\r\n  \"orderNum\" : [ \"55\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"1\" ]\r\n}', '0', null, '2018-10-15 16:07:31');
INSERT INTO `sys_oper_log` VALUES ('131', '用户管理', '1', 'com.ruoyi.web.controller.system.UserController.addSave()', '1', 'admin', '研发部门', '/system/user/add', '127.0.0.1', 'XX XX', '{\r\n  \"deptId\" : [ \"103\" ],\r\n  \"loginName\" : [ \"xinxin\" ],\r\n  \"userName\" : [ \"星星\" ],\r\n  \"password\" : [ \"123456\" ],\r\n  \"email\" : [ \"zhangjinghai@163.com\" ],\r\n  \"phonenumber\" : [ \"13623450425\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"\"', '0', null, '2018-10-17 14:05:33');
INSERT INTO `sys_oper_log` VALUES ('132', '用户管理', '5', 'com.ruoyi.web.controller.system.UserController.export()', '1', 'admin', '研发部门', '/system/user/export', '127.0.0.1', 'XX XX', '{\r\n  \"deptId\" : [ \"\" ],\r\n  \"parentId\" : [ \"\" ],\r\n  \"loginName\" : [ \"\" ],\r\n  \"phonenumber\" : [ \"\" ],\r\n  \"status\" : [ \"\" ],\r\n  \"params[beginTime]\" : [ \"\" ],\r\n  \"params[endTime]\" : [ \"\" ]\r\n}', '0', null, '2018-10-17 14:21:52');
INSERT INTO `sys_oper_log` VALUES ('133', '用户管理', '2', 'com.ruoyi.web.controller.system.UserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', 'XX XX', '{\r\n  \"userId\" : [ \"5\" ],\r\n  \"deptId\" : [ \"104\" ],\r\n  \"userName\" : [ \"星星\" ],\r\n  \"email\" : [ \"zhangjinghai@163.com\" ],\r\n  \"phonenumber\" : [ \"13623450425\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}', '0', null, '2018-10-17 14:23:59');
INSERT INTO `sys_oper_log` VALUES ('134', '个人信息', '2', 'com.xinxing.web.controller.system.ProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', 'XX XX', '{\r\n  \"userId\" : [ \"1\" ]\r\n}', '0', null, '2018-10-19 15:09:00');
INSERT INTO `sys_oper_log` VALUES ('135', '个人信息', '2', 'com.xinxing.web.controller.system.ProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', 'XX XX', '{\r\n  \"userId\" : [ \"1\" ]\r\n}', '0', null, '2018-10-19 15:09:16');
INSERT INTO `sys_oper_log` VALUES ('136', '个人信息', '2', 'com.xinxing.web.controller.system.ProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', 'XX XX', '{\r\n  \"userId\" : [ \"1\" ]\r\n}', '0', null, '2018-10-19 15:16:33');
INSERT INTO `sys_oper_log` VALUES ('137', '个人信息', '2', 'com.xinxing.web.controller.system.ProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', 'XX XX', '{\r\n  \"userId\" : [ \"1\" ]\r\n}', '0', null, '2018-10-19 15:39:43');
INSERT INTO `sys_oper_log` VALUES ('138', '菜单管理', '2', 'com.xinxing.web.controller.system.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\r\n  \"menuId\" : [ \"100\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"用户管理\" ],\r\n  \"url\" : [ \"/system/user\" ],\r\n  \"perms\" : [ \"system:user:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"1\" ]\r\n}', '0', null, '2018-10-19 15:46:01');
INSERT INTO `sys_oper_log` VALUES ('139', '菜单管理', '2', 'com.xinxing.web.controller.system.MenuController.editSave()', '1', 'admin', '研发部门', '/system/menu/edit', '127.0.0.1', 'XX XX', '{\r\n  \"menuId\" : [ \"100\" ],\r\n  \"parentId\" : [ \"1\" ],\r\n  \"menuType\" : [ \"C\" ],\r\n  \"menuName\" : [ \"用户管理\" ],\r\n  \"url\" : [ \"/system/user\" ],\r\n  \"perms\" : [ \"system:user:view\" ],\r\n  \"orderNum\" : [ \"1\" ],\r\n  \"icon\" : [ \"#\" ],\r\n  \"visible\" : [ \"0\" ]\r\n}', '0', null, '2018-10-19 15:46:32');
INSERT INTO `sys_oper_log` VALUES ('140', '在线用户', '7', 'com.xinxing.web.controller.monitor.SysUserOnlineController.batchForceLogout()', '1', 'admin', '研发部门', '/monitor/online/batchForceLogout', '127.0.0.1', '内网IP', '{\r\n  \"ids[]\" : [ \"ad6f0c02-cf04-4c47-b8bc-fc507c8d42ae\" ]\r\n}', '0', null, '2018-10-21 19:54:07');
INSERT INTO `sys_oper_log` VALUES ('141', '个人信息', '2', 'com.xinxing.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ]\r\n}', '0', null, '2018-10-22 14:45:35');
INSERT INTO `sys_oper_log` VALUES ('142', '个人信息', '2', 'com.xinxing.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ]\r\n}', '0', null, '2018-10-22 14:46:26');
INSERT INTO `sys_oper_log` VALUES ('143', '通知公告', '2', 'com.xinxing.web.controller.system.SysNoticeController.editSave()', '1', 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\r\n  \"noticeId\" : [ \"1\" ],\r\n  \"noticeTitle\" : [ \"温馨提醒：2018-07-01 新星新版本发布啦\" ],\r\n  \"noticeType\" : [ \"2\" ],\r\n  \"noticeContent\" : [ \"新版本内容<img src=\\\"data:image/jpeg;base64,iVBORw0KGgoAAAANSUhEUgAAAMYAAADGCAYAAACJm/9dAAAgAElEQVR4XuS9V5Ns15Um9qXP8t5d74ALd2EvLEE', '1', '\r\n### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'notice_content\' at row 1\r\n### The error may involve com.xinxing.system.mapper.SysNoticeMapper.updateNotice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_notice           SET notice_title = ?,              notice_type = ?,              notice_content = ?,              status = ?,              update_by = ?,     update_time = sysdate()          where notice_id = ?\r\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'notice_content\' at row 1\n; ]; Data truncation: Data too long for column \'notice_content\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'notice_content\' at row 1', '2018-10-22 16:55:01');
INSERT INTO `sys_oper_log` VALUES ('144', '通知公告', '2', 'com.xinxing.web.controller.system.SysNoticeController.editSave()', '1', 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\r\n  \"noticeId\" : [ \"1\" ],\r\n  \"noticeTitle\" : [ \"温馨提醒：2018-07-01 新星新版本发布啦\" ],\r\n  \"noticeType\" : [ \"2\" ],\r\n  \"noticeContent\" : [ \"新版本内容\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '0', null, '2018-10-22 16:57:01');
INSERT INTO `sys_oper_log` VALUES ('145', '通知公告', '2', 'com.xinxing.web.controller.system.SysNoticeController.editSave()', '1', 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\r\n  \"noticeId\" : [ \"2\" ],\r\n  \"noticeTitle\" : [ \"维护通知：2018-07-01新星系统凌晨维护\" ],\r\n  \"noticeType\" : [ \"1\" ],\r\n  \"noticeContent\" : [ \"维护内容<img src=\\\"data:image/jpeg;base64,iVBORw0KGgoAAAANSUhEUgAAAMYAAADGCAYAAACJm/9dAAAgAElEQVR4Xuy9B5xkZZU+/NxcseN0mJ5hEsMwSA6ii', '1', '\r\n### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'notice_content\' at row 1\r\n### The error may involve com.xinxing.system.mapper.SysNoticeMapper.updateNotice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_notice           SET notice_title = ?,              notice_type = ?,              notice_content = ?,              status = ?,              update_by = ?,     update_time = sysdate()          where notice_id = ?\r\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'notice_content\' at row 1\n; ]; Data truncation: Data too long for column \'notice_content\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'notice_content\' at row 1', '2018-10-22 16:57:25');
INSERT INTO `sys_oper_log` VALUES ('146', '通知公告', '2', 'com.xinxing.web.controller.system.SysNoticeController.editSave()', '1', 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\r\n  \"noticeId\" : [ \"2\" ],\r\n  \"noticeTitle\" : [ \"维护通知：2018-07-01新星系统凌晨维护\" ],\r\n  \"noticeType\" : [ \"1\" ],\r\n  \"noticeContent\" : [ \"维护内容<img src=\\\"data:image/jpeg;base64,iVBORw0KGgoAAAANSUhEUgAAAMYAAADGCAYAAACJm/9dAAAgAElEQVR4Xuy9B5xkZZU+/NxcseN0mJ5hEsMwSA6ii', '1', '\r\n### Error updating database.  Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'notice_content\' at row 1\r\n### The error may involve com.xinxing.system.mapper.SysNoticeMapper.updateNotice-Inline\r\n### The error occurred while setting parameters\r\n### SQL: update sys_notice           SET notice_title = ?,              notice_type = ?,              notice_content = ?,              status = ?,              update_by = ?,     update_time = sysdate()          where notice_id = ?\r\n### Cause: com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'notice_content\' at row 1\n; ]; Data truncation: Data too long for column \'notice_content\' at row 1; nested exception is com.mysql.jdbc.MysqlDataTruncation: Data truncation: Data too long for column \'notice_content\' at row 1', '2018-10-22 16:58:07');
INSERT INTO `sys_oper_log` VALUES ('147', '通知公告', '2', 'com.xinxing.web.controller.system.SysNoticeController.editSave()', '1', 'admin', '研发部门', '/system/notice/edit', '127.0.0.1', '内网IP', '{\r\n  \"noticeId\" : [ \"2\" ],\r\n  \"noticeTitle\" : [ \"维护通知：2018-07-01新星系统凌晨维护\" ],\r\n  \"noticeType\" : [ \"1\" ],\r\n  \"noticeContent\" : [ \"维护内容\" ],\r\n  \"status\" : [ \"0\" ]\r\n}', '0', null, '2018-10-22 17:03:41');
INSERT INTO `sys_oper_log` VALUES ('148', '参数管理', '5', 'com.xinxing.web.controller.system.SysConfigController.export()', '1', 'admin', '研发部门', '/system/config/export', '127.0.0.1', '内网IP', '{\r\n  \"configName\" : [ \"\" ],\r\n  \"configKey\" : [ \"\" ],\r\n  \"configType\" : [ \"\" ],\r\n  \"params[beginTime]\" : [ \"\" ],\r\n  \"params[endTime]\" : [ \"\" ]\r\n}', '0', null, '2018-10-29 17:30:16');
INSERT INTO `sys_oper_log` VALUES ('149', '个人信息', '2', 'com.xinxing.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ]\r\n}', '0', null, '2018-11-02 14:53:33');
INSERT INTO `sys_oper_log` VALUES ('150', '个人信息', '2', 'com.xinxing.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ]\r\n}', '0', null, '2018-11-05 17:29:18');
INSERT INTO `sys_oper_log` VALUES ('151', '个人信息', '2', 'com.xinxing.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ]\r\n}', '0', null, '2018-11-05 17:29:44');
INSERT INTO `sys_oper_log` VALUES ('152', '个人信息', '2', 'com.xinxing.web.controller.system.SysProfileController.updateAvatar()', '1', 'admin', '研发部门', '/system/user/profile/updateAvatar', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"1\" ]\r\n}', '0', null, '2018-11-05 17:30:05');
INSERT INTO `sys_oper_log` VALUES ('153', '用户管理', '2', 'com.xinxing.web.controller.system.SysUserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"5\" ],\r\n  \"deptId\" : [ \"104\" ],\r\n  \"userName\" : [ \"星星\" ],\r\n  \"email\" : [ \"zhangjinghai517@163.com\" ],\r\n  \"phonenumber\" : [ \"13623450425\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}', '0', null, '2018-11-05 17:39:01');
INSERT INTO `sys_oper_log` VALUES ('154', '用户管理', '2', 'com.xinxing.web.controller.system.SysUserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"5\" ],\r\n  \"deptId\" : [ \"104\" ],\r\n  \"userName\" : [ \"星星\" ],\r\n  \"email\" : [ \"zhangjinghai@163.com\" ],\r\n  \"phonenumber\" : [ \"13623450425\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}', '0', null, '2018-11-05 17:39:27');
INSERT INTO `sys_oper_log` VALUES ('155', '用户管理', '2', 'com.xinxing.web.controller.system.SysUserController.editSave()', '1', 'admin', '研发部门', '/system/user/edit', '127.0.0.1', '内网IP', '{\r\n  \"userId\" : [ \"5\" ],\r\n  \"deptId\" : [ \"104\" ],\r\n  \"userName\" : [ \"星星\" ],\r\n  \"email\" : [ \"zhangjinghai@163.com\" ],\r\n  \"phonenumber\" : [ \"13623450425\" ],\r\n  \"sex\" : [ \"0\" ],\r\n  \"status\" : [ \"0\" ],\r\n  \"roleIds\" : [ \"\" ],\r\n  \"postIds\" : [ \"\" ]\r\n}', '0', null, '2018-11-05 17:39:27');
INSERT INTO `sys_oper_log` VALUES ('156', '重置密码', '2', 'com.xinxing.web.controller.system.SysUserController.resetPwd()', '1', 'admin', '研发部门', '/system/user/resetPwd/5', '127.0.0.1', '内网IP', '{ }', '0', null, '2018-11-05 20:45:55');
INSERT INTO `sys_oper_log` VALUES ('157', '重置密码', '2', 'com.xinxing.web.controller.system.SysUserController.resetPwd()', '1', 'admin', '研发部门', '/system/user/resetPwd/1', '127.0.0.1', '内网IP', '{ }', '0', null, '2018-11-05 20:46:51');
INSERT INTO `sys_oper_log` VALUES ('158', '重置密码', '2', 'com.xinxing.web.controller.system.SysUserController.resetPwd()', '1', 'admin', '研发部门', '/system/user/resetPwd/5', '127.0.0.1', '内网IP', '{ }', '0', null, '2018-11-05 20:50:15');
INSERT INTO `sys_oper_log` VALUES ('159', '重置密码', '2', 'com.xinxing.web.controller.system.SysUserController.resetPwd()', '1', 'admin', '研发部门', '/system/user/resetPwd/5', '127.0.0.1', '内网IP', '{ }', '0', null, '2018-11-05 20:50:59');

-- ----------------------------
-- Table structure for `sys_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '');

-- ----------------------------
-- Table structure for `sys_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '管理员', 'admin', '1', '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'xx', '2018-03-16 11:33:00', '普通角色');

-- ----------------------------
-- Table structure for `sys_role_dept`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `dept_id` int(11) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for `sys_role_menu`
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '2');
INSERT INTO `sys_role_menu` VALUES ('2', '3');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '109');
INSERT INTO `sys_role_menu` VALUES ('2', '110');
INSERT INTO `sys_role_menu` VALUES ('2', '111');
INSERT INTO `sys_role_menu` VALUES ('2', '112');
INSERT INTO `sys_role_menu` VALUES ('2', '113');
INSERT INTO `sys_role_menu` VALUES ('2', '114');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');
INSERT INTO `sys_role_menu` VALUES ('2', '1046');
INSERT INTO `sys_role_menu` VALUES ('2', '1047');
INSERT INTO `sys_role_menu` VALUES ('2', '1048');
INSERT INTO `sys_role_menu` VALUES ('2', '1049');
INSERT INTO `sys_role_menu` VALUES ('2', '1050');
INSERT INTO `sys_role_menu` VALUES ('2', '1051');
INSERT INTO `sys_role_menu` VALUES ('2', '1052');
INSERT INTO `sys_role_menu` VALUES ('2', '1053');
INSERT INTO `sys_role_menu` VALUES ('2', '1054');
INSERT INTO `sys_role_menu` VALUES ('2', '1055');

-- ----------------------------
-- Table structure for `sys_user`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(20) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '新星', '00', 'zhangjinhai517@163.com', '13623450423', '0', '66a2aa0da75bcfa79b27d70639f47c31.jpg', '29c67a30398638269fe600f73a054934', '111111', '0', '0', '127.0.0.1', '2018-11-06 10:54:13', 'admin', '2018-03-16 11:33:00', 'xx', '2018-11-06 10:54:12', '管理员');
INSERT INTO `sys_user` VALUES ('4', '103', 'xinxing', '新星', '00', 'xx@163.com', '13623450424', '0', '', 'e81a5ba4cdcf09f46a3ba22e98e68141', '4243e5', '0', '2', '', null, 'admin', '2018-10-13 15:16:54', '', null, '');
INSERT INTO `sys_user` VALUES ('5', '104', 'xinxin', '星星', '00', 'zhangjinghai@163.com', '13623450425', '0', '', '3389e8738008f89215f01a8c3a0a4fa5', '129a25', '0', '0', '127.0.0.1', '2018-10-22 16:50:40', 'admin', '2018-10-17 14:05:33', 'admin', '2018-11-05 17:39:27', '');

-- ----------------------------
-- Table structure for `sys_user_online`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- ----------------------------
-- Records of sys_user_online
-- ----------------------------
INSERT INTO `sys_user_online` VALUES ('5f4b8fb1-cb96-4f4a-86c2-ba2c77e28921', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', 'on_line', '2018-11-06 10:42:31', '2018-11-06 10:42:34', '1800000');
INSERT INTO `sys_user_online` VALUES ('69b6e7e5-ccd6-4110-9170-150c37a23f77', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', 'on_line', '2018-11-06 10:18:44', '2018-11-06 10:33:24', '1800000');
INSERT INTO `sys_user_online` VALUES ('d9203cf9-eb06-47b3-a7ba-9603f2d95688', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', 'on_line', '2018-11-06 10:54:09', '2018-11-06 10:57:28', '1800000');
INSERT INTO `sys_user_online` VALUES ('f4a9c568-b071-43fd-81e8-f6e183dad7a5', 'admin', '研发部门', '127.0.0.1', '内网IP', 'Chrome 49', 'Windows 7', 'on_line', '2018-11-06 10:34:10', '2018-11-06 10:34:13', '1800000');

-- ----------------------------
-- Table structure for `sys_user_post`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `post_id` int(11) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');
INSERT INTO `sys_user_post` VALUES ('4', '2');

-- ----------------------------
-- Table structure for `sys_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');
INSERT INTO `sys_user_role` VALUES ('4', '2');
