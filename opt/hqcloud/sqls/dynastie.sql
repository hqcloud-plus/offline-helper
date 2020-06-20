
-- 授权
grant all privileges on *.* to 'root'@'%' identified by 'multifort' with grant option;
flush privileges;
-- 创建osms数据库
create database `dynastie_iams` default character set utf8 collate utf8_general_ci;
-- 创建iams数据库
create database `dynastie_osms` default character set utf8 collate utf8_general_ci;
-- 创建keycloak数据库
create database `keycloak` default character set utf8 collate utf8_general_ci;
-- 创建usms数据库
create database `dynastie_usms` default character set utf8 collate utf8_general_ci;
use dynastie_osms;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;
-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `content` longtext,
  `creator_id` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of activity
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for audit_log
-- ----------------------------
DROP TABLE IF EXISTS `audit_log`;
CREATE TABLE `audit_log` (
  `id` varchar(64) NOT NULL,
  `object` varchar(128) DEFAULT NULL COMMENT '操作对象',
  `action` varchar(128) DEFAULT NULL COMMENT '行为',
  `result` varchar(255) DEFAULT NULL COMMENT '结果',
  `user_id` bigint(20) DEFAULT NULL COMMENT '操作者id',
  `response_ip` varchar(16) DEFAULT NULL COMMENT '操作者名称',
  `request_ip` varchar(32) DEFAULT NULL COMMENT 'ip',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `detail` text,
  `module` varchar(32) DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of audit_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for authority
-- ----------------------------
DROP TABLE IF EXISTS `authority`;
CREATE TABLE `authority` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `name` varchar(64) NOT NULL COMMENT '权限名称',
  `icon` varchar(64) DEFAULT NULL COMMENT '权限图标',
  `action_url` varchar(64) DEFAULT NULL COMMENT '权限路径',
  `status` varchar(16) DEFAULT NULL COMMENT '状态',
  `is_deleted` tinyint(1) NOT NULL COMMENT '是否删除',
  `priority` int(4) DEFAULT NULL,
  `parent_id` bigint(20) DEFAULT NULL COMMENT '上级节点',
  `props` varchar(1024) DEFAULT NULL COMMENT '编码',
  `remark` varchar(256) DEFAULT NULL COMMENT '描述',
  `category` varchar(20) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `creater_id` bigint(20) NOT NULL COMMENT '创建者ID',
  `mender_id` bigint(20) DEFAULT NULL COMMENT '修改者ID',
  `dept_id` bigint(20) DEFAULT NULL,
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of authority
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for basedata_price
-- ----------------------------
DROP TABLE IF EXISTS `basedata_price`;
CREATE TABLE `basedata_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `type` int(8) unsigned DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of basedata_price
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cloud_bill
-- ----------------------------
DROP TABLE IF EXISTS `cloud_bill`;
CREATE TABLE `cloud_bill` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) NOT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `bill_start` datetime DEFAULT NULL,
  `bill_stop` datetime DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloud_bill
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cloud_parameters
-- ----------------------------
DROP TABLE IF EXISTS `cloud_parameters`;
CREATE TABLE `cloud_parameters` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `service_id` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `aut_method` varchar(255) DEFAULT NULL,
  `request_type` varchar(255) DEFAULT NULL,
  `protocol` varchar(255) DEFAULT NULL,
  `request_ath` varchar(255) DEFAULT NULL,
  `http_method` varchar(255) DEFAULT NULL,
  `para_model` varchar(255) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `unit` varchar(64) DEFAULT NULL,
  `is_publish` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloud_parameters
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cloud_parameters_par
-- ----------------------------
DROP TABLE IF EXISTS `cloud_parameters_par`;
CREATE TABLE `cloud_parameters_par` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `param_name` varchar(255) DEFAULT NULL,
  `param_position` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `is_required` tinyint(1) DEFAULT NULL,
  `defaultval` varchar(255) DEFAULT NULL,
  `check_rule` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `param_id` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloud_parameters_par
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cloud_resource
-- ----------------------------
DROP TABLE IF EXISTS `cloud_resource`;
CREATE TABLE `cloud_resource` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=124 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloud_resource
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cloud_service
-- ----------------------------
DROP TABLE IF EXISTS `cloud_service`;
CREATE TABLE `cloud_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `keyword` varchar(32) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloud_service
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cloud_service_rss
-- ----------------------------
DROP TABLE IF EXISTS `cloud_service_rss`;
CREATE TABLE `cloud_service_rss` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `service_id` bigint(20) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `sku_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `expire_time` datetime DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloud_service_rss
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cloud_service_sku
-- ----------------------------
DROP TABLE IF EXISTS `cloud_service_sku`;
CREATE TABLE `cloud_service_sku` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` int(30) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `catalog_id` bigint(20) DEFAULT NULL,
  `service_id` bigint(20) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `cpu_cores` varchar(255) DEFAULT NULL,
  `memory` varchar(255) DEFAULT NULL,
  `storage` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=268 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloud_service_sku
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cloud_sku_price
-- ----------------------------
DROP TABLE IF EXISTS `cloud_sku_price`;
CREATE TABLE `cloud_sku_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `charge_period` varchar(20) DEFAULT NULL,
  `charge_mode` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloud_sku_price
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for cloud_sku_spec
-- ----------------------------
DROP TABLE IF EXISTS `cloud_sku_spec`;
CREATE TABLE `cloud_sku_spec` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `param_key` varchar(255) DEFAULT NULL,
  `param_value` varchar(255) DEFAULT NULL,
  `editable` tinyint(1) DEFAULT NULL,
  `sku_id` bigint(20) DEFAULT NULL,
  `spec_id` bigint(20) DEFAULT NULL,
  `clazz` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2205 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cloud_sku_spec
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for consume_record
-- ----------------------------
DROP TABLE IF EXISTS `consume_record`;
CREATE TABLE `consume_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `bill_id` bigint(20) DEFAULT NULL,
  `item_id` bigint(20) NOT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `charge_mode` varchar(32) DEFAULT NULL,
  `resource_uuid` varchar(255) DEFAULT NULL,
  `resource_name` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `consume_start` datetime DEFAULT NULL,
  `consume_stop` datetime DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of consume_record
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for dataCenter
-- ----------------------------
DROP TABLE IF EXISTS `dataCenter`;
CREATE TABLE `dataCenter` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(128) NOT NULL COMMENT '应用名称',
  `status` varchar(16) NOT NULL COMMENT '状态（0 未部署，1 部署中，2 运行，3 异常）',
  `props` varchar(1024) DEFAULT NULL COMMENT '其他属性',
  `remark` varchar(256) DEFAULT NULL COMMENT '描述',
  `creater_id` bigint(20) NOT NULL COMMENT '创建者ID',
  `owner_id` bigint(20) DEFAULT NULL COMMENT '所有者ID',
  `mender_id` bigint(20) DEFAULT NULL COMMENT '修改者ID',
  `gmt_create` datetime NOT NULL COMMENT '创建时间',
  `gmt_modify` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of dataCenter
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `content` longtext,
  `receiver_id` bigint(20) DEFAULT NULL,
  `creator_id` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for operating_record
-- ----------------------------
DROP TABLE IF EXISTS `operating_record`;
CREATE TABLE `operating_record` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` bigint(20) DEFAULT NULL COMMENT '订单id',
  `instance_no` bigint(32) DEFAULT NULL COMMENT '审批单号',
  `action` varchar(128) DEFAULT NULL COMMENT '行为',
  `result` varchar(255) DEFAULT NULL COMMENT '结果',
  `user_id` bigint(20) DEFAULT NULL COMMENT '操作者id',
  `user_name` varchar(16) DEFAULT NULL COMMENT '操作者名称',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `tenant_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of operating_record
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `category` varchar(32) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `sku_id` bigint(20) DEFAULT NULL,
  `params` text,
  `amount` int(10) DEFAULT '1',
  `basic_price` decimal(10,2) DEFAULT NULL,
  `final_price` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `pay_mode` varchar(255) DEFAULT NULL,
  `charge_status` varchar(16) DEFAULT NULL,
  `resource_uuid` varchar(255) DEFAULT NULL,
  `resource_name` varchar(255) DEFAULT NULL,
  `resource_status` varchar(32) DEFAULT NULL,
  `duration` int(20) DEFAULT NULL,
  `effect_time` datetime DEFAULT NULL,
  `expire_time` datetime DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `platform_params` varchar(1024) DEFAULT NULL,
  `gmt_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1013 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_item
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for process_approval
-- ----------------------------
DROP TABLE IF EXISTS `process_approval`;
CREATE TABLE `process_approval` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `instance_no` bigint(32) NOT NULL COMMENT '实例编号',
  `title` varchar(32) DEFAULT NULL COMMENT '标题',
  `stage` int(32) NOT NULL COMMENT '阶段',
  `urge_num` int(2) NOT NULL COMMENT '催办次数',
  `is_deleted` tinyint(1) NOT NULL COMMENT '是否终止',
  `tenant_id` bigint(20) NOT NULL COMMENT '租户id',
  `user_id` bigint(20) NOT NULL COMMENT '用户id',
  `order_id` bigint(20) NOT NULL COMMENT '订单id',
  `gmt_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gmt_modify` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

-- ----------------------------
-- Records of process_approval
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for resource_charge_task
-- ----------------------------
DROP TABLE IF EXISTS `resource_charge_task`;
CREATE TABLE `resource_charge_task` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `amount` int(10) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `sku_id` bigint(20) NOT NULL,
  `basic_price` decimal(10,2) DEFAULT NULL,
  `final_price` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `resource_uuid` varchar(255) DEFAULT NULL,
  `resource_name` varchar(255) DEFAULT NULL,
  `resource_status` varchar(32) DEFAULT NULL,
  `effect_time` datetime DEFAULT NULL,
  `expire_time` datetime DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL,
  `period` varchar(255) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `gmt_modify` datetime DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `category` varchar(32) DEFAULT NULL,
  `sku_accurate` tinyint(1) DEFAULT NULL,
  `sku_set` text,
  `sku_fee` text,
  `duration` int(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource_charge_task
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for resource_operation
-- ----------------------------
DROP TABLE IF EXISTS `resource_operation`;
CREATE TABLE `resource_operation` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `resource_id` bigint(20) DEFAULT NULL,
  `operation` varchar(64) DEFAULT NULL,
  `protocol` varchar(128) DEFAULT NULL,
  `timeout` bigint(20) DEFAULT NULL,
  `template` longtext,
  `output_type` varchar(32) DEFAULT NULL,
  `output_params` varchar(255) DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=257 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource_operation
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for resource_order
-- ----------------------------
DROP TABLE IF EXISTS `resource_order`;
CREATE TABLE `resource_order` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `sn` varchar(255) DEFAULT NULL,
  `catalog` varchar(64) DEFAULT NULL,
  `pay_mode` varchar(32) DEFAULT NULL,
  `charge_status` varchar(32) DEFAULT NULL,
  `amount` decimal(10,0) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `org_id` bigint(20) DEFAULT NULL,
  `tenant_id` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `order_status` int(10) DEFAULT NULL,
  `gmt_modify` datetime DEFAULT NULL,
  `if_approval` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1022 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource_order
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for resource_price
-- ----------------------------
DROP TABLE IF EXISTS `resource_price`;
CREATE TABLE `resource_price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `attribute_id` bigint(20) DEFAULT NULL,
  `attribute_name` varchar(255) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `unit` varchar(64) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource_price
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for resource_spec
-- ----------------------------
DROP TABLE IF EXISTS `resource_spec`;
CREATE TABLE `resource_spec` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `param_key` varchar(255) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `operation_id` bigint(20) DEFAULT NULL,
  `editable` tinyint(1) DEFAULT NULL,
  `clazz` varchar(64) DEFAULT NULL,
  `scope` varchar(128) DEFAULT NULL,
  `length` int(10) DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `default_value` varchar(255) DEFAULT NULL,
  `reserved` tinyint(1) DEFAULT NULL,
  `constraints` varchar(255) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1768 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of resource_spec
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for service_catalog
-- ----------------------------
DROP TABLE IF EXISTS `service_catalog`;
CREATE TABLE `service_catalog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `icon` longtext,
  `parent_id` bigint(20) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=224 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service_catalog
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for service_entry
-- ----------------------------
DROP TABLE IF EXISTS `service_entry`;
CREATE TABLE `service_entry` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `service_id` bigint(20) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `protocol` varchar(32) DEFAULT NULL,
  `host` varchar(64) DEFAULT NULL,
  `port` int(6) DEFAULT NULL,
  `root` varchar(255) DEFAULT NULL,
  `is_auth_required` tinyint(1) DEFAULT NULL,
  `api_version` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of service_entry
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `sku_id` bigint(20) DEFAULT NULL,
  `content` text,
  `params` longtext,
  `duration` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `amount` bigint(20) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_modify` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for sku_price_item
-- ----------------------------
DROP TABLE IF EXISTS `sku_price_item`;
CREATE TABLE `sku_price_item` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sku_id` bigint(20) DEFAULT NULL,
  `spec_id` bigint(20) DEFAULT NULL,
  `price_id` bigint(20) DEFAULT NULL,
  `source` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=491 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sku_price_item
-- ----------------------------
BEGIN;
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
