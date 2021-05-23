-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 23, 2021 at 07:33 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `thebrowncurves`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbc_actionscheduler_actions`
--

CREATE TABLE `tbc_actionscheduler_actions` (
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `hook` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `scheduled_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `scheduled_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `args` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `schedule` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `group_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `last_attempt_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `last_attempt_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `claim_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `extended_args` varchar(8000) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_actionscheduler_actions`
--

INSERT INTO `tbc_actionscheduler_actions` (`action_id`, `hook`, `status`, `scheduled_date_gmt`, `scheduled_date_local`, `args`, `schedule`, `group_id`, `attempts`, `last_attempt_gmt`, `last_attempt_local`, `claim_id`, `extended_args`) VALUES
(84, 'action_scheduler/migration_hook', 'complete', '2021-05-17 15:35:05', '2021-05-17 15:35:05', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1621265705;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1621265705;}', 1, 1, '2021-05-17 15:35:21', '2021-05-17 15:35:21', 0, NULL),
(85, 'woocommerce_update_marketplace_suggestions', 'complete', '2021-05-17 15:39:30', '2021-05-17 15:39:30', '[]', 'O:30:\"ActionScheduler_SimpleSchedule\":2:{s:22:\"\0*\0scheduled_timestamp\";i:1621265970;s:41:\"\0ActionScheduler_SimpleSchedule\0timestamp\";i:1621265970;}', 0, 1, '2021-05-17 15:39:31', '2021-05-17 15:39:31', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbc_actionscheduler_claims`
--

CREATE TABLE `tbc_actionscheduler_claims` (
  `claim_id` bigint(20) UNSIGNED NOT NULL,
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_actionscheduler_groups`
--

CREATE TABLE `tbc_actionscheduler_groups` (
  `group_id` bigint(20) UNSIGNED NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_actionscheduler_groups`
--

INSERT INTO `tbc_actionscheduler_groups` (`group_id`, `slug`) VALUES
(1, 'action-scheduler-migration');

-- --------------------------------------------------------

--
-- Table structure for table `tbc_actionscheduler_logs`
--

CREATE TABLE `tbc_actionscheduler_logs` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `log_date_local` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_actionscheduler_logs`
--

INSERT INTO `tbc_actionscheduler_logs` (`log_id`, `action_id`, `message`, `log_date_gmt`, `log_date_local`) VALUES
(1, 84, 'action created', '2021-05-17 15:34:05', '2021-05-17 15:34:05'),
(2, 84, 'action started via WP Cron', '2021-05-17 15:35:21', '2021-05-17 15:35:21'),
(3, 84, 'action complete via WP Cron', '2021-05-17 15:35:21', '2021-05-17 15:35:21'),
(4, 85, 'action created', '2021-05-17 15:39:30', '2021-05-17 15:39:30'),
(5, 85, 'action started via Async Request', '2021-05-17 15:39:31', '2021-05-17 15:39:31'),
(6, 85, 'action complete via Async Request', '2021-05-17 15:39:31', '2021-05-17 15:39:31');

-- --------------------------------------------------------

--
-- Table structure for table `tbc_commentmeta`
--

CREATE TABLE `tbc_commentmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `comment_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_comments`
--

CREATE TABLE `tbc_comments` (
  `comment_ID` bigint(20) UNSIGNED NOT NULL,
  `comment_post_ID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT 0,
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'comment',
  `comment_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_comments`
--

INSERT INTO `tbc_comments` (`comment_ID`, `comment_post_ID`, `comment_author`, `comment_author_email`, `comment_author_url`, `comment_author_IP`, `comment_date`, `comment_date_gmt`, `comment_content`, `comment_karma`, `comment_approved`, `comment_agent`, `comment_type`, `comment_parent`, `user_id`) VALUES
(1, 1, 'A WordPress Commenter', 'wapuu@wordpress.example', 'https://wordpress.org/', '', '2021-05-13 19:07:03', '2021-05-13 19:07:03', 'Hi, this is a comment.\nTo get started with moderating, editing, and deleting comments, please visit the Comments screen in the dashboard.\nCommenter avatars come from <a href=\"https://gravatar.com\">Gravatar</a>.', 0, '1', '', 'comment', 0, 0),
(2, 59, 'admin', 'giribhagirath169@gmail.com', '', '127.0.0.1', '2021-05-16 19:15:25', '2021-05-16 19:15:25', 'qwerty', 0, '1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'comment', 0, 1),
(3, 59, 'BHAGIRATH GIRI', 'giribhagirath169@gmail.com', '', '127.0.0.1', '2021-05-16 19:15:50', '2021-05-16 19:15:50', 'qwertyhgfqsw', 0, '1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'comment', 2, 0),
(4, 59, 'admin', 'giribhagirath169@gmail.com', '', '127.0.0.1', '2021-05-16 19:20:13', '2021-05-16 19:20:13', '1q2werty', 0, '1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'comment', 3, 1),
(5, 59, 'admin', 'giribhagirath169@gmail.com', '', '127.0.0.1', '2021-05-16 19:20:19', '2021-05-16 19:20:19', 'sdsfgdfsd', 0, '1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36', 'comment', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbc_links`
--

CREATE TABLE `tbc_links` (
  `link_id` bigint(20) UNSIGNED NOT NULL,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) UNSIGNED NOT NULL DEFAULT 1,
  `link_rating` int(11) NOT NULL DEFAULT 0,
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_newsletter`
--

CREATE TABLE `tbc_newsletter` (
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `token` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `status` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'S',
  `id` int(11) NOT NULL,
  `profile` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated` int(11) NOT NULL DEFAULT 0,
  `last_activity` int(11) NOT NULL DEFAULT 0,
  `followup_step` tinyint(4) NOT NULL DEFAULT 0,
  `followup_time` bigint(20) NOT NULL DEFAULT 0,
  `followup` tinyint(4) NOT NULL DEFAULT 0,
  `surname` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sex` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'n',
  `feed_time` bigint(20) NOT NULL DEFAULT 0,
  `feed` tinyint(4) NOT NULL DEFAULT 0,
  `referrer` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `wp_user_id` int(11) NOT NULL DEFAULT 0,
  `http_referer` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `geo` tinyint(4) NOT NULL DEFAULT 0,
  `country` varchar(4) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `region` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bounce_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bounce_time` int(11) NOT NULL DEFAULT 0,
  `unsub_email_id` int(11) NOT NULL DEFAULT 0,
  `unsub_time` int(11) NOT NULL DEFAULT 0,
  `list_1` tinyint(4) NOT NULL DEFAULT 0,
  `list_2` tinyint(4) NOT NULL DEFAULT 0,
  `list_3` tinyint(4) NOT NULL DEFAULT 0,
  `list_4` tinyint(4) NOT NULL DEFAULT 0,
  `list_5` tinyint(4) NOT NULL DEFAULT 0,
  `list_6` tinyint(4) NOT NULL DEFAULT 0,
  `list_7` tinyint(4) NOT NULL DEFAULT 0,
  `list_8` tinyint(4) NOT NULL DEFAULT 0,
  `list_9` tinyint(4) NOT NULL DEFAULT 0,
  `list_10` tinyint(4) NOT NULL DEFAULT 0,
  `list_11` tinyint(4) NOT NULL DEFAULT 0,
  `list_12` tinyint(4) NOT NULL DEFAULT 0,
  `list_13` tinyint(4) NOT NULL DEFAULT 0,
  `list_14` tinyint(4) NOT NULL DEFAULT 0,
  `list_15` tinyint(4) NOT NULL DEFAULT 0,
  `list_16` tinyint(4) NOT NULL DEFAULT 0,
  `list_17` tinyint(4) NOT NULL DEFAULT 0,
  `list_18` tinyint(4) NOT NULL DEFAULT 0,
  `list_19` tinyint(4) NOT NULL DEFAULT 0,
  `list_20` tinyint(4) NOT NULL DEFAULT 0,
  `list_21` tinyint(4) NOT NULL DEFAULT 0,
  `list_22` tinyint(4) NOT NULL DEFAULT 0,
  `list_23` tinyint(4) NOT NULL DEFAULT 0,
  `list_24` tinyint(4) NOT NULL DEFAULT 0,
  `list_25` tinyint(4) NOT NULL DEFAULT 0,
  `list_26` tinyint(4) NOT NULL DEFAULT 0,
  `list_27` tinyint(4) NOT NULL DEFAULT 0,
  `list_28` tinyint(4) NOT NULL DEFAULT 0,
  `list_29` tinyint(4) NOT NULL DEFAULT 0,
  `list_30` tinyint(4) NOT NULL DEFAULT 0,
  `list_31` tinyint(4) NOT NULL DEFAULT 0,
  `list_32` tinyint(4) NOT NULL DEFAULT 0,
  `list_33` tinyint(4) NOT NULL DEFAULT 0,
  `list_34` tinyint(4) NOT NULL DEFAULT 0,
  `list_35` tinyint(4) NOT NULL DEFAULT 0,
  `list_36` tinyint(4) NOT NULL DEFAULT 0,
  `list_37` tinyint(4) NOT NULL DEFAULT 0,
  `list_38` tinyint(4) NOT NULL DEFAULT 0,
  `list_39` tinyint(4) NOT NULL DEFAULT 0,
  `list_40` tinyint(4) NOT NULL DEFAULT 0,
  `profile_1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_4` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_5` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_6` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_7` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_8` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_9` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_10` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_11` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_12` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_13` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_14` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_15` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_16` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_17` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_18` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_19` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `profile_20` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `test` tinyint(4) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_newsletter`
--

INSERT INTO `tbc_newsletter` (`name`, `email`, `token`, `language`, `status`, `id`, `profile`, `created`, `updated`, `last_activity`, `followup_step`, `followup_time`, `followup`, `surname`, `sex`, `feed_time`, `feed`, `referrer`, `ip`, `wp_user_id`, `http_referer`, `geo`, `country`, `region`, `city`, `bounce_type`, `bounce_time`, `unsub_email_id`, `unsub_time`, `list_1`, `list_2`, `list_3`, `list_4`, `list_5`, `list_6`, `list_7`, `list_8`, `list_9`, `list_10`, `list_11`, `list_12`, `list_13`, `list_14`, `list_15`, `list_16`, `list_17`, `list_18`, `list_19`, `list_20`, `list_21`, `list_22`, `list_23`, `list_24`, `list_25`, `list_26`, `list_27`, `list_28`, `list_29`, `list_30`, `list_31`, `list_32`, `list_33`, `list_34`, `list_35`, `list_36`, `list_37`, `list_38`, `list_39`, `list_40`, `profile_1`, `profile_2`, `profile_3`, `profile_4`, `profile_5`, `profile_6`, `profile_7`, `profile_8`, `profile_9`, `profile_10`, `profile_11`, `profile_12`, `profile_13`, `profile_14`, `profile_15`, `profile_16`, `profile_17`, `profile_18`, `profile_19`, `profile_20`, `test`) VALUES
('The Brown', 'giribhagirath169@gmail.com', '707ff92123', '', 'C', 1, NULL, '2021-05-17 13:40:48', 0, 0, 0, 0, 0, 'Curves', 'n', 0, 0, '', '', 0, '', 0, '', '', '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', '', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbc_newsletter_emails`
--

CREATE TABLE `tbc_newsletter_emails` (
  `id` int(11) NOT NULL,
  `language` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('new','sending','sent','paused','error') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'new',
  `total` int(11) NOT NULL DEFAULT 0,
  `last_id` int(11) NOT NULL DEFAULT 0,
  `sent` int(11) NOT NULL DEFAULT 0,
  `track` int(11) NOT NULL DEFAULT 1,
  `list` int(11) NOT NULL DEFAULT 0,
  `type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `query` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `editor` tinyint(4) NOT NULL DEFAULT 0,
  `sex` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `theme` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message_text` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferences` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `send_on` int(11) NOT NULL DEFAULT 0,
  `token` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `options` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `private` tinyint(1) NOT NULL DEFAULT 0,
  `click_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `version` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `open_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `unsub_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `error_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `stats_time` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_newsletter_sent`
--

CREATE TABLE `tbc_newsletter_sent` (
  `email_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `open` tinyint(1) UNSIGNED NOT NULL DEFAULT 0,
  `time` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `error` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ip` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_newsletter_stats`
--

CREATE TABLE `tbc_newsletter_stats` (
  `id` int(11) NOT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp(),
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `email_id` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `ip` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_newsletter_user_logs`
--

CREATE TABLE `tbc_newsletter_user_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `ip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `source` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_options`
--

CREATE TABLE `tbc_options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `option_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `autoload` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'yes'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_options`
--

INSERT INTO `tbc_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(1, 'siteurl', 'http://localhost/thebrowncurves', 'yes'),
(2, 'home', 'http://localhost/thebrowncurves', 'yes'),
(3, 'blogname', 'The Brown Curves', 'yes'),
(4, 'blogdescription', '', 'yes'),
(5, 'users_can_register', '0', 'yes'),
(6, 'admin_email', 'giribhagirath169@gmail.com', 'yes'),
(7, 'start_of_week', '1', 'yes'),
(8, 'use_balanceTags', '0', 'yes'),
(9, 'use_smilies', '1', 'yes'),
(10, 'require_name_email', '1', 'yes'),
(11, 'comments_notify', '1', 'yes'),
(12, 'posts_per_rss', '10', 'yes'),
(13, 'rss_use_excerpt', '0', 'yes'),
(14, 'mailserver_url', 'mail.example.com', 'yes'),
(15, 'mailserver_login', 'login@example.com', 'yes'),
(16, 'mailserver_pass', 'password', 'yes'),
(17, 'mailserver_port', '110', 'yes'),
(18, 'default_category', '1', 'yes'),
(19, 'default_comment_status', 'open', 'yes'),
(20, 'default_ping_status', 'open', 'yes'),
(21, 'default_pingback_flag', '1', 'yes'),
(22, 'posts_per_page', '10', 'yes'),
(23, 'date_format', 'F j, Y', 'yes'),
(24, 'time_format', 'g:i a', 'yes'),
(25, 'links_updated_date_format', 'F j, Y g:i a', 'yes'),
(26, 'comment_moderation', '0', 'yes'),
(27, 'moderation_notify', '1', 'yes'),
(28, 'permalink_structure', '/%year%/%monthnum%/%day%/%postname%/', 'yes'),
(29, 'rewrite_rules', 'a:208:{s:24:\"^wc-auth/v([1]{1})/(.*)?\";s:63:\"index.php?wc-auth-version=$matches[1]&wc-auth-route=$matches[2]\";s:22:\"^wc-api/v([1-3]{1})/?$\";s:51:\"index.php?wc-api-version=$matches[1]&wc-api-route=/\";s:24:\"^wc-api/v([1-3]{1})(.*)?\";s:61:\"index.php?wc-api-version=$matches[1]&wc-api-route=$matches[2]\";s:14:\"testimonial/?$\";s:31:\"index.php?post_type=testimonial\";s:44:\"testimonial/feed/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?post_type=testimonial&feed=$matches[1]\";s:39:\"testimonial/(feed|rdf|rss|rss2|atom)/?$\";s:48:\"index.php?post_type=testimonial&feed=$matches[1]\";s:31:\"testimonial/page/([0-9]{1,})/?$\";s:49:\"index.php?post_type=testimonial&paged=$matches[1]\";s:9:\"slider/?$\";s:26:\"index.php?post_type=slider\";s:39:\"slider/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=slider&feed=$matches[1]\";s:34:\"slider/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?post_type=slider&feed=$matches[1]\";s:26:\"slider/page/([0-9]{1,})/?$\";s:44:\"index.php?post_type=slider&paged=$matches[1]\";s:11:\"^wp-json/?$\";s:22:\"index.php?rest_route=/\";s:14:\"^wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:21:\"^index.php/wp-json/?$\";s:22:\"index.php?rest_route=/\";s:24:\"^index.php/wp-json/(.*)?\";s:33:\"index.php?rest_route=/$matches[1]\";s:17:\"^wp-sitemap\\.xml$\";s:23:\"index.php?sitemap=index\";s:17:\"^wp-sitemap\\.xsl$\";s:36:\"index.php?sitemap-stylesheet=sitemap\";s:23:\"^wp-sitemap-index\\.xsl$\";s:34:\"index.php?sitemap-stylesheet=index\";s:48:\"^wp-sitemap-([a-z]+?)-([a-z\\d_-]+?)-(\\d+?)\\.xml$\";s:75:\"index.php?sitemap=$matches[1]&sitemap-subtype=$matches[2]&paged=$matches[3]\";s:34:\"^wp-sitemap-([a-z]+?)-(\\d+?)\\.xml$\";s:47:\"index.php?sitemap=$matches[1]&paged=$matches[2]\";s:47:\"category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:42:\"category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:52:\"index.php?category_name=$matches[1]&feed=$matches[2]\";s:23:\"category/(.+?)/embed/?$\";s:46:\"index.php?category_name=$matches[1]&embed=true\";s:35:\"category/(.+?)/page/?([0-9]{1,})/?$\";s:53:\"index.php?category_name=$matches[1]&paged=$matches[2]\";s:32:\"category/(.+?)/wc-api(/(.*))?/?$\";s:54:\"index.php?category_name=$matches[1]&wc-api=$matches[3]\";s:17:\"category/(.+?)/?$\";s:35:\"index.php?category_name=$matches[1]\";s:44:\"tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:39:\"tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?tag=$matches[1]&feed=$matches[2]\";s:20:\"tag/([^/]+)/embed/?$\";s:36:\"index.php?tag=$matches[1]&embed=true\";s:32:\"tag/([^/]+)/page/?([0-9]{1,})/?$\";s:43:\"index.php?tag=$matches[1]&paged=$matches[2]\";s:29:\"tag/([^/]+)/wc-api(/(.*))?/?$\";s:44:\"index.php?tag=$matches[1]&wc-api=$matches[3]\";s:14:\"tag/([^/]+)/?$\";s:25:\"index.php?tag=$matches[1]\";s:45:\"type/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:40:\"type/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?post_format=$matches[1]&feed=$matches[2]\";s:21:\"type/([^/]+)/embed/?$\";s:44:\"index.php?post_format=$matches[1]&embed=true\";s:33:\"type/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?post_format=$matches[1]&paged=$matches[2]\";s:15:\"type/([^/]+)/?$\";s:33:\"index.php?post_format=$matches[1]\";s:39:\"testimonial/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:49:\"testimonial/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:69:\"testimonial/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:64:\"testimonial/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:64:\"testimonial/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:45:\"testimonial/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:28:\"testimonial/([^/]+)/embed/?$\";s:44:\"index.php?testimonial=$matches[1]&embed=true\";s:32:\"testimonial/([^/]+)/trackback/?$\";s:38:\"index.php?testimonial=$matches[1]&tb=1\";s:52:\"testimonial/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?testimonial=$matches[1]&feed=$matches[2]\";s:47:\"testimonial/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?testimonial=$matches[1]&feed=$matches[2]\";s:40:\"testimonial/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?testimonial=$matches[1]&paged=$matches[2]\";s:47:\"testimonial/([^/]+)/comment-page-([0-9]{1,})/?$\";s:51:\"index.php?testimonial=$matches[1]&cpage=$matches[2]\";s:37:\"testimonial/([^/]+)/wc-api(/(.*))?/?$\";s:52:\"index.php?testimonial=$matches[1]&wc-api=$matches[3]\";s:43:\"testimonial/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:54:\"testimonial/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:36:\"testimonial/([^/]+)(?:/([0-9]+))?/?$\";s:50:\"index.php?testimonial=$matches[1]&page=$matches[2]\";s:28:\"testimonial/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:38:\"testimonial/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:58:\"testimonial/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:53:\"testimonial/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:53:\"testimonial/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:34:\"testimonial/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:34:\"slider/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:44:\"slider/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:64:\"slider/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"slider/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:59:\"slider/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:40:\"slider/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:23:\"slider/([^/]+)/embed/?$\";s:39:\"index.php?slider=$matches[1]&embed=true\";s:27:\"slider/([^/]+)/trackback/?$\";s:33:\"index.php?slider=$matches[1]&tb=1\";s:47:\"slider/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?slider=$matches[1]&feed=$matches[2]\";s:42:\"slider/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:45:\"index.php?slider=$matches[1]&feed=$matches[2]\";s:35:\"slider/([^/]+)/page/?([0-9]{1,})/?$\";s:46:\"index.php?slider=$matches[1]&paged=$matches[2]\";s:42:\"slider/([^/]+)/comment-page-([0-9]{1,})/?$\";s:46:\"index.php?slider=$matches[1]&cpage=$matches[2]\";s:32:\"slider/([^/]+)/wc-api(/(.*))?/?$\";s:47:\"index.php?slider=$matches[1]&wc-api=$matches[3]\";s:38:\"slider/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:49:\"slider/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:31:\"slider/([^/]+)(?:/([0-9]+))?/?$\";s:45:\"index.php?slider=$matches[1]&page=$matches[2]\";s:23:\"slider/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:33:\"slider/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:53:\"slider/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"slider/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:48:\"slider/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:29:\"slider/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:55:\"product-category/(.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:50:\"product-category/(.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_cat=$matches[1]&feed=$matches[2]\";s:31:\"product-category/(.+?)/embed/?$\";s:44:\"index.php?product_cat=$matches[1]&embed=true\";s:43:\"product-category/(.+?)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_cat=$matches[1]&paged=$matches[2]\";s:25:\"product-category/(.+?)/?$\";s:33:\"index.php?product_cat=$matches[1]\";s:52:\"product-tag/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:47:\"product-tag/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?product_tag=$matches[1]&feed=$matches[2]\";s:28:\"product-tag/([^/]+)/embed/?$\";s:44:\"index.php?product_tag=$matches[1]&embed=true\";s:40:\"product-tag/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?product_tag=$matches[1]&paged=$matches[2]\";s:22:\"product-tag/([^/]+)/?$\";s:33:\"index.php?product_tag=$matches[1]\";s:35:\"product/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:45:\"product/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:65:\"product/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:60:\"product/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:41:\"product/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:24:\"product/([^/]+)/embed/?$\";s:40:\"index.php?product=$matches[1]&embed=true\";s:28:\"product/([^/]+)/trackback/?$\";s:34:\"index.php?product=$matches[1]&tb=1\";s:36:\"product/([^/]+)/page/?([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&paged=$matches[2]\";s:43:\"product/([^/]+)/comment-page-([0-9]{1,})/?$\";s:47:\"index.php?product=$matches[1]&cpage=$matches[2]\";s:33:\"product/([^/]+)/wc-api(/(.*))?/?$\";s:48:\"index.php?product=$matches[1]&wc-api=$matches[3]\";s:39:\"product/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:50:\"product/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:32:\"product/([^/]+)(?:/([0-9]+))?/?$\";s:46:\"index.php?product=$matches[1]&page=$matches[2]\";s:24:\"product/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:34:\"product/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:54:\"product/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:49:\"product/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:30:\"product/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:48:\".*wp-(atom|rdf|rss|rss2|feed|commentsrss2)\\.php$\";s:18:\"index.php?feed=old\";s:20:\".*wp-app\\.php(/.*)?$\";s:19:\"index.php?error=403\";s:18:\".*wp-register.php$\";s:23:\"index.php?register=true\";s:32:\"feed/(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:27:\"(feed|rdf|rss|rss2|atom)/?$\";s:27:\"index.php?&feed=$matches[1]\";s:8:\"embed/?$\";s:21:\"index.php?&embed=true\";s:20:\"page/?([0-9]{1,})/?$\";s:28:\"index.php?&paged=$matches[1]\";s:27:\"comment-page-([0-9]{1,})/?$\";s:38:\"index.php?&page_id=5&cpage=$matches[1]\";s:17:\"wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:41:\"comments/feed/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:36:\"comments/(feed|rdf|rss|rss2|atom)/?$\";s:42:\"index.php?&feed=$matches[1]&withcomments=1\";s:17:\"comments/embed/?$\";s:21:\"index.php?&embed=true\";s:26:\"comments/wc-api(/(.*))?/?$\";s:29:\"index.php?&wc-api=$matches[2]\";s:44:\"search/(.+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:39:\"search/(.+)/(feed|rdf|rss|rss2|atom)/?$\";s:40:\"index.php?s=$matches[1]&feed=$matches[2]\";s:20:\"search/(.+)/embed/?$\";s:34:\"index.php?s=$matches[1]&embed=true\";s:32:\"search/(.+)/page/?([0-9]{1,})/?$\";s:41:\"index.php?s=$matches[1]&paged=$matches[2]\";s:29:\"search/(.+)/wc-api(/(.*))?/?$\";s:42:\"index.php?s=$matches[1]&wc-api=$matches[3]\";s:14:\"search/(.+)/?$\";s:23:\"index.php?s=$matches[1]\";s:47:\"author/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:42:\"author/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:50:\"index.php?author_name=$matches[1]&feed=$matches[2]\";s:23:\"author/([^/]+)/embed/?$\";s:44:\"index.php?author_name=$matches[1]&embed=true\";s:35:\"author/([^/]+)/page/?([0-9]{1,})/?$\";s:51:\"index.php?author_name=$matches[1]&paged=$matches[2]\";s:32:\"author/([^/]+)/wc-api(/(.*))?/?$\";s:52:\"index.php?author_name=$matches[1]&wc-api=$matches[3]\";s:17:\"author/([^/]+)/?$\";s:33:\"index.php?author_name=$matches[1]\";s:69:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:80:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&feed=$matches[4]\";s:45:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/embed/?$\";s:74:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&paged=$matches[4]\";s:54:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:82:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&wc-api=$matches[5]\";s:39:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/?$\";s:63:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]\";s:56:\"([0-9]{4})/([0-9]{1,2})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:51:\"([0-9]{4})/([0-9]{1,2})/(feed|rdf|rss|rss2|atom)/?$\";s:64:\"index.php?year=$matches[1]&monthnum=$matches[2]&feed=$matches[3]\";s:32:\"([0-9]{4})/([0-9]{1,2})/embed/?$\";s:58:\"index.php?year=$matches[1]&monthnum=$matches[2]&embed=true\";s:44:\"([0-9]{4})/([0-9]{1,2})/page/?([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&paged=$matches[3]\";s:41:\"([0-9]{4})/([0-9]{1,2})/wc-api(/(.*))?/?$\";s:66:\"index.php?year=$matches[1]&monthnum=$matches[2]&wc-api=$matches[4]\";s:26:\"([0-9]{4})/([0-9]{1,2})/?$\";s:47:\"index.php?year=$matches[1]&monthnum=$matches[2]\";s:43:\"([0-9]{4})/feed/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:38:\"([0-9]{4})/(feed|rdf|rss|rss2|atom)/?$\";s:43:\"index.php?year=$matches[1]&feed=$matches[2]\";s:19:\"([0-9]{4})/embed/?$\";s:37:\"index.php?year=$matches[1]&embed=true\";s:31:\"([0-9]{4})/page/?([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&paged=$matches[2]\";s:28:\"([0-9]{4})/wc-api(/(.*))?/?$\";s:45:\"index.php?year=$matches[1]&wc-api=$matches[3]\";s:13:\"([0-9]{4})/?$\";s:26:\"index.php?year=$matches[1]\";s:58:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:68:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:88:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:83:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:64:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:53:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/embed/?$\";s:91:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&embed=true\";s:57:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/trackback/?$\";s:85:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&tb=1\";s:77:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&feed=$matches[5]\";s:65:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/page/?([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&paged=$matches[5]\";s:72:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/comment-page-([0-9]{1,})/?$\";s:98:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&cpage=$matches[5]\";s:62:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)/wc-api(/(.*))?/?$\";s:99:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&wc-api=$matches[6]\";s:62:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:73:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:61:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/([^/]+)(?:/([0-9]+))?/?$\";s:97:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&name=$matches[4]&page=$matches[5]\";s:47:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:57:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:77:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:72:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:53:\"[0-9]{4}/[0-9]{1,2}/[0-9]{1,2}/[^/]+/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:64:\"([0-9]{4})/([0-9]{1,2})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:81:\"index.php?year=$matches[1]&monthnum=$matches[2]&day=$matches[3]&cpage=$matches[4]\";s:51:\"([0-9]{4})/([0-9]{1,2})/comment-page-([0-9]{1,})/?$\";s:65:\"index.php?year=$matches[1]&monthnum=$matches[2]&cpage=$matches[3]\";s:38:\"([0-9]{4})/comment-page-([0-9]{1,})/?$\";s:44:\"index.php?year=$matches[1]&cpage=$matches[2]\";s:27:\".?.+?/attachment/([^/]+)/?$\";s:32:\"index.php?attachment=$matches[1]\";s:37:\".?.+?/attachment/([^/]+)/trackback/?$\";s:37:\"index.php?attachment=$matches[1]&tb=1\";s:57:\".?.+?/attachment/([^/]+)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/(feed|rdf|rss|rss2|atom)/?$\";s:49:\"index.php?attachment=$matches[1]&feed=$matches[2]\";s:52:\".?.+?/attachment/([^/]+)/comment-page-([0-9]{1,})/?$\";s:50:\"index.php?attachment=$matches[1]&cpage=$matches[2]\";s:33:\".?.+?/attachment/([^/]+)/embed/?$\";s:43:\"index.php?attachment=$matches[1]&embed=true\";s:16:\"(.?.+?)/embed/?$\";s:41:\"index.php?pagename=$matches[1]&embed=true\";s:20:\"(.?.+?)/trackback/?$\";s:35:\"index.php?pagename=$matches[1]&tb=1\";s:40:\"(.?.+?)/feed/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:35:\"(.?.+?)/(feed|rdf|rss|rss2|atom)/?$\";s:47:\"index.php?pagename=$matches[1]&feed=$matches[2]\";s:28:\"(.?.+?)/page/?([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&paged=$matches[2]\";s:35:\"(.?.+?)/comment-page-([0-9]{1,})/?$\";s:48:\"index.php?pagename=$matches[1]&cpage=$matches[2]\";s:25:\"(.?.+?)/wc-api(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&wc-api=$matches[3]\";s:28:\"(.?.+?)/order-pay(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&order-pay=$matches[3]\";s:33:\"(.?.+?)/order-received(/(.*))?/?$\";s:57:\"index.php?pagename=$matches[1]&order-received=$matches[3]\";s:25:\"(.?.+?)/orders(/(.*))?/?$\";s:49:\"index.php?pagename=$matches[1]&orders=$matches[3]\";s:29:\"(.?.+?)/view-order(/(.*))?/?$\";s:53:\"index.php?pagename=$matches[1]&view-order=$matches[3]\";s:28:\"(.?.+?)/downloads(/(.*))?/?$\";s:52:\"index.php?pagename=$matches[1]&downloads=$matches[3]\";s:31:\"(.?.+?)/edit-account(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-account=$matches[3]\";s:31:\"(.?.+?)/edit-address(/(.*))?/?$\";s:55:\"index.php?pagename=$matches[1]&edit-address=$matches[3]\";s:34:\"(.?.+?)/payment-methods(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&payment-methods=$matches[3]\";s:32:\"(.?.+?)/lost-password(/(.*))?/?$\";s:56:\"index.php?pagename=$matches[1]&lost-password=$matches[3]\";s:34:\"(.?.+?)/customer-logout(/(.*))?/?$\";s:58:\"index.php?pagename=$matches[1]&customer-logout=$matches[3]\";s:37:\"(.?.+?)/add-payment-method(/(.*))?/?$\";s:61:\"index.php?pagename=$matches[1]&add-payment-method=$matches[3]\";s:40:\"(.?.+?)/delete-payment-method(/(.*))?/?$\";s:64:\"index.php?pagename=$matches[1]&delete-payment-method=$matches[3]\";s:45:\"(.?.+?)/set-default-payment-method(/(.*))?/?$\";s:69:\"index.php?pagename=$matches[1]&set-default-payment-method=$matches[3]\";s:31:\".?.+?/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:42:\".?.+?/attachment/([^/]+)/wc-api(/(.*))?/?$\";s:51:\"index.php?attachment=$matches[1]&wc-api=$matches[3]\";s:24:\"(.?.+?)(?:/([0-9]+))?/?$\";s:47:\"index.php?pagename=$matches[1]&page=$matches[2]\";}', 'yes'),
(30, 'hack_file', '0', 'yes'),
(31, 'blog_charset', 'UTF-8', 'yes'),
(32, 'moderation_keys', '', 'no'),
(33, 'active_plugins', 'a:7:{i:0;s:29:\"acf-repeater/acf-repeater.php\";i:1;s:30:\"advanced-custom-fields/acf.php\";i:2;s:36:\"contact-form-7/wp-contact-form-7.php\";i:3;s:29:\"easy-wp-smtp/easy-wp-smtp.php\";i:4;s:57:\"google-language-translator/google-language-translator.php\";i:5;s:75:\"recent-posts-widget-with-thumbnails/recent-posts-widget-with-thumbnails.php\";i:6;s:27:\"woocommerce/woocommerce.php\";}', 'yes'),
(34, 'category_base', '', 'yes'),
(35, 'ping_sites', 'http://rpc.pingomatic.com/', 'yes'),
(36, 'comment_max_links', '2', 'yes'),
(37, 'gmt_offset', '0', 'yes'),
(38, 'default_email_category', '1', 'yes'),
(39, 'recently_edited', 'a:5:{i:0;s:71:\"C:\\xampp\\htdocs\\thebrowncurves/wp-content/themes/thebrown/functions.php\";i:1;s:67:\"C:\\xampp\\htdocs\\thebrowncurves/wp-content/themes/thebrown/style.css\";i:2;s:68:\"C:\\xampp\\htdocs\\thebrowncurves/wp-content/themes/thebrown/footer.php\";i:3;s:78:\"C:\\xampp\\htdocs\\thebrowncurves/wp-content/themes/thebrown/template-contact.php\";i:4;s:80:\"C:\\xampp\\htdocs\\thebrowncurves/wp-content/plugins/advanced-custom-fields/acf.php\";}', 'no'),
(40, 'template', 'thebrown', 'yes'),
(41, 'stylesheet', 'thebrown', 'yes'),
(42, 'comment_registration', '0', 'yes'),
(43, 'html_type', 'text/html', 'yes'),
(44, 'use_trackback', '0', 'yes'),
(45, 'default_role', 'subscriber', 'yes'),
(46, 'db_version', '49752', 'yes'),
(47, 'uploads_use_yearmonth_folders', '1', 'yes'),
(48, 'upload_path', '', 'yes'),
(49, 'blog_public', '1', 'yes'),
(50, 'default_link_category', '2', 'yes'),
(51, 'show_on_front', 'page', 'yes'),
(52, 'tag_base', '', 'yes'),
(53, 'show_avatars', '1', 'yes'),
(54, 'avatar_rating', 'G', 'yes'),
(55, 'upload_url_path', '', 'yes'),
(56, 'thumbnail_size_w', '150', 'yes'),
(57, 'thumbnail_size_h', '150', 'yes'),
(58, 'thumbnail_crop', '1', 'yes'),
(59, 'medium_size_w', '300', 'yes'),
(60, 'medium_size_h', '300', 'yes'),
(61, 'avatar_default', 'mystery', 'yes'),
(62, 'large_size_w', '1024', 'yes'),
(63, 'large_size_h', '1024', 'yes'),
(64, 'image_default_link_type', 'none', 'yes'),
(65, 'image_default_size', '', 'yes'),
(66, 'image_default_align', '', 'yes'),
(67, 'close_comments_for_old_posts', '0', 'yes'),
(68, 'close_comments_days_old', '14', 'yes'),
(69, 'thread_comments', '1', 'yes'),
(70, 'thread_comments_depth', '5', 'yes'),
(71, 'page_comments', '0', 'yes'),
(72, 'comments_per_page', '50', 'yes'),
(73, 'default_comments_page', 'newest', 'yes'),
(74, 'comment_order', 'asc', 'yes'),
(75, 'sticky_posts', 'a:0:{}', 'yes'),
(76, 'widget_categories', 'a:3:{i:2;a:4:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}i:3;a:4:{s:5:\"title\";s:10:\"Categories\";s:5:\"count\";i:0;s:12:\"hierarchical\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(77, 'widget_text', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(78, 'widget_rss', 'a:2:{i:1;a:0:{}s:12:\"_multiwidget\";i:1;}', 'yes'),
(79, 'uninstall_plugins', 'a:1:{s:29:\"easy-wp-smtp/easy-wp-smtp.php\";s:17:\"swpsmtp_uninstall\";}', 'no'),
(80, 'timezone_string', '', 'yes'),
(81, 'page_for_posts', '18', 'yes'),
(82, 'page_on_front', '5', 'yes'),
(83, 'default_post_format', '0', 'yes'),
(84, 'link_manager_enabled', '0', 'yes'),
(85, 'finished_splitting_shared_terms', '1', 'yes'),
(86, 'site_icon', '14', 'yes'),
(87, 'medium_large_size_w', '768', 'yes'),
(88, 'medium_large_size_h', '0', 'yes'),
(89, 'wp_page_for_privacy_policy', '3', 'yes'),
(90, 'show_comments_cookies_opt_in', '1', 'yes'),
(91, 'admin_email_lifespan', '1636484822', 'yes'),
(92, 'disallowed_keys', '', 'no'),
(93, 'comment_previously_approved', '1', 'yes'),
(94, 'auto_plugin_theme_update_emails', 'a:0:{}', 'no'),
(95, 'auto_update_core_dev', 'enabled', 'yes'),
(96, 'auto_update_core_minor', 'enabled', 'yes'),
(97, 'auto_update_core_major', 'enabled', 'yes'),
(98, 'initial_db_version', '49752', 'yes'),
(99, 'tbc_user_roles', 'a:7:{s:13:\"administrator\";a:2:{s:4:\"name\";s:13:\"Administrator\";s:12:\"capabilities\";a:126:{s:13:\"switch_themes\";b:1;s:11:\"edit_themes\";b:1;s:16:\"activate_plugins\";b:1;s:12:\"edit_plugins\";b:1;s:10:\"edit_users\";b:1;s:10:\"edit_files\";b:1;s:14:\"manage_options\";b:1;s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:6:\"import\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:8:\"level_10\";b:1;s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;s:12:\"delete_users\";b:1;s:12:\"create_users\";b:1;s:17:\"unfiltered_upload\";b:1;s:14:\"edit_dashboard\";b:1;s:14:\"update_plugins\";b:1;s:14:\"delete_plugins\";b:1;s:15:\"install_plugins\";b:1;s:13:\"update_themes\";b:1;s:14:\"install_themes\";b:1;s:11:\"update_core\";b:1;s:10:\"list_users\";b:1;s:12:\"remove_users\";b:1;s:13:\"promote_users\";b:1;s:18:\"edit_theme_options\";b:1;s:13:\"delete_themes\";b:1;s:6:\"export\";b:1;s:18:\"read_wpdiscuz_form\";b:1;s:19:\"read_wpdiscuz_forms\";b:1;s:18:\"edit_wpdiscuz_form\";b:1;s:19:\"edit_wpdiscuz_forms\";b:1;s:26:\"edit_others_wpdiscuz_forms\";b:1;s:29:\"edit_published_wpdiscuz_forms\";b:1;s:22:\"publish_wpdiscuz_forms\";b:1;s:20:\"delete_wpdiscuz_form\";b:1;s:21:\"delete_wpdiscuz_forms\";b:1;s:28:\"delete_others_wpdiscuz_forms\";b:1;s:29:\"delete_private_wpdiscuz_forms\";b:1;s:31:\"delete_published_wpdiscuz_forms\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}s:6:\"editor\";a:2:{s:4:\"name\";s:6:\"Editor\";s:12:\"capabilities\";a:34:{s:17:\"moderate_comments\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:12:\"upload_files\";b:1;s:15:\"unfiltered_html\";b:1;s:10:\"edit_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:10:\"edit_pages\";b:1;s:4:\"read\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:17:\"edit_others_pages\";b:1;s:20:\"edit_published_pages\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_pages\";b:1;s:19:\"delete_others_pages\";b:1;s:22:\"delete_published_pages\";b:1;s:12:\"delete_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:22:\"delete_published_posts\";b:1;s:20:\"delete_private_posts\";b:1;s:18:\"edit_private_posts\";b:1;s:18:\"read_private_posts\";b:1;s:20:\"delete_private_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"read_private_pages\";b:1;}}s:6:\"author\";a:2:{s:4:\"name\";s:6:\"Author\";s:12:\"capabilities\";a:10:{s:12:\"upload_files\";b:1;s:10:\"edit_posts\";b:1;s:20:\"edit_published_posts\";b:1;s:13:\"publish_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;s:22:\"delete_published_posts\";b:1;}}s:11:\"contributor\";a:2:{s:4:\"name\";s:11:\"Contributor\";s:12:\"capabilities\";a:5:{s:10:\"edit_posts\";b:1;s:4:\"read\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:12:\"delete_posts\";b:1;}}s:10:\"subscriber\";a:2:{s:4:\"name\";s:10:\"Subscriber\";s:12:\"capabilities\";a:2:{s:4:\"read\";b:1;s:7:\"level_0\";b:1;}}s:8:\"customer\";a:2:{s:4:\"name\";s:8:\"Customer\";s:12:\"capabilities\";a:1:{s:4:\"read\";b:1;}}s:12:\"shop_manager\";a:2:{s:4:\"name\";s:12:\"Shop manager\";s:12:\"capabilities\";a:92:{s:7:\"level_9\";b:1;s:7:\"level_8\";b:1;s:7:\"level_7\";b:1;s:7:\"level_6\";b:1;s:7:\"level_5\";b:1;s:7:\"level_4\";b:1;s:7:\"level_3\";b:1;s:7:\"level_2\";b:1;s:7:\"level_1\";b:1;s:7:\"level_0\";b:1;s:4:\"read\";b:1;s:18:\"read_private_pages\";b:1;s:18:\"read_private_posts\";b:1;s:10:\"edit_posts\";b:1;s:10:\"edit_pages\";b:1;s:20:\"edit_published_posts\";b:1;s:20:\"edit_published_pages\";b:1;s:18:\"edit_private_pages\";b:1;s:18:\"edit_private_posts\";b:1;s:17:\"edit_others_posts\";b:1;s:17:\"edit_others_pages\";b:1;s:13:\"publish_posts\";b:1;s:13:\"publish_pages\";b:1;s:12:\"delete_posts\";b:1;s:12:\"delete_pages\";b:1;s:20:\"delete_private_pages\";b:1;s:20:\"delete_private_posts\";b:1;s:22:\"delete_published_pages\";b:1;s:22:\"delete_published_posts\";b:1;s:19:\"delete_others_posts\";b:1;s:19:\"delete_others_pages\";b:1;s:17:\"manage_categories\";b:1;s:12:\"manage_links\";b:1;s:17:\"moderate_comments\";b:1;s:12:\"upload_files\";b:1;s:6:\"export\";b:1;s:6:\"import\";b:1;s:10:\"list_users\";b:1;s:18:\"edit_theme_options\";b:1;s:18:\"manage_woocommerce\";b:1;s:24:\"view_woocommerce_reports\";b:1;s:12:\"edit_product\";b:1;s:12:\"read_product\";b:1;s:14:\"delete_product\";b:1;s:13:\"edit_products\";b:1;s:20:\"edit_others_products\";b:1;s:16:\"publish_products\";b:1;s:21:\"read_private_products\";b:1;s:15:\"delete_products\";b:1;s:23:\"delete_private_products\";b:1;s:25:\"delete_published_products\";b:1;s:22:\"delete_others_products\";b:1;s:21:\"edit_private_products\";b:1;s:23:\"edit_published_products\";b:1;s:20:\"manage_product_terms\";b:1;s:18:\"edit_product_terms\";b:1;s:20:\"delete_product_terms\";b:1;s:20:\"assign_product_terms\";b:1;s:15:\"edit_shop_order\";b:1;s:15:\"read_shop_order\";b:1;s:17:\"delete_shop_order\";b:1;s:16:\"edit_shop_orders\";b:1;s:23:\"edit_others_shop_orders\";b:1;s:19:\"publish_shop_orders\";b:1;s:24:\"read_private_shop_orders\";b:1;s:18:\"delete_shop_orders\";b:1;s:26:\"delete_private_shop_orders\";b:1;s:28:\"delete_published_shop_orders\";b:1;s:25:\"delete_others_shop_orders\";b:1;s:24:\"edit_private_shop_orders\";b:1;s:26:\"edit_published_shop_orders\";b:1;s:23:\"manage_shop_order_terms\";b:1;s:21:\"edit_shop_order_terms\";b:1;s:23:\"delete_shop_order_terms\";b:1;s:23:\"assign_shop_order_terms\";b:1;s:16:\"edit_shop_coupon\";b:1;s:16:\"read_shop_coupon\";b:1;s:18:\"delete_shop_coupon\";b:1;s:17:\"edit_shop_coupons\";b:1;s:24:\"edit_others_shop_coupons\";b:1;s:20:\"publish_shop_coupons\";b:1;s:25:\"read_private_shop_coupons\";b:1;s:19:\"delete_shop_coupons\";b:1;s:27:\"delete_private_shop_coupons\";b:1;s:29:\"delete_published_shop_coupons\";b:1;s:26:\"delete_others_shop_coupons\";b:1;s:25:\"edit_private_shop_coupons\";b:1;s:27:\"edit_published_shop_coupons\";b:1;s:24:\"manage_shop_coupon_terms\";b:1;s:22:\"edit_shop_coupon_terms\";b:1;s:24:\"delete_shop_coupon_terms\";b:1;s:24:\"assign_shop_coupon_terms\";b:1;}}}', 'yes'),
(100, 'fresh_site', '0', 'yes'),
(101, 'widget_search', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(102, 'widget_recent-posts', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(103, 'widget_recent-comments', 'a:2:{i:2;a:2:{s:5:\"title\";s:0:\"\";s:6:\"number\";i:5;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(104, 'widget_archives', 'a:2:{i:2;a:3:{s:5:\"title\";s:0:\"\";s:5:\"count\";i:0;s:8:\"dropdown\";i:0;}s:12:\"_multiwidget\";i:1;}', 'yes'),
(105, 'widget_meta', 'a:2:{i:2;a:1:{s:5:\"title\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(106, 'sidebars_widgets', 'a:3:{s:19:\"wp_inactive_widgets\";a:6:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";i:3;s:10:\"archives-2\";i:4;s:12:\"categories-2\";i:5;s:6:\"meta-2\";}s:7:\"sidebar\";a:2:{i:0;s:12:\"categories-3\";i:1;s:37:\"recent-posts-widget-with-thumbnails-2\";}s:13:\"array_version\";i:3;}', 'yes'),
(107, 'cron', 'a:16:{i:1621430931;a:1:{s:26:\"action_scheduler_run_queue\";a:1:{s:32:\"0d04ed39571b55704c122d726248bbac\";a:3:{s:8:\"schedule\";s:12:\"every_minute\";s:4:\"args\";a:1:{i:0;s:7:\"WP Cron\";}s:8:\"interval\";i:60;}}}i:1621431233;a:1:{s:33:\"wc_admin_process_orders_milestone\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1621431325;a:1:{s:29:\"wc_admin_unsnooze_admin_notes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1621433223;a:1:{s:34:\"wp_privacy_delete_old_export_files\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"hourly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:3600;}}}i:1621434534;a:1:{s:32:\"woocommerce_cancel_unpaid_orders\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:2:{s:8:\"schedule\";b:0;s:4:\"args\";a:0:{}}}}i:1621438434;a:1:{s:14:\"wc_admin_daily\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1621438442;a:2:{s:33:\"woocommerce_cleanup_personal_data\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:30:\"woocommerce_tracker_send_event\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1621449232;a:1:{s:24:\"woocommerce_cleanup_logs\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1621451223;a:5:{s:32:\"recovery_mode_clean_expired_keys\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:18:\"wp_https_detection\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_version_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:17:\"wp_update_plugins\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}s:16:\"wp_update_themes\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1621451232;a:2:{s:19:\"wp_scheduled_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}s:25:\"delete_expired_transients\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1621451234;a:1:{s:30:\"wp_scheduled_auto_draft_delete\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1621460032;a:1:{s:28:\"woocommerce_cleanup_sessions\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:10:\"twicedaily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:43200;}}}i:1621468800;a:1:{s:27:\"woocommerce_scheduled_sales\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:5:\"daily\";s:4:\"args\";a:0:{}s:8:\"interval\";i:86400;}}}i:1621624023;a:1:{s:30:\"wp_site_health_scheduled_check\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:6:\"weekly\";s:4:\"args\";a:0:{}s:8:\"interval\";i:604800;}}}i:1622561692;a:1:{s:25:\"woocommerce_geoip_updater\";a:1:{s:32:\"40cd750bba9870f18aada2478b24840a\";a:3:{s:8:\"schedule\";s:11:\"fifteendays\";s:4:\"args\";a:0:{}s:8:\"interval\";i:1296000;}}}s:7:\"version\";i:2;}', 'yes'),
(108, 'widget_pages', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(109, 'widget_calendar', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(110, 'widget_media_audio', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(111, 'widget_media_image', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(112, 'widget_media_gallery', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(113, 'widget_media_video', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(114, 'widget_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(115, 'widget_nav_menu', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(116, 'widget_custom_html', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(118, 'recovery_keys', 'a:0:{}', 'yes'),
(119, 'theme_mods_twentytwentyone', 'a:2:{s:18:\"custom_css_post_id\";i:-1;s:16:\"sidebars_widgets\";a:2:{s:4:\"time\";i:1620933055;s:4:\"data\";a:3:{s:19:\"wp_inactive_widgets\";a:0:{}s:9:\"sidebar-1\";a:3:{i:0;s:8:\"search-2\";i:1;s:14:\"recent-posts-2\";i:2;s:17:\"recent-comments-2\";}s:9:\"sidebar-2\";a:3:{i:0;s:10:\"archives-2\";i:1;s:12:\"categories-2\";i:2;s:6:\"meta-2\";}}}}', 'yes'),
(120, 'https_detection_errors', 'a:1:{s:23:\"ssl_verification_failed\";a:1:{i:0;s:24:\"SSL verification failed.\";}}', 'yes'),
(121, '_site_transient_update_core', 'O:8:\"stdClass\":4:{s:7:\"updates\";a:1:{i:0;O:8:\"stdClass\":10:{s:8:\"response\";s:6:\"latest\";s:8:\"download\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.7.2.zip\";s:6:\"locale\";s:5:\"en_US\";s:8:\"packages\";O:8:\"stdClass\":5:{s:4:\"full\";s:59:\"https://downloads.wordpress.org/release/wordpress-5.7.2.zip\";s:10:\"no_content\";s:70:\"https://downloads.wordpress.org/release/wordpress-5.7.2-no-content.zip\";s:11:\"new_bundled\";s:71:\"https://downloads.wordpress.org/release/wordpress-5.7.2-new-bundled.zip\";s:7:\"partial\";s:0:\"\";s:8:\"rollback\";s:0:\"\";}s:7:\"current\";s:5:\"5.7.2\";s:7:\"version\";s:5:\"5.7.2\";s:11:\"php_version\";s:6:\"5.6.20\";s:13:\"mysql_version\";s:3:\"5.0\";s:11:\"new_bundled\";s:3:\"5.6\";s:15:\"partial_version\";s:0:\"\";}}s:12:\"last_checked\";i:1621430922;s:15:\"version_checked\";s:5:\"5.7.2\";s:12:\"translations\";a:0:{}}', 'no'),
(127, '_site_transient_update_themes', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1621430929;s:7:\"checked\";a:4:{s:8:\"thebrown\";s:0:\"\";s:14:\"twentynineteen\";s:3:\"2.0\";s:12:\"twentytwenty\";s:3:\"1.7\";s:15:\"twentytwentyone\";s:3:\"1.3\";}s:8:\"response\";a:0:{}s:9:\"no_update\";a:3:{s:14:\"twentynineteen\";a:6:{s:5:\"theme\";s:14:\"twentynineteen\";s:11:\"new_version\";s:3:\"2.0\";s:3:\"url\";s:44:\"https://wordpress.org/themes/twentynineteen/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/theme/twentynineteen.2.0.zip\";s:8:\"requires\";s:5:\"4.9.6\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:12:\"twentytwenty\";a:6:{s:5:\"theme\";s:12:\"twentytwenty\";s:11:\"new_version\";s:3:\"1.7\";s:3:\"url\";s:42:\"https://wordpress.org/themes/twentytwenty/\";s:7:\"package\";s:58:\"https://downloads.wordpress.org/theme/twentytwenty.1.7.zip\";s:8:\"requires\";s:3:\"4.7\";s:12:\"requires_php\";s:5:\"5.2.4\";}s:15:\"twentytwentyone\";a:6:{s:5:\"theme\";s:15:\"twentytwentyone\";s:11:\"new_version\";s:3:\"1.3\";s:3:\"url\";s:45:\"https://wordpress.org/themes/twentytwentyone/\";s:7:\"package\";s:61:\"https://downloads.wordpress.org/theme/twentytwentyone.1.3.zip\";s:8:\"requires\";s:3:\"5.3\";s:12:\"requires_php\";s:3:\"5.6\";}}s:12:\"translations\";a:0:{}}', 'no'),
(128, '_site_transient_timeout_browser_01f7aec3f03fa333d53a844e50ec45aa', '1621537633', 'no'),
(129, '_site_transient_browser_01f7aec3f03fa333d53a844e50ec45aa', 'a:10:{s:4:\"name\";s:6:\"Chrome\";s:7:\"version\";s:13:\"90.0.4430.212\";s:8:\"platform\";s:7:\"Windows\";s:10:\"update_url\";s:29:\"https://www.google.com/chrome\";s:7:\"img_src\";s:43:\"http://s.w.org/images/browsers/chrome.png?1\";s:11:\"img_src_ssl\";s:44:\"https://s.w.org/images/browsers/chrome.png?1\";s:15:\"current_version\";s:2:\"18\";s:7:\"upgrade\";b:0;s:8:\"insecure\";b:0;s:6:\"mobile\";b:0;}', 'no'),
(130, '_site_transient_timeout_php_check_744549330ad044a5e94138c3c20d7f77', '1621537634', 'no'),
(131, '_site_transient_php_check_744549330ad044a5e94138c3c20d7f77', 'a:5:{s:19:\"recommended_version\";s:3:\"7.4\";s:15:\"minimum_version\";s:6:\"5.6.20\";s:12:\"is_supported\";b:1;s:9:\"is_secure\";b:1;s:13:\"is_acceptable\";b:1;}', 'no'),
(133, 'can_compress_scripts', '1', 'no'),
(148, 'finished_updating_comment_type', '1', 'yes'),
(149, 'current_theme', 'thebrowncurves', 'yes'),
(150, 'theme_mods_thebrown', 'a:3:{i:0;b:0;s:18:\"nav_menu_locations\";a:0:{}s:18:\"custom_css_post_id\";i:-1;}', 'yes'),
(151, 'theme_switched', '', 'yes'),
(158, 'recently_activated', 'a:6:{s:23:\"sendpress/sendpress.php\";i:1621261045;s:21:\"newsletter/plugin.php\";i:1621260703;s:31:\"wpdiscuz/class.WpdiscuzCore.php\";i:1621192915;s:30:\"feed-them-social/feed-them.php\";i:1621171500;s:31:\"insta-gallery/insta-gallery.php\";i:1621169480;s:25:\"gtranslate/gtranslate.php\";i:1621147269;}', 'yes'),
(182, 'acf_version', '5.8.12', 'yes'),
(189, '_transient_health-check-site-status-result', '{\"good\":\"17\",\"recommended\":\"4\",\"critical\":\"0\"}', 'yes'),
(214, 'GTranslate', 'a:33:{s:11:\"pro_version\";s:0:\"\";s:18:\"enterprise_version\";s:0:\"\";s:15:\"url_translation\";s:0:\"\";s:17:\"add_hreflang_tags\";s:0:\"\";s:17:\"email_translation\";s:0:\"\";s:23:\"email_translation_debug\";s:0:\"\";s:10:\"new_window\";s:0:\"\";s:12:\"show_in_menu\";s:0:\"\";s:26:\"floating_language_selector\";s:2:\"no\";s:21:\"native_language_names\";s:0:\"\";s:9:\"analytics\";s:0:\"\";s:23:\"detect_browser_language\";s:0:\"\";s:12:\"add_new_line\";s:1:\"1\";s:16:\"default_language\";s:2:\"en\";s:18:\"translation_method\";s:5:\"onfly\";s:11:\"widget_look\";s:19:\"dropdown_with_flags\";s:9:\"flag_size\";s:2:\"24\";s:16:\"monochrome_flags\";s:0:\"\";s:11:\"widget_code\";s:0:\"\";s:10:\"incl_langs\";a:10:{i:0;s:2:\"en\";i:1;s:2:\"es\";i:2;s:2:\"it\";i:3;s:2:\"pt\";i:4;s:2:\"de\";i:5;s:2:\"fr\";i:6;s:2:\"ru\";i:7;s:2:\"nl\";i:8;s:2:\"ar\";i:9;s:5:\"zh-CN\";}s:11:\"fincl_langs\";a:10:{i:0;s:2:\"en\";i:1;s:2:\"es\";i:2;s:2:\"it\";i:3;s:2:\"pt\";i:4;s:2:\"de\";i:5;s:2:\"fr\";i:6;s:2:\"ru\";i:7;s:2:\"nl\";i:8;s:2:\"ar\";i:9;s:5:\"zh-CN\";}s:9:\"alt_flags\";a:0:{}s:19:\"switcher_text_color\";s:4:\"#666\";s:20:\"switcher_arrow_color\";s:4:\"#666\";s:21:\"switcher_border_color\";s:4:\"#ccc\";s:25:\"switcher_background_color\";s:4:\"#fff\";s:32:\"switcher_background_shadow_color\";s:7:\"#efefef\";s:31:\"switcher_background_hover_color\";s:4:\"#fff\";s:19:\"dropdown_text_color\";s:4:\"#000\";s:20:\"dropdown_hover_color\";s:4:\"#fff\";s:25:\"dropdown_background_color\";s:4:\"#eee\";s:14:\"language_codes\";s:320:\"af,sq,am,ar,hy,az,eu,be,bn,bs,bg,ca,ceb,ny,zh-CN,zh-TW,co,hr,cs,da,nl,en,eo,et,tl,fi,fr,fy,gl,ka,de,el,gu,ht,ha,haw,iw,hi,hmn,hu,is,ig,id,ga,it,ja,jw,kn,kk,km,ko,ku,ky,lo,la,lv,lt,lb,mk,mg,ms,ml,mt,mi,mr,mn,my,ne,no,ps,fa,pl,pt,pa,ro,ru,sm,gd,sr,st,sn,sd,si,sk,sl,so,es,su,sw,sv,tg,ta,te,th,tr,uk,ur,uz,vi,cy,xh,yi,yo,zu\";s:15:\"language_codes2\";s:320:\"af,sq,am,ar,hy,az,eu,be,bn,bs,bg,ca,ceb,ny,zh-CN,zh-TW,co,hr,cs,da,nl,en,eo,et,tl,fi,fr,fy,gl,ka,de,el,gu,ht,ha,haw,iw,hi,hmn,hu,is,ig,id,ga,it,ja,jw,kn,kk,km,ko,ku,ky,lo,la,lv,lt,lb,mk,mg,ms,ml,mt,mi,mr,mn,my,ne,no,ps,fa,pl,pt,pa,ro,ru,sm,gd,sr,st,sn,sd,si,sk,sl,so,es,su,sw,sv,tg,ta,te,th,tr,uk,ur,uz,vi,cy,xh,yi,yo,zu\";}', 'yes'),
(215, 'widget_gtranslate', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(216, 'gtranslate_admin_notice', 'a:2:{s:15:\"two_week_review\";a:2:{s:5:\"start\";s:9:\"5/21/2021\";s:3:\"int\";i:5;}s:12:\"upgrade_tips\";a:2:{s:5:\"start\";s:9:\"5/18/2021\";s:3:\"int\";i:2;}}', 'yes'),
(221, 'googlelanguagetranslator_active', '1', 'yes'),
(222, 'googlelanguagetranslator_language', 'en', 'yes'),
(223, 'googlelanguagetranslator_flags', '', 'yes'),
(224, 'language_display_settings', 'a:5:{s:2:\"en\";s:1:\"1\";s:2:\"fr\";s:1:\"1\";s:2:\"de\";s:1:\"1\";s:2:\"hi\";s:1:\"1\";s:2:\"ru\";s:1:\"1\";}', 'yes'),
(225, 'googlelanguagetranslator_translatebox', 'yes', 'yes'),
(226, 'googlelanguagetranslator_display', 'Vertical', 'yes'),
(227, 'googlelanguagetranslator_toolbar', 'No', 'yes'),
(228, 'googlelanguagetranslator_showbranding', 'No', 'yes'),
(229, 'googlelanguagetranslator_flags_alignment', 'flags_left', 'yes'),
(230, 'googlelanguagetranslator_analytics', '', 'yes'),
(231, 'googlelanguagetranslator_analytics_id', '', 'yes'),
(232, 'googlelanguagetranslator_css', '', 'yes'),
(233, 'googlelanguagetranslator_multilanguage', '', 'yes'),
(234, 'googlelanguagetranslator_floating_widget', 'no', 'yes'),
(235, 'googlelanguagetranslator_flag_size', '18', 'yes'),
(236, 'googlelanguagetranslator_flags_order', '', 'yes'),
(237, 'googlelanguagetranslator_english_flag_choice', 'us_flag', 'yes'),
(238, 'googlelanguagetranslator_spanish_flag_choice', 'spanish_flag', 'yes'),
(239, 'googlelanguagetranslator_portuguese_flag_choice', 'portuguese_flag', 'yes'),
(240, 'googlelanguagetranslator_floating_widget_text', 'Translate »', 'yes');
INSERT INTO `tbc_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(241, 'googlelanguagetranslator_floating_widget_text_allow_translation', '', 'yes'),
(242, 'widget_glt_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(243, 'glt_admin_notice', 'a:3:{s:16:\"glt_announcement\";a:3:{s:5:\"start\";s:9:\"5/16/2021\";s:3:\"int\";i:0;s:9:\"dismissed\";i:1;}s:15:\"two_week_review\";a:2:{s:5:\"start\";s:9:\"5/21/2021\";s:3:\"int\";i:5;}s:12:\"upgrade_tips\";a:2:{s:5:\"start\";s:9:\"5/18/2021\";s:3:\"int\";i:2;}}', 'yes'),
(244, 'googlelanguagetranslator_seo_active', '', 'yes'),
(245, 'googlelanguagetranslator_url_structure', 'sub_domain', 'yes'),
(246, 'googlelanguagetranslator_url_translation_active', '', 'yes'),
(247, 'googlelanguagetranslator_hreflang_tags_active', '', 'yes'),
(248, 'glt_language_switcher_width', '100%', 'yes'),
(249, 'glt_language_switcher_text_color', '#000000', 'yes'),
(250, 'glt_language_switcher_bg_color', '#ffda9b', 'yes'),
(251, 'glt_floating_widget_position', 'bottom_left', 'yes'),
(252, 'glt_floating_widget_text_color', '#ffffff', 'yes'),
(253, 'glt_floating_widget_bg_color', '#f89406', 'yes'),
(281, 'Feed_Them_Social_Activated_Plugin', 'feed-them-social', 'yes'),
(282, 'fts-date-and-time-format', 'one-day-ago', 'yes'),
(283, 'fts_clear_cache_developer_mode', '86400', 'yes'),
(284, '_transient_timeout_rating_fts_slick_notice_waiting', '1622359261', 'no'),
(285, '_transient_rating_fts_slick_notice_waiting', 'fts-review-waiting', 'no'),
(286, 'rating_fts_slick_notice', 'pending', 'yes'),
(288, 'fts_instagram_custom_api_token', 'IGQVJVRm1yVEkwSU1XbDc0UEJaQXREZAzFibWxQcjRrbGtGMFRoUF9OYVByblJFVHdNaEd3WUR4RzVJMWozaE9zU2RQSFpqbmZAOWXRVbVIzcElNXzFORTRoLUVVdGQ2eExmQ0FxQkdn', 'yes'),
(289, 'fts_instagram_custom_id', '17841416944825102', 'yes'),
(290, 'instagram_show_follow_btn', 'no', 'yes'),
(291, 'instagram_show_follow_btn_where', 'Please Select Option', 'yes'),
(292, 'instagram_loadmore_background_color', '', 'yes'),
(293, 'instagram_loadmore_text_color', '', 'yes'),
(294, 'instagram_load_more_text', '', 'yes'),
(295, 'instagram_no_more_photos_text', '', 'yes'),
(296, 'fts_facebook_instagram_custom_api_token', '', 'yes'),
(297, 'fts_facebook_instagram_custom_api_token_user_id', '', 'yes'),
(298, 'fts_facebook_instagram_custom_api_token_user_name', '', 'yes'),
(299, 'fts_facebook_instagram_custom_api_token_profile_image', '', 'yes'),
(306, '_transient_fts_p_instagram_basic_cache17841403833133298_num6', 'O:8:\"stdClass\":2:{s:4:\"data\";a:6:{i:0;O:8:\"stdClass\":7:{s:7:\"caption\";s:103:\"A warrior is valued with his sword only, and for me, my laptop is the sword \n💻 #programmer #youtuber\";s:2:\"id\";s:17:\"17867813218899737\";s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/116911237_195220281946133_7595542825321040257_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=wsFbkYwTUnkAX87l7nM&_nc_ht=scontent.cdninstagram.com&oh=4c7bc2f22dc6b17a20eb8c1c9e4b566d&oe=60C77BCB\";s:10:\"media_type\";s:5:\"IMAGE\";s:9:\"permalink\";s:68:\"https://www.instagram.com/p/CDWHiFpBIb3goXuSC3EeueCI7CrsvMDizYqrLM0/\";s:9:\"timestamp\";s:24:\"2020-08-01T11:48:46+0000\";s:8:\"username\";s:11:\"i_am_bhaggi\";}i:1;O:8:\"stdClass\":7:{s:7:\"caption\";s:244:\"अच्छी किताबे, और अच्छे लोग तुरंत समज में नहीं आते, उन्हें पढ़ना पड़ता है। 😊😇\nLove for b/w never dies\nPc:- @riya._.bhardwaj\";s:2:\"id\";s:17:\"17845263634847386\";s:9:\"media_url\";s:242:\"https://scontent.cdninstagram.com/v/t51.2885-15/80751206_611441919397122_4524612885463055270_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=yi5kj1oVf0AAX_2Mlqv&_nc_ht=scontent.cdninstagram.com&oh=48a1e206f4ca1d2bfa26185309af068a&oe=60C58A1D\";s:10:\"media_type\";s:5:\"IMAGE\";s:9:\"permalink\";s:68:\"https://www.instagram.com/p/B6qiVIRBmFQ9FWmd6LfTgWypjuyo7Ldtn-mfTc0/\";s:9:\"timestamp\";s:24:\"2019-12-29T17:25:11+0000\";s:8:\"username\";s:11:\"i_am_bhaggi\";}i:2;O:8:\"stdClass\":7:{s:7:\"caption\";s:93:\"Cuz black and white is love😍\nPc @the_first_sight_fascinator \nPhotographer accha hai londa.\";s:2:\"id\";s:17:\"17951795212305402\";s:9:\"media_url\";s:242:\"https://scontent.cdninstagram.com/v/t51.2885-15/79038689_177838953363947_8772751646084803787_n.jpg?_nc_cat=110&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=Y4fAoKbm1JwAX-yedN0&_nc_ht=scontent.cdninstagram.com&oh=241edecef524a78e3e076163b779c70c&oe=60C64217\";s:10:\"media_type\";s:5:\"IMAGE\";s:9:\"permalink\";s:68:\"https://www.instagram.com/p/B5qKWhEBgTgz6bqtpARSso2-AxCIeo-y3UiQXE0/\";s:9:\"timestamp\";s:24:\"2019-12-04T17:24:16+0000\";s:8:\"username\";s:11:\"i_am_bhaggi\";}i:3;O:8:\"stdClass\":7:{s:7:\"caption\";s:90:\"P.C @the_first_sight_fascinator  Londa photographer hai . Apni shdi mein jarur book karen.\";s:2:\"id\";s:17:\"17851855990724039\";s:9:\"media_url\";s:242:\"https://scontent.cdninstagram.com/v/t51.2885-15/78782732_727329087761647_6977812208184598651_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=JXtvCCQ0mj8AX-wyUzL&_nc_ht=scontent.cdninstagram.com&oh=5679803c813d95c72806e81a2c864762&oe=60C76C88\";s:10:\"media_type\";s:5:\"IMAGE\";s:9:\"permalink\";s:68:\"https://www.instagram.com/p/B5f6owyh6RodWzCZN0WjnP0qAQvW_NJKPBbBm00/\";s:9:\"timestamp\";s:24:\"2019-11-30T17:54:33+0000\";s:8:\"username\";s:11:\"i_am_bhaggi\";}i:4;O:8:\"stdClass\":7:{s:7:\"caption\";s:63:\"@_s_a_r_u_27 life mein pheli baar accha kaam kiya meri pic leke\";s:2:\"id\";s:17:\"18089989036105457\";s:9:\"media_url\";s:242:\"https://scontent.cdninstagram.com/v/t51.2885-15/72700942_591755071563049_3167088434453606074_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=-eCA7k7uCjQAX-03_BR&_nc_ht=scontent.cdninstagram.com&oh=c38cf1163f547432f6cbfb19e3e61e72&oe=60C7ED8A\";s:10:\"media_type\";s:5:\"IMAGE\";s:9:\"permalink\";s:68:\"https://www.instagram.com/p/B4QKpxXhiuv-sOkbarGqmDfWk4kFsYg_WqnuZ80/\";s:9:\"timestamp\";s:24:\"2019-10-30T18:35:15+0000\";s:8:\"username\";s:11:\"i_am_bhaggi\";}i:5;O:8:\"stdClass\":7:{s:7:\"caption\";s:70:\"Either win or lose, yet be the toughest competition 😎\n#transforming\";s:2:\"id\";s:17:\"17896464769307988\";s:9:\"media_url\";s:242:\"https://scontent.cdninstagram.com/v/t51.2885-15/57410795_134631867648335_8901195728568691013_n.jpg?_nc_cat=106&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=ogu-g0stZqUAX8zk3ZZ&_nc_ht=scontent.cdninstagram.com&oh=322f6f4af61cce9f4fdad7e6e31c6714&oe=60C68749\";s:10:\"media_type\";s:5:\"IMAGE\";s:9:\"permalink\";s:68:\"https://www.instagram.com/p/BxBurPAhl5Wayb3SalDzjs24vHzikf7U8rD1qM0/\";s:9:\"timestamp\";s:24:\"2019-05-04T04:21:39+0000\";s:8:\"username\";s:11:\"i_am_bhaggi\";}}s:6:\"paging\";O:8:\"stdClass\":2:{s:7:\"cursors\";O:8:\"stdClass\":2:{s:6:\"before\";s:124:\"QVFIUnZAtSTZA2dnBSeWlMazhKWW9PaU9wWkV3ZAXRWdE5HVWphMHVkcjZAtU2dSUmF3UDNNa2NTaU9yM3E3VGdUd3lGM1NPOVF0YjdsNmNpWDBnUzBxazM3eFNR\";s:5:\"after\";s:125:\"QVFIUkNaRnpLbmViUE9wbFY3WEpTdjR0eGloWlZALaDZAXT0dOVVc0eWZAoMTBWVXRVZAnE5Mnc3dGdsWGFseDIwcW90SkNMcE9HcmkzblVvZAXU5XzQxa3N5WTFn\";}s:4:\"next\";s:350:\"https://graph.instagram.com/v3.3/17841403833133298/media?access_token=IGQVJWRWQ0R2lSQm1wLTI2R3Q3T0VsS1FzRnhHNzc4cWRJN1BRRWVCSHVUaWZAOQ215VzR5OUpicmc1SGRHVFBoLUxZAUGExSXFrRFN3RTBpSVV5b0I0S0o2OTFLQ1BjR1JLWmdzQnBn&limit=6&after=QVFIUkNaRnpLbmViUE9wbFY3WEpTdjR0eGloWlZALaDZAXT0dOVVc0eWZAoMTBWVXRVZAnE5Mnc3dGdsWGFseDIwcW90SkNMcE9HcmkzblVvZAXU5XzQxa3N5WTFn\";}}', 'yes'),
(310, '_transient_fts_p_instagram_basic_cache17841403833133298_num5', 'O:8:\"stdClass\":2:{s:4:\"data\";a:5:{i:0;O:8:\"stdClass\":7:{s:7:\"caption\";s:103:\"A warrior is valued with his sword only, and for me, my laptop is the sword \n💻 #programmer #youtuber\";s:2:\"id\";s:17:\"17867813218899737\";s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/116911237_195220281946133_7595542825321040257_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=j2240WKexfgAX-epvuO&_nc_ht=scontent.cdninstagram.com&oh=8c69c701e3ffddaa16719c5c7e379bd2&oe=60C77BCB\";s:10:\"media_type\";s:5:\"IMAGE\";s:9:\"permalink\";s:68:\"https://www.instagram.com/p/CDWHiFpBIb3goXuSC3EeueCI7CrsvMDizYqrLM0/\";s:9:\"timestamp\";s:24:\"2020-08-01T11:48:46+0000\";s:8:\"username\";s:11:\"i_am_bhaggi\";}i:1;O:8:\"stdClass\":7:{s:7:\"caption\";s:244:\"अच्छी किताबे, और अच्छे लोग तुरंत समज में नहीं आते, उन्हें पढ़ना पड़ता है। 😊😇\nLove for b/w never dies\nPc:- @riya._.bhardwaj\";s:2:\"id\";s:17:\"17845263634847386\";s:9:\"media_url\";s:242:\"https://scontent.cdninstagram.com/v/t51.2885-15/80751206_611441919397122_4524612885463055270_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=yi5kj1oVf0AAX_2Mlqv&_nc_ht=scontent.cdninstagram.com&oh=48a1e206f4ca1d2bfa26185309af068a&oe=60C58A1D\";s:10:\"media_type\";s:5:\"IMAGE\";s:9:\"permalink\";s:68:\"https://www.instagram.com/p/B6qiVIRBmFQ9FWmd6LfTgWypjuyo7Ldtn-mfTc0/\";s:9:\"timestamp\";s:24:\"2019-12-29T17:25:11+0000\";s:8:\"username\";s:11:\"i_am_bhaggi\";}i:2;O:8:\"stdClass\":7:{s:7:\"caption\";s:93:\"Cuz black and white is love😍\nPc @the_first_sight_fascinator \nPhotographer accha hai londa.\";s:2:\"id\";s:17:\"17951795212305402\";s:9:\"media_url\";s:242:\"https://scontent.cdninstagram.com/v/t51.2885-15/79038689_177838953363947_8772751646084803787_n.jpg?_nc_cat=110&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=Y4fAoKbm1JwAX-yedN0&_nc_ht=scontent.cdninstagram.com&oh=241edecef524a78e3e076163b779c70c&oe=60C64217\";s:10:\"media_type\";s:5:\"IMAGE\";s:9:\"permalink\";s:68:\"https://www.instagram.com/p/B5qKWhEBgTgz6bqtpARSso2-AxCIeo-y3UiQXE0/\";s:9:\"timestamp\";s:24:\"2019-12-04T17:24:16+0000\";s:8:\"username\";s:11:\"i_am_bhaggi\";}i:3;O:8:\"stdClass\":7:{s:7:\"caption\";s:90:\"P.C @the_first_sight_fascinator  Londa photographer hai . Apni shdi mein jarur book karen.\";s:2:\"id\";s:17:\"17851855990724039\";s:9:\"media_url\";s:242:\"https://scontent.cdninstagram.com/v/t51.2885-15/78782732_727329087761647_6977812208184598651_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=JXtvCCQ0mj8AX-wyUzL&_nc_ht=scontent.cdninstagram.com&oh=5679803c813d95c72806e81a2c864762&oe=60C76C88\";s:10:\"media_type\";s:5:\"IMAGE\";s:9:\"permalink\";s:68:\"https://www.instagram.com/p/B5f6owyh6RodWzCZN0WjnP0qAQvW_NJKPBbBm00/\";s:9:\"timestamp\";s:24:\"2019-11-30T17:54:33+0000\";s:8:\"username\";s:11:\"i_am_bhaggi\";}i:4;O:8:\"stdClass\":7:{s:7:\"caption\";s:63:\"@_s_a_r_u_27 life mein pheli baar accha kaam kiya meri pic leke\";s:2:\"id\";s:17:\"18089989036105457\";s:9:\"media_url\";s:242:\"https://scontent.cdninstagram.com/v/t51.2885-15/72700942_591755071563049_3167088434453606074_n.jpg?_nc_cat=102&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=-eCA7k7uCjQAX-03_BR&_nc_ht=scontent.cdninstagram.com&oh=c38cf1163f547432f6cbfb19e3e61e72&oe=60C7ED8A\";s:10:\"media_type\";s:5:\"IMAGE\";s:9:\"permalink\";s:68:\"https://www.instagram.com/p/B4QKpxXhiuv-sOkbarGqmDfWk4kFsYg_WqnuZ80/\";s:9:\"timestamp\";s:24:\"2019-10-30T18:35:15+0000\";s:8:\"username\";s:11:\"i_am_bhaggi\";}}s:6:\"paging\";O:8:\"stdClass\":2:{s:7:\"cursors\";O:8:\"stdClass\":2:{s:6:\"before\";s:124:\"QVFIUnZAtSTZA2dnBSeWlMazhKWW9PaU9wWkV3ZAXRWdE5HVWphMHVkcjZAtU2dSUmF3UDNNa2NTaU9yM3E3VGdUd3lGM1NPOVF0YjdsNmNpWDBnUzBxazM3eFNR\";s:5:\"after\";s:123:\"QVFIUllVazVGZAEl6U1lQZA25sR0VMVFRDZAEVvRzFLNHltLTRYb0g2M3B5TjhmdzBrSFdYVGR4RFc3TjMtdU1IcG1aVllaSW5NeG1DemEyal9SeUpCM29oaUN3\";}s:4:\"next\";s:348:\"https://graph.instagram.com/v3.3/17841403833133298/media?access_token=IGQVJWRWQ0R2lSQm1wLTI2R3Q3T0VsS1FzRnhHNzc4cWRJN1BRRWVCSHVUaWZAOQ215VzR5OUpicmc1SGRHVFBoLUxZAUGExSXFrRFN3RTBpSVV5b0I0S0o2OTFLQ1BjR1JLWmdzQnBn&limit=5&after=QVFIUllVazVGZAEl6U1lQZA25sR0VMVFRDZAEVvRzFLNHltLTRYb0g2M3B5TjhmdzBrSFdYVGR4RFc3TjMtdU1IcG1aVllaSW5NeG1DemEyal9SeUpCM29oaUN3\";}}', 'yes'),
(321, '_transient_fts_p_instagram_basic_cache17841416944825102_num5', 'O:8:\"stdClass\":2:{s:4:\"data\";a:5:{i:0;O:8:\"stdClass\":7:{s:7:\"caption\";s:456:\"ALERT : IT\'S A REVIEW POST\n\nWe developed these set of MARBLE NESTING TABLE\'S, for our client based at Mumbai, Maharashtra.\n\nConstruction involves -\nWhite shiney n moulded marble top\nBrass finished iron frame\n\nMEASURES\n18X18X22 INCH\n14X14X18 INCH\n\nDetails on Request\n\n#reviewpost #reviewproduct #productreview #livingroomfurniture #indoorfurniture #bedroomfurniture #apartmentfurniture #nestingtables #spacesavingfurniture #furnitureforsale #interiorstyling\";s:2:\"id\";s:17:\"17965465192408506\";s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/187554181_147979230674156_6659822636777930872_n.jpg?_nc_cat=105&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=ugazM1DMJCIAX9I4G-8&_nc_ht=scontent.cdninstagram.com&oh=f638600b0d1c259566b8f931ff411b43&oe=60C52E43\";s:10:\"media_type\";s:5:\"IMAGE\";s:9:\"permalink\";s:40:\"https://www.instagram.com/p/CO67hEXJW2U/\";s:9:\"timestamp\";s:24:\"2021-05-16T04:41:00+0000\";s:8:\"username\";s:14:\"thebrowncurves\";}i:1;O:8:\"stdClass\":8:{s:7:\"caption\";s:821:\"CANNE SOFA CHAIR\n\nPresenting our CANNE SOFA CHAIR , for that cozy corner you always wish to have in your den.\n\nOur canne sofa chair is suitable for you to put in your living room, bedroom, study room or hallway.\n\n Comfortable seat with ergonomic backrest can always provide an excellent sitting experience without any back pain or discomfort\n\nUpholstered in a soft velvet material, this chair is made with a very sturdy and well-built wooden frame with brass finished metal legs.\n\nPerfect for any sized room, you can\'t go wrong with this furniture piece.\n\nWood n upholstery color options customizable.\n\n#sofachair #sidechair #readingchair #livingroomfurniture #indoorfurniture #upholsteryfabric #upholesteredchair #accentchair #cannefurniture #metalfurniture #cushionseat #apartmentfurniture #apartmentdecor #interior4all\";s:2:\"id\";s:17:\"17913085240682108\";s:9:\"media_url\";s:243:\"https://scontent.cdninstagram.com/v/t51.29350-15/183392867_331672671661695_163060663222904787_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=b-PEDTywAQgAX896T73&_nc_ht=scontent.cdninstagram.com&oh=c413be5a024966b8b03d9f8f757ec69a&oe=60C6B300\";s:10:\"media_type\";s:14:\"CAROUSEL_ALBUM\";s:9:\"permalink\";s:40:\"https://www.instagram.com/p/COo5EEDJHHC/\";s:9:\"timestamp\";s:24:\"2021-05-09T04:33:14+0000\";s:8:\"username\";s:14:\"thebrowncurves\";s:8:\"children\";O:8:\"stdClass\":1:{s:4:\"data\";a:3:{i:0;O:8:\"stdClass\":2:{s:9:\"media_url\";s:243:\"https://scontent.cdninstagram.com/v/t51.29350-15/183392867_331672671661695_163060663222904787_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=b-PEDTywAQgAX896T73&_nc_ht=scontent.cdninstagram.com&oh=c413be5a024966b8b03d9f8f757ec69a&oe=60C6B300\";s:2:\"id\";s:17:\"18089833513254869\";}i:1;O:8:\"stdClass\":2:{s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/183517633_307552830979297_4630274247596446598_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=yQJyHazGj_kAX_xDnUt&_nc_ht=scontent.cdninstagram.com&oh=574aae3ae62ae3d8f9f540c1cf846b1b&oe=60C4D3C1\";s:2:\"id\";s:17:\"17895228725025897\";}i:2;O:8:\"stdClass\":2:{s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/183231411_504906313890385_3147682557418331316_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=Y9yAkZldWJwAX-Zg5Ws&_nc_ht=scontent.cdninstagram.com&oh=65c6600bb93d323b37e78f598b245b54&oe=60C788C0\";s:2:\"id\";s:17:\"18223528741002161\";}}}}i:2;O:8:\"stdClass\":7:{s:7:\"caption\";s:677:\"TAKE A SEAT...!!\n\nFeaturing plush velvet upholstery, polished brass legs and a plump silhouette worth sinking into, this design recalls a vintage Italian classic, crafted to accommodate guests over lingering dinners or for those untiring working hours.\n\nIt\'s double cushioned seat realxes you and take care of your comfort and style.\n\nIdeal as-\nDining Chair\nStudy Chair\nWork Chair\n\nColor Featured\nMidnight Blue.\nBrass\n\nColor options available\nDetails on Request.\n\n#livingroomfurniture #diningchair ##brasslegs #indoorfurniture #studychair #livingroomfurniture #bedroomfurniture #interiorstyling #interiordesign #chairdesign #apartmentfurniture #apartmenttherapy #apartmentdecor\";s:2:\"id\";s:17:\"17915255041708901\";s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/182851757_473766820503476_1104043545254823196_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=jn4i21jJXh0AX-WY13S&_nc_ht=scontent.cdninstagram.com&oh=038597426abfe730b8b0eec45567be3b&oe=60C59397\";s:10:\"media_type\";s:5:\"IMAGE\";s:9:\"permalink\";s:40:\"https://www.instagram.com/p/COjvVU-JpdC/\";s:9:\"timestamp\";s:24:\"2021-05-07T04:32:01+0000\";s:8:\"username\";s:14:\"thebrowncurves\";}i:3;O:8:\"stdClass\":8:{s:7:\"caption\";s:698:\"Marble Nesting Table\'s Set\n\nALERT - IT\'S A REVIEW POST\n\nWe developed these beauties for our client in Mumbai, Maharashtra.\n\nThere requirements were -\n\n●Small but elegant Table\'s set to complement there style n needs.\n\n●Something in black n white finish to match with there existing interior\n\n●A trendy n perfect addition to center of living room.\n\nAnd voila, our signature ROUND MARBLE NESTING TABLE\'S  suited all their requirements.\n\nAvailable in gold n white finish.\nDetails on Request.\n\n#marbletop #nestingtables #centertable #sidetables #livingroomfurniture #indoorfurniture #furnitureforsale #apartmentfurniture #apartmentdecor #apartmenttherapy #sofasidetable #metalbody #metalfurniture\";s:2:\"id\";s:17:\"17904072094819344\";s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/181903444_377451300175974_1281448710310667938_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=B6Gfohdrl5kAX--ckpU&_nc_ht=scontent.cdninstagram.com&oh=01be05585d2490903f0dc09629b5cecb&oe=60C4D8BC\";s:10:\"media_type\";s:14:\"CAROUSEL_ALBUM\";s:9:\"permalink\";s:40:\"https://www.instagram.com/p/COemiMEp0mn/\";s:9:\"timestamp\";s:24:\"2021-05-05T04:38:55+0000\";s:8:\"username\";s:14:\"thebrowncurves\";s:8:\"children\";O:8:\"stdClass\":1:{s:4:\"data\";a:3:{i:0;O:8:\"stdClass\":2:{s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/181903444_377451300175974_1281448710310667938_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=B6Gfohdrl5kAX--ckpU&_nc_ht=scontent.cdninstagram.com&oh=01be05585d2490903f0dc09629b5cecb&oe=60C4D8BC\";s:2:\"id\";s:17:\"17921081446619677\";}i:1;O:8:\"stdClass\":2:{s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/182140032_129333445886871_8257037565409834473_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=Vth_0HcP3rEAX8Lwpmo&_nc_ht=scontent.cdninstagram.com&oh=5232940ff4c392ed889c188ea7a06b86&oe=60C80BE2\";s:2:\"id\";s:17:\"17901463762928976\";}i:2;O:8:\"stdClass\":2:{s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/181516099_938558803376962_2417065847302350631_n.jpg?_nc_cat=110&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=Y0rA2-6xRUUAX-PCuW_&_nc_ht=scontent.cdninstagram.com&oh=086ceded9897b6c968d6694aa44bee1f&oe=60C6016A\";s:2:\"id\";s:17:\"18223199458035353\";}}}}i:4;O:8:\"stdClass\":8:{s:7:\"caption\";s:606:\"SWIVEL BAR CHAIR\nThe Adjustable Height Swivel Bar Stool is  perfect for any contemporary home bar / breakfast table.\n\nThis four-leg base includes a footrest and floor protectors, assuring that its legs will not damage hardwood or tile floors when moved.\n\nProduct Details -\n●Swivel: Yes\n●Adjustable Height: Yes\n●Seat Material: Solid Wood\n●Frame Material: Metal\n●Color Options: Available\n\n#barchair #breakfasttable #furnitureforsale #apartmentfurniture #interiorstyling #woodenfurniture #woodenseat #metalbody #barcounter #swivelchair #swivel #livingroomfurniture #kitchenfurniture #indoorfurniture\";s:2:\"id\";s:17:\"17879199491332623\";s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/179736853_179861094007841_6128020279666618107_n.jpg?_nc_cat=103&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=6ztjZiOWJ_8AX_wwuIj&_nc_ht=scontent.cdninstagram.com&oh=b7095f4759b1d67251d0182e573bebe6&oe=60C64DF6\";s:10:\"media_type\";s:14:\"CAROUSEL_ALBUM\";s:9:\"permalink\";s:40:\"https://www.instagram.com/p/COW-RbYJ079/\";s:9:\"timestamp\";s:24:\"2021-05-02T05:32:25+0000\";s:8:\"username\";s:14:\"thebrowncurves\";s:8:\"children\";O:8:\"stdClass\":1:{s:4:\"data\";a:4:{i:0;O:8:\"stdClass\":2:{s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/179736853_179861094007841_6128020279666618107_n.jpg?_nc_cat=103&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=6ztjZiOWJ_8AX_wwuIj&_nc_ht=scontent.cdninstagram.com&oh=b7095f4759b1d67251d0182e573bebe6&oe=60C64DF6\";s:2:\"id\";s:17:\"17954590417436795\";}i:1;O:8:\"stdClass\":2:{s:9:\"media_url\";s:245:\"https://scontent.cdninstagram.com/v/t51.29350-15/180767106_3928289360618361_3709468929647955422_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=MyGtjsDmrVoAX8RAoSB&_nc_ht=scontent.cdninstagram.com&oh=ce0534b6d1d0c20eafdb9e69a98c86d4&oe=60C5F725\";s:2:\"id\";s:17:\"17882225225319625\";}i:2;O:8:\"stdClass\":2:{s:9:\"media_url\";s:245:\"https://scontent.cdninstagram.com/v/t51.29350-15/179810395_1557555427781993_2680900426164244232_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=pRASR1UQPGEAX_02EOC&_nc_ht=scontent.cdninstagram.com&oh=5fe74df884fc666459261c5b5f955acc&oe=60C52052\";s:2:\"id\";s:17:\"17910969811710924\";}i:3;O:8:\"stdClass\":2:{s:9:\"media_url\";s:243:\"https://scontent.cdninstagram.com/v/t51.29350-15/180762410_170050365010683_136448136361092969_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=RQGPFMvw0MkAX-zsdn4&_nc_ht=scontent.cdninstagram.com&oh=bb48c93d212e38f9f7013bd9be665d0b&oe=60C782CB\";s:2:\"id\";s:17:\"17883962210138503\";}}}}}s:6:\"paging\";O:8:\"stdClass\":2:{s:7:\"cursors\";O:8:\"stdClass\":2:{s:6:\"before\";s:125:\"QVFIUlY3eklXRzA3aWZABUVBmaEJKZAHptYU5QYVNtQUJBOURmeE5HTTFhQjI2M1JILTBFSDl3eThiTzBTMkI3YnhGbTJBcVJrQVZAtaXBJZAWNuMGZATTHN0NE53\";s:5:\"after\";s:122:\"QVFIUm1xelNGR0pIc3ZARU182cm9VYTJvc2RwQXY1YUdzblcyVzgzWWhsMmw3RmdIMHotQ243dXdibXdxaWhxSk9mWmVjRE5KcS1Fbkszd3RNVFZANYm5ldml3\";}s:4:\"next\";s:347:\"https://graph.instagram.com/v3.3/17841416944825102/media?access_token=IGQVJVRm1yVEkwSU1XbDc0UEJaQXREZAzFibWxQcjRrbGtGMFRoUF9OYVByblJFVHdNaEd3WUR4RzVJMWozaE9zU2RQSFpqbmZAOWXRVbVIzcElNXzFORTRoLUVVdGQ2eExmQ0FxQkdn&limit=5&after=QVFIUm1xelNGR0pIc3ZARU182cm9VYTJvc2RwQXY1YUdzblcyVzgzWWhsMmw3RmdIMHotQ243dXdibXdxaWhxSk9mWmVjRE5KcS1Fbkszd3RNVFZANYm5ldml3\";}}', 'yes'),
(324, '_transient_timeout_qligg-first-rating', '1623761395', 'no'),
(325, '_transient_qligg-first-rating', '1', 'no'),
(326, 'widget_qligg_widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(327, 'insta_gallery_feeds', 'a:0:{}', 'yes'),
(338, '_transient_fts_p_instagram_basic_cache17841416944825102_num6', 'O:8:\"stdClass\":2:{s:4:\"data\";a:6:{i:0;O:8:\"stdClass\":7:{s:7:\"caption\";s:456:\"ALERT : IT\'S A REVIEW POST\n\nWe developed these set of MARBLE NESTING TABLE\'S, for our client based at Mumbai, Maharashtra.\n\nConstruction involves -\nWhite shiney n moulded marble top\nBrass finished iron frame\n\nMEASURES\n18X18X22 INCH\n14X14X18 INCH\n\nDetails on Request\n\n#reviewpost #reviewproduct #productreview #livingroomfurniture #indoorfurniture #bedroomfurniture #apartmentfurniture #nestingtables #spacesavingfurniture #furnitureforsale #interiorstyling\";s:2:\"id\";s:17:\"17965465192408506\";s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/187554181_147979230674156_6659822636777930872_n.jpg?_nc_cat=105&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=ugazM1DMJCIAX9I4G-8&_nc_ht=scontent.cdninstagram.com&oh=f638600b0d1c259566b8f931ff411b43&oe=60C52E43\";s:10:\"media_type\";s:5:\"IMAGE\";s:9:\"permalink\";s:40:\"https://www.instagram.com/p/CO67hEXJW2U/\";s:9:\"timestamp\";s:24:\"2021-05-16T04:41:00+0000\";s:8:\"username\";s:14:\"thebrowncurves\";}i:1;O:8:\"stdClass\":8:{s:7:\"caption\";s:821:\"CANNE SOFA CHAIR\n\nPresenting our CANNE SOFA CHAIR , for that cozy corner you always wish to have in your den.\n\nOur canne sofa chair is suitable for you to put in your living room, bedroom, study room or hallway.\n\n Comfortable seat with ergonomic backrest can always provide an excellent sitting experience without any back pain or discomfort\n\nUpholstered in a soft velvet material, this chair is made with a very sturdy and well-built wooden frame with brass finished metal legs.\n\nPerfect for any sized room, you can\'t go wrong with this furniture piece.\n\nWood n upholstery color options customizable.\n\n#sofachair #sidechair #readingchair #livingroomfurniture #indoorfurniture #upholsteryfabric #upholesteredchair #accentchair #cannefurniture #metalfurniture #cushionseat #apartmentfurniture #apartmentdecor #interior4all\";s:2:\"id\";s:17:\"17913085240682108\";s:9:\"media_url\";s:243:\"https://scontent.cdninstagram.com/v/t51.29350-15/183392867_331672671661695_163060663222904787_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=b-PEDTywAQgAX896T73&_nc_ht=scontent.cdninstagram.com&oh=c413be5a024966b8b03d9f8f757ec69a&oe=60C6B300\";s:10:\"media_type\";s:14:\"CAROUSEL_ALBUM\";s:9:\"permalink\";s:40:\"https://www.instagram.com/p/COo5EEDJHHC/\";s:9:\"timestamp\";s:24:\"2021-05-09T04:33:14+0000\";s:8:\"username\";s:14:\"thebrowncurves\";s:8:\"children\";O:8:\"stdClass\":1:{s:4:\"data\";a:3:{i:0;O:8:\"stdClass\":2:{s:9:\"media_url\";s:243:\"https://scontent.cdninstagram.com/v/t51.29350-15/183392867_331672671661695_163060663222904787_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=b-PEDTywAQgAX896T73&_nc_ht=scontent.cdninstagram.com&oh=c413be5a024966b8b03d9f8f757ec69a&oe=60C6B300\";s:2:\"id\";s:17:\"18089833513254869\";}i:1;O:8:\"stdClass\":2:{s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/183517633_307552830979297_4630274247596446598_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=yQJyHazGj_kAX_xDnUt&_nc_ht=scontent.cdninstagram.com&oh=574aae3ae62ae3d8f9f540c1cf846b1b&oe=60C4D3C1\";s:2:\"id\";s:17:\"17895228725025897\";}i:2;O:8:\"stdClass\":2:{s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/183231411_504906313890385_3147682557418331316_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=Y9yAkZldWJwAX-Zg5Ws&_nc_ht=scontent.cdninstagram.com&oh=65c6600bb93d323b37e78f598b245b54&oe=60C788C0\";s:2:\"id\";s:17:\"18223528741002161\";}}}}i:2;O:8:\"stdClass\":7:{s:7:\"caption\";s:677:\"TAKE A SEAT...!!\n\nFeaturing plush velvet upholstery, polished brass legs and a plump silhouette worth sinking into, this design recalls a vintage Italian classic, crafted to accommodate guests over lingering dinners or for those untiring working hours.\n\nIt\'s double cushioned seat realxes you and take care of your comfort and style.\n\nIdeal as-\nDining Chair\nStudy Chair\nWork Chair\n\nColor Featured\nMidnight Blue.\nBrass\n\nColor options available\nDetails on Request.\n\n#livingroomfurniture #diningchair ##brasslegs #indoorfurniture #studychair #livingroomfurniture #bedroomfurniture #interiorstyling #interiordesign #chairdesign #apartmentfurniture #apartmenttherapy #apartmentdecor\";s:2:\"id\";s:17:\"17915255041708901\";s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/182851757_473766820503476_1104043545254823196_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=jn4i21jJXh0AX-WY13S&_nc_ht=scontent.cdninstagram.com&oh=038597426abfe730b8b0eec45567be3b&oe=60C59397\";s:10:\"media_type\";s:5:\"IMAGE\";s:9:\"permalink\";s:40:\"https://www.instagram.com/p/COjvVU-JpdC/\";s:9:\"timestamp\";s:24:\"2021-05-07T04:32:01+0000\";s:8:\"username\";s:14:\"thebrowncurves\";}i:3;O:8:\"stdClass\":8:{s:7:\"caption\";s:698:\"Marble Nesting Table\'s Set\n\nALERT - IT\'S A REVIEW POST\n\nWe developed these beauties for our client in Mumbai, Maharashtra.\n\nThere requirements were -\n\n●Small but elegant Table\'s set to complement there style n needs.\n\n●Something in black n white finish to match with there existing interior\n\n●A trendy n perfect addition to center of living room.\n\nAnd voila, our signature ROUND MARBLE NESTING TABLE\'S  suited all their requirements.\n\nAvailable in gold n white finish.\nDetails on Request.\n\n#marbletop #nestingtables #centertable #sidetables #livingroomfurniture #indoorfurniture #furnitureforsale #apartmentfurniture #apartmentdecor #apartmenttherapy #sofasidetable #metalbody #metalfurniture\";s:2:\"id\";s:17:\"17904072094819344\";s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/181903444_377451300175974_1281448710310667938_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=B6Gfohdrl5kAX--ckpU&_nc_ht=scontent.cdninstagram.com&oh=01be05585d2490903f0dc09629b5cecb&oe=60C4D8BC\";s:10:\"media_type\";s:14:\"CAROUSEL_ALBUM\";s:9:\"permalink\";s:40:\"https://www.instagram.com/p/COemiMEp0mn/\";s:9:\"timestamp\";s:24:\"2021-05-05T04:38:55+0000\";s:8:\"username\";s:14:\"thebrowncurves\";s:8:\"children\";O:8:\"stdClass\":1:{s:4:\"data\";a:3:{i:0;O:8:\"stdClass\":2:{s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/181903444_377451300175974_1281448710310667938_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=B6Gfohdrl5kAX--ckpU&_nc_ht=scontent.cdninstagram.com&oh=01be05585d2490903f0dc09629b5cecb&oe=60C4D8BC\";s:2:\"id\";s:17:\"17921081446619677\";}i:1;O:8:\"stdClass\":2:{s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/182140032_129333445886871_8257037565409834473_n.jpg?_nc_cat=109&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=Vth_0HcP3rEAX8Lwpmo&_nc_ht=scontent.cdninstagram.com&oh=5232940ff4c392ed889c188ea7a06b86&oe=60C80BE2\";s:2:\"id\";s:17:\"17901463762928976\";}i:2;O:8:\"stdClass\":2:{s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/181516099_938558803376962_2417065847302350631_n.jpg?_nc_cat=110&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=Y0rA2-6xRUUAX-PCuW_&_nc_ht=scontent.cdninstagram.com&oh=086ceded9897b6c968d6694aa44bee1f&oe=60C6016A\";s:2:\"id\";s:17:\"18223199458035353\";}}}}i:4;O:8:\"stdClass\":8:{s:7:\"caption\";s:606:\"SWIVEL BAR CHAIR\nThe Adjustable Height Swivel Bar Stool is  perfect for any contemporary home bar / breakfast table.\n\nThis four-leg base includes a footrest and floor protectors, assuring that its legs will not damage hardwood or tile floors when moved.\n\nProduct Details -\n●Swivel: Yes\n●Adjustable Height: Yes\n●Seat Material: Solid Wood\n●Frame Material: Metal\n●Color Options: Available\n\n#barchair #breakfasttable #furnitureforsale #apartmentfurniture #interiorstyling #woodenfurniture #woodenseat #metalbody #barcounter #swivelchair #swivel #livingroomfurniture #kitchenfurniture #indoorfurniture\";s:2:\"id\";s:17:\"17879199491332623\";s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/179736853_179861094007841_6128020279666618107_n.jpg?_nc_cat=103&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=6ztjZiOWJ_8AX_wwuIj&_nc_ht=scontent.cdninstagram.com&oh=b7095f4759b1d67251d0182e573bebe6&oe=60C64DF6\";s:10:\"media_type\";s:14:\"CAROUSEL_ALBUM\";s:9:\"permalink\";s:40:\"https://www.instagram.com/p/COW-RbYJ079/\";s:9:\"timestamp\";s:24:\"2021-05-02T05:32:25+0000\";s:8:\"username\";s:14:\"thebrowncurves\";s:8:\"children\";O:8:\"stdClass\":1:{s:4:\"data\";a:4:{i:0;O:8:\"stdClass\":2:{s:9:\"media_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/179736853_179861094007841_6128020279666618107_n.jpg?_nc_cat=103&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=6ztjZiOWJ_8AX_wwuIj&_nc_ht=scontent.cdninstagram.com&oh=b7095f4759b1d67251d0182e573bebe6&oe=60C64DF6\";s:2:\"id\";s:17:\"17954590417436795\";}i:1;O:8:\"stdClass\":2:{s:9:\"media_url\";s:245:\"https://scontent.cdninstagram.com/v/t51.29350-15/180767106_3928289360618361_3709468929647955422_n.jpg?_nc_cat=108&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=MyGtjsDmrVoAX8RAoSB&_nc_ht=scontent.cdninstagram.com&oh=ce0534b6d1d0c20eafdb9e69a98c86d4&oe=60C5F725\";s:2:\"id\";s:17:\"17882225225319625\";}i:2;O:8:\"stdClass\":2:{s:9:\"media_url\";s:245:\"https://scontent.cdninstagram.com/v/t51.29350-15/179810395_1557555427781993_2680900426164244232_n.jpg?_nc_cat=111&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=pRASR1UQPGEAX_02EOC&_nc_ht=scontent.cdninstagram.com&oh=5fe74df884fc666459261c5b5f955acc&oe=60C52052\";s:2:\"id\";s:17:\"17910969811710924\";}i:3;O:8:\"stdClass\":2:{s:9:\"media_url\";s:243:\"https://scontent.cdninstagram.com/v/t51.29350-15/180762410_170050365010683_136448136361092969_n.jpg?_nc_cat=104&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=RQGPFMvw0MkAX-zsdn4&_nc_ht=scontent.cdninstagram.com&oh=bb48c93d212e38f9f7013bd9be665d0b&oe=60C782CB\";s:2:\"id\";s:17:\"17883962210138503\";}}}}i:5;O:8:\"stdClass\":8:{s:7:\"caption\";s:621:\"HAND WOVEN BENCHES SET\n\nWhen first furnishing your place, it\'s all about buying the essentials:\n a bed, a couch, a nightstand. \n\nBut buying an accent bench just screams: I\'m established and I\'m here to decorate!\n\nBring boho vibes to your place with our SET OF 3 hand woven jute  benches. \n\nPlace them at the end of your bed / in entryway to sit down n buckle up your shoes, or in balcony to cherish that beautiful sunset.\n\nDetails on Request\n\n#benches #seating #interiorstyling #interiordesign #furnitureforsale #handmadewithlove #apartmentfurniture #apartmentdecor #nestingbenches #spacesavingfurniture #interiorstyling\";s:2:\"id\";s:17:\"17938217998501034\";s:9:\"media_url\";s:592:\"https://video.cdninstagram.com/v/t50.2886-16/173950649_2582177935419208_1585820300972920524_n.mp4?_nc_cat=103&vs=17870600780493119_3385132492&_nc_vs=HBksFQAYJEdMbEdYZ3BJWjVZbWVpd0pBTXdPR0dVcDl3RVdia1lMQUFBRhUAAsgBABUAGCRHT2gxc1FwQkozZVBlVUVFQUE5aDBKMVA4MDRNYmtZTEFBQUYVAgLIAQAoABgAGwGIB3VzZV9vaWwBMRUAACb%2BivnX7c2%2BPxUCKAJDMywXQD0IcrAgxJwYEmRhc2hfYmFzZWxpbmVfMl92MREAdeoHAA%3D%3D&ccb=1-3&_nc_sid=59939d&efg=eyJ2ZW5jb2RlX3RhZyI6InZ0c192b2RfdXJsZ2VuLjcyMC5mZWVkIn0%3D&_nc_ohc=be7oNRRBJrUAX_S57j5&_nc_ht=video.cdninstagram.com&oh=404980debb909d48559f81665f0f48a9&oe=60C64C5C&_nc_rid=f0e6984188\";s:10:\"media_type\";s:5:\"VIDEO\";s:9:\"permalink\";s:40:\"https://www.instagram.com/p/COUUF1eJOTv/\";s:13:\"thumbnail_url\";s:244:\"https://scontent.cdninstagram.com/v/t51.29350-15/179318766_1392888571083794_745630619818086229_n.jpg?_nc_cat=105&ccb=1-3&_nc_sid=8ae9d6&_nc_ohc=617gkY6-yngAX9doYzQ&_nc_ht=scontent.cdninstagram.com&oh=9767513bc4806b9ebe2298f7660485dd&oe=60C56358\";s:9:\"timestamp\";s:24:\"2021-05-01T04:48:02+0000\";s:8:\"username\";s:14:\"thebrowncurves\";}}s:6:\"paging\";O:8:\"stdClass\":2:{s:7:\"cursors\";O:8:\"stdClass\":2:{s:6:\"before\";s:125:\"QVFIUlY3eklXRzA3aWZABUVBmaEJKZAHptYU5QYVNtQUJBOURmeE5HTTFhQjI2M1JILTBFSDl3eThiTzBTMkI3YnhGbTJBcVJrQVZAtaXBJZAWNuMGZATTHN0NE53\";s:5:\"after\";s:124:\"QVFIUnVodzVJa3Vxalh2VTBPcDNJYWhzWk9ueGx1SlJwTGZASWnZAWZAzY2SmhBRldBVE45UThaWHc5VFhOVjF5UUtGbE1xc0ZAsWWJIRUtVc2Q3LW44eUV3MHBn\";}s:4:\"next\";s:349:\"https://graph.instagram.com/v3.3/17841416944825102/media?access_token=IGQVJVRm1yVEkwSU1XbDc0UEJaQXREZAzFibWxQcjRrbGtGMFRoUF9OYVByblJFVHdNaEd3WUR4RzVJMWozaE9zU2RQSFpqbmZAOWXRVbVIzcElNXzFORTRoLUVVdGQ2eExmQ0FxQkdn&limit=6&after=QVFIUnVodzVJa3Vxalh2VTBPcDNJYWhzWk9ueGx1SlJwTGZASWnZAWZAzY2SmhBRldBVE45UThaWHc5VFhOVjF5UUtGbE1xc0ZAsWWJIRUtVc2Q3LW44eUV3MHBn\";}}', 'yes'),
(343, '_transient_fts_p_instagram_business_cache17841416944825102_num5', 'O:8:\"stdClass\":2:{s:5:\"error\";O:8:\"stdClass\":4:{s:7:\"message\";s:27:\"Invalid OAuth access token.\";s:4:\"type\";s:14:\"OAuthException\";s:4:\"code\";i:190;s:10:\"fbtrace_id\";s:23:\"AqvJ-QzsWiMu8COFWJdRXg1\";}s:4:\"data\";a:0:{}}', 'yes'),
(346, 'wpcf7', 'a:2:{s:7:\"version\";s:5:\"5.4.1\";s:13:\"bulk_validate\";a:4:{s:9:\"timestamp\";i:1621171554;s:7:\"version\";s:5:\"5.4.1\";s:11:\"count_valid\";i:1;s:13:\"count_invalid\";i:0;}}', 'yes'),
(353, 'swpsmtp_options', 'a:10:{s:16:\"from_email_field\";s:24:\"thebrowncurves@gmail.com\";s:15:\"from_name_field\";s:16:\"The Brown Curves\";s:23:\"force_from_name_replace\";b:0;s:8:\"sub_mode\";b:0;s:13:\"smtp_settings\";a:10:{s:4:\"host\";s:14:\"smtp.gmail.com\";s:15:\"type_encryption\";s:3:\"ssl\";s:4:\"port\";s:3:\"465\";s:13:\"autentication\";s:3:\"yes\";s:8:\"username\";s:24:\"thebrowncurves@gmail.com\";s:8:\"password\";s:12:\"SkhBTEFOSTk1\";s:13:\"log_file_name\";s:33:\"logs\\.60a124a4657a50.43052246.txt\";s:12:\"enable_debug\";b:0;s:12:\"insecure_ssl\";b:0;s:12:\"encrypt_pass\";b:0;}s:15:\"allowed_domains\";s:12:\"bG9jYWxob3N0\";s:14:\"reply_to_email\";s:24:\"thebrowncurves@gmail.com\";s:9:\"bcc_email\";s:0:\"\";s:17:\"email_ignore_list\";s:0:\"\";s:19:\"enable_domain_check\";b:0;}', 'yes'),
(357, 'smtp_test_mail', 'a:3:{s:10:\"swpsmtp_to\";s:26:\"giribhagirath169@gmail.com\";s:15:\"swpsmtp_subject\";s:6:\"qwerty\";s:15:\"swpsmtp_message\";s:6:\"qwerty\";}', 'yes'),
(360, 'secret_key', 'O{2x`,9,cKjxpeH!Geddx3X)Kg5)[;=7}Bfl%B>{<&Jg{w!EL >6@z5FWEEzKPs(', 'no'),
(365, 'category_children', 'a:0:{}', 'yes'),
(388, 'wc_plugin_version', '7.2.2', 'yes'),
(389, 'wc_hash_key', 'bbfba6695fa8937e38040b1b9c39aaa6', 'no'),
(390, 'wc_options', 'a:15:{s:4:\"form\";a:18:{s:15:\"commentFormView\";s:9:\"collapsed\";s:19:\"enableDropAnimation\";i:1;s:10:\"richEditor\";s:7:\"desktop\";s:10:\"boldButton\";i:1;s:12:\"italicButton\";i:1;s:15:\"underlineButton\";i:1;s:12:\"strikeButton\";i:1;s:8:\"olButton\";i:1;s:8:\"ulButton\";i:1;s:16:\"blockquoteButton\";i:1;s:15:\"codeblockButton\";i:1;s:10:\"linkButton\";i:1;s:16:\"sourcecodeButton\";i:1;s:13:\"spoilerButton\";i:1;s:15:\"enableQuickTags\";i:0;s:22:\"commenterNameMinLength\";i:3;s:22:\"commenterNameMaxLength\";i:50;s:18:\"storeCommenterData\";i:-1;}s:9:\"recaptcha\";a:8:{s:7:\"siteKey\";s:0:\"\";s:9:\"secretKey\";s:0:\"\";s:5:\"theme\";s:5:\"light\";s:4:\"lang\";s:0:\"\";s:13:\"requestMethod\";s:4:\"auto\";s:13:\"showForGuests\";i:0;s:12:\"showForUsers\";i:0;s:21:\"isShowOnSubscribeForm\";i:0;}s:5:\"login\";a:9:{s:20:\"showLoggedInUsername\";i:1;s:22:\"showLoginLinkForGuests\";i:1;s:15:\"showActivityTab\";i:1;s:20:\"showSubscriptionsTab\";i:1;s:14:\"showFollowsTab\";i:1;s:17:\"enableProfileURLs\";i:1;s:19:\"websiteAsProfileUrl\";i:1;s:13:\"isUserByEmail\";i:0;s:8:\"loginUrl\";s:0:\"\";}s:6:\"social\";a:55:{s:28:\"socialLoginAgreementCheckbox\";i:1;s:26:\"socialLoginInSecondaryForm\";i:0;s:19:\"displayIconOnAvatar\";i:1;s:13:\"enableFbLogin\";i:0;s:13:\"enableFbShare\";i:0;s:7:\"fbAppID\";s:0:\"\";s:11:\"fbAppSecret\";s:0:\"\";s:11:\"fbUseOAuth2\";i:0;s:18:\"enableTwitterLogin\";i:0;s:18:\"enableTwitterShare\";i:1;s:12:\"twitterAppID\";s:0:\"\";s:16:\"twitterAppSecret\";s:0:\"\";s:17:\"enableGoogleLogin\";i:0;s:14:\"googleClientID\";s:0:\"\";s:18:\"googleClientSecret\";s:0:\"\";s:17:\"enableDisqusLogin\";i:0;s:15:\"disqusPublicKey\";s:0:\"\";s:15:\"disqusSecretKey\";s:0:\"\";s:20:\"enableWordpressLogin\";i:0;s:17:\"wordpressClientID\";s:0:\"\";s:21:\"wordpressClientSecret\";s:0:\"\";s:20:\"enableInstagramLogin\";i:0;s:14:\"instagramAppID\";s:0:\"\";s:18:\"instagramAppSecret\";s:0:\"\";s:19:\"enableLinkedinLogin\";i:0;s:16:\"linkedinClientID\";s:0:\"\";s:20:\"linkedinClientSecret\";s:0:\"\";s:19:\"enableWhatsappShare\";i:0;s:17:\"enableYandexLogin\";i:0;s:8:\"yandexID\";s:0:\"\";s:14:\"yandexPassword\";s:0:\"\";s:17:\"enableMailruLogin\";i:0;s:14:\"mailruClientID\";s:0:\"\";s:18:\"mailruClientSecret\";s:0:\"\";s:16:\"enableWeiboLogin\";i:0;s:8:\"weiboKey\";s:0:\"\";s:11:\"weiboSecret\";s:0:\"\";s:17:\"enableWechatLogin\";i:0;s:11:\"wechatAppID\";s:0:\"\";s:12:\"wechatSecret\";s:0:\"\";s:13:\"enableQQLogin\";i:0;s:7:\"qqAppID\";s:0:\"\";s:8:\"qqSecret\";s:0:\"\";s:16:\"enableBaiduLogin\";i:0;s:10:\"baiduAppID\";s:0:\"\";s:11:\"baiduSecret\";s:0:\"\";s:13:\"enableVkLogin\";i:0;s:13:\"enableVkShare\";i:1;s:7:\"vkAppID\";s:0:\"\";s:11:\"vkAppSecret\";s:0:\"\";s:13:\"enableOkLogin\";i:0;s:13:\"enableOkShare\";i:1;s:7:\"okAppID\";s:0:\"\";s:8:\"okAppKey\";s:0:\"\";s:11:\"okAppSecret\";s:0:\"\";}s:6:\"rating\";a:6:{s:22:\"enablePostRatingSchema\";i:0;s:19:\"displayRatingOnPost\";a:1:{i:0;s:19:\"before_comment_form\";}s:23:\"ratingCssOnNoneSingular\";i:0;s:16:\"ratingHoverColor\";s:7:\"#FFED85\";s:19:\"ratingInactiveColor\";s:7:\"#DDDDDD\";s:17:\"ratingActiveColor\";s:7:\"#FFD700\";}s:14:\"thread_display\";a:11:{s:17:\"firstLoadWithAjax\";i:0;s:19:\"commentListLoadType\";i:0;s:24:\"isLoadOnlyParentComments\";i:0;s:23:\"showReactedFilterButton\";i:1;s:23:\"showHottestFilterButton\";i:1;s:18:\"showSortingButtons\";i:1;s:18:\"mostVotedByDefault\";i:0;s:15:\"reverseChildren\";i:0;s:23:\"highlightUnreadComments\";i:0;s:15:\"scrollToComment\";i:1;s:15:\"orderCommentsBy\";s:10:\"comment_ID\";}s:14:\"thread_layouts\";a:12:{s:15:\"showCommentLink\";i:1;s:15:\"showCommentDate\";i:1;s:17:\"showVotingButtons\";i:1;s:17:\"votingButtonsIcon\";s:16:\"fa-plus|fa-minus\";s:18:\"votingButtonsStyle\";i:0;s:19:\"enableDislikeButton\";i:1;s:14:\"isGuestCanVote\";i:1;s:22:\"highlightVotingButtons\";i:1;s:11:\"showAvatars\";i:1;s:23:\"defaultAvatarUrlForUser\";s:0:\"\";s:24:\"defaultAvatarUrlForGuest\";s:0:\"\";s:23:\"changeAvatarsEverywhere\";i:1;}s:13:\"thread_styles\";a:22:{s:5:\"theme\";s:11:\"wpd-default\";s:12:\"primaryColor\";s:7:\"#00B38F\";s:23:\"newLoadedCommentBGColor\";s:7:\"#FFFAD6\";s:18:\"primaryButtonColor\";s:7:\"#FFFFFF\";s:15:\"primaryButtonBG\";s:7:\"#07B290\";s:12:\"bubbleColors\";s:7:\"#1DB99A\";s:20:\"inlineFeedbackColors\";s:7:\"#1DB99A\";s:20:\"defaultCommentAreaBG\";s:0:\"\";s:23:\"defaultCommentTextColor\";s:7:\"#777777\";s:22:\"defaultCommentFieldsBG\";s:0:\"\";s:31:\"defaultCommentFieldsBorderColor\";s:7:\"#DDDDDD\";s:29:\"defaultCommentFieldsTextColor\";s:7:\"#777777\";s:36:\"defaultCommentFieldsPlaceholderColor\";s:0:\"\";s:17:\"darkCommentAreaBG\";s:7:\"#111111\";s:20:\"darkCommentTextColor\";s:7:\"#CCCCCC\";s:19:\"darkCommentFieldsBG\";s:7:\"#999999\";s:28:\"darkCommentFieldsBorderColor\";s:7:\"#D1D1D1\";s:26:\"darkCommentFieldsTextColor\";s:7:\"#000000\";s:33:\"darkCommentFieldsPlaceholderColor\";s:7:\"#DDDDDD\";s:15:\"commentTextSize\";s:4:\"14px\";s:17:\"enableFontAwesome\";i:1;s:9:\"customCss\";s:27:\".comments-area{width:auto;}\";}s:12:\"subscription\";a:11:{s:20:\"enableUserMentioning\";i:1;s:24:\"sendMailToMentionedUsers\";i:1;s:24:\"isNotifyOnCommentApprove\";i:1;s:19:\"enableMemberConfirm\";i:0;s:19:\"enableGuestsConfirm\";i:1;s:16:\"subscriptionType\";i:1;s:17:\"showReplyCheckbox\";i:1;s:21:\"isReplyDefaultChecked\";i:0;s:34:\"usePostmaticForCommentNotification\";i:0;s:14:\"isFollowActive\";i:1;s:28:\"disableFollowConfirmForUsers\";i:1;}s:6:\"labels\";a:2:{s:14:\"blogRoleLabels\";a:7:{s:13:\"administrator\";i:1;s:6:\"editor\";i:1;s:6:\"author\";i:0;s:11:\"contributor\";i:0;s:10:\"subscriber\";i:0;s:11:\"post_author\";i:1;s:5:\"guest\";i:0;}s:9:\"blogRoles\";a:7:{s:13:\"administrator\";s:7:\"#00B38F\";s:6:\"editor\";s:7:\"#00B38F\";s:6:\"author\";s:7:\"#00B38F\";s:11:\"contributor\";s:7:\"#00B38F\";s:10:\"subscriber\";s:7:\"#00B38F\";s:11:\"post_author\";s:7:\"#00B38F\";s:5:\"guest\";s:7:\"#00B38F\";}}s:10:\"moderation\";a:8:{s:19:\"commentEditableTime\";i:900;s:28:\"enableEditingWhenHaveReplies\";i:0;s:18:\"displayEditingInfo\";i:1;s:17:\"enableStickButton\";i:1;s:17:\"enableCloseButton\";i:1;s:25:\"restrictCommentingPerUser\";s:7:\"disable\";s:22:\"commentRestrictionType\";s:4:\"both\";s:17:\"userCommentsLimit\";i:1;}s:7:\"content\";a:16:{s:20:\"commentTextMinLength\";i:1;s:18:\"replyTextMinLength\";i:1;s:20:\"commentTextMaxLength\";s:0:\"\";s:18:\"replyTextMaxLength\";s:0:\"\";s:21:\"enableImageConversion\";i:1;s:16:\"enableShortcodes\";i:0;s:20:\"commentReadMoreLimit\";i:0;s:12:\"wmuIsEnabled\";i:1;s:17:\"wmuIsGuestAllowed\";i:1;s:13:\"wmuIsLightbox\";i:1;s:12:\"wmuMimeTypes\";a:9:{s:3:\"jpg\";s:10:\"image/jpeg\";s:4:\"jpeg\";s:10:\"image/jpeg\";s:3:\"jpe\";s:10:\"image/jpeg\";s:3:\"gif\";s:9:\"image/gif\";s:3:\"png\";s:9:\"image/png\";s:3:\"bmp\";s:9:\"image/bmp\";s:4:\"tiff\";s:10:\"image/tiff\";s:3:\"tif\";s:10:\"image/tiff\";s:3:\"ico\";s:12:\"image/x-icon\";}s:14:\"wmuMaxFileSize\";i:2;s:23:\"wmuIsShowFilesDashboard\";i:1;s:19:\"wmuSingleImageWidth\";s:4:\"auto\";s:20:\"wmuSingleImageHeight\";i:200;s:13:\"wmuImageSizes\";a:4:{i:0;s:9:\"thumbnail\";i:1;s:6:\"medium\";i:2;s:12:\"medium_large\";i:3;s:5:\"large\";}}s:4:\"live\";a:9:{s:12:\"enableBubble\";i:0;s:16:\"bubbleLiveUpdate\";i:0;s:14:\"bubbleLocation\";s:12:\"content_left\";s:27:\"bubbleShowNewCommentMessage\";i:1;s:17:\"bubbleHintTimeout\";i:45;s:21:\"bubbleHintHideTimeout\";i:10;s:21:\"commentListUpdateType\";i:0;s:16:\"liveUpdateGuests\";i:0;s:22:\"commentListUpdateTimer\";i:30;}s:6:\"inline\";a:2:{s:22:\"showInlineFilterButton\";i:1;s:28:\"inlineFeedbackAttractionType\";s:5:\"blink\";}s:7:\"general\";a:13:{s:14:\"isEnableOnHome\";i:1;s:19:\"isNativeAjaxEnabled\";i:1;s:16:\"loadComboVersion\";i:1;s:14:\"loadMinVersion\";i:1;s:17:\"commentLinkFilter\";i:1;s:12:\"redirectPage\";i:0;s:17:\"simpleCommentDate\";i:0;s:14:\"dateDiffFormat\";s:32:\"[number] [time_unit] [adjective]\";s:9:\"isUsePoMo\";i:0;s:23:\"showPluginPoweredByLink\";i:0;s:22:\"isGravatarCacheEnabled\";i:0;s:19:\"gravatarCacheMethod\";s:7:\"cronjob\";s:20:\"gravatarCacheTimeout\";i:10;}}', 'yes'),
(391, 'wpdiscuz_form_content_type_rel', 'a:3:{s:4:\"post\";a:1:{s:5:\"en_US\";i:66;}s:10:\"attachment\";a:1:{s:5:\"en_US\";i:66;}s:4:\"page\";a:1:{s:5:\"en_US\";i:66;}}', 'yes'),
(392, 'wpdiscuz_show_vote_regenerate_message', '0', 'no'),
(393, 'wpdiscuz_show_closed_regenerate_message', '0', 'no'),
(394, 'wpdiscuz_show_vote_data_regenerate_message', '0', 'no'),
(395, 'wpdiscuz_show_sync_commenters_message', '0', 'no'),
(396, 'wpdiscuz_wizard_completed', '1', 'no'),
(397, 'wpdiscuz_wizard_after_update', '0', 'no'),
(399, 'wpd_admin_notices', 'a:0:{}', 'yes'),
(402, 'wpdiscuz_form_post_rel', 'a:0:{}', 'yes'),
(436, 'newsletter_logger_secret', 'a87a263b', 'yes'),
(438, 'newsletter_main_first_install_time', '1621258846', 'no'),
(439, 'newsletter_main', 'a:32:{s:11:\"return_path\";s:0:\"\";s:8:\"reply_to\";s:0:\"\";s:12:\"sender_email\";s:24:\"thebrowncurves@gmail.com\";s:11:\"sender_name\";s:16:\"The Brown Curves\";s:6:\"editor\";i:0;s:13:\"scheduler_max\";i:100;s:9:\"phpmailer\";i:0;s:5:\"debug\";i:0;s:5:\"track\";i:1;s:3:\"css\";s:0:\"\";s:12:\"css_disabled\";i:0;s:2:\"ip\";s:0:\"\";s:4:\"page\";i:72;s:19:\"disable_cron_notice\";i:0;s:13:\"do_shortcodes\";i:0;s:11:\"header_logo\";s:0:\"\";s:12:\"header_title\";s:16:\"The Brown Curves\";s:10:\"header_sub\";s:0:\"\";s:12:\"footer_title\";s:0:\"\";s:14:\"footer_contact\";s:0:\"\";s:12:\"footer_legal\";s:0:\"\";s:12:\"facebook_url\";s:0:\"\";s:11:\"twitter_url\";s:0:\"\";s:13:\"instagram_url\";s:0:\"\";s:13:\"pinterest_url\";s:0:\"\";s:12:\"linkedin_url\";s:0:\"\";s:10:\"tumblr_url\";s:0:\"\";s:11:\"youtube_url\";s:0:\"\";s:9:\"vimeo_url\";s:0:\"\";s:14:\"soundcloud_url\";s:0:\"\";s:12:\"telegram_url\";s:0:\"\";s:6:\"vk_url\";s:0:\"\";}', 'yes'),
(440, 'newsletter_main_info', 'a:17:{s:11:\"header_logo\";a:1:{s:2:\"id\";i:0;}s:12:\"header_title\";s:16:\"The Brown Curves\";s:10:\"header_sub\";s:0:\"\";s:12:\"footer_title\";s:0:\"\";s:14:\"footer_contact\";s:0:\"\";s:12:\"footer_legal\";s:0:\"\";s:12:\"facebook_url\";s:0:\"\";s:11:\"twitter_url\";s:0:\"\";s:13:\"instagram_url\";s:0:\"\";s:13:\"pinterest_url\";s:0:\"\";s:12:\"linkedin_url\";s:0:\"\";s:10:\"tumblr_url\";s:0:\"\";s:11:\"youtube_url\";s:0:\"\";s:9:\"vimeo_url\";s:0:\"\";s:14:\"soundcloud_url\";s:0:\"\";s:12:\"telegram_url\";s:0:\"\";s:6:\"vk_url\";s:0:\"\";}', 'yes'),
(441, 'newsletter_main_smtp', 'a:7:{s:7:\"enabled\";i:0;s:4:\"host\";s:0:\"\";s:4:\"user\";s:0:\"\";s:4:\"pass\";s:0:\"\";s:4:\"port\";i:25;s:6:\"secure\";s:0:\"\";s:12:\"ssl_insecure\";i:0;}', 'yes'),
(442, 'newsletter_main_version', '1.6.6', 'yes'),
(443, 'newsletter_subscription_first_install_time', '1621258846', 'no'),
(444, 'newsletter', 'a:14:{s:14:\"noconfirmation\";i:1;s:12:\"notify_email\";s:26:\"giribhagirath169@gmail.com\";s:8:\"multiple\";i:1;s:6:\"notify\";i:0;s:10:\"error_text\";s:87:\"<p>This email address is already subscribed, please contact the site administrator.</p>\";s:17:\"subscription_text\";s:19:\"{subscription_form}\";s:17:\"confirmation_text\";s:104:\"<p>A confirmation email is on the way. Follow the instructions and check the spam folder. Thank you.</p>\";s:20:\"confirmation_subject\";s:32:\"Please confirm your subscription\";s:21:\"confirmation_tracking\";s:0:\"\";s:20:\"confirmation_message\";s:94:\"<p>Please confirm your subscription <a href=\"{subscription_confirm_url}\">clicking here</a></p>\";s:14:\"confirmed_text\";s:43:\"<p>Your subscription has been confirmed</p>\";s:17:\"confirmed_subject\";s:7:\"Welcome\";s:17:\"confirmed_message\";s:130:\"<p>This message confirms your subscription to our newsletter. Thank you!</p><hr><p><a href=\"{profile_url}\">Change your profile</p>\";s:18:\"confirmed_tracking\";s:0:\"\";}', 'yes');
INSERT INTO `tbc_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(445, 'newsletter_subscription_lists', 'a:240:{s:6:\"list_1\";s:0:\"\";s:13:\"list_1_status\";i:0;s:14:\"list_1_checked\";i:0;s:13:\"list_1_forced\";i:0;s:19:\"list_1_subscription\";i:0;s:14:\"list_1_profile\";i:0;s:6:\"list_2\";s:0:\"\";s:13:\"list_2_status\";i:0;s:14:\"list_2_checked\";i:0;s:13:\"list_2_forced\";i:0;s:19:\"list_2_subscription\";i:0;s:14:\"list_2_profile\";i:0;s:6:\"list_3\";s:0:\"\";s:13:\"list_3_status\";i:0;s:14:\"list_3_checked\";i:0;s:13:\"list_3_forced\";i:0;s:19:\"list_3_subscription\";i:0;s:14:\"list_3_profile\";i:0;s:6:\"list_4\";s:0:\"\";s:13:\"list_4_status\";i:0;s:14:\"list_4_checked\";i:0;s:13:\"list_4_forced\";i:0;s:19:\"list_4_subscription\";i:0;s:14:\"list_4_profile\";i:0;s:6:\"list_5\";s:0:\"\";s:13:\"list_5_status\";i:0;s:14:\"list_5_checked\";i:0;s:13:\"list_5_forced\";i:0;s:19:\"list_5_subscription\";i:0;s:14:\"list_5_profile\";i:0;s:6:\"list_6\";s:0:\"\";s:13:\"list_6_status\";i:0;s:14:\"list_6_checked\";i:0;s:13:\"list_6_forced\";i:0;s:19:\"list_6_subscription\";i:0;s:14:\"list_6_profile\";i:0;s:6:\"list_7\";s:0:\"\";s:13:\"list_7_status\";i:0;s:14:\"list_7_checked\";i:0;s:13:\"list_7_forced\";i:0;s:19:\"list_7_subscription\";i:0;s:14:\"list_7_profile\";i:0;s:6:\"list_8\";s:0:\"\";s:13:\"list_8_status\";i:0;s:14:\"list_8_checked\";i:0;s:13:\"list_8_forced\";i:0;s:19:\"list_8_subscription\";i:0;s:14:\"list_8_profile\";i:0;s:6:\"list_9\";s:0:\"\";s:13:\"list_9_status\";i:0;s:14:\"list_9_checked\";i:0;s:13:\"list_9_forced\";i:0;s:19:\"list_9_subscription\";i:0;s:14:\"list_9_profile\";i:0;s:7:\"list_10\";s:0:\"\";s:14:\"list_10_status\";i:0;s:15:\"list_10_checked\";i:0;s:14:\"list_10_forced\";i:0;s:20:\"list_10_subscription\";i:0;s:15:\"list_10_profile\";i:0;s:7:\"list_11\";s:0:\"\";s:14:\"list_11_status\";i:0;s:15:\"list_11_checked\";i:0;s:14:\"list_11_forced\";i:0;s:20:\"list_11_subscription\";i:0;s:15:\"list_11_profile\";i:0;s:7:\"list_12\";s:0:\"\";s:14:\"list_12_status\";i:0;s:15:\"list_12_checked\";i:0;s:14:\"list_12_forced\";i:0;s:20:\"list_12_subscription\";i:0;s:15:\"list_12_profile\";i:0;s:7:\"list_13\";s:0:\"\";s:14:\"list_13_status\";i:0;s:15:\"list_13_checked\";i:0;s:14:\"list_13_forced\";i:0;s:20:\"list_13_subscription\";i:0;s:15:\"list_13_profile\";i:0;s:7:\"list_14\";s:0:\"\";s:14:\"list_14_status\";i:0;s:15:\"list_14_checked\";i:0;s:14:\"list_14_forced\";i:0;s:20:\"list_14_subscription\";i:0;s:15:\"list_14_profile\";i:0;s:7:\"list_15\";s:0:\"\";s:14:\"list_15_status\";i:0;s:15:\"list_15_checked\";i:0;s:14:\"list_15_forced\";i:0;s:20:\"list_15_subscription\";i:0;s:15:\"list_15_profile\";i:0;s:7:\"list_16\";s:0:\"\";s:14:\"list_16_status\";i:0;s:15:\"list_16_checked\";i:0;s:14:\"list_16_forced\";i:0;s:20:\"list_16_subscription\";i:0;s:15:\"list_16_profile\";i:0;s:7:\"list_17\";s:0:\"\";s:14:\"list_17_status\";i:0;s:15:\"list_17_checked\";i:0;s:14:\"list_17_forced\";i:0;s:20:\"list_17_subscription\";i:0;s:15:\"list_17_profile\";i:0;s:7:\"list_18\";s:0:\"\";s:14:\"list_18_status\";i:0;s:15:\"list_18_checked\";i:0;s:14:\"list_18_forced\";i:0;s:20:\"list_18_subscription\";i:0;s:15:\"list_18_profile\";i:0;s:7:\"list_19\";s:0:\"\";s:14:\"list_19_status\";i:0;s:15:\"list_19_checked\";i:0;s:14:\"list_19_forced\";i:0;s:20:\"list_19_subscription\";i:0;s:15:\"list_19_profile\";i:0;s:7:\"list_20\";s:0:\"\";s:14:\"list_20_status\";i:0;s:15:\"list_20_checked\";i:0;s:14:\"list_20_forced\";i:0;s:20:\"list_20_subscription\";i:0;s:15:\"list_20_profile\";i:0;s:7:\"list_21\";s:0:\"\";s:14:\"list_21_status\";i:0;s:15:\"list_21_checked\";i:0;s:14:\"list_21_forced\";i:0;s:20:\"list_21_subscription\";i:0;s:15:\"list_21_profile\";i:0;s:7:\"list_22\";s:0:\"\";s:14:\"list_22_status\";i:0;s:15:\"list_22_checked\";i:0;s:14:\"list_22_forced\";i:0;s:20:\"list_22_subscription\";i:0;s:15:\"list_22_profile\";i:0;s:7:\"list_23\";s:0:\"\";s:14:\"list_23_status\";i:0;s:15:\"list_23_checked\";i:0;s:14:\"list_23_forced\";i:0;s:20:\"list_23_subscription\";i:0;s:15:\"list_23_profile\";i:0;s:7:\"list_24\";s:0:\"\";s:14:\"list_24_status\";i:0;s:15:\"list_24_checked\";i:0;s:14:\"list_24_forced\";i:0;s:20:\"list_24_subscription\";i:0;s:15:\"list_24_profile\";i:0;s:7:\"list_25\";s:0:\"\";s:14:\"list_25_status\";i:0;s:15:\"list_25_checked\";i:0;s:14:\"list_25_forced\";i:0;s:20:\"list_25_subscription\";i:0;s:15:\"list_25_profile\";i:0;s:7:\"list_26\";s:0:\"\";s:14:\"list_26_status\";i:0;s:15:\"list_26_checked\";i:0;s:14:\"list_26_forced\";i:0;s:20:\"list_26_subscription\";i:0;s:15:\"list_26_profile\";i:0;s:7:\"list_27\";s:0:\"\";s:14:\"list_27_status\";i:0;s:15:\"list_27_checked\";i:0;s:14:\"list_27_forced\";i:0;s:20:\"list_27_subscription\";i:0;s:15:\"list_27_profile\";i:0;s:7:\"list_28\";s:0:\"\";s:14:\"list_28_status\";i:0;s:15:\"list_28_checked\";i:0;s:14:\"list_28_forced\";i:0;s:20:\"list_28_subscription\";i:0;s:15:\"list_28_profile\";i:0;s:7:\"list_29\";s:0:\"\";s:14:\"list_29_status\";i:0;s:15:\"list_29_checked\";i:0;s:14:\"list_29_forced\";i:0;s:20:\"list_29_subscription\";i:0;s:15:\"list_29_profile\";i:0;s:7:\"list_30\";s:0:\"\";s:14:\"list_30_status\";i:0;s:15:\"list_30_checked\";i:0;s:14:\"list_30_forced\";i:0;s:20:\"list_30_subscription\";i:0;s:15:\"list_30_profile\";i:0;s:7:\"list_31\";s:0:\"\";s:14:\"list_31_status\";i:0;s:15:\"list_31_checked\";i:0;s:14:\"list_31_forced\";i:0;s:20:\"list_31_subscription\";i:0;s:15:\"list_31_profile\";i:0;s:7:\"list_32\";s:0:\"\";s:14:\"list_32_status\";i:0;s:15:\"list_32_checked\";i:0;s:14:\"list_32_forced\";i:0;s:20:\"list_32_subscription\";i:0;s:15:\"list_32_profile\";i:0;s:7:\"list_33\";s:0:\"\";s:14:\"list_33_status\";i:0;s:15:\"list_33_checked\";i:0;s:14:\"list_33_forced\";i:0;s:20:\"list_33_subscription\";i:0;s:15:\"list_33_profile\";i:0;s:7:\"list_34\";s:0:\"\";s:14:\"list_34_status\";i:0;s:15:\"list_34_checked\";i:0;s:14:\"list_34_forced\";i:0;s:20:\"list_34_subscription\";i:0;s:15:\"list_34_profile\";i:0;s:7:\"list_35\";s:0:\"\";s:14:\"list_35_status\";i:0;s:15:\"list_35_checked\";i:0;s:14:\"list_35_forced\";i:0;s:20:\"list_35_subscription\";i:0;s:15:\"list_35_profile\";i:0;s:7:\"list_36\";s:0:\"\";s:14:\"list_36_status\";i:0;s:15:\"list_36_checked\";i:0;s:14:\"list_36_forced\";i:0;s:20:\"list_36_subscription\";i:0;s:15:\"list_36_profile\";i:0;s:7:\"list_37\";s:0:\"\";s:14:\"list_37_status\";i:0;s:15:\"list_37_checked\";i:0;s:14:\"list_37_forced\";i:0;s:20:\"list_37_subscription\";i:0;s:15:\"list_37_profile\";i:0;s:7:\"list_38\";s:0:\"\";s:14:\"list_38_status\";i:0;s:15:\"list_38_checked\";i:0;s:14:\"list_38_forced\";i:0;s:20:\"list_38_subscription\";i:0;s:15:\"list_38_profile\";i:0;s:7:\"list_39\";s:0:\"\";s:14:\"list_39_status\";i:0;s:15:\"list_39_checked\";i:0;s:14:\"list_39_forced\";i:0;s:20:\"list_39_subscription\";i:0;s:15:\"list_39_profile\";i:0;s:7:\"list_40\";s:0:\"\";s:14:\"list_40_status\";i:0;s:15:\"list_40_checked\";i:0;s:14:\"list_40_forced\";i:0;s:20:\"list_40_subscription\";i:0;s:15:\"list_40_profile\";i:0;}', 'yes'),
(446, 'newsletter_subscription_template', 'a:1:{s:8:\"template\";s:2365:\"<!DOCTYPE html>\n<html>\n    <head>\n        <!-- General styles, not used by all email clients -->\n        <style type=\"text/css\" media=\"all\">\n            a {\n                text-decoration: none;\n                color: #0088cc;\n            }\n            hr {\n                border-top: 1px solid #999;\n            }\n        </style>\n    </head>\n\n    <!-- KEEP THE LAYOUT SIMPLE: THOSE ARE SERVICE MESSAGES. -->\n    <body style=\"margin: 0; padding: 0;\">\n\n        <!-- Top title with dark background -->\n        <table style=\"background-color: #444; width: 100%;\" cellspacing=\"0\" cellpadding=\"0\">\n            <tr>\n                <td style=\"padding: 20px; text-align: center; font-family: sans-serif; color: #fff; font-size: 28px\">\n                    {blog_title}\n                </td>\n            </tr>\n        </table>\n\n        <!-- Main table 100% wide with background color #eee -->    \n        <table style=\"background-color: #eee; width: 100%;\">\n            <tr>\n                <td align=\"center\" style=\"padding: 15px;\">\n\n                    <!-- Content table with backgdound color #fff, width 500px -->\n                    <table style=\"background-color: #fff; max-width: 600px; width: 100%; border: 1px solid #ddd;\">\n                        <tr>\n                            <td style=\"padding: 15px; color: #333; font-size: 16px; font-family: sans-serif\">\n                                <!-- The \"message\" tag below is replaced with one of confirmation, welcome or goodbye messages -->\n                                <!-- Messages content can be configured on Newsletter List Building panels --> \n\n                                {message}\n\n                                <hr>\n                                <!-- Signature if not already added to single messages (surround with <p>) -->\n                                <p>\n                                    <small>\n                                        <a href=\"{blog_url}\">{blog_url}</a><br>\n                                        {company_name}<br>\n                                        {company_address}\n                                    </small>\n                                </p>\n                                \n\n                            </td>\n                        </tr>\n                    </table>\n\n                </td>\n            </tr>\n        </table>\n\n    </body>\n</html>\";}', 'yes'),
(447, 'newsletter_profile', 'a:180:{s:5:\"email\";s:5:\"Email\";s:11:\"email_error\";s:28:\"Email address is not correct\";s:4:\"name\";s:23:\"First name or full name\";s:11:\"name_status\";i:0;s:10:\"name_rules\";i:0;s:7:\"surname\";s:9:\"Last name\";s:14:\"surname_status\";i:0;s:10:\"sex_status\";i:0;s:3:\"sex\";s:3:\"I\'m\";s:7:\"privacy\";s:44:\"By continuing, you accept the privacy policy\";s:14:\"privacy_status\";i:0;s:11:\"privacy_url\";s:0:\"\";s:18:\"privacy_use_wp_url\";i:0;s:9:\"subscribe\";s:9:\"Subscribe\";s:12:\"title_female\";s:3:\"Ms.\";s:10:\"title_male\";s:3:\"Mr.\";s:10:\"title_none\";s:4:\"Dear\";s:8:\"sex_male\";s:3:\"Man\";s:10:\"sex_female\";s:5:\"Woman\";s:8:\"sex_none\";s:13:\"Not specified\";s:16:\"profile_1_status\";i:0;s:9:\"profile_1\";s:0:\"\";s:14:\"profile_1_type\";s:4:\"text\";s:21:\"profile_1_placeholder\";s:0:\"\";s:15:\"profile_1_rules\";i:0;s:17:\"profile_1_options\";s:0:\"\";s:16:\"profile_2_status\";i:0;s:9:\"profile_2\";s:0:\"\";s:14:\"profile_2_type\";s:4:\"text\";s:21:\"profile_2_placeholder\";s:0:\"\";s:15:\"profile_2_rules\";i:0;s:17:\"profile_2_options\";s:0:\"\";s:16:\"profile_3_status\";i:0;s:9:\"profile_3\";s:0:\"\";s:14:\"profile_3_type\";s:4:\"text\";s:21:\"profile_3_placeholder\";s:0:\"\";s:15:\"profile_3_rules\";i:0;s:17:\"profile_3_options\";s:0:\"\";s:16:\"profile_4_status\";i:0;s:9:\"profile_4\";s:0:\"\";s:14:\"profile_4_type\";s:4:\"text\";s:21:\"profile_4_placeholder\";s:0:\"\";s:15:\"profile_4_rules\";i:0;s:17:\"profile_4_options\";s:0:\"\";s:16:\"profile_5_status\";i:0;s:9:\"profile_5\";s:0:\"\";s:14:\"profile_5_type\";s:4:\"text\";s:21:\"profile_5_placeholder\";s:0:\"\";s:15:\"profile_5_rules\";i:0;s:17:\"profile_5_options\";s:0:\"\";s:16:\"profile_6_status\";i:0;s:9:\"profile_6\";s:0:\"\";s:14:\"profile_6_type\";s:4:\"text\";s:21:\"profile_6_placeholder\";s:0:\"\";s:15:\"profile_6_rules\";i:0;s:17:\"profile_6_options\";s:0:\"\";s:16:\"profile_7_status\";i:0;s:9:\"profile_7\";s:0:\"\";s:14:\"profile_7_type\";s:4:\"text\";s:21:\"profile_7_placeholder\";s:0:\"\";s:15:\"profile_7_rules\";i:0;s:17:\"profile_7_options\";s:0:\"\";s:16:\"profile_8_status\";i:0;s:9:\"profile_8\";s:0:\"\";s:14:\"profile_8_type\";s:4:\"text\";s:21:\"profile_8_placeholder\";s:0:\"\";s:15:\"profile_8_rules\";i:0;s:17:\"profile_8_options\";s:0:\"\";s:16:\"profile_9_status\";i:0;s:9:\"profile_9\";s:0:\"\";s:14:\"profile_9_type\";s:4:\"text\";s:21:\"profile_9_placeholder\";s:0:\"\";s:15:\"profile_9_rules\";i:0;s:17:\"profile_9_options\";s:0:\"\";s:17:\"profile_10_status\";i:0;s:10:\"profile_10\";s:0:\"\";s:15:\"profile_10_type\";s:4:\"text\";s:22:\"profile_10_placeholder\";s:0:\"\";s:16:\"profile_10_rules\";i:0;s:18:\"profile_10_options\";s:0:\"\";s:17:\"profile_11_status\";i:0;s:10:\"profile_11\";s:0:\"\";s:15:\"profile_11_type\";s:4:\"text\";s:22:\"profile_11_placeholder\";s:0:\"\";s:16:\"profile_11_rules\";i:0;s:18:\"profile_11_options\";s:0:\"\";s:17:\"profile_12_status\";i:0;s:10:\"profile_12\";s:0:\"\";s:15:\"profile_12_type\";s:4:\"text\";s:22:\"profile_12_placeholder\";s:0:\"\";s:16:\"profile_12_rules\";i:0;s:18:\"profile_12_options\";s:0:\"\";s:17:\"profile_13_status\";i:0;s:10:\"profile_13\";s:0:\"\";s:15:\"profile_13_type\";s:4:\"text\";s:22:\"profile_13_placeholder\";s:0:\"\";s:16:\"profile_13_rules\";i:0;s:18:\"profile_13_options\";s:0:\"\";s:17:\"profile_14_status\";i:0;s:10:\"profile_14\";s:0:\"\";s:15:\"profile_14_type\";s:4:\"text\";s:22:\"profile_14_placeholder\";s:0:\"\";s:16:\"profile_14_rules\";i:0;s:18:\"profile_14_options\";s:0:\"\";s:17:\"profile_15_status\";i:0;s:10:\"profile_15\";s:0:\"\";s:15:\"profile_15_type\";s:4:\"text\";s:22:\"profile_15_placeholder\";s:0:\"\";s:16:\"profile_15_rules\";i:0;s:18:\"profile_15_options\";s:0:\"\";s:17:\"profile_16_status\";i:0;s:10:\"profile_16\";s:0:\"\";s:15:\"profile_16_type\";s:4:\"text\";s:22:\"profile_16_placeholder\";s:0:\"\";s:16:\"profile_16_rules\";i:0;s:18:\"profile_16_options\";s:0:\"\";s:17:\"profile_17_status\";i:0;s:10:\"profile_17\";s:0:\"\";s:15:\"profile_17_type\";s:4:\"text\";s:22:\"profile_17_placeholder\";s:0:\"\";s:16:\"profile_17_rules\";i:0;s:18:\"profile_17_options\";s:0:\"\";s:17:\"profile_18_status\";i:0;s:10:\"profile_18\";s:0:\"\";s:15:\"profile_18_type\";s:4:\"text\";s:22:\"profile_18_placeholder\";s:0:\"\";s:16:\"profile_18_rules\";i:0;s:18:\"profile_18_options\";s:0:\"\";s:17:\"profile_19_status\";i:0;s:10:\"profile_19\";s:0:\"\";s:15:\"profile_19_type\";s:4:\"text\";s:22:\"profile_19_placeholder\";s:0:\"\";s:16:\"profile_19_rules\";i:0;s:18:\"profile_19_options\";s:0:\"\";s:17:\"profile_20_status\";i:0;s:10:\"profile_20\";s:0:\"\";s:15:\"profile_20_type\";s:4:\"text\";s:22:\"profile_20_placeholder\";s:0:\"\";s:16:\"profile_20_rules\";i:0;s:18:\"profile_20_options\";s:0:\"\";s:13:\"list_1_forced\";i:0;s:13:\"list_2_forced\";i:0;s:13:\"list_3_forced\";i:0;s:13:\"list_4_forced\";i:0;s:13:\"list_5_forced\";i:0;s:13:\"list_6_forced\";i:0;s:13:\"list_7_forced\";i:0;s:13:\"list_8_forced\";i:0;s:13:\"list_9_forced\";i:0;s:14:\"list_10_forced\";i:0;s:14:\"list_11_forced\";i:0;s:14:\"list_12_forced\";i:0;s:14:\"list_13_forced\";i:0;s:14:\"list_14_forced\";i:0;s:14:\"list_15_forced\";i:0;s:14:\"list_16_forced\";i:0;s:14:\"list_17_forced\";i:0;s:14:\"list_18_forced\";i:0;s:14:\"list_19_forced\";i:0;s:14:\"list_20_forced\";i:0;s:14:\"list_21_forced\";i:0;s:14:\"list_22_forced\";i:0;s:14:\"list_23_forced\";i:0;s:14:\"list_24_forced\";i:0;s:14:\"list_25_forced\";i:0;s:14:\"list_26_forced\";i:0;s:14:\"list_27_forced\";i:0;s:14:\"list_28_forced\";i:0;s:14:\"list_29_forced\";i:0;s:14:\"list_30_forced\";i:0;s:14:\"list_31_forced\";i:0;s:14:\"list_32_forced\";i:0;s:14:\"list_33_forced\";i:0;s:14:\"list_34_forced\";i:0;s:14:\"list_35_forced\";i:0;s:14:\"list_36_forced\";i:0;s:14:\"list_37_forced\";i:0;s:14:\"list_38_forced\";i:0;s:14:\"list_39_forced\";i:0;s:14:\"list_40_forced\";i:0;}', 'yes'),
(448, 'newsletter_subscription_antibot', 'a:6:{s:12:\"ip_blacklist\";a:0:{}s:17:\"address_blacklist\";a:0:{}s:9:\"antiflood\";i:60;s:7:\"akismet\";i:0;s:7:\"captcha\";i:0;s:8:\"disabled\";i:0;}', 'yes'),
(449, 'newsletter_subscription_version', '2.2.7', 'yes'),
(450, 'newsletter_unsubscription_first_install_time', '1621258846', 'no'),
(451, 'newsletter_unsubscription', 'a:6:{s:16:\"unsubscribe_text\";s:103:\"<p>Please confirm you want to unsubscribe <a href=\"{unsubscription_confirm_url}\">clicking here</a>.</p>\";s:10:\"error_text\";s:99:\"<p>Subscriber not found, it probably has already been removed. No further actions are required.</p>\";s:17:\"unsubscribed_text\";s:124:\"<p>Your subscription has been deleted. If that was an error you can <a href=\"{reactivate_url}\">subscribe again here</a>.</p>\";s:20:\"unsubscribed_subject\";s:7:\"Goodbye\";s:20:\"unsubscribed_message\";s:87:\"<p>This message confirms that you have unsubscribed from our newsletter. Thank you.</p>\";s:16:\"reactivated_text\";s:46:\"<p>Your subscription has been reactivated.</p>\";}', 'yes'),
(452, 'newsletter_unsubscription_version', '1.0.3', 'yes'),
(453, 'newsletter_profile_first_install_time', '1621258846', 'no'),
(454, 'newsletter_profile_main', 'a:8:{s:4:\"text\";s:188:\"{profile_form}\n    <p>If you change your email address, a confirmation email will be sent to activate it.</p>\n    <p><a href=\"{unsubscription_confirm_url}\">Cancel your subscription</a></p>\";s:13:\"email_changed\";s:81:\"Your email has been changed, an activation email has been sent with instructions.\";s:5:\"error\";s:42:\"Your email is not valid or already in use.\";s:10:\"save_label\";s:4:\"Save\";s:13:\"privacy_label\";s:21:\"Read our privacy note\";s:5:\"saved\";s:14:\"Profile saved.\";s:18:\"export_newsletters\";i:0;s:3:\"url\";s:0:\"\";}', 'yes'),
(455, 'newsletter_profile_version', '1.1.0', 'yes'),
(456, 'newsletter_emails_first_install_time', '1621258846', 'no'),
(457, 'newsletter_emails', 'a:1:{s:5:\"theme\";s:7:\"default\";}', 'yes'),
(458, 'newsletter_emails_theme_default', 'a:0:{}', 'no'),
(459, 'newsletter_emails_version', '1.1.5', 'yes'),
(460, 'newsletter_users_first_install_time', '1621258846', 'no'),
(461, 'newsletter_users', 'a:0:{}', 'yes'),
(462, 'newsletter_users_version', '1.3.0', 'yes'),
(463, 'newsletter_statistics_first_install_time', '1621258846', 'no'),
(464, 'newsletter_statistics', 'a:1:{s:3:\"key\";s:32:\"65958792ac0b69d043fa1e5c113292a0\";}', 'yes'),
(465, 'newsletter_statistics_version', '1.2.8', 'yes'),
(466, 'newsletter_install_time', '1621258846', 'no'),
(467, 'widget_newsletterwidget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(468, 'widget_newsletterwidgetminimal', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(469, '_transient_timeout_tnp_extensions_json', '1621518047', 'no');
INSERT INTO `tbc_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(470, '_transient_tnp_extensions_json', '[\n    {\n        \"id\": \"85\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.1.4\",\n        \"title\": \"Addons Manager\",\n        \"description\": \"\",\n        \"slug\": \"newsletter-extensions\",\n        \"type\": \"manager\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/account\",\n        \"image\": \"\",\n        \"status\": \"4\",\n        \"free\": true,\n        \"downloadable\": true,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=85\",\n        \"wp_slug\": \"newsletter-extensions\\/extensions.php\"\n    },\n    {\n        \"id\": \"87\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.0.3\",\n        \"title\": \"Speed and Delivery Hours Control\",\n        \"description\": \"Configure a different delivery speed for each newsletter and the delivery hours window. Only for regular newsletters.\",\n        \"slug\": \"newsletter-speedcontrol\",\n        \"type\": \"legacy\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/account\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2018\\/12\\/speedcontrol.png\",\n        \"status\": \"3\",\n        \"free\": true,\n        \"downloadable\": true,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=87\",\n        \"wp_slug\": \"newsletter-speedcontrol\\/speedcontrol.php\"\n    },\n    {\n        \"id\": \"90\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.0.4\",\n        \"title\": \"Sendinblue\",\n        \"description\": \"Integration with Sendinblue mailing service.\",\n        \"slug\": \"newsletter-sendinblue\",\n        \"type\": \"delivery\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/documentation\\/?p=198432\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/design-32px-outline_newsletter-dev.png\",\n        \"status\": \"3\",\n        \"free\": true,\n        \"downloadable\": true,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=90\",\n        \"wp_slug\": \"newsletter-sendinblue\\/sendinblue.php\"\n    },\n    {\n        \"id\": \"93\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.0.0\",\n        \"title\": \"External SMTP\",\n        \"description\": \"Add SMTP support to Newsletter for sending emails.\",\n        \"slug\": \"newsletter-smtp\",\n        \"type\": \"delivery\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/documentation\\/addons\\/delivery-addons\\/smtp-extension\\/\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/design-32px-outline_newsletter-dev.png\",\n        \"status\": \"4\",\n        \"free\": true,\n        \"downloadable\": true,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=93\",\n        \"wp_slug\": \"newsletter-smtp\\/smtp.php\"\n    },\n    {\n        \"id\": \"97\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.0.3\",\n        \"title\": \"Webhooks (BETA)\",\n        \"description\": \"Adds webhooks to trigger external services upon subscription and cancellation events.\",\n        \"slug\": \"newsletter-webhooks\",\n        \"type\": \"extension\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/documentation\\/developers\\/newsletter-webhooks\\/\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2017\\/10\\/bold-direction@2x-1.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=97\",\n        \"wp_slug\": \"newsletter-webhooks\\/webhooks.php\"\n    },\n    {\n        \"id\": \"99\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.0.1\",\n        \"title\": \"Elementor Forms Addon (ALPHA)\",\n        \"description\": \"Integrates Elementor forms with Newsletter to collect subscription by forms created with Elementor.\",\n        \"slug\": \"newsletter-elementor\",\n        \"type\": \"integration\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/documentation\\/addons\\/integrations\\/elementor-extension\\/\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2021\\/04\\/elementor.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=99\",\n        \"wp_slug\": \"newsletter-elementor\\/elementor.php\"\n    },\n    {\n        \"id\": \"100\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.0.0\",\n        \"title\": \"Easy Digital Downloads\",\n        \"description\": \"The Newsletter Plugin integration for Easy Digital Downloads.\",\n        \"slug\": \"\",\n        \"type\": \"integration\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/premium\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2021\\/04\\/edd-logo.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=100\",\n        \"wp_slug\": \"\\/.php\"\n    },\n    {\n        \"id\": \"101\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.0.0\",\n        \"title\": \"Gravity Forms\",\n        \"description\": \"Integration between Gravity Forms and Newsletter to collect subscriptions directly from Gravity designed forms.\",\n        \"slug\": \"newsletter-gravityforms\",\n        \"type\": \"integration\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/documentation\\/addons\\/integrations\\/gravityforms-extension\\/\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2021\\/04\\/gravityforms.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=101\",\n        \"wp_slug\": \"newsletter-gravityforms\\/gravityforms.php\"\n    },\n    {\n        \"id\": \"91\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.0.2\",\n        \"title\": \"Instasend\",\n        \"description\": \"Quickly create a newsletter from a post (free for limited time)\",\n        \"slug\": \"newsletter-instasend\",\n        \"type\": \"extension\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/account\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2020\\/05\\/instasend-32.png\",\n        \"status\": \"3\",\n        \"free\": true,\n        \"downloadable\": true,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=91\",\n        \"wp_slug\": \"newsletter-instasend\\/instasend.php\"\n    },\n    {\n        \"id\": \"61\",\n        \"children_fileid\": \"\",\n        \"version\": \"4.1.9\",\n        \"title\": \"Contact Form 7\",\n        \"description\": \"Adds the newsletter subscription feature to your Contact Form 7 forms.\",\n        \"slug\": \"newsletter-cf7\",\n        \"type\": \"integration\",\n        \"url\": \"http:\\/\\/www.thenewsletterplugin.com\\/plugins\\/newsletter\\/contact-form-7-extension\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/users-32px-outline_badge-13.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=61\",\n        \"wp_slug\": \"newsletter-cf7\\/cf7.php\"\n    },\n    {\n        \"id\": \"83\",\n        \"children_fileid\": null,\n        \"version\": \"1.0.3\",\n        \"title\": \"Ninja Forms Integration\",\n        \"description\": \"Integrate Ninja Forms with Newsletter collecting subscription from your contact form.\",\n        \"slug\": \"newsletter-ninjaforms\",\n        \"type\": \"integration\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/premium\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2018\\/10\\/forms-integration.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=83\",\n        \"wp_slug\": \"newsletter-ninjaforms\\/ninjaforms.php\"\n    },\n    {\n        \"id\": \"84\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.0.5\",\n        \"title\": \"WP Forms Integration\",\n        \"description\": \"Integration with WP-Forms plugin. You can add a subscription option to your contact forms.\",\n        \"slug\": \"newsletter-wpforms\",\n        \"type\": \"integration\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/premium\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2018\\/10\\/forms-integration.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=84\",\n        \"wp_slug\": \"newsletter-wpforms\\/wpforms.php\"\n    },\n    {\n        \"id\": \"50\",\n        \"children_fileid\": \"\",\n        \"version\": \"4.4.0\",\n        \"title\": \"Reports\",\n        \"description\": \"Shows tables and diagrams of the collected data (opens, clicks, ...).\",\n        \"slug\": \"newsletter-reports\",\n        \"type\": \"extension\",\n        \"url\": \"http:\\/\\/www.thenewsletterplugin.com\\/reports\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/business-32px-outline_chart-bar-33.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=50\",\n        \"wp_slug\": \"newsletter-reports\\/reports.php\"\n    },\n    {\n        \"id\": \"62\",\n        \"children_fileid\": \"\",\n        \"version\": \"4.5.1\",\n        \"title\": \"Automated\",\n        \"description\": \"Automatically creates periodic newsletters with your blog contents. Multichannel.\",\n        \"slug\": \"newsletter-automated\",\n        \"type\": \"extension\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/automated\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2021\\/03\\/automated-32.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=62\",\n        \"wp_slug\": \"newsletter-automated\\/automated.php\"\n    },\n    {\n        \"id\": \"63\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.6.7\",\n        \"title\": \"WooCommerce\",\n        \"description\": \"The Newsletter Plugin integration for WooCommerce\\u2122. Unleash your marketing powers.\",\n        \"slug\": \"newsletter-woocommerce\",\n        \"type\": \"integration\",\n        \"url\": \"http:\\/\\/www.thenewsletterplugin.com\\/woocommerce\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2018\\/03\\/woocommerce-extension-icon.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=63\",\n        \"wp_slug\": \"newsletter-woocommerce\\/woocommerce.php\"\n    },\n    {\n        \"id\": \"67\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.2.4\",\n        \"title\": \"Leads\",\n        \"description\": \"Add a popup or a fixed subscription bar to your website and offer your visitors a simple way to subscribe.\",\n        \"slug\": \"newsletter-leads\",\n        \"type\": \"extension\",\n        \"url\": \"http:\\/\\/www.thenewsletterplugin.com\\/plugins\\/newsletter\\/leads-extension\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/ui-32px-outline-3_widget.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=67\",\n        \"wp_slug\": \"newsletter-leads\\/leads.php\"\n    },\n    {\n        \"id\": \"68\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.1.2\",\n        \"title\": \"Google Analytics\",\n        \"description\": \"Automatically add Google Analytics UTM campaign tracking to links\",\n        \"slug\": \"newsletter-analytics\",\n        \"type\": \"extension\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/google-analytics\",\n        \"image\": \" https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/analytics.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=68\",\n        \"wp_slug\": \"newsletter-analytics\\/analytics.php\"\n    },\n    {\n        \"id\": \"70\",\n        \"children_fileid\": null,\n        \"version\": \"1.0.7\",\n        \"title\": \"Subscribe on Comment\",\n        \"description\": \"Adds the subscription option to your blog comment form\",\n        \"slug\": \"newsletter-comments\",\n        \"type\": \"integration\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/premium\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2017\\/02\\/comment-notification.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=70\",\n        \"wp_slug\": \"newsletter-comments\\/comments.php\"\n    },\n    {\n        \"id\": \"72\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.2.9\",\n        \"title\": \"Autoresponder\",\n        \"description\": \"Create unlimited email series to follow-up your subscribers. Lessons, up-sells, conversations.\",\n        \"slug\": \"newsletter-autoresponder\",\n        \"type\": \"extension\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/autoresponder\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/emoticons-32px-outline_robot.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=72\",\n        \"wp_slug\": \"newsletter-autoresponder\\/autoresponder.php\"\n    },\n    {\n        \"id\": \"74\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.3.3\",\n        \"title\": \"Extended Composer Blocks\",\n        \"description\": \"Adds new blocks to the newsletter composer: list, video, gallery, full post.\",\n        \"slug\": \"newsletter-blocks\",\n        \"type\": \"extension\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/premium\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2017\\/04\\/ui-32px-outline-3_widget.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=74\",\n        \"wp_slug\": \"newsletter-blocks\\/blocks.php\"\n    },\n    {\n        \"id\": \"75\",\n        \"children_fileid\": null,\n        \"version\": \"1.1.0\",\n        \"title\": \"Geolocation\",\n        \"description\": \"Geolocate the subscribers and target them by geolocation in your campaign.\",\n        \"slug\": \"newsletter-geo\",\n        \"type\": \"extension\",\n        \"url\": \"http:\\/\\/www.thenewsletterplugin.com\\/\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2018\\/03\\/geo-extension-icon.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=75\",\n        \"wp_slug\": \"newsletter-geo\\/geo.php\"\n    },\n    {\n        \"id\": \"77\",\n        \"children_fileid\": \"\",\n        \"version\": \"2.1.6\",\n        \"title\": \"Newsletter API\",\n        \"description\": \"Access programmatically to The Newsletter Plugin via REST calls.\",\n        \"slug\": \"newsletter-api\",\n        \"type\": \"extension\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/account\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2017\\/10\\/bold-direction@2x-1.png\",\n        \"status\": \"3\",\n        \"free\": true,\n        \"downloadable\": true,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=77\",\n        \"wp_slug\": \"newsletter-api\\/api.php\"\n    },\n    {\n        \"id\": \"55\",\n        \"children_fileid\": null,\n        \"version\": \"4.0.9\",\n        \"title\": \"Facebook\",\n        \"description\": \"One click subscription and confirmation with Facebook Connect.\",\n        \"slug\": \"newsletter-facebook\",\n        \"type\": \"integration\",\n        \"url\": \"http:\\/\\/www.thenewsletterplugin.com\\/plugins\\/newsletter\\/facebook-module\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/Facebook.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=55\",\n        \"wp_slug\": \"newsletter-facebook\\/facebook.php\"\n    },\n    {\n        \"id\": \"76\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.1.5\",\n        \"title\": \"Bounce Management\",\n        \"description\": \"This experimental extension manages the bounces and keeps the list clean of invalid addresses.\",\n        \"slug\": \"newsletter-bounce\",\n        \"type\": \"extension\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/premium\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2017\\/10\\/ic_settings_backup_restore_32px.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=76\",\n        \"wp_slug\": \"newsletter-bounce\\/bounce.php\"\n    },\n    {\n        \"id\": \"79\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.1.3\",\n        \"title\": \"Events Manager Integration\",\n        \"description\": \"Integrates with Events Manager plugin to add events in your regular and automated newsletters.\",\n        \"slug\": \"newsletter-events\",\n        \"type\": \"integration\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/documentation\\/addons\\/integrations\\/events-extension\\/\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2019\\/02\\/events-manager-icon.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=79\",\n        \"wp_slug\": \"newsletter-events\\/events.php\"\n    },\n    {\n        \"id\": \"82\",\n        \"children_fileid\": null,\n        \"version\": \"1.0.0\",\n        \"title\": \"Translatepress Bridge\",\n        \"description\": \"Enables few multilanguage Newsletter features for who is using Translatepress.\",\n        \"slug\": \"newsletter-translatepress\",\n        \"type\": \"integration\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/account\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2018\\/09\\/translatepress.png\",\n        \"status\": \"3\",\n        \"free\": true,\n        \"downloadable\": true,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=82\",\n        \"wp_slug\": \"newsletter-translatepress\\/translatepress.php\"\n    },\n    {\n        \"id\": \"86\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.2.0\",\n        \"title\": \"Advanced Import\",\n        \"description\": \"An advanced import system with extended profile fields and mapping (beta version).\",\n        \"slug\": \"newsletter-import\",\n        \"type\": \"extension\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/account\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/file-upload-88.png\",\n        \"status\": \"3\",\n        \"free\": true,\n        \"downloadable\": true,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=86\",\n        \"wp_slug\": \"newsletter-import\\/import.php\"\n    },\n    {\n        \"id\": \"88\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.1.3\",\n        \"title\": \"The Events Calendar (by Tribe)\",\n        \"description\": \"Adds a composer block which extracts the events managed by The Events Calendar plugin.\",\n        \"slug\": \"newsletter-tribeevents\",\n        \"type\": \"integration\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/documentation\\/tribeevents-extension\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2019\\/02\\/tribe-event-calendar-icon.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=88\",\n        \"wp_slug\": \"newsletter-tribeevents\\/tribeevents.php\"\n    },\n    {\n        \"id\": \"58\",\n        \"children_fileid\": \"\",\n        \"version\": \"4.0.5\",\n        \"title\": \"Public Archive\",\n        \"description\": \"Generates a public archive of the sent newsletters for your blog.\",\n        \"slug\": \"newsletter-archive\",\n        \"type\": \"extension\",\n        \"url\": \"http:\\/\\/www.thenewsletterplugin.com\\/plugins\\/newsletter\\/newsletter-archive-extension\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/files-32px-outline_archive-3d-content.png\",\n        \"status\": \"3\",\n        \"free\": true,\n        \"downloadable\": true,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=58\",\n        \"wp_slug\": \"newsletter-archive\\/archive.php\"\n    },\n    {\n        \"id\": \"71\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.0.9\",\n        \"title\": \"Locked Content\",\n        \"description\": \"Boost your subscription rate locking out your premium contents with a subscription form.\",\n        \"slug\": \"newsletter-lock\",\n        \"type\": \"extension\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/account\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2017\\/04\\/ui-32px-outline-1_lock-open.png\",\n        \"status\": \"3\",\n        \"free\": true,\n        \"downloadable\": true,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=71\",\n        \"wp_slug\": \"newsletter-lock\\/lock.php\"\n    },\n    {\n        \"id\": \"73\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.2.6\",\n        \"title\": \"WP Users Integration\",\n        \"description\": \"Connects the WordPress user registration with Newsletter subscription. Optionally imports all WP users as subscribers.\",\n        \"slug\": \"newsletter-wpusers\",\n        \"type\": \"integration\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/account\",\n        \"image\": \"https:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/uploads\\/2017\\/04\\/media-32px-outline-2_speaker-01.png\",\n        \"status\": \"3\",\n        \"free\": true,\n        \"downloadable\": true,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=73\",\n        \"wp_slug\": \"newsletter-wpusers\\/wpusers.php\"\n    },\n    {\n        \"id\": \"51\",\n        \"children_fileid\": \"\",\n        \"version\": \"4.1.3\",\n        \"title\": \"Feed by Mail\",\n        \"description\": \"Automatically creates and sends newsletters with the latest blog posts.\",\n        \"slug\": \"newsletter-feed\",\n        \"type\": \"legacy\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/feed-by-mail-extension\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/ui-32px-outline-3_playlist.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=51\",\n        \"wp_slug\": \"newsletter-feed\\/feed.php\"\n    },\n    {\n        \"id\": \"53\",\n        \"children_fileid\": null,\n        \"version\": \"2.2.0\",\n        \"title\": \"Popup\",\n        \"description\": \"Configurable popup system to increase the subscription rate.\",\n        \"slug\": \"newsletter-popup\",\n        \"type\": \"legacy\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/plugins\\/newsletter\\/popup-module\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/ui-32px-outline-3_widget.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=53\",\n        \"wp_slug\": \"newsletter-popup\\/popup.php\"\n    },\n    {\n        \"id\": \"54\",\n        \"children_fileid\": \"\",\n        \"version\": \"4.1.3\",\n        \"title\": \"Followup\",\n        \"description\": \"Automated email series sent upon subscription at defined intervals.\",\n        \"slug\": \"newsletter-followup\",\n        \"type\": \"legacy\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/plugins\\/newsletter\\/follow-up-module\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/ui-32px-outline-2_time-countdown.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=54\",\n        \"wp_slug\": \"newsletter-followup\\/followup.php\"\n    },\n    {\n        \"id\": \"48\",\n        \"children_fileid\": \"\",\n        \"version\": \"4.2.2\",\n        \"title\": \"SendGrid\",\n        \"description\": \"Integrates the SendGrid delivery system and bounce detection.\",\n        \"slug\": \"newsletter-sendgrid\",\n        \"type\": \"delivery\",\n        \"url\": \"http:\\/\\/www.thenewsletterplugin.com\\/plugins\\/newsletter\\/sendgrid-module\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/design-32px-outline_newsletter-dev.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=48\",\n        \"wp_slug\": \"newsletter-sendgrid\\/sendgrid.php\"\n    },\n    {\n        \"id\": \"49\",\n        \"children_fileid\": \"\",\n        \"version\": \"4.0.0\",\n        \"title\": \"Mandrill\",\n        \"description\": \"Integrates the Mandrill delivery system and bounce detection.\",\n        \"slug\": \"newsletter-mandrill\",\n        \"type\": \"legacy\",\n        \"url\": \"http:\\/\\/www.thenewsletterplugin.com\\/plugins\\/newsletter\\/mandrill-module\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/design-32px-outline_newsletter-dev.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=49\",\n        \"wp_slug\": \"newsletter-mandrill\\/mandrill.php\"\n    },\n    {\n        \"id\": \"52\",\n        \"children_fileid\": \"\",\n        \"version\": \"4.0.8\",\n        \"title\": \"Mailjet\",\n        \"description\": \"Integrates the Mailjet delivery system and bounce detection.\",\n        \"slug\": \"newsletter-mailjet\",\n        \"type\": \"delivery\",\n        \"url\": \"http:\\/\\/www.thenewsletterplugin.com\\/plugins\\/newsletter\\/mailjet-module\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/design-32px-outline_newsletter-dev.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=52\",\n        \"wp_slug\": \"newsletter-mailjet\\/mailjet.php\"\n    },\n    {\n        \"id\": \"60\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.3.2\",\n        \"title\": \"Amazon SES\",\n        \"description\": \"Integrates Newsletter with Amazon SES service for sending emails and processing bounces.\",\n        \"slug\": \"newsletter-amazon\",\n        \"type\": \"delivery\",\n        \"url\": \"http:\\/\\/www.thenewsletterplugin.com\\/plugins\\/newsletter\\/amazon-ses-extension\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/design-32px-outline_newsletter-dev.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=60\",\n        \"wp_slug\": \"newsletter-amazon\\/amazon.php\"\n    },\n    {\n        \"id\": \"65\",\n        \"children_fileid\": \"\",\n        \"version\": \"4.1.2\",\n        \"title\": \"Mailgun\",\n        \"description\": \"Integrates the Mailgun delivery system and bounce detection.\",\n        \"slug\": \"newsletter-mailgun\",\n        \"type\": \"delivery\",\n        \"url\": \"http:\\/\\/www.thenewsletterplugin.com\\/plugins\\/newsletter\\/mailgun-module\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/design-32px-outline_newsletter-dev.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=65\",\n        \"wp_slug\": \"newsletter-mailgun\\/mailgun.php\"\n    },\n    {\n        \"id\": \"66\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.1.0\",\n        \"title\": \"ElasticEmail\",\n        \"description\": \"ElasticEmail integration\",\n        \"slug\": \"newsletter-elasticemail\",\n        \"type\": \"delivery\",\n        \"url\": \"http:\\/\\/www.thenewsletterplugin.com\\/premium\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/design-32px-outline_newsletter-dev.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=66\",\n        \"wp_slug\": \"newsletter-elasticemail\\/elasticemail.php\"\n    },\n    {\n        \"id\": \"69\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.1.7\",\n        \"title\": \"SparkPost\",\n        \"description\": \"Integrates Newsletter with the SparkPost mail delivery service and bounce detection.\",\n        \"slug\": \"newsletter-sparkpost\",\n        \"type\": \"delivery\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/premium\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/design-32px-outline_newsletter-dev.png\",\n        \"status\": \"2\",\n        \"free\": false,\n        \"downloadable\": false,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=69\",\n        \"wp_slug\": \"newsletter-sparkpost\\/sparkpost.php\"\n    },\n    {\n        \"id\": \"56\",\n        \"children_fileid\": \"\",\n        \"version\": \"2.2.0\",\n        \"title\": \"Grabber\",\n        \"description\": \"Experimental! General subscription grabber from other forms. Requires technical skills.\",\n        \"slug\": \"newsletter-grabber\",\n        \"type\": \"legacy\",\n        \"url\": \"http:\\/\\/www.thenewsletterplugin.com\\/plugins\\/newsletter\\/grabber-module\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/placeholder.png\",\n        \"status\": \"4\",\n        \"free\": true,\n        \"downloadable\": true,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=56\",\n        \"wp_slug\": \"newsletter-grabber\\/grabber.php\"\n    },\n    {\n        \"id\": \"96\",\n        \"children_fileid\": \"\",\n        \"version\": \"1.0.1\",\n        \"title\": \"Office 365 Header Removal\",\n        \"description\": \"This addon removes hidden headers from outgoing email to avoid Office365 SMTP block (or attempt to...). Install ONLY if you\'re using Office365 SMTP with an SMTP plugin!\",\n        \"slug\": \"newsletter-office365\",\n        \"type\": \"delivery\",\n        \"url\": \"https:\\/\\/www.thenewsletterplugin.com\\/account\",\n        \"image\": \"https:\\/\\/cdn.thenewsletterplugin.com\\/extensions\\/design-32px-outline_newsletter-dev.png\",\n        \"status\": \"3\",\n        \"free\": true,\n        \"downloadable\": true,\n        \"download_url\": \"http:\\/\\/www.thenewsletterplugin.com\\/wp-content\\/plugins\\/file-commerce-pro\\/get.php?f=96\",\n        \"wp_slug\": \"newsletter-office365\\/office365.php\"\n    }\n]', 'no'),
(471, 'newsletter_page', '72', 'no'),
(473, 'newsletter_diagnostic_cron_calls', 'a:3:{i:0;i:1621258904;i:1;i:1621260661;i:2;i:1621260678;}', 'no'),
(474, 'newsletter_diagnostic_cron_data', '', 'no'),
(477, 'newsletter_main_status', 'a:2:{s:4:\"mail\";i:0;s:10:\"mail_error\";N;}', 'yes'),
(490, 'tbc_sendpress_subscribers_tracker_db_version', '1.2', 'yes'),
(491, 'tbc_sendpress_subscribers_url_db_version', '1.1', 'yes'),
(492, 'tbc_sendpress_url_db_version', '1.1', 'yes'),
(493, 'sendpress_options', 'a:15:{s:12:\"install_date\";i:1621260811;s:14:\"widget_options\";a:3:{s:8:\"load_css\";i:0;s:9:\"load_ajax\";i:0;s:22:\"load_scripts_in_footer\";i:0;}s:11:\"pro_plugins\";a:1:{s:11:\"setup_value\";b:0;}s:20:\"notification_options\";a:19:{s:5:\"email\";s:0:\"\";s:20:\"notifications-enable\";b:0;s:10:\"subscribed\";i:1;s:12:\"unsubscribed\";i:1;s:14:\"send-to-admins\";b:0;s:14:\"enable-hipchat\";b:0;s:11:\"hipchat-api\";s:0:\"\";s:12:\"hipchat-room\";s:0:\"\";s:25:\"post-notifications-enable\";b:0;s:25:\"post-notification-subject\";s:0:\"\";s:4:\"name\";s:0:\"\";s:32:\"notifications-subscribed-instant\";b:0;s:30:\"notifications-subscribed-daily\";b:0;s:31:\"notifications-subscribed-weekly\";b:0;s:32:\"notifications-subscribed-monthly\";b:0;s:34:\"notifications-unsubscribed-instant\";b:0;s:32:\"notifications-unsubscribed-daily\";b:0;s:33:\"notifications-unsubscribed-weekly\";b:0;s:34:\"notifications-unsubscribed-monthly\";b:0;}s:11:\"socialicons\";b:0;s:10:\"sendmethod\";s:24:\"SendPress_Sender_Website\";s:16:\"send_optin_email\";s:3:\"yes\";s:9:\"try-theme\";s:3:\"yes\";s:12:\"confirm-page\";s:7:\"default\";s:11:\"manage-page\";s:7:\"default\";s:15:\"cron_send_count\";s:3:\"100\";s:14:\"emails-per-day\";s:4:\"1000\";s:15:\"emails-per-hour\";s:3:\"100\";s:14:\"queue-per-call\";s:4:\"1000\";s:7:\"version\";s:8:\"1.21.4.5\";}', 'yes'),
(495, 'widget_sendpress-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(496, 'widget_sendpress-forms-widget', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(498, 'tbc_sendpress_autoresponders_db_version', '1.1', 'yes'),
(499, 'tbc_sendpress_schedules_db_version', '1.0', 'yes'),
(500, 'tbc_sendpress_connections_db_version', '1.0', 'yes'),
(501, 'tbc_sendpress_customfields_db_version', '1.4', 'yes'),
(502, 'sendpress_base_settings', 'a:2:{s:11:\"update-info\";s:4:\"show\";s:7:\"version\";s:8:\"1.21.4.5\";}', 'yes'),
(504, '_transient_timeout_spnl-background-weekly', '1621865627', 'no'),
(505, '_transient_spnl-background-weekly', 'a:1:{s:7:\"runtime\";s:21:\"May 17, 2021, 2:13 pm\";}', 'no'),
(509, 'recovery_mode_email_last_sent', '1621262021', 'yes'),
(515, 'widget_recent-posts-widget-with-thumbnails', 'a:2:{i:2;a:39:{s:5:\"title\";s:0:\"\";s:11:\"default_url\";s:104:\"http://localhost/thebrowncurves/wp-content/plugins/recent-posts-widget-with-thumbnails/default_thumb.gif\";s:16:\"thumb_dimensions\";s:6:\"custom\";s:12:\"category_ids\";a:1:{i:0;i:0;}s:14:\"excerpt_length\";i:55;s:12:\"number_posts\";i:5;s:17:\"post_title_length\";i:1000;s:12:\"thumb_height\";i:75;s:11:\"thumb_width\";i:75;s:17:\"hide_current_post\";b:0;s:17:\"only_sticky_posts\";b:0;s:17:\"hide_sticky_posts\";b:0;s:10:\"hide_title\";b:0;s:17:\"keep_aspect_ratio\";b:0;s:11:\"keep_sticky\";b:0;s:12:\"only_1st_img\";b:0;s:12:\"random_order\";b:0;s:11:\"show_author\";b:0;s:15:\"show_categories\";b:0;s:20:\"show_comments_number\";b:0;s:9:\"show_date\";b:0;s:12:\"show_excerpt\";b:0;s:14:\"ignore_excerpt\";b:0;s:27:\"ignore_post_content_excerpt\";b:0;s:16:\"set_more_as_link\";b:0;s:11:\"try_1st_img\";b:0;s:11:\"use_default\";b:0;s:16:\"use_default_only\";b:0;s:15:\"open_new_window\";b:0;s:21:\"print_post_categories\";b:0;s:17:\"set_cats_as_links\";b:0;s:14:\"use_inline_css\";b:0;s:10:\"use_no_css\";b:0;s:14:\"hide_alt_texts\";b:0;s:10:\"show_thumb\";b:1;s:12:\"author_label\";s:2:\"By\";s:12:\"excerpt_more\";s:6:\" […]\";s:14:\"category_label\";s:2:\"In\";s:9:\"thumb_alt\";s:0:\"\";}s:12:\"_multiwidget\";i:1;}', 'yes'),
(518, 'action_scheduler_hybrid_store_demarkation', '83', 'yes'),
(519, 'schema-ActionScheduler_StoreSchema', '3.0.1621265631', 'yes'),
(520, 'schema-ActionScheduler_LoggerSchema', '2.0.1621265631', 'yes'),
(523, 'woocommerce_schema_version', '430', 'yes'),
(524, 'woocommerce_store_address', 'PLOT NO. 33', 'yes'),
(525, 'woocommerce_store_address_2', 'KRISHNA SOCIETY KIDANA', 'yes'),
(526, 'woocommerce_store_city', 'Adipur', 'yes'),
(527, 'woocommerce_default_country', 'IN:GJ', 'yes'),
(528, 'woocommerce_store_postcode', '370205', 'yes'),
(529, 'woocommerce_allowed_countries', 'all', 'yes'),
(530, 'woocommerce_all_except_countries', 'a:0:{}', 'yes'),
(531, 'woocommerce_specific_allowed_countries', 'a:0:{}', 'yes'),
(532, 'woocommerce_ship_to_countries', '', 'yes'),
(533, 'woocommerce_specific_ship_to_countries', 'a:0:{}', 'yes'),
(534, 'woocommerce_default_customer_address', 'base', 'yes'),
(535, 'woocommerce_calc_taxes', 'yes', 'yes'),
(536, 'woocommerce_enable_coupons', 'yes', 'yes'),
(537, 'woocommerce_calc_discounts_sequentially', 'no', 'no'),
(538, 'woocommerce_currency', 'INR', 'yes'),
(539, 'woocommerce_currency_pos', 'left', 'yes'),
(540, 'woocommerce_price_thousand_sep', ',', 'yes'),
(541, 'woocommerce_price_decimal_sep', '', 'yes'),
(542, 'woocommerce_price_num_decimals', '0', 'yes'),
(543, 'woocommerce_shop_page_id', '85', 'yes'),
(544, 'woocommerce_cart_redirect_after_add', 'no', 'yes'),
(545, 'woocommerce_enable_ajax_add_to_cart', 'yes', 'yes'),
(546, 'woocommerce_placeholder_image', '84', 'yes'),
(547, 'woocommerce_weight_unit', 'kg', 'yes'),
(548, 'woocommerce_dimension_unit', 'cm', 'yes'),
(549, 'woocommerce_enable_reviews', 'yes', 'yes'),
(550, 'woocommerce_review_rating_verification_label', 'yes', 'no'),
(551, 'woocommerce_review_rating_verification_required', 'no', 'no'),
(552, 'woocommerce_enable_review_rating', 'yes', 'yes'),
(553, 'woocommerce_review_rating_required', 'yes', 'no'),
(554, 'woocommerce_manage_stock', 'yes', 'yes'),
(555, 'woocommerce_hold_stock_minutes', '60', 'no'),
(556, 'woocommerce_notify_low_stock', 'yes', 'no'),
(557, 'woocommerce_notify_no_stock', 'yes', 'no'),
(558, 'woocommerce_stock_email_recipient', 'giribhagirath169@gmail.com', 'no'),
(559, 'woocommerce_notify_low_stock_amount', '2', 'no'),
(560, 'woocommerce_notify_no_stock_amount', '0', 'yes'),
(561, 'woocommerce_hide_out_of_stock_items', 'no', 'yes'),
(562, 'woocommerce_stock_format', '', 'yes'),
(563, 'woocommerce_file_download_method', 'force', 'no'),
(564, 'woocommerce_downloads_require_login', 'no', 'no'),
(565, 'woocommerce_downloads_grant_access_after_payment', 'yes', 'no'),
(566, 'woocommerce_downloads_add_hash_to_filename', 'yes', 'yes'),
(567, 'woocommerce_prices_include_tax', 'no', 'yes'),
(568, 'woocommerce_tax_based_on', 'shipping', 'yes'),
(569, 'woocommerce_shipping_tax_class', 'inherit', 'yes'),
(570, 'woocommerce_tax_round_at_subtotal', 'no', 'yes'),
(571, 'woocommerce_tax_classes', '', 'yes'),
(572, 'woocommerce_tax_display_shop', 'excl', 'yes'),
(573, 'woocommerce_tax_display_cart', 'excl', 'yes'),
(574, 'woocommerce_price_display_suffix', '', 'yes'),
(575, 'woocommerce_tax_total_display', 'itemized', 'no'),
(576, 'woocommerce_enable_shipping_calc', 'yes', 'no'),
(577, 'woocommerce_shipping_cost_requires_address', 'no', 'yes'),
(578, 'woocommerce_ship_to_destination', 'billing', 'no'),
(579, 'woocommerce_shipping_debug_mode', 'no', 'yes'),
(580, 'woocommerce_enable_guest_checkout', 'yes', 'no'),
(581, 'woocommerce_enable_checkout_login_reminder', 'no', 'no'),
(582, 'woocommerce_enable_signup_and_login_from_checkout', 'no', 'no'),
(583, 'woocommerce_enable_myaccount_registration', 'no', 'no'),
(584, 'woocommerce_registration_generate_username', 'yes', 'no'),
(585, 'woocommerce_registration_generate_password', 'yes', 'no'),
(586, 'woocommerce_erasure_request_removes_order_data', 'no', 'no'),
(587, 'woocommerce_erasure_request_removes_download_data', 'no', 'no'),
(588, 'woocommerce_allow_bulk_remove_personal_data', 'no', 'no'),
(589, 'woocommerce_registration_privacy_policy_text', 'Your personal data will be used to support your experience throughout this website, to manage access to your account, and for other purposes described in our [privacy_policy].', 'yes'),
(590, 'woocommerce_checkout_privacy_policy_text', 'Your personal data will be used to process your order, support your experience throughout this website, and for other purposes described in our [privacy_policy].', 'yes'),
(591, 'woocommerce_delete_inactive_accounts', 'a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}', 'no'),
(592, 'woocommerce_trash_pending_orders', '', 'no'),
(593, 'woocommerce_trash_failed_orders', '', 'no'),
(594, 'woocommerce_trash_cancelled_orders', '', 'no'),
(595, 'woocommerce_anonymize_completed_orders', 'a:2:{s:6:\"number\";s:0:\"\";s:4:\"unit\";s:6:\"months\";}', 'no'),
(596, 'woocommerce_email_from_name', 'The Brown Curves', 'no'),
(597, 'woocommerce_email_from_address', 'giribhagirath169@gmail.com', 'no'),
(598, 'woocommerce_email_header_image', '', 'no'),
(599, 'woocommerce_email_footer_text', '{site_title} &mdash; Built with {WooCommerce}', 'no'),
(600, 'woocommerce_email_base_color', '#96588a', 'no'),
(601, 'woocommerce_email_background_color', '#f7f7f7', 'no'),
(602, 'woocommerce_email_body_background_color', '#ffffff', 'no'),
(603, 'woocommerce_email_text_color', '#3c3c3c', 'no'),
(604, 'woocommerce_merchant_email_notifications', 'no', 'no'),
(605, 'woocommerce_cart_page_id', '86', 'no'),
(606, 'woocommerce_checkout_page_id', '87', 'no'),
(607, 'woocommerce_myaccount_page_id', '88', 'no'),
(608, 'woocommerce_terms_page_id', '', 'no'),
(609, 'woocommerce_force_ssl_checkout', 'no', 'yes'),
(610, 'woocommerce_unforce_ssl_checkout', 'no', 'yes'),
(611, 'woocommerce_checkout_pay_endpoint', 'order-pay', 'yes'),
(612, 'woocommerce_checkout_order_received_endpoint', 'order-received', 'yes'),
(613, 'woocommerce_myaccount_add_payment_method_endpoint', 'add-payment-method', 'yes'),
(614, 'woocommerce_myaccount_delete_payment_method_endpoint', 'delete-payment-method', 'yes'),
(615, 'woocommerce_myaccount_set_default_payment_method_endpoint', 'set-default-payment-method', 'yes'),
(616, 'woocommerce_myaccount_orders_endpoint', 'orders', 'yes'),
(617, 'woocommerce_myaccount_view_order_endpoint', 'view-order', 'yes'),
(618, 'woocommerce_myaccount_downloads_endpoint', 'downloads', 'yes'),
(619, 'woocommerce_myaccount_edit_account_endpoint', 'edit-account', 'yes'),
(620, 'woocommerce_myaccount_edit_address_endpoint', 'edit-address', 'yes'),
(621, 'woocommerce_myaccount_payment_methods_endpoint', 'payment-methods', 'yes'),
(622, 'woocommerce_myaccount_lost_password_endpoint', 'lost-password', 'yes'),
(623, 'woocommerce_logout_endpoint', 'customer-logout', 'yes'),
(624, 'woocommerce_api_enabled', 'no', 'yes'),
(625, 'woocommerce_allow_tracking', 'no', 'no'),
(626, 'woocommerce_show_marketplace_suggestions', 'yes', 'no'),
(627, 'woocommerce_single_image_width', '600', 'yes'),
(628, 'woocommerce_thumbnail_image_width', '300', 'yes'),
(629, 'woocommerce_checkout_highlight_required_fields', 'yes', 'yes'),
(630, 'woocommerce_demo_store', 'no', 'no'),
(631, 'woocommerce_permalinks', 'a:5:{s:12:\"product_base\";s:7:\"product\";s:13:\"category_base\";s:16:\"product-category\";s:8:\"tag_base\";s:11:\"product-tag\";s:14:\"attribute_base\";s:0:\"\";s:22:\"use_verbose_page_rules\";b:0;}', 'yes'),
(632, 'current_theme_supports_woocommerce', 'no', 'yes'),
(633, 'woocommerce_queue_flush_rewrite_rules', 'no', 'yes'),
(636, 'default_product_cat', '20', 'yes'),
(639, 'woocommerce_version', '5.3.0', 'yes'),
(640, 'woocommerce_db_version', '5.3.0', 'yes'),
(644, '_transient_jetpack_autoloader_plugin_paths', 'a:1:{i:0;s:29:\"{{WP_PLUGIN_DIR}}/woocommerce\";}', 'yes'),
(645, 'action_scheduler_lock_async-request-runner', '1621357827', 'yes'),
(646, 'woocommerce_admin_notices', 'a:1:{i:0;s:20:\"no_secure_connection\";}', 'yes'),
(647, 'woocommerce_maxmind_geolocation_settings', 'a:1:{s:15:\"database_prefix\";s:32:\"loUFpZheEbvD9fh6WmDYMXa7bQcpA7fm\";}', 'yes'),
(648, '_transient_woocommerce_webhook_ids_status_active', 'a:0:{}', 'yes'),
(649, 'widget_woocommerce_widget_cart', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(650, 'widget_woocommerce_layered_nav_filters', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(651, 'widget_woocommerce_layered_nav', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(652, 'widget_woocommerce_price_filter', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(653, 'widget_woocommerce_product_categories', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(654, 'widget_woocommerce_product_search', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(655, 'widget_woocommerce_product_tag_cloud', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(656, 'widget_woocommerce_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(657, 'widget_woocommerce_recently_viewed_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(658, 'widget_woocommerce_top_rated_products', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(659, 'widget_woocommerce_recent_reviews', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(660, 'widget_woocommerce_rating_filter', 'a:1:{s:12:\"_multiwidget\";i:1;}', 'yes'),
(663, 'woocommerce_admin_version', '2.2.6', 'yes'),
(664, 'woocommerce_admin_install_timestamp', '1621265634', 'yes'),
(665, 'wc_remote_inbox_notifications_wca_updated', '', 'yes');
INSERT INTO `tbc_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(666, 'wc_remote_inbox_notifications_specs', 'a:18:{s:20:\"paypal_ppcp_gtm_2021\";O:8:\"stdClass\":8:{s:4:\"slug\";s:20:\"paypal_ppcp_gtm_2021\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:38:\"Offer more options with the new PayPal\";s:7:\"content\";s:113:\"Get the latest PayPal extension for a full suite of payment methods with extensive currency and country coverage.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:36:\"open_wc_paypal_payments_product_page\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:10:\"Learn more\";}}s:3:\"url\";s:61:\"https://woocommerce.com/products/woocommerce-paypal-payments/\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:4:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:18:\"publish_after_time\";s:13:\"publish_after\";s:19:\"2021-04-05 00:00:00\";}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:19:\"publish_before_time\";s:14:\"publish_before\";s:19:\"2021-04-21 00:00:00\";}i:2;O:8:\"stdClass\":2:{s:4:\"type\";s:2:\"or\";s:8:\"operands\";a:7:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:43:\"woocommerce-gateway-paypal-express-checkout\";}}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:30:\"woocommerce-gateway-paypal-pro\";}}i:2;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:37:\"woocommerce-gateway-paypal-pro-hosted\";}}i:3;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:35:\"woocommerce-gateway-paypal-advanced\";}}i:4;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:40:\"woocommerce-gateway-paypal-digital-goods\";}}i:5;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:31:\"woocommerce-paypal-here-gateway\";}}i:6;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:44:\"woocommerce-gateway-paypal-adaptive-payments\";}}}}i:3;O:8:\"stdClass\":2:{s:4:\"type\";s:2:\"or\";s:8:\"operands\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:3:\"not\";s:7:\"operand\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:27:\"woocommerce-paypal-payments\";}}}}i:1;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:27:\"woocommerce-paypal-payments\";s:7:\"version\";s:5:\"1.2.1\";s:8:\"operator\";s:1:\"<\";}}}}}s:23:\"facebook_pixel_api_2021\";O:8:\"stdClass\":8:{s:4:\"slug\";s:23:\"facebook_pixel_api_2021\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:44:\"Improve the performance of your Facebook ads\";s:7:\"content\";s:152:\"Enable Facebook Pixel and Conversions API through the latest version of Facebook for WooCommerce for improved measurement and ad targeting capabilities.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:30:\"upgrade_now_facebook_pixel_api\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:11:\"Upgrade now\";}}s:3:\"url\";s:67:\"plugin-install.php?tab=plugin-information&plugin=&section=changelog\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:3:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:18:\"publish_after_time\";s:13:\"publish_after\";s:19:\"2021-05-17 00:00:00\";}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:19:\"publish_before_time\";s:14:\"publish_before\";s:19:\"2021-06-14 00:00:00\";}i:2;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:24:\"facebook-for-woocommerce\";s:7:\"version\";s:5:\"2.4.0\";s:8:\"operator\";s:2:\"<=\";}}}s:16:\"facebook_ec_2021\";O:8:\"stdClass\":8:{s:4:\"slug\";s:16:\"facebook_ec_2021\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:59:\"Sync your product catalog with Facebook to help boost sales\";s:7:\"content\";s:170:\"A single click adds all products to your Facebook Business Page shop. Product changes are automatically synced, with the flexibility to control which products are listed.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:22:\"learn_more_facebook_ec\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:10:\"Learn more\";}}s:3:\"url\";s:42:\"https://woocommerce.com/products/facebook/\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:10:\"unactioned\";}}s:5:\"rules\";a:3:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:18:\"publish_after_time\";s:13:\"publish_after\";s:19:\"2021-03-01 00:00:00\";}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:19:\"publish_before_time\";s:14:\"publish_before\";s:19:\"2021-03-15 00:00:00\";}i:2;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:24:\"facebook-for-woocommerce\";}}}}s:37:\"ecomm-need-help-setting-up-your-store\";O:8:\"stdClass\":8:{s:4:\"slug\";s:37:\"ecomm-need-help-setting-up-your-store\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:32:\"Need help setting up your Store?\";s:7:\"content\";s:350:\"Schedule a free 30-min <a href=\"https://wordpress.com/support/concierge-support/\">quick start session</a> and get help from our specialists. We’re happy to walk through setup steps, show you around the WordPress.com dashboard, troubleshoot any issues you may have, and help you the find the features you need to accomplish your goals for your site.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:16:\"set-up-concierge\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:21:\"Schedule free session\";}}s:3:\"url\";s:34:\"https://wordpress.com/me/concierge\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:3:{i:0;s:35:\"woocommerce-shipping-australia-post\";i:1;s:32:\"woocommerce-shipping-canada-post\";i:2;s:30:\"woocommerce-shipping-royalmail\";}}}}s:20:\"woocommerce-services\";O:8:\"stdClass\":8:{s:4:\"slug\";s:20:\"woocommerce-services\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:26:\"WooCommerce Shipping & Tax\";s:7:\"content\";s:255:\"WooCommerce Shipping & Tax helps get your store “ready to sell” as quickly as possible. You create your products. We take care of tax calculation, payment processing, and shipping label printing! Learn more about the extension that you just installed.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:10:\"learn-more\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:10:\"Learn more\";}}s:3:\"url\";s:84:\"https://docs.woocommerce.com/document/woocommerce-shipping-and-tax/?utm_source=inbox\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:10:\"unactioned\";}}s:5:\"rules\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:20:\"woocommerce-services\";}}i:1;O:8:\"stdClass\":3:{s:4:\"type\";s:18:\"wcadmin_active_for\";s:9:\"operation\";s:1:\"<\";s:4:\"days\";i:2;}}}s:32:\"ecomm-unique-shopping-experience\";O:8:\"stdClass\":8:{s:4:\"slug\";s:32:\"ecomm-unique-shopping-experience\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:53:\"For a shopping experience as unique as your customers\";s:7:\"content\";s:274:\"Product Add-Ons allow your customers to personalize products while they’re shopping on your online store. No more follow-up email requests—customers get what they want, before they’re done checking out. Learn more about this extension that comes included in your plan.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:43:\"learn-more-ecomm-unique-shopping-experience\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:10:\"Learn more\";}}s:3:\"url\";s:71:\"https://docs.woocommerce.com/document/product-add-ons/?utm_source=inbox\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:3:{i:0;s:35:\"woocommerce-shipping-australia-post\";i:1;s:32:\"woocommerce-shipping-canada-post\";i:2;s:30:\"woocommerce-shipping-royalmail\";}}i:1;O:8:\"stdClass\":3:{s:4:\"type\";s:18:\"wcadmin_active_for\";s:9:\"operation\";s:1:\"<\";s:4:\"days\";i:2;}}}s:37:\"wc-admin-getting-started-in-ecommerce\";O:8:\"stdClass\":8:{s:4:\"slug\";s:37:\"wc-admin-getting-started-in-ecommerce\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:38:\"Getting Started in eCommerce - webinar\";s:7:\"content\";s:174:\"We want to make eCommerce and this process of getting started as easy as possible for you. Watch this webinar to get tips on how to have our store up and running in a breeze.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:17:\"watch-the-webinar\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:17:\"Watch the webinar\";}}s:3:\"url\";s:28:\"https://youtu.be/V_2XtCOyZ7o\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:2:{i:0;O:8:\"stdClass\":4:{s:4:\"type\";s:18:\"onboarding_profile\";s:5:\"index\";s:12:\"setup_client\";s:9:\"operation\";s:2:\"!=\";s:5:\"value\";b:1;}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:2:\"or\";s:8:\"operands\";a:3:{i:0;O:8:\"stdClass\":4:{s:4:\"type\";s:18:\"onboarding_profile\";s:5:\"index\";s:13:\"product_count\";s:9:\"operation\";s:1:\"=\";s:5:\"value\";s:1:\"0\";}i:1;O:8:\"stdClass\":4:{s:4:\"type\";s:18:\"onboarding_profile\";s:5:\"index\";s:7:\"revenue\";s:9:\"operation\";s:1:\"=\";s:5:\"value\";s:4:\"none\";}i:2;O:8:\"stdClass\":4:{s:4:\"type\";s:18:\"onboarding_profile\";s:5:\"index\";s:7:\"revenue\";s:9:\"operation\";s:1:\"=\";s:5:\"value\";s:10:\"up-to-2500\";}}}}}s:18:\"your-first-product\";O:8:\"stdClass\":8:{s:4:\"slug\";s:18:\"your-first-product\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:18:\"Your first product\";s:7:\"content\";s:461:\"That\'s huge! You\'re well on your way to building a successful online store — now it’s time to think about how you\'ll fulfill your orders.<br/><br/>Read our shipping guide to learn best practices and options for putting together your shipping strategy. And for WooCommerce stores in the United States, you can print discounted shipping labels via USPS with <a href=\"https://href.li/?https://woocommerce.com/shipping\" target=\"_blank\">WooCommerce Shipping</a>.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:10:\"learn-more\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:10:\"Learn more\";}}s:3:\"url\";s:82:\"https://woocommerce.com/posts/ecommerce-shipping-solutions-guide/?utm_source=inbox\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:4:{i:0;O:8:\"stdClass\":4:{s:4:\"type\";s:12:\"stored_state\";s:5:\"index\";s:22:\"there_were_no_products\";s:9:\"operation\";s:1:\"=\";s:5:\"value\";b:1;}i:1;O:8:\"stdClass\":4:{s:4:\"type\";s:12:\"stored_state\";s:5:\"index\";s:22:\"there_are_now_products\";s:9:\"operation\";s:1:\"=\";s:5:\"value\";b:1;}i:2;O:8:\"stdClass\":3:{s:4:\"type\";s:13:\"product_count\";s:9:\"operation\";s:2:\">=\";s:5:\"value\";i:1;}i:3;O:8:\"stdClass\":5:{s:4:\"type\";s:18:\"onboarding_profile\";s:5:\"index\";s:13:\"product_types\";s:9:\"operation\";s:8:\"contains\";s:5:\"value\";s:8:\"physical\";s:7:\"default\";a:0:{}}}}s:31:\"wc-square-apple-pay-boost-sales\";O:8:\"stdClass\":8:{s:4:\"slug\";s:31:\"wc-square-apple-pay-boost-sales\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:26:\"Boost sales with Apple Pay\";s:7:\"content\";s:191:\"Now that you accept Apple Pay® with Square you can increase conversion rates by letting your customers know that Apple Pay® is available. Here’s a marketing guide to help you get started.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:27:\"boost-sales-marketing-guide\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:19:\"See marketing guide\";}}s:3:\"url\";s:97:\"https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=square-boost-sales\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:9:{i:0;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:11:\"woocommerce\";s:8:\"operator\";s:2:\">=\";s:7:\"version\";s:3:\"4.8\";}i:1;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:18:\"woocommerce-square\";s:8:\"operator\";s:2:\">=\";s:7:\"version\";s:3:\"2.3\";}i:2;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:27:\"wc_square_apple_pay_enabled\";s:5:\"value\";i:1;s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:3;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:38:\"wc-square-apple-pay-grow-your-business\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:4;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:38:\"wc-square-apple-pay-grow-your-business\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}i:5;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:27:\"wcpay-apple-pay-boost-sales\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:6;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:27:\"wcpay-apple-pay-boost-sales\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}i:7;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:34:\"wcpay-apple-pay-grow-your-business\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:8;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:34:\"wcpay-apple-pay-grow-your-business\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}}}s:38:\"wc-square-apple-pay-grow-your-business\";O:8:\"stdClass\":8:{s:4:\"slug\";s:38:\"wc-square-apple-pay-grow-your-business\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:45:\"Grow your business with Square and Apple Pay \";s:7:\"content\";s:178:\"Now more than ever, shoppers want a fast, simple, and secure online checkout experience. Increase conversion rates by letting your customers know that you now accept Apple Pay®.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:34:\"grow-your-business-marketing-guide\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:19:\"See marketing guide\";}}s:3:\"url\";s:104:\"https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=square-grow-your-business\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:9:{i:0;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:11:\"woocommerce\";s:8:\"operator\";s:2:\">=\";s:7:\"version\";s:3:\"4.8\";}i:1;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:18:\"woocommerce-square\";s:8:\"operator\";s:2:\">=\";s:7:\"version\";s:3:\"2.3\";}i:2;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:27:\"wc_square_apple_pay_enabled\";s:5:\"value\";i:2;s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:3;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:31:\"wc-square-apple-pay-boost-sales\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:4;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:31:\"wc-square-apple-pay-boost-sales\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}i:5;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:27:\"wcpay-apple-pay-boost-sales\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:6;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:27:\"wcpay-apple-pay-boost-sales\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}i:7;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:34:\"wcpay-apple-pay-grow-your-business\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:8;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:34:\"wcpay-apple-pay-grow-your-business\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}}}s:32:\"wcpay-apple-pay-is-now-available\";O:8:\"stdClass\":8:{s:4:\"slug\";s:32:\"wcpay-apple-pay-is-now-available\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:53:\"Apple Pay is now available with WooCommerce Payments!\";s:7:\"content\";s:397:\"Increase your conversion rate by offering a fast and secure checkout with <a href=\"https://woocommerce.com/apple-pay/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_applepay\" target=\"_blank\">Apple Pay</a>®. It’s free to get started with <a href=\"https://woocommerce.com/payments/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_applepay\" target=\"_blank\">WooCommerce Payments</a>.\";}}s:7:\"actions\";a:2:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:13:\"add-apple-pay\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:13:\"Add Apple Pay\";}}s:3:\"url\";s:69:\"/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}i:1;O:8:\"stdClass\":6:{s:4:\"name\";s:10:\"learn-more\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:10:\"Learn more\";}}s:3:\"url\";s:121:\"https://docs.woocommerce.com/document/payments/apple-pay/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_applepay\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:3:{i:0;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:11:\"woocommerce\";s:8:\"operator\";s:2:\">=\";s:7:\"version\";s:3:\"4.8\";}i:1;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:20:\"woocommerce-payments\";s:8:\"operator\";s:2:\">=\";s:7:\"version\";s:5:\"2.3.0\";}i:2;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:26:\"wcpay_is_apple_pay_enabled\";s:5:\"value\";b:0;s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}}}s:27:\"wcpay-apple-pay-boost-sales\";O:8:\"stdClass\":8:{s:4:\"slug\";s:27:\"wcpay-apple-pay-boost-sales\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:26:\"Boost sales with Apple Pay\";s:7:\"content\";s:205:\"Now that you accept Apple Pay® with WooCommerce Payments you can increase conversion rates by letting your customers know that Apple Pay® is available. Here’s a marketing guide to help you get started.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:27:\"boost-sales-marketing-guide\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:19:\"See marketing guide\";}}s:3:\"url\";s:96:\"https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=wcpay-boost-sales\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:4:{i:0;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:11:\"woocommerce\";s:8:\"operator\";s:2:\">=\";s:7:\"version\";s:3:\"4.8\";}i:1;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:26:\"wcpay_is_apple_pay_enabled\";s:5:\"value\";i:1;s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:2;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:34:\"wcpay-apple-pay-grow-your-business\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:3;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:34:\"wcpay-apple-pay-grow-your-business\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}}}s:34:\"wcpay-apple-pay-grow-your-business\";O:8:\"stdClass\":8:{s:4:\"slug\";s:34:\"wcpay-apple-pay-grow-your-business\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:58:\"Grow your business with WooCommerce Payments and Apple Pay\";s:7:\"content\";s:178:\"Now more than ever, shoppers want a fast, simple, and secure online checkout experience. Increase conversion rates by letting your customers know that you now accept Apple Pay®.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:34:\"grow-your-business-marketing-guide\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:19:\"See marketing guide\";}}s:3:\"url\";s:103:\"https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=wcpay-grow-your-business\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:4:{i:0;O:8:\"stdClass\":4:{s:4:\"type\";s:14:\"plugin_version\";s:6:\"plugin\";s:11:\"woocommerce\";s:8:\"operator\";s:2:\">=\";s:7:\"version\";s:3:\"4.8\";}i:1;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:26:\"wcpay_is_apple_pay_enabled\";s:5:\"value\";i:2;s:7:\"default\";b:0;s:9:\"operation\";s:1:\"=\";}i:2;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:27:\"wcpay-apple-pay-boost-sales\";s:6:\"status\";s:8:\"actioned\";s:9:\"operation\";s:2:\"!=\";}i:3;O:8:\"stdClass\":4:{s:4:\"type\";s:11:\"note_status\";s:9:\"note_name\";s:27:\"wcpay-apple-pay-boost-sales\";s:6:\"status\";s:10:\"unactioned\";s:9:\"operation\";s:2:\"!=\";}}}s:37:\"wc-admin-optimizing-the-checkout-flow\";O:8:\"stdClass\":8:{s:4:\"slug\";s:37:\"wc-admin-optimizing-the-checkout-flow\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:28:\"Optimizing the checkout flow\";s:7:\"content\";s:171:\"It\'s crucial to get your store\'s checkout as smooth as possible to avoid losing sales. Let\'s take a look at how you can optimize the checkout experience for your shoppers.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:28:\"optimizing-the-checkout-flow\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:10:\"Learn more\";}}s:3:\"url\";s:78:\"https://woocommerce.com/posts/optimizing-woocommerce-checkout?utm_source=inbox\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:2:{i:0;O:8:\"stdClass\":3:{s:4:\"type\";s:18:\"wcadmin_active_for\";s:9:\"operation\";s:1:\">\";s:4:\"days\";i:3;}i:1;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:45:\"woocommerce_task_list_tracked_completed_tasks\";s:9:\"operation\";s:8:\"contains\";s:5:\"value\";s:8:\"payments\";s:7:\"default\";a:0:{}}}}s:39:\"wc-admin-first-five-things-to-customize\";O:8:\"stdClass\":8:{s:4:\"slug\";s:39:\"wc-admin-first-five-things-to-customize\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:45:\"The first 5 things to customize in your store\";s:7:\"content\";s:173:\"Deciding what to start with first is tricky. To help you properly prioritize, we\'ve put together this short list of the first few things you should customize in WooCommerce.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:10:\"learn-more\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:10:\"Learn more\";}}s:3:\"url\";s:82:\"https://woocommerce.com/posts/first-things-customize-woocommerce/?utm_source=inbox\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:10:\"unactioned\";}}s:5:\"rules\";a:2:{i:0;O:8:\"stdClass\":3:{s:4:\"type\";s:18:\"wcadmin_active_for\";s:9:\"operation\";s:1:\">\";s:4:\"days\";i:2;}i:1;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:45:\"woocommerce_task_list_tracked_completed_tasks\";s:5:\"value\";s:9:\"NOT EMPTY\";s:7:\"default\";s:9:\"NOT EMPTY\";s:9:\"operation\";s:2:\"!=\";}}}s:32:\"wc-payments-qualitative-feedback\";O:8:\"stdClass\":8:{s:4:\"slug\";s:32:\"wc-payments-qualitative-feedback\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:55:\"WooCommerce Payments setup - let us know what you think\";s:7:\"content\";s:146:\"Congrats on enabling WooCommerce Payments for your store. Please share your feedback in this 2 minute survey to help us improve the setup process.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:35:\"qualitative-feedback-from-new-users\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:14:\"Share feedback\";}}s:3:\"url\";s:39:\"https://automattic.survey.fm/wc-pay-new\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:1:{i:0;O:8:\"stdClass\":5:{s:4:\"type\";s:6:\"option\";s:11:\"option_name\";s:45:\"woocommerce_task_list_tracked_completed_tasks\";s:9:\"operation\";s:8:\"contains\";s:5:\"value\";s:20:\"woocommerce-payments\";s:7:\"default\";a:0:{}}}}s:29:\"share-your-feedback-on-paypal\";O:8:\"stdClass\":8:{s:4:\"slug\";s:29:\"share-your-feedback-on-paypal\";s:4:\"type\";s:4:\"info\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:29:\"Share your feedback on PayPal\";s:7:\"content\";s:127:\"Share your feedback in this 2 minute survey about how we can make the process of accepting payments more useful for your store.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:14:\"share-feedback\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:14:\"Share feedback\";}}s:3:\"url\";s:43:\"http://automattic.survey.fm/paypal-feedback\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:10:\"unactioned\";}}s:5:\"rules\";a:2:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:3:\"not\";s:7:\"operand\";a:1:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:26:\"woocommerce-gateway-stripe\";}}}}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:43:\"woocommerce-gateway-paypal-express-checkout\";}}}}s:31:\"wcpay_instant_deposits_gtm_2021\";O:8:\"stdClass\":8:{s:4:\"slug\";s:31:\"wcpay_instant_deposits_gtm_2021\";s:4:\"type\";s:9:\"marketing\";s:6:\"status\";s:10:\"unactioned\";s:12:\"is_snoozable\";i:0;s:6:\"source\";s:15:\"woocommerce.com\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":3:{s:6:\"locale\";s:5:\"en_US\";s:5:\"title\";s:69:\"Get paid within minutes – Instant Deposits for WooCommerce Payments\";s:7:\"content\";s:384:\"Stay flexible with immediate access to your funds when you need them – including nights, weekends, and holidays. With <a href=\"https://woocommerce.com/products/woocommerce-payments/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_instant_deposits\">WooCommerce Payments\'</a> new Instant Deposits feature, you’re able to transfer your earnings to a debit card within minutes.\";}}s:7:\"actions\";a:1:{i:0;O:8:\"stdClass\":6:{s:4:\"name\";s:10:\"learn-more\";s:7:\"locales\";a:1:{i:0;O:8:\"stdClass\":2:{s:6:\"locale\";s:5:\"en_US\";s:5:\"label\";s:40:\"Learn about Instant Deposits eligibility\";}}s:3:\"url\";s:136:\"https://docs.woocommerce.com/document/payments/instant-deposits/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_instant_deposits\";s:18:\"url_is_admin_query\";b:0;s:10:\"is_primary\";b:1;s:6:\"status\";s:8:\"actioned\";}}s:5:\"rules\";a:4:{i:0;O:8:\"stdClass\":2:{s:4:\"type\";s:18:\"publish_after_time\";s:13:\"publish_after\";s:19:\"2021-05-18 00:00:00\";}i:1;O:8:\"stdClass\":2:{s:4:\"type\";s:19:\"publish_before_time\";s:14:\"publish_before\";s:19:\"2021-06-01 00:00:00\";}i:2;O:8:\"stdClass\":3:{s:4:\"type\";s:21:\"base_location_country\";s:5:\"value\";s:2:\"US\";s:9:\"operation\";s:1:\"=\";}i:3;O:8:\"stdClass\":2:{s:4:\"type\";s:17:\"plugins_activated\";s:7:\"plugins\";a:1:{i:0;s:20:\"woocommerce-payments\";}}}}}', 'yes'),
(670, '_transient_wc_count_comments', 'O:8:\"stdClass\":7:{s:14:\"total_comments\";i:5;s:3:\"all\";i:5;s:8:\"approved\";s:1:\"5\";s:9:\"moderated\";i:0;s:4:\"spam\";i:0;s:5:\"trash\";i:0;s:12:\"post-trashed\";i:0;}', 'yes'),
(671, 'wc_blocks_db_schema_version', '260', 'yes'),
(672, 'wc_remote_inbox_notifications_stored_state', 'O:8:\"stdClass\":3:{s:22:\"there_were_no_products\";b:1;s:22:\"there_are_now_products\";b:1;s:17:\"new_product_count\";i:0;}', 'yes'),
(673, 'woocommerce_meta_box_errors', 'a:0:{}', 'yes'),
(677, '_transient_woocommerce_reports-transient-version', '1621269783', 'yes'),
(678, '_transient_timeout_orders-all-statuses', '1621874584', 'no'),
(679, '_transient_orders-all-statuses', 'a:2:{s:7:\"version\";s:10:\"1621269783\";s:5:\"value\";a:0:{}}', 'no'),
(685, 'action_scheduler_migration_status', 'complete', 'yes'),
(688, 'woocommerce_onboarding_profile', 'a:8:{s:12:\"setup_client\";b:1;s:8:\"industry\";a:1:{i:0;a:1:{s:4:\"slug\";s:21:\"home-furniture-garden\";}}s:13:\"product_types\";a:1:{i:0;s:8:\"physical\";}s:13:\"product_count\";s:8:\"101-1000\";s:14:\"selling_venues\";s:2:\"no\";s:19:\"business_extensions\";a:0:{}s:5:\"theme\";s:8:\"thebrown\";s:9:\"completed\";b:1;}', 'yes'),
(691, '_transient_timeout_wc_report_orders_stats_d7ed7bb8689c3acb329c0c7546e2ed51', '1621870739', 'no'),
(692, '_transient_wc_report_orders_stats_d7ed7bb8689c3acb329c0c7546e2ed51', 'a:2:{s:7:\"version\";s:10:\"1621265819\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":15:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:1:{i:0;a:6:{s:8:\"interval\";s:7:\"2021-20\";s:10:\"date_start\";s:19:\"2021-05-17 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2021-05-17 00:00:00\";s:8:\"date_end\";s:19:\"2021-05-17 21:08:00\";s:12:\"date_end_gmt\";s:19:\"2021-05-17 21:08:00\";s:9:\"subtotals\";O:8:\"stdClass\":14:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:1;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(693, '_transient_timeout_wc_report_orders_stats_56920740aca807f5b762015147b6089a', '1621870739', 'no'),
(694, '_transient_wc_report_orders_stats_56920740aca807f5b762015147b6089a', 'a:2:{s:7:\"version\";s:10:\"1621265819\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":15:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:1:{i:0;a:6:{s:8:\"interval\";s:7:\"2021-20\";s:10:\"date_start\";s:19:\"2021-05-17 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2021-05-17 00:00:00\";s:8:\"date_end\";s:19:\"2021-05-17 21:08:00\";s:12:\"date_end_gmt\";s:19:\"2021-05-17 21:08:00\";s:9:\"subtotals\";O:8:\"stdClass\":14:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:1;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(695, 'woocommerce_task_list_tracked_completed_tasks', 'a:2:{i:0;s:13:\"store_details\";i:1;s:8:\"products\";}', 'yes'),
(696, '_transient_timeout_wc_report_orders_stats_8744d2eb2912b1cbb3aafeb57284fd43', '1621874592', 'no'),
(697, '_transient_wc_report_orders_stats_8744d2eb2912b1cbb3aafeb57284fd43', 'a:2:{s:7:\"version\";s:10:\"1621269783\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":15:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:1:{i:0;a:6:{s:8:\"interval\";s:7:\"2021-19\";s:10:\"date_start\";s:19:\"2021-05-16 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2021-05-16 00:00:00\";s:8:\"date_end\";s:19:\"2021-05-16 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2021-05-16 23:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":14:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:1;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(698, '_transient_timeout_wc_report_orders_stats_4854697fde1f49f271fa8da4085f46c0', '1621874592', 'no'),
(699, '_transient_wc_report_orders_stats_4854697fde1f49f271fa8da4085f46c0', 'a:2:{s:7:\"version\";s:10:\"1621269783\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":15:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:1:{i:0;a:6:{s:8:\"interval\";s:7:\"2021-19\";s:10:\"date_start\";s:19:\"2021-05-16 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2021-05-16 00:00:00\";s:8:\"date_end\";s:19:\"2021-05-16 23:59:59\";s:12:\"date_end_gmt\";s:19:\"2021-05-16 23:59:59\";s:9:\"subtotals\";O:8:\"stdClass\":14:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:1;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(700, 'woocommerce_task_list_welcome_modal_dismissed', 'yes', 'yes'),
(701, '_transient_timeout_wc_report_orders_stats_d7189225ccb0ee94eed733d7763282dc', '1621870746', 'no'),
(702, '_transient_wc_report_orders_stats_d7189225ccb0ee94eed733d7763282dc', 'a:2:{s:7:\"version\";s:10:\"1621265819\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":15:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:1:{i:0;a:6:{s:8:\"interval\";s:7:\"2021-20\";s:10:\"date_start\";s:19:\"2021-05-17 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2021-05-17 00:00:00\";s:8:\"date_end\";s:19:\"2021-05-17 21:09:00\";s:12:\"date_end_gmt\";s:19:\"2021-05-17 21:09:00\";s:9:\"subtotals\";O:8:\"stdClass\":14:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:1;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(703, '_transient_timeout_wc_report_orders_stats_15f24c5119958540b01e548f68001bb7', '1621870746', 'no'),
(704, '_transient_wc_report_orders_stats_15f24c5119958540b01e548f68001bb7', 'a:2:{s:7:\"version\";s:10:\"1621265819\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":15:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:1:{i:0;a:6:{s:8:\"interval\";s:7:\"2021-20\";s:10:\"date_start\";s:19:\"2021-05-17 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2021-05-17 00:00:00\";s:8:\"date_end\";s:19:\"2021-05-17 21:09:00\";s:12:\"date_end_gmt\";s:19:\"2021-05-17 21:09:00\";s:9:\"subtotals\";O:8:\"stdClass\":14:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:1;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no');
INSERT INTO `tbc_options` (`option_id`, `option_name`, `option_value`, `autoload`) VALUES
(705, 'woocommerce_marketplace_suggestions', 'a:2:{s:11:\"suggestions\";a:27:{i:0;a:4:{s:4:\"slug\";s:28:\"product-edit-meta-tab-header\";s:7:\"context\";s:28:\"product-edit-meta-tab-header\";s:5:\"title\";s:22:\"Recommended extensions\";s:13:\"allow-dismiss\";b:0;}i:1;a:6:{s:4:\"slug\";s:39:\"product-edit-meta-tab-footer-browse-all\";s:7:\"context\";s:28:\"product-edit-meta-tab-footer\";s:9:\"link-text\";s:21:\"Browse all extensions\";s:3:\"url\";s:64:\"https://woocommerce.com/product-category/woocommerce-extensions/\";s:8:\"promoted\";s:31:\"category-woocommerce-extensions\";s:13:\"allow-dismiss\";b:0;}i:2;a:9:{s:4:\"slug\";s:46:\"product-edit-mailchimp-woocommerce-memberships\";s:7:\"product\";s:33:\"woocommerce-memberships-mailchimp\";s:14:\"show-if-active\";a:1:{i:0;s:23:\"woocommerce-memberships\";}s:7:\"context\";a:1:{i:0;s:26:\"product-edit-meta-tab-body\";}s:4:\"icon\";s:116:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/mailchimp-for-memberships.svg\";s:5:\"title\";s:25:\"Mailchimp for Memberships\";s:4:\"copy\";s:79:\"Completely automate your email lists by syncing membership changes to Mailchimp\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:67:\"https://woocommerce.com/products/mailchimp-woocommerce-memberships/\";}i:3;a:9:{s:4:\"slug\";s:19:\"product-edit-addons\";s:7:\"product\";s:26:\"woocommerce-product-addons\";s:14:\"show-if-active\";a:2:{i:0;s:25:\"woocommerce-subscriptions\";i:1;s:20:\"woocommerce-bookings\";}s:7:\"context\";a:1:{i:0;s:26:\"product-edit-meta-tab-body\";}s:4:\"icon\";s:106:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/product-add-ons.svg\";s:5:\"title\";s:15:\"Product Add-Ons\";s:4:\"copy\";s:93:\"Offer add-ons like gift wrapping, special messages or other special options for your products\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:49:\"https://woocommerce.com/products/product-add-ons/\";}i:4;a:9:{s:4:\"slug\";s:46:\"product-edit-woocommerce-subscriptions-gifting\";s:7:\"product\";s:33:\"woocommerce-subscriptions-gifting\";s:14:\"show-if-active\";a:1:{i:0;s:25:\"woocommerce-subscriptions\";}s:7:\"context\";a:1:{i:0;s:26:\"product-edit-meta-tab-body\";}s:4:\"icon\";s:116:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/gifting-for-subscriptions.svg\";s:5:\"title\";s:25:\"Gifting for Subscriptions\";s:4:\"copy\";s:70:\"Let customers buy subscriptions for others - they\'re the ultimate gift\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:67:\"https://woocommerce.com/products/woocommerce-subscriptions-gifting/\";}i:5;a:9:{s:4:\"slug\";s:42:\"product-edit-teams-woocommerce-memberships\";s:7:\"product\";s:33:\"woocommerce-memberships-for-teams\";s:14:\"show-if-active\";a:1:{i:0;s:23:\"woocommerce-memberships\";}s:7:\"context\";a:1:{i:0;s:26:\"product-edit-meta-tab-body\";}s:4:\"icon\";s:112:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/teams-for-memberships.svg\";s:5:\"title\";s:21:\"Teams for Memberships\";s:4:\"copy\";s:123:\"Adds B2B functionality to WooCommerce Memberships, allowing sites to sell team, group, corporate, or family member accounts\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:63:\"https://woocommerce.com/products/teams-woocommerce-memberships/\";}i:6;a:8:{s:4:\"slug\";s:29:\"product-edit-variation-images\";s:7:\"product\";s:39:\"woocommerce-additional-variation-images\";s:7:\"context\";a:1:{i:0;s:26:\"product-edit-meta-tab-body\";}s:4:\"icon\";s:118:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/additional-variation-images.svg\";s:5:\"title\";s:27:\"Additional Variation Images\";s:4:\"copy\";s:72:\"Showcase your products in the best light with a image for each variation\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:73:\"https://woocommerce.com/products/woocommerce-additional-variation-images/\";}i:7;a:9:{s:4:\"slug\";s:47:\"product-edit-woocommerce-subscription-downloads\";s:7:\"product\";s:34:\"woocommerce-subscription-downloads\";s:14:\"show-if-active\";a:1:{i:0;s:25:\"woocommerce-subscriptions\";}s:7:\"context\";a:1:{i:0;s:26:\"product-edit-meta-tab-body\";}s:4:\"icon\";s:113:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/subscription-downloads.svg\";s:5:\"title\";s:22:\"Subscription Downloads\";s:4:\"copy\";s:57:\"Give customers special downloads with their subscriptions\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:68:\"https://woocommerce.com/products/woocommerce-subscription-downloads/\";}i:8;a:8:{s:4:\"slug\";s:31:\"product-edit-min-max-quantities\";s:7:\"product\";s:30:\"woocommerce-min-max-quantities\";s:7:\"context\";a:1:{i:0;s:26:\"product-edit-meta-tab-body\";}s:4:\"icon\";s:109:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/min-max-quantities.svg\";s:5:\"title\";s:18:\"Min/Max Quantities\";s:4:\"copy\";s:81:\"Specify minimum and maximum allowed product quantities for orders to be completed\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:52:\"https://woocommerce.com/products/min-max-quantities/\";}i:9;a:8:{s:4:\"slug\";s:28:\"product-edit-name-your-price\";s:7:\"product\";s:27:\"woocommerce-name-your-price\";s:7:\"context\";a:1:{i:0;s:26:\"product-edit-meta-tab-body\";}s:4:\"icon\";s:106:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/name-your-price.svg\";s:5:\"title\";s:15:\"Name Your Price\";s:4:\"copy\";s:70:\"Let customers pay what they want - useful for donations, tips and more\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:49:\"https://woocommerce.com/products/name-your-price/\";}i:10;a:8:{s:4:\"slug\";s:42:\"product-edit-woocommerce-one-page-checkout\";s:7:\"product\";s:29:\"woocommerce-one-page-checkout\";s:7:\"context\";a:1:{i:0;s:26:\"product-edit-meta-tab-body\";}s:4:\"icon\";s:108:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/one-page-checkout.svg\";s:5:\"title\";s:17:\"One Page Checkout\";s:4:\"copy\";s:92:\"Don\'t make customers click around - let them choose products, checkout & pay all on one page\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:63:\"https://woocommerce.com/products/woocommerce-one-page-checkout/\";}i:11;a:4:{s:4:\"slug\";s:19:\"orders-empty-header\";s:7:\"context\";s:24:\"orders-list-empty-header\";s:5:\"title\";s:20:\"Tools for your store\";s:13:\"allow-dismiss\";b:0;}i:12;a:6:{s:4:\"slug\";s:30:\"orders-empty-footer-browse-all\";s:7:\"context\";s:24:\"orders-list-empty-footer\";s:9:\"link-text\";s:21:\"Browse all extensions\";s:3:\"url\";s:64:\"https://woocommerce.com/product-category/woocommerce-extensions/\";s:8:\"promoted\";s:31:\"category-woocommerce-extensions\";s:13:\"allow-dismiss\";b:0;}i:13;a:8:{s:4:\"slug\";s:19:\"orders-empty-wc-pay\";s:7:\"context\";s:22:\"orders-list-empty-body\";s:7:\"product\";s:20:\"woocommerce-payments\";s:4:\"icon\";s:111:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/woocommerce-payments.svg\";s:5:\"title\";s:20:\"WooCommerce Payments\";s:4:\"copy\";s:125:\"Securely accept payments and manage transactions directly from your WooCommerce dashboard – no setup costs or monthly fees.\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:54:\"https://woocommerce.com/products/woocommerce-payments/\";}i:14;a:8:{s:4:\"slug\";s:19:\"orders-empty-zapier\";s:7:\"context\";s:22:\"orders-list-empty-body\";s:7:\"product\";s:18:\"woocommerce-zapier\";s:4:\"icon\";s:97:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/zapier.svg\";s:5:\"title\";s:6:\"Zapier\";s:4:\"copy\";s:88:\"Save time and increase productivity by connecting your store to more than 1000+ services\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:52:\"https://woocommerce.com/products/woocommerce-zapier/\";}i:15;a:8:{s:4:\"slug\";s:30:\"orders-empty-shipment-tracking\";s:7:\"context\";s:22:\"orders-list-empty-body\";s:7:\"product\";s:29:\"woocommerce-shipment-tracking\";s:4:\"icon\";s:108:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/shipment-tracking.svg\";s:5:\"title\";s:17:\"Shipment Tracking\";s:4:\"copy\";s:86:\"Let customers know when their orders will arrive by adding shipment tracking to emails\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:51:\"https://woocommerce.com/products/shipment-tracking/\";}i:16;a:8:{s:4:\"slug\";s:32:\"orders-empty-table-rate-shipping\";s:7:\"context\";s:22:\"orders-list-empty-body\";s:7:\"product\";s:31:\"woocommerce-table-rate-shipping\";s:4:\"icon\";s:110:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/table-rate-shipping.svg\";s:5:\"title\";s:19:\"Table Rate Shipping\";s:4:\"copy\";s:122:\"Advanced, flexible shipping. Define multiple shipping rates based on location, price, weight, shipping class or item count\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:53:\"https://woocommerce.com/products/table-rate-shipping/\";}i:17;a:8:{s:4:\"slug\";s:40:\"orders-empty-shipping-carrier-extensions\";s:7:\"context\";s:22:\"orders-list-empty-body\";s:4:\"icon\";s:118:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/shipping-carrier-extensions.svg\";s:5:\"title\";s:27:\"Shipping Carrier Extensions\";s:4:\"copy\";s:116:\"Show live rates from FedEx, UPS, USPS and more directly on your store - never under or overcharge for shipping again\";s:11:\"button-text\";s:13:\"Find Carriers\";s:8:\"promoted\";s:26:\"category-shipping-carriers\";s:3:\"url\";s:99:\"https://woocommerce.com/product-category/woocommerce-extensions/shipping-methods/shipping-carriers/\";}i:18;a:8:{s:4:\"slug\";s:32:\"orders-empty-google-product-feed\";s:7:\"context\";s:22:\"orders-list-empty-body\";s:7:\"product\";s:25:\"woocommerce-product-feeds\";s:4:\"icon\";s:110:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/google-product-feed.svg\";s:5:\"title\";s:19:\"Google Product Feed\";s:4:\"copy\";s:76:\"Increase sales by letting customers find you when they\'re shopping on Google\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:53:\"https://woocommerce.com/products/google-product-feed/\";}i:19;a:4:{s:4:\"slug\";s:35:\"products-empty-header-product-types\";s:7:\"context\";s:26:\"products-list-empty-header\";s:5:\"title\";s:23:\"Other types of products\";s:13:\"allow-dismiss\";b:0;}i:20;a:6:{s:4:\"slug\";s:32:\"products-empty-footer-browse-all\";s:7:\"context\";s:26:\"products-list-empty-footer\";s:9:\"link-text\";s:21:\"Browse all extensions\";s:3:\"url\";s:64:\"https://woocommerce.com/product-category/woocommerce-extensions/\";s:8:\"promoted\";s:31:\"category-woocommerce-extensions\";s:13:\"allow-dismiss\";b:0;}i:21;a:8:{s:4:\"slug\";s:30:\"products-empty-product-vendors\";s:7:\"context\";s:24:\"products-list-empty-body\";s:7:\"product\";s:27:\"woocommerce-product-vendors\";s:4:\"icon\";s:106:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/product-vendors.svg\";s:5:\"title\";s:15:\"Product Vendors\";s:4:\"copy\";s:47:\"Turn your store into a multi-vendor marketplace\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:49:\"https://woocommerce.com/products/product-vendors/\";}i:22;a:8:{s:4:\"slug\";s:26:\"products-empty-memberships\";s:7:\"context\";s:24:\"products-list-empty-body\";s:7:\"product\";s:23:\"woocommerce-memberships\";s:4:\"icon\";s:102:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/memberships.svg\";s:5:\"title\";s:11:\"Memberships\";s:4:\"copy\";s:76:\"Give members access to restricted content or products, for a fee or for free\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:57:\"https://woocommerce.com/products/woocommerce-memberships/\";}i:23;a:9:{s:4:\"slug\";s:35:\"products-empty-woocommerce-deposits\";s:7:\"context\";s:24:\"products-list-empty-body\";s:7:\"product\";s:20:\"woocommerce-deposits\";s:14:\"show-if-active\";a:1:{i:0;s:20:\"woocommerce-bookings\";}s:4:\"icon\";s:99:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/deposits.svg\";s:5:\"title\";s:8:\"Deposits\";s:4:\"copy\";s:75:\"Make it easier for customers to pay by offering a deposit or a payment plan\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:54:\"https://woocommerce.com/products/woocommerce-deposits/\";}i:24;a:8:{s:4:\"slug\";s:40:\"products-empty-woocommerce-subscriptions\";s:7:\"context\";s:24:\"products-list-empty-body\";s:7:\"product\";s:25:\"woocommerce-subscriptions\";s:4:\"icon\";s:104:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/subscriptions.svg\";s:5:\"title\";s:13:\"Subscriptions\";s:4:\"copy\";s:97:\"Let customers subscribe to your products or services and pay on a weekly, monthly or annual basis\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:59:\"https://woocommerce.com/products/woocommerce-subscriptions/\";}i:25;a:8:{s:4:\"slug\";s:35:\"products-empty-woocommerce-bookings\";s:7:\"context\";s:24:\"products-list-empty-body\";s:7:\"product\";s:20:\"woocommerce-bookings\";s:4:\"icon\";s:99:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/bookings.svg\";s:5:\"title\";s:8:\"Bookings\";s:4:\"copy\";s:99:\"Allow customers to book appointments, make reservations or rent equipment without leaving your site\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:54:\"https://woocommerce.com/products/woocommerce-bookings/\";}i:26;a:8:{s:4:\"slug\";s:30:\"products-empty-product-bundles\";s:7:\"context\";s:24:\"products-list-empty-body\";s:7:\"product\";s:27:\"woocommerce-product-bundles\";s:4:\"icon\";s:106:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketplace-suggestions/icons/product-bundles.svg\";s:5:\"title\";s:15:\"Product Bundles\";s:4:\"copy\";s:49:\"Offer customizable bundles and assembled products\";s:11:\"button-text\";s:10:\"Learn More\";s:3:\"url\";s:49:\"https://woocommerce.com/products/product-bundles/\";}}s:7:\"updated\";i:1621265971;}', 'no'),
(708, 'product_cat_children', 'a:1:{i:21;a:1:{i:0;i:22;}}', 'yes'),
(709, '_transient_wc_attribute_taxonomies', 'a:1:{i:0;O:8:\"stdClass\":6:{s:12:\"attribute_id\";s:1:\"1\";s:14:\"attribute_name\";s:5:\"color\";s:15:\"attribute_label\";s:5:\"Color\";s:14:\"attribute_type\";s:6:\"select\";s:17:\"attribute_orderby\";s:10:\"menu_order\";s:16:\"attribute_public\";s:1:\"0\";}}', 'yes'),
(714, '_transient_timeout_wc_report_orders_stats_3881b03310379bda7c73cd83d6816c93', '1621874392', 'no'),
(715, '_transient_wc_report_orders_stats_3881b03310379bda7c73cd83d6816c93', 'a:2:{s:7:\"version\";s:10:\"1621265819\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":15:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:1:{i:0;a:6:{s:8:\"interval\";s:7:\"2021-20\";s:10:\"date_start\";s:19:\"2021-05-17 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2021-05-17 00:00:00\";s:8:\"date_end\";s:19:\"2021-05-17 22:09:00\";s:12:\"date_end_gmt\";s:19:\"2021-05-17 22:09:00\";s:9:\"subtotals\";O:8:\"stdClass\":14:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:1;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(716, '_transient_timeout_wc_report_orders_stats_cc87458ad38bd48f6c7d8e9cc49630bb', '1621874392', 'no'),
(717, '_transient_wc_report_orders_stats_cc87458ad38bd48f6c7d8e9cc49630bb', 'a:2:{s:7:\"version\";s:10:\"1621265819\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":15:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:1:{i:0;a:6:{s:8:\"interval\";s:7:\"2021-20\";s:10:\"date_start\";s:19:\"2021-05-17 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2021-05-17 00:00:00\";s:8:\"date_end\";s:19:\"2021-05-17 22:09:00\";s:12:\"date_end_gmt\";s:19:\"2021-05-17 22:09:00\";s:9:\"subtotals\";O:8:\"stdClass\":14:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:1;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(718, '_transient_timeout_wc_report_customers_stats_5ff75cebf84d86c9115c2c6a07ac292c', '1621874598', 'no'),
(719, '_transient_wc_report_customers_stats_5ff75cebf84d86c9115c2c6a07ac292c', 'a:2:{s:7:\"version\";s:10:\"1621269783\";s:5:\"value\";O:8:\"stdClass\":4:{s:15:\"customers_count\";i:0;s:16:\"avg_orders_count\";d:0;s:15:\"avg_total_spend\";d:0;s:19:\"avg_avg_order_value\";d:0;}}', 'no'),
(721, '_transient_timeout_wc_report_orders_stats_46858a8cf7e05899e47f5db636ded240', '1621874491', 'no'),
(722, '_transient_wc_report_orders_stats_46858a8cf7e05899e47f5db636ded240', 'a:2:{s:7:\"version\";s:10:\"1621265819\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":15:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:1:{i:0;a:6:{s:8:\"interval\";s:7:\"2021-20\";s:10:\"date_start\";s:19:\"2021-05-17 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2021-05-17 00:00:00\";s:8:\"date_end\";s:19:\"2021-05-17 22:11:00\";s:12:\"date_end_gmt\";s:19:\"2021-05-17 22:11:00\";s:9:\"subtotals\";O:8:\"stdClass\":14:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:1;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(723, '_transient_timeout_wc_report_orders_stats_efbb14de14c3dc498b6961fe682b7a0e', '1621874491', 'no'),
(724, '_transient_wc_report_orders_stats_efbb14de14c3dc498b6961fe682b7a0e', 'a:2:{s:7:\"version\";s:10:\"1621265819\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":15:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:1:{i:0;a:6:{s:8:\"interval\";s:7:\"2021-20\";s:10:\"date_start\";s:19:\"2021-05-17 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2021-05-17 00:00:00\";s:8:\"date_end\";s:19:\"2021-05-17 22:11:00\";s:12:\"date_end_gmt\";s:19:\"2021-05-17 22:11:00\";s:9:\"subtotals\";O:8:\"stdClass\":14:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:1;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(726, '_transient_product_query-transient-version', '1621269742', 'yes'),
(727, '_transient_product-transient-version', '1621269742', 'yes'),
(728, '_transient_timeout_wc_report_orders_stats_deb8ec09758e648564ab9a435097dc97', '1621874550', 'no'),
(729, '_transient_wc_report_orders_stats_deb8ec09758e648564ab9a435097dc97', 'a:2:{s:7:\"version\";s:10:\"1621265819\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":15:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:1:{i:0;a:6:{s:8:\"interval\";s:7:\"2021-20\";s:10:\"date_start\";s:19:\"2021-05-17 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2021-05-17 00:00:00\";s:8:\"date_end\";s:19:\"2021-05-17 22:12:00\";s:12:\"date_end_gmt\";s:19:\"2021-05-17 22:12:00\";s:9:\"subtotals\";O:8:\"stdClass\":14:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:1;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(730, '_transient_timeout_wc_report_orders_stats_7ddf91f9be92955151e9fc83302abc16', '1621874550', 'no'),
(731, '_transient_wc_report_orders_stats_7ddf91f9be92955151e9fc83302abc16', 'a:2:{s:7:\"version\";s:10:\"1621265819\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":15:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:1:{i:0;a:6:{s:8:\"interval\";s:7:\"2021-20\";s:10:\"date_start\";s:19:\"2021-05-17 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2021-05-17 00:00:00\";s:8:\"date_end\";s:19:\"2021-05-17 22:12:00\";s:12:\"date_end_gmt\";s:19:\"2021-05-17 22:12:00\";s:9:\"subtotals\";O:8:\"stdClass\":14:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:1;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(732, 'woocommerce_cod_settings', 'a:1:{s:7:\"enabled\";s:2:\"no\";}', 'yes'),
(737, '_transient_timeout_wc_report_orders_stats_ce6a480dc21b3b2caeae9af31d45083e', '1621874592', 'no'),
(738, '_transient_wc_report_orders_stats_ce6a480dc21b3b2caeae9af31d45083e', 'a:2:{s:7:\"version\";s:10:\"1621269783\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":15:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:1:{i:0;a:6:{s:8:\"interval\";s:7:\"2021-20\";s:10:\"date_start\";s:19:\"2021-05-17 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2021-05-17 00:00:00\";s:8:\"date_end\";s:19:\"2021-05-17 22:13:00\";s:12:\"date_end_gmt\";s:19:\"2021-05-17 22:13:00\";s:9:\"subtotals\";O:8:\"stdClass\":14:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:1;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(739, '_transient_timeout_wc_report_orders_stats_bd38b29c60273e40ec31176a37670002', '1621874592', 'no'),
(740, '_transient_wc_report_orders_stats_bd38b29c60273e40ec31176a37670002', 'a:2:{s:7:\"version\";s:10:\"1621269783\";s:5:\"value\";O:8:\"stdClass\":5:{s:6:\"totals\";O:8:\"stdClass\":15:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"products\";i:0;s:8:\"segments\";a:0:{}}s:9:\"intervals\";a:1:{i:0;a:6:{s:8:\"interval\";s:7:\"2021-20\";s:10:\"date_start\";s:19:\"2021-05-17 00:00:00\";s:14:\"date_start_gmt\";s:19:\"2021-05-17 00:00:00\";s:8:\"date_end\";s:19:\"2021-05-17 22:13:00\";s:12:\"date_end_gmt\";s:19:\"2021-05-17 22:13:00\";s:9:\"subtotals\";O:8:\"stdClass\":14:{s:12:\"orders_count\";i:0;s:14:\"num_items_sold\";i:0;s:11:\"gross_sales\";d:0;s:11:\"total_sales\";d:0;s:7:\"coupons\";d:0;s:13:\"coupons_count\";i:0;s:7:\"refunds\";d:0;s:5:\"taxes\";d:0;s:8:\"shipping\";d:0;s:11:\"net_revenue\";d:0;s:19:\"avg_items_per_order\";d:0;s:15:\"avg_order_value\";d:0;s:15:\"total_customers\";i:0;s:8:\"segments\";a:0:{}}}}s:5:\"total\";i:1;s:5:\"pages\";i:1;s:7:\"page_no\";i:1;}}', 'no'),
(741, '_transient_timeout_wc_marketing_recommended_plugins', '1621529002', 'no'),
(742, '_transient_wc_marketing_recommended_plugins', 'a:12:{i:0;a:7:{s:5:\"title\";s:11:\"AutomateWoo\";s:11:\"description\";s:86:\"Convert and retain customers with automated marketing that does the hard work for you.\";s:3:\"url\";s:110:\"https://woocommerce.com/products/automatewoo/?utm_source=marketingtab&utm_medium=product&utm_campaign=wcaddons\";s:4:\"icon\";s:101:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketing-tab-rest-api/icons/automatewoo.svg\";s:7:\"product\";s:11:\"automatewoo\";s:6:\"plugin\";s:27:\"automatewoo/automatewoo.php\";s:10:\"categories\";a:1:{i:0;s:9:\"marketing\";}}i:1;a:7:{s:5:\"title\";s:25:\"Mailchimp for WooCommerce\";s:11:\"description\";s:73:\"Send targeted campaigns, recover abandoned carts and more with Mailchimp.\";s:3:\"url\";s:124:\"https://woocommerce.com/products/mailchimp-for-woocommerce/?utm_source=marketingtab&utm_medium=product&utm_campaign=wcaddons\";s:4:\"icon\";s:99:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketing-tab-rest-api/icons/mailchimp.svg\";s:7:\"product\";s:25:\"mailchimp-for-woocommerce\";s:6:\"plugin\";s:51:\"mailchimp-for-woocommerce/mailchimp-woocommerce.php\";s:10:\"categories\";a:1:{i:0;s:9:\"marketing\";}}i:2;a:7:{s:5:\"title\";s:24:\"Facebook for WooCommerce\";s:11:\"description\";s:79:\"Grow your business by targeting the right people & driving sales with Facebook.\";s:3:\"url\";s:107:\"https://woocommerce.com/products/facebook/?utm_source=marketingtab&utm_medium=product&utm_campaign=wcaddons\";s:4:\"icon\";s:98:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketing-tab-rest-api/icons/facebook.svg\";s:7:\"product\";s:8:\"facebook\";s:6:\"plugin\";s:53:\"facebook-for-woocommerce/facebook-for-woocommerce.php\";s:10:\"categories\";a:1:{i:0;s:9:\"marketing\";}}i:3;a:7:{s:5:\"title\";s:32:\"Google Ads & Marketing by Kliken\";s:11:\"description\";s:121:\"Get in front of shoppers and drive traffic so you can grow your business with Smart Shopping Campaigns and free listings.\";s:3:\"url\";s:109:\"https://woocommerce.com/products/google-ads/?utm_source=marketingtab&utm_medium=product&utm_campaign=wcaddons\";s:4:\"icon\";s:100:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketing-tab-rest-api/icons/google-ads.svg\";s:7:\"product\";s:10:\"google-ads\";s:6:\"plugin\";s:59:\"kliken-marketing-for-google/kliken-marketing-for-google.php\";s:10:\"categories\";a:1:{i:0;s:9:\"marketing\";}}i:4;a:7:{s:5:\"title\";s:23:\"HubSpot for WooCommerce\";s:11:\"description\";s:76:\"Grow traffic, convert leads, close deals, and turn customers into promoters.\";s:3:\"url\";s:122:\"https://woocommerce.com/products/hubspot-for-woocommerce/?utm_source=marketingtab&utm_medium=product&utm_campaign=wcaddons\";s:4:\"icon\";s:97:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketing-tab-rest-api/icons/hubspot.svg\";s:7:\"product\";s:23:\"hubspot-for-woocommerce\";s:6:\"plugin\";s:51:\"hubspot-for-woocommerce/hubspot-for-woocommerce.php\";s:10:\"categories\";a:1:{i:0;s:9:\"marketing\";}}i:5;a:7:{s:5:\"title\";s:41:\"Amazon & eBay Integration for WooCommerce\";s:11:\"description\";s:75:\"List your entire WooCommerce product catalog on Amazon and eBay in minutes.\";s:3:\"url\";s:122:\"https://woocommerce.com/products/amazon-ebay-integration/?utm_source=marketingtab&utm_medium=product&utm_campaign=wcaddons\";s:4:\"icon\";s:101:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketing-tab-rest-api/icons/amazon-ebay.svg\";s:7:\"product\";s:23:\"amazon-ebay-integration\";s:6:\"plugin\";s:75:\"woocommerce-amazon-ebay-integration/woocommerce-amazon-ebay-integration.php\";s:10:\"categories\";a:1:{i:0;s:9:\"marketing\";}}i:6;a:7:{s:5:\"title\";s:20:\"Personalized Coupons\";s:11:\"description\";s:86:\"Generate dynamic personalized coupons for your customers that increase purchase rates.\";s:3:\"url\";s:110:\"https://woocommerce.com/products/automatewoo/?utm_source=marketingtab&utm_medium=product&utm_campaign=wcaddons\";s:4:\"icon\";s:122:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketing-tab-rest-api/icons/automatewoo-personalized-coupons.svg\";s:7:\"product\";s:11:\"automatewoo\";s:6:\"plugin\";s:27:\"automatewoo/automatewoo.php\";s:10:\"categories\";a:1:{i:0;s:7:\"coupons\";}}i:7;a:7:{s:5:\"title\";s:13:\"Smart Coupons\";s:11:\"description\";s:100:\"Powerful, \"all in one\" solution for gift certificates, store credits, discount coupons and vouchers.\";s:3:\"url\";s:112:\"https://woocommerce.com/products/smart-coupons/?utm_source=marketingtab&utm_medium=product&utm_campaign=wcaddons\";s:4:\"icon\";s:115:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketing-tab-rest-api/icons/woocommerce-smart-coupons.svg\";s:7:\"product\";s:25:\"woocommerce-smart-coupons\";s:6:\"plugin\";s:55:\"woocommerce-smart-coupons/woocommerce-smart-coupons.php\";s:10:\"categories\";a:1:{i:0;s:7:\"coupons\";}}i:8;a:7:{s:5:\"title\";s:11:\"URL Coupons\";s:11:\"description\";s:108:\"Create a unique URL that applies a discount and optionally adds one or more products to the customer\'s cart.\";s:3:\"url\";s:110:\"https://woocommerce.com/products/url-coupons/?utm_source=marketingtab&utm_medium=product&utm_campaign=wcaddons\";s:4:\"icon\";s:113:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketing-tab-rest-api/icons/woocommerce-url-coupons.svg\";s:7:\"product\";s:23:\"woocommerce-url-coupons\";s:6:\"plugin\";s:51:\"woocommerce-url-coupons/woocommerce-url-coupons.php\";s:10:\"categories\";a:1:{i:0;s:7:\"coupons\";}}i:9;a:7:{s:5:\"title\";s:24:\"WooCommerce Store Credit\";s:11:\"description\";s:77:\"Create \"store credit\" coupons for customers which are redeemable at checkout.\";s:3:\"url\";s:111:\"https://woocommerce.com/products/store-credit/?utm_source=marketingtab&utm_medium=product&utm_campaign=wcaddons\";s:4:\"icon\";s:114:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketing-tab-rest-api/icons/woocommerce-store-credit.svg\";s:7:\"product\";s:24:\"woocommerce-store-credit\";s:6:\"plugin\";s:53:\"woocommerce-store-credit/woocommerce-store-credit.php\";s:10:\"categories\";a:1:{i:0;s:7:\"coupons\";}}i:10;a:7:{s:5:\"title\";s:17:\"Free Gift Coupons\";s:11:\"description\";s:59:\"Give away a free item to any customer with the coupon code.\";s:3:\"url\";s:116:\"https://woocommerce.com/products/free-gift-coupons/?utm_source=marketingtab&utm_medium=product&utm_campaign=wcaddons\";s:4:\"icon\";s:119:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketing-tab-rest-api/icons/woocommerce-free-gift-coupons.svg\";s:7:\"product\";s:29:\"woocommerce-free-gift-coupons\";s:6:\"plugin\";s:63:\"woocommerce-free-gift-coupons/woocommerce-free-gift-coupons.php\";s:10:\"categories\";a:1:{i:0;s:7:\"coupons\";}}i:11;a:7:{s:5:\"title\";s:13:\"Group Coupons\";s:11:\"description\";s:137:\"Coupons for groups. Provides the option to have coupons that are restricted to group members or roles. Works with the free Groups plugin.\";s:3:\"url\";s:112:\"https://woocommerce.com/products/group-coupons/?utm_source=marketingtab&utm_medium=product&utm_campaign=wcaddons\";s:4:\"icon\";s:115:\"https://woocommerce.com/wp-content/plugins/wccom-plugins/marketing-tab-rest-api/icons/woocommerce-group-coupons.svg\";s:7:\"product\";s:25:\"woocommerce-group-coupons\";s:6:\"plugin\";s:55:\"woocommerce-group-coupons/woocommerce-group-coupons.php\";s:10:\"categories\";a:1:{i:0;s:7:\"coupons\";}}}', 'no'),
(764, '_transient_timeout__woocommerce_helper_subscriptions', '1621431826', 'no'),
(765, '_transient__woocommerce_helper_subscriptions', 'a:0:{}', 'no'),
(766, '_site_transient_timeout_theme_roots', '1621432726', 'no'),
(767, '_site_transient_theme_roots', 'a:4:{s:8:\"thebrown\";s:7:\"/themes\";s:14:\"twentynineteen\";s:7:\"/themes\";s:12:\"twentytwenty\";s:7:\"/themes\";s:15:\"twentytwentyone\";s:7:\"/themes\";}', 'no'),
(768, '_transient_timeout__woocommerce_helper_updates', '1621474126', 'no'),
(769, '_transient__woocommerce_helper_updates', 'a:4:{s:4:\"hash\";s:32:\"d751713988987e9331980363e24189ce\";s:7:\"updated\";i:1621430926;s:8:\"products\";a:0:{}s:6:\"errors\";a:1:{i:0;s:10:\"http-error\";}}', 'no'),
(770, '_site_transient_update_plugins', 'O:8:\"stdClass\":5:{s:12:\"last_checked\";i:1621430930;s:7:\"checked\";a:10:{s:30:\"advanced-custom-fields/acf.php\";s:6:\"5.8.12\";s:29:\"acf-repeater/acf-repeater.php\";s:5:\"2.1.0\";s:19:\"akismet/akismet.php\";s:5:\"4.1.9\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:5:\"5.4.1\";s:29:\"easy-wp-smtp/easy-wp-smtp.php\";s:5:\"1.4.6\";s:57:\"google-language-translator/google-language-translator.php\";s:5:\"6.0.8\";s:9:\"hello.php\";s:5:\"1.7.2\";s:75:\"recent-posts-widget-with-thumbnails/recent-posts-widget-with-thumbnails.php\";s:5:\"7.0.3\";s:27:\"woocommerce/woocommerce.php\";s:5:\"5.3.0\";s:31:\"wpdiscuz/class.WpdiscuzCore.php\";s:5:\"7.2.2\";}s:8:\"response\";a:1:{s:30:\"advanced-custom-fields/acf.php\";O:8:\"stdClass\":12:{s:2:\"id\";s:36:\"w.org/plugins/advanced-custom-fields\";s:4:\"slug\";s:22:\"advanced-custom-fields\";s:6:\"plugin\";s:30:\"advanced-custom-fields/acf.php\";s:11:\"new_version\";s:5:\"5.9.5\";s:3:\"url\";s:53:\"https://wordpress.org/plugins/advanced-custom-fields/\";s:7:\"package\";s:71:\"https://downloads.wordpress.org/plugin/advanced-custom-fields.5.9.5.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-256x256.png?rev=1082746\";s:2:\"1x\";s:75:\"https://ps.w.org/advanced-custom-fields/assets/icon-128x128.png?rev=1082746\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:78:\"https://ps.w.org/advanced-custom-fields/assets/banner-1544x500.jpg?rev=1729099\";s:2:\"1x\";s:77:\"https://ps.w.org/advanced-custom-fields/assets/banner-772x250.jpg?rev=1729102\";}s:11:\"banners_rtl\";a:0:{}s:6:\"tested\";s:5:\"5.7.2\";s:12:\"requires_php\";s:3:\"5.6\";s:13:\"compatibility\";O:8:\"stdClass\":0:{}}}s:12:\"translations\";a:0:{}s:9:\"no_update\";a:8:{s:19:\"akismet/akismet.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:21:\"w.org/plugins/akismet\";s:4:\"slug\";s:7:\"akismet\";s:6:\"plugin\";s:19:\"akismet/akismet.php\";s:11:\"new_version\";s:5:\"4.1.9\";s:3:\"url\";s:38:\"https://wordpress.org/plugins/akismet/\";s:7:\"package\";s:56:\"https://downloads.wordpress.org/plugin/akismet.4.1.9.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:59:\"https://ps.w.org/akismet/assets/icon-256x256.png?rev=969272\";s:2:\"1x\";s:59:\"https://ps.w.org/akismet/assets/icon-128x128.png?rev=969272\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:61:\"https://ps.w.org/akismet/assets/banner-772x250.jpg?rev=479904\";}s:11:\"banners_rtl\";a:0:{}}s:36:\"contact-form-7/wp-contact-form-7.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:28:\"w.org/plugins/contact-form-7\";s:4:\"slug\";s:14:\"contact-form-7\";s:6:\"plugin\";s:36:\"contact-form-7/wp-contact-form-7.php\";s:11:\"new_version\";s:5:\"5.4.1\";s:3:\"url\";s:45:\"https://wordpress.org/plugins/contact-form-7/\";s:7:\"package\";s:63:\"https://downloads.wordpress.org/plugin/contact-form-7.5.4.1.zip\";s:5:\"icons\";a:3:{s:2:\"2x\";s:67:\"https://ps.w.org/contact-form-7/assets/icon-256x256.png?rev=2279696\";s:2:\"1x\";s:59:\"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255\";s:3:\"svg\";s:59:\"https://ps.w.org/contact-form-7/assets/icon.svg?rev=2339255\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:69:\"https://ps.w.org/contact-form-7/assets/banner-1544x500.png?rev=860901\";s:2:\"1x\";s:68:\"https://ps.w.org/contact-form-7/assets/banner-772x250.png?rev=880427\";}s:11:\"banners_rtl\";a:0:{}}s:29:\"easy-wp-smtp/easy-wp-smtp.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:26:\"w.org/plugins/easy-wp-smtp\";s:4:\"slug\";s:12:\"easy-wp-smtp\";s:6:\"plugin\";s:29:\"easy-wp-smtp/easy-wp-smtp.php\";s:11:\"new_version\";s:5:\"1.4.6\";s:3:\"url\";s:43:\"https://wordpress.org/plugins/easy-wp-smtp/\";s:7:\"package\";s:55:\"https://downloads.wordpress.org/plugin/easy-wp-smtp.zip\";s:5:\"icons\";a:1:{s:2:\"1x\";s:65:\"https://ps.w.org/easy-wp-smtp/assets/icon-128x128.png?rev=1242044\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:67:\"https://ps.w.org/easy-wp-smtp/assets/banner-772x250.png?rev=1650323\";}s:11:\"banners_rtl\";a:0:{}}s:57:\"google-language-translator/google-language-translator.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:40:\"w.org/plugins/google-language-translator\";s:4:\"slug\";s:26:\"google-language-translator\";s:6:\"plugin\";s:57:\"google-language-translator/google-language-translator.php\";s:11:\"new_version\";s:5:\"6.0.8\";s:3:\"url\";s:57:\"https://wordpress.org/plugins/google-language-translator/\";s:7:\"package\";s:75:\"https://downloads.wordpress.org/plugin/google-language-translator.6.0.8.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:79:\"https://ps.w.org/google-language-translator/assets/icon-256x256.png?rev=2124537\";s:2:\"1x\";s:79:\"https://ps.w.org/google-language-translator/assets/icon-256x256.png?rev=2124537\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:82:\"https://ps.w.org/google-language-translator/assets/banner-1544x500.png?rev=1632425\";s:2:\"1x\";s:81:\"https://ps.w.org/google-language-translator/assets/banner-772x250.png?rev=1632425\";}s:11:\"banners_rtl\";a:0:{}}s:9:\"hello.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/hello-dolly\";s:4:\"slug\";s:11:\"hello-dolly\";s:6:\"plugin\";s:9:\"hello.php\";s:11:\"new_version\";s:5:\"1.7.2\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/hello-dolly/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/hello-dolly.1.7.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-256x256.jpg?rev=2052855\";s:2:\"1x\";s:64:\"https://ps.w.org/hello-dolly/assets/icon-128x128.jpg?rev=2052855\";}s:7:\"banners\";a:1:{s:2:\"1x\";s:66:\"https://ps.w.org/hello-dolly/assets/banner-772x250.jpg?rev=2052855\";}s:11:\"banners_rtl\";a:0:{}}s:75:\"recent-posts-widget-with-thumbnails/recent-posts-widget-with-thumbnails.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:49:\"w.org/plugins/recent-posts-widget-with-thumbnails\";s:4:\"slug\";s:35:\"recent-posts-widget-with-thumbnails\";s:6:\"plugin\";s:75:\"recent-posts-widget-with-thumbnails/recent-posts-widget-with-thumbnails.php\";s:11:\"new_version\";s:5:\"7.0.3\";s:3:\"url\";s:66:\"https://wordpress.org/plugins/recent-posts-widget-with-thumbnails/\";s:7:\"package\";s:84:\"https://downloads.wordpress.org/plugin/recent-posts-widget-with-thumbnails.7.0.3.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:88:\"https://ps.w.org/recent-posts-widget-with-thumbnails/assets/icon-256x256.png?rev=2478511\";s:2:\"1x\";s:88:\"https://ps.w.org/recent-posts-widget-with-thumbnails/assets/icon-128x128.png?rev=2478511\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:91:\"https://ps.w.org/recent-posts-widget-with-thumbnails/assets/banner-1544x500.jpg?rev=2480188\";s:2:\"1x\";s:90:\"https://ps.w.org/recent-posts-widget-with-thumbnails/assets/banner-772x250.jpg?rev=2480188\";}s:11:\"banners_rtl\";a:0:{}}s:27:\"woocommerce/woocommerce.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:25:\"w.org/plugins/woocommerce\";s:4:\"slug\";s:11:\"woocommerce\";s:6:\"plugin\";s:27:\"woocommerce/woocommerce.php\";s:11:\"new_version\";s:5:\"5.3.0\";s:3:\"url\";s:42:\"https://wordpress.org/plugins/woocommerce/\";s:7:\"package\";s:60:\"https://downloads.wordpress.org/plugin/woocommerce.5.3.0.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-256x256.png?rev=2366418\";s:2:\"1x\";s:64:\"https://ps.w.org/woocommerce/assets/icon-128x128.png?rev=2366418\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:67:\"https://ps.w.org/woocommerce/assets/banner-1544x500.png?rev=2366418\";s:2:\"1x\";s:66:\"https://ps.w.org/woocommerce/assets/banner-772x250.png?rev=2366418\";}s:11:\"banners_rtl\";a:0:{}}s:31:\"wpdiscuz/class.WpdiscuzCore.php\";O:8:\"stdClass\":9:{s:2:\"id\";s:22:\"w.org/plugins/wpdiscuz\";s:4:\"slug\";s:8:\"wpdiscuz\";s:6:\"plugin\";s:31:\"wpdiscuz/class.WpdiscuzCore.php\";s:11:\"new_version\";s:5:\"7.2.2\";s:3:\"url\";s:39:\"https://wordpress.org/plugins/wpdiscuz/\";s:7:\"package\";s:57:\"https://downloads.wordpress.org/plugin/wpdiscuz.7.2.2.zip\";s:5:\"icons\";a:2:{s:2:\"2x\";s:61:\"https://ps.w.org/wpdiscuz/assets/icon-256x256.png?rev=1076265\";s:2:\"1x\";s:61:\"https://ps.w.org/wpdiscuz/assets/icon-128x128.png?rev=1076265\";}s:7:\"banners\";a:2:{s:2:\"2x\";s:64:\"https://ps.w.org/wpdiscuz/assets/banner-1544x500.png?rev=1767022\";s:2:\"1x\";s:63:\"https://ps.w.org/wpdiscuz/assets/banner-772x250.png?rev=1767022\";}s:11:\"banners_rtl\";a:0:{}}}}', 'no');

-- --------------------------------------------------------

--
-- Table structure for table `tbc_postmeta`
--

CREATE TABLE `tbc_postmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_postmeta`
--

INSERT INTO `tbc_postmeta` (`meta_id`, `post_id`, `meta_key`, `meta_value`) VALUES
(1, 2, '_wp_page_template', 'default'),
(2, 3, '_wp_page_template', 'default'),
(3, 5, '_edit_lock', '1621191449:1'),
(4, 5, '_wp_page_template', 'template-home.php'),
(5, 7, '_wp_trash_meta_status', 'publish'),
(6, 7, '_wp_trash_meta_time', '1620933662'),
(7, 8, '_wp_attached_file', '2021/05/favicon.png'),
(8, 8, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:80;s:6:\"height\";i:80;s:4:\"file\";s:19:\"2021/05/favicon.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(9, 9, '_wp_attached_file', '2021/05/cropped-favicon.png'),
(10, 9, '_wp_attachment_context', 'site-icon'),
(11, 9, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:27:\"2021/05/cropped-favicon.png\";s:5:\"sizes\";a:6:{s:6:\"medium\";a:4:{s:4:\"file\";s:27:\"cropped-favicon-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:27:\"cropped-favicon-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-270\";a:4:{s:4:\"file\";s:27:\"cropped-favicon-270x270.png\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-192\";a:4:{s:4:\"file\";s:27:\"cropped-favicon-192x192.png\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-180\";a:4:{s:4:\"file\";s:27:\"cropped-favicon-180x180.png\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"site_icon-32\";a:4:{s:4:\"file\";s:25:\"cropped-favicon-32x32.png\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(12, 10, '_wp_trash_meta_status', 'publish'),
(13, 10, '_wp_trash_meta_time', '1620933759'),
(14, 11, '_wp_attached_file', '2021/05/favicon-1.png'),
(15, 11, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:80;s:6:\"height\";i:80;s:4:\"file\";s:21:\"2021/05/favicon-1.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(16, 12, '_edit_lock', '1620933837:1'),
(17, 13, '_wp_attached_file', '2021/05/favicon-32x32-1.png'),
(18, 13, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:32;s:6:\"height\";i:32;s:4:\"file\";s:27:\"2021/05/favicon-32x32-1.png\";s:5:\"sizes\";a:0:{}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(19, 14, '_wp_attached_file', '2021/05/cropped-favicon-32x32-1.png'),
(20, 14, '_wp_attachment_context', 'site-icon'),
(21, 14, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:512;s:6:\"height\";i:512;s:4:\"file\";s:35:\"2021/05/cropped-favicon-32x32-1.png\";s:5:\"sizes\";a:6:{s:6:\"medium\";a:4:{s:4:\"file\";s:35:\"cropped-favicon-32x32-1-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:35:\"cropped-favicon-32x32-1-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-270\";a:4:{s:4:\"file\";s:35:\"cropped-favicon-32x32-1-270x270.png\";s:5:\"width\";i:270;s:6:\"height\";i:270;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-192\";a:4:{s:4:\"file\";s:35:\"cropped-favicon-32x32-1-192x192.png\";s:5:\"width\";i:192;s:6:\"height\";i:192;s:9:\"mime-type\";s:9:\"image/png\";}s:13:\"site_icon-180\";a:4:{s:4:\"file\";s:35:\"cropped-favicon-32x32-1-180x180.png\";s:5:\"width\";i:180;s:6:\"height\";i:180;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"site_icon-32\";a:4:{s:4:\"file\";s:33:\"cropped-favicon-32x32-1-32x32.png\";s:5:\"width\";i:32;s:6:\"height\";i:32;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(22, 12, '_wp_trash_meta_status', 'publish'),
(23, 12, '_wp_trash_meta_time', '1620933853'),
(24, 15, '_wp_trash_meta_status', 'publish'),
(25, 15, '_wp_trash_meta_time', '1620933861'),
(26, 16, '_wp_trash_meta_status', 'publish'),
(27, 16, '_wp_trash_meta_time', '1620933864'),
(28, 17, '_wp_trash_meta_status', 'publish'),
(29, 17, '_wp_trash_meta_time', '1620933868'),
(30, 18, '_edit_lock', '1621018527:1'),
(31, 20, '_wp_trash_meta_status', 'publish'),
(32, 20, '_wp_trash_meta_time', '1620969151'),
(33, 21, '_edit_lock', '1621017216:1'),
(34, 21, '_wp_page_template', 'template-contact.php'),
(35, 23, '_edit_lock', '1620970388:1'),
(36, 24, '_edit_lock', '1620970402:1'),
(37, 25, '_edit_lock', '1620970432:1'),
(38, 26, '_edit_lock', '1621018610:1'),
(39, 26, '_wp_page_template', 'template-about.php'),
(40, 28, '_edit_last', '1'),
(41, 28, '_edit_lock', '1621017075:1'),
(42, 21, '_edit_last', '1'),
(43, 21, 'address', 'The Brown Curves, India'),
(44, 21, '_address', 'field_609ebb86e7821'),
(45, 21, 'primary_number', '123456789'),
(46, 21, '_primary_number', 'field_609ebbafe7822'),
(47, 21, 'secondary_number', '987654321'),
(48, 21, '_secondary_number', 'field_609ebbc8e7823'),
(49, 21, 'email', 'testing@gmail.com'),
(50, 21, '_email', 'field_609ebbe3e7824'),
(51, 21, 'website_link', 'https://www.thebrowncurves.com'),
(52, 21, '_website_link', 'field_609ebbf6e7825'),
(53, 34, 'address', 'The Brown Curves, India'),
(54, 34, '_address', 'field_609ebb86e7821'),
(55, 34, 'primary_number', '123456789'),
(56, 34, '_primary_number', 'field_609ebbafe7822'),
(57, 34, 'secondary_number', '987654321'),
(58, 34, '_secondary_number', 'field_609ebbc8e7823'),
(59, 34, 'email', 'testing@gmail.com'),
(60, 34, '_email', 'field_609ebbe3e7824'),
(61, 34, 'website_link', 'https://www.thebrowncurves.com'),
(62, 34, '_website_link', 'field_609ebbf6e7825'),
(63, 21, 'instragram', 'http://instragram.com/thebrowncurves'),
(64, 21, '_instragram', 'field_609ec0ff5e087'),
(65, 21, 'facebook', 'https://www.facebook.com/thebrowncurves'),
(66, 21, '_facebook', 'field_609ec1115e088'),
(67, 21, 'twitter', 'https://www.twitter.com/thebrowncurves'),
(68, 21, '_twitter', 'field_609ec11e5e089'),
(69, 38, 'address', 'The Brown Curves, India'),
(70, 38, '_address', 'field_609ebb86e7821'),
(71, 38, 'primary_number', '123456789'),
(72, 38, '_primary_number', 'field_609ebbafe7822'),
(73, 38, 'secondary_number', '987654321'),
(74, 38, '_secondary_number', 'field_609ebbc8e7823'),
(75, 38, 'email', 'testing@gmail.com'),
(76, 38, '_email', 'field_609ebbe3e7824'),
(77, 38, 'website_link', 'https://www.thebrowncurves.com'),
(78, 38, '_website_link', 'field_609ebbf6e7825'),
(79, 38, 'instragram', 'http://instragram.com/thebrowncurves'),
(80, 38, '_instragram', 'field_609ec0ff5e087'),
(81, 38, 'facebook', 'https://www.facebook.com/thebrowncurves'),
(82, 38, '_facebook', 'field_609ec1115e088'),
(83, 38, 'twitter', 'http://twitter.com/thebrowncurves'),
(84, 38, '_twitter', 'field_609ec11e5e089'),
(85, 21, 'instagram', 'https://www.instagram.com/thebrowncurves'),
(86, 21, '_instagram', 'field_609ec0ff5e087'),
(87, 39, 'address', 'The Brown Curves, India'),
(88, 39, '_address', 'field_609ebb86e7821'),
(89, 39, 'primary_number', '123456789'),
(90, 39, '_primary_number', 'field_609ebbafe7822'),
(91, 39, 'secondary_number', '987654321'),
(92, 39, '_secondary_number', 'field_609ebbc8e7823'),
(93, 39, 'email', 'testing@gmail.com'),
(94, 39, '_email', 'field_609ebbe3e7824'),
(95, 39, 'website_link', 'https://www.thebrowncurves.com'),
(96, 39, '_website_link', 'field_609ebbf6e7825'),
(97, 39, 'instragram', 'http://instragram.com/thebrowncurves'),
(98, 39, '_instragram', 'field_609ec0ff5e087'),
(99, 39, 'facebook', 'https://www.facebook.com/thebrowncurves'),
(100, 39, '_facebook', 'field_609ec1115e088'),
(101, 39, 'twitter', 'https://www.twitter.com/thebrowncurves'),
(102, 39, '_twitter', 'field_609ec11e5e089'),
(103, 39, 'instagram', 'https://www.instragram.com/thebrowncurves'),
(104, 39, '_instagram', 'field_609ec0ff5e087'),
(105, 40, 'address', 'The Brown Curves, India'),
(106, 40, '_address', 'field_609ebb86e7821'),
(107, 40, 'primary_number', '123456789'),
(108, 40, '_primary_number', 'field_609ebbafe7822'),
(109, 40, 'secondary_number', '987654321'),
(110, 40, '_secondary_number', 'field_609ebbc8e7823'),
(111, 40, 'email', 'testing@gmail.com'),
(112, 40, '_email', 'field_609ebbe3e7824'),
(113, 40, 'website_link', 'https://www.thebrowncurves.com'),
(114, 40, '_website_link', 'field_609ebbf6e7825'),
(115, 40, 'instragram', 'http://instragram.com/thebrowncurves'),
(116, 40, '_instragram', 'field_609ec0ff5e087'),
(117, 40, 'facebook', 'https://www.facebook.com/thebrowncurves'),
(118, 40, '_facebook', 'field_609ec1115e088'),
(119, 40, 'twitter', 'https://www.twitter.com/thebrowncurves'),
(120, 40, '_twitter', 'field_609ec11e5e089'),
(121, 40, 'instagram', 'https://www.instagram.com/thebrowncurves'),
(122, 40, '_instagram', 'field_609ec0ff5e087'),
(123, 41, '_edit_last', '1'),
(124, 41, '_edit_lock', '1621186062:1'),
(125, 44, '_wp_attached_file', '2021/05/about-us.jpg'),
(126, 44, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1600;s:6:\"height\";i:1067;s:4:\"file\";s:20:\"2021/05/about-us.jpg\";s:5:\"sizes\";a:5:{s:6:\"medium\";a:4:{s:4:\"file\";s:20:\"about-us-300x200.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:200;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:21:\"about-us-1024x683.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:683;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:20:\"about-us-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:20:\"about-us-768x512.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:512;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:22:\"about-us-1536x1024.jpg\";s:5:\"width\";i:1536;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(127, 26, '_edit_last', '1'),
(128, 26, 'about_content', 'Lorem Ipsum is simply dummied text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nLorem Ipsum is simply dummied text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(129, 26, '_about_content', 'field_609ec3faf4a66'),
(130, 26, 'about_banner', '48'),
(131, 26, '_about_banner', 'field_609ec426f4a67'),
(132, 45, 'about_content', 'Lorem Ipsum is simply dummied text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nLorem Ipsum is simply dummied text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(133, 45, '_about_content', 'field_609ec3faf4a66'),
(134, 45, 'about_banner', '44'),
(135, 45, '_about_banner', 'field_609ec426f4a67'),
(136, 46, 'about_content', 'Lorem Ipsum is simply dummied text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nLorem Ipsum is simply dummied text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(137, 46, '_about_content', 'field_609ec3faf4a66'),
(138, 46, 'about_banner', '44'),
(139, 46, '_about_banner', 'field_609ec426f4a67'),
(140, 47, 'about_content', 'Lorem Ipsum is simply dummied text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nLorem Ipsum is simply dummied text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(141, 47, '_about_content', 'field_609ec3faf4a66'),
(142, 47, 'about_banner', '44'),
(143, 47, '_about_banner', 'field_609ec426f4a67'),
(144, 48, '_wp_attached_file', '2021/05/about-us-title-image.png'),
(145, 48, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1920;s:6:\"height\";i:566;s:4:\"file\";s:32:\"2021/05/about-us-title-image.png\";s:5:\"sizes\";a:5:{s:6:\"medium\";a:4:{s:4:\"file\";s:31:\"about-us-title-image-300x88.png\";s:5:\"width\";i:300;s:6:\"height\";i:88;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:33:\"about-us-title-image-1024x302.png\";s:5:\"width\";i:1024;s:6:\"height\";i:302;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:32:\"about-us-title-image-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:32:\"about-us-title-image-768x226.png\";s:5:\"width\";i:768;s:6:\"height\";i:226;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"1536x1536\";a:4:{s:4:\"file\";s:33:\"about-us-title-image-1536x453.png\";s:5:\"width\";i:1536;s:6:\"height\";i:453;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(146, 49, 'about_content', 'Lorem Ipsum is simply dummied text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.\r\n\r\nLorem Ipsum is simply dummied text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.'),
(147, 49, '_about_content', 'field_609ec3faf4a66'),
(148, 49, 'about_banner', '48'),
(149, 49, '_about_banner', 'field_609ec426f4a67'),
(150, 54, '_form', '<label> Your name\n    [text* your-name] </label>\n\n<label> Your email\n    [email* your-email] </label>\n\n<label> Subject\n    [text* your-subject] </label>\n\n<label> Your message (optional)\n    [textarea your-message] </label>\n\n[submit \"Submit\"]'),
(151, 54, '_mail', 'a:8:{s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:42:\"[_site_title] <giribhagirath169@gmail.com>\";s:4:\"body\";s:163:\"From: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\";s:9:\"recipient\";s:19:\"[_site_admin_email]\";s:18:\"additional_headers\";s:22:\"Reply-To: [your-email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(152, 54, '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:42:\"[_site_title] <giribhagirath169@gmail.com>\";s:4:\"body\";s:105:\"Message Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\";s:9:\"recipient\";s:12:\"[your-email]\";s:18:\"additional_headers\";s:29:\"Reply-To: [_site_admin_email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";i:0;s:13:\"exclude_blank\";i:0;}'),
(153, 54, '_messages', 'a:12:{s:12:\"mail_sent_ok\";s:45:\"Thank you for your message. It has been sent.\";s:12:\"mail_sent_ng\";s:71:\"There was an error trying to send your message. Please try again later.\";s:16:\"validation_error\";s:61:\"One or more fields have an error. Please check and try again.\";s:4:\"spam\";s:71:\"There was an error trying to send your message. Please try again later.\";s:12:\"accept_terms\";s:69:\"You must accept the terms and conditions before sending your message.\";s:16:\"invalid_required\";s:22:\"The field is required.\";s:16:\"invalid_too_long\";s:22:\"The field is too long.\";s:17:\"invalid_too_short\";s:23:\"The field is too short.\";s:13:\"upload_failed\";s:46:\"There was an unknown error uploading the file.\";s:24:\"upload_file_type_invalid\";s:49:\"You are not allowed to upload files of this type.\";s:21:\"upload_file_too_large\";s:20:\"The file is too big.\";s:23:\"upload_failed_php_error\";s:38:\"There was an error uploading the file.\";}'),
(154, 54, '_additional_settings', NULL),
(155, 54, '_locale', 'en_US'),
(156, 55, '_form', '<div class=\"row\">\n                                    <div class=\"col-lg-6\">\n                                        <div class=\"contact-form-style mb-20\">\n[text* user_name placeholder \"Enter your full name\"]\n                                        </div>\n                                    </div>\n                                    <div class=\"col-lg-6\">\n                                        <div class=\"contact-form-style mb-20\">\n                                          [email* user_email placeholder \"Enter your email\"]\n                                        </div>\n                                    </div>\n                                    <div class=\"col-lg-12\">\n                                        <div class=\"contact-form-style mb-20\">\n[text* user_subject placeholder \"Enter your subject here\"]\n                                        </div>\n                                    </div>\n                                    <div class=\"col-lg-12\">\n                                        <div class=\"contact-form-style\">\n                                           [textarea* user_message placeholder \"Enter your address here\"]\n                                            [submit class:submit class:cr-btn class:btn-style class:submit-btn \"Send Message\"]\n                                        </div>\n                                    </div>\n                                </div>'),
(157, 55, '_mail', 'a:9:{s:6:\"active\";b:1;s:7:\"subject\";s:14:\"[user_subject]\";s:6:\"sender\";s:38:\"[user_name] <thebrowncurves@gmail.com>\";s:9:\"recipient\";s:24:\"thebrowncurves@gmail.com\";s:4:\"body\";s:163:\"From: [user_name] <[user_email]>\nSubject: [user_subject]\n\nMessage Body:\n[user_message]\n\n-- \nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\";s:18:\"additional_headers\";s:22:\"Reply-To: [user_email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(158, 55, '_mail_2', 'a:9:{s:6:\"active\";b:0;s:7:\"subject\";s:30:\"[_site_title] \"[your-subject]\"\";s:6:\"sender\";s:42:\"[_site_title] <giribhagirath169@gmail.com>\";s:9:\"recipient\";s:12:\"[your-email]\";s:4:\"body\";s:105:\"Message Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\";s:18:\"additional_headers\";s:29:\"Reply-To: [_site_admin_email]\";s:11:\"attachments\";s:0:\"\";s:8:\"use_html\";b:0;s:13:\"exclude_blank\";b:0;}'),
(159, 55, '_messages', 'a:22:{s:12:\"mail_sent_ok\";s:45:\"Thank you for your message. It has been sent.\";s:12:\"mail_sent_ng\";s:71:\"There was an error trying to send your message. Please try again later.\";s:16:\"validation_error\";s:61:\"One or more fields have an error. Please check and try again.\";s:4:\"spam\";s:71:\"There was an error trying to send your message. Please try again later.\";s:12:\"accept_terms\";s:69:\"You must accept the terms and conditions before sending your message.\";s:16:\"invalid_required\";s:22:\"The field is required.\";s:16:\"invalid_too_long\";s:22:\"The field is too long.\";s:17:\"invalid_too_short\";s:23:\"The field is too short.\";s:13:\"upload_failed\";s:46:\"There was an unknown error uploading the file.\";s:24:\"upload_file_type_invalid\";s:49:\"You are not allowed to upload files of this type.\";s:21:\"upload_file_too_large\";s:20:\"The file is too big.\";s:23:\"upload_failed_php_error\";s:38:\"There was an error uploading the file.\";s:12:\"invalid_date\";s:29:\"The date format is incorrect.\";s:14:\"date_too_early\";s:44:\"The date is before the earliest one allowed.\";s:13:\"date_too_late\";s:41:\"The date is after the latest one allowed.\";s:14:\"invalid_number\";s:29:\"The number format is invalid.\";s:16:\"number_too_small\";s:47:\"The number is smaller than the minimum allowed.\";s:16:\"number_too_large\";s:46:\"The number is larger than the maximum allowed.\";s:23:\"quiz_answer_not_correct\";s:36:\"The answer to the quiz is incorrect.\";s:13:\"invalid_email\";s:38:\"The e-mail address entered is invalid.\";s:11:\"invalid_url\";s:19:\"The URL is invalid.\";s:11:\"invalid_tel\";s:32:\"The telephone number is invalid.\";}'),
(160, 55, '_additional_settings', ''),
(161, 55, '_locale', 'en_US'),
(163, 56, '_edit_last', '1'),
(164, 56, '_edit_lock', '1621186313:1'),
(165, 58, '_edit_lock', '1621186526:1'),
(166, 56, '_wp_trash_meta_status', 'publish'),
(167, 56, '_wp_trash_meta_time', '1621186556'),
(168, 56, '_wp_desired_post_slug', 'group_60a15726af55f'),
(169, 57, '_wp_trash_meta_status', 'publish'),
(170, 57, '_wp_trash_meta_time', '1621186556'),
(171, 57, '_wp_desired_post_slug', 'field_60a1573e0c98f'),
(172, 59, '_edit_lock', '1621188852:1'),
(175, 59, '_thumbnail_id', '65'),
(178, 1, '_edit_lock', '1621188645:1'),
(181, 1, '_thumbnail_id', '44'),
(182, 62, '_edit_lock', '1621192156:1'),
(183, 63, '_wp_attached_file', '2021/05/ig-1.jpg'),
(184, 63, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1279;s:6:\"height\";i:1279;s:4:\"file\";s:16:\"2021/05/ig-1.jpg\";s:5:\"sizes\";a:4:{s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"ig-1-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:18:\"ig-1-1024x1024.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"ig-1-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:16:\"ig-1-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(187, 62, '_thumbnail_id', '63'),
(190, 65, '_wp_attached_file', '2021/05/ig-2.jpg'),
(191, 65, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:782;s:6:\"height\";i:782;s:4:\"file\";s:16:\"2021/05/ig-2.jpg\";s:5:\"sizes\";a:3:{s:6:\"medium\";a:4:{s:4:\"file\";s:16:\"ig-2-300x300.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:16:\"ig-2-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:16:\"ig-2-768x768.jpg\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(194, 66, 'wpd_form_custom_css', ''),
(195, 66, 'wpdiscuz_form_general_options', 'a:18:{s:4:\"lang\";s:5:\"en_US\";s:25:\"roles_cannot_see_comments\";a:0:{}s:22:\"guest_can_see_comments\";i:1;s:20:\"roles_cannot_comment\";a:0:{}s:17:\"guest_can_comment\";i:1;s:21:\"show_subscription_bar\";i:1;s:18:\"header_text_single\";s:7:\"Comment\";s:18:\"header_text_plural\";s:8:\"Comments\";s:24:\"wpdiscuz_form_post_types\";a:3:{s:4:\"post\";s:4:\"post\";s:4:\"page\";s:4:\"page\";s:10:\"attachment\";s:10:\"attachment\";}s:6:\"postid\";s:0:\"\";s:12:\"postidsArray\";a:0:{}s:27:\"show_subscription_agreement\";i:0;s:28:\"subscription_agreement_label\";s:119:\"I allow to use my email address and send notification about new comments and replies (you can unsubscribe at any time).\";s:5:\"theme\";s:73:\"C:/xampp/htdocs/thebrowncurves/wp-content/plugins/wpdiscuz/themes/default\";s:6:\"layout\";i:2;s:18:\"enable_post_rating\";i:1;s:17:\"post_rating_title\";s:14:\"Article Rating\";s:25:\"allow_guests_rate_on_post\";i:1;}'),
(196, 66, 'wpdiscuz_form_structure', 'a:1:{s:19:\"wpd_form_row_wrap_0\";a:4:{s:11:\"column_type\";s:3:\"two\";s:9:\"row_order\";i:0;s:4:\"left\";a:3:{s:7:\"wc_name\";a:7:{s:4:\"name\";s:4:\"Name\";s:4:\"desc\";s:0:\"\";s:4:\"icon\";s:11:\"fas fa-user\";s:8:\"required\";i:1;s:4:\"type\";s:35:\"wpdFormAttr\\Field\\DefaultField\\Name\";s:18:\"is_show_on_comment\";i:0;s:13:\"is_show_sform\";i:0;}s:8:\"wc_email\";a:7:{s:4:\"name\";s:5:\"Email\";s:4:\"desc\";s:0:\"\";s:4:\"icon\";s:9:\"fas fa-at\";s:8:\"required\";i:1;s:4:\"type\";s:36:\"wpdFormAttr\\Field\\DefaultField\\Email\";s:18:\"is_show_on_comment\";i:0;s:13:\"is_show_sform\";i:0;}s:10:\"wc_website\";a:5:{s:4:\"name\";s:7:\"Website\";s:4:\"desc\";s:0:\"\";s:4:\"icon\";s:11:\"fas fa-link\";s:6:\"enable\";i:1;s:4:\"type\";s:38:\"wpdFormAttr\\Field\\DefaultField\\Website\";}}s:5:\"right\";a:2:{s:10:\"wc_captcha\";a:5:{s:4:\"name\";s:0:\"\";s:4:\"desc\";s:0:\"\";s:15:\"show_for_guests\";s:1:\"0\";s:14:\"show_for_users\";s:1:\"0\";s:4:\"type\";s:38:\"wpdFormAttr\\Field\\DefaultField\\Captcha\";}s:6:\"submit\";a:2:{s:4:\"name\";s:12:\"Post Comment\";s:4:\"type\";s:37:\"wpdFormAttr\\Field\\DefaultField\\Submit\";}}}}'),
(197, 66, 'wpdiscuz_form_fields', 'a:5:{s:7:\"wc_name\";a:7:{s:4:\"name\";s:4:\"Name\";s:4:\"desc\";s:0:\"\";s:4:\"icon\";s:11:\"fas fa-user\";s:8:\"required\";i:1;s:4:\"type\";s:35:\"wpdFormAttr\\Field\\DefaultField\\Name\";s:18:\"is_show_on_comment\";i:0;s:13:\"is_show_sform\";i:0;}s:8:\"wc_email\";a:7:{s:4:\"name\";s:5:\"Email\";s:4:\"desc\";s:0:\"\";s:4:\"icon\";s:9:\"fas fa-at\";s:8:\"required\";i:1;s:4:\"type\";s:36:\"wpdFormAttr\\Field\\DefaultField\\Email\";s:18:\"is_show_on_comment\";i:0;s:13:\"is_show_sform\";i:0;}s:10:\"wc_website\";a:5:{s:4:\"name\";s:7:\"Website\";s:4:\"desc\";s:0:\"\";s:4:\"icon\";s:11:\"fas fa-link\";s:6:\"enable\";i:1;s:4:\"type\";s:38:\"wpdFormAttr\\Field\\DefaultField\\Website\";}s:10:\"wc_captcha\";a:5:{s:4:\"name\";s:0:\"\";s:4:\"desc\";s:0:\"\";s:15:\"show_for_guests\";s:1:\"0\";s:14:\"show_for_users\";s:1:\"0\";s:4:\"type\";s:38:\"wpdFormAttr\\Field\\DefaultField\\Captcha\";}s:6:\"submit\";a:2:{s:4:\"name\";s:12:\"Post Comment\";s:4:\"type\";s:37:\"wpdFormAttr\\Field\\DefaultField\\Submit\";}}'),
(198, 59, 'wpdiscuz_post_rating', '4.5'),
(199, 59, 'wpdiscuz_post_rating_count', '2'),
(200, 66, '_edit_lock', '1621192760:1'),
(201, 66, '_edit_last', '1'),
(202, 67, '_edit_lock', '1621249955:1'),
(203, 68, '_edit_lock', '1621258567:1'),
(204, 68, '_thumbnail_id', '63'),
(205, 69, '_edit_lock', '1621250343:1'),
(206, 69, '_wp_page_template', 'template-testimonial.php'),
(207, 71, '_edit_lock', '1621258545:1'),
(208, 71, '_thumbnail_id', '65'),
(209, 73, 'body_bg', '#E8E8E8'),
(210, 73, 'body_text', '#231f20'),
(211, 73, 'body_link', '#21759B'),
(212, 73, 'header_bg', '#DDDDDD'),
(213, 73, 'header_text_color', '#333333'),
(214, 73, 'content_bg', '#FFFFFF'),
(215, 73, 'content_text', '#222222'),
(216, 73, 'sp_content_link_color', '#21759B'),
(217, 73, 'content_border', '#E3E3E3'),
(218, 75, '_guid', 'cd8ab466-e236-49d3-bd6c-e84db055ae9a'),
(219, 75, '_footer_page', '<br>Is this email not displaying correctly? <a href=\"{sp-browser-url}\">View it in your browser</a><br><br><a href=\"{sp-unsubscribe-url}\">unsubscribe from this list</a><br>'),
(220, 75, '_header_content', '<table cellpadding=\'0\' cellspacing=\'0\' width=\'100%\'><tr><td><h1 style=\'text-align:center;\'>{sp-site-name}</h1></td></tr></table>'),
(221, 75, '_header_padding', 'pad-header'),
(222, 76, '_guid', 'cd8ab467-e236-49d3-bd6c-e84db055ae9a'),
(223, 76, '_system_template', '1'),
(224, 76, '_footer_page', '<br><!--page footer -->'),
(225, 76, '_header_content', '<table cellpadding=\'0\' cellspacing=\'0\' width=\'100%\'><tr><td><h1 style=\'text-align:center;\'>{sp-site-name}</h1></td></tr></table>'),
(226, 76, '_header_padding', 'pad-header'),
(227, 78, '_edit_lock', '1621262167:1'),
(228, 79, '_edit_lock', '1621265552:1'),
(229, 79, '_thumbnail_id', '65'),
(230, 81, '_edit_last', '1'),
(231, 81, '_edit_lock', '1621263912:1'),
(232, 79, '_edit_last', '1'),
(233, 79, 'redirect_url', 'https://www.wp-hasty.com/'),
(234, 79, '_redirect_url', 'field_60a2869101145'),
(235, 84, '_wp_attached_file', 'woocommerce-placeholder.png'),
(236, 84, '_wp_attachment_metadata', 'a:5:{s:5:\"width\";i:1200;s:6:\"height\";i:1200;s:4:\"file\";s:27:\"woocommerce-placeholder.png\";s:5:\"sizes\";a:4:{s:6:\"medium\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-300x300.png\";s:5:\"width\";i:300;s:6:\"height\";i:300;s:9:\"mime-type\";s:9:\"image/png\";}s:5:\"large\";a:4:{s:4:\"file\";s:37:\"woocommerce-placeholder-1024x1024.png\";s:5:\"width\";i:1024;s:6:\"height\";i:1024;s:9:\"mime-type\";s:9:\"image/png\";}s:9:\"thumbnail\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-150x150.png\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:9:\"image/png\";}s:12:\"medium_large\";a:4:{s:4:\"file\";s:35:\"woocommerce-placeholder-768x768.png\";s:5:\"width\";i:768;s:6:\"height\";i:768;s:9:\"mime-type\";s:9:\"image/png\";}}s:10:\"image_meta\";a:12:{s:8:\"aperture\";s:1:\"0\";s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:0:\"\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";s:1:\"0\";s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:1:\"0\";s:3:\"iso\";s:1:\"0\";s:13:\"shutter_speed\";s:1:\"0\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";s:1:\"0\";s:8:\"keywords\";a:0:{}}}'),
(237, 90, '_edit_last', '1'),
(238, 90, '_edit_lock', '1621269603:1'),
(239, 90, 'total_sales', '0'),
(240, 90, '_tax_status', 'taxable'),
(241, 90, '_tax_class', ''),
(242, 90, '_manage_stock', 'no'),
(243, 90, '_backorders', 'no'),
(244, 90, '_sold_individually', 'no'),
(245, 90, '_virtual', 'no'),
(246, 90, '_downloadable', 'no'),
(247, 90, '_download_limit', '-1'),
(248, 90, '_download_expiry', '-1'),
(249, 90, '_stock', NULL),
(250, 90, '_stock_status', 'instock'),
(251, 90, '_wc_average_rating', '0'),
(252, 90, '_wc_review_count', '0'),
(253, 90, '_product_version', '5.3.0');

-- --------------------------------------------------------

--
-- Table structure for table `tbc_posts`
--

CREATE TABLE `tbc_posts` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `post_author` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT 0,
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_posts`
--

INSERT INTO `tbc_posts` (`ID`, `post_author`, `post_date`, `post_date_gmt`, `post_content`, `post_title`, `post_excerpt`, `post_status`, `comment_status`, `ping_status`, `post_password`, `post_name`, `to_ping`, `pinged`, `post_modified`, `post_modified_gmt`, `post_content_filtered`, `post_parent`, `guid`, `menu_order`, `post_type`, `post_mime_type`, `comment_count`) VALUES
(1, 1, '2021-05-13 19:07:03', '2021-05-13 19:07:03', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'publish', 'open', 'open', '', 'hello-world', '', '', '2021-05-16 18:04:50', '2021-05-16 18:04:50', '', 0, 'http://localhost/thebrowncurves/?p=1', 0, 'post', '', 1),
(2, 1, '2021-05-13 19:07:03', '2021-05-13 19:07:03', '<!-- wp:paragraph -->\n<p>This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>...or something like this:</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:quote -->\n<blockquote class=\"wp-block-quote\"><p>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</p></blockquote>\n<!-- /wp:quote -->\n\n<!-- wp:paragraph -->\n<p>As a new WordPress user, you should go to <a href=\"http://localhost/thebrowncurves/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!</p>\n<!-- /wp:paragraph -->', 'Sample Page', '', 'publish', 'closed', 'open', '', 'sample-page', '', '', '2021-05-13 19:07:03', '2021-05-13 19:07:03', '', 0, 'http://localhost/thebrowncurves/?page_id=2', 0, 'page', '', 0),
(3, 1, '2021-05-13 19:07:03', '2021-05-13 19:07:03', '<!-- wp:heading --><h2>Who we are</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Our website address is: http://localhost/thebrowncurves.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Comments</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>When visitors leave comments on the site we collect the data shown in the comments form, and also the visitor&#8217;s IP address and browser user agent string to help spam detection.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>An anonymized string created from your email address (also called a hash) may be provided to the Gravatar service to see if you are using it. The Gravatar service privacy policy is available here: https://automattic.com/privacy/. After approval of your comment, your profile picture is visible to the public in the context of your comment.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Media</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you upload images to the website, you should avoid uploading images with embedded location data (EXIF GPS) included. Visitors to the website can download and extract any location data from images on the website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Cookies</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment on our site you may opt-in to saving your name, email address and website in cookies. These are for your convenience so that you do not have to fill in your details again when you leave another comment. These cookies will last for one year.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you visit our login page, we will set a temporary cookie to determine if your browser accepts cookies. This cookie contains no personal data and is discarded when you close your browser.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>When you log in, we will also set up several cookies to save your login information and your screen display choices. Login cookies last for two days, and screen options cookies last for a year. If you select &quot;Remember Me&quot;, your login will persist for two weeks. If you log out of your account, the login cookies will be removed.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>If you edit or publish an article, an additional cookie will be saved in your browser. This cookie includes no personal data and simply indicates the post ID of the article you just edited. It expires after 1 day.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Embedded content from other websites</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Articles on this site may include embedded content (e.g. videos, images, articles, etc.). Embedded content from other websites behaves in the exact same way as if the visitor has visited the other website.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>These websites may collect data about you, use cookies, embed additional third-party tracking, and monitor your interaction with that embedded content, including tracking your interaction with the embedded content if you have an account and are logged in to that website.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Who we share your data with</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you request a password reset, your IP address will be included in the reset email.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>How long we retain your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you leave a comment, the comment and its metadata are retained indefinitely. This is so we can recognize and approve any follow-up comments automatically instead of holding them in a moderation queue.</p><!-- /wp:paragraph --><!-- wp:paragraph --><p>For users that register on our website (if any), we also store the personal information they provide in their user profile. All users can see, edit, or delete their personal information at any time (except they cannot change their username). Website administrators can also see and edit that information.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>What rights you have over your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>If you have an account on this site, or have left comments, you can request to receive an exported file of the personal data we hold about you, including any data you have provided to us. You can also request that we erase any personal data we hold about you. This does not include any data we are obliged to keep for administrative, legal, or security purposes.</p><!-- /wp:paragraph --><!-- wp:heading --><h2>Where we send your data</h2><!-- /wp:heading --><!-- wp:paragraph --><p><strong class=\"privacy-policy-tutorial\">Suggested text: </strong>Visitor comments may be checked through an automated spam detection service.</p><!-- /wp:paragraph -->', 'Privacy Policy', '', 'draft', 'closed', 'open', '', 'privacy-policy', '', '', '2021-05-13 19:07:03', '2021-05-13 19:07:03', '', 0, 'http://localhost/thebrowncurves/?page_id=3', 0, 'page', '', 0),
(4, 1, '2021-05-13 19:07:14', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2021-05-13 19:07:14', '0000-00-00 00:00:00', '', 0, 'http://localhost/thebrowncurves/?p=4', 0, 'post', '', 0),
(5, 1, '2021-05-13 19:20:36', '2021-05-13 19:20:36', '', 'Home', '', 'publish', 'closed', 'closed', '', 'home', '', '', '2021-05-16 09:04:07', '2021-05-16 09:04:07', '', 0, 'http://localhost/thebrowncurves/?page_id=5', 0, 'page', '', 0),
(6, 1, '2021-05-13 19:20:36', '2021-05-13 19:20:36', '', 'Home', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2021-05-13 19:20:36', '2021-05-13 19:20:36', '', 5, 'http://localhost/thebrowncurves/?p=6', 0, 'revision', '', 0),
(7, 1, '2021-05-13 19:21:02', '2021-05-13 19:21:02', '{\n    \"show_on_front\": {\n        \"value\": \"page\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-05-13 19:21:02\"\n    },\n    \"page_on_front\": {\n        \"value\": \"5\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-05-13 19:21:02\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '8a64e009-9d63-46aa-95e3-68f6a6830cce', '', '', '2021-05-13 19:21:02', '2021-05-13 19:21:02', '', 0, 'http://localhost/thebrowncurves/2021/05/13/8a64e009-9d63-46aa-95e3-68f6a6830cce/', 0, 'customize_changeset', '', 0),
(8, 1, '2021-05-13 19:22:32', '2021-05-13 19:22:32', '', 'favicon', '', 'inherit', 'open', 'closed', '', 'favicon', '', '', '2021-05-13 19:22:32', '2021-05-13 19:22:32', '', 0, 'http://localhost/thebrowncurves/wp-content/uploads/2021/05/favicon.png', 0, 'attachment', 'image/png', 0),
(9, 1, '2021-05-13 19:22:36', '2021-05-13 19:22:36', 'http://localhost/thebrowncurves/wp-content/uploads/2021/05/cropped-favicon.png', 'cropped-favicon.png', '', 'inherit', 'open', 'closed', '', 'cropped-favicon-png', '', '', '2021-05-13 19:22:36', '2021-05-13 19:22:36', '', 0, 'http://localhost/thebrowncurves/wp-content/uploads/2021/05/cropped-favicon.png', 0, 'attachment', 'image/png', 0),
(10, 1, '2021-05-13 19:22:39', '2021-05-13 19:22:39', '{\n    \"site_icon\": {\n        \"value\": 9,\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-05-13 19:22:39\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '537b876b-d51d-44de-b593-1a0b34a1209a', '', '', '2021-05-13 19:22:39', '2021-05-13 19:22:39', '', 0, 'http://localhost/thebrowncurves/2021/05/13/537b876b-d51d-44de-b593-1a0b34a1209a/', 0, 'customize_changeset', '', 0),
(11, 1, '2021-05-13 19:23:10', '2021-05-13 19:23:10', '', 'favicon', '', 'inherit', 'open', 'closed', '', 'favicon-2', '', '', '2021-05-13 19:23:10', '2021-05-13 19:23:10', '', 0, 'http://localhost/thebrowncurves/wp-content/uploads/2021/05/favicon-1.png', 0, 'attachment', 'image/png', 0),
(12, 1, '2021-05-13 19:24:13', '2021-05-13 19:24:13', '{\n    \"site_icon\": {\n        \"value\": 14,\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-05-13 19:24:13\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'dd334ca7-b2f8-4755-b5af-a15420584025', '', '', '2021-05-13 19:24:13', '2021-05-13 19:24:13', '', 0, 'http://localhost/thebrowncurves/?p=12', 0, 'customize_changeset', '', 0),
(13, 1, '2021-05-13 19:24:07', '2021-05-13 19:24:07', '', 'favicon-32x32', '', 'inherit', 'open', 'closed', '', 'favicon-32x32', '', '', '2021-05-13 19:24:07', '2021-05-13 19:24:07', '', 0, 'http://localhost/thebrowncurves/wp-content/uploads/2021/05/favicon-32x32-1.png', 0, 'attachment', 'image/png', 0),
(14, 1, '2021-05-13 19:24:11', '2021-05-13 19:24:11', 'http://localhost/thebrowncurves/wp-content/uploads/2021/05/cropped-favicon-32x32-1.png', 'cropped-favicon-32x32-1.png', '', 'inherit', 'open', 'closed', '', 'cropped-favicon-32x32-1-png', '', '', '2021-05-13 19:24:11', '2021-05-13 19:24:11', '', 0, 'http://localhost/thebrowncurves/wp-content/uploads/2021/05/cropped-favicon-32x32-1.png', 0, 'attachment', 'image/png', 0),
(15, 1, '2021-05-13 19:24:20', '2021-05-13 19:24:20', '{\n    \"blogdescription\": {\n        \"value\": \"\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-05-13 19:24:20\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '5acbffc1-1126-4bbc-8926-f6d2db1ef93c', '', '', '2021-05-13 19:24:20', '2021-05-13 19:24:20', '', 0, 'http://localhost/thebrowncurves/2021/05/13/5acbffc1-1126-4bbc-8926-f6d2db1ef93c/', 0, 'customize_changeset', '', 0),
(16, 1, '2021-05-13 19:24:24', '2021-05-13 19:24:24', '{\n    \"blogdescription\": {\n        \"value\": \"qwertyu\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-05-13 19:24:24\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '0776580c-13f0-4b55-96a1-cb2dc2faae9c', '', '', '2021-05-13 19:24:24', '2021-05-13 19:24:24', '', 0, 'http://localhost/thebrowncurves/2021/05/13/0776580c-13f0-4b55-96a1-cb2dc2faae9c/', 0, 'customize_changeset', '', 0),
(17, 1, '2021-05-13 19:24:28', '2021-05-13 19:24:28', '{\n    \"blogdescription\": {\n        \"value\": \"\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-05-13 19:24:28\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', '795dcf99-cf59-467a-9d6f-9f3f34f0479b', '', '', '2021-05-13 19:24:28', '2021-05-13 19:24:28', '', 0, 'http://localhost/thebrowncurves/2021/05/13/795dcf99-cf59-467a-9d6f-9f3f34f0479b/', 0, 'customize_changeset', '', 0),
(18, 1, '2021-05-14 05:12:05', '2021-05-14 05:12:05', '', 'Blog', '', 'publish', 'closed', 'closed', '', 'blog', '', '', '2021-05-14 05:12:06', '2021-05-14 05:12:06', '', 0, 'http://localhost/thebrowncurves/?page_id=18', 0, 'page', '', 0),
(19, 1, '2021-05-14 05:12:06', '2021-05-14 05:12:06', '', 'Blog', '', 'inherit', 'closed', 'closed', '', '18-revision-v1', '', '', '2021-05-14 05:12:06', '2021-05-14 05:12:06', '', 18, 'http://localhost/thebrowncurves/?p=19', 0, 'revision', '', 0),
(20, 1, '2021-05-14 05:12:31', '2021-05-14 05:12:31', '{\n    \"page_for_posts\": {\n        \"value\": \"18\",\n        \"type\": \"option\",\n        \"user_id\": 1,\n        \"date_modified_gmt\": \"2021-05-14 05:12:31\"\n    }\n}', '', '', 'trash', 'closed', 'closed', '', 'fe632537-046d-4e8d-87d2-e4781be6799b', '', '', '2021-05-14 05:12:31', '2021-05-14 05:12:31', '', 0, 'http://localhost/thebrowncurves/2021/05/14/fe632537-046d-4e8d-87d2-e4781be6799b/', 0, 'customize_changeset', '', 0),
(21, 1, '2021-05-14 05:25:58', '2021-05-14 05:25:58', '', 'Contact Us', '', 'publish', 'closed', 'closed', '', 'contact-us', '', '', '2021-05-14 18:35:01', '2021-05-14 18:35:01', '', 0, 'http://localhost/thebrowncurves/?page_id=21', 0, 'page', '', 0),
(22, 1, '2021-05-14 05:25:58', '2021-05-14 05:25:58', '', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '21-revision-v1', '', '', '2021-05-14 05:25:58', '2021-05-14 05:25:58', '', 21, 'http://localhost/thebrowncurves/?p=22', 0, 'revision', '', 0),
(23, 1, '2021-05-14 05:35:09', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2021-05-14 05:35:09', '0000-00-00 00:00:00', '', 0, 'http://localhost/thebrowncurves/?page_id=23', 0, 'page', '', 0),
(24, 1, '2021-05-14 05:35:35', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2021-05-14 05:35:35', '0000-00-00 00:00:00', '', 0, 'http://localhost/thebrowncurves/?page_id=24', 0, 'page', '', 0),
(25, 1, '2021-05-14 05:36:07', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2021-05-14 05:36:07', '0000-00-00 00:00:00', '', 0, 'http://localhost/thebrowncurves/?page_id=25', 0, 'page', '', 0),
(26, 1, '2021-05-14 05:36:58', '2021-05-14 05:36:58', '', 'About Us', '', 'publish', 'closed', 'closed', '', 'about-us', '', '', '2021-05-14 18:55:57', '2021-05-14 18:55:57', '', 0, 'http://localhost/thebrowncurves/?page_id=26', 0, 'page', '', 0),
(27, 1, '2021-05-14 05:36:58', '2021-05-14 05:36:58', '', 'About Us', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2021-05-14 05:36:58', '2021-05-14 05:36:58', '', 26, 'http://localhost/thebrowncurves/?p=27', 0, 'revision', '', 0),
(28, 1, '2021-05-14 18:07:39', '2021-05-14 18:07:39', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:4:\"page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:2:\"21\";}}}s:8:\"position\";s:4:\"side\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'Contact Page', 'contact-page', 'publish', 'closed', 'closed', '', 'group_609ebb800a10f', '', '', '2021-05-14 18:33:29', '2021-05-14 18:33:29', '', 0, 'http://localhost/thebrowncurves/?post_type=acf-field-group&#038;p=28', 0, 'acf-field-group', '', 0),
(29, 1, '2021-05-14 18:07:39', '2021-05-14 18:07:39', 'a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:1;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:0:\"\";}', 'Address', 'address', 'publish', 'closed', 'closed', '', 'field_609ebb86e7821', '', '', '2021-05-14 18:07:39', '2021-05-14 18:07:39', '', 28, 'http://localhost/thebrowncurves/?post_type=acf-field&p=29', 0, 'acf-field', '', 0),
(30, 1, '2021-05-14 18:07:39', '2021-05-14 18:07:39', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:1;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Primary Number', 'primary_number', 'publish', 'closed', 'closed', '', 'field_609ebbafe7822', '', '', '2021-05-14 18:07:39', '2021-05-14 18:07:39', '', 28, 'http://localhost/thebrowncurves/?post_type=acf-field&p=30', 1, 'acf-field', '', 0),
(31, 1, '2021-05-14 18:07:39', '2021-05-14 18:07:39', 'a:10:{s:4:\"type\";s:4:\"text\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";}', 'Secondary Number', 'secondary_number', 'publish', 'closed', 'closed', '', 'field_609ebbc8e7823', '', '', '2021-05-14 18:07:39', '2021-05-14 18:07:39', '', 28, 'http://localhost/thebrowncurves/?post_type=acf-field&p=31', 2, 'acf-field', '', 0),
(32, 1, '2021-05-14 18:07:39', '2021-05-14 18:07:39', 'a:9:{s:4:\"type\";s:5:\"email\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:1;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:7:\"prepend\";s:0:\"\";s:6:\"append\";s:0:\"\";}', 'Email', 'email', 'publish', 'closed', 'closed', '', 'field_609ebbe3e7824', '', '', '2021-05-14 18:07:39', '2021-05-14 18:07:39', '', 28, 'http://localhost/thebrowncurves/?post_type=acf-field&p=32', 3, 'acf-field', '', 0),
(33, 1, '2021-05-14 18:07:39', '2021-05-14 18:07:39', 'a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:1;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}', 'Website Link', 'website_link', 'publish', 'closed', 'closed', '', 'field_609ebbf6e7825', '', '', '2021-05-14 18:07:39', '2021-05-14 18:07:39', '', 28, 'http://localhost/thebrowncurves/?post_type=acf-field&p=33', 4, 'acf-field', '', 0),
(34, 1, '2021-05-14 18:09:14', '2021-05-14 18:09:14', '', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '21-revision-v1', '', '', '2021-05-14 18:09:14', '2021-05-14 18:09:14', '', 21, 'http://localhost/thebrowncurves/?p=34', 0, 'revision', '', 0),
(35, 1, '2021-05-14 18:28:03', '2021-05-14 18:28:03', 'a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}', 'Instagram', 'instagram', 'publish', 'closed', 'closed', '', 'field_609ec0ff5e087', '', '', '2021-05-14 18:33:29', '2021-05-14 18:33:29', '', 28, 'http://localhost/thebrowncurves/?post_type=acf-field&#038;p=35', 5, 'acf-field', '', 0),
(36, 1, '2021-05-14 18:28:03', '2021-05-14 18:28:03', 'a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}', 'Facebook', 'facebook', 'publish', 'closed', 'closed', '', 'field_609ec1115e088', '', '', '2021-05-14 18:28:03', '2021-05-14 18:28:03', '', 28, 'http://localhost/thebrowncurves/?post_type=acf-field&p=36', 6, 'acf-field', '', 0),
(37, 1, '2021-05-14 18:28:03', '2021-05-14 18:28:03', 'a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}', 'Twitter', 'twitter', 'publish', 'closed', 'closed', '', 'field_609ec11e5e089', '', '', '2021-05-14 18:28:03', '2021-05-14 18:28:03', '', 28, 'http://localhost/thebrowncurves/?post_type=acf-field&p=37', 7, 'acf-field', '', 0),
(38, 1, '2021-05-14 18:29:16', '2021-05-14 18:29:16', '', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '21-revision-v1', '', '', '2021-05-14 18:29:16', '2021-05-14 18:29:16', '', 21, 'http://localhost/thebrowncurves/?p=38', 0, 'revision', '', 0),
(39, 1, '2021-05-14 18:34:37', '2021-05-14 18:34:37', '', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '21-revision-v1', '', '', '2021-05-14 18:34:37', '2021-05-14 18:34:37', '', 21, 'http://localhost/thebrowncurves/?p=39', 0, 'revision', '', 0),
(40, 1, '2021-05-14 18:35:01', '2021-05-14 18:35:01', '', 'Contact Us', '', 'inherit', 'closed', 'closed', '', '21-revision-v1', '', '', '2021-05-14 18:35:01', '2021-05-14 18:35:01', '', 21, 'http://localhost/thebrowncurves/?p=40', 0, 'revision', '', 0),
(41, 1, '2021-05-14 18:43:46', '2021-05-14 18:43:46', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:4:\"page\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:2:\"26\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'About Page', 'about-page', 'publish', 'closed', 'closed', '', 'group_609ec3f3aa5bd', '', '', '2021-05-14 18:52:19', '2021-05-14 18:52:19', '', 0, 'http://localhost/thebrowncurves/?post_type=acf-field-group&#038;p=41', 0, 'acf-field-group', '', 0),
(42, 1, '2021-05-14 18:43:46', '2021-05-14 18:43:46', 'a:10:{s:4:\"type\";s:8:\"textarea\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:1;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";s:9:\"maxlength\";s:0:\"\";s:4:\"rows\";s:0:\"\";s:9:\"new_lines\";s:2:\"br\";}', 'About Content', 'about_content', 'publish', 'closed', 'closed', '', 'field_609ec3faf4a66', '', '', '2021-05-14 18:52:19', '2021-05-14 18:52:19', '', 41, 'http://localhost/thebrowncurves/?post_type=acf-field&#038;p=42', 0, 'acf-field', '', 0),
(43, 1, '2021-05-14 18:43:46', '2021-05-14 18:43:46', 'a:15:{s:4:\"type\";s:5:\"image\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"return_format\";s:3:\"url\";s:12:\"preview_size\";s:4:\"full\";s:7:\"library\";s:3:\"all\";s:9:\"min_width\";s:0:\"\";s:10:\"min_height\";s:0:\"\";s:8:\"min_size\";s:0:\"\";s:9:\"max_width\";s:0:\"\";s:10:\"max_height\";s:0:\"\";s:8:\"max_size\";s:0:\"\";s:10:\"mime_types\";s:0:\"\";}', 'About Banner', 'about_banner', 'publish', 'closed', 'closed', '', 'field_609ec426f4a67', '', '', '2021-05-14 18:43:46', '2021-05-14 18:43:46', '', 41, 'http://localhost/thebrowncurves/?post_type=acf-field&p=43', 1, 'acf-field', '', 0),
(44, 1, '2021-05-14 18:45:53', '2021-05-14 18:45:53', '', 'about-us', '', 'inherit', 'open', 'closed', '', 'about-us-2', '', '', '2021-05-14 18:45:53', '2021-05-14 18:45:53', '', 26, 'http://localhost/thebrowncurves/wp-content/uploads/2021/05/about-us.jpg', 0, 'attachment', 'image/jpeg', 0),
(45, 1, '2021-05-14 18:46:13', '2021-05-14 18:46:13', '', 'About Us', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2021-05-14 18:46:13', '2021-05-14 18:46:13', '', 26, 'http://localhost/thebrowncurves/?p=45', 0, 'revision', '', 0),
(46, 1, '2021-05-14 18:49:41', '2021-05-14 18:49:41', '', 'About Us', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2021-05-14 18:49:41', '2021-05-14 18:49:41', '', 26, 'http://localhost/thebrowncurves/?p=46', 0, 'revision', '', 0),
(47, 1, '2021-05-14 18:50:53', '2021-05-14 18:50:53', '', 'About Us', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2021-05-14 18:50:53', '2021-05-14 18:50:53', '', 26, 'http://localhost/thebrowncurves/?p=47', 0, 'revision', '', 0),
(48, 1, '2021-05-14 18:55:44', '2021-05-14 18:55:44', '', 'about-us-title-image', '', 'inherit', 'open', 'closed', '', 'about-us-title-image', '', '', '2021-05-14 18:55:44', '2021-05-14 18:55:44', '', 26, 'http://localhost/thebrowncurves/wp-content/uploads/2021/05/about-us-title-image.png', 0, 'attachment', 'image/png', 0),
(49, 1, '2021-05-14 18:55:57', '2021-05-14 18:55:57', '', 'About Us', '', 'inherit', 'closed', 'closed', '', '26-revision-v1', '', '', '2021-05-14 18:55:57', '2021-05-14 18:55:57', '', 26, 'http://localhost/thebrowncurves/?p=49', 0, 'revision', '', 0),
(50, 1, '2021-05-16 08:58:52', '2021-05-16 08:58:52', '<!-- wp:shortcode -->\n[fts_instagram instagram_id=17841403833133298 access_token=IGQVJWRWQ0R2lSQm1wLTI2R3Q3T0VsS1FzRnhHNzc4cWRJN1BRRWVCSHVUaWZAOQ215VzR5OUpicmc1SGRHVFBoLUxZAUGExSXFrRFN3RTBpSVV5b0I0S0o2OTFLQ1BjR1JLWmdzQnBn pics_count=6 type=basic super_gallery=yes columns=3 force_columns=no space_between_photos=1px icon_size=65px hide_date_likes_comments=no]\n<!-- /wp:shortcode -->', 'Home', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2021-05-16 08:58:52', '2021-05-16 08:58:52', '', 5, 'http://localhost/thebrowncurves/?p=50', 0, 'revision', '', 0),
(51, 1, '2021-05-16 08:59:40', '2021-05-16 08:59:40', '<!-- wp:shortcode /-->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Home', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2021-05-16 08:59:40', '2021-05-16 08:59:40', '', 5, 'http://localhost/thebrowncurves/?p=51', 0, 'revision', '', 0),
(53, 1, '2021-05-16 09:04:07', '2021-05-16 09:04:07', '', 'Home', '', 'inherit', 'closed', 'closed', '', '5-revision-v1', '', '', '2021-05-16 09:04:07', '2021-05-16 09:04:07', '', 5, 'http://localhost/thebrowncurves/?p=53', 0, 'revision', '', 0),
(54, 1, '2021-05-16 13:25:54', '2021-05-16 13:25:54', '<label> Your name\n    [text* your-name] </label>\n\n<label> Your email\n    [email* your-email] </label>\n\n<label> Subject\n    [text* your-subject] </label>\n\n<label> Your message (optional)\n    [textarea your-message] </label>\n\n[submit \"Submit\"]\n[_site_title] \"[your-subject]\"\n[_site_title] <giribhagirath169@gmail.com>\nFrom: [your-name] <[your-email]>\nSubject: [your-subject]\n\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\n[_site_admin_email]\nReply-To: [your-email]\n\n0\n0\n\n[_site_title] \"[your-subject]\"\n[_site_title] <giribhagirath169@gmail.com>\nMessage Body:\n[your-message]\n\n-- \nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\n[your-email]\nReply-To: [_site_admin_email]\n\n0\n0\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nThe field is required.\nThe field is too long.\nThe field is too short.\nThere was an unknown error uploading the file.\nYou are not allowed to upload files of this type.\nThe file is too big.\nThere was an error uploading the file.', 'Contact form 1', '', 'publish', 'closed', 'closed', '', 'contact-form-1', '', '', '2021-05-16 13:25:54', '2021-05-16 13:25:54', '', 0, 'http://localhost/thebrowncurves/?post_type=wpcf7_contact_form&p=54', 0, 'wpcf7_contact_form', '', 0),
(55, 1, '2021-05-16 13:37:04', '2021-05-16 13:37:04', '<div class=\"row\">\r\n                                    <div class=\"col-lg-6\">\r\n                                        <div class=\"contact-form-style mb-20\">\r\n[text* user_name placeholder \"Enter your full name\"]\r\n                                        </div>\r\n                                    </div>\r\n                                    <div class=\"col-lg-6\">\r\n                                        <div class=\"contact-form-style mb-20\">\r\n                                          [email* user_email placeholder \"Enter your email\"]\r\n                                        </div>\r\n                                    </div>\r\n                                    <div class=\"col-lg-12\">\r\n                                        <div class=\"contact-form-style mb-20\">\r\n[text* user_subject placeholder \"Enter your subject here\"]\r\n                                        </div>\r\n                                    </div>\r\n                                    <div class=\"col-lg-12\">\r\n                                        <div class=\"contact-form-style\">\r\n                                           [textarea* user_message placeholder \"Enter your address here\"]\r\n                                            [submit class:submit class:cr-btn class:btn-style class:submit-btn \"Send Message\"]\r\n                                        </div>\r\n                                    </div>\r\n                                </div>\n1\n[user_subject]\n[user_name] <thebrowncurves@gmail.com>\nthebrowncurves@gmail.com\nFrom: [user_name] <[user_email]>\r\nSubject: [user_subject]\r\n\r\nMessage Body:\r\n[user_message]\r\n\r\n-- \r\nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\nReply-To: [user_email]\n\n\n\n\n[_site_title] \"[your-subject]\"\n[_site_title] <giribhagirath169@gmail.com>\n[your-email]\nMessage Body:\r\n[your-message]\r\n\r\n-- \r\nThis e-mail was sent from a contact form on [_site_title] ([_site_url])\nReply-To: [_site_admin_email]\n\n\n\nThank you for your message. It has been sent.\nThere was an error trying to send your message. Please try again later.\nOne or more fields have an error. Please check and try again.\nThere was an error trying to send your message. Please try again later.\nYou must accept the terms and conditions before sending your message.\nThe field is required.\nThe field is too long.\nThe field is too short.\nThere was an unknown error uploading the file.\nYou are not allowed to upload files of this type.\nThe file is too big.\nThere was an error uploading the file.\nThe date format is incorrect.\nThe date is before the earliest one allowed.\nThe date is after the latest one allowed.\nThe number format is invalid.\nThe number is smaller than the minimum allowed.\nThe number is larger than the maximum allowed.\nThe answer to the quiz is incorrect.\nThe e-mail address entered is invalid.\nThe URL is invalid.\nThe telephone number is invalid.', 'Contact Page', '', 'publish', 'closed', 'closed', '', 'contact-page', '', '', '2021-05-16 19:28:44', '2021-05-16 19:28:44', '', 0, 'http://localhost/thebrowncurves/?post_type=wpcf7_contact_form&#038;p=55', 0, 'wpcf7_contact_form', '', 0),
(56, 1, '2021-05-16 17:34:10', '2021-05-16 17:34:10', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:4:\"post\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'Our Projects', 'our-projects', 'trash', 'closed', 'closed', '', 'group_60a15726af55f__trashed', '', '', '2021-05-16 17:35:56', '2021-05-16 17:35:56', '', 0, 'http://localhost/thebrowncurves/?post_type=acf-field-group&#038;p=56', 0, 'acf-field-group', '', 0),
(57, 1, '2021-05-16 17:34:10', '2021-05-16 17:34:10', 'a:12:{s:4:\"type\";s:8:\"checkbox\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:0;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:7:\"choices\";a:1:{s:3:\"yes\";s:3:\"Yes\";}s:12:\"allow_custom\";i:0;s:13:\"default_value\";a:0:{}s:6:\"layout\";s:8:\"vertical\";s:6:\"toggle\";i:0;s:13:\"return_format\";s:5:\"value\";s:11:\"save_custom\";i:0;}', 'Is Project?', 'is_project', 'trash', 'closed', 'closed', '', 'field_60a1573e0c98f__trashed', '', '', '2021-05-16 17:35:56', '2021-05-16 17:35:56', '', 56, 'http://localhost/thebrowncurves/?post_type=acf-field&#038;p=57', 0, 'acf-field', '', 0),
(58, 1, '2021-05-16 17:34:23', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'open', 'open', '', '', '', '', '2021-05-16 17:34:23', '0000-00-00 00:00:00', '', 0, 'http://localhost/thebrowncurves/?p=58', 0, 'post', '', 0),
(59, 1, '2021-05-16 17:38:48', '2021-05-16 17:38:48', '<!-- wp:paragraph -->\n<p>lorem ispum lorem ispum lorem ispum lorem ispum lorem ispum lorem ispum </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>lorem ispum lorem ispum lorem ispum lorem ispum lorem ispum lorem ispum</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>lorem ispum lorem ispum lorem ispum lorem ispum lorem ispum lorem ispum</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>lorem ispum lorem ispum lorem ispum lorem ispum lorem ispum lorem ispum</p>\n<!-- /wp:paragraph -->', 'Testing the first Project', '', 'publish', 'open', 'open', '', 'testing-the-first-project', '', '', '2021-05-16 18:13:23', '2021-05-16 18:13:23', '', 0, 'http://localhost/thebrowncurves/?p=59', 0, 'post', '', 4),
(60, 1, '2021-05-16 17:38:48', '2021-05-16 17:38:48', '<!-- wp:paragraph -->\n<p>lorem ispum lorem ispum lorem ispum lorem ispum lorem ispum lorem ispum </p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>lorem ispum lorem ispum lorem ispum lorem ispum lorem ispum lorem ispum</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>lorem ispum lorem ispum lorem ispum lorem ispum lorem ispum lorem ispum</p>\n<!-- /wp:paragraph -->\n\n<!-- wp:paragraph -->\n<p>lorem ispum lorem ispum lorem ispum lorem ispum lorem ispum lorem ispum</p>\n<!-- /wp:paragraph -->', 'Testing the first Project', '', 'inherit', 'closed', 'closed', '', '59-revision-v1', '', '', '2021-05-16 17:38:48', '2021-05-16 17:38:48', '', 59, 'http://localhost/thebrowncurves/?p=60', 0, 'revision', '', 0),
(61, 1, '2021-05-16 18:04:50', '2021-05-16 18:04:50', '<!-- wp:paragraph -->\n<p>Welcome to WordPress. This is your first post. Edit or delete it, then start writing!</p>\n<!-- /wp:paragraph -->', 'Hello world!', '', 'inherit', 'closed', 'closed', '', '1-revision-v1', '', '', '2021-05-16 18:04:50', '2021-05-16 18:04:50', '', 1, 'http://localhost/thebrowncurves/?p=61', 0, 'revision', '', 0),
(62, 1, '2021-05-16 18:12:24', '2021-05-16 18:12:24', '', 'RB Teach Solution Interior', '', 'publish', 'open', 'open', '', 'rb-teach-solution-interior', '', '', '2021-05-16 18:12:46', '2021-05-16 18:12:46', '', 0, 'http://localhost/thebrowncurves/?p=62', 0, 'post', '', 0),
(63, 1, '2021-05-16 18:12:18', '2021-05-16 18:12:18', '', 'ig-1', '', 'inherit', 'open', 'closed', '', 'ig-1', '', '', '2021-05-16 18:12:18', '2021-05-16 18:12:18', '', 62, 'http://localhost/thebrowncurves/wp-content/uploads/2021/05/ig-1.jpg', 0, 'attachment', 'image/jpeg', 0),
(64, 1, '2021-05-16 18:12:24', '2021-05-16 18:12:24', '', 'RB Teach Solution Interior', '', 'inherit', 'closed', 'closed', '', '62-revision-v1', '', '', '2021-05-16 18:12:24', '2021-05-16 18:12:24', '', 62, 'http://localhost/thebrowncurves/?p=64', 0, 'revision', '', 0),
(65, 1, '2021-05-16 18:13:20', '2021-05-16 18:13:20', '', 'ig-2', '', 'inherit', 'open', 'closed', '', 'ig-2', '', '', '2021-05-16 18:13:20', '2021-05-16 18:13:20', '', 59, 'http://localhost/thebrowncurves/wp-content/uploads/2021/05/ig-2.jpg', 0, 'attachment', 'image/jpeg', 0),
(66, 1, '2021-05-16 19:10:08', '2021-05-16 19:10:08', '', 'Default Form', '', 'publish', 'closed', 'closed', '', 'default-form', '', '', '2021-05-16 19:20:04', '2021-05-16 19:20:04', '', 0, 'http://localhost/thebrowncurves/?p=66', 0, 'wpdiscuz_form', '', 0),
(67, 1, '2021-05-17 11:14:17', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2021-05-17 11:14:17', '0000-00-00 00:00:00', '', 0, 'http://localhost/thebrowncurves/?post_type=testimonial&p=67', 0, 'testimonial', '', 0),
(68, 1, '2021-05-17 11:16:04', '2021-05-17 11:16:04', '<!-- wp:paragraph -->\n<p><strong>L</strong>orem Ipsum is simply dummied text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book. </p>\n<!-- /wp:paragraph -->', 'Testing', '', 'publish', 'closed', 'closed', '', 'testing', '', '', '2021-05-17 13:38:19', '2021-05-17 13:38:19', '', 0, 'http://localhost/thebrowncurves/?post_type=testimonial&#038;p=68', 0, 'testimonial', '', 0),
(69, 1, '2021-05-17 11:18:12', '2021-05-17 11:18:12', '', 'Testimonials', '', 'publish', 'closed', 'closed', '', 'testimonials', '', '', '2021-05-17 11:18:12', '2021-05-17 11:18:12', '', 0, 'http://localhost/thebrowncurves/?page_id=69', 0, 'page', '', 0),
(70, 1, '2021-05-17 11:18:12', '2021-05-17 11:18:12', '', 'Testimonials', '', 'inherit', 'closed', 'closed', '', '69-revision-v1', '', '', '2021-05-17 11:18:12', '2021-05-17 11:18:12', '', 69, 'http://localhost/thebrowncurves/?p=70', 0, 'revision', '', 0),
(71, 1, '2021-05-17 11:25:30', '2021-05-17 11:25:30', '<!-- wp:paragraph -->\n<p><strong>L</strong>orem Ipsum is simply dummied text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s when an unknown printer took a galley of type and scrambled it to make a type specimen book. </p>\n<!-- /wp:paragraph -->', 'Testing 2', '', 'publish', 'closed', 'closed', '', 'testing-2', '', '', '2021-05-17 13:38:08', '2021-05-17 13:38:08', '', 0, 'http://localhost/thebrowncurves/?post_type=testimonial&#038;p=71', 0, 'testimonial', '', 0),
(72, 1, '2021-05-17 13:40:48', '2021-05-17 13:40:48', '[newsletter]', 'Newsletter', '', 'publish', 'closed', 'closed', '', 'newsletter', '', '', '2021-05-17 13:40:48', '2021-05-17 13:40:48', '', 0, 'http://localhost/thebrowncurves/newsletter/', 0, 'page', '', 0),
(73, 1, '2021-05-17 14:13:32', '0000-00-00 00:00:00', '', '', '', 'draft', 'closed', 'closed', '', 'sp-template-default-style', '', '', '2021-05-17 14:13:32', '0000-00-00 00:00:00', '', 0, 'http://localhost/thebrowncurves/?post_type=sptemplates&p=73', 0, 'sptemplates', '', 0),
(74, 1, '2021-05-17 14:13:32', '0000-00-00 00:00:00', 'Howdy.\n\n		We\'re ready to send you emails from *|SITE:TITLE|*, but first we need you to confirm that this is what you really want.\n\n		If you want *|SITE:TITLE|* content delivered by email, all you have to do is click the link below. Thanks!\n\n		-----------------------------------------------------------\n		CONFIRM BY VISITING THE LINK BELOW:\n\n		*|SP:CONFIRMLINK|*\n\n		Click the link above to give us permission to send you\n		information.  It\'s fast and easy!  If you cannot click the\n		full URL above, please copy and paste it into your web\n		browser.\n\n		-----------------------------------------------------------\n		If you do not want to confirm, simply ignore this message.\n		', 'Please respond to join the *|SITE:TITLE|* email list.', '', 'draft', 'closed', 'closed', '', 'sp-template-double-optin', '', '', '2021-05-17 14:13:32', '2021-05-17 14:13:32', '', 0, 'http://localhost/thebrowncurves/?post_type=sptemplates&#038;p=74', 0, 'sptemplates', '', 0),
(75, 1, '2021-05-17 14:13:32', '2021-05-17 14:13:32', '{\"guid\":\"cd8ab466-e236-49d3-bd6c-e84db055ae9a\",\"path\":\"templates/v1-0/master.html\",\"name\":\"Responsive Starter\",\"status\":\"sp-standard\"}', 'Responsive Starter', '', 'sp-standard', 'closed', 'closed', '', 'antwort', '', '', '2021-05-17 14:13:32', '2021-05-17 14:13:32', '', 0, 'http://localhost/thebrowncurves/?post_type=sp_template&p=75', 0, 'sp_template', '', 0),
(76, 1, '2021-05-17 14:13:32', '2021-05-17 14:13:32', '{\"guid\":\"cd8ab467-e236-49d3-bd6c-e84db055ae9a\",\"path\":\"templates/v1-0/master.html\",\"name\":\"System Starter\",\"status\":\"sp-standard\"}', 'System Starter', '', 'sp-standard', 'closed', 'closed', '', 'system-base', '', '', '2021-05-17 14:13:32', '2021-05-17 14:13:32', '', 0, 'http://localhost/thebrowncurves/?post_type=sp_template&p=76', 0, 'sp_template', '', 0),
(77, 1, '2021-05-17 14:15:57', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2021-05-17 14:15:57', '0000-00-00 00:00:00', '', 0, 'http://localhost/thebrowncurves/?post_type=sp_newsletters&p=77', 0, 'sp_newsletters', '', 0),
(78, 1, '2021-05-17 14:34:05', '0000-00-00 00:00:00', '', 'Auto Draft', '', 'auto-draft', 'closed', 'closed', '', '', '', '', '2021-05-17 14:34:05', '0000-00-00 00:00:00', '', 0, 'http://localhost/thebrowncurves/?post_type=slider&p=78', 0, 'slider', '', 0),
(79, 1, '2021-05-17 14:40:33', '2021-05-17 14:40:33', '<!-- wp:preformatted -->\n<pre class=\"wp-block-preformatted\">New \nProducts Here</pre>\n<!-- /wp:preformatted -->\n\n<!-- wp:paragraph -->\n<p></p>\n<!-- /wp:paragraph -->', 'Hand-Made Product', '', 'publish', 'closed', 'closed', '', 'hand-made-product', '', '', '2021-05-17 15:31:09', '2021-05-17 15:31:09', '', 0, 'http://localhost/thebrowncurves/?post_type=slider&#038;p=79', 0, 'slider', '', 0),
(81, 1, '2021-05-17 15:07:30', '2021-05-17 15:07:30', 'a:7:{s:8:\"location\";a:1:{i:0;a:1:{i:0;a:3:{s:5:\"param\";s:9:\"post_type\";s:8:\"operator\";s:2:\"==\";s:5:\"value\";s:6:\"slider\";}}}s:8:\"position\";s:6:\"normal\";s:5:\"style\";s:7:\"default\";s:15:\"label_placement\";s:3:\"top\";s:21:\"instruction_placement\";s:5:\"label\";s:14:\"hide_on_screen\";s:0:\"\";s:11:\"description\";s:0:\"\";}', 'Slider', 'slider', 'publish', 'closed', 'closed', '', 'group_60a2866b57ed8', '', '', '2021-05-17 15:07:30', '2021-05-17 15:07:30', '', 0, 'http://localhost/thebrowncurves/?post_type=acf-field-group&#038;p=81', 0, 'acf-field-group', '', 0),
(82, 1, '2021-05-17 15:07:30', '2021-05-17 15:07:30', 'a:7:{s:4:\"type\";s:3:\"url\";s:12:\"instructions\";s:0:\"\";s:8:\"required\";i:1;s:17:\"conditional_logic\";i:0;s:7:\"wrapper\";a:3:{s:5:\"width\";s:0:\"\";s:5:\"class\";s:0:\"\";s:2:\"id\";s:0:\"\";}s:13:\"default_value\";s:0:\"\";s:11:\"placeholder\";s:0:\"\";}', 'Redirect URL', 'redirect_url', 'publish', 'closed', 'closed', '', 'field_60a2869101145', '', '', '2021-05-17 15:07:30', '2021-05-17 15:07:30', '', 81, 'http://localhost/thebrowncurves/?post_type=acf-field&p=82', 0, 'acf-field', '', 0),
(84, 1, '2021-05-17 15:33:52', '2021-05-17 15:33:52', '', 'woocommerce-placeholder', '', 'inherit', 'open', 'closed', '', 'woocommerce-placeholder', '', '', '2021-05-17 15:33:52', '2021-05-17 15:33:52', '', 0, 'http://localhost/thebrowncurves/wp-content/uploads/2021/05/woocommerce-placeholder.png', 0, 'attachment', 'image/png', 0),
(85, 1, '2021-05-17 15:33:53', '2021-05-17 15:33:53', '', 'Shop', '', 'publish', 'closed', 'closed', '', 'shop', '', '', '2021-05-17 15:33:53', '2021-05-17 15:33:53', '', 0, 'http://localhost/thebrowncurves/shop/', 0, 'page', '', 0),
(86, 1, '2021-05-17 15:33:53', '2021-05-17 15:33:53', '<!-- wp:shortcode -->[woocommerce_cart]<!-- /wp:shortcode -->', 'Cart', '', 'publish', 'closed', 'closed', '', 'cart', '', '', '2021-05-17 15:33:53', '2021-05-17 15:33:53', '', 0, 'http://localhost/thebrowncurves/cart/', 0, 'page', '', 0),
(87, 1, '2021-05-17 15:33:53', '2021-05-17 15:33:53', '<!-- wp:shortcode -->[woocommerce_checkout]<!-- /wp:shortcode -->', 'Checkout', '', 'publish', 'closed', 'closed', '', 'checkout', '', '', '2021-05-17 15:33:53', '2021-05-17 15:33:53', '', 0, 'http://localhost/thebrowncurves/checkout/', 0, 'page', '', 0),
(88, 1, '2021-05-17 15:33:53', '2021-05-17 15:33:53', '<!-- wp:shortcode -->[woocommerce_my_account]<!-- /wp:shortcode -->', 'My account', '', 'publish', 'closed', 'closed', '', 'my-account', '', '', '2021-05-17 15:33:53', '2021-05-17 15:33:53', '', 0, 'http://localhost/thebrowncurves/my-account/', 0, 'page', '', 0),
(89, 1, '2021-05-17 16:38:58', '0000-00-00 00:00:00', '', 'AUTO-DRAFT', '', 'auto-draft', 'open', 'closed', '', '', '', '', '2021-05-17 16:38:58', '0000-00-00 00:00:00', '', 0, 'http://localhost/thebrowncurves/?post_type=product&p=89', 0, 'product', '', 0),
(90, 1, '2021-05-17 16:42:21', '2021-05-17 16:42:21', 'Testing the product', 'Testing', '', 'publish', 'open', 'closed', '', 'testing', '', '', '2021-05-17 16:42:22', '2021-05-17 16:42:22', '', 0, 'http://localhost/thebrowncurves/?post_type=product&#038;p=90', 0, 'product', '', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbc_sendpress_autoresponders`
--

CREATE TABLE `tbc_sendpress_autoresponders` (
  `post_id` int(11) UNSIGNED NOT NULL,
  `delay_time` int(11) UNSIGNED NOT NULL,
  `action_type` int(11) UNSIGNED NOT NULL,
  `list_id` int(11) DEFAULT 0,
  `when_to_send` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_sendpress_connections`
--

CREATE TABLE `tbc_sendpress_connections` (
  `connection_id` int(11) UNSIGNED NOT NULL,
  `api_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_sendpress_customfields`
--

CREATE TABLE `tbc_sendpress_customfields` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `old_slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `allow_edit` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_sendpress_list_subscribers`
--

CREATE TABLE `tbc_sendpress_list_subscribers` (
  `id` int(11) UNSIGNED NOT NULL,
  `listID` bigint(20) DEFAULT NULL,
  `subscriberID` int(11) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_sendpress_queue`
--

CREATE TABLE `tbc_sendpress_queue` (
  `id` int(11) NOT NULL,
  `subscriberID` int(11) DEFAULT NULL,
  `listID` bigint(20) DEFAULT NULL,
  `from_name` varchar(64) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `to_email` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `messageID` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `emailID` int(11) NOT NULL,
  `max_attempts` int(11) NOT NULL DEFAULT 3,
  `attempts` int(11) NOT NULL DEFAULT 0,
  `success` tinyint(1) NOT NULL DEFAULT 0,
  `date_published` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `inprocess` int(1) DEFAULT 0,
  `last_attempt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_sent` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_sendpress_schedules`
--

CREATE TABLE `tbc_sendpress_schedules` (
  `post_id` int(11) UNSIGNED NOT NULL,
  `email_id` int(11) UNSIGNED NOT NULL,
  `when_to_send` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `active` int(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_sendpress_subscribers`
--

CREATE TABLE `tbc_sendpress_subscribers` (
  `subscriberID` bigint(20) UNSIGNED NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `join_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` int(1) NOT NULL DEFAULT 1,
  `registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `registered_ip` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `identity_key` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `bounced` int(1) NOT NULL DEFAULT 0,
  `firstname` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `lastname` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `wp_user_id` bigint(20) DEFAULT NULL,
  `phonenumber` varchar(12) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `salutation` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_sendpress_subscribers_meta`
--

CREATE TABLE `tbc_sendpress_subscribers_meta` (
  `smeta_id` bigint(20) UNSIGNED NOT NULL,
  `subscriberID` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `listID` bigint(20) UNSIGNED DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_sendpress_subscribers_status`
--

CREATE TABLE `tbc_sendpress_subscribers_status` (
  `statusid` int(11) UNSIGNED NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_sendpress_subscribers_status`
--

INSERT INTO `tbc_sendpress_subscribers_status` (`statusid`, `status`) VALUES
(1, 'Unconfirmed'),
(2, 'Active'),
(3, 'Unsubscribed'),
(4, 'Bounced');

-- --------------------------------------------------------

--
-- Table structure for table `tbc_sendpress_subscribers_tracker`
--

CREATE TABLE `tbc_sendpress_subscribers_tracker` (
  `subscriber_id` int(11) UNSIGNED NOT NULL,
  `email_id` int(11) UNSIGNED NOT NULL,
  `sent_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `opened_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `tracker_type` tinyint(4) NOT NULL DEFAULT 0,
  `opened_count` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_sendpress_subscribers_url`
--

CREATE TABLE `tbc_sendpress_subscribers_url` (
  `subscriber_id` int(11) UNSIGNED NOT NULL,
  `email_id` int(11) UNSIGNED NOT NULL,
  `url_id` int(11) UNSIGNED NOT NULL,
  `clicked_at` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `click_count` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_sendpress_url`
--

CREATE TABLE `tbc_sendpress_url` (
  `url_id` int(11) UNSIGNED NOT NULL,
  `url` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_termmeta`
--

CREATE TABLE `tbc_termmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_termmeta`
--

INSERT INTO `tbc_termmeta` (`meta_id`, `term_id`, `meta_key`, `meta_value`) VALUES
(1, 20, 'product_count_product_cat', '1');

-- --------------------------------------------------------

--
-- Table structure for table `tbc_terms`
--

CREATE TABLE `tbc_terms` (
  `term_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_terms`
--

INSERT INTO `tbc_terms` (`term_id`, `name`, `slug`, `term_group`) VALUES
(1, 'Uncategorized', 'uncategorized', 0),
(2, 'Projects', 'projects', 0),
(3, 'sending', 'sending', 0),
(4, 'error', 'error', 0),
(5, 'event', 'event', 0),
(6, 'api_request', 'api_request', 0),
(7, 'simple', 'simple', 0),
(8, 'grouped', 'grouped', 0),
(9, 'variable', 'variable', 0),
(10, 'external', 'external', 0),
(11, 'exclude-from-search', 'exclude-from-search', 0),
(12, 'exclude-from-catalog', 'exclude-from-catalog', 0),
(13, 'featured', 'featured', 0),
(14, 'outofstock', 'outofstock', 0),
(15, 'rated-1', 'rated-1', 0),
(16, 'rated-2', 'rated-2', 0),
(17, 'rated-3', 'rated-3', 0),
(18, 'rated-4', 'rated-4', 0),
(19, 'rated-5', 'rated-5', 0),
(20, 'Uncategorized', 'uncategorized', 0),
(21, 'Clothing', 'clothing', 0),
(22, 'Hoodies', 'hoodies', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbc_term_relationships`
--

CREATE TABLE `tbc_term_relationships` (
  `object_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `term_order` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_term_relationships`
--

INSERT INTO `tbc_term_relationships` (`object_id`, `term_taxonomy_id`, `term_order`) VALUES
(1, 1, 0),
(59, 2, 0),
(62, 2, 0),
(90, 7, 0),
(90, 20, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbc_term_taxonomy`
--

CREATE TABLE `tbc_term_taxonomy` (
  `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL,
  `term_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `count` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_term_taxonomy`
--

INSERT INTO `tbc_term_taxonomy` (`term_taxonomy_id`, `term_id`, `taxonomy`, `description`, `parent`, `count`) VALUES
(1, 1, 'category', '', 0, 1),
(2, 2, 'category', '', 0, 2),
(3, 3, 'spnl_log_type', '', 0, 0),
(4, 4, 'spnl_log_type', '', 0, 0),
(5, 5, 'spnl_log_type', '', 0, 0),
(6, 6, 'spnl_log_type', '', 0, 0),
(7, 7, 'product_type', '', 0, 1),
(8, 8, 'product_type', '', 0, 0),
(9, 9, 'product_type', '', 0, 0),
(10, 10, 'product_type', '', 0, 0),
(11, 11, 'product_visibility', '', 0, 0),
(12, 12, 'product_visibility', '', 0, 0),
(13, 13, 'product_visibility', '', 0, 0),
(14, 14, 'product_visibility', '', 0, 0),
(15, 15, 'product_visibility', '', 0, 0),
(16, 16, 'product_visibility', '', 0, 0),
(17, 17, 'product_visibility', '', 0, 0),
(18, 18, 'product_visibility', '', 0, 0),
(19, 19, 'product_visibility', '', 0, 0),
(20, 20, 'product_cat', '', 0, 1),
(21, 21, 'product_cat', '', 0, 0),
(22, 22, 'product_cat', '', 21, 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbc_usermeta`
--

CREATE TABLE `tbc_usermeta` (
  `umeta_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_usermeta`
--

INSERT INTO `tbc_usermeta` (`umeta_id`, `user_id`, `meta_key`, `meta_value`) VALUES
(1, 1, 'nickname', 'admin'),
(2, 1, 'first_name', 'The Brown'),
(3, 1, 'last_name', 'Curves'),
(4, 1, 'description', ''),
(5, 1, 'rich_editing', 'true'),
(6, 1, 'syntax_highlighting', 'true'),
(7, 1, 'comment_shortcuts', 'false'),
(8, 1, 'admin_color', 'midnight'),
(9, 1, 'use_ssl', '0'),
(10, 1, 'show_admin_bar_front', 'true'),
(11, 1, 'locale', ''),
(12, 1, 'tbc_capabilities', 'a:1:{s:13:\"administrator\";b:1;}'),
(13, 1, 'tbc_user_level', '10'),
(14, 1, 'dismissed_wp_pointers', 'plugin_editor_notice,theme_editor_notice'),
(15, 1, 'show_welcome_panel', '1'),
(16, 1, 'session_tokens', 'a:5:{s:64:\"e1dea83ec5ebe43b38e12017e2a184fce34700746f9ce3c45f74e9b2d004dae0\";a:4:{s:10:\"expiration\";i:1622178656;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36\";s:5:\"login\";i:1620969056;}s:64:\"87471f870874410cf62f12108b00e393d07b058f5e6c127fe7d26b09e803011d\";a:4:{s:10:\"expiration\";i:1621319794;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36\";s:5:\"login\";i:1621146994;}s:64:\"bf815f7cf9ce921451552b144b909c7f2a96aca0820f95bc078fa4fb24bdd165\";a:4:{s:10:\"expiration\";i:1621422850;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36\";s:5:\"login\";i:1621250050;}s:64:\"0e2593922adcfa780c03ebc7be09c7e293402c98d418662e4dce9fd0dcbc489e\";a:4:{s:10:\"expiration\";i:1621431392;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36\";s:5:\"login\";i:1621258592;}s:64:\"2dbdf636dfae4c5d607c7d04f85d7f2620389013a97f857d7549390c0f856899\";a:4:{s:10:\"expiration\";i:1621433467;s:2:\"ip\";s:3:\"::1\";s:2:\"ua\";s:115:\"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/90.0.4430.212 Safari/537.36\";s:5:\"login\";i:1621260667;}}'),
(17, 1, 'tbc_dashboard_quick_press_last_post_id', '4'),
(18, 1, 'tbc_user-settings', 'libraryContent=browse'),
(19, 1, 'tbc_user-settings-time', '1621017968'),
(20, 1, 'closedpostboxes_', 'a:0:{}'),
(21, 1, 'metaboxhidden_', 'a:0:{}'),
(23, 1, '_woocommerce_tracks_anon_id', 'woo:6Ea7SLGXQ3D//GAz40EVr00T'),
(24, 1, 'last_update', '1621269811'),
(25, 1, 'woocommerce_admin_activity_panel_inbox_last_read', '1621269810136'),
(26, 1, 'wc_last_active', '1621209600'),
(27, 1, 'woocommerce_admin_task_list_tracked_started_tasks', '{\"products\":1,\"payments\":1,\"tax\":1}');

-- --------------------------------------------------------

--
-- Table structure for table `tbc_users`
--

CREATE TABLE `tbc_users` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `user_login` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_pass` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_nicename` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_url` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_registered` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `user_activation_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_status` int(11) NOT NULL DEFAULT 0,
  `display_name` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_users`
--

INSERT INTO `tbc_users` (`ID`, `user_login`, `user_pass`, `user_nicename`, `user_email`, `user_url`, `user_registered`, `user_activation_key`, `user_status`, `display_name`) VALUES
(1, 'admin', '$P$Bev.VZp1TFtY4lx1wXUBPWl/Ytv5VE0', 'admin', 'giribhagirath169@gmail.com', 'http://localhost/thebrowncurves', '2021-05-13 19:07:02', '1621189339:$P$BmO/bJmJe3EXgTszepeVJ7rc8I/KTK0', 0, 'The Brown Curves');

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_admin_notes`
--

CREATE TABLE `tbc_wc_admin_notes` (
  `note_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_data` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_reminder` datetime DEFAULT NULL,
  `is_snoozable` tinyint(1) NOT NULL DEFAULT 0,
  `layout` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `image` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0,
  `icon` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'info'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_wc_admin_notes`
--

INSERT INTO `tbc_wc_admin_notes` (`note_id`, `name`, `type`, `locale`, `title`, `content`, `content_data`, `status`, `source`, `date_created`, `date_reminder`, `is_snoozable`, `layout`, `image`, `is_deleted`, `icon`) VALUES
(1, 'wc-admin-onboarding-email-marketing', 'info', 'en_US', 'Sign up for tips, product updates, and inspiration', 'We\'re here for you - get tips, product updates and inspiration straight to your email box', '{}', 'unactioned', 'woocommerce-admin', '2021-05-17 15:34:05', NULL, 0, 'plain', '', 0, 'info'),
(2, 'wc-admin-wc-helper-connection', 'info', 'en_US', 'Connect to WooCommerce.com', 'Connect to get important product notifications and updates.', '{}', 'unactioned', 'woocommerce-admin', '2021-05-17 15:34:06', NULL, 0, 'plain', '', 0, 'info'),
(3, 'paypal_ppcp_gtm_2021', 'marketing', 'en_US', 'Offer more options with the new PayPal', 'Get the latest PayPal extension for a full suite of payment methods with extensive currency and country coverage.', '{}', 'pending', 'woocommerce.com', '2021-05-17 15:34:18', NULL, 0, 'plain', '', 0, 'info'),
(4, 'facebook_pixel_api_2021', 'marketing', 'en_US', 'Improve the performance of your Facebook ads', 'Enable Facebook Pixel and Conversions API through the latest version of Facebook for WooCommerce for improved measurement and ad targeting capabilities.', '{}', 'pending', 'woocommerce.com', '2021-05-17 15:34:18', NULL, 0, 'plain', '', 0, 'info'),
(5, 'facebook_ec_2021', 'marketing', 'en_US', 'Sync your product catalog with Facebook to help boost sales', 'A single click adds all products to your Facebook Business Page shop. Product changes are automatically synced, with the flexibility to control which products are listed.', '{}', 'pending', 'woocommerce.com', '2021-05-17 15:34:18', NULL, 0, 'plain', '', 0, 'info'),
(6, 'ecomm-need-help-setting-up-your-store', 'info', 'en_US', 'Need help setting up your Store?', 'Schedule a free 30-min <a href=\"https://wordpress.com/support/concierge-support/\">quick start session</a> and get help from our specialists. We’re happy to walk through setup steps, show you around the WordPress.com dashboard, troubleshoot any issues you may have, and help you the find the features you need to accomplish your goals for your site.', '{}', 'pending', 'woocommerce.com', '2021-05-17 15:34:18', NULL, 0, 'plain', '', 0, 'info'),
(7, 'woocommerce-services', 'info', 'en_US', 'WooCommerce Shipping & Tax', 'WooCommerce Shipping &amp; Tax helps get your store “ready to sell” as quickly as possible. You create your products. We take care of tax calculation, payment processing, and shipping label printing! Learn more about the extension that you just installed.', '{}', 'pending', 'woocommerce.com', '2021-05-17 15:34:18', NULL, 0, 'plain', '', 0, 'info'),
(8, 'ecomm-unique-shopping-experience', 'info', 'en_US', 'For a shopping experience as unique as your customers', 'Product Add-Ons allow your customers to personalize products while they’re shopping on your online store. No more follow-up email requests—customers get what they want, before they’re done checking out. Learn more about this extension that comes included in your plan.', '{}', 'pending', 'woocommerce.com', '2021-05-17 15:34:18', NULL, 0, 'plain', '', 0, 'info'),
(9, 'wc-admin-getting-started-in-ecommerce', 'info', 'en_US', 'Getting Started in eCommerce - webinar', 'We want to make eCommerce and this process of getting started as easy as possible for you. Watch this webinar to get tips on how to have our store up and running in a breeze.', '{}', 'pending', 'woocommerce.com', '2021-05-17 15:34:18', NULL, 0, 'plain', '', 0, 'info'),
(10, 'your-first-product', 'info', 'en_US', 'Your first product', 'That\'s huge! You\'re well on your way to building a successful online store — now it’s time to think about how you\'ll fulfill your orders.<br /><br />Read our shipping guide to learn best practices and options for putting together your shipping strategy. And for WooCommerce stores in the United States, you can print discounted shipping labels via USPS with <a href=\"https://href.li/?https://woocommerce.com/shipping\" target=\"_blank\">WooCommerce Shipping</a>.', '{}', 'unactioned', 'woocommerce.com', '2021-05-17 16:42:21', NULL, 0, 'plain', '', 0, 'info'),
(11, 'wc-square-apple-pay-boost-sales', 'marketing', 'en_US', 'Boost sales with Apple Pay', 'Now that you accept Apple Pay® with Square you can increase conversion rates by letting your customers know that Apple Pay® is available. Here’s a marketing guide to help you get started.', '{}', 'pending', 'woocommerce.com', '2021-05-17 15:34:18', NULL, 0, 'plain', '', 0, 'info'),
(12, 'wc-square-apple-pay-grow-your-business', 'marketing', 'en_US', 'Grow your business with Square and Apple Pay ', 'Now more than ever, shoppers want a fast, simple, and secure online checkout experience. Increase conversion rates by letting your customers know that you now accept Apple Pay®.', '{}', 'pending', 'woocommerce.com', '2021-05-17 15:34:18', NULL, 0, 'plain', '', 0, 'info'),
(13, 'wcpay-apple-pay-is-now-available', 'marketing', 'en_US', 'Apple Pay is now available with WooCommerce Payments!', 'Increase your conversion rate by offering a fast and secure checkout with <a href=\"https://woocommerce.com/apple-pay/?utm_source=inbox&amp;utm_medium=product&amp;utm_campaign=wcpay_applepay\" target=\"_blank\">Apple Pay</a>®. It’s free to get started with <a href=\"https://woocommerce.com/payments/?utm_source=inbox&amp;utm_medium=product&amp;utm_campaign=wcpay_applepay\" target=\"_blank\">WooCommerce Payments</a>.', '{}', 'pending', 'woocommerce.com', '2021-05-17 15:34:18', NULL, 0, 'plain', '', 0, 'info'),
(14, 'wcpay-apple-pay-boost-sales', 'marketing', 'en_US', 'Boost sales with Apple Pay', 'Now that you accept Apple Pay® with WooCommerce Payments you can increase conversion rates by letting your customers know that Apple Pay® is available. Here’s a marketing guide to help you get started.', '{}', 'pending', 'woocommerce.com', '2021-05-17 15:34:18', NULL, 0, 'plain', '', 0, 'info'),
(15, 'wcpay-apple-pay-grow-your-business', 'marketing', 'en_US', 'Grow your business with WooCommerce Payments and Apple Pay', 'Now more than ever, shoppers want a fast, simple, and secure online checkout experience. Increase conversion rates by letting your customers know that you now accept Apple Pay®.', '{}', 'pending', 'woocommerce.com', '2021-05-17 15:34:18', NULL, 0, 'plain', '', 0, 'info'),
(16, 'wc-admin-optimizing-the-checkout-flow', 'info', 'en_US', 'Optimizing the checkout flow', 'It\'s crucial to get your store\'s checkout as smooth as possible to avoid losing sales. Let\'s take a look at how you can optimize the checkout experience for your shoppers.', '{}', 'pending', 'woocommerce.com', '2021-05-17 15:34:18', NULL, 0, 'plain', '', 0, 'info'),
(17, 'wc-admin-first-five-things-to-customize', 'info', 'en_US', 'The first 5 things to customize in your store', 'Deciding what to start with first is tricky. To help you properly prioritize, we\'ve put together this short list of the first few things you should customize in WooCommerce.', '{}', 'pending', 'woocommerce.com', '2021-05-17 15:34:18', NULL, 0, 'plain', '', 0, 'info'),
(18, 'wc-payments-qualitative-feedback', 'info', 'en_US', 'WooCommerce Payments setup - let us know what you think', 'Congrats on enabling WooCommerce Payments for your store. Please share your feedback in this 2 minute survey to help us improve the setup process.', '{}', 'pending', 'woocommerce.com', '2021-05-17 15:34:18', NULL, 0, 'plain', '', 0, 'info'),
(19, 'share-your-feedback-on-paypal', 'info', 'en_US', 'Share your feedback on PayPal', 'Share your feedback in this 2 minute survey about how we can make the process of accepting payments more useful for your store.', '{}', 'pending', 'woocommerce.com', '2021-05-17 15:34:18', NULL, 0, 'plain', '', 0, 'info'),
(20, 'wcpay_instant_deposits_gtm_2021', 'marketing', 'en_US', 'Get paid within minutes – Instant Deposits for WooCommerce Payments', 'Stay flexible with immediate access to your funds when you need them – including nights, weekends, and holidays. With <a href=\"https://woocommerce.com/products/woocommerce-payments/?utm_source=inbox&amp;utm_medium=product&amp;utm_campaign=wcpay_instant_deposits\">WooCommerce Payments\'</a> new Instant Deposits feature, you’re able to transfer your earnings to a debit card within minutes.', '{}', 'pending', 'woocommerce.com', '2021-05-17 15:34:18', NULL, 0, 'plain', '', 0, 'info'),
(21, 'wc-admin-learn-more-about-variable-products', 'info', 'en_US', 'Learn more about variable products', 'Variable products are a powerful product type that lets you offer a set of variations on a product, with control over prices, stock, image and more for each variation. They can be used for a product like a shirt, where you can offer a large, medium and small and in different colors.', '{}', 'unactioned', 'woocommerce-admin', '2021-05-17 16:42:21', NULL, 0, 'plain', '', 0, 'info'),
(22, 'wc-admin-coupon-page-moved', 'update', 'en_US', 'Coupon management has moved!', 'Coupons can now be managed from Marketing &gt; Coupons. Click the button below to remove the legacy WooCommerce &gt; Coupons menu item.', '{}', 'unactioned', 'woocommerce-admin', '2021-05-17 16:43:20', NULL, 0, 'plain', '', 0, 'info'),
(23, 'wc-admin-choosing-a-theme', 'marketing', 'en_US', 'Choosing a theme?', 'Check out the themes that are compatible with WooCommerce and choose one aligned with your brand and business needs.', '{}', 'unactioned', 'woocommerce-admin', '2021-05-18 17:09:23', NULL, 0, 'plain', '', 0, 'info'),
(24, 'wc-admin-insight-first-product-and-payment', 'survey', 'en_US', 'Insight', 'More than 80% of new merchants add the first product and have at least one payment method set up during the first week.<br><br>Do you find this type of insight useful?', '{}', 'unactioned', 'woocommerce-admin', '2021-05-18 17:09:23', NULL, 0, 'plain', '', 0, 'info'),
(25, 'wc-admin-customizing-product-catalog', 'info', 'en_US', 'How to customize your product catalog', 'You want your product catalog and images to look great and align with your brand. This guide will give you all the tips you need to get your products looking great in your store.', '{}', 'unactioned', 'woocommerce-admin', '2021-05-18 17:09:23', NULL, 0, 'plain', '', 0, 'info');

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_admin_note_actions`
--

CREATE TABLE `tbc_wc_admin_note_actions` (
  `action_id` bigint(20) UNSIGNED NOT NULL,
  `note_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `query` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_primary` tinyint(1) NOT NULL DEFAULT 0,
  `actioned_text` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_wc_admin_note_actions`
--

INSERT INTO `tbc_wc_admin_note_actions` (`action_id`, `note_id`, `name`, `label`, `query`, `status`, `is_primary`, `actioned_text`) VALUES
(1, 1, 'yes-please', 'Yes please!', 'https://woocommerce.us8.list-manage.com/subscribe/post?u=2c1434dc56f9506bf3c3ecd21&amp;id=13860df971&amp;SIGNUPPAGE=plugin', 'actioned', 0, ''),
(2, 2, 'connect', 'Connect', '?page=wc-addons&section=helper', 'unactioned', 0, ''),
(41, 21, 'learn-more', 'Learn more', 'https://docs.woocommerce.com/document/variable-product/?utm_source=inbox', 'actioned', 0, ''),
(61, 22, 'remove-legacy-coupon-menu', 'Remove legacy coupon menu', 'http://localhost/thebrowncurves/wp-admin/admin.php?page=wc-admin&action=remove-coupon-menu', 'actioned', 1, ''),
(62, 23, 'visit-the-theme-marketplace', 'Visit the theme marketplace', 'https://woocommerce.com/product-category/themes/?utm_source=inbox', 'actioned', 0, ''),
(63, 24, 'affirm-insight-first-product-and-payment', 'Yes', '', 'actioned', 0, 'Thanks for your feedback'),
(64, 24, 'affirm-insight-first-product-and-payment', 'No', '', 'actioned', 0, 'Thanks for your feedback'),
(65, 25, 'day-after-first-product', 'Learn more', 'https://docs.woocommerce.com/document/woocommerce-customizer/?utm_source=inbox', 'actioned', 0, ''),
(66, 3, 'open_wc_paypal_payments_product_page', 'Learn more', 'https://woocommerce.com/products/woocommerce-paypal-payments/', 'actioned', 1, ''),
(67, 4, 'upgrade_now_facebook_pixel_api', 'Upgrade now', 'plugin-install.php?tab=plugin-information&plugin=&section=changelog', 'actioned', 1, ''),
(68, 5, 'learn_more_facebook_ec', 'Learn more', 'https://woocommerce.com/products/facebook/', 'unactioned', 1, ''),
(69, 6, 'set-up-concierge', 'Schedule free session', 'https://wordpress.com/me/concierge', 'actioned', 1, ''),
(70, 7, 'learn-more', 'Learn more', 'https://docs.woocommerce.com/document/woocommerce-shipping-and-tax/?utm_source=inbox', 'unactioned', 1, ''),
(71, 8, 'learn-more-ecomm-unique-shopping-experience', 'Learn more', 'https://docs.woocommerce.com/document/product-add-ons/?utm_source=inbox', 'actioned', 1, ''),
(72, 9, 'watch-the-webinar', 'Watch the webinar', 'https://youtu.be/V_2XtCOyZ7o', 'actioned', 1, ''),
(73, 10, 'learn-more', 'Learn more', 'https://woocommerce.com/posts/ecommerce-shipping-solutions-guide/?utm_source=inbox', 'actioned', 1, ''),
(74, 11, 'boost-sales-marketing-guide', 'See marketing guide', 'https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=square-boost-sales', 'actioned', 1, ''),
(75, 12, 'grow-your-business-marketing-guide', 'See marketing guide', 'https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=square-grow-your-business', 'actioned', 1, ''),
(76, 13, 'add-apple-pay', 'Add Apple Pay', '/admin.php?page=wc-settings&tab=checkout&section=woocommerce_payments', 'actioned', 1, ''),
(77, 13, 'learn-more', 'Learn more', 'https://docs.woocommerce.com/document/payments/apple-pay/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_applepay', 'actioned', 1, ''),
(78, 14, 'boost-sales-marketing-guide', 'See marketing guide', 'https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=wcpay-boost-sales', 'actioned', 1, ''),
(79, 15, 'grow-your-business-marketing-guide', 'See marketing guide', 'https://developer.apple.com/apple-pay/marketing/?utm_source=inbox&utm_campaign=wcpay-grow-your-business', 'actioned', 1, ''),
(80, 16, 'optimizing-the-checkout-flow', 'Learn more', 'https://woocommerce.com/posts/optimizing-woocommerce-checkout?utm_source=inbox', 'actioned', 1, ''),
(81, 17, 'learn-more', 'Learn more', 'https://woocommerce.com/posts/first-things-customize-woocommerce/?utm_source=inbox', 'unactioned', 1, ''),
(82, 18, 'qualitative-feedback-from-new-users', 'Share feedback', 'https://automattic.survey.fm/wc-pay-new', 'actioned', 1, ''),
(83, 19, 'share-feedback', 'Share feedback', 'http://automattic.survey.fm/paypal-feedback', 'unactioned', 1, ''),
(84, 20, 'learn-more', 'Learn about Instant Deposits eligibility', 'https://docs.woocommerce.com/document/payments/instant-deposits/?utm_source=inbox&utm_medium=product&utm_campaign=wcpay_instant_deposits', 'actioned', 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_avatars_cache`
--

CREATE TABLE `tbc_wc_avatars_cache` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `maketime` int(11) NOT NULL DEFAULT 0,
  `cached` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_category_lookup`
--

CREATE TABLE `tbc_wc_category_lookup` (
  `category_tree_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_wc_category_lookup`
--

INSERT INTO `tbc_wc_category_lookup` (`category_tree_id`, `category_id`) VALUES
(20, 20);

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_comments_subscription`
--

CREATE TABLE `tbc_wc_comments_subscription` (
  `id` int(11) NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subscribtion_id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL,
  `subscribtion_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_key` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirm` tinyint(4) DEFAULT 0,
  `subscription_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `imported_from` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_customer_lookup`
--

CREATE TABLE `tbc_wc_customer_lookup` (
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `date_last_active` timestamp NULL DEFAULT NULL,
  `date_registered` timestamp NULL DEFAULT NULL,
  `country` char(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `postcode` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `city` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_download_log`
--

CREATE TABLE `tbc_wc_download_log` (
  `download_log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `user_ip_address` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_feedback_forms`
--

CREATE TABLE `tbc_wc_feedback_forms` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `unique_id` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `question` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `opened` tinyint(4) UNSIGNED NOT NULL DEFAULT 0,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_follow_users`
--

CREATE TABLE `tbc_wc_follow_users` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `follower_id` int(11) NOT NULL DEFAULT 0,
  `follower_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `follower_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `activation_key` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `confirm` tinyint(1) NOT NULL DEFAULT 0,
  `follow_timestamp` int(11) NOT NULL,
  `follow_date` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_order_coupon_lookup`
--

CREATE TABLE `tbc_wc_order_coupon_lookup` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `coupon_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `discount_amount` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_order_product_lookup`
--

CREATE TABLE `tbc_wc_order_product_lookup` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variation_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `product_qty` int(11) NOT NULL,
  `product_net_revenue` double NOT NULL DEFAULT 0,
  `product_gross_revenue` double NOT NULL DEFAULT 0,
  `coupon_amount` double NOT NULL DEFAULT 0,
  `tax_amount` double NOT NULL DEFAULT 0,
  `shipping_amount` double NOT NULL DEFAULT 0,
  `shipping_tax_amount` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_order_stats`
--

CREATE TABLE `tbc_wc_order_stats` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `parent_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `num_items_sold` int(11) NOT NULL DEFAULT 0,
  `total_sales` double NOT NULL DEFAULT 0,
  `tax_total` double NOT NULL DEFAULT 0,
  `shipping_total` double NOT NULL DEFAULT 0,
  `net_total` double NOT NULL DEFAULT 0,
  `returning_customer` tinyint(1) DEFAULT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_order_tax_lookup`
--

CREATE TABLE `tbc_wc_order_tax_lookup` (
  `order_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `shipping_tax` double NOT NULL DEFAULT 0,
  `order_tax` double NOT NULL DEFAULT 0,
  `total_tax` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_phrases`
--

CREATE TABLE `tbc_wc_phrases` (
  `id` int(11) NOT NULL,
  `phrase_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phrase_value` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_product_meta_lookup`
--

CREATE TABLE `tbc_wc_product_meta_lookup` (
  `product_id` bigint(20) NOT NULL,
  `sku` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `virtual` tinyint(1) DEFAULT 0,
  `downloadable` tinyint(1) DEFAULT 0,
  `min_price` decimal(19,4) DEFAULT NULL,
  `max_price` decimal(19,4) DEFAULT NULL,
  `onsale` tinyint(1) DEFAULT 0,
  `stock_quantity` double DEFAULT NULL,
  `stock_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'instock',
  `rating_count` bigint(20) DEFAULT 0,
  `average_rating` decimal(3,2) DEFAULT 0.00,
  `total_sales` bigint(20) DEFAULT 0,
  `tax_status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT 'taxable',
  `tax_class` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_wc_product_meta_lookup`
--

INSERT INTO `tbc_wc_product_meta_lookup` (`product_id`, `sku`, `virtual`, `downloadable`, `min_price`, `max_price`, `onsale`, `stock_quantity`, `stock_status`, `rating_count`, `average_rating`, `total_sales`, `tax_status`, `tax_class`) VALUES
(90, '', 0, 0, '0.0000', '0.0000', 0, NULL, 'instock', 0, '0.00', 0, 'taxable', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_reserved_stock`
--

CREATE TABLE `tbc_wc_reserved_stock` (
  `order_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  `stock_quantity` double NOT NULL DEFAULT 0,
  `timestamp` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expires` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_tax_rate_classes`
--

CREATE TABLE `tbc_wc_tax_rate_classes` (
  `tax_rate_class_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_wc_tax_rate_classes`
--

INSERT INTO `tbc_wc_tax_rate_classes` (`tax_rate_class_id`, `name`, `slug`) VALUES
(1, 'Reduced rate', 'reduced-rate'),
(2, 'Zero rate', 'zero-rate');

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_users_rated`
--

CREATE TABLE `tbc_wc_users_rated` (
  `id` int(11) NOT NULL,
  `post_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `user_ip` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rating` int(11) NOT NULL,
  `date` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_wc_users_rated`
--

INSERT INTO `tbc_wc_users_rated` (`id`, `post_id`, `user_id`, `user_ip`, `rating`, `date`) VALUES
(1, 59, 1, '', 5, 1621192622),
(2, 59, 0, 'f528764d624db129b32c21fbca0cb8d6', 4, 1621192712);

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_users_voted`
--

CREATE TABLE `tbc_wc_users_voted` (
  `id` int(11) NOT NULL,
  `user_id` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_id` int(11) NOT NULL,
  `vote_type` int(11) DEFAULT NULL,
  `is_guest` tinyint(1) DEFAULT 0,
  `post_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `date` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_wc_webhooks`
--

CREATE TABLE `tbc_wc_webhooks` (
  `webhook_id` bigint(20) UNSIGNED NOT NULL,
  `status` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `delivery_url` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `topic` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_created_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `date_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `api_version` smallint(4) NOT NULL,
  `failure_count` smallint(10) NOT NULL DEFAULT 0,
  `pending_delivery` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_woocommerce_api_keys`
--

CREATE TABLE `tbc_woocommerce_api_keys` (
  `key_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `description` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `permissions` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_key` char(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `consumer_secret` char(43) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nonces` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `truncated_key` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_access` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_woocommerce_attribute_taxonomies`
--

CREATE TABLE `tbc_woocommerce_attribute_taxonomies` (
  `attribute_id` bigint(20) UNSIGNED NOT NULL,
  `attribute_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_label` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `attribute_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_orderby` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribute_public` int(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_woocommerce_attribute_taxonomies`
--

INSERT INTO `tbc_woocommerce_attribute_taxonomies` (`attribute_id`, `attribute_name`, `attribute_label`, `attribute_type`, `attribute_orderby`, `attribute_public`) VALUES
(1, 'color', 'Color', 'select', 'menu_order', 0);

-- --------------------------------------------------------

--
-- Table structure for table `tbc_woocommerce_downloadable_product_permissions`
--

CREATE TABLE `tbc_woocommerce_downloadable_product_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `download_id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `order_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `order_key` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_email` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `downloads_remaining` varchar(9) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access_granted` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `access_expires` datetime DEFAULT NULL,
  `download_count` bigint(20) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_woocommerce_log`
--

CREATE TABLE `tbc_woocommerce_log` (
  `log_id` bigint(20) UNSIGNED NOT NULL,
  `timestamp` datetime NOT NULL,
  `level` smallint(4) NOT NULL,
  `source` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `context` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_woocommerce_order_itemmeta`
--

CREATE TABLE `tbc_woocommerce_order_itemmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_woocommerce_order_items`
--

CREATE TABLE `tbc_woocommerce_order_items` (
  `order_item_id` bigint(20) UNSIGNED NOT NULL,
  `order_item_name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `order_item_type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `order_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_woocommerce_payment_tokenmeta`
--

CREATE TABLE `tbc_woocommerce_payment_tokenmeta` (
  `meta_id` bigint(20) UNSIGNED NOT NULL,
  `payment_token_id` bigint(20) UNSIGNED NOT NULL,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_woocommerce_payment_tokens`
--

CREATE TABLE `tbc_woocommerce_payment_tokens` (
  `token_id` bigint(20) UNSIGNED NOT NULL,
  `gateway_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0,
  `type` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_woocommerce_sessions`
--

CREATE TABLE `tbc_woocommerce_sessions` (
  `session_id` bigint(20) UNSIGNED NOT NULL,
  `session_key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_value` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `session_expiry` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tbc_woocommerce_sessions`
--

INSERT INTO `tbc_woocommerce_sessions` (`session_id`, `session_key`, `session_value`, `session_expiry`) VALUES
(1, '1', 'a:7:{s:4:\"cart\";s:6:\"a:0:{}\";s:11:\"cart_totals\";s:367:\"a:15:{s:8:\"subtotal\";i:0;s:12:\"subtotal_tax\";i:0;s:14:\"shipping_total\";i:0;s:12:\"shipping_tax\";i:0;s:14:\"shipping_taxes\";a:0:{}s:14:\"discount_total\";i:0;s:12:\"discount_tax\";i:0;s:19:\"cart_contents_total\";i:0;s:17:\"cart_contents_tax\";i:0;s:19:\"cart_contents_taxes\";a:0:{}s:9:\"fee_total\";i:0;s:7:\"fee_tax\";i:0;s:9:\"fee_taxes\";a:0:{}s:5:\"total\";i:0;s:9:\"total_tax\";i:0;}\";s:15:\"applied_coupons\";s:6:\"a:0:{}\";s:22:\"coupon_discount_totals\";s:6:\"a:0:{}\";s:26:\"coupon_discount_tax_totals\";s:6:\"a:0:{}\";s:21:\"removed_cart_contents\";s:6:\"a:0:{}\";s:8:\"customer\";s:744:\"a:26:{s:2:\"id\";s:1:\"1\";s:13:\"date_modified\";s:25:\"2021-05-17T16:43:31+00:00\";s:8:\"postcode\";s:0:\"\";s:4:\"city\";s:0:\"\";s:9:\"address_1\";s:0:\"\";s:7:\"address\";s:0:\"\";s:9:\"address_2\";s:0:\"\";s:5:\"state\";s:2:\"GJ\";s:7:\"country\";s:2:\"IN\";s:17:\"shipping_postcode\";s:0:\"\";s:13:\"shipping_city\";s:0:\"\";s:18:\"shipping_address_1\";s:0:\"\";s:16:\"shipping_address\";s:0:\"\";s:18:\"shipping_address_2\";s:0:\"\";s:14:\"shipping_state\";s:2:\"GJ\";s:16:\"shipping_country\";s:2:\"IN\";s:13:\"is_vat_exempt\";s:0:\"\";s:19:\"calculated_shipping\";s:0:\"\";s:10:\"first_name\";s:0:\"\";s:9:\"last_name\";s:0:\"\";s:7:\"company\";s:0:\"\";s:5:\"phone\";s:0:\"\";s:5:\"email\";s:26:\"giribhagirath169@gmail.com\";s:19:\"shipping_first_name\";s:0:\"\";s:18:\"shipping_last_name\";s:0:\"\";s:16:\"shipping_company\";s:0:\"\";}\";}', 1621442618);

-- --------------------------------------------------------

--
-- Table structure for table `tbc_woocommerce_shipping_zones`
--

CREATE TABLE `tbc_woocommerce_shipping_zones` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `zone_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `zone_order` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_woocommerce_shipping_zone_locations`
--

CREATE TABLE `tbc_woocommerce_shipping_zone_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_woocommerce_shipping_zone_methods`
--

CREATE TABLE `tbc_woocommerce_shipping_zone_methods` (
  `zone_id` bigint(20) UNSIGNED NOT NULL,
  `instance_id` bigint(20) UNSIGNED NOT NULL,
  `method_id` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `method_order` bigint(20) UNSIGNED NOT NULL,
  `is_enabled` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_woocommerce_tax_rates`
--

CREATE TABLE `tbc_woocommerce_tax_rates` (
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_country` varchar(2) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_state` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate` varchar(8) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `tax_rate_priority` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_compound` int(1) NOT NULL DEFAULT 0,
  `tax_rate_shipping` int(1) NOT NULL DEFAULT 1,
  `tax_rate_order` bigint(20) UNSIGNED NOT NULL,
  `tax_rate_class` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbc_woocommerce_tax_rate_locations`
--

CREATE TABLE `tbc_woocommerce_tax_rate_locations` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `location_code` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tax_rate_id` bigint(20) UNSIGNED NOT NULL,
  `location_type` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbc_actionscheduler_actions`
--
ALTER TABLE `tbc_actionscheduler_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `hook` (`hook`),
  ADD KEY `status` (`status`),
  ADD KEY `scheduled_date_gmt` (`scheduled_date_gmt`),
  ADD KEY `args` (`args`),
  ADD KEY `group_id` (`group_id`),
  ADD KEY `last_attempt_gmt` (`last_attempt_gmt`),
  ADD KEY `claim_id` (`claim_id`);

--
-- Indexes for table `tbc_actionscheduler_claims`
--
ALTER TABLE `tbc_actionscheduler_claims`
  ADD PRIMARY KEY (`claim_id`),
  ADD KEY `date_created_gmt` (`date_created_gmt`);

--
-- Indexes for table `tbc_actionscheduler_groups`
--
ALTER TABLE `tbc_actionscheduler_groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `slug` (`slug`(191));

--
-- Indexes for table `tbc_actionscheduler_logs`
--
ALTER TABLE `tbc_actionscheduler_logs`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `action_id` (`action_id`),
  ADD KEY `log_date_gmt` (`log_date_gmt`);

--
-- Indexes for table `tbc_commentmeta`
--
ALTER TABLE `tbc_commentmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `tbc_comments`
--
ALTER TABLE `tbc_comments`
  ADD PRIMARY KEY (`comment_ID`),
  ADD KEY `comment_post_ID` (`comment_post_ID`),
  ADD KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  ADD KEY `comment_date_gmt` (`comment_date_gmt`),
  ADD KEY `comment_parent` (`comment_parent`),
  ADD KEY `comment_author_email` (`comment_author_email`(10)),
  ADD KEY `woo_idx_comment_type` (`comment_type`);

--
-- Indexes for table `tbc_links`
--
ALTER TABLE `tbc_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `link_visible` (`link_visible`);

--
-- Indexes for table `tbc_newsletter`
--
ALTER TABLE `tbc_newsletter`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `wp_user_id` (`wp_user_id`);

--
-- Indexes for table `tbc_newsletter_emails`
--
ALTER TABLE `tbc_newsletter_emails`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbc_newsletter_sent`
--
ALTER TABLE `tbc_newsletter_sent`
  ADD PRIMARY KEY (`email_id`,`user_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `email_id` (`email_id`);

--
-- Indexes for table `tbc_newsletter_stats`
--
ALTER TABLE `tbc_newsletter_stats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_id` (`email_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbc_newsletter_user_logs`
--
ALTER TABLE `tbc_newsletter_user_logs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbc_options`
--
ALTER TABLE `tbc_options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`),
  ADD KEY `autoload` (`autoload`);

--
-- Indexes for table `tbc_postmeta`
--
ALTER TABLE `tbc_postmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `tbc_posts`
--
ALTER TABLE `tbc_posts`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `post_name` (`post_name`(191)),
  ADD KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  ADD KEY `post_parent` (`post_parent`),
  ADD KEY `post_author` (`post_author`);

--
-- Indexes for table `tbc_sendpress_autoresponders`
--
ALTER TABLE `tbc_sendpress_autoresponders`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `tbc_sendpress_connections`
--
ALTER TABLE `tbc_sendpress_connections`
  ADD PRIMARY KEY (`connection_id`);

--
-- Indexes for table `tbc_sendpress_customfields`
--
ALTER TABLE `tbc_sendpress_customfields`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbc_sendpress_list_subscribers`
--
ALTER TABLE `tbc_sendpress_list_subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `listsub` (`subscriberID`,`listID`),
  ADD KEY `listID` (`listID`),
  ADD KEY `subscriberID` (`subscriberID`),
  ADD KEY `status` (`status`);

--
-- Indexes for table `tbc_sendpress_queue`
--
ALTER TABLE `tbc_sendpress_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `to_email` (`to_email`),
  ADD KEY `subscriberID` (`subscriberID`),
  ADD KEY `listID` (`listID`),
  ADD KEY `inprocess` (`inprocess`),
  ADD KEY `success` (`success`),
  ADD KEY `max_attempts` (`max_attempts`),
  ADD KEY `attempts` (`attempts`),
  ADD KEY `last_attempt` (`last_attempt`),
  ADD KEY `date_sent` (`date_sent`),
  ADD KEY `success_date` (`success`,`last_attempt`,`max_attempts`,`attempts`,`inprocess`,`date_sent`);

--
-- Indexes for table `tbc_sendpress_schedules`
--
ALTER TABLE `tbc_sendpress_schedules`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `tbc_sendpress_subscribers`
--
ALTER TABLE `tbc_sendpress_subscribers`
  ADD PRIMARY KEY (`subscriberID`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `identity_key` (`identity_key`),
  ADD UNIQUE KEY `wp_user_id` (`wp_user_id`);

--
-- Indexes for table `tbc_sendpress_subscribers_meta`
--
ALTER TABLE `tbc_sendpress_subscribers_meta`
  ADD PRIMARY KEY (`smeta_id`),
  ADD KEY `listID` (`listID`),
  ADD KEY `subscriberID` (`subscriberID`),
  ADD KEY `meta_key` (`meta_key`);

--
-- Indexes for table `tbc_sendpress_subscribers_status`
--
ALTER TABLE `tbc_sendpress_subscribers_status`
  ADD PRIMARY KEY (`statusid`);

--
-- Indexes for table `tbc_sendpress_subscribers_tracker`
--
ALTER TABLE `tbc_sendpress_subscribers_tracker`
  ADD PRIMARY KEY (`subscriber_id`,`email_id`),
  ADD KEY `tracker_type` (`tracker_type`);

--
-- Indexes for table `tbc_sendpress_subscribers_url`
--
ALTER TABLE `tbc_sendpress_subscribers_url`
  ADD PRIMARY KEY (`subscriber_id`,`email_id`,`url_id`);

--
-- Indexes for table `tbc_sendpress_url`
--
ALTER TABLE `tbc_sendpress_url`
  ADD PRIMARY KEY (`url_id`),
  ADD KEY `hash` (`hash`);

--
-- Indexes for table `tbc_termmeta`
--
ALTER TABLE `tbc_termmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `term_id` (`term_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `tbc_terms`
--
ALTER TABLE `tbc_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD KEY `slug` (`slug`(191)),
  ADD KEY `name` (`name`(191));

--
-- Indexes for table `tbc_term_relationships`
--
ALTER TABLE `tbc_term_relationships`
  ADD PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  ADD KEY `term_taxonomy_id` (`term_taxonomy_id`);

--
-- Indexes for table `tbc_term_taxonomy`
--
ALTER TABLE `tbc_term_taxonomy`
  ADD PRIMARY KEY (`term_taxonomy_id`),
  ADD UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  ADD KEY `taxonomy` (`taxonomy`);

--
-- Indexes for table `tbc_usermeta`
--
ALTER TABLE `tbc_usermeta`
  ADD PRIMARY KEY (`umeta_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `meta_key` (`meta_key`(191));

--
-- Indexes for table `tbc_users`
--
ALTER TABLE `tbc_users`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `user_login_key` (`user_login`),
  ADD KEY `user_nicename` (`user_nicename`),
  ADD KEY `user_email` (`user_email`);

--
-- Indexes for table `tbc_wc_admin_notes`
--
ALTER TABLE `tbc_wc_admin_notes`
  ADD PRIMARY KEY (`note_id`);

--
-- Indexes for table `tbc_wc_admin_note_actions`
--
ALTER TABLE `tbc_wc_admin_note_actions`
  ADD PRIMARY KEY (`action_id`),
  ADD KEY `note_id` (`note_id`);

--
-- Indexes for table `tbc_wc_avatars_cache`
--
ALTER TABLE `tbc_wc_avatars_cache`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email` (`user_email`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `maketime` (`maketime`),
  ADD KEY `cached` (`cached`);

--
-- Indexes for table `tbc_wc_category_lookup`
--
ALTER TABLE `tbc_wc_category_lookup`
  ADD PRIMARY KEY (`category_tree_id`,`category_id`);

--
-- Indexes for table `tbc_wc_comments_subscription`
--
ALTER TABLE `tbc_wc_comments_subscription`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribe_unique_index` (`subscribtion_id`,`email`,`post_id`),
  ADD KEY `subscribtion_id` (`subscribtion_id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `confirm` (`confirm`);

--
-- Indexes for table `tbc_wc_customer_lookup`
--
ALTER TABLE `tbc_wc_customer_lookup`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `user_id` (`user_id`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `tbc_wc_download_log`
--
ALTER TABLE `tbc_wc_download_log`
  ADD PRIMARY KEY (`download_log_id`),
  ADD KEY `permission_id` (`permission_id`),
  ADD KEY `timestamp` (`timestamp`);

--
-- Indexes for table `tbc_wc_feedback_forms`
--
ALTER TABLE `tbc_wc_feedback_forms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `unique_id` (`unique_id`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `tbc_wc_follow_users`
--
ALTER TABLE `tbc_wc_follow_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `follow_unique_key` (`user_email`,`follower_email`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `user_email` (`user_email`),
  ADD KEY `follower_id` (`follower_id`),
  ADD KEY `follower_email` (`follower_email`),
  ADD KEY `confirm` (`confirm`),
  ADD KEY `follow_timestamp` (`follow_timestamp`);

--
-- Indexes for table `tbc_wc_order_coupon_lookup`
--
ALTER TABLE `tbc_wc_order_coupon_lookup`
  ADD PRIMARY KEY (`order_id`,`coupon_id`),
  ADD KEY `coupon_id` (`coupon_id`),
  ADD KEY `date_created` (`date_created`);

--
-- Indexes for table `tbc_wc_order_product_lookup`
--
ALTER TABLE `tbc_wc_order_product_lookup`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `date_created` (`date_created`);

--
-- Indexes for table `tbc_wc_order_stats`
--
ALTER TABLE `tbc_wc_order_stats`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `date_created` (`date_created`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `status` (`status`(191));

--
-- Indexes for table `tbc_wc_order_tax_lookup`
--
ALTER TABLE `tbc_wc_order_tax_lookup`
  ADD PRIMARY KEY (`order_id`,`tax_rate_id`),
  ADD KEY `tax_rate_id` (`tax_rate_id`),
  ADD KEY `date_created` (`date_created`);

--
-- Indexes for table `tbc_wc_phrases`
--
ALTER TABLE `tbc_wc_phrases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `phrase_key` (`phrase_key`);

--
-- Indexes for table `tbc_wc_product_meta_lookup`
--
ALTER TABLE `tbc_wc_product_meta_lookup`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `virtual` (`virtual`),
  ADD KEY `downloadable` (`downloadable`),
  ADD KEY `stock_status` (`stock_status`),
  ADD KEY `stock_quantity` (`stock_quantity`),
  ADD KEY `onsale` (`onsale`),
  ADD KEY `min_max_price` (`min_price`,`max_price`);

--
-- Indexes for table `tbc_wc_reserved_stock`
--
ALTER TABLE `tbc_wc_reserved_stock`
  ADD PRIMARY KEY (`order_id`,`product_id`);

--
-- Indexes for table `tbc_wc_tax_rate_classes`
--
ALTER TABLE `tbc_wc_tax_rate_classes`
  ADD PRIMARY KEY (`tax_rate_class_id`),
  ADD UNIQUE KEY `slug` (`slug`(191));

--
-- Indexes for table `tbc_wc_users_rated`
--
ALTER TABLE `tbc_wc_users_rated`
  ADD PRIMARY KEY (`id`),
  ADD KEY `post_id` (`post_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbc_wc_users_voted`
--
ALTER TABLE `tbc_wc_users_voted`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `comment_id` (`comment_id`),
  ADD KEY `vote_type` (`vote_type`),
  ADD KEY `is_guest` (`is_guest`),
  ADD KEY `post_id` (`post_id`);

--
-- Indexes for table `tbc_wc_webhooks`
--
ALTER TABLE `tbc_wc_webhooks`
  ADD PRIMARY KEY (`webhook_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbc_woocommerce_api_keys`
--
ALTER TABLE `tbc_woocommerce_api_keys`
  ADD PRIMARY KEY (`key_id`),
  ADD KEY `consumer_key` (`consumer_key`),
  ADD KEY `consumer_secret` (`consumer_secret`);

--
-- Indexes for table `tbc_woocommerce_attribute_taxonomies`
--
ALTER TABLE `tbc_woocommerce_attribute_taxonomies`
  ADD PRIMARY KEY (`attribute_id`),
  ADD KEY `attribute_name` (`attribute_name`(20));

--
-- Indexes for table `tbc_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `tbc_woocommerce_downloadable_product_permissions`
  ADD PRIMARY KEY (`permission_id`),
  ADD KEY `download_order_key_product` (`product_id`,`order_id`,`order_key`(16),`download_id`),
  ADD KEY `download_order_product` (`download_id`,`order_id`,`product_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `user_order_remaining_expires` (`user_id`,`order_id`,`downloads_remaining`,`access_expires`);

--
-- Indexes for table `tbc_woocommerce_log`
--
ALTER TABLE `tbc_woocommerce_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `level` (`level`);

--
-- Indexes for table `tbc_woocommerce_order_itemmeta`
--
ALTER TABLE `tbc_woocommerce_order_itemmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `order_item_id` (`order_item_id`),
  ADD KEY `meta_key` (`meta_key`(32));

--
-- Indexes for table `tbc_woocommerce_order_items`
--
ALTER TABLE `tbc_woocommerce_order_items`
  ADD PRIMARY KEY (`order_item_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Indexes for table `tbc_woocommerce_payment_tokenmeta`
--
ALTER TABLE `tbc_woocommerce_payment_tokenmeta`
  ADD PRIMARY KEY (`meta_id`),
  ADD KEY `payment_token_id` (`payment_token_id`),
  ADD KEY `meta_key` (`meta_key`(32));

--
-- Indexes for table `tbc_woocommerce_payment_tokens`
--
ALTER TABLE `tbc_woocommerce_payment_tokens`
  ADD PRIMARY KEY (`token_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `tbc_woocommerce_sessions`
--
ALTER TABLE `tbc_woocommerce_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD UNIQUE KEY `session_key` (`session_key`);

--
-- Indexes for table `tbc_woocommerce_shipping_zones`
--
ALTER TABLE `tbc_woocommerce_shipping_zones`
  ADD PRIMARY KEY (`zone_id`);

--
-- Indexes for table `tbc_woocommerce_shipping_zone_locations`
--
ALTER TABLE `tbc_woocommerce_shipping_zone_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `location_type_code` (`location_type`(10),`location_code`(20));

--
-- Indexes for table `tbc_woocommerce_shipping_zone_methods`
--
ALTER TABLE `tbc_woocommerce_shipping_zone_methods`
  ADD PRIMARY KEY (`instance_id`);

--
-- Indexes for table `tbc_woocommerce_tax_rates`
--
ALTER TABLE `tbc_woocommerce_tax_rates`
  ADD PRIMARY KEY (`tax_rate_id`),
  ADD KEY `tax_rate_country` (`tax_rate_country`),
  ADD KEY `tax_rate_state` (`tax_rate_state`(2)),
  ADD KEY `tax_rate_class` (`tax_rate_class`(10)),
  ADD KEY `tax_rate_priority` (`tax_rate_priority`);

--
-- Indexes for table `tbc_woocommerce_tax_rate_locations`
--
ALTER TABLE `tbc_woocommerce_tax_rate_locations`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `tax_rate_id` (`tax_rate_id`),
  ADD KEY `location_type_code` (`location_type`(10),`location_code`(20));

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbc_actionscheduler_actions`
--
ALTER TABLE `tbc_actionscheduler_actions`
  MODIFY `action_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `tbc_actionscheduler_claims`
--
ALTER TABLE `tbc_actionscheduler_claims`
  MODIFY `claim_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbc_actionscheduler_groups`
--
ALTER TABLE `tbc_actionscheduler_groups`
  MODIFY `group_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbc_actionscheduler_logs`
--
ALTER TABLE `tbc_actionscheduler_logs`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `tbc_commentmeta`
--
ALTER TABLE `tbc_commentmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_comments`
--
ALTER TABLE `tbc_comments`
  MODIFY `comment_ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbc_links`
--
ALTER TABLE `tbc_links`
  MODIFY `link_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_newsletter`
--
ALTER TABLE `tbc_newsletter`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbc_newsletter_emails`
--
ALTER TABLE `tbc_newsletter_emails`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_newsletter_stats`
--
ALTER TABLE `tbc_newsletter_stats`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_newsletter_user_logs`
--
ALTER TABLE `tbc_newsletter_user_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_options`
--
ALTER TABLE `tbc_options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=771;

--
-- AUTO_INCREMENT for table `tbc_postmeta`
--
ALTER TABLE `tbc_postmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=254;

--
-- AUTO_INCREMENT for table `tbc_posts`
--
ALTER TABLE `tbc_posts`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `tbc_sendpress_connections`
--
ALTER TABLE `tbc_sendpress_connections`
  MODIFY `connection_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_sendpress_customfields`
--
ALTER TABLE `tbc_sendpress_customfields`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_sendpress_list_subscribers`
--
ALTER TABLE `tbc_sendpress_list_subscribers`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_sendpress_queue`
--
ALTER TABLE `tbc_sendpress_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_sendpress_subscribers`
--
ALTER TABLE `tbc_sendpress_subscribers`
  MODIFY `subscriberID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_sendpress_subscribers_meta`
--
ALTER TABLE `tbc_sendpress_subscribers_meta`
  MODIFY `smeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_sendpress_subscribers_status`
--
ALTER TABLE `tbc_sendpress_subscribers_status`
  MODIFY `statusid` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `tbc_sendpress_url`
--
ALTER TABLE `tbc_sendpress_url`
  MODIFY `url_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_termmeta`
--
ALTER TABLE `tbc_termmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbc_terms`
--
ALTER TABLE `tbc_terms`
  MODIFY `term_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbc_term_taxonomy`
--
ALTER TABLE `tbc_term_taxonomy`
  MODIFY `term_taxonomy_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `tbc_usermeta`
--
ALTER TABLE `tbc_usermeta`
  MODIFY `umeta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT for table `tbc_users`
--
ALTER TABLE `tbc_users`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbc_wc_admin_notes`
--
ALTER TABLE `tbc_wc_admin_notes`
  MODIFY `note_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `tbc_wc_admin_note_actions`
--
ALTER TABLE `tbc_wc_admin_note_actions`
  MODIFY `action_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `tbc_wc_avatars_cache`
--
ALTER TABLE `tbc_wc_avatars_cache`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_wc_comments_subscription`
--
ALTER TABLE `tbc_wc_comments_subscription`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_wc_customer_lookup`
--
ALTER TABLE `tbc_wc_customer_lookup`
  MODIFY `customer_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_wc_download_log`
--
ALTER TABLE `tbc_wc_download_log`
  MODIFY `download_log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_wc_feedback_forms`
--
ALTER TABLE `tbc_wc_feedback_forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_wc_follow_users`
--
ALTER TABLE `tbc_wc_follow_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_wc_phrases`
--
ALTER TABLE `tbc_wc_phrases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_wc_tax_rate_classes`
--
ALTER TABLE `tbc_wc_tax_rate_classes`
  MODIFY `tax_rate_class_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbc_wc_users_rated`
--
ALTER TABLE `tbc_wc_users_rated`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbc_wc_users_voted`
--
ALTER TABLE `tbc_wc_users_voted`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_wc_webhooks`
--
ALTER TABLE `tbc_wc_webhooks`
  MODIFY `webhook_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_woocommerce_api_keys`
--
ALTER TABLE `tbc_woocommerce_api_keys`
  MODIFY `key_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_woocommerce_attribute_taxonomies`
--
ALTER TABLE `tbc_woocommerce_attribute_taxonomies`
  MODIFY `attribute_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbc_woocommerce_downloadable_product_permissions`
--
ALTER TABLE `tbc_woocommerce_downloadable_product_permissions`
  MODIFY `permission_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_woocommerce_log`
--
ALTER TABLE `tbc_woocommerce_log`
  MODIFY `log_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_woocommerce_order_itemmeta`
--
ALTER TABLE `tbc_woocommerce_order_itemmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_woocommerce_order_items`
--
ALTER TABLE `tbc_woocommerce_order_items`
  MODIFY `order_item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_woocommerce_payment_tokenmeta`
--
ALTER TABLE `tbc_woocommerce_payment_tokenmeta`
  MODIFY `meta_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_woocommerce_payment_tokens`
--
ALTER TABLE `tbc_woocommerce_payment_tokens`
  MODIFY `token_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_woocommerce_sessions`
--
ALTER TABLE `tbc_woocommerce_sessions`
  MODIFY `session_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbc_woocommerce_shipping_zones`
--
ALTER TABLE `tbc_woocommerce_shipping_zones`
  MODIFY `zone_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_woocommerce_shipping_zone_locations`
--
ALTER TABLE `tbc_woocommerce_shipping_zone_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_woocommerce_shipping_zone_methods`
--
ALTER TABLE `tbc_woocommerce_shipping_zone_methods`
  MODIFY `instance_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_woocommerce_tax_rates`
--
ALTER TABLE `tbc_woocommerce_tax_rates`
  MODIFY `tax_rate_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tbc_woocommerce_tax_rate_locations`
--
ALTER TABLE `tbc_woocommerce_tax_rate_locations`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbc_wc_download_log`
--
ALTER TABLE `tbc_wc_download_log`
  ADD CONSTRAINT `fk_tbc_wc_download_log_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `tbc_woocommerce_downloadable_product_permissions` (`permission_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
