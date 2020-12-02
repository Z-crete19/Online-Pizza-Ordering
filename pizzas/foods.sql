-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3308
-- Generation Time: Dec 02, 2020 at 02:14 PM
-- Server version: 5.7.24
-- PHP Version: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `foods`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add burger model', 1, 'add_burgermodel'),
(2, 'Can change burger model', 1, 'change_burgermodel'),
(3, 'Can delete burger model', 1, 'delete_burgermodel'),
(4, 'Can view burger model', 1, 'view_burgermodel'),
(5, 'Can add customer model', 2, 'add_customermodel'),
(6, 'Can change customer model', 2, 'change_customermodel'),
(7, 'Can delete customer model', 2, 'delete_customermodel'),
(8, 'Can view customer model', 2, 'view_customermodel'),
(9, 'Can add ordered item', 3, 'add_ordereditem'),
(10, 'Can change ordered item', 3, 'change_ordereditem'),
(11, 'Can delete ordered item', 3, 'delete_ordereditem'),
(12, 'Can view ordered item', 3, 'view_ordereditem'),
(13, 'Can add pasta model', 4, 'add_pastamodel'),
(14, 'Can change pasta model', 4, 'change_pastamodel'),
(15, 'Can delete pasta model', 4, 'delete_pastamodel'),
(16, 'Can view pasta model', 4, 'view_pastamodel'),
(17, 'Can add pay model', 5, 'add_paymodel'),
(18, 'Can change pay model', 5, 'change_paymodel'),
(19, 'Can delete pay model', 5, 'delete_paymodel'),
(20, 'Can view pay model', 5, 'view_paymodel'),
(21, 'Can add pizza model', 6, 'add_pizzamodel'),
(22, 'Can change pizza model', 6, 'change_pizzamodel'),
(23, 'Can delete pizza model', 6, 'delete_pizzamodel'),
(24, 'Can view pizza model', 6, 'view_pizzamodel'),
(25, 'Can add soft drinks', 7, 'add_softdrinks'),
(26, 'Can change soft drinks', 7, 'change_softdrinks'),
(27, 'Can delete soft drinks', 7, 'delete_softdrinks'),
(28, 'Can view soft drinks', 7, 'view_softdrinks'),
(29, 'Can add order model', 8, 'add_ordermodel'),
(30, 'Can change order model', 8, 'change_ordermodel'),
(31, 'Can delete order model', 8, 'delete_ordermodel'),
(32, 'Can view order model', 8, 'view_ordermodel'),
(33, 'Can add log entry', 9, 'add_logentry'),
(34, 'Can change log entry', 9, 'change_logentry'),
(35, 'Can delete log entry', 9, 'delete_logentry'),
(36, 'Can view log entry', 9, 'view_logentry'),
(37, 'Can add permission', 10, 'add_permission'),
(38, 'Can change permission', 10, 'change_permission'),
(39, 'Can delete permission', 10, 'delete_permission'),
(40, 'Can view permission', 10, 'view_permission'),
(41, 'Can add group', 11, 'add_group'),
(42, 'Can change group', 11, 'change_group'),
(43, 'Can delete group', 11, 'delete_group'),
(44, 'Can view group', 11, 'view_group'),
(45, 'Can add user', 12, 'add_user'),
(46, 'Can change user', 12, 'change_user'),
(47, 'Can delete user', 12, 'delete_user'),
(48, 'Can view user', 12, 'view_user'),
(49, 'Can add content type', 13, 'add_contenttype'),
(50, 'Can change content type', 13, 'change_contenttype'),
(51, 'Can delete content type', 13, 'delete_contenttype'),
(52, 'Can view content type', 13, 'view_contenttype'),
(53, 'Can add session', 14, 'add_session'),
(54, 'Can change session', 14, 'change_session'),
(55, 'Can delete session', 14, 'delete_session'),
(56, 'Can view session', 14, 'view_session'),
(57, 'Can add feedback', 15, 'add_feedback'),
(58, 'Can change feedback', 15, 'change_feedback'),
(59, 'Can delete feedback', 15, 'delete_feedback'),
(60, 'Can view feedback', 15, 'view_feedback');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$180000$mIuihUGMImxp$qPSoTuJnWu3Smlo4OS8UsP6ITDV90tsElze9n67zA9k=', '2020-12-02 13:43:39.479837', 1, 'avijit', '', '', 'avijitbkshi85@gmail.com', 1, 1, '2020-09-14 06:44:36.573827'),
(2, 'pbkdf2_sha256$180000$mKERlyNpI6Ki$QzenTWJv1od4rlf6A7mb/jULKH0hMBaQiiQZwztPAuI=', '2020-11-29 16:13:55.213556', 0, 'User1', 'add', 'bcc', 'abc@gmail.com', 0, 1, '2020-09-14 13:26:50.459446'),
(6, 'pbkdf2_sha256$180000$ze7uvxOaPAY7$DHTvBXzCfkC57ul0gOSplajm1amr2j2eBYGz62yWe+I=', '2020-10-30 07:39:03.771737', 0, 'User2', 'Aditya', 'Paul', 'asd@yahoo.com', 0, 1, '2020-10-24 06:04:31.900645'),
(7, 'pbkdf2_sha256$180000$rM7sWBSPNCn3$zzy8TCPb7K5zDtUVrrPDgbwCehg0f8GaJuFMwFuXaVA=', '2020-12-01 15:26:02.612071', 0, 'User3', 'Sunny', 'Das', 'avijitbk2016@gmail.com', 0, 1, '2020-12-01 15:22:49.973673');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2020-09-14 06:51:33.366171', '1', 'Italian Pizza', 1, '[{\"added\": {}}]', 6, 1),
(2, '2020-09-14 06:54:47.409587', '2', 'Veggie Paradise', 1, '[{\"added\": {}}]', 6, 1),
(3, '2020-09-14 06:56:46.317788', '3', 'Chicken Pepperoni', 1, '[{\"added\": {}}]', 6, 1),
(4, '2020-09-14 06:58:59.036475', '4', 'Margherita', 1, '[{\"added\": {}}]', 6, 1),
(5, '2020-09-14 07:01:30.971608', '5', 'Paneer Makhani', 1, '[{\"added\": {}}]', 6, 1),
(6, '2020-09-14 07:03:14.551044', '6', 'Non Veg Loaded', 1, '[{\"added\": {}}]', 6, 1),
(7, '2020-09-14 07:05:39.652249', '7', 'Non Veg Zingy Parcel', 1, '[{\"added\": {}}]', 6, 1),
(8, '2020-09-14 07:07:35.755640', '8', 'Chicken Fiesta', 1, '[{\"added\": {}}]', 6, 1),
(9, '2020-09-14 07:09:57.630568', '9', 'Mexican Green Wave', 1, '[{\"added\": {}}]', 6, 1),
(10, '2020-09-14 07:15:23.216774', '1', 'Spicy Chicken Double Patty Burger', 1, '[{\"added\": {}}]', 1, 1),
(11, '2020-09-14 07:17:38.946445', '2', 'Mexican AlooTikki Burger', 1, '[{\"added\": {}}]', 1, 1),
(12, '2020-09-14 07:20:36.534485', '3', 'Spicy Paneer Burger', 1, '[{\"added\": {}}]', 1, 1),
(13, '2020-09-14 07:22:20.526143', '4', 'Filet-O-Fish Burger', 1, '[{\"added\": {}}]', 1, 1),
(14, '2020-09-14 07:25:21.579721', '1', 'Moroccan Spice Pasta Non Veg', 1, '[{\"added\": {}}]', 4, 1),
(15, '2020-09-14 07:27:19.809659', '2', 'White Pasta Italiano Veg', 1, '[{\"added\": {}}]', 4, 1),
(16, '2020-09-14 07:29:56.280400', '3', 'Cheesy Jalapeno Pasta Veg', 1, '[{\"added\": {}}]', 4, 1),
(17, '2020-09-14 07:31:16.148003', '4', 'Creamy Tomato Pasta Pizza Veg', 1, '[{\"added\": {}}]', 4, 1),
(18, '2020-09-14 07:33:05.246531', '1', 'Bailley premium Water (500ml)', 1, '[{\"added\": {}}]', 7, 1),
(19, '2020-09-14 07:34:42.291084', '2', 'Pepsi (500ml)', 1, '[{\"added\": {}}]', 7, 1),
(20, '2020-09-14 07:36:05.249445', '3', 'Strawberry Juice', 1, '[{\"added\": {}}]', 7, 1),
(21, '2020-09-14 07:37:43.866013', '4', 'Lemonade Juice', 1, '[{\"added\": {}}]', 7, 1),
(22, '2020-09-14 07:39:31.705907', '5', 'Chocolate Milkshake', 1, '[{\"added\": {}}]', 7, 1),
(23, '2020-10-01 07:27:58.768461', '5', 'Non Veg Zingy Parcel of Category Pizza', 3, '', 3, 1),
(24, '2020-10-23 14:34:03.266841', '3', 'User2', 3, '', 12, 1),
(25, '2020-10-23 14:37:48.138493', '2', '976543239', 3, '', 2, 1),
(26, '2020-10-23 15:11:00.939381', '4', 'User2', 3, '', 12, 1),
(27, '2020-10-24 06:02:00.494083', '5', 'User2', 3, '', 12, 1),
(28, '2020-10-24 06:02:40.587049', '3', 'null', 3, '', 2, 1),
(29, '2020-10-30 07:34:47.650404', '1', 'User1', 2, '[{\"changed\": {\"fields\": [\"Username\"]}}]', 2, 1),
(30, '2020-11-10 15:19:31.731695', '7', 'OrderModel object (7)', 3, '', 8, 1),
(31, '2020-11-10 15:21:33.289901', '7', 'White Pasta Italiano Veg of Category Pasta', 3, '', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'pepperonizza', 'burgermodel'),
(2, 'pepperonizza', 'customermodel'),
(3, 'pepperonizza', 'ordereditem'),
(4, 'pepperonizza', 'pastamodel'),
(5, 'pepperonizza', 'paymodel'),
(6, 'pepperonizza', 'pizzamodel'),
(7, 'pepperonizza', 'softdrinks'),
(8, 'pepperonizza', 'ordermodel'),
(9, 'admin', 'logentry'),
(10, 'auth', 'permission'),
(11, 'auth', 'group'),
(12, 'auth', 'user'),
(13, 'contenttypes', 'contenttype'),
(14, 'sessions', 'session'),
(15, 'pepperonizza', 'feedback');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-09-14 06:37:32.507917'),
(2, 'auth', '0001_initial', '2020-09-14 06:37:33.573239'),
(3, 'admin', '0001_initial', '2020-09-14 06:37:35.014510'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-09-14 06:37:35.377902'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-09-14 06:37:35.393533'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-09-14 06:37:35.616212'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-09-14 06:37:35.747266'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-09-14 06:37:35.863691'),
(9, 'auth', '0004_alter_user_username_opts', '2020-09-14 06:37:35.879316'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-09-14 06:37:35.979587'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-09-14 06:37:35.979587'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-09-14 06:37:36.015349'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-09-14 06:37:36.117460'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-09-14 06:37:36.233367'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-09-14 06:37:36.318009'),
(16, 'auth', '0011_update_proxy_permissions', '2020-09-14 06:37:36.333639'),
(17, 'pepperonizza', '0001_initial', '2020-09-14 06:37:36.866151'),
(18, 'sessions', '0001_initial', '2020-09-14 06:37:37.120124'),
(19, 'pepperonizza', '0002_auto_20200916_1119', '2020-09-16 05:50:43.849359'),
(20, 'pepperonizza', '0003_auto_20201023_1241', '2020-10-23 07:12:52.887762'),
(21, 'pepperonizza', '0004_auto_20201024_1119', '2020-10-24 05:50:29.403042'),
(22, 'pepperonizza', '0005_customermodel_username', '2020-10-24 05:59:55.145625'),
(23, 'pepperonizza', '0006_feedback', '2020-11-23 07:07:51.881014');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('xy9zk1i894xlxtp99045s1y0n99uexlc', 'MWJiYmExOWUwNmU1NjcxYmU4NjY5ZDg3ZjA0NDExNGRkMzEzZTQwYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzFmNTFjOTEyODRlYmEzMGZlYWY1YjdlYmYzNmQxM2VhZjA5NTVlIn0=', '2020-09-28 13:27:11.923646'),
('3nb7pgavuyaky4iuiqf0o0bjk9pnq6qq', 'MWJiYmExOWUwNmU1NjcxYmU4NjY5ZDg3ZjA0NDExNGRkMzEzZTQwYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzFmNTFjOTEyODRlYmEzMGZlYWY1YjdlYmYzNmQxM2VhZjA5NTVlIn0=', '2020-09-30 05:52:50.881739'),
('8ld4lnzrnw0cy1lfgfbw9nxaruhttq9o', 'MWJiYmExOWUwNmU1NjcxYmU4NjY5ZDg3ZjA0NDExNGRkMzEzZTQwYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzFmNTFjOTEyODRlYmEzMGZlYWY1YjdlYmYzNmQxM2VhZjA5NTVlIn0=', '2020-09-30 13:34:47.956621'),
('4vwpaqfp20e299xtpcymuoum37j24fb2', 'MWJiYmExOWUwNmU1NjcxYmU4NjY5ZDg3ZjA0NDExNGRkMzEzZTQwYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzFmNTFjOTEyODRlYmEzMGZlYWY1YjdlYmYzNmQxM2VhZjA5NTVlIn0=', '2020-10-08 06:25:44.027848'),
('kf05bop65y8xjq68ry308vxmc5jpy9eb', 'MWJiYmExOWUwNmU1NjcxYmU4NjY5ZDg3ZjA0NDExNGRkMzEzZTQwYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzFmNTFjOTEyODRlYmEzMGZlYWY1YjdlYmYzNmQxM2VhZjA5NTVlIn0=', '2020-10-08 14:49:34.942951'),
('gktp5e4hc1hv6h6r0s56k5l7atwqyzss', 'MWJiYmExOWUwNmU1NjcxYmU4NjY5ZDg3ZjA0NDExNGRkMzEzZTQwYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzFmNTFjOTEyODRlYmEzMGZlYWY1YjdlYmYzNmQxM2VhZjA5NTVlIn0=', '2020-10-15 06:40:42.427037'),
('xsfqsery34ezi5o18ofxu6t9thuk5d7z', 'MWJiYmExOWUwNmU1NjcxYmU4NjY5ZDg3ZjA0NDExNGRkMzEzZTQwYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzFmNTFjOTEyODRlYmEzMGZlYWY1YjdlYmYzNmQxM2VhZjA5NTVlIn0=', '2020-10-15 06:52:23.719997'),
('7jc40pgybu7ngjd9cwuvfbqefoo7qm5c', 'ZjVkNDk1NGU0MTdhOWY0ZjA4NmY4ODljYWM5NmMwMGEzZjU4YTY4YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MWU0MTdiY2JiMGM3OTllYTM0NGRlMzNlYmEyM2ZmOGJkMzlhN2YyIn0=', '2020-10-15 07:27:02.371813'),
('h5e0fgvg0mqabfwnvvrjoy4jjlmg7pmn', 'MWJiYmExOWUwNmU1NjcxYmU4NjY5ZDg3ZjA0NDExNGRkMzEzZTQwYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzFmNTFjOTEyODRlYmEzMGZlYWY1YjdlYmYzNmQxM2VhZjA5NTVlIn0=', '2020-10-16 15:40:32.327544'),
('5lqbnlscz8hedvfz6vp8i0n0xzu72dud', 'MWJiYmExOWUwNmU1NjcxYmU4NjY5ZDg3ZjA0NDExNGRkMzEzZTQwYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzFmNTFjOTEyODRlYmEzMGZlYWY1YjdlYmYzNmQxM2VhZjA5NTVlIn0=', '2020-10-17 15:03:34.268422'),
('aoq5wnaeagpojk74iho1otsxcfl350wf', 'ZjVkNDk1NGU0MTdhOWY0ZjA4NmY4ODljYWM5NmMwMGEzZjU4YTY4YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MWU0MTdiY2JiMGM3OTllYTM0NGRlMzNlYmEyM2ZmOGJkMzlhN2YyIn0=', '2020-10-20 06:44:55.921382'),
('ryb53zc8rg2jcn40z4mp4fnre4zm9riz', 'MWJiYmExOWUwNmU1NjcxYmU4NjY5ZDg3ZjA0NDExNGRkMzEzZTQwYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzFmNTFjOTEyODRlYmEzMGZlYWY1YjdlYmYzNmQxM2VhZjA5NTVlIn0=', '2020-10-21 07:23:50.695793'),
('clif0stbl9p8zgduuer6vgnap3t73gmn', 'MWJiYmExOWUwNmU1NjcxYmU4NjY5ZDg3ZjA0NDExNGRkMzEzZTQwYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzFmNTFjOTEyODRlYmEzMGZlYWY1YjdlYmYzNmQxM2VhZjA5NTVlIn0=', '2020-10-23 06:47:29.539728'),
('x7dztrw5uwlxtk6dg14dgtno2pgk9mwc', 'ZjVkNDk1NGU0MTdhOWY0ZjA4NmY4ODljYWM5NmMwMGEzZjU4YTY4YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MWU0MTdiY2JiMGM3OTllYTM0NGRlMzNlYmEyM2ZmOGJkMzlhN2YyIn0=', '2020-10-25 06:16:47.009990'),
('d25eab4beea9i8ks0h2rw7wv5k3onh44', 'MWJiYmExOWUwNmU1NjcxYmU4NjY5ZDg3ZjA0NDExNGRkMzEzZTQwYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzFmNTFjOTEyODRlYmEzMGZlYWY1YjdlYmYzNmQxM2VhZjA5NTVlIn0=', '2020-11-13 07:39:32.920679'),
('wnmpgerdzalem1p9yuayzc5u8hhtoqgu', 'OTBlYThjZmY4NWYzNDA0Y2Y2NTBlZjU4OWUwMGNiZWExNjAxMzM4Njp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhM2FjOTMwNDVkMTRhNTM0YzdlMmEzMTgwNmYyNzMzNDFkNGZiMjkwIn0=', '2020-11-07 06:04:46.724158'),
('l6xciy47h14mpk34tadjbbg9uzd799gp', 'MWJiYmExOWUwNmU1NjcxYmU4NjY5ZDg3ZjA0NDExNGRkMzEzZTQwYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzFmNTFjOTEyODRlYmEzMGZlYWY1YjdlYmYzNmQxM2VhZjA5NTVlIn0=', '2020-11-23 06:33:07.246625'),
('rj5l5a6nef9wrqrahwceuubsazhzgb5k', 'MWJiYmExOWUwNmU1NjcxYmU4NjY5ZDg3ZjA0NDExNGRkMzEzZTQwYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzFmNTFjOTEyODRlYmEzMGZlYWY1YjdlYmYzNmQxM2VhZjA5NTVlIn0=', '2020-11-17 06:49:32.421383'),
('j3608nyn5c02e6pzcsu9bnhdnd40qpxk', 'MWJiYmExOWUwNmU1NjcxYmU4NjY5ZDg3ZjA0NDExNGRkMzEzZTQwYjp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzFmNTFjOTEyODRlYmEzMGZlYWY1YjdlYmYzNmQxM2VhZjA5NTVlIn0=', '2020-11-20 06:21:16.837651'),
('7p80s8z2kuyjnx50yxx8sa6ca2kvn9zg', 'ZjVkNDk1NGU0MTdhOWY0ZjA4NmY4ODljYWM5NmMwMGEzZjU4YTY4YTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI0MWU0MTdiY2JiMGM3OTllYTM0NGRlMzNlYmEyM2ZmOGJkMzlhN2YyIn0=', '2020-12-07 07:06:07.634068'),
('skzcaphi9welvt9851guterukz5g405b', 'MTAzMzExNTkxMTEzYjdkZGZiM2U5YWQ3N2VmNzM3MWE2NWFmYmNkYzp7Il9hdXRoX3VzZXJfaWQiOiI3IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxMmY1NzQ2YTQ0ZTFmZTVhYzM3YmEyMmRmNWUxMDM0M2Q0NmMyM2JmIn0=', '2020-12-15 15:26:12.690632');

-- --------------------------------------------------------

--
-- Table structure for table `pepperonizza_burgermodel`
--

DROP TABLE IF EXISTS `pepperonizza_burgermodel`;
CREATE TABLE IF NOT EXISTS `pepperonizza_burgermodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `img` varchar(100) NOT NULL,
  `desc` longtext NOT NULL,
  `category` varchar(30) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pepperonizza_burgermodel`
--

INSERT INTO `pepperonizza_burgermodel` (`id`, `name`, `img`, `desc`, `category`, `price`) VALUES
(1, 'Spicy Chicken Double Patty Burger', 'pics/Spicy-Chicken-Double-Patty.jpg', 'Two tender & juicy chicken patties coated in spicy, crispy batter topped with a creamy sauce & crispy shredded lettuce will have you craving for more.', 'Burger', 299),
(2, 'Mexican AlooTikki Burger', 'pics/Mexican_Aloo_Tikki.jpg', 'Made using perfectly fried aloo tikki patty layered with shredded onion, jalapeno, a slice of tomato served with tangy Mexican sauce in between two lightly toasted buns.', 'Burger', 56),
(3, 'Spicy Paneer Burger', 'pics/mcspicy-paneer-burger.jpg', 'Rich and filling cottage cheese patty coated in spicy, crispy batter topped with a creamy sauce and crispy shredded lettuce will have you craving for more.', 'Burger', 167),
(4, 'Filet-O-Fish Burger', 'pics/t-Filet-O-Fish.jpg', 'Signature fish filet patty, perfectly balanced with a sharp flavour of tartar sauce, a thin slice of cheese served between steamed buns.', 'Burger', 153);

-- --------------------------------------------------------

--
-- Table structure for table `pepperonizza_customermodel`
--

DROP TABLE IF EXISTS `pepperonizza_customermodel`;
CREATE TABLE IF NOT EXISTS `pepperonizza_customermodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `profile_pic` varchar(100) NOT NULL,
  `phoneno` varchar(20) NOT NULL,
  `username` varchar(150) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pepperonizza_customermodel`
--

INSERT INTO `pepperonizza_customermodel` (`id`, `userid`, `profile_pic`, `phoneno`, `username`) VALUES
(1, 2, 'Avijit.jpg', '123456789', 'User1'),
(4, 6, 'pics/Avijit.jpg', '987654232', 'User2'),
(5, 7, 'pics/coller.jpg', '12345678', 'User3');

-- --------------------------------------------------------

--
-- Table structure for table `pepperonizza_feedback`
--

DROP TABLE IF EXISTS `pepperonizza_feedback`;
CREATE TABLE IF NOT EXISTS `pepperonizza_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `full_name` varchar(200) NOT NULL,
  `email` varchar(254) NOT NULL,
  `subject` longtext NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pepperonizza_feedback`
--

INSERT INTO `pepperonizza_feedback` (`id`, `username`, `full_name`, `email`, `subject`, `message`) VALUES
(1, 'anonymous', 'Z_crete', 'abc@yahoo.com', 'Feedback', 'Good Service'),
(2, 'User1', 'Avijit Bakshi', 'xyz@gmail.com', 'Query', 'What if my order got cancelled, will i get my refund?');

-- --------------------------------------------------------

--
-- Table structure for table `pepperonizza_ordereditem`
--

DROP TABLE IF EXISTS `pepperonizza_ordereditem`;
CREATE TABLE IF NOT EXISTS `pepperonizza_ordereditem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `img` varchar(100) NOT NULL,
  `quantity` varchar(20) NOT NULL,
  `category` varchar(30) NOT NULL,
  `price` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pepperonizza_ordereditem`
--

INSERT INTO `pepperonizza_ordereditem` (`id`, `name`, `img`, `quantity`, `category`, `price`, `total_price`) VALUES
(1, 'Margherita', 'pics/double_cheese_margherita.jpg', '2', 'Pizza', 199, 398),
(2, 'Spicy Chicken Double Patty Burger', 'pics/Spicy-Chicken-Double-Patty.jpg', '3', 'Burger', 299, 897),
(3, 'Cheesy Jalapeno Pasta Veg', 'pics/JalapenoVeg.jpg', '1', 'Pasta', 150, 150),
(4, 'Bailley premium Water (500ml)', 'pics/bailley.jpg', '1', 'Beverage', 20, 20),
(6, 'Non Veg Zingy Parcel', 'pics/Aha_Non_Veg.jpg', '1', 'Pizza', 49, 49),
(8, 'Non Veg Loaded', 'pics/LoadedC.jpg', '3', 'Pizza', 155, 465);

-- --------------------------------------------------------

--
-- Table structure for table `pepperonizza_ordermodel`
--

DROP TABLE IF EXISTS `pepperonizza_ordermodel`;
CREATE TABLE IF NOT EXISTS `pepperonizza_ordermodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `phoneno` varchar(20) NOT NULL,
  `address` longtext NOT NULL,
  `timestamp` datetime(6) DEFAULT NULL,
  `status` varchar(50) NOT NULL,
  `paid` tinyint(1) NOT NULL,
  `item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pepperonizza_ordermodel_item_id_61ac4857` (`item_id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pepperonizza_ordermodel`
--

INSERT INTO `pepperonizza_ordermodel` (`id`, `username`, `email`, `phoneno`, `address`, `timestamp`, `status`, `paid`, `item_id`) VALUES
(1, 'User1', 'abc@gmail.com', '123456789', 'Guwahati', '2020-09-16 13:27:19.039510', 'a', 1, 1),
(2, 'User1', 'abc@gmail.com', '123456789', 'Assam', '2020-09-16 13:27:27.004592', 'a', 1, 2),
(3, 'User1', 'abc@gmail.com', '123456789', 'Delhi', '2020-10-06 07:17:21.124273', 'a', 1, 3),
(4, 'User1', 'abc@gmail.com', '123456789', 'Gujrat', '2020-09-16 13:27:33.891078', 'd', 1, 4),
(6, 'User1', 'abc@gmail.com', '123456789', 'abcd', '2020-10-07 07:24:14.565616', 'a', 1, 6),
(8, 'User3', 'avijitbk2016@gmail.com', '12345678', 'Mumbai', '2020-12-02 13:14:38.182212', 'a', 1, 8);

-- --------------------------------------------------------

--
-- Table structure for table `pepperonizza_pastamodel`
--

DROP TABLE IF EXISTS `pepperonizza_pastamodel`;
CREATE TABLE IF NOT EXISTS `pepperonizza_pastamodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `img` varchar(100) NOT NULL,
  `desc` longtext NOT NULL,
  `category` varchar(30) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pepperonizza_pastamodel`
--

INSERT INTO `pepperonizza_pastamodel` (`id`, `name`, `img`, `desc`, `category`, `price`) VALUES
(1, 'Moroccan Spice Pasta Non Veg', 'pics/MoroccanPastaNonVeg.jpg', 'Instant Fusilli Pasta, Harissa Sauce, Onion, Olives, Meatballs, Parsley sprinkle.', 'Pasta', 139),
(2, 'White Pasta Italiano Veg', 'pics/White-Pasta_Veg.jpg', 'Creamy white pasta with herb grilled mushrooms.', 'Pasta', 135),
(3, 'Cheesy Jalapeno Pasta Veg', 'pics/JalapenoVeg.jpg', 'Instant Fusilli Pasta, Creamy Culinary Dressing, Onion, Olive, Green Capsicum, Parsley sprinkle.', 'Pasta', 150),
(4, 'Creamy Tomato Pasta Pizza Veg', 'pics/CREAMYTOMATOVEG.jpg', 'Loaded with a delicious creamy tomato pasta topping, green capsicum, crunchy red and yellow bell peppers and black olives.', 'Pasta', 395);

-- --------------------------------------------------------

--
-- Table structure for table `pepperonizza_paymodel`
--

DROP TABLE IF EXISTS `pepperonizza_paymodel`;
CREATE TABLE IF NOT EXISTS `pepperonizza_paymodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `payid` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `owner` varchar(150) NOT NULL,
  `cardnumber` varchar(50) NOT NULL,
  `month` varchar(20) NOT NULL,
  `year` varchar(20) NOT NULL,
  `cvv` varchar(130) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pepperonizza_paymodel`
--

INSERT INTO `pepperonizza_paymodel` (`id`, `payid`, `username`, `owner`, `cardnumber`, `month`, `year`, `cvv`) VALUES
(1, 1, 'User1', 'ans', '1111-1111-1111-1111', '01', '2035', 'pbkdf2_sha256$180000$BjmtjN0o58Qe$3dj0np9NW4gK8ggeRCjckHWJMXZNoOY0YU4Pog9iXUc='),
(2, 2, 'User1', 'rrr', '2222-2222-2222-2222', '08', '2028', 'pbkdf2_sha256$180000$mjcMlEYpiNkn$CvdqtSWed1XtUOcF6LgxPqbkqqhQrkUV4PucDJc2rdY='),
(3, 3, 'User1', 'wee', '3333-3333-3333-3333', '10', '2025', 'pbkdf2_sha256$180000$lU7zLe3k1fZH$J0BE3VR4cENL44D8YwU7KGzvErIZScdJ8rf67eCATC0='),
(4, 4, 'User1', 'ttt', '4444-4444-4444-4444', '07', '2036', 'pbkdf2_sha256$180000$se07qLDn4z7b$mBE/lsa1wLVAmvGc4WLJoq7AGgGyIy5Q6cJKFNl/HTY='),
(5, 6, 'User1', 'Ricky Panis', '5555-5555-5555-5555', '01', '2034', 'pbkdf2_sha256$180000$5WauTG7gk4Rq$Hgx2DK9TeBp0ENXr0fzmS8itMQ6riL3oRSVluKX6g9U='),
(6, 8, 'User3', 'Sunny Das', '6666-6666-6666-6666', '10', '2035', 'pbkdf2_sha256$180000$uz4Yey2OcrXi$wj5K1ccJ91S1Qe4dzyoo2wnDYF+uAV2f76IHV1NNNcg=');

-- --------------------------------------------------------

--
-- Table structure for table `pepperonizza_pizzamodel`
--

DROP TABLE IF EXISTS `pepperonizza_pizzamodel`;
CREATE TABLE IF NOT EXISTS `pepperonizza_pizzamodel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `img` varchar(100) NOT NULL,
  `desc` longtext NOT NULL,
  `category` varchar(30) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pepperonizza_pizzamodel`
--

INSERT INTO `pepperonizza_pizzamodel` (`id`, `name`, `img`, `desc`, `category`, `price`) VALUES
(1, 'Italian Pizza', 'pics/Italian-Pizza_mYD5cBC.jpg', 'Flattened base of leavened wheat-based dough topped with tomatoes, cheese, and often various other ingredients (such as anchovies, mushrooms, onions, olives, pineapple, meat, etc.).', 'Pizza', 350),
(2, 'Veggie Paradise', 'pics/new_veggie_paradise.jpg', 'The awesome foursome! Golden corn, black olives, capsicum, red paprika.', 'Pizza', 300),
(3, 'Chicken Pepperoni', 'pics/chicken_pepperoni.jpg', 'A classic American taste! Relish the delectable flavor of Chicken Pepperoni, topped with extra cheese.', 'Pizza', 570),
(4, 'Margherita', 'pics/double_cheese_margherita.jpg', 'A classic delight with 100% Real mozzarella cheese.', 'Pizza', 199),
(5, 'Paneer Makhani', 'pics/Paneer_Makhni.jpg', 'Flavorful twist of spicy makhani  sauce topped with paneer & capsicum.', 'Pizza', 395),
(6, 'Non Veg Loaded', 'pics/LoadedC.jpg', 'Chicken sausage, pepper barbecue chicken & peri-peri chicken in a fresh pan crust.', 'Pizza', 155),
(7, 'Non Veg Zingy Parcel', 'pics/Aha_Non_Veg.jpg', 'Snaky bites! Pizza rolls with paneer & creamy harissa sauce.', 'Pizza', 49),
(8, 'Chicken Fiesta', 'pics/new_chicken_fiesta.jpg', 'Grilled chicken rashers, peri-peri chicken, onion & capsicum, a complete fiesta', 'Pizza', 450),
(9, 'Mexican Green Wave', 'pics/new_mexican_green_wave.jpg', 'Mexican Herbs sprinkled on onion, capsicum, tomato & jalapeno.', 'Pizza', 395);

-- --------------------------------------------------------

--
-- Table structure for table `pepperonizza_softdrinks`
--

DROP TABLE IF EXISTS `pepperonizza_softdrinks`;
CREATE TABLE IF NOT EXISTS `pepperonizza_softdrinks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `img` varchar(100) NOT NULL,
  `desc` longtext NOT NULL,
  `category` varchar(30) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pepperonizza_softdrinks`
--

INSERT INTO `pepperonizza_softdrinks` (`id`, `name`, `img`, `desc`, `category`, `price`) VALUES
(1, 'Bailley premium Water (500ml)', 'pics/bailley.jpg', 'Packaged Drinking Water.', 'Beverage', 20),
(2, 'Pepsi (500ml)', 'pics/pepsi-col.jpg', 'Sparkling and Refreshing Beverage.', 'Beverage', 60),
(3, 'Strawberry Juice', 'pics/strawberry.jpg', 'Strawberries, lemon, sugar, ice cubes, Soda Water.', 'Beverage', 50),
(4, 'Lemonade Juice', 'pics/lemon-juice-glass-and-fresh-lemons.jpg', 'Ice cubes, Lemon slices, white sugar.', 'Beverage', 40),
(5, 'Chocolate Milkshake', 'pics/Chocolate-Milkshakes-square.jpg', 'Vanilla ice cream, HERSHEYS Syrup, ice cold milk, cocoa Chocolate powder, sugar.', 'Beverage', 100);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
