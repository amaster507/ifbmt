-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1build0.15.04.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 14, 2017 at 10:26 PM
-- Server version: 10.0.23-MariaDB-0ubuntu0.15.04.1
-- PHP Version: 5.6.4-4ubuntu6.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `ifbmt_users`
--
CREATE DATABASE IF NOT EXISTS `ifbmt_users` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ifbmt_users`;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
`id` smallint(5) unsigned NOT NULL,
  `username` varchar(40) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `time_zone` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_meta`
--

CREATE TABLE IF NOT EXISTS `user_meta` (
  `id` int(11) NOT NULL,
  `user_id` smallint(5) unsigned NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `username` (`username`,`email`);

--
-- Indexes for table `user_meta`
--
ALTER TABLE `user_meta`
 ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `user_meta`
--
ALTER TABLE `user_meta`
ADD CONSTRAINT `user_meta_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;


-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1build0.15.04.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 14, 2017 at 10:26 PM
-- Server version: 10.0.23-MariaDB-0ubuntu0.15.04.1
-- PHP Version: 5.6.4-4ubuntu6.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `ifbmt_public`
--
CREATE DATABASE IF NOT EXISTS `ifbmt_public` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ifbmt_public`;

-- --------------------------------------------------------

--
-- Table structure for table `churches`
--

CREATE TABLE IF NOT EXISTS `churches` (
`id` int(10) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `lat` decimal(10,8) DEFAULT NULL,
  `lon` decimal(10,8) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `post_code` varchar(10) DEFAULT NULL,
  `pastor_id` smallint(5) unsigned DEFAULT NULL,
  `time_zone` varchar(40) DEFAULT NULL,
  `creator_id` smallint(5) unsigned DEFAULT NULL,
  `created_datetime` datetime NOT NULL,
  `updated_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `church_contacts`
--

CREATE TABLE IF NOT EXISTS `church_contacts` (
  `church_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `position` varchar(255) NOT NULL,
  `assigner_id` smallint(5) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `church_meta`
--

CREATE TABLE IF NOT EXISTS `church_meta` (
`id` int(10) unsigned NOT NULL,
  `church_id` int(10) unsigned NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `church_tags`
--

CREATE TABLE IF NOT EXISTS `church_tags` (
`id` int(10) unsigned NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `church_taxonomy`
--

CREATE TABLE IF NOT EXISTS `church_taxonomy` (
  `church_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
`id` int(10) unsigned NOT NULL,
  `guid` char(36) NOT NULL DEFAULT 'UUID()',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `creator_id` smallint(5) unsigned DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_meta`
--

CREATE TABLE IF NOT EXISTS `contact_meta` (
`id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
`id` int(10) unsigned NOT NULL,
  `guid` char(36) NOT NULL DEFAULT 'UUID()',
  `creator_id` smallint(5) unsigned DEFAULT NULL,
  `created_datetime` datetime NOT NULL,
  `church_id` int(10) unsigned DEFAULT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `all_day` tinyint(1) NOT NULL DEFAULT '0',
  `busy` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `recurring` tinyint(1) NOT NULL DEFAULT '0',
  `timezone` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_attendees`
--

CREATE TABLE IF NOT EXISTS `event_attendees` (
  `event_id` int(10) unsigned NOT NULL,
  `user_id` smallint(5) unsigned NOT NULL,
  `added_by` smallint(5) unsigned DEFAULT NULL,
  `added_datetime` datetime NOT NULL,
  `confirmed_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_meta`
--

CREATE TABLE IF NOT EXISTS `event_meta` (
`id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_occurrences`
--

CREATE TABLE IF NOT EXISTS `event_occurrences` (
`id` int(11) NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `rule_id` int(10) unsigned NOT NULL,
  `exception_id` int(10) unsigned DEFAULT NULL,
  `start_datetime` int(11) NOT NULL,
  `end_datetime` int(11) DEFAULT NULL,
  `all_day` int(11) NOT NULL DEFAULT '0',
  `busy` tinyint(1) NOT NULL DEFAULT '1',
  `timezone` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_recur_rules`
--

CREATE TABLE IF NOT EXISTS `event_recur_rules` (
`id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `created_datetime` datetime NOT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  `calculated_to` datetime DEFAULT NULL,
  `rule` varchar(255) NOT NULL COMMENT 'To Be Discussed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
`id` int(10) unsigned NOT NULL,
  `guid` char(36) NOT NULL DEFAULT 'UUID()',
  `ref_table` enum('churches','contacts','events') NOT NULL,
  `ref_id` int(10) unsigned NOT NULL,
  `creator_id` smallint(5) unsigned DEFAULT NULL,
  `created_datetime` int(11) NOT NULL,
  `updated_datetime` int(11) DEFAULT NULL,
  `ref_public` tinyint(1) DEFAULT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `note_meta`
--

CREATE TABLE IF NOT EXISTS `note_meta` (
`id` int(10) unsigned NOT NULL,
  `note_id` int(10) unsigned NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `points`
--

CREATE TABLE IF NOT EXISTS `points` (
`id` int(10) unsigned NOT NULL,
  `gave_point_id` smallint(5) unsigned NOT NULL,
  `received_point_id` smallint(5) unsigned NOT NULL,
  `voted_datetime` datetime NOT NULL,
  `point_value` tinyint(4) NOT NULL,
  `ref_table` enum('suggested_edits','notes','events','churches','contacts') NOT NULL,
  `ref_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `recurrence_exceptions`
--

CREATE TABLE IF NOT EXISTS `recurrence_exceptions` (
`id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `rule_id` int(10) unsigned NOT NULL,
  `orig_start_datetime` int(11) NOT NULL,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `start_datetime` int(11) NOT NULL,
  `end_datetime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `suggested_cofirms`
--

CREATE TABLE IF NOT EXISTS `suggested_cofirms` (
  `eidt_id` int(10) unsigned NOT NULL,
  `user_id` smallint(2) unsigned NOT NULL,
  `confirm_datetime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `suggested_edits`
--

CREATE TABLE IF NOT EXISTS `suggested_edits` (
`id` int(10) unsigned NOT NULL,
  `ref_table` enum('churches','contacts') NOT NULL,
  `ref_id` int(10) unsigned NOT NULL,
  `ref_key` varchar(255) NOT NULL,
  `old_value` int(11) DEFAULT NULL,
  `new_value` int(11) NOT NULL,
  `suggested_user_id` smallint(2) unsigned DEFAULT NULL,
  `suggested_datetime` datetime NOT NULL,
  `confirm_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `churches`
--
ALTER TABLE `churches`
 ADD PRIMARY KEY (`id`), ADD KEY `pastor_id` (`pastor_id`,`creator_id`), ADD KEY `creator_id` (`creator_id`);

--
-- Indexes for table `church_contacts`
--
ALTER TABLE `church_contacts`
 ADD UNIQUE KEY `church_id` (`church_id`,`contact_id`), ADD KEY `assigner_id` (`assigner_id`), ADD KEY `contact_id` (`contact_id`);

--
-- Indexes for table `church_meta`
--
ALTER TABLE `church_meta`
 ADD PRIMARY KEY (`id`), ADD KEY `church_id` (`church_id`);

--
-- Indexes for table `church_tags`
--
ALTER TABLE `church_tags`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `church_taxonomy`
--
ALTER TABLE `church_taxonomy`
 ADD KEY `church_id` (`church_id`), ADD KEY `tag_id` (`tag_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `guid` (`guid`), ADD KEY `creator_id` (`creator_id`);

--
-- Indexes for table `contact_meta`
--
ALTER TABLE `contact_meta`
 ADD PRIMARY KEY (`id`), ADD KEY `contact_id` (`contact_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `guid` (`guid`), ADD UNIQUE KEY `creator_id` (`creator_id`), ADD UNIQUE KEY `church_id` (`church_id`);

--
-- Indexes for table `event_attendees`
--
ALTER TABLE `event_attendees`
 ADD UNIQUE KEY `event_id` (`event_id`,`user_id`), ADD UNIQUE KEY `user_id` (`user_id`), ADD UNIQUE KEY `event_id_2` (`event_id`), ADD UNIQUE KEY `added_by` (`added_by`);

--
-- Indexes for table `event_meta`
--
ALTER TABLE `event_meta`
 ADD PRIMARY KEY (`id`), ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `event_occurrences`
--
ALTER TABLE `event_occurrences`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `event_id` (`event_id`), ADD UNIQUE KEY `rule_id` (`rule_id`), ADD UNIQUE KEY `exception_id` (`exception_id`);

--
-- Indexes for table `event_recur_rules`
--
ALTER TABLE `event_recur_rules`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `event_id` (`event_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `guid` (`guid`), ADD UNIQUE KEY `creator_id` (`creator_id`), ADD KEY `ref_id` (`ref_id`);

--
-- Indexes for table `note_meta`
--
ALTER TABLE `note_meta`
 ADD PRIMARY KEY (`id`), ADD KEY `note_id` (`note_id`);

--
-- Indexes for table `points`
--
ALTER TABLE `points`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `gave_point_id` (`gave_point_id`,`ref_table`,`ref_id`), ADD UNIQUE KEY `gave_point_id_2` (`gave_point_id`), ADD UNIQUE KEY `received_point_id` (`received_point_id`);

--
-- Indexes for table `recurrence_exceptions`
--
ALTER TABLE `recurrence_exceptions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `event_id` (`event_id`), ADD UNIQUE KEY `rule_id` (`rule_id`);

--
-- Indexes for table `suggested_cofirms`
--
ALTER TABLE `suggested_cofirms`
 ADD UNIQUE KEY `eidt_id` (`eidt_id`), ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `suggested_edits`
--
ALTER TABLE `suggested_edits`
 ADD PRIMARY KEY (`id`), ADD KEY `suggested_user_id` (`suggested_user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `churches`
--
ALTER TABLE `churches`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `church_meta`
--
ALTER TABLE `church_meta`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `church_tags`
--
ALTER TABLE `church_tags`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact_meta`
--
ALTER TABLE `contact_meta`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_meta`
--
ALTER TABLE `event_meta`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_occurrences`
--
ALTER TABLE `event_occurrences`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_recur_rules`
--
ALTER TABLE `event_recur_rules`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `note_meta`
--
ALTER TABLE `note_meta`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `points`
--
ALTER TABLE `points`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `recurrence_exceptions`
--
ALTER TABLE `recurrence_exceptions`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `suggested_edits`
--
ALTER TABLE `suggested_edits`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `churches`
--
ALTER TABLE `churches`
ADD CONSTRAINT `churches_ibfk_1` FOREIGN KEY (`pastor_id`) REFERENCES `ifbmt_users`.`users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
ADD CONSTRAINT `churches_ibfk_2` FOREIGN KEY (`creator_id`) REFERENCES `ifbmt_users`.`users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `church_contacts`
--
ALTER TABLE `church_contacts`
ADD CONSTRAINT `church_contacts_ibfk_1` FOREIGN KEY (`church_id`) REFERENCES `churches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `church_contacts_ibfk_2` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `church_contacts_ibfk_3` FOREIGN KEY (`assigner_id`) REFERENCES `ifbmt_users`.`users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `church_meta`
--
ALTER TABLE `church_meta`
ADD CONSTRAINT `church_meta_ibfk_1` FOREIGN KEY (`church_id`) REFERENCES `churches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `church_taxonomy`
--
ALTER TABLE `church_taxonomy`
ADD CONSTRAINT `church_taxonomy_ibfk_1` FOREIGN KEY (`church_id`) REFERENCES `churches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `church_taxonomy_ibfk_2` FOREIGN KEY (`tag_id`) REFERENCES `church_tags` (`id`);

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
ADD CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `ifbmt_users`.`users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `contact_meta`
--
ALTER TABLE `contact_meta`
ADD CONSTRAINT `contact_meta_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`church_id`) REFERENCES `churches` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `events_ibfk_2` FOREIGN KEY (`creator_id`) REFERENCES `ifbmt_users`.`users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `event_attendees`
--
ALTER TABLE `event_attendees`
ADD CONSTRAINT `event_attendees_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `ifbmt_users`.`users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `event_attendees_ibfk_2` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON UPDATE CASCADE,
ADD CONSTRAINT `event_attendees_ibfk_3` FOREIGN KEY (`added_by`) REFERENCES `ifbmt_users`.`users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `event_meta`
--
ALTER TABLE `event_meta`
ADD CONSTRAINT `event_meta_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_occurrences`
--
ALTER TABLE `event_occurrences`
ADD CONSTRAINT `event_occurrences_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `event_occurrences_ibfk_2` FOREIGN KEY (`rule_id`) REFERENCES `event_recur_rules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `event_occurrences_ibfk_3` FOREIGN KEY (`exception_id`) REFERENCES `recurrence_exceptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_recur_rules`
--
ALTER TABLE `event_recur_rules`
ADD CONSTRAINT `event_recur_rules_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notes`
--
ALTER TABLE `notes`
ADD CONSTRAINT `notes_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `ifbmt_users`.`users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `note_meta`
--
ALTER TABLE `note_meta`
ADD CONSTRAINT `note_meta_ibfk_1` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `points`
--
ALTER TABLE `points`
ADD CONSTRAINT `points_ibfk_1` FOREIGN KEY (`gave_point_id`) REFERENCES `ifbmt_users`.`users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recurrence_exceptions`
--
ALTER TABLE `recurrence_exceptions`
ADD CONSTRAINT `recurrence_exceptions_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `recurrence_exceptions_ibfk_2` FOREIGN KEY (`rule_id`) REFERENCES `event_recur_rules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `suggested_cofirms`
--
ALTER TABLE `suggested_cofirms`
ADD CONSTRAINT `suggested_cofirms_ibfk_1` FOREIGN KEY (`eidt_id`) REFERENCES `suggested_edits` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `suggested_cofirms_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `ifbmt_users`.`users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `suggested_edits`
--
ALTER TABLE `suggested_edits`
ADD CONSTRAINT `suggested_edits_ibfk_1` FOREIGN KEY (`suggested_user_id`) REFERENCES `ifbmt_users`.`users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;



-- phpMyAdmin SQL Dump
-- version 4.2.12deb2+deb8u1build0.15.04.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Sep 14, 2017 at 10:24 PM
-- Server version: 10.0.23-MariaDB-0ubuntu0.15.04.1
-- PHP Version: 5.6.4-4ubuntu6.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `ifbmt_private_1`
--
CREATE DATABASE IF NOT EXISTS `ifbmt_private_1` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `ifbmt_private_1`;

-- --------------------------------------------------------

--
-- Table structure for table `calendars`
--

CREATE TABLE IF NOT EXISTS `calendars` (
`id` int(10) unsigned NOT NULL,
  `created_datetime` datetime NOT NULL,
  `slug` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text,
  `color` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `calendar_events`
--

CREATE TABLE IF NOT EXISTS `calendar_events` (
  `calendar_id` int(10) unsigned NOT NULL,
  `event_guid` char(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `church_contacts`
--

CREATE TABLE IF NOT EXISTS `church_contacts` (
  `church_id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `position` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE IF NOT EXISTS `contacts` (
`id` int(10) unsigned NOT NULL,
  `guid` char(36) NOT NULL DEFAULT 'UUID()',
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `creator_id` smallint(5) unsigned DEFAULT NULL,
  `created_datetime` datetime DEFAULT NULL,
  `updated_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_meta`
--

CREATE TABLE IF NOT EXISTS `contact_meta` (
`id` int(10) unsigned NOT NULL,
  `contact_id` int(10) unsigned NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE IF NOT EXISTS `events` (
`id` int(10) unsigned NOT NULL,
  `guid` char(36) NOT NULL DEFAULT 'UUID()',
  `creator_id` smallint(5) unsigned DEFAULT NULL,
  `created_datetime` datetime NOT NULL,
  `church_id` int(10) unsigned DEFAULT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `all_day` tinyint(1) NOT NULL DEFAULT '0',
  `busy` tinyint(1) NOT NULL DEFAULT '1',
  `name` varchar(255) NOT NULL,
  `recurring` tinyint(1) NOT NULL DEFAULT '0',
  `timezone` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_meta`
--

CREATE TABLE IF NOT EXISTS `event_meta` (
`id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_occurrences`
--

CREATE TABLE IF NOT EXISTS `event_occurrences` (
`id` int(11) NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `rule_id` int(10) unsigned NOT NULL,
  `exception_id` int(10) unsigned DEFAULT NULL,
  `start_datetime` int(11) NOT NULL,
  `end_datetime` int(11) DEFAULT NULL,
  `all_day` int(11) NOT NULL DEFAULT '0',
  `busy` tinyint(1) NOT NULL DEFAULT '1',
  `timezone` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `event_recur_rules`
--

CREATE TABLE IF NOT EXISTS `event_recur_rules` (
`id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `start_datetime` datetime NOT NULL,
  `end_datetime` datetime DEFAULT NULL,
  `created_datetime` datetime NOT NULL,
  `updated_datetime` datetime DEFAULT NULL,
  `calculated_to` datetime DEFAULT NULL,
  `rule` varchar(255) NOT NULL COMMENT 'To Be Discussed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notes`
--

CREATE TABLE IF NOT EXISTS `notes` (
`id` int(10) unsigned NOT NULL,
  `guid` char(36) NOT NULL DEFAULT 'UUID()',
  `ref_table` enum('churches','contacts','events') NOT NULL,
  `ref_id` int(10) unsigned NOT NULL,
  `created_datetime` int(11) NOT NULL,
  `updated_datetime` int(11) DEFAULT NULL,
  `ref_public` tinyint(1) DEFAULT NULL,
  `note` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `note_meta`
--

CREATE TABLE IF NOT EXISTS `note_meta` (
`id` int(10) unsigned NOT NULL,
  `note_id` int(10) unsigned NOT NULL,
  `meta_key` varchar(255) NOT NULL,
  `meta_value` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `recurrence_exceptions`
--

CREATE TABLE IF NOT EXISTS `recurrence_exceptions` (
`id` int(10) unsigned NOT NULL,
  `event_id` int(10) unsigned NOT NULL,
  `rule_id` int(10) unsigned NOT NULL,
  `orig_start_datetime` int(11) NOT NULL,
  `is_cancelled` tinyint(1) NOT NULL DEFAULT '0',
  `start_datetime` int(11) NOT NULL,
  `end_datetime` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `calendars`
--
ALTER TABLE `calendars`
 ADD PRIMARY KEY (`id`);

--
-- Indexes for table `calendar_events`
--
ALTER TABLE `calendar_events`
 ADD UNIQUE KEY `calendar_id` (`calendar_id`,`event_guid`);

--
-- Indexes for table `church_contacts`
--
ALTER TABLE `church_contacts`
 ADD UNIQUE KEY `church_id` (`church_id`,`contact_id`), ADD KEY `contact_id` (`contact_id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `guid` (`guid`), ADD KEY `creator_id` (`creator_id`);

--
-- Indexes for table `contact_meta`
--
ALTER TABLE `contact_meta`
 ADD PRIMARY KEY (`id`), ADD KEY `contact_id` (`contact_id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `guid` (`guid`), ADD UNIQUE KEY `church_id` (`church_id`);

--
-- Indexes for table `event_meta`
--
ALTER TABLE `event_meta`
 ADD PRIMARY KEY (`id`), ADD KEY `event_id` (`event_id`);

--
-- Indexes for table `event_occurrences`
--
ALTER TABLE `event_occurrences`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `event_id` (`event_id`), ADD UNIQUE KEY `rule_id` (`rule_id`), ADD UNIQUE KEY `exception_id` (`exception_id`);

--
-- Indexes for table `event_recur_rules`
--
ALTER TABLE `event_recur_rules`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `event_id` (`event_id`);

--
-- Indexes for table `notes`
--
ALTER TABLE `notes`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `guid` (`guid`), ADD KEY `ref_id` (`ref_id`);

--
-- Indexes for table `note_meta`
--
ALTER TABLE `note_meta`
 ADD PRIMARY KEY (`id`), ADD KEY `note_id` (`note_id`);

--
-- Indexes for table `recurrence_exceptions`
--
ALTER TABLE `recurrence_exceptions`
 ADD PRIMARY KEY (`id`), ADD UNIQUE KEY `event_id` (`event_id`), ADD UNIQUE KEY `rule_id` (`rule_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `calendars`
--
ALTER TABLE `calendars`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `contact_meta`
--
ALTER TABLE `contact_meta`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `events`
--
ALTER TABLE `events`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_meta`
--
ALTER TABLE `event_meta`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_occurrences`
--
ALTER TABLE `event_occurrences`
MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `event_recur_rules`
--
ALTER TABLE `event_recur_rules`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notes`
--
ALTER TABLE `notes`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `note_meta`
--
ALTER TABLE `note_meta`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `recurrence_exceptions`
--
ALTER TABLE `recurrence_exceptions`
MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `calendar_events`
--
ALTER TABLE `calendar_events`
ADD CONSTRAINT `calendar_events_ibfk_1` FOREIGN KEY (`calendar_id`) REFERENCES `calendars` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `church_contacts`
--
ALTER TABLE `church_contacts`
ADD CONSTRAINT `church_contacts_ibfk_2` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `church_contacts_ibfk_4` FOREIGN KEY (`church_id`) REFERENCES `ifbmt_public`.`churches` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `contacts`
--
ALTER TABLE `contacts`
ADD CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `ifbmt_users`.`users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `contact_meta`
--
ALTER TABLE `contact_meta`
ADD CONSTRAINT `contact_meta_ibfk_1` FOREIGN KEY (`contact_id`) REFERENCES `contacts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `events`
--
ALTER TABLE `events`
ADD CONSTRAINT `events_ibfk_1` FOREIGN KEY (`church_id`) REFERENCES `ifbmt_public`.`churches` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `event_meta`
--
ALTER TABLE `event_meta`
ADD CONSTRAINT `event_meta_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_occurrences`
--
ALTER TABLE `event_occurrences`
ADD CONSTRAINT `event_occurrences_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `event_occurrences_ibfk_2` FOREIGN KEY (`rule_id`) REFERENCES `event_recur_rules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `event_occurrences_ibfk_3` FOREIGN KEY (`exception_id`) REFERENCES `recurrence_exceptions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `event_recur_rules`
--
ALTER TABLE `event_recur_rules`
ADD CONSTRAINT `event_recur_rules_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `note_meta`
--
ALTER TABLE `note_meta`
ADD CONSTRAINT `note_meta_ibfk_1` FOREIGN KEY (`note_id`) REFERENCES `notes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `recurrence_exceptions`
--
ALTER TABLE `recurrence_exceptions`
ADD CONSTRAINT `recurrence_exceptions_ibfk_1` FOREIGN KEY (`event_id`) REFERENCES `events` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT `recurrence_exceptions_ibfk_2` FOREIGN KEY (`rule_id`) REFERENCES `event_recur_rules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
