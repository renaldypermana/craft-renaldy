-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jul 14, 2020 at 12:14 PM
-- Server version: 5.7.24
-- PHP Version: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `craft_renaldy`
--

-- --------------------------------------------------------

--
-- Table structure for table `cr_assetindexdata`
--

CREATE TABLE `cr_assetindexdata` (
  `id` int(11) NOT NULL,
  `sessionId` varchar(36) NOT NULL DEFAULT '',
  `volumeId` int(11) NOT NULL,
  `uri` text,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `timestamp` datetime DEFAULT NULL,
  `recordId` int(11) DEFAULT NULL,
  `inProgress` tinyint(1) DEFAULT '0',
  `completed` tinyint(1) DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_assets`
--

CREATE TABLE `cr_assets` (
  `id` int(11) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `folderId` int(11) NOT NULL,
  `uploaderId` int(11) DEFAULT NULL,
  `filename` varchar(255) NOT NULL,
  `kind` varchar(50) NOT NULL DEFAULT 'unknown',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `size` bigint(20) UNSIGNED DEFAULT NULL,
  `focalPoint` varchar(13) DEFAULT NULL,
  `deletedWithVolume` tinyint(1) DEFAULT NULL,
  `keptFile` tinyint(1) DEFAULT NULL,
  `dateModified` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_assettransformindex`
--

CREATE TABLE `cr_assettransformindex` (
  `id` int(11) NOT NULL,
  `assetId` int(11) NOT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `location` varchar(255) NOT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `fileExists` tinyint(1) NOT NULL DEFAULT '0',
  `inProgress` tinyint(1) NOT NULL DEFAULT '0',
  `dateIndexed` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_assettransforms`
--

CREATE TABLE `cr_assettransforms` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `mode` enum('stretch','fit','crop') NOT NULL DEFAULT 'crop',
  `position` enum('top-left','top-center','top-right','center-left','center-center','center-right','bottom-left','bottom-center','bottom-right') NOT NULL DEFAULT 'center-center',
  `width` int(11) UNSIGNED DEFAULT NULL,
  `height` int(11) UNSIGNED DEFAULT NULL,
  `format` varchar(255) DEFAULT NULL,
  `quality` int(11) DEFAULT NULL,
  `interlace` enum('none','line','plane','partition') NOT NULL DEFAULT 'none',
  `dimensionChangeTime` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_categories`
--

CREATE TABLE `cr_categories` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_categorygroups`
--

CREATE TABLE `cr_categorygroups` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_categorygroups_sites`
--

CREATE TABLE `cr_categorygroups_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_changedattributes`
--

CREATE TABLE `cr_changedattributes` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `attribute` varchar(255) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_changedfields`
--

CREATE TABLE `cr_changedfields` (
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `propagated` tinyint(1) NOT NULL,
  `userId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_content`
--

CREATE TABLE `cr_content` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cr_content`
--

INSERT INTO `cr_content` (`id`, `elementId`, `siteId`, `title`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, '2020-07-13 12:03:08', '2020-07-13 12:03:08', 'caa3bcb2-9d57-483c-bef3-6dfd5d84ebbb');

-- --------------------------------------------------------

--
-- Table structure for table `cr_craftidtokens`
--

CREATE TABLE `cr_craftidtokens` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `accessToken` text NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_deprecationerrors`
--

CREATE TABLE `cr_deprecationerrors` (
  `id` int(11) NOT NULL,
  `key` varchar(255) NOT NULL,
  `fingerprint` varchar(255) NOT NULL,
  `lastOccurrence` datetime NOT NULL,
  `file` varchar(255) NOT NULL,
  `line` smallint(6) UNSIGNED DEFAULT NULL,
  `message` text,
  `traces` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_drafts`
--

CREATE TABLE `cr_drafts` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) DEFAULT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `notes` text,
  `trackChanges` tinyint(1) NOT NULL DEFAULT '0',
  `dateLastMerged` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_elementindexsettings`
--

CREATE TABLE `cr_elementindexsettings` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_elements`
--

CREATE TABLE `cr_elements` (
  `id` int(11) NOT NULL,
  `draftId` int(11) DEFAULT NULL,
  `revisionId` int(11) DEFAULT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `archived` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cr_elements`
--

INSERT INTO `cr_elements` (`id`, `draftId`, `revisionId`, `fieldLayoutId`, `type`, `enabled`, `archived`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, NULL, NULL, NULL, 'craft\\elements\\User', 1, 0, '2020-07-13 12:03:07', '2020-07-13 12:03:07', NULL, 'b8508f17-89c7-4d83-86e8-85f9e6f31d4e');

-- --------------------------------------------------------

--
-- Table structure for table `cr_elements_sites`
--

CREATE TABLE `cr_elements_sites` (
  `id` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cr_elements_sites`
--

INSERT INTO `cr_elements_sites` (`id`, `elementId`, `siteId`, `slug`, `uri`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 1, NULL, NULL, 1, '2020-07-13 12:03:07', '2020-07-13 12:03:07', '8b63821d-51da-41c3-b5c2-6fb0cd38ac08');

-- --------------------------------------------------------

--
-- Table structure for table `cr_entries`
--

CREATE TABLE `cr_entries` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `typeId` int(11) NOT NULL,
  `authorId` int(11) DEFAULT NULL,
  `postDate` datetime DEFAULT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `deletedWithEntryType` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_entrytypes`
--

CREATE TABLE `cr_entrytypes` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `hasTitleField` tinyint(1) NOT NULL DEFAULT '1',
  `titleLabel` varchar(255) DEFAULT 'Title',
  `titleFormat` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_fieldgroups`
--

CREATE TABLE `cr_fieldgroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cr_fieldgroups`
--

INSERT INTO `cr_fieldgroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'Common', '2020-07-13 12:03:06', '2020-07-13 12:03:06', 'dacca318-9d94-4133-b9a0-0989eead7915');

-- --------------------------------------------------------

--
-- Table structure for table `cr_fieldlayoutfields`
--

CREATE TABLE `cr_fieldlayoutfields` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `tabId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT '0',
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_fieldlayouts`
--

CREATE TABLE `cr_fieldlayouts` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_fieldlayouttabs`
--

CREATE TABLE `cr_fieldlayouttabs` (
  `id` int(11) NOT NULL,
  `layoutId` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_fields`
--

CREATE TABLE `cr_fields` (
  `id` int(11) NOT NULL,
  `groupId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(64) NOT NULL,
  `context` varchar(255) NOT NULL DEFAULT 'global',
  `instructions` text,
  `searchable` tinyint(1) NOT NULL DEFAULT '1',
  `translationMethod` varchar(255) NOT NULL DEFAULT 'none',
  `translationKeyFormat` text,
  `type` varchar(255) NOT NULL,
  `settings` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_globalsets`
--

CREATE TABLE `cr_globalsets` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_gqlschemas`
--

CREATE TABLE `cr_gqlschemas` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `scope` text,
  `isPublic` tinyint(1) NOT NULL DEFAULT '0',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_gqltokens`
--

CREATE TABLE `cr_gqltokens` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `accessToken` varchar(255) NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `expiryDate` datetime DEFAULT NULL,
  `lastUsed` datetime DEFAULT NULL,
  `schemaId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_info`
--

CREATE TABLE `cr_info` (
  `id` int(11) NOT NULL,
  `version` varchar(50) NOT NULL,
  `schemaVersion` varchar(15) NOT NULL,
  `maintenance` tinyint(1) NOT NULL DEFAULT '0',
  `configMap` mediumtext,
  `fieldVersion` char(12) NOT NULL DEFAULT '000000000000',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cr_info`
--

INSERT INTO `cr_info` (`id`, `version`, `schemaVersion`, `maintenance`, `configMap`, `fieldVersion`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, '3.4.27', '3.4.10', 0, '[]', 'EQcffiI6Oqb4', '2020-07-13 12:03:05', '2020-07-13 12:03:05', 'af048e92-9813-4a96-9986-005f14fa8d7a');

-- --------------------------------------------------------

--
-- Table structure for table `cr_matrixblocks`
--

CREATE TABLE `cr_matrixblocks` (
  `id` int(11) NOT NULL,
  `ownerId` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `typeId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `deletedWithOwner` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_matrixblocktypes`
--

CREATE TABLE `cr_matrixblocktypes` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_migrations`
--

CREATE TABLE `cr_migrations` (
  `id` int(11) NOT NULL,
  `pluginId` int(11) DEFAULT NULL,
  `type` enum('app','plugin','content') NOT NULL DEFAULT 'app',
  `name` varchar(255) NOT NULL,
  `applyTime` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cr_migrations`
--

INSERT INTO `cr_migrations` (`id`, `pluginId`, `type`, `name`, `applyTime`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, NULL, 'app', 'Install', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '9b71787e-ba36-48fd-ab50-7a1815b903c0'),
(2, NULL, 'app', 'm150403_183908_migrations_table_changes', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '4bf9eab0-23bb-4e16-b1e4-94333977679a'),
(3, NULL, 'app', 'm150403_184247_plugins_table_changes', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '06f15594-6a5d-40ae-9caa-576637e7ea3a'),
(4, NULL, 'app', 'm150403_184533_field_version', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '71cb4ab3-5684-4f61-996f-0e9e8740fd87'),
(5, NULL, 'app', 'm150403_184729_type_columns', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '9e77cc16-abce-4081-8d15-c2a486700c8f'),
(6, NULL, 'app', 'm150403_185142_volumes', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '2020-07-13 12:03:09', 'ab37460c-e324-4c1b-bd61-8de50d993e36'),
(7, NULL, 'app', 'm150428_231346_userpreferences', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '1f19c5aa-895c-4486-8150-e97fdb90e0d6'),
(8, NULL, 'app', 'm150519_150900_fieldversion_conversion', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '797cce0e-116b-460d-9607-e7a26955575c'),
(9, NULL, 'app', 'm150617_213829_update_email_settings', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '2020-07-13 12:03:09', 'ca6094ba-1c79-4e6a-ac0a-5a17f064975c'),
(10, NULL, 'app', 'm150721_124739_templatecachequeries', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '2020-07-13 12:03:09', 'db86d8da-d294-43fd-adac-754e029e1e5c'),
(11, NULL, 'app', 'm150724_140822_adjust_quality_settings', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '2632b298-6284-4d05-8f8f-225785f9de8c'),
(12, NULL, 'app', 'm150815_133521_last_login_attempt_ip', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '0730c876-378f-4699-9b67-6b6f4be9613c'),
(13, NULL, 'app', 'm151002_095935_volume_cache_settings', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '2020-07-13 12:03:09', 'd2905ad6-5e09-4bcd-a4d0-5319c796e06c'),
(14, NULL, 'app', 'm151005_142750_volume_s3_storage_settings', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '2020-07-13 12:03:09', 'f1eea96d-64ca-4cab-8a50-fc54b0e0cbb9'),
(15, NULL, 'app', 'm151016_133600_delete_asset_thumbnails', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '2020-07-13 12:03:09', 'f3d12fae-7658-4e2d-b41a-c8b0e0725f36'),
(16, NULL, 'app', 'm151209_000000_move_logo', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '062901ff-3fdf-470a-917f-be0e9865e94b'),
(17, NULL, 'app', 'm151211_000000_rename_fileId_to_assetId', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '69bd4494-0980-45a8-91c4-2d8fa60679c9'),
(18, NULL, 'app', 'm151215_000000_rename_asset_permissions', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '2020-07-13 12:03:09', '32ad5cd4-ad4d-43ae-a17e-94623dd50592'),
(19, NULL, 'app', 'm160707_000001_rename_richtext_assetsource_setting', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '7e1dae5c-9355-4f41-bdee-22f82924f2bf'),
(20, NULL, 'app', 'm160708_185142_volume_hasUrls_setting', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '4a509bc3-6940-4c9f-89a4-d9345895eb27'),
(21, NULL, 'app', 'm160714_000000_increase_max_asset_filesize', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '4f8f7497-db8f-4454-ac93-4432082528ce'),
(22, NULL, 'app', 'm160727_194637_column_cleanup', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '2020-07-13 12:03:10', 'b0d5763f-41e1-492e-a7b4-edbbab9adf17'),
(23, NULL, 'app', 'm160804_110002_userphotos_to_assets', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '6020f834-4ae0-4fd9-b33c-9cceafe4ea41'),
(24, NULL, 'app', 'm160807_144858_sites', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '975da725-9274-421d-bcc3-0ed571cd8de3'),
(25, NULL, 'app', 'm160829_000000_pending_user_content_cleanup', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '0afcf11d-0823-468c-b3e9-b46fbf33a861'),
(26, NULL, 'app', 'm160830_000000_asset_index_uri_increase', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '5169b455-b394-44fd-8779-f3d3c9671531'),
(27, NULL, 'app', 'm160912_230520_require_entry_type_id', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '2020-07-13 12:03:10', 'a2c0f583-211e-4fea-8a15-56220879ecd8'),
(28, NULL, 'app', 'm160913_134730_require_matrix_block_type_id', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '33e9d536-ed3f-4ae0-b90a-0f588202b605'),
(29, NULL, 'app', 'm160920_174553_matrixblocks_owner_site_id_nullable', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '146e46f6-2f3d-4934-8dc4-a30013e44ec6'),
(30, NULL, 'app', 'm160920_231045_usergroup_handle_title_unique', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '2020-07-13 12:03:10', 'dc7c6f9a-a2bd-41d3-b09f-6293d8c65fd1'),
(31, NULL, 'app', 'm160925_113941_route_uri_parts', '2020-07-13 12:03:10', '2020-07-13 12:03:10', '2020-07-13 12:03:10', 'b3cc8789-2ad9-498e-b05e-f99132e2c837'),
(32, NULL, 'app', 'm161006_205918_schemaVersion_not_null', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '2020-07-13 12:03:11', 'e3510184-c592-4a96-9fc6-871ad328a1e6'),
(33, NULL, 'app', 'm161007_130653_update_email_settings', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '23118d00-7443-41c3-804d-787046594388'),
(34, NULL, 'app', 'm161013_175052_newParentId', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '2020-07-13 12:03:11', 'ad8fdb2b-4186-4721-8c5a-e9cb2c2805e1'),
(35, NULL, 'app', 'm161021_102916_fix_recent_entries_widgets', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '89017e2c-2002-4baf-ad15-f2f4c725c2bd'),
(36, NULL, 'app', 'm161021_182140_rename_get_help_widget', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '2020-07-13 12:03:11', 'ac6ab6be-b9af-45fd-9454-79c476448290'),
(37, NULL, 'app', 'm161025_000000_fix_char_columns', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '81acaef3-d248-4873-8723-ac9808a8ad08'),
(38, NULL, 'app', 'm161029_124145_email_message_languages', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '3ed26019-97e4-45b2-8e0f-27e5be08f284'),
(39, NULL, 'app', 'm161108_000000_new_version_format', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '2020-07-13 12:03:11', 'aeba8c78-f9da-4cb0-bc54-683ca8289ca9'),
(40, NULL, 'app', 'm161109_000000_index_shuffle', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '8a8dae14-6408-43e0-9bfe-24afa21188d5'),
(41, NULL, 'app', 'm161122_185500_no_craft_app', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '18346e26-4cf3-48c9-b308-2984151eeb23'),
(42, NULL, 'app', 'm161125_150752_clear_urlmanager_cache', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '2cceebea-7160-4152-b00f-3db2c267899d'),
(43, NULL, 'app', 'm161220_000000_volumes_hasurl_notnull', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '7581b353-7e3c-492e-85bb-0ce080a34502'),
(44, NULL, 'app', 'm170114_161144_udates_permission', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '2020-07-13 12:03:11', '54074829-001c-48db-862f-770004fdc6cc'),
(45, NULL, 'app', 'm170120_000000_schema_cleanup', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '2e667141-3d2b-4cf9-b1a3-44e71985f2d6'),
(46, NULL, 'app', 'm170126_000000_assets_focal_point', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '137790c4-dcc9-4741-babc-81f937cb920f'),
(47, NULL, 'app', 'm170206_142126_system_name', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '692ab86b-187f-4425-b8a5-41562b61d3f3'),
(48, NULL, 'app', 'm170217_044740_category_branch_limits', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '40b550ea-9fb7-4f11-962b-bc1a305afa74'),
(49, NULL, 'app', 'm170217_120224_asset_indexing_columns', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '620632ae-70e4-4cfd-b30b-add5d83584db'),
(50, NULL, 'app', 'm170223_224012_plain_text_settings', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '2020-07-13 12:03:12', 'eeb70bf3-6312-4ca5-ab09-d3f61aae193b'),
(51, NULL, 'app', 'm170227_120814_focal_point_percentage', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '2020-07-13 12:03:12', 'db746064-766e-4061-a335-9304ba6d8b0b'),
(52, NULL, 'app', 'm170228_171113_system_messages', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '128ea670-aeed-4450-bbdc-844d5215014f'),
(53, NULL, 'app', 'm170303_140500_asset_field_source_settings', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '4b488991-8d20-4828-872c-f96af4aaf7ff'),
(54, NULL, 'app', 'm170306_150500_asset_temporary_uploads', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '3f395ae7-d2b8-4902-8014-260055c2bd73'),
(55, NULL, 'app', 'm170523_190652_element_field_layout_ids', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '09838657-929a-42fa-9741-adef86d17aae'),
(56, NULL, 'app', 'm170612_000000_route_index_shuffle', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '629dda1a-1a21-44a5-ad5b-d98edf2d91d8'),
(57, NULL, 'app', 'm170621_195237_format_plugin_handles', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '06b0d5ca-3984-4139-a56b-faa7390b5e51'),
(58, NULL, 'app', 'm170630_161027_deprecation_line_nullable', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '2020-07-13 12:03:12', 'adc661be-91e7-4e9a-82df-5212e993a8b6'),
(59, NULL, 'app', 'm170630_161028_deprecation_changes', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '9d9504ec-863a-4bc3-b9ab-a0d1c1191723'),
(60, NULL, 'app', 'm170703_181539_plugins_table_tweaks', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '2020-07-13 12:03:12', '667b20a3-596e-4857-b0c9-d98f6bf72e3d'),
(61, NULL, 'app', 'm170704_134916_sites_tables', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '2020-07-13 12:03:13', 'ad4d6b8c-4fc2-4f00-a534-c71065ff6327'),
(62, NULL, 'app', 'm170706_183216_rename_sequences', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '0c6ab9a5-c31f-40f6-83f7-9e3ee18de23a'),
(63, NULL, 'app', 'm170707_094758_delete_compiled_traits', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '2020-07-13 12:03:13', 'cb60f3bd-147d-4f96-824e-ee6dca8cd9ac'),
(64, NULL, 'app', 'm170731_190138_drop_asset_packagist', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '90661ee1-f37a-4530-89f6-22d795132580'),
(65, NULL, 'app', 'm170810_201318_create_queue_table', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '27b257fa-6fb8-413b-97d0-bc56aa7c5065'),
(66, NULL, 'app', 'm170903_192801_longblob_for_queue_jobs', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '21fdaa22-6440-4487-9474-12887c946095'),
(67, NULL, 'app', 'm170914_204621_asset_cache_shuffle', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '749216b2-1c3d-4e56-a8f1-1771f0a73207'),
(68, NULL, 'app', 'm171011_214115_site_groups', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '06242b22-7cfb-45fc-8c14-eb30fdaec739'),
(69, NULL, 'app', 'm171012_151440_primary_site', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '3724a1e9-3989-470c-ac55-0b05903cebca'),
(70, NULL, 'app', 'm171013_142500_transform_interlace', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '67385ac7-1b38-48e4-8e72-0fb34dd2e142'),
(71, NULL, 'app', 'm171016_092553_drop_position_select', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '51036e48-0440-48a7-b2c9-44eac5309eac'),
(72, NULL, 'app', 'm171016_221244_less_strict_translation_method', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '09ec6955-4e38-4347-8d2b-21341022aa1c'),
(73, NULL, 'app', 'm171107_000000_assign_group_permissions', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '2020-07-13 12:03:13', 'b3413a15-46aa-4944-b16d-4423cf265522'),
(74, NULL, 'app', 'm171117_000001_templatecache_index_tune', '2020-07-13 12:03:13', '2020-07-13 12:03:13', '2020-07-13 12:03:13', 'e8183f14-704c-4976-9678-5ccee241d7fd'),
(75, NULL, 'app', 'm171126_105927_disabled_plugins', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '7710159b-3ce4-4558-8ea4-6d21a0ade661'),
(76, NULL, 'app', 'm171130_214407_craftidtokens_table', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '364e45f6-5ec1-4c96-9dbe-d144044fefc1'),
(77, NULL, 'app', 'm171202_004225_update_email_settings', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', 'e56535ac-2cbe-414e-b19b-939753efbf62'),
(78, NULL, 'app', 'm171204_000001_templatecache_index_tune_deux', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '0c309005-70f9-4ed3-a291-201cefa45186'),
(79, NULL, 'app', 'm171205_130908_remove_craftidtokens_refreshtoken_column', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', 'c4ccf412-679e-4f18-bee4-f1690bf3cbed'),
(80, NULL, 'app', 'm171218_143135_longtext_query_column', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', 'c937f9a9-b151-48e6-819e-0555ed94d9a6'),
(81, NULL, 'app', 'm171231_055546_environment_variables_to_aliases', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', 'c2136c9c-c001-4a7a-871f-da99b4eb05b4'),
(82, NULL, 'app', 'm180113_153740_drop_users_archived_column', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '32562aed-61db-464d-9b8e-ee24cbdaa93f'),
(83, NULL, 'app', 'm180122_213433_propagate_entries_setting', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', 'a285ef72-9d32-45b5-89ef-53906a9b03aa'),
(84, NULL, 'app', 'm180124_230459_fix_propagate_entries_values', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2f4b0a01-4d3a-4ac0-9032-b0ddbb02b047'),
(85, NULL, 'app', 'm180128_235202_set_tag_slugs', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '4d8e11d8-4593-412e-876d-1806a1ade9a7'),
(86, NULL, 'app', 'm180202_185551_fix_focal_points', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '7a2cc614-9978-4773-be6f-36eff53a36af'),
(87, NULL, 'app', 'm180217_172123_tiny_ints', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', 'f2903092-3d9d-4a37-87d6-11bdfc2d6e40'),
(88, NULL, 'app', 'm180321_233505_small_ints', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', 'c8b4f88a-af9d-4ca8-8cea-0fc4ff6155a8'),
(89, NULL, 'app', 'm180328_115523_new_license_key_statuses', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '8721f5ce-c13e-4eaa-98a9-57a775aa4139'),
(90, NULL, 'app', 'm180404_182320_edition_changes', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '87581de8-556f-4372-a9d6-bd6253862a3e'),
(91, NULL, 'app', 'm180411_102218_fix_db_routes', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '303bfe2d-e68f-43ff-ba1b-24edbf5a81a9'),
(92, NULL, 'app', 'm180416_205628_resourcepaths_table', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '82924f97-e2f0-4fb6-aa63-e792e9a8f4e4'),
(93, NULL, 'app', 'm180418_205713_widget_cleanup', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '5ad9c2d5-1f58-4857-8824-7d2262b7de2f'),
(94, NULL, 'app', 'm180425_203349_searchable_fields', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', 'e03e4420-1d56-4269-9bb1-fef117b393f4'),
(95, NULL, 'app', 'm180516_153000_uids_in_field_settings', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', 'ed052e53-03f3-41ac-b255-5a5250097f1b'),
(96, NULL, 'app', 'm180517_173000_user_photo_volume_to_uid', '2020-07-13 12:03:14', '2020-07-13 12:03:14', '2020-07-13 12:03:14', 'e876a66d-807d-49ce-aac9-f027a56829b9'),
(97, NULL, 'app', 'm180518_173000_permissions_to_uid', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '2020-07-13 12:03:15', 'fc4f78e5-42f8-483c-8b27-dfe159d85a44'),
(98, NULL, 'app', 'm180520_173000_matrix_context_to_uids', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '7d6101a9-9249-4ab0-bcdf-a73135a708c4'),
(99, NULL, 'app', 'm180521_172900_project_config_table', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '875a3db1-4be0-4ab4-b349-0c47137f7cee'),
(100, NULL, 'app', 'm180521_173000_initial_yml_and_snapshot', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '2020-07-13 12:03:15', 'd43e305c-4c93-4fcd-8f5b-5b160d8a5b9b'),
(101, NULL, 'app', 'm180731_162030_soft_delete_sites', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '2020-07-13 12:03:15', 'fd760b5c-e8c2-4453-8e84-e6ce5871d8bf'),
(102, NULL, 'app', 'm180810_214427_soft_delete_field_layouts', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '2020-07-13 12:03:15', 'ba532227-08ce-4725-abbe-dfdfb0409755'),
(103, NULL, 'app', 'm180810_214439_soft_delete_elements', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '60b8ea47-f1b0-4c92-9677-d10b9378e4c4'),
(104, NULL, 'app', 'm180824_193422_case_sensitivity_fixes', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '2020-07-13 12:03:15', 'cd8322d6-5b2b-4443-a230-aee3f3c39933'),
(105, NULL, 'app', 'm180901_151639_fix_matrixcontent_tables', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '40f51ea3-5256-43cd-a464-69f942b096b2'),
(106, NULL, 'app', 'm180904_112109_permission_changes', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '4e8a8ae1-b8ea-4f5e-8212-bc927a9f6088'),
(107, NULL, 'app', 'm180910_142030_soft_delete_sitegroups', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '25fe991f-cbe8-49c5-a624-40d48a4d133b'),
(108, NULL, 'app', 'm181011_160000_soft_delete_asset_support', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '03391bf3-2cbb-4db5-b640-31b56907e18d'),
(109, NULL, 'app', 'm181016_183648_set_default_user_settings', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '2020-07-13 12:03:15', 'c22f44bc-9c89-4d14-8a4f-fa9b83780dca'),
(110, NULL, 'app', 'm181017_225222_system_config_settings', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '2020-07-13 12:03:15', 'a4d71c24-07c8-4559-8588-8cdf776fce3d'),
(111, NULL, 'app', 'm181018_222343_drop_userpermissions_from_config', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '0e7475df-88bf-4848-abc4-038e94d1ed6c'),
(112, NULL, 'app', 'm181029_130000_add_transforms_routes_to_config', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '7033b2d9-5cdf-4eb4-8cdb-eee1024d91d4'),
(113, NULL, 'app', 'm181112_203955_sequences_table', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '701f1a42-b2bc-4a70-882a-f4d6d76992c2'),
(114, NULL, 'app', 'm181121_001712_cleanup_field_configs', '2020-07-13 12:03:15', '2020-07-13 12:03:15', '2020-07-13 12:03:15', 'd7f1d417-07a7-4f2a-97fd-f9935fb05157'),
(115, NULL, 'app', 'm181128_193942_fix_project_config', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '82fbdc62-7a45-4a2b-9bc2-fd62b64211e3'),
(116, NULL, 'app', 'm181130_143040_fix_schema_version', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '2020-07-13 12:03:16', 'cc814dd3-bf0e-4827-965d-6bcfc80c986d'),
(117, NULL, 'app', 'm181211_143040_fix_entry_type_uids', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '6dc00f05-2454-41e5-98a1-c6eee9e025d1'),
(118, NULL, 'app', 'm181213_102500_config_map_aliases', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '2020-07-13 12:03:16', 'f6351bdd-a2f8-4599-9b19-2f8e80915a9e'),
(119, NULL, 'app', 'm181217_153000_fix_structure_uids', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '2020-07-13 12:03:16', 'cb7715cd-3625-4bbd-8a46-561cdff54691'),
(120, NULL, 'app', 'm190104_152725_store_licensed_plugin_editions', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '69835536-8ccc-4144-b11b-e7a47832af2a'),
(121, NULL, 'app', 'm190108_110000_cleanup_project_config', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '2020-07-13 12:03:16', 'c22da1a7-1827-4042-bbb8-67bf39ae6cf3'),
(122, NULL, 'app', 'm190108_113000_asset_field_setting_change', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '2020-07-13 12:03:16', 'dfec9b74-7d02-4544-9b7a-c45e5792bdcd'),
(123, NULL, 'app', 'm190109_172845_fix_colspan', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '856139e9-01be-45ab-988d-dc9d9047ea11'),
(124, NULL, 'app', 'm190110_150000_prune_nonexisting_sites', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '6fbec6a7-f2cc-4c4b-a98d-b130731a2427'),
(125, NULL, 'app', 'm190110_214819_soft_delete_volumes', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '36522ce0-63cd-469e-abd5-248d39d036f5'),
(126, NULL, 'app', 'm190112_124737_fix_user_settings', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '619fd43c-fdc8-41d9-8906-27890522889a'),
(127, NULL, 'app', 'm190112_131225_fix_field_layouts', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '2020-07-13 12:03:16', 'd6f68a5c-10e6-44d9-a0f9-069e8d182922'),
(128, NULL, 'app', 'm190112_201010_more_soft_deletes', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '2020-07-13 12:03:16', '6fa8c4a8-05fd-4d0e-9b88-ba5b07f769a1'),
(129, NULL, 'app', 'm190114_143000_more_asset_field_setting_changes', '2020-07-13 12:03:17', '2020-07-13 12:03:17', '2020-07-13 12:03:17', 'ad34d71f-ca5c-417c-92b8-3fffc3491628'),
(130, NULL, 'app', 'm190121_120000_rich_text_config_setting', '2020-07-13 12:03:17', '2020-07-13 12:03:17', '2020-07-13 12:03:17', '1b340405-3699-422a-aa54-455be55620c8'),
(131, NULL, 'app', 'm190125_191628_fix_email_transport_password', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '5559a278-909b-4fe1-a2f2-a00c9eed150d'),
(132, NULL, 'app', 'm190128_181422_cleanup_volume_folders', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '02a15acb-3986-44ef-8a19-6a3ce38b0de2'),
(133, NULL, 'app', 'm190205_140000_fix_asset_soft_delete_index', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '2020-07-13 12:03:18', 'e2c537ef-96ee-4f21-a106-2e2de64a9308'),
(134, NULL, 'app', 'm190208_140000_reset_project_config_mapping', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '7bd08332-b758-40fe-a4ae-21c5d8898cca'),
(135, NULL, 'app', 'm190218_143000_element_index_settings_uid', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '2020-07-13 12:03:18', 'e9b94ce7-7e5d-4260-97b0-1a68b877a777'),
(136, NULL, 'app', 'm190312_152740_element_revisions', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '2020-07-13 12:03:18', 'db90f696-32d3-41ce-b864-dcebf2263b27'),
(137, NULL, 'app', 'm190327_235137_propagation_method', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '2020-07-13 12:03:18', 'ad73c96b-4bd0-4b82-a12f-57a35dcc77f0'),
(138, NULL, 'app', 'm190401_223843_drop_old_indexes', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '88288e81-7607-47f6-88de-150177f5e9b5'),
(139, NULL, 'app', 'm190416_014525_drop_unique_global_indexes', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '42c2301d-9a20-43aa-bd7c-64ffdebb8434'),
(140, NULL, 'app', 'm190417_085010_add_image_editor_permissions', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '2020-07-13 12:03:18', 'a04bae2f-30b7-4786-b06d-f12bf3118d97'),
(141, NULL, 'app', 'm190502_122019_store_default_user_group_uid', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '00a59a47-a08d-4ae5-844a-c1c9c3a9d0f4'),
(142, NULL, 'app', 'm190504_150349_preview_targets', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '706cce0b-b09e-44ed-970d-cd67b05c0102'),
(143, NULL, 'app', 'm190516_184711_job_progress_label', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '185402ef-dfd3-4bcf-84d9-fe7da2fff696'),
(144, NULL, 'app', 'm190523_190303_optional_revision_creators', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '95d6e0a6-3e5e-47da-a5a3-9e78bcdaa823'),
(145, NULL, 'app', 'm190529_204501_fix_duplicate_uids', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '2020-07-13 12:03:18', 'bc90d3ab-5f8a-4cad-b6b9-8365cefbe7f2'),
(146, NULL, 'app', 'm190605_223807_unsaved_drafts', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '87dad01c-dcea-4917-a383-b9728cfa4d48'),
(147, NULL, 'app', 'm190607_230042_entry_revision_error_tables', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '8015fae5-0859-4652-9d9d-6b012e340e84'),
(148, NULL, 'app', 'm190608_033429_drop_elements_uid_idx', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '2020-07-13 12:03:18', '8f63ebd8-46f1-48c8-8aeb-21f8c8ca3e99'),
(149, NULL, 'app', 'm190617_164400_add_gqlschemas_table', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '63dc2a28-029e-424d-99d0-459f1a759726'),
(150, NULL, 'app', 'm190624_234204_matrix_propagation_method', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '7f8307ac-2554-493c-98b5-cfb0090d3791'),
(151, NULL, 'app', 'm190711_153020_drop_snapshots', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '2020-07-13 12:03:19', 'ce1e6297-0ba1-49fa-b8ef-de56a2c2dd65'),
(152, NULL, 'app', 'm190712_195914_no_draft_revisions', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '59660a1d-1e27-403c-b0a4-9bd316cfd9ff'),
(153, NULL, 'app', 'm190723_140314_fix_preview_targets_column', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '5943dc5d-007f-4054-9b7e-a95ceb21a68d'),
(154, NULL, 'app', 'm190820_003519_flush_compiled_templates', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '55a36971-b0f9-4d24-a455-3b8d2cff4f16'),
(155, NULL, 'app', 'm190823_020339_optional_draft_creators', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '2020-07-13 12:03:19', 'd86f06d0-caee-4ec8-9c87-4dbd62e39f50'),
(156, NULL, 'app', 'm190913_152146_update_preview_targets', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '58981a48-b121-4e08-9a1d-eb75ae7d6d89'),
(157, NULL, 'app', 'm191107_122000_add_gql_project_config_support', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '2020-07-13 12:03:19', 'f85cff52-0022-4abc-bf6c-b35141816114'),
(158, NULL, 'app', 'm191204_085100_pack_savable_component_settings', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '2dcb6f2d-c12f-4d40-be63-6ebd66942c74'),
(159, NULL, 'app', 'm191206_001148_change_tracking', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '2020-07-13 12:03:19', 'b8938888-f922-47d9-acc6-06897d09fa53'),
(160, NULL, 'app', 'm191216_191635_asset_upload_tracking', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '61b9800a-0bbc-46e0-8026-8d51b81c9564'),
(161, NULL, 'app', 'm191222_002848_peer_asset_permissions', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '437dd7d1-1529-4a2b-9c1e-47fb73a9daec'),
(162, NULL, 'app', 'm200127_172522_queue_channels', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '8eb7f8d5-5a6b-4c79-844b-26e14189206f'),
(163, NULL, 'app', 'm200211_175048_truncate_element_query_cache', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '2020-07-13 12:03:19', 'be61a8f7-2133-4acc-954b-47250c2f4101'),
(164, NULL, 'app', 'm200213_172522_new_elements_index', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '2020-07-13 12:03:19', 'a96fc0d4-a623-4579-92bd-0682c4a12461'),
(165, NULL, 'app', 'm200228_195211_long_deprecation_messages', '2020-07-13 12:03:19', '2020-07-13 12:03:19', '2020-07-13 12:03:19', 'e33dfe6f-ab2b-482c-9f03-ba484aa0f931');

-- --------------------------------------------------------

--
-- Table structure for table `cr_plugins`
--

CREATE TABLE `cr_plugins` (
  `id` int(11) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `schemaVersion` varchar(255) NOT NULL,
  `licenseKeyStatus` enum('valid','invalid','mismatched','astray','unknown') NOT NULL DEFAULT 'unknown',
  `licensedEdition` varchar(255) DEFAULT NULL,
  `installDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_projectconfig`
--

CREATE TABLE `cr_projectconfig` (
  `path` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cr_projectconfig`
--

INSERT INTO `cr_projectconfig` (`path`, `value`) VALUES
('dateModified', '1594641786'),
('email.fromEmail', '\"renaldypermana7@gmail.com\"'),
('email.fromName', '\"craft renaldy\"'),
('email.transportType', '\"craft\\\\mail\\\\transportadapters\\\\Sendmail\"'),
('fieldGroups.dacca318-9d94-4133-b9a0-0989eead7915.name', '\"Common\"'),
('siteGroups.ed8d72aa-cd8a-45fb-b237-a288fb293463.name', '\"craft renaldy\"'),
('sites.de532045-685d-434f-857f-a6acc9152466.baseUrl', '\"$DEFAULT_SITE_URL\"'),
('sites.de532045-685d-434f-857f-a6acc9152466.handle', '\"default\"'),
('sites.de532045-685d-434f-857f-a6acc9152466.hasUrls', 'true'),
('sites.de532045-685d-434f-857f-a6acc9152466.language', '\"en-US\"'),
('sites.de532045-685d-434f-857f-a6acc9152466.name', '\"craft renaldy\"'),
('sites.de532045-685d-434f-857f-a6acc9152466.primary', 'true'),
('sites.de532045-685d-434f-857f-a6acc9152466.siteGroup', '\"ed8d72aa-cd8a-45fb-b237-a288fb293463\"'),
('sites.de532045-685d-434f-857f-a6acc9152466.sortOrder', '1'),
('system.edition', '\"solo\"'),
('system.live', 'true'),
('system.name', '\"craft renaldy\"'),
('system.schemaVersion', '\"3.4.10\"'),
('system.timeZone', '\"America/Los_Angeles\"'),
('users.allowPublicRegistration', 'false'),
('users.defaultGroup', 'null'),
('users.photoSubpath', '\"\"'),
('users.photoVolumeUid', 'null'),
('users.requireEmailVerification', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `cr_queue`
--

CREATE TABLE `cr_queue` (
  `id` int(11) NOT NULL,
  `channel` varchar(255) NOT NULL DEFAULT 'queue',
  `job` longblob NOT NULL,
  `description` text,
  `timePushed` int(11) NOT NULL,
  `ttr` int(11) NOT NULL,
  `delay` int(11) NOT NULL DEFAULT '0',
  `priority` int(11) UNSIGNED NOT NULL DEFAULT '1024',
  `dateReserved` datetime DEFAULT NULL,
  `timeUpdated` int(11) DEFAULT NULL,
  `progress` smallint(6) NOT NULL DEFAULT '0',
  `progressLabel` varchar(255) DEFAULT NULL,
  `attempt` int(11) DEFAULT NULL,
  `fail` tinyint(1) DEFAULT '0',
  `dateFailed` datetime DEFAULT NULL,
  `error` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_relations`
--

CREATE TABLE `cr_relations` (
  `id` int(11) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `sourceSiteId` int(11) DEFAULT NULL,
  `targetId` int(11) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_resourcepaths`
--

CREATE TABLE `cr_resourcepaths` (
  `hash` varchar(255) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cr_resourcepaths`
--

INSERT INTO `cr_resourcepaths` (`hash`, `path`) VALUES
('1020676f', '@app/web/assets/updateswidget/dist'),
('12e5419c', '@lib/jquery-ui'),
('2e9a2501', '@app/web/assets/recententries/dist'),
('331f5216', '@lib/axios'),
('34144183', '@app/web/assets/installer/dist'),
('359f986d', '@app/web/assets/craftsupport/dist'),
('406b75d1', '@lib/jquery.payment'),
('4557eb78', '@lib/velocity'),
('4dc32d44', '@bower/jquery/dist'),
('4ea0f6c9', '@app/web/assets/cp/dist'),
('5df7570', '@app/web/assets/login/dist'),
('61e11af1', '@app/web/assets/feed/dist'),
('625386b1', '@lib/element-resize-detector'),
('8660498c', '@lib/xregexp'),
('8c0c0d06', '@lib/selectize'),
('c16911c3', '@lib/picturefill'),
('c6cd2d01', '@lib/jquery-touch-events'),
('cfcc3192', '@lib/d3'),
('d981103d', '@lib/fileupload'),
('dbf71f03', '@app/web/assets/dashboard/dist'),
('e937f22a', '@lib/fabric'),
('fc712614', '@lib/garnishjs');

-- --------------------------------------------------------

--
-- Table structure for table `cr_revisions`
--

CREATE TABLE `cr_revisions` (
  `id` int(11) NOT NULL,
  `sourceId` int(11) NOT NULL,
  `creatorId` int(11) DEFAULT NULL,
  `num` int(11) NOT NULL,
  `notes` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_searchindex`
--

CREATE TABLE `cr_searchindex` (
  `elementId` int(11) NOT NULL,
  `attribute` varchar(25) NOT NULL,
  `fieldId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `keywords` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cr_searchindex`
--

INSERT INTO `cr_searchindex` (`elementId`, `attribute`, `fieldId`, `siteId`, `keywords`) VALUES
(1, 'username', 0, 1, ' admin '),
(1, 'firstname', 0, 1, ''),
(1, 'lastname', 0, 1, ''),
(1, 'fullname', 0, 1, ''),
(1, 'email', 0, 1, ' renaldypermana7 gmail com '),
(1, 'slug', 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `cr_sections`
--

CREATE TABLE `cr_sections` (
  `id` int(11) NOT NULL,
  `structureId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` enum('single','channel','structure') NOT NULL DEFAULT 'channel',
  `enableVersioning` tinyint(1) NOT NULL DEFAULT '0',
  `propagationMethod` varchar(255) NOT NULL DEFAULT 'all',
  `previewTargets` text,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_sections_sites`
--

CREATE TABLE `cr_sections_sites` (
  `id` int(11) NOT NULL,
  `sectionId` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `uriFormat` text,
  `template` varchar(500) DEFAULT NULL,
  `enabledByDefault` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_sequences`
--

CREATE TABLE `cr_sequences` (
  `name` varchar(255) NOT NULL,
  `next` int(11) UNSIGNED NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_sessions`
--

CREATE TABLE `cr_sessions` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `token` char(100) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_shunnedmessages`
--

CREATE TABLE `cr_shunnedmessages` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `message` varchar(255) NOT NULL,
  `expiryDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_sitegroups`
--

CREATE TABLE `cr_sitegroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cr_sitegroups`
--

INSERT INTO `cr_sitegroups` (`id`, `name`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 'craft renaldy', '2020-07-13 12:03:07', '2020-07-13 12:03:07', NULL, 'ed8d72aa-cd8a-45fb-b237-a288fb293463');

-- --------------------------------------------------------

--
-- Table structure for table `cr_sites`
--

CREATE TABLE `cr_sites` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `primary` tinyint(1) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `language` varchar(12) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '0',
  `baseUrl` varchar(255) DEFAULT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cr_sites`
--

INSERT INTO `cr_sites` (`id`, `groupId`, `primary`, `name`, `handle`, `language`, `hasUrls`, `baseUrl`, `sortOrder`, `dateCreated`, `dateUpdated`, `dateDeleted`, `uid`) VALUES
(1, 1, 1, 'craft renaldy', 'default', 'en-US', 1, '$DEFAULT_SITE_URL', 1, '2020-07-13 12:03:07', '2020-07-13 12:03:07', NULL, 'de532045-685d-434f-857f-a6acc9152466');

-- --------------------------------------------------------

--
-- Table structure for table `cr_structureelements`
--

CREATE TABLE `cr_structureelements` (
  `id` int(11) NOT NULL,
  `structureId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT NULL,
  `root` int(11) UNSIGNED DEFAULT NULL,
  `lft` int(11) UNSIGNED NOT NULL,
  `rgt` int(11) UNSIGNED NOT NULL,
  `level` smallint(6) UNSIGNED NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_structures`
--

CREATE TABLE `cr_structures` (
  `id` int(11) NOT NULL,
  `maxLevels` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_systemmessages`
--

CREATE TABLE `cr_systemmessages` (
  `id` int(11) NOT NULL,
  `language` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `subject` text NOT NULL,
  `body` text NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_taggroups`
--

CREATE TABLE `cr_taggroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_tags`
--

CREATE TABLE `cr_tags` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `deletedWithGroup` tinyint(1) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_templatecacheelements`
--

CREATE TABLE `cr_templatecacheelements` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_templatecachequeries`
--

CREATE TABLE `cr_templatecachequeries` (
  `id` int(11) NOT NULL,
  `cacheId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `query` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_templatecaches`
--

CREATE TABLE `cr_templatecaches` (
  `id` int(11) NOT NULL,
  `siteId` int(11) NOT NULL,
  `cacheKey` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `body` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_tokens`
--

CREATE TABLE `cr_tokens` (
  `id` int(11) NOT NULL,
  `token` char(32) NOT NULL,
  `route` text,
  `usageLimit` tinyint(3) UNSIGNED DEFAULT NULL,
  `usageCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `expiryDate` datetime NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_usergroups`
--

CREATE TABLE `cr_usergroups` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_usergroups_users`
--

CREATE TABLE `cr_usergroups_users` (
  `id` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_userpermissions`
--

CREATE TABLE `cr_userpermissions` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_userpermissions_usergroups`
--

CREATE TABLE `cr_userpermissions_usergroups` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `groupId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_userpermissions_users`
--

CREATE TABLE `cr_userpermissions_users` (
  `id` int(11) NOT NULL,
  `permissionId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_userpreferences`
--

CREATE TABLE `cr_userpreferences` (
  `userId` int(11) NOT NULL,
  `preferences` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cr_userpreferences`
--

INSERT INTO `cr_userpreferences` (`userId`, `preferences`) VALUES
(1, '{\"language\":\"en-US\"}');

-- --------------------------------------------------------

--
-- Table structure for table `cr_users`
--

CREATE TABLE `cr_users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `photoId` int(11) DEFAULT NULL,
  `firstName` varchar(100) DEFAULT NULL,
  `lastName` varchar(100) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `admin` tinyint(1) NOT NULL DEFAULT '0',
  `locked` tinyint(1) NOT NULL DEFAULT '0',
  `suspended` tinyint(1) NOT NULL DEFAULT '0',
  `pending` tinyint(1) NOT NULL DEFAULT '0',
  `lastLoginDate` datetime DEFAULT NULL,
  `lastLoginAttemptIp` varchar(45) DEFAULT NULL,
  `invalidLoginWindowStart` datetime DEFAULT NULL,
  `invalidLoginCount` tinyint(3) UNSIGNED DEFAULT NULL,
  `lastInvalidLoginDate` datetime DEFAULT NULL,
  `lockoutDate` datetime DEFAULT NULL,
  `hasDashboard` tinyint(1) NOT NULL DEFAULT '0',
  `verificationCode` varchar(255) DEFAULT NULL,
  `verificationCodeIssuedDate` datetime DEFAULT NULL,
  `unverifiedEmail` varchar(255) DEFAULT NULL,
  `passwordResetRequired` tinyint(1) NOT NULL DEFAULT '0',
  `lastPasswordChangeDate` datetime DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cr_users`
--

INSERT INTO `cr_users` (`id`, `username`, `photoId`, `firstName`, `lastName`, `email`, `password`, `admin`, `locked`, `suspended`, `pending`, `lastLoginDate`, `lastLoginAttemptIp`, `invalidLoginWindowStart`, `invalidLoginCount`, `lastInvalidLoginDate`, `lockoutDate`, `hasDashboard`, `verificationCode`, `verificationCodeIssuedDate`, `unverifiedEmail`, `passwordResetRequired`, `lastPasswordChangeDate`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 'admin', NULL, NULL, NULL, 'renaldypermana7@gmail.com', '$2y$13$3phGHlpXy9oWqYLmp8APFeF6qp3htLq0ASb49ddo/aBcWp21CGG5W', 1, 0, 0, 0, '2020-07-13 12:43:03', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, '2020-07-13 12:03:08', '2020-07-13 12:03:08', '2020-07-13 12:43:05', '3c2a1ea7-a786-4e8c-86fc-e6be87cc47b4');

-- --------------------------------------------------------

--
-- Table structure for table `cr_volumefolders`
--

CREATE TABLE `cr_volumefolders` (
  `id` int(11) NOT NULL,
  `parentId` int(11) DEFAULT NULL,
  `volumeId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `path` varchar(255) DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_volumes`
--

CREATE TABLE `cr_volumes` (
  `id` int(11) NOT NULL,
  `fieldLayoutId` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `hasUrls` tinyint(1) NOT NULL DEFAULT '1',
  `url` varchar(255) DEFAULT NULL,
  `settings` text,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `dateDeleted` datetime DEFAULT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cr_widgets`
--

CREATE TABLE `cr_widgets` (
  `id` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sortOrder` smallint(6) UNSIGNED DEFAULT NULL,
  `colspan` tinyint(3) DEFAULT NULL,
  `settings` text,
  `enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dateCreated` datetime NOT NULL,
  `dateUpdated` datetime NOT NULL,
  `uid` char(36) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cr_widgets`
--

INSERT INTO `cr_widgets` (`id`, `userId`, `type`, `sortOrder`, `colspan`, `settings`, `enabled`, `dateCreated`, `dateUpdated`, `uid`) VALUES
(1, 1, 'craft\\widgets\\RecentEntries', 1, NULL, '{\"section\":\"*\",\"siteId\":\"1\",\"limit\":10}', 1, '2020-07-13 12:43:05', '2020-07-13 12:43:05', '5be44007-776b-4aa4-baa5-95c3b8d42207'),
(2, 1, 'craft\\widgets\\CraftSupport', 2, NULL, '[]', 1, '2020-07-13 12:43:05', '2020-07-13 12:43:05', 'df332f4e-c938-43ef-b9f8-9fecc5feb0ac'),
(3, 1, 'craft\\widgets\\Updates', 3, NULL, '[]', 1, '2020-07-13 12:43:05', '2020-07-13 12:43:05', '252370ba-0430-46ea-82b8-f8d656792332'),
(4, 1, 'craft\\widgets\\Feed', 4, NULL, '{\"url\":\"https://craftcms.com/news.rss\",\"title\":\"Craft News\",\"limit\":5}', 1, '2020-07-13 12:43:05', '2020-07-13 12:43:05', '5c89b47e-dabe-460c-a831-0f7e3c6e9780');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cr_assetindexdata`
--
ALTER TABLE `cr_assetindexdata`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_assetindexdata_sessionId_volumeId_idx` (`sessionId`,`volumeId`),
  ADD KEY `cr_assetindexdata_volumeId_idx` (`volumeId`);

--
-- Indexes for table `cr_assets`
--
ALTER TABLE `cr_assets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_assets_filename_folderId_idx` (`filename`,`folderId`),
  ADD KEY `cr_assets_folderId_idx` (`folderId`),
  ADD KEY `cr_assets_volumeId_idx` (`volumeId`),
  ADD KEY `cr_assets_uploaderId_fk` (`uploaderId`);

--
-- Indexes for table `cr_assettransformindex`
--
ALTER TABLE `cr_assettransformindex`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_assettransformindex_volumeId_assetId_location_idx` (`volumeId`,`assetId`,`location`);

--
-- Indexes for table `cr_assettransforms`
--
ALTER TABLE `cr_assettransforms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_assettransforms_name_unq_idx` (`name`),
  ADD UNIQUE KEY `cr_assettransforms_handle_unq_idx` (`handle`);

--
-- Indexes for table `cr_categories`
--
ALTER TABLE `cr_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_categories_groupId_idx` (`groupId`),
  ADD KEY `cr_categories_parentId_fk` (`parentId`);

--
-- Indexes for table `cr_categorygroups`
--
ALTER TABLE `cr_categorygroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_categorygroups_name_idx` (`name`),
  ADD KEY `cr_categorygroups_handle_idx` (`handle`),
  ADD KEY `cr_categorygroups_structureId_idx` (`structureId`),
  ADD KEY `cr_categorygroups_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `cr_categorygroups_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `cr_categorygroups_sites`
--
ALTER TABLE `cr_categorygroups_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_categorygroups_sites_groupId_siteId_unq_idx` (`groupId`,`siteId`),
  ADD KEY `cr_categorygroups_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `cr_changedattributes`
--
ALTER TABLE `cr_changedattributes`
  ADD PRIMARY KEY (`elementId`,`siteId`,`attribute`),
  ADD KEY `cr_changedattributes_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `cr_changedattributes_siteId_fk` (`siteId`),
  ADD KEY `cr_changedattributes_userId_fk` (`userId`);

--
-- Indexes for table `cr_changedfields`
--
ALTER TABLE `cr_changedfields`
  ADD PRIMARY KEY (`elementId`,`siteId`,`fieldId`),
  ADD KEY `cr_changedfields_elementId_siteId_dateUpdated_idx` (`elementId`,`siteId`,`dateUpdated`),
  ADD KEY `cr_changedfields_siteId_fk` (`siteId`),
  ADD KEY `cr_changedfields_fieldId_fk` (`fieldId`),
  ADD KEY `cr_changedfields_userId_fk` (`userId`);

--
-- Indexes for table `cr_content`
--
ALTER TABLE `cr_content`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_content_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `cr_content_siteId_idx` (`siteId`),
  ADD KEY `cr_content_title_idx` (`title`);

--
-- Indexes for table `cr_craftidtokens`
--
ALTER TABLE `cr_craftidtokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_craftidtokens_userId_fk` (`userId`);

--
-- Indexes for table `cr_deprecationerrors`
--
ALTER TABLE `cr_deprecationerrors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_deprecationerrors_key_fingerprint_unq_idx` (`key`,`fingerprint`);

--
-- Indexes for table `cr_drafts`
--
ALTER TABLE `cr_drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_drafts_creatorId_fk` (`creatorId`),
  ADD KEY `cr_drafts_sourceId_fk` (`sourceId`);

--
-- Indexes for table `cr_elementindexsettings`
--
ALTER TABLE `cr_elementindexsettings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_elementindexsettings_type_unq_idx` (`type`);

--
-- Indexes for table `cr_elements`
--
ALTER TABLE `cr_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_elements_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `cr_elements_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `cr_elements_type_idx` (`type`),
  ADD KEY `cr_elements_enabled_idx` (`enabled`),
  ADD KEY `cr_elements_archived_dateCreated_idx` (`archived`,`dateCreated`),
  ADD KEY `cr_elements_archived_dateDeleted_draftId_revisionId_idx` (`archived`,`dateDeleted`,`draftId`,`revisionId`),
  ADD KEY `cr_elements_draftId_fk` (`draftId`),
  ADD KEY `cr_elements_revisionId_fk` (`revisionId`);

--
-- Indexes for table `cr_elements_sites`
--
ALTER TABLE `cr_elements_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_elements_sites_elementId_siteId_unq_idx` (`elementId`,`siteId`),
  ADD KEY `cr_elements_sites_siteId_idx` (`siteId`),
  ADD KEY `cr_elements_sites_slug_siteId_idx` (`slug`,`siteId`),
  ADD KEY `cr_elements_sites_enabled_idx` (`enabled`),
  ADD KEY `cr_elements_sites_uri_siteId_idx` (`uri`,`siteId`);

--
-- Indexes for table `cr_entries`
--
ALTER TABLE `cr_entries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_entries_postDate_idx` (`postDate`),
  ADD KEY `cr_entries_expiryDate_idx` (`expiryDate`),
  ADD KEY `cr_entries_authorId_idx` (`authorId`),
  ADD KEY `cr_entries_sectionId_idx` (`sectionId`),
  ADD KEY `cr_entries_typeId_idx` (`typeId`),
  ADD KEY `cr_entries_parentId_fk` (`parentId`);

--
-- Indexes for table `cr_entrytypes`
--
ALTER TABLE `cr_entrytypes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_entrytypes_name_sectionId_idx` (`name`,`sectionId`),
  ADD KEY `cr_entrytypes_handle_sectionId_idx` (`handle`,`sectionId`),
  ADD KEY `cr_entrytypes_sectionId_idx` (`sectionId`),
  ADD KEY `cr_entrytypes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `cr_entrytypes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `cr_fieldgroups`
--
ALTER TABLE `cr_fieldgroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_fieldgroups_name_unq_idx` (`name`);

--
-- Indexes for table `cr_fieldlayoutfields`
--
ALTER TABLE `cr_fieldlayoutfields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_fieldlayoutfields_layoutId_fieldId_unq_idx` (`layoutId`,`fieldId`),
  ADD KEY `cr_fieldlayoutfields_sortOrder_idx` (`sortOrder`),
  ADD KEY `cr_fieldlayoutfields_tabId_idx` (`tabId`),
  ADD KEY `cr_fieldlayoutfields_fieldId_idx` (`fieldId`);

--
-- Indexes for table `cr_fieldlayouts`
--
ALTER TABLE `cr_fieldlayouts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_fieldlayouts_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `cr_fieldlayouts_type_idx` (`type`);

--
-- Indexes for table `cr_fieldlayouttabs`
--
ALTER TABLE `cr_fieldlayouttabs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_fieldlayouttabs_sortOrder_idx` (`sortOrder`),
  ADD KEY `cr_fieldlayouttabs_layoutId_idx` (`layoutId`);

--
-- Indexes for table `cr_fields`
--
ALTER TABLE `cr_fields`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_fields_handle_context_unq_idx` (`handle`,`context`),
  ADD KEY `cr_fields_groupId_idx` (`groupId`),
  ADD KEY `cr_fields_context_idx` (`context`);

--
-- Indexes for table `cr_globalsets`
--
ALTER TABLE `cr_globalsets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_globalsets_name_idx` (`name`),
  ADD KEY `cr_globalsets_handle_idx` (`handle`),
  ADD KEY `cr_globalsets_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `cr_gqlschemas`
--
ALTER TABLE `cr_gqlschemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cr_gqltokens`
--
ALTER TABLE `cr_gqltokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_gqltokens_accessToken_unq_idx` (`accessToken`),
  ADD UNIQUE KEY `cr_gqltokens_name_unq_idx` (`name`),
  ADD KEY `cr_gqltokens_schemaId_fk` (`schemaId`);

--
-- Indexes for table `cr_info`
--
ALTER TABLE `cr_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cr_matrixblocks`
--
ALTER TABLE `cr_matrixblocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_matrixblocks_ownerId_idx` (`ownerId`),
  ADD KEY `cr_matrixblocks_fieldId_idx` (`fieldId`),
  ADD KEY `cr_matrixblocks_typeId_idx` (`typeId`),
  ADD KEY `cr_matrixblocks_sortOrder_idx` (`sortOrder`);

--
-- Indexes for table `cr_matrixblocktypes`
--
ALTER TABLE `cr_matrixblocktypes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_matrixblocktypes_name_fieldId_unq_idx` (`name`,`fieldId`),
  ADD UNIQUE KEY `cr_matrixblocktypes_handle_fieldId_unq_idx` (`handle`,`fieldId`),
  ADD KEY `cr_matrixblocktypes_fieldId_idx` (`fieldId`),
  ADD KEY `cr_matrixblocktypes_fieldLayoutId_idx` (`fieldLayoutId`);

--
-- Indexes for table `cr_migrations`
--
ALTER TABLE `cr_migrations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_migrations_pluginId_idx` (`pluginId`),
  ADD KEY `cr_migrations_type_pluginId_idx` (`type`,`pluginId`);

--
-- Indexes for table `cr_plugins`
--
ALTER TABLE `cr_plugins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_plugins_handle_unq_idx` (`handle`);

--
-- Indexes for table `cr_projectconfig`
--
ALTER TABLE `cr_projectconfig`
  ADD PRIMARY KEY (`path`);

--
-- Indexes for table `cr_queue`
--
ALTER TABLE `cr_queue`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_queue_channel_fail_timeUpdated_timePushed_idx` (`channel`,`fail`,`timeUpdated`,`timePushed`),
  ADD KEY `cr_queue_channel_fail_timeUpdated_delay_idx` (`channel`,`fail`,`timeUpdated`,`delay`);

--
-- Indexes for table `cr_relations`
--
ALTER TABLE `cr_relations`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_relations_fieldId_sourceId_sourceSiteId_targetId_unq_idx` (`fieldId`,`sourceId`,`sourceSiteId`,`targetId`),
  ADD KEY `cr_relations_sourceId_idx` (`sourceId`),
  ADD KEY `cr_relations_targetId_idx` (`targetId`),
  ADD KEY `cr_relations_sourceSiteId_idx` (`sourceSiteId`);

--
-- Indexes for table `cr_resourcepaths`
--
ALTER TABLE `cr_resourcepaths`
  ADD PRIMARY KEY (`hash`);

--
-- Indexes for table `cr_revisions`
--
ALTER TABLE `cr_revisions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_revisions_sourceId_num_unq_idx` (`sourceId`,`num`),
  ADD KEY `cr_revisions_creatorId_fk` (`creatorId`);

--
-- Indexes for table `cr_searchindex`
--
ALTER TABLE `cr_searchindex`
  ADD PRIMARY KEY (`elementId`,`attribute`,`fieldId`,`siteId`);
ALTER TABLE `cr_searchindex` ADD FULLTEXT KEY `cr_searchindex_keywords_idx` (`keywords`);

--
-- Indexes for table `cr_sections`
--
ALTER TABLE `cr_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_sections_handle_idx` (`handle`),
  ADD KEY `cr_sections_name_idx` (`name`),
  ADD KEY `cr_sections_structureId_idx` (`structureId`),
  ADD KEY `cr_sections_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `cr_sections_sites`
--
ALTER TABLE `cr_sections_sites`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_sections_sites_sectionId_siteId_unq_idx` (`sectionId`,`siteId`),
  ADD KEY `cr_sections_sites_siteId_idx` (`siteId`);

--
-- Indexes for table `cr_sequences`
--
ALTER TABLE `cr_sequences`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `cr_sessions`
--
ALTER TABLE `cr_sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_sessions_uid_idx` (`uid`),
  ADD KEY `cr_sessions_token_idx` (`token`),
  ADD KEY `cr_sessions_dateUpdated_idx` (`dateUpdated`),
  ADD KEY `cr_sessions_userId_idx` (`userId`);

--
-- Indexes for table `cr_shunnedmessages`
--
ALTER TABLE `cr_shunnedmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_shunnedmessages_userId_message_unq_idx` (`userId`,`message`);

--
-- Indexes for table `cr_sitegroups`
--
ALTER TABLE `cr_sitegroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_sitegroups_name_idx` (`name`);

--
-- Indexes for table `cr_sites`
--
ALTER TABLE `cr_sites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_sites_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `cr_sites_handle_idx` (`handle`),
  ADD KEY `cr_sites_sortOrder_idx` (`sortOrder`),
  ADD KEY `cr_sites_groupId_fk` (`groupId`);

--
-- Indexes for table `cr_structureelements`
--
ALTER TABLE `cr_structureelements`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_structureelements_structureId_elementId_unq_idx` (`structureId`,`elementId`),
  ADD KEY `cr_structureelements_root_idx` (`root`),
  ADD KEY `cr_structureelements_lft_idx` (`lft`),
  ADD KEY `cr_structureelements_rgt_idx` (`rgt`),
  ADD KEY `cr_structureelements_level_idx` (`level`),
  ADD KEY `cr_structureelements_elementId_idx` (`elementId`);

--
-- Indexes for table `cr_structures`
--
ALTER TABLE `cr_structures`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_structures_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `cr_systemmessages`
--
ALTER TABLE `cr_systemmessages`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_systemmessages_key_language_unq_idx` (`key`,`language`),
  ADD KEY `cr_systemmessages_language_idx` (`language`);

--
-- Indexes for table `cr_taggroups`
--
ALTER TABLE `cr_taggroups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_taggroups_name_idx` (`name`),
  ADD KEY `cr_taggroups_handle_idx` (`handle`),
  ADD KEY `cr_taggroups_dateDeleted_idx` (`dateDeleted`),
  ADD KEY `cr_taggroups_fieldLayoutId_fk` (`fieldLayoutId`);

--
-- Indexes for table `cr_tags`
--
ALTER TABLE `cr_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_tags_groupId_idx` (`groupId`);

--
-- Indexes for table `cr_templatecacheelements`
--
ALTER TABLE `cr_templatecacheelements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_templatecacheelements_cacheId_idx` (`cacheId`),
  ADD KEY `cr_templatecacheelements_elementId_idx` (`elementId`);

--
-- Indexes for table `cr_templatecachequeries`
--
ALTER TABLE `cr_templatecachequeries`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_templatecachequeries_cacheId_idx` (`cacheId`),
  ADD KEY `cr_templatecachequeries_type_idx` (`type`);

--
-- Indexes for table `cr_templatecaches`
--
ALTER TABLE `cr_templatecaches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_templatecaches_cacheKey_siteId_expiryDate_path_idx` (`cacheKey`,`siteId`,`expiryDate`,`path`),
  ADD KEY `cr_templatecaches_cacheKey_siteId_expiryDate_idx` (`cacheKey`,`siteId`,`expiryDate`),
  ADD KEY `cr_templatecaches_siteId_idx` (`siteId`);

--
-- Indexes for table `cr_tokens`
--
ALTER TABLE `cr_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_tokens_token_unq_idx` (`token`),
  ADD KEY `cr_tokens_expiryDate_idx` (`expiryDate`);

--
-- Indexes for table `cr_usergroups`
--
ALTER TABLE `cr_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_usergroups_handle_unq_idx` (`handle`),
  ADD UNIQUE KEY `cr_usergroups_name_unq_idx` (`name`);

--
-- Indexes for table `cr_usergroups_users`
--
ALTER TABLE `cr_usergroups_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_usergroups_users_groupId_userId_unq_idx` (`groupId`,`userId`),
  ADD KEY `cr_usergroups_users_userId_idx` (`userId`);

--
-- Indexes for table `cr_userpermissions`
--
ALTER TABLE `cr_userpermissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_userpermissions_name_unq_idx` (`name`);

--
-- Indexes for table `cr_userpermissions_usergroups`
--
ALTER TABLE `cr_userpermissions_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_userpermissions_usergroups_permissionId_groupId_unq_idx` (`permissionId`,`groupId`),
  ADD KEY `cr_userpermissions_usergroups_groupId_idx` (`groupId`);

--
-- Indexes for table `cr_userpermissions_users`
--
ALTER TABLE `cr_userpermissions_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_userpermissions_users_permissionId_userId_unq_idx` (`permissionId`,`userId`),
  ADD KEY `cr_userpermissions_users_userId_idx` (`userId`);

--
-- Indexes for table `cr_userpreferences`
--
ALTER TABLE `cr_userpreferences`
  ADD PRIMARY KEY (`userId`);

--
-- Indexes for table `cr_users`
--
ALTER TABLE `cr_users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_users_uid_idx` (`uid`),
  ADD KEY `cr_users_verificationCode_idx` (`verificationCode`),
  ADD KEY `cr_users_email_idx` (`email`),
  ADD KEY `cr_users_username_idx` (`username`),
  ADD KEY `cr_users_photoId_fk` (`photoId`);

--
-- Indexes for table `cr_volumefolders`
--
ALTER TABLE `cr_volumefolders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `cr_volumefolders_name_parentId_volumeId_unq_idx` (`name`,`parentId`,`volumeId`),
  ADD KEY `cr_volumefolders_parentId_idx` (`parentId`),
  ADD KEY `cr_volumefolders_volumeId_idx` (`volumeId`);

--
-- Indexes for table `cr_volumes`
--
ALTER TABLE `cr_volumes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_volumes_name_idx` (`name`),
  ADD KEY `cr_volumes_handle_idx` (`handle`),
  ADD KEY `cr_volumes_fieldLayoutId_idx` (`fieldLayoutId`),
  ADD KEY `cr_volumes_dateDeleted_idx` (`dateDeleted`);

--
-- Indexes for table `cr_widgets`
--
ALTER TABLE `cr_widgets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cr_widgets_userId_idx` (`userId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cr_assetindexdata`
--
ALTER TABLE `cr_assetindexdata`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_assettransformindex`
--
ALTER TABLE `cr_assettransformindex`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_assettransforms`
--
ALTER TABLE `cr_assettransforms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_categorygroups`
--
ALTER TABLE `cr_categorygroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_categorygroups_sites`
--
ALTER TABLE `cr_categorygroups_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_content`
--
ALTER TABLE `cr_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cr_craftidtokens`
--
ALTER TABLE `cr_craftidtokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_deprecationerrors`
--
ALTER TABLE `cr_deprecationerrors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_drafts`
--
ALTER TABLE `cr_drafts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_elementindexsettings`
--
ALTER TABLE `cr_elementindexsettings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_elements`
--
ALTER TABLE `cr_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cr_elements_sites`
--
ALTER TABLE `cr_elements_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cr_entrytypes`
--
ALTER TABLE `cr_entrytypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_fieldgroups`
--
ALTER TABLE `cr_fieldgroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cr_fieldlayoutfields`
--
ALTER TABLE `cr_fieldlayoutfields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_fieldlayouts`
--
ALTER TABLE `cr_fieldlayouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_fieldlayouttabs`
--
ALTER TABLE `cr_fieldlayouttabs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_fields`
--
ALTER TABLE `cr_fields`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_globalsets`
--
ALTER TABLE `cr_globalsets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_gqlschemas`
--
ALTER TABLE `cr_gqlschemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_gqltokens`
--
ALTER TABLE `cr_gqltokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_info`
--
ALTER TABLE `cr_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cr_matrixblocktypes`
--
ALTER TABLE `cr_matrixblocktypes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_migrations`
--
ALTER TABLE `cr_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=166;

--
-- AUTO_INCREMENT for table `cr_plugins`
--
ALTER TABLE `cr_plugins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_queue`
--
ALTER TABLE `cr_queue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_relations`
--
ALTER TABLE `cr_relations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_revisions`
--
ALTER TABLE `cr_revisions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_sections`
--
ALTER TABLE `cr_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_sections_sites`
--
ALTER TABLE `cr_sections_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_sessions`
--
ALTER TABLE `cr_sessions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_shunnedmessages`
--
ALTER TABLE `cr_shunnedmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_sitegroups`
--
ALTER TABLE `cr_sitegroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cr_sites`
--
ALTER TABLE `cr_sites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cr_structureelements`
--
ALTER TABLE `cr_structureelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_structures`
--
ALTER TABLE `cr_structures`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_systemmessages`
--
ALTER TABLE `cr_systemmessages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_taggroups`
--
ALTER TABLE `cr_taggroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_templatecacheelements`
--
ALTER TABLE `cr_templatecacheelements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_templatecachequeries`
--
ALTER TABLE `cr_templatecachequeries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_templatecaches`
--
ALTER TABLE `cr_templatecaches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_tokens`
--
ALTER TABLE `cr_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_usergroups`
--
ALTER TABLE `cr_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_usergroups_users`
--
ALTER TABLE `cr_usergroups_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_userpermissions`
--
ALTER TABLE `cr_userpermissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_userpermissions_usergroups`
--
ALTER TABLE `cr_userpermissions_usergroups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_userpermissions_users`
--
ALTER TABLE `cr_userpermissions_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_userpreferences`
--
ALTER TABLE `cr_userpreferences`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cr_volumefolders`
--
ALTER TABLE `cr_volumefolders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_volumes`
--
ALTER TABLE `cr_volumes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cr_widgets`
--
ALTER TABLE `cr_widgets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cr_assetindexdata`
--
ALTER TABLE `cr_assetindexdata`
  ADD CONSTRAINT `cr_assetindexdata_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `cr_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_assets`
--
ALTER TABLE `cr_assets`
  ADD CONSTRAINT `cr_assets_folderId_fk` FOREIGN KEY (`folderId`) REFERENCES `cr_volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_assets_id_fk` FOREIGN KEY (`id`) REFERENCES `cr_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_assets_uploaderId_fk` FOREIGN KEY (`uploaderId`) REFERENCES `cr_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cr_assets_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `cr_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_categories`
--
ALTER TABLE `cr_categories`
  ADD CONSTRAINT `cr_categories_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `cr_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_categories_id_fk` FOREIGN KEY (`id`) REFERENCES `cr_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_categories_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `cr_categories` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cr_categorygroups`
--
ALTER TABLE `cr_categorygroups`
  ADD CONSTRAINT `cr_categorygroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cr_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cr_categorygroups_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `cr_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_categorygroups_sites`
--
ALTER TABLE `cr_categorygroups_sites`
  ADD CONSTRAINT `cr_categorygroups_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `cr_categorygroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_categorygroups_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `cr_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cr_changedattributes`
--
ALTER TABLE `cr_changedattributes`
  ADD CONSTRAINT `cr_changedattributes_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `cr_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cr_changedattributes_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `cr_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cr_changedattributes_userId_fk` FOREIGN KEY (`userId`) REFERENCES `cr_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `cr_changedfields`
--
ALTER TABLE `cr_changedfields`
  ADD CONSTRAINT `cr_changedfields_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `cr_elements` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cr_changedfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `cr_fields` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cr_changedfields_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `cr_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cr_changedfields_userId_fk` FOREIGN KEY (`userId`) REFERENCES `cr_users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `cr_content`
--
ALTER TABLE `cr_content`
  ADD CONSTRAINT `cr_content_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `cr_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_content_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `cr_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cr_craftidtokens`
--
ALTER TABLE `cr_craftidtokens`
  ADD CONSTRAINT `cr_craftidtokens_userId_fk` FOREIGN KEY (`userId`) REFERENCES `cr_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_drafts`
--
ALTER TABLE `cr_drafts`
  ADD CONSTRAINT `cr_drafts_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `cr_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cr_drafts_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `cr_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_elements`
--
ALTER TABLE `cr_elements`
  ADD CONSTRAINT `cr_elements_draftId_fk` FOREIGN KEY (`draftId`) REFERENCES `cr_drafts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_elements_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cr_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cr_elements_revisionId_fk` FOREIGN KEY (`revisionId`) REFERENCES `cr_revisions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_elements_sites`
--
ALTER TABLE `cr_elements_sites`
  ADD CONSTRAINT `cr_elements_sites_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `cr_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_elements_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `cr_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cr_entries`
--
ALTER TABLE `cr_entries`
  ADD CONSTRAINT `cr_entries_authorId_fk` FOREIGN KEY (`authorId`) REFERENCES `cr_users` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_entries_id_fk` FOREIGN KEY (`id`) REFERENCES `cr_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_entries_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `cr_entries` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cr_entries_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `cr_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_entries_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `cr_entrytypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_entrytypes`
--
ALTER TABLE `cr_entrytypes`
  ADD CONSTRAINT `cr_entrytypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cr_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cr_entrytypes_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `cr_sections` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_fieldlayoutfields`
--
ALTER TABLE `cr_fieldlayoutfields`
  ADD CONSTRAINT `cr_fieldlayoutfields_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `cr_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_fieldlayoutfields_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `cr_fieldlayouts` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_fieldlayoutfields_tabId_fk` FOREIGN KEY (`tabId`) REFERENCES `cr_fieldlayouttabs` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_fieldlayouttabs`
--
ALTER TABLE `cr_fieldlayouttabs`
  ADD CONSTRAINT `cr_fieldlayouttabs_layoutId_fk` FOREIGN KEY (`layoutId`) REFERENCES `cr_fieldlayouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_fields`
--
ALTER TABLE `cr_fields`
  ADD CONSTRAINT `cr_fields_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `cr_fieldgroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_globalsets`
--
ALTER TABLE `cr_globalsets`
  ADD CONSTRAINT `cr_globalsets_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cr_fieldlayouts` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cr_globalsets_id_fk` FOREIGN KEY (`id`) REFERENCES `cr_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_gqltokens`
--
ALTER TABLE `cr_gqltokens`
  ADD CONSTRAINT `cr_gqltokens_schemaId_fk` FOREIGN KEY (`schemaId`) REFERENCES `cr_gqlschemas` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cr_matrixblocks`
--
ALTER TABLE `cr_matrixblocks`
  ADD CONSTRAINT `cr_matrixblocks_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `cr_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_matrixblocks_id_fk` FOREIGN KEY (`id`) REFERENCES `cr_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_matrixblocks_ownerId_fk` FOREIGN KEY (`ownerId`) REFERENCES `cr_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_matrixblocks_typeId_fk` FOREIGN KEY (`typeId`) REFERENCES `cr_matrixblocktypes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_matrixblocktypes`
--
ALTER TABLE `cr_matrixblocktypes`
  ADD CONSTRAINT `cr_matrixblocktypes_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `cr_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_matrixblocktypes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cr_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cr_migrations`
--
ALTER TABLE `cr_migrations`
  ADD CONSTRAINT `cr_migrations_pluginId_fk` FOREIGN KEY (`pluginId`) REFERENCES `cr_plugins` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_relations`
--
ALTER TABLE `cr_relations`
  ADD CONSTRAINT `cr_relations_fieldId_fk` FOREIGN KEY (`fieldId`) REFERENCES `cr_fields` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_relations_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `cr_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_relations_sourceSiteId_fk` FOREIGN KEY (`sourceSiteId`) REFERENCES `cr_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cr_relations_targetId_fk` FOREIGN KEY (`targetId`) REFERENCES `cr_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_revisions`
--
ALTER TABLE `cr_revisions`
  ADD CONSTRAINT `cr_revisions_creatorId_fk` FOREIGN KEY (`creatorId`) REFERENCES `cr_users` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `cr_revisions_sourceId_fk` FOREIGN KEY (`sourceId`) REFERENCES `cr_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_sections`
--
ALTER TABLE `cr_sections`
  ADD CONSTRAINT `cr_sections_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `cr_structures` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cr_sections_sites`
--
ALTER TABLE `cr_sections_sites`
  ADD CONSTRAINT `cr_sections_sites_sectionId_fk` FOREIGN KEY (`sectionId`) REFERENCES `cr_sections` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_sections_sites_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `cr_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cr_sessions`
--
ALTER TABLE `cr_sessions`
  ADD CONSTRAINT `cr_sessions_userId_fk` FOREIGN KEY (`userId`) REFERENCES `cr_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_shunnedmessages`
--
ALTER TABLE `cr_shunnedmessages`
  ADD CONSTRAINT `cr_shunnedmessages_userId_fk` FOREIGN KEY (`userId`) REFERENCES `cr_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_sites`
--
ALTER TABLE `cr_sites`
  ADD CONSTRAINT `cr_sites_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `cr_sitegroups` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_structureelements`
--
ALTER TABLE `cr_structureelements`
  ADD CONSTRAINT `cr_structureelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `cr_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_structureelements_structureId_fk` FOREIGN KEY (`structureId`) REFERENCES `cr_structures` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_taggroups`
--
ALTER TABLE `cr_taggroups`
  ADD CONSTRAINT `cr_taggroups_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cr_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cr_tags`
--
ALTER TABLE `cr_tags`
  ADD CONSTRAINT `cr_tags_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `cr_taggroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_tags_id_fk` FOREIGN KEY (`id`) REFERENCES `cr_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_templatecacheelements`
--
ALTER TABLE `cr_templatecacheelements`
  ADD CONSTRAINT `cr_templatecacheelements_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `cr_templatecaches` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_templatecacheelements_elementId_fk` FOREIGN KEY (`elementId`) REFERENCES `cr_elements` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_templatecachequeries`
--
ALTER TABLE `cr_templatecachequeries`
  ADD CONSTRAINT `cr_templatecachequeries_cacheId_fk` FOREIGN KEY (`cacheId`) REFERENCES `cr_templatecaches` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_templatecaches`
--
ALTER TABLE `cr_templatecaches`
  ADD CONSTRAINT `cr_templatecaches_siteId_fk` FOREIGN KEY (`siteId`) REFERENCES `cr_sites` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cr_usergroups_users`
--
ALTER TABLE `cr_usergroups_users`
  ADD CONSTRAINT `cr_usergroups_users_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `cr_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_usergroups_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `cr_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_userpermissions_usergroups`
--
ALTER TABLE `cr_userpermissions_usergroups`
  ADD CONSTRAINT `cr_userpermissions_usergroups_groupId_fk` FOREIGN KEY (`groupId`) REFERENCES `cr_usergroups` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_userpermissions_usergroups_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `cr_userpermissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_userpermissions_users`
--
ALTER TABLE `cr_userpermissions_users`
  ADD CONSTRAINT `cr_userpermissions_users_permissionId_fk` FOREIGN KEY (`permissionId`) REFERENCES `cr_userpermissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_userpermissions_users_userId_fk` FOREIGN KEY (`userId`) REFERENCES `cr_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_userpreferences`
--
ALTER TABLE `cr_userpreferences`
  ADD CONSTRAINT `cr_userpreferences_userId_fk` FOREIGN KEY (`userId`) REFERENCES `cr_users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_users`
--
ALTER TABLE `cr_users`
  ADD CONSTRAINT `cr_users_id_fk` FOREIGN KEY (`id`) REFERENCES `cr_elements` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_users_photoId_fk` FOREIGN KEY (`photoId`) REFERENCES `cr_assets` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cr_volumefolders`
--
ALTER TABLE `cr_volumefolders`
  ADD CONSTRAINT `cr_volumefolders_parentId_fk` FOREIGN KEY (`parentId`) REFERENCES `cr_volumefolders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `cr_volumefolders_volumeId_fk` FOREIGN KEY (`volumeId`) REFERENCES `cr_volumes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `cr_volumes`
--
ALTER TABLE `cr_volumes`
  ADD CONSTRAINT `cr_volumes_fieldLayoutId_fk` FOREIGN KEY (`fieldLayoutId`) REFERENCES `cr_fieldlayouts` (`id`) ON DELETE SET NULL;

--
-- Constraints for table `cr_widgets`
--
ALTER TABLE `cr_widgets`
  ADD CONSTRAINT `cr_widgets_userId_fk` FOREIGN KEY (`userId`) REFERENCES `cr_users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
