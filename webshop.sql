-- phpMyAdmin SQL Dump
-- version 4.7.0-beta1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: 2019-03-06 05:42:08
-- 服务器版本： 5.5.53
-- PHP Version: 7.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `webshop`
--

-- --------------------------------------------------------

--
-- 表的结构 `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL COMMENT 'Banner名称，通常作为标识',
  `description` varchar(255) DEFAULT NULL COMMENT 'Banner描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='banner管理表';

--
-- 转存表中的数据 `banner`
--

INSERT INTO `banner` (`id`, `name`, `description`, `delete_time`, `update_time`) VALUES
(1, '首页置顶', '首页轮播图', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `banner_item`
--

CREATE TABLE `banner_item` (
  `id` int(11) NOT NULL,
  `img_id` int(11) NOT NULL COMMENT '外键，关联image表',
  `key_word` varchar(100) NOT NULL COMMENT '执行关键字，根据不同的type含义不同',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '跳转类型，可能导向商品，可能导向专题，可能导向其他。0，无导向；1：导向商品;2:导向专题',
  `delete_time` int(11) DEFAULT NULL,
  `banner_id` int(11) NOT NULL COMMENT '外键，关联banner表',
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='banner子项表';

--
-- 转存表中的数据 `banner_item`
--

INSERT INTO `banner_item` (`id`, `img_id`, `key_word`, `type`, `delete_time`, `banner_id`, `update_time`) VALUES
(1, 65, '6', 1, NULL, 1, NULL),
(2, 2, '25', 1, NULL, 1, NULL),
(3, 3, '11', 1, NULL, 1, NULL),
(5, 1, '10', 1, NULL, 1, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '分类名称',
  `topic_img_id` int(11) DEFAULT NULL COMMENT '外键，关联image表',
  `delete_time` int(11) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL COMMENT '描述',
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商品类目';

--
-- 转存表中的数据 `category`
--

INSERT INTO `category` (`id`, `name`, `topic_img_id`, `delete_time`, `description`, `update_time`) VALUES
(2, '果味', 6, NULL, NULL, NULL),
(3, '蔬菜', 5, NULL, NULL, NULL),
(4, '炒货', 7, NULL, NULL, NULL),
(5, '点心', 4, NULL, NULL, NULL),
(6, '粗茶', 8, NULL, NULL, NULL),
(7, '淡饭', 9, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `image`
--

CREATE TABLE `image` (
  `id` int(11) NOT NULL,
  `url` varchar(255) NOT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 来自本地，2 来自公网',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='图片总表';

--
-- 转存表中的数据 `image`
--

INSERT INTO `image` (`id`, `url`, `from`, `delete_time`, `update_time`) VALUES
(1, '/banner-1a.png', 1, NULL, NULL),
(2, '/banner-2a.png', 1, NULL, NULL),
(3, '/banner-3a.png', 1, NULL, NULL),
(4, '/category-cake.png', 1, NULL, NULL),
(5, '/category-vg.png', 1, NULL, NULL),
(6, '/category-dryfruit.png', 1, NULL, NULL),
(7, '/category-fry-a.png', 1, NULL, NULL),
(8, '/category-tea.png', 1, NULL, NULL),
(9, '/category-rice.png', 1, NULL, NULL),
(10, '/product-dryfruit@1.png', 1, NULL, NULL),
(13, '/product-vg@1.png', 1, NULL, NULL),
(14, '/product-rice@6.png', 1, NULL, NULL),
(16, '/1@theme.png', 1, NULL, NULL),
(17, '/2@theme.png', 1, NULL, NULL),
(18, '/3@theme.png', 1, NULL, NULL),
(19, '/detail-1@1-dryfruit.png', 1, NULL, NULL),
(20, '/detail-2@1-dryfruit.png', 1, NULL, NULL),
(21, '/detail-3@1-dryfruit.png', 1, NULL, NULL),
(22, '/detail-4@1-dryfruit.png', 1, NULL, NULL),
(23, '/detail-5@1-dryfruit.png', 1, NULL, NULL),
(24, '/detail-6@1-dryfruit.png', 1, NULL, NULL),
(25, '/detail-7@1-dryfruit.png', 1, NULL, NULL),
(26, '/detail-8@1-dryfruit.png', 1, NULL, NULL),
(27, '/detail-9@1-dryfruit.png', 1, NULL, NULL),
(28, '/detail-11@1-dryfruit.png', 1, NULL, NULL),
(29, '/detail-10@1-dryfruit.png', 1, NULL, NULL),
(31, '/product-rice@1.png', 1, NULL, NULL),
(32, '/product-tea@1.png', 1, NULL, NULL),
(33, '/product-dryfruit@2.png', 1, NULL, NULL),
(36, '/product-dryfruit@3.png', 1, NULL, NULL),
(37, '/product-dryfruit@4.png', 1, NULL, NULL),
(38, '/product-dryfruit@5.png', 1, NULL, NULL),
(39, '/product-dryfruit-a@6.png', 1, NULL, NULL),
(40, '/product-dryfruit@7.png', 1, NULL, NULL),
(41, '/product-rice@2.png', 1, NULL, NULL),
(42, '/product-rice@3.png', 1, NULL, NULL),
(43, '/product-rice@4.png', 1, NULL, NULL),
(44, '/product-fry@1.png', 1, NULL, NULL),
(45, '/product-fry@2.png', 1, NULL, NULL),
(46, '/product-fry@3.png', 1, NULL, NULL),
(47, '/product-tea@2.png', 1, NULL, NULL),
(48, '/product-tea@3.png', 1, NULL, NULL),
(49, '/1@theme-head.png', 1, NULL, NULL),
(50, '/2@theme-head.png', 1, NULL, NULL),
(51, '/3@theme-head.png', 1, NULL, NULL),
(52, '/product-cake@1.png', 1, NULL, NULL),
(53, '/product-cake@2.png', 1, NULL, NULL),
(54, '/product-cake-a@3.png', 1, NULL, NULL),
(55, '/product-cake-a@4.png', 1, NULL, NULL),
(56, '/product-dryfruit@8.png', 1, NULL, NULL),
(57, '/product-fry@4.png', 1, NULL, NULL),
(58, '/product-fry@5.png', 1, NULL, NULL),
(59, '/product-rice@5.png', 1, NULL, NULL),
(60, '/product-rice@7.png', 1, NULL, NULL),
(62, '/detail-12@1-dryfruit.png', 1, NULL, NULL),
(63, '/detail-13@1-dryfruit.png', 1, NULL, NULL),
(65, '/banner-4a.png', 1, NULL, NULL),
(66, '/product-vg@4.png', 1, NULL, NULL),
(67, '/product-vg@5.png', 1, NULL, NULL),
(68, '/product-vg@2.png', 1, NULL, NULL),
(69, '/product-vg@3.png', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `order_no` varchar(20) NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '外键，用户id，注意并不是openid',
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `total_price` decimal(6,2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1:未支付， 2：已支付，3：已发货 , 4: 已支付，但库存不足',
  `snap_img` varchar(255) DEFAULT NULL COMMENT '订单快照图片',
  `snap_name` varchar(80) DEFAULT NULL COMMENT '订单快照名称',
  `total_count` int(11) NOT NULL DEFAULT '0',
  `update_time` int(11) DEFAULT NULL,
  `snap_items` text COMMENT '订单其他信息快照（json)',
  `snap_address` varchar(500) DEFAULT NULL COMMENT '地址快照',
  `prepay_id` varchar(100) DEFAULT NULL COMMENT '订单微信支付的预订单id（用于发送模板消息）'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `order`
--

INSERT INTO `order` (`id`, `order_no`, `user_id`, `delete_time`, `create_time`, `total_price`, `status`, `snap_img`, `snap_name`, `total_count`, `update_time`, `snap_items`, `snap_address`, `prepay_id`) VALUES
(1, 'A628963177398890', 1, NULL, NULL, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, NULL, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(2, 'A630461131416410', 1, NULL, 1530346112, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530346112, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(3, 'A630462249917374', 1, NULL, 1530346224, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530346224, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(4, 'A630463000939032', 1, NULL, 1530346299, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530346299, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(5, 'A630463178786796', 1, NULL, 1530346317, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530346317, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(6, 'A630463921414595', 1, NULL, 1530346391, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530346391, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(7, 'A630464118697754', 1, NULL, 1530346411, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530346411, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(8, 'A630465567278885', 1, NULL, 1530346556, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530346556, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(9, 'A630469856028512', 1, NULL, 1530346985, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530346985, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(10, 'A630471312993576', 1, NULL, 1530347131, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530347131, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(11, 'A630472937079408', 1, NULL, 1530347293, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530347293, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(12, 'A630477643822815', 1, NULL, 1530347764, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530347764, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(13, 'A630477938045872', 1, NULL, 1530347793, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530347793, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(14, 'A630479754887207', 1, NULL, 1530347975, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530347975, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(15, 'A630496559816597', 1, NULL, 1530349655, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530349655, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(16, 'A630497314035643', 1, NULL, 1530349731, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530349731, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(17, 'A630498059312086', 1, NULL, 1530349805, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530349805, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(18, 'A630499578070444', 1, NULL, 1530349957, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530349957, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(19, 'A630501715268803', 1, NULL, 1530350171, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530350171, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(20, 'A630501889696474', 1, NULL, 1530350188, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530350188, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(21, 'A630501982674504', 1, NULL, 1530350197, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530350197, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(22, 'A630506222734272', 1, NULL, 1530350621, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530350621, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(23, 'A630507589190627', 1, NULL, 1530350758, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530350758, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(24, 'A630510080739698', 1, NULL, 1530351007, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530351007, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(25, 'A630510339369754', 1, NULL, 1530351033, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530351033, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(26, 'A630514386201652', 1, NULL, 1530351438, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530351438, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(27, 'A630520272623303', 1, NULL, 1530352026, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530352026, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(28, 'A630521586740827', 1, NULL, 1530352154, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530352154, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(29, 'A630521690058772', 1, NULL, 1530352161, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530352161, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"lu\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(30, 'A701577076951863', 2, NULL, 1530457707, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530457707, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(31, 'A701578045810760', 2, NULL, 1530457804, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530457804, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(32, 'A701581994758591', 2, NULL, 1530458198, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530458198, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(33, 'A701588165589282', 2, NULL, 1530458815, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530458815, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(34, 'A701590540631601', 2, NULL, 1530459053, '0.05', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 5, 1530459053, '[{\"id\":1,\"haveStock\":true,\"count\":2,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.02},{\"id\":2,\"haveStock\":true,\"count\":3,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.03}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(35, 'A702921839647784', 2, NULL, 1530492183, '0.02', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 2, 1530492183, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(36, 'A702936360562928', 2, NULL, 1530493635, '0.02', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 2, 1530493635, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(37, 'A702936968855703', 2, NULL, 1530493696, '0.02', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 2, 1530493696, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(38, 'A702944359019776', 2, NULL, 1530494435, '0.02', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 2, 1530494435, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(39, 'A702955337842796', 2, NULL, 1530495533, '0.02', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 2, 1530495533, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', NULL),
(40, 'A702957606175085', 2, NULL, 1530495760, '0.02', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 2, 1530495760, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx02094239533549f89b6681540913541001'),
(41, 'A702960691571476', 2, NULL, 1530496068, '0.02', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 2, 1530496068, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx02094749866776e8e435dd990759671973'),
(42, 'A702962246090445', 2, NULL, 1530496224, '0.02', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 2, 1530496224, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx0209502291083348bc872ab94157324343'),
(43, 'A702963762000455', 2, NULL, 1530496375, '0.02', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 2, 1530496375, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx02095257248557d62c67b3b72189634351'),
(44, 'A702964034449495', 2, NULL, 1530496403, '0.02', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 2, 1530496403, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx02095321903442f485cd219c3883933416'),
(45, 'A702964114432643', 2, NULL, 1530496411, '0.02', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 2, 1530496411, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx02095329757955cf30586c400007241023'),
(46, 'A702969625425800', 2, NULL, 1530496962, '0.02', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 2, 1530496962, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx02100241402821689ce3c5774220688533'),
(47, 'A702969747762522', 2, NULL, 1530496974, '0.02', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 2, 1530496974, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx02100253036485a35192a6b81542218249'),
(48, 'A702970045354936', 2, NULL, 1530497004, '0.02', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 2, 1530497004, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx02100322881818e990813c101626495481'),
(49, 'A702970895860398', 2, NULL, 1530497089, '0.02', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 2, 1530497089, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx0210044826457000a9f223101607073161'),
(50, 'A702972165066407', 2, NULL, 1530497216, '0.02', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 2, 1530497216, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx0210065475355533b2e87bdd1570225260'),
(51, 'A702130846925527', 2, NULL, 1530513082, '0.02', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 2, 1530513082, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx021431235624205ac3e659902623463088'),
(52, 'A702246893293080', 2, NULL, 1530524688, '0.02', 1, '__PUBLIC__/images//product-vg@1.png', '芹菜 半斤等', 2, 1530524688, '[{\"id\":1,\"haveStock\":true,\"count\":1,\"name\":\"\\u82b9\\u83dc \\u534a\\u65a4\",\"totalPrice\":0.01},{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"name\":\"\\u674e\\u73ae\\u950b\",\"mobile\":\"15623358482\",\"province\":\"\\u5e7f\\u4e1c\",\"city\":\"\\u5e7f\\u5dde\",\"country\":\"\\u4e2d\\u56fd\",\"detail\":\"\\u5927\\u5b66\\u57ce\\u5e7f\\u5dde\\u5927\\u5b66\",\"update_time\":\"1970-01-01 08:00:00\"}', 'wx0217444837041965d6dc077b0545750833');

-- --------------------------------------------------------

--
-- 表的结构 `order_product`
--

CREATE TABLE `order_product` (
  `order_id` int(11) NOT NULL COMMENT '联合主键，订单id',
  `product_id` int(11) NOT NULL COMMENT '联合主键，商品id',
  `count` int(11) NOT NULL COMMENT '商品数量',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `order_product`
--

INSERT INTO `order_product` (`order_id`, `product_id`, `count`, `delete_time`, `update_time`) VALUES
(1, 1, 2, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 2, NULL, NULL),
(4, 1, 2, NULL, NULL),
(5, 1, 2, NULL, NULL),
(6, 1, 2, NULL, NULL),
(7, 1, 2, NULL, NULL),
(8, 1, 2, NULL, NULL),
(9, 1, 2, NULL, NULL),
(10, 1, 2, NULL, NULL),
(11, 1, 2, NULL, NULL),
(12, 1, 2, NULL, NULL),
(13, 1, 2, NULL, NULL),
(14, 1, 2, NULL, NULL),
(15, 1, 2, NULL, NULL),
(16, 1, 2, NULL, NULL),
(17, 1, 2, NULL, NULL),
(18, 1, 2, NULL, NULL),
(19, 1, 2, NULL, NULL),
(20, 1, 2, NULL, NULL),
(21, 1, 2, NULL, NULL),
(22, 1, 2, NULL, NULL),
(23, 1, 2, NULL, NULL),
(24, 1, 2, NULL, NULL),
(25, 1, 2, NULL, NULL),
(26, 1, 2, NULL, NULL),
(27, 1, 2, NULL, NULL),
(28, 1, 2, NULL, NULL),
(29, 1, 2, NULL, NULL),
(30, 1, 2, NULL, NULL),
(31, 1, 2, NULL, NULL),
(32, 1, 2, NULL, NULL),
(33, 1, 2, NULL, NULL),
(34, 1, 2, NULL, NULL),
(35, 1, 1, NULL, NULL),
(36, 1, 1, NULL, NULL),
(37, 1, 1, NULL, NULL),
(38, 1, 1, NULL, NULL),
(39, 1, 1, NULL, NULL),
(40, 1, 1, NULL, NULL),
(41, 1, 1, NULL, NULL),
(42, 1, 1, NULL, NULL),
(43, 1, 1, NULL, NULL),
(44, 1, 1, NULL, NULL),
(45, 1, 1, NULL, NULL),
(46, 1, 1, NULL, NULL),
(47, 1, 1, NULL, NULL),
(48, 1, 1, NULL, NULL),
(49, 1, 1, NULL, NULL),
(50, 1, 1, NULL, NULL),
(51, 1, 1, NULL, NULL),
(52, 1, 1, NULL, NULL),
(1, 2, 3, NULL, NULL),
(2, 2, 3, NULL, NULL),
(3, 2, 3, NULL, NULL),
(4, 2, 3, NULL, NULL),
(5, 2, 3, NULL, NULL),
(6, 2, 3, NULL, NULL),
(7, 2, 3, NULL, NULL),
(8, 2, 3, NULL, NULL),
(9, 2, 3, NULL, NULL),
(10, 2, 3, NULL, NULL),
(11, 2, 3, NULL, NULL),
(12, 2, 3, NULL, NULL),
(13, 2, 3, NULL, NULL),
(14, 2, 3, NULL, NULL),
(15, 2, 3, NULL, NULL),
(16, 2, 3, NULL, NULL),
(17, 2, 3, NULL, NULL),
(18, 2, 3, NULL, NULL),
(19, 2, 3, NULL, NULL),
(20, 2, 3, NULL, NULL),
(21, 2, 3, NULL, NULL),
(22, 2, 3, NULL, NULL),
(23, 2, 3, NULL, NULL),
(24, 2, 3, NULL, NULL),
(25, 2, 3, NULL, NULL),
(26, 2, 3, NULL, NULL),
(27, 2, 3, NULL, NULL),
(28, 2, 3, NULL, NULL),
(29, 2, 3, NULL, NULL),
(30, 2, 3, NULL, NULL),
(31, 2, 3, NULL, NULL),
(32, 2, 3, NULL, NULL),
(33, 2, 3, NULL, NULL),
(34, 2, 3, NULL, NULL),
(35, 2, 1, NULL, NULL),
(36, 2, 1, NULL, NULL),
(37, 2, 1, NULL, NULL),
(38, 2, 1, NULL, NULL),
(39, 2, 1, NULL, NULL),
(40, 2, 1, NULL, NULL),
(41, 2, 1, NULL, NULL),
(42, 2, 1, NULL, NULL),
(43, 2, 1, NULL, NULL),
(44, 2, 1, NULL, NULL),
(45, 2, 1, NULL, NULL),
(46, 2, 1, NULL, NULL),
(47, 2, 1, NULL, NULL),
(48, 2, 1, NULL, NULL),
(49, 2, 1, NULL, NULL),
(50, 2, 1, NULL, NULL),
(51, 2, 1, NULL, NULL),
(52, 2, 1, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL COMMENT '商品名称',
  `price` decimal(6,2) NOT NULL COMMENT '价格,单位：分',
  `stock` int(11) NOT NULL DEFAULT '0' COMMENT '库存量',
  `delete_time` int(11) DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `main_img_url` varchar(255) DEFAULT NULL COMMENT '主图ID号，这是一个反范式设计，有一定的冗余',
  `from` tinyint(4) NOT NULL DEFAULT '1' COMMENT '图片来自 1 本地 ，2公网',
  `create_time` int(11) DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) DEFAULT NULL,
  `summary` varchar(50) DEFAULT NULL COMMENT '摘要',
  `img_id` int(11) DEFAULT NULL COMMENT '图片外键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `product`
--

INSERT INTO `product` (`id`, `name`, `price`, `stock`, `delete_time`, `category_id`, `main_img_url`, `from`, `create_time`, `update_time`, `summary`, `img_id`) VALUES
(1, '芹菜 半斤', '0.01', 998, NULL, 3, '/product-vg@1.png', 1, NULL, NULL, NULL, 13),
(2, '梨花带雨 3个', '0.01', 984, NULL, 2, '/product-dryfruit@1.png', 1, NULL, NULL, NULL, 10),
(3, '素米 327克', '0.01', 996, NULL, 7, '/product-rice@1.png', 1, NULL, NULL, NULL, 31),
(4, '红袖枸杞 6克*3袋', '0.01', 998, NULL, 6, '/product-tea@1.png', 1, NULL, NULL, NULL, 32),
(5, '春生龙眼 500克', '0.01', 995, NULL, 2, '/product-dryfruit@2.png', 1, NULL, NULL, NULL, 33),
(6, '小红的猪耳朵 120克', '0.01', 997, NULL, 5, '/product-cake@2.png', 1, NULL, NULL, NULL, 53),
(7, '泥蒿 半斤', '0.01', 998, NULL, 3, '/product-vg@2.png', 1, NULL, NULL, NULL, 68),
(8, '夏日芒果 3个', '0.01', 995, NULL, 2, '/product-dryfruit@3.png', 1, NULL, NULL, NULL, 36),
(9, '冬木红枣 500克', '0.01', 996, NULL, 2, '/product-dryfruit@4.png', 1, NULL, NULL, NULL, 37),
(10, '万紫千凤梨 300克', '0.01', 996, NULL, 2, '/product-dryfruit@5.png', 1, NULL, NULL, NULL, 38),
(11, '贵妃笑 100克', '0.01', 994, NULL, 2, '/product-dryfruit-a@6.png', 1, NULL, NULL, NULL, 39),
(12, '珍奇异果 3个', '0.01', 999, NULL, 2, '/product-dryfruit@7.png', 1, NULL, NULL, NULL, 40),
(13, '绿豆 125克', '0.01', 999, NULL, 7, '/product-rice@2.png', 1, NULL, NULL, NULL, 41),
(14, '芝麻 50克', '0.01', 999, NULL, 7, '/product-rice@3.png', 1, NULL, NULL, NULL, 42),
(15, '猴头菇 370克', '0.01', 999, NULL, 7, '/product-rice@4.png', 1, NULL, NULL, NULL, 43),
(16, '西红柿 1斤', '0.01', 999, NULL, 3, '/product-vg@3.png', 1, NULL, NULL, NULL, 69),
(17, '油炸花生 300克', '0.01', 999, NULL, 4, '/product-fry@1.png', 1, NULL, NULL, NULL, 44),
(18, '春泥西瓜子 128克', '0.01', 997, NULL, 4, '/product-fry@2.png', 1, NULL, NULL, NULL, 45),
(19, '碧水葵花籽 128克', '0.01', 999, NULL, 4, '/product-fry@3.png', 1, NULL, NULL, NULL, 46),
(20, '碧螺春 12克*3袋', '0.01', 999, NULL, 6, '/product-tea@2.png', 1, NULL, NULL, NULL, 47),
(21, '西湖龙井 8克*3袋', '0.01', 998, NULL, 6, '/product-tea@3.png', 1, NULL, NULL, NULL, 48),
(22, '梅兰清花糕 1个', '0.01', 997, NULL, 5, '/product-cake-a@3.png', 1, NULL, NULL, NULL, 54),
(23, '清凉薄荷糕 1个', '0.01', 998, NULL, 5, '/product-cake-a@4.png', 1, NULL, NULL, NULL, 55),
(25, '小明的妙脆角 120克', '0.01', 999, NULL, 5, '/product-cake@1.png', 1, NULL, NULL, NULL, 52),
(26, '红衣青瓜 混搭160克', '0.01', 999, NULL, 2, '/product-dryfruit@8.png', 1, NULL, NULL, NULL, 56),
(27, '锈色瓜子 100克', '0.01', 998, NULL, 4, '/product-fry@4.png', 1, NULL, NULL, NULL, 57),
(28, '春泥花生 200克', '0.01', 999, NULL, 4, '/product-fry@5.png', 1, NULL, NULL, NULL, 58),
(29, '冰心鸡蛋 2个', '0.01', 999, NULL, 7, '/product-rice@5.png', 1, NULL, NULL, NULL, 59),
(30, '八宝莲子 200克', '0.01', 999, NULL, 7, '/product-rice@6.png', 1, NULL, NULL, NULL, 14),
(31, '深涧木耳 78克', '0.01', 999, NULL, 7, '/product-rice@7.png', 1, NULL, NULL, NULL, 60),
(32, '土豆 半斤', '0.01', 999, NULL, 3, '/product-vg@4.png', 1, NULL, NULL, NULL, 66),
(33, '青椒 半斤', '0.01', 999, NULL, 3, '/product-vg@5.png', 1, NULL, NULL, NULL, 67);

-- --------------------------------------------------------

--
-- 表的结构 `product_image`
--

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL,
  `img_id` int(11) NOT NULL COMMENT '外键，关联图片表',
  `delete_time` int(11) DEFAULT NULL COMMENT '状态，主要表示是否删除，也可以扩展其他状态',
  `order` int(11) NOT NULL DEFAULT '0' COMMENT '图片排序序号',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `product_image`
--

INSERT INTO `product_image` (`id`, `img_id`, `delete_time`, `order`, `product_id`) VALUES
(4, 19, NULL, 1, 11),
(5, 20, NULL, 2, 11),
(6, 21, NULL, 3, 11),
(7, 22, NULL, 4, 11),
(8, 23, NULL, 5, 11),
(9, 24, NULL, 6, 11),
(10, 25, NULL, 7, 11),
(11, 26, NULL, 8, 11),
(12, 27, NULL, 9, 11),
(13, 28, NULL, 11, 11),
(14, 29, NULL, 10, 11),
(18, 62, NULL, 12, 11),
(19, 63, NULL, 13, 11);

-- --------------------------------------------------------

--
-- 表的结构 `product_property`
--

CREATE TABLE `product_property` (
  `id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT '' COMMENT '详情属性名称',
  `detail` varchar(255) NOT NULL COMMENT '详情属性',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `product_property`
--

INSERT INTO `product_property` (`id`, `name`, `detail`, `product_id`, `delete_time`, `update_time`) VALUES
(1, '品名', '杨梅', 11, NULL, NULL),
(2, '口味', '青梅味 雪梨味 黄桃味 菠萝味', 11, NULL, NULL),
(3, '产地', '火星', 11, NULL, NULL),
(4, '保质期', '180天', 11, NULL, NULL),
(5, '品名', '梨子', 2, NULL, NULL),
(6, '产地', '金星', 2, NULL, NULL),
(7, '净含量', '100g', 2, NULL, NULL),
(8, '保质期', '10天', 2, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `theme`
--

CREATE TABLE `theme` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL COMMENT '专题名称',
  `description` varchar(255) DEFAULT NULL COMMENT '专题描述',
  `topic_img_id` int(11) NOT NULL COMMENT '主题图，外键',
  `delete_time` int(11) DEFAULT NULL,
  `head_img_id` int(11) NOT NULL COMMENT '专题列表页，头图',
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='主题信息表';

--
-- 转存表中的数据 `theme`
--

INSERT INTO `theme` (`id`, `name`, `description`, `topic_img_id`, `delete_time`, `head_img_id`, `update_time`) VALUES
(1, '专题栏位一', '美味水果世界', 16, NULL, 49, NULL),
(2, '专题栏位二', '新品推荐', 17, NULL, 50, NULL),
(3, '专题栏位三', '做个干物女', 18, NULL, 18, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `theme_product`
--

CREATE TABLE `theme_product` (
  `theme_id` int(11) NOT NULL COMMENT '主题外键',
  `product_id` int(11) NOT NULL COMMENT '商品外键'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='主题所包含的商品';

--
-- 转存表中的数据 `theme_product`
--

INSERT INTO `theme_product` (`theme_id`, `product_id`) VALUES
(1, 2),
(1, 5),
(1, 8),
(1, 10),
(1, 12),
(2, 1),
(2, 2),
(2, 3),
(2, 5),
(2, 6),
(2, 16),
(2, 33),
(3, 15),
(3, 18),
(3, 19),
(3, 27),
(3, 30),
(3, 31);

-- --------------------------------------------------------

--
-- 表的结构 `third_app`
--

CREATE TABLE `third_app` (
  `id` int(11) NOT NULL,
  `app_id` varchar(64) NOT NULL COMMENT '应用app_id',
  `app_secret` varchar(64) NOT NULL COMMENT '应用secret',
  `app_description` varchar(100) DEFAULT NULL COMMENT '应用程序描述',
  `scope` varchar(20) NOT NULL COMMENT '应用权限',
  `scope_description` varchar(100) DEFAULT NULL COMMENT '权限描述',
  `delete_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='访问API的各应用账号密码表';

--
-- 转存表中的数据 `third_app`
--

INSERT INTO `third_app` (`id`, `app_id`, `app_secret`, `app_description`, `scope`, `scope_description`, `delete_time`, `update_time`) VALUES
(1, 'starcraft', '777*777', 'CMS', '32', 'Super', NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `openid` varchar(50) NOT NULL,
  `nickname` varchar(50) DEFAULT NULL,
  `extend` varchar(255) DEFAULT NULL,
  `delete_time` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL COMMENT '注册时间',
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `user`
--

INSERT INTO `user` (`id`, `openid`, `nickname`, `extend`, `delete_time`, `create_time`, `update_time`) VALUES
(1, 'o7ayV5HwrLtiFZiF-OrA595TwMFc', NULL, NULL, NULL, NULL, NULL),
(2, 'oKN095cIhnWvP3VX2Be1tXW43HfE', NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `user_address`
--

CREATE TABLE `user_address` (
  `id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL COMMENT '收获人姓名',
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `province` varchar(20) DEFAULT NULL COMMENT '省',
  `city` varchar(20) DEFAULT NULL COMMENT '市',
  `country` varchar(20) DEFAULT NULL COMMENT '区',
  `detail` varchar(100) DEFAULT NULL COMMENT '详细地址',
  `delete_time` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT '外键',
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 转存表中的数据 `user_address`
--

INSERT INTO `user_address` (`id`, `name`, `mobile`, `province`, `city`, `country`, `detail`, `delete_time`, `user_id`, `update_time`) VALUES
(1, 'lu', '15623358482', '广东', '广州', '中国', '大学城广州大学', NULL, 1, NULL),
(2, '李玮锋', '15623358482', '广东', '广州', '中国', '大学城广州大学', NULL, 2, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner_item`
--
ALTER TABLE `banner_item`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_no` (`order_no`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_product`
--
ALTER TABLE `order_product`
  ADD PRIMARY KEY (`product_id`,`order_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_property`
--
ALTER TABLE `product_property`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `theme_product`
--
ALTER TABLE `theme_product`
  ADD PRIMARY KEY (`theme_id`,`product_id`);

--
-- Indexes for table `third_app`
--
ALTER TABLE `third_app`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `openid` (`openid`);

--
-- Indexes for table `user_address`
--
ALTER TABLE `user_address`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- 在导出的表使用AUTO_INCREMENT
--

--
-- 使用表AUTO_INCREMENT `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `banner_item`
--
ALTER TABLE `banner_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- 使用表AUTO_INCREMENT `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- 使用表AUTO_INCREMENT `image`
--
ALTER TABLE `image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;
--
-- 使用表AUTO_INCREMENT `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;
--
-- 使用表AUTO_INCREMENT `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;
--
-- 使用表AUTO_INCREMENT `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- 使用表AUTO_INCREMENT `product_property`
--
ALTER TABLE `product_property`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- 使用表AUTO_INCREMENT `theme`
--
ALTER TABLE `theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- 使用表AUTO_INCREMENT `third_app`
--
ALTER TABLE `third_app`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- 使用表AUTO_INCREMENT `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- 使用表AUTO_INCREMENT `user_address`
--
ALTER TABLE `user_address`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
