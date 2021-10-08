/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100419
 Source Host           : localhost:3306
 Source Schema         : service_control

 Target Server Type    : MySQL
 Target Server Version : 100419
 File Encoding         : 65001

 Date: 28/09/2021 01:18:16
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for client_addresses
-- ----------------------------
DROP TABLE IF EXISTS `client_addresses`;
CREATE TABLE `client_addresses`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_client` bigint UNSIGNED NOT NULL,
  `area_manager` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `client_addresses_id_client_foreign`(`id_client`) USING BTREE,
  CONSTRAINT `client_addresses_id_client_foreign` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of client_addresses
-- ----------------------------
INSERT INTO `client_addresses` VALUES (1, 1, 'Jaime Bastidas', '4155 9th St. North', 'Naples', 'Florida', '34103', '2021-09-13 22:03:40', '2021-09-15 16:27:31', 1);
INSERT INTO `client_addresses` VALUES (2, 2, 'Jaime Bastidas', '7191-1 Cypress Lake Dr.', 'Fort Myers', 'Florida', '33907', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (3, 3, 'Gil Massey', '9041 Southside Blvd.', 'Jacksonville', 'Florida', '32256', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (4, 4, 'Nina Ortiz', '7600 Dr. Phillips Blvd.', 'Orlando', 'Florida', '32819', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (5, 5, 'Nina Ortiz', '965 West S.R. 436', 'Altamonte Springs', 'Florida', '32714', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (6, 6, 'Jaime Bastidas', '2301 Del Prado Blvd. S', 'Cape Coral', 'Florida', '33990', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (7, 7, 'Gil Massey', '1822 3rd St. South', 'Jacksonville Beach', 'Florida', '32250', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (8, 8, 'Jaime Bastidas', '3401-118 N. Miami Ave.', 'Miami (Midtown)', 'Florida', '33127', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (9, 9, 'Gil Massey', '1400 Village Square Blvd.', 'Tallahassee', 'Florida', '32309', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (10, 10, 'Jaime Bastidas', '10004 Gulf Center Dr.', 'Fort Myers', 'Florida', '33913', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (11, 11, 'Nina Ortiz', '4664 Millenia Plaza Way', 'Orlando', 'Florida', '32839', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (12, 12, 'Jaime Bastidas', '1351 NW St. Lucie West Blvd.', 'St. Lucie West', 'Florida', '34986', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (13, 13, 'Nina Ortiz', '6719 Eagle Watch Drive', 'Orlando (Lee Vista)', 'Florida', '32822', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (14, 14, 'Gil Massey', '9625 Crosshill Blvd.', 'Jacksonville', 'Florida', '32222', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (15, 15, 'Jaime Bastidas', '27251 Bay Landing Dr.', 'Bonita Springs', 'Florida', '34135', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (16, 16, 'Jaime Bastidas', '10017 Gulf Center Dr.', 'Fort Myers', 'Florida', '33913', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (17, 17, 'Nina Ortiz', '3349 Daniels Rd.', 'Winter Garden', 'Florida', '34787', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (18, 18, 'Nina Ortiz', '1724 US 27 North', 'Sebring', 'Florida', '33870', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (19, 19, 'Nina Ortiz', '3055 Columbia Blvd.', 'Titusville', 'Florida', '32780', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (20, 20, 'Gil Massey', '661 Blanding Blvd.', 'Orange Park', 'Florida', '32073', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (21, 21, 'Nina Ortiz', '2175 East Semoran Blvd.', 'Apopka', 'Florida', '32703', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (22, 22, 'Nina Ortiz', '5505 S Williamson Blvd.', 'Port Orange', 'Florida', '32128', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (23, 23, 'Nina Ortiz', '6561 S Tamiami Trail', 'Sarasota', 'Florida', '34231', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (24, 24, 'Gil Massey', '14964 Duval Road', 'Jacksonville', 'Florida', '32218', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (25, 25, 'Gil Massey', '5149 Normandy Blvd.', 'Jacksonville (Normandy)', 'Florida', '32205', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (26, 26, 'Nina Ortiz', '7250 Cortez Rd. West', 'Bradenton', 'Florida', '34210', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (27, 27, 'Nina Ortiz', '5975 S Goldenrod Rd.', 'Orlando', 'Florida', '32822', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (28, 28, 'Nina Ortiz', '4803 W. Irlo Bronson Hwy.', 'Kissimmee', 'Florida', '34746', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (29, 29, 'Nina Ortiz', '731 Centerview Blvd.', 'Kissimmee', 'Florida', '34741', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (30, 30, 'Nina Ortiz', '3645 Wedgewood Ln.', 'The Villages', 'Florida', '32162', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (31, 31, 'Jaime Bastidas', '13100 Tamiami Trail E', 'Naples', 'Florida', '34114', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (32, 32, 'Gil Massey', '3965 Plaza Blvd. S40', 'Gainesville', 'Florida', '32608', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (33, 33, 'Nina Ortiz', '501 N. Orlando Ave. S', 'Winter Park', 'Florida', '32789', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (34, 34, 'Nina Ortiz', '2789 E. Irlo Bronson Memorial Hwy.', 'Kissimmee (St. Cloud)', 'Florida', '34744', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (35, 35, 'Nina Ortiz', '1679 US 41 Bypass South Jacaranda Plaza', 'Venice', 'Florida', '34293', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (36, 36, 'Nina Ortiz', '11637 Regency Village Drive', 'Orlando', 'Florida', '32821', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (37, 37, 'Nina Ortiz', '4414 SW College Rd', 'Ocala', 'Florida', '34474', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (38, 38, 'Gil Massey', 'Town & Country Shopping Center 115 Town & Country Road', 'Palatka', 'Florida', '32177', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (39, 39, 'Nina Ortiz', 'Central Square Shopping Center 1121 Alafaya Trial  Suite 1081', 'Oviedo', 'Florida', '32765', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (40, 40, 'Nina Ortiz', '1551 WP Ball Blvd.', 'Sanford', 'Florida', '32771', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (41, 41, 'Jaime Bastidas', '4995 S Cleveland Ave.', 'Fort Myers', 'Florida', '33907', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (42, 42, 'Jaime Bastidas', '2115 9th St N', 'Naples', 'Florida', '34102', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (43, 43, 'Gil Massey', '1795 US Hwy. 1 South', 'St. Augustine', 'Florida', '32084', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (44, 44, 'Jaime Bastidas', '1700 S. Federal Hwy.', 'Delray Beach', 'Florida', '33444', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (45, 45, 'Nina Ortiz', '2461 N. Atlantic Ave.', 'Daytona Beach', 'Florida', '32118', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (46, 46, 'Jaime Bastidas', '205 Palm Bay Rd', 'West Melbourne', 'Florida', '32904', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (47, 47, 'Nina Ortiz', '8467 Cooper Creek Blvd.', 'Bradenton (University Park)', 'Florida', '34201', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (48, 48, 'Nina Ortiz', '3615 S. Florida Ave.', 'Lakeland', 'Florida', '33803', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (49, 49, 'Jaime Bastidas', '2475 NW Federal Hwy.', 'Stuart', 'Florida', '34994', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (50, 50, 'Jaime Bastidas', '3401 North Miami Avenue', 'Miami', 'Florida', '33127', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (51, 51, 'Jaime Bastidas', '6450 Lake Worth Rd.', 'Lake Worth', 'Florida', '33463', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (52, 52, 'Gil Massey', '1980  3rd St. South', 'Jacksonville (Beach)', 'Florida', '32250', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (53, 53, 'Nina Ortiz', '7323 W. Colonial Dr.', 'Orlando (W. Colonial)', 'Florida', '32818', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (54, 54, 'Nina Ortiz', '730 Sand Lake Rd.', 'Orlando (Florida Mall)', 'Florida', '32809', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (55, 55, 'Nina Ortiz', '4648 Millenia Plaza Way', 'Orlando (Millennia)', 'Florida', '32839', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (56, 56, 'Jaime Bastidas', '2550 PGA Blvd.', 'Palm Beach Gardens', 'Florida', '33410', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (57, 57, 'Nina Ortiz', '293 E. Altamonte Drive', 'Altamonte Springs', 'Florida', '32701', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (58, 58, 'Nina Ortiz', '2642 East Colonial Dr.', 'Orlando (E. Colonial)', 'Florida', '32803', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (59, 59, 'Jaime Bastidas', '1000 Immokalee Rd.', 'Naples', 'Florida', '34108', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (60, 60, 'Gil Massey', '1514 Governor\'s Sq. Blvd.', 'Tallahassee', 'Florida', '32301', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (61, 61, 'Gil Massey', '10993 San Jose Blvd', 'Jacksonville', 'Florida', '32223', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (62, 62, 'Nina Ortiz', '620 US Hwy. 441', 'Lady Lake', 'Florida', '32159', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (63, 63, 'Jaime Bastidas', '8014 Mediterranean Dr.', 'Estero', 'Florida', '33928', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (64, 64, 'Nina Ortiz', '2675 Gulf to Lake Hwy.', 'Inverness', 'Florida', '34453', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (65, 65, 'Nina Ortiz', '3899 West Lake Mary Blvd.', 'Lake Mary', 'Florida', '32746', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (66, 66, 'Gil Massey', '5260 Hwy. 100E', 'Palm Coast', 'Florida', '32164', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (67, 67, 'Nina Ortiz', '80 West Grant St.', 'Orlando (Sodo)', 'Florida', '32806', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (68, 68, 'Nina Ortiz', '2335 South Hwy. 27', 'Clermont', 'Florida', '34711', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (69, 69, 'Jaime Bastidas', '1149 5th St.', 'Miami (South Beach)', 'Florida', '33136', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (70, 70, 'Nina Ortiz', '2551 W. Osceola Pkwy', 'Kissimmee', 'Florida', '34741', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (71, 71, 'Gil Massey', '2487 W US Hwy. 90', 'Lake City', 'Florida', '32055', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (72, 72, 'Nina Ortiz', '7326 Gall Blvd.', 'Zephyrhills', 'Florida', '33541', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (73, 73, 'Gil Massey', '463899 SR 200', 'Yulee', 'Florida', '32097', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (74, 74, 'Nina Ortiz', '6250 US Hwy. 301 N', 'Ellenton', 'Florida', '34222', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (75, 75, 'Nina Ortiz', '4023 Hwy. 98 North', 'Lakeland', 'Florida', '33809', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (76, 76, 'Nina Ortiz', '3219 Rolling Oaks Blvd.', 'Kissimmee', 'Florida', '34747', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (77, 77, 'Jaime Bastidas', '1920 Cordova Rd.', 'Ft. Lauderdale (Causeway)', 'Florida', '33316', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (78, 78, 'Jaime Bastidas', '1626 S Federal Hwy.', 'Delray Beach', 'Florida', '33483', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (79, 79, 'Gil Massey', '3550 University Blvd. W', 'Jacksonville', 'Florida', '32217', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (80, 80, 'Jaime Bastidas', '405 21st St.', 'Vero Beach', 'Florida', '32960', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (81, 81, 'Jaime Bastidas', '1865 Palm Beach Lakes Blvd.', 'West Palm Beach (Lakes Blvd)', 'Florida', '33401', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (82, 82, 'Nina Ortiz', '16920 US Hwy. 441', 'Mount Dora', 'Florida', '32757', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (83, 83, 'Nina Ortiz', '800 Cypress Gardens Blvd.', 'Winter Haven', 'Florida', '33880', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (84, 84, 'Nina Ortiz', '11926 Narcoossee Rd.', 'Orlando (Lake Nona)', 'Florida', '32832', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (85, 85, 'Nina Ortiz', '3215 Vineland Rd.', 'Orlando (Kissimmee)', 'Florida', '34746', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (86, 86, 'Nina Ortiz', '8219 Cooper Creek Blvd.', 'Bradenton', 'Florida', '34201', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (87, 87, 'Nina Ortiz', '380 S State Rd 434', 'Altamonte Springs', 'Florida', '32714', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (88, 88, 'Jaime Bastidas', '9370 Ben CPratt/6 Mile cypress parkway #3', 'Fort Myers', 'Florida', '33966', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (89, 89, 'Nina Ortiz', '5295 International Dr.', 'Orlando (I-Drive)', 'Florida', '32819', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (90, 90, 'Jaime Bastidas', '1502 Del Prado Blvd. S.', 'Cape Coral', 'Florida', '33990', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (91, 91, 'Nina Ortiz', '120 S. Courtney Parkway', 'Merritt Island', 'Florida', '32952', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (92, 91, 'Jaime Bastidas', '205 Palm Bay Road', 'West Melbourne', 'Florida', '32904', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (93, 92, 'Nina Ortiz', '391 Alafaya Trail', 'Orlando (Waterford)', 'Florida', '32828', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (94, 92, 'Gil Massey', '525 West 23rd St.', 'Panama City', 'Florida', '32405', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (95, 93, 'Nina Ortiz', '1115 Cornerstone Blvd', 'Daytona Beach', 'Florida', '32117', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (96, 94, 'Jaime Bastidas', '2040 S. University Dr.', 'Davie', 'Florida', '33324', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (97, 95, 'Gil Massey', '11824 Atlantic Blvd.', 'Jacksonville', 'Florida', '32225', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (98, 96, 'Nina Ortiz', '1455 Semoran Blvd.', 'Casselberry', 'Florida', '32707', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (99, 97, 'Jaime Bastidas', '8765 Sw 136th St.', 'Miami (The Falls)', 'Florida', '33176', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (100, 98, 'Jaime Bastidas', '7191-2 Cypress Lake Dr.', 'Fort Myers', 'Florida', '33907', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (101, 99, 'Jaime Bastidas', '388 North Congress Ave.', 'Boynton Beach', 'Florida', '33426', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (102, 100, 'Jaime Bastidas', '2314 Remi Dr.', 'Melbourne (Viera)', 'Florida', '32940', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (103, 101, 'Gil Massey', '6001-14 Argyle Forest Blvd.', 'Jacksonville', 'Florida', '32244', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (104, 102, 'Gil Massey', '1009 NW 76th Blvd.', 'Gainesville', 'Florida', '32606', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (105, 103, 'Gil Massey', '11111-16 San Jose Blvd.', 'Jacksonville', 'Florida', '32223', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (106, 104, 'Jaime Bastidas', '2430 PGA Blvd.', 'Palm Beach Gardens', 'Florida', '33410', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (107, 105, 'Gil Massey', '3425 Thomasville Rd.', 'Tallahassee', 'Florida', '32308', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (108, 106, 'Nina Ortiz', '2615  Woodland South Bvld.', 'Deland', 'Florida', '32720', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (109, 107, 'Nina Ortiz', '6100 14th St. West', 'Bradenton', 'Florida', '34207', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (110, 108, 'Nina Ortiz', '1115 Vidina Place', 'Oviedo', 'Florida', '32765', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (111, 109, 'Jaime Bastidas', '5018 Airport Pulling Rd. N', 'Naples', 'Florida', '34105', '2021-09-13 22:03:40', NULL, 1);
INSERT INTO `client_addresses` VALUES (112, 109, 'Jaime Bastidas', '2421 N. Federal Hwy.', 'Pompano Beach', 'Florida', '33064', '2021-09-13 22:03:40', NULL, 1);

-- ----------------------------
-- Table structure for client_emails
-- ----------------------------
DROP TABLE IF EXISTS `client_emails`;
CREATE TABLE `client_emails`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_client` bigint UNSIGNED NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_primary` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `marketing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `client_emails_id_client_foreign`(`id_client`) USING BTREE,
  CONSTRAINT `client_emails_id_client_foreign` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client_emails
-- ----------------------------

-- ----------------------------
-- Table structure for client_numbers
-- ----------------------------
DROP TABLE IF EXISTS `client_numbers`;
CREATE TABLE `client_numbers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_client` bigint UNSIGNED NOT NULL,
  `primary_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_number` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_phone_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `marketing` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `client_numbers_id_client_foreign`(`id_client`) USING BTREE,
  CONSTRAINT `client_numbers_id_client_foreign` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client_numbers
-- ----------------------------
INSERT INTO `client_numbers` VALUES (1, 1, 'Y', '(239) 403-9211', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (2, 2, 'Y', '(239) 482-5768', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (3, 3, 'Y', '(904) 519-8363', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (4, 4, 'Y', '(407) 370-4478', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (5, 5, 'Y', '(407) 774-1015', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (6, 6, 'Y', '(239) 573-0872', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (7, 7, 'Y', '(904) 249-6525', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (8, 8, 'Y', '(305) 576-2148', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (9, 9, 'Y', '(850) 894-2385', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (10, 10, 'Y', '(239) 437-1614', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (11, 11, 'Y', '(407) 351-9847', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (12, 12, 'Y', '(772) 336-8617', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (13, 13, 'Y', '(407) 859-0060', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (14, 14, 'Y', '(904) 779-9648', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (15, 15, 'Y', '(239) 498-4262', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (16, 16, 'Y', '(239) 267-5697', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (17, 17, 'Y', '(407) 654-1290', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (18, 18, 'Y', '(863) 382-2190', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (19, 19, 'Y', '(321) 264-1579', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (20, 20, 'Y', '(904) 272-1792', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (21, 21, 'Y', '(407) 880-3208', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (22, 22, 'Y', '(386) 763-4681', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (23, 23, 'Y', '(941) 921-6641', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (24, 24, 'Y', '(904) 751-1183', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (25, 25, 'Y', '(904) 786-1395', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (26, 26, 'Y', '(941) 761-1972', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (27, 27, 'Y', '(407) 482-0922', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (28, 28, 'Y', '(321) 677-0419', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (29, 29, 'Y', '(407) 932-2613', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (30, 30, 'Y', '(352) 674-0507', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (31, 31, 'Y', '(239) 530-1181', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (32, 32, 'Y', '(352) 378-7466', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (33, 33, 'Y', '(407) 647-0260', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (34, 34, 'Y', '(407) 944-2296', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (35, 35, 'Y', '(941) 492-5519', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (36, 36, 'Y', '(321) 677-0000', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (37, 37, 'Y', '(352) 237-4893', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (38, 38, 'Y', '(386) 329-2624', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (39, 39, 'Y', '(407) 359-5074', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (40, 40, 'Y', '(407) 302-0839', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (41, 41, 'Y', '(239) 931-4671', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (42, 42, 'Y', '(239) 262-8681', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (43, 43, 'Y', '(904) 808-1246', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (44, 44, 'Y', '(561) 265-0566', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (45, 45, 'Y', '(386) 676-3970', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (46, 46, 'Y', '(321) 956-8678', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (47, 47, 'Y', '(941) 359-6828', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (48, 48, 'Y', '(863) 647-3316', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (49, 49, 'Y', '(772) 232-3220', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (50, 50, 'Y', '(305) 576-1203', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (51, 51, 'Y', '(561) 642-7503', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (52, 52, 'Y', '(904) 242-2484', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (53, 53, 'Y', '(407) 294-1136', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (54, 54, 'Y', '(407) 240-9591', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (55, 55, 'Y', '(407) 248-1915', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (56, 56, 'Y', '(561) 776-0501', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (57, 57, 'Y', '(407) 834-2015', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (58, 58, 'Y', '(407) 895-6133', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (59, 59, 'Y', '(239) 597-5150', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (60, 60, 'Y', '(850) 877-1951', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (61, 61, 'Y', '(904) 288-8349', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (62, 62, 'Y', '(352) 430-2341', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (63, 63, 'Y', '(239) 390-2117', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (64, 64, 'Y', '(352) 344-2315', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (65, 65, 'Y', '(407) 322-1776', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (66, 66, 'Y', '(386) 437-9557', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (67, 67, 'Y', '(407) 426-1720', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (68, 68, 'Y', '(352) 241-0693', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (69, 69, 'Y', '(305) 538-3310', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (70, 70, 'Y', '(407) 846-8044', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (71, 71, 'Y', '(386) 752-5658', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (72, 72, 'Y', '(813) 782-2613', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (73, 73, 'Y', '(904) 277-6715', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (74, 74, 'Y', '(941) 722-7571', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (75, 75, 'Y', '(863) 858-3638', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (76, 76, 'Y', '(407) 465-8613', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (77, 77, 'Y', '(954) 522-1912', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (78, 78, 'Y', '(561) 278-5773', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (79, 79, 'Y', '(904) 448-4603', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (80, 80, 'Y', '(772) 569-3164', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (81, 81, 'Y', '(561) 615-8798', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (82, 82, 'Y', '(352) 385-1080', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (83, 83, 'Y', '(863) 299-7458', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (84, 84, 'Y', '(407) 313-2180', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (85, 85, 'Y', '(407) 239-2375', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (86, 86, 'Y', '(941) 351-3206', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (87, 87, 'Y', '(407) 786-7001', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (88, 88, 'Y', '(239) 931-0581', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (89, 89, 'Y', '(407) 363-7775', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (90, 90, 'Y', '(239) 573-1800', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (91, 91, 'Y', '(321) 452-2814', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (92, 92, 'Y', '(407) 275-7335', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (93, 93, 'Y', '(386) 274-3322', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (94, 94, 'Y', '(954) 474-5336', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (95, 95, 'Y', '(904) 998-1233', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (96, 96, 'Y', '(407) 671-0851', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (97, 97, 'Y', '(305) 255-5498', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (98, 98, 'Y', '(239) 433-3451', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (99, 99, 'Y', '(561) 734-2217', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (100, 100, 'Y', '(321) 433-3256', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (101, 101, 'Y', '(904) 779-0026', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (102, 102, 'Y', '(352) 333-0155', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (103, 103, 'Y', '(904) 260-6205', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (104, 104, 'Y', '(561) 625-4117', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (105, 105, 'Y', '(850) 668-9555', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (106, 106, 'Y', '(386) 822-9590', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (107, 107, 'Y', '(941) 758-2222', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (108, 108, 'Y', '(407) 971-4040', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);
INSERT INTO `client_numbers` VALUES (109, 109, 'Y', '(239) 649-1553', 'Comercial', '+1', 'ND', '2021-09-13 22:10:32', NULL, 1);

-- ----------------------------
-- Table structure for client_scheduling
-- ----------------------------
DROP TABLE IF EXISTS `client_scheduling`;
CREATE TABLE `client_scheduling`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_client` bigint UNSIGNED NOT NULL,
  `id_client_address` bigint NOT NULL,
  `name_employer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `obs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `schedule_date` datetime(0) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `end_date` datetime(0) NULL DEFAULT NULL,
  `status_scheduling` int NOT NULL DEFAULT 1,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `client_scheduling_id_client_foreign`(`id_client`) USING BTREE,
  CONSTRAINT `client_scheduling_id_client_foreign` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 218 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client_scheduling
-- ----------------------------
INSERT INTO `client_scheduling` VALUES (1, 1, 1, 'Jaime Bastidas', '', '2021-12-01 12:00:00', '2021-09-17 01:20:00', '2021-09-20 01:45:23', NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (2, 1, 1, 'Jaime Bastidas', 'remodel Aug 16-Sep 10 teste', '2021-08-01 12:00:00', '2021-09-17 01:20:00', '2021-09-20 02:21:40', NULL, 3, 1);
INSERT INTO `client_scheduling` VALUES (3, 1, 1, 'Jaime Bastidas', 'remodel Aug 16-Sep 10', '2021-09-03 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (4, 2, 2, 'Jaime Bastidas', '', '2021-11-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (5, 2, 2, 'Jaime Bastidas', '', '2021-09-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (6, 2, 2, 'Jaime Bastidas', '', '2021-10-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (7, 2, 2, 'Jaime Bastidas', '', '2021-11-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (8, 2, 2, 'Jaime Bastidas', '', '2021-12-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (9, 3, 3, 'Gil Massey', 'remodel now no wax floor', '2021-12-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 3, 1);
INSERT INTO `client_scheduling` VALUES (10, 3, 3, 'Gil Massey', '', '2021-08-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (11, 4, 4, 'Nina Ortiz', '', '2021-09-04 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 4, 1);
INSERT INTO `client_scheduling` VALUES (12, 4, 4, 'Nina Ortiz', '', '2021-12-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (13, 5, 5, 'Nina Ortiz', 'remodel Aug 9-Sep 3', '2021-09-14 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (14, 6, 6, 'Jaime Bastidas', '', '2021-12-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (15, 6, 6, 'Jaime Bastidas', '', '2021-08-02 12:00:00', '2021-09-17 01:20:00', '2021-08-02 12:00:00', '2021-08-02 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (16, 7, 7, 'Gil Massey', '', '2021-10-12 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (17, 7, 7, 'Gil Massey', '', '2021-12-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (18, 8, 8, 'Jaime Bastidas', '', '2021-08-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (19, 9, 9, 'Gil Massey', 'remodel Sep 6-Oct 1', '2021-08-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 3, 1);
INSERT INTO `client_scheduling` VALUES (20, 9, 9, 'Gil Massey', 'remodel Sep 6-Oct 1', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (21, 9, 9, 'Gil Massey', '', '2021-12-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (22, 10, 10, 'Jaime Bastidas', '', '2021-12-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (23, 10, 10, 'Jaime Bastidas', 'remodel Sep 6-Oct 1', '2021-08-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 3, 1);
INSERT INTO `client_scheduling` VALUES (24, 10, 10, 'Jaime Bastidas', '', '2021-09-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (25, 10, 10, 'Jaime Bastidas', '', '2021-10-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (26, 10, 10, 'Jaime Bastidas', '', '2021-11-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (27, 10, 10, 'Jaime Bastidas', '', '2021-12-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (28, 10, 10, 'Jaime Bastidas', 'remodel Sep 6-Oct 1', '2021-10-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (29, 11, 11, 'Nina Ortiz', '', '2021-12-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (30, 11, 11, 'Nina Ortiz', '', '2021-08-20 12:00:00', '2021-09-17 01:20:00', '2021-08-20 12:00:00', '2021-08-20 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (31, 12, 12, 'Jaime Bastidas', '', '2021-10-12 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (32, 13, 13, 'Nina Ortiz', '', '2021-09-06 12:00:00', '2021-09-17 01:20:00', '2021-09-06 12:00:00', '2021-09-06 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (33, 13, 13, 'Nina Ortiz', '', '2021-12-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (34, 14, 14, 'Gil Massey', '', '2021-12-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (35, 14, 14, 'Gil Massey', '', '2021-09-06 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (36, 15, 15, 'Jaime Bastidas', '', '2021-12-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (37, 15, 15, 'Jaime Bastidas', '', '2021-08-04 12:00:00', '2021-09-17 01:20:00', '2021-08-04 12:00:00', '2021-08-04 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (38, 16, 16, 'Jaime Bastidas', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (39, 16, 16, 'Jaime Bastidas', '', '2021-08-26 12:00:00', '2021-09-17 01:20:00', '2021-08-26 12:00:00', '2021-08-26 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (40, 17, 17, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (41, 17, 17, 'Nina Ortiz', '', '2021-08-28 12:00:00', '2021-09-17 01:20:00', '2021-08-29 12:00:00', '2021-08-29 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (42, 18, 18, 'Nina Ortiz', '', '2021-09-21 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (43, 18, 18, 'Nina Ortiz', '', '2021-10-18 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (44, 19, 19, 'Nina Ortiz', '', '2021-09-06 12:00:00', '2021-09-17 01:20:00', '2021-09-06 12:00:00', '2021-09-06 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (45, 19, 19, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (46, 20, 20, 'Gil Massey', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (47, 20, 20, 'Gil Massey', '', '2021-09-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (48, 21, 21, 'Nina Ortiz', '', '2021-09-08 12:00:00', '2021-09-17 01:20:00', '2021-09-08 12:00:00', '2021-09-08 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (49, 21, 21, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (50, 22, 22, 'Nina Ortiz', '', '2021-08-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (51, 22, 22, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (52, 23, 23, 'Nina Ortiz', '', '2021-08-31 12:00:00', '2021-09-17 01:20:00', '2021-08-31 12:00:00', '2021-08-31 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (53, 23, 23, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (54, 24, 24, 'Gil Massey', '', '2021-09-22 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (55, 24, 24, 'Gil Massey', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (56, 25, 25, 'Gil Massey', '', '2021-09-26 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (57, 25, 25, 'Gil Massey', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (58, 26, 26, 'Nina Ortiz', '', '2021-08-23 12:00:00', '2021-09-17 01:20:00', '2021-08-23 12:00:00', '2021-08-23 12:00:00', 5, 1);
INSERT INTO `client_scheduling` VALUES (59, 26, 26, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (60, 27, 27, 'Nina Ortiz', '', '2021-09-10 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 4, 1);
INSERT INTO `client_scheduling` VALUES (61, 27, 27, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (62, 28, 28, 'Nina Ortiz', '', '2021-09-10 12:00:00', '2021-09-17 01:20:00', '2021-09-10 12:00:00', '2021-09-10 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (63, 28, 28, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (64, 29, 29, 'Nina Ortiz', '', '2021-09-10 12:00:00', '2021-09-17 01:20:00', '2021-09-10 12:00:00', '2021-09-10 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (65, 29, 29, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (66, 30, 30, 'Nina Ortiz', '', '2021-09-02 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 4, 1);
INSERT INTO `client_scheduling` VALUES (67, 30, 30, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (68, 31, 31, 'Jaime Bastidas', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (69, 31, 31, 'Jaime Bastidas', '', '2021-08-24 12:00:00', '2021-09-17 01:20:00', '2021-08-24 12:00:00', '2021-08-24 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (70, 32, 32, 'Gil Massey', '', '2021-09-28 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (71, 32, 32, 'Gil Massey', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (72, 33, 33, 'Nina Ortiz', '', '2021-09-18 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (73, 33, 33, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (74, 34, 34, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (75, 34, 34, 'Nina Ortiz', '', '2021-08-25 12:00:00', '2021-09-17 01:20:00', '2021-08-25 12:00:00', '2021-08-25 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (76, 35, 35, 'Nina Ortiz', '', '2021-09-19 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (77, 35, 35, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (78, 36, 36, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (79, 36, 36, 'Nina Ortiz', '', '2021-08-18 12:00:00', '2021-09-17 01:20:00', '2021-08-18 12:00:00', '2021-08-18 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (80, 37, 37, 'Nina Ortiz', '', '2021-10-04 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (81, 37, 37, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (82, 38, 38, 'Gil Massey', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (83, 39, 39, 'Nina Ortiz', '', '2021-09-13 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (84, 39, 39, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (85, 40, 40, 'Nina Ortiz', '', '2021-09-13 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (86, 40, 40, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (87, 41, 41, 'Jaime Bastidas', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (88, 41, 41, 'Jaime Bastidas', '', '2021-08-10 12:00:00', '2021-09-17 01:20:00', '2021-08-10 12:00:00', '2021-08-10 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (89, 42, 42, 'Jaime Bastidas', '', '2021-09-13 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (90, 42, 42, 'Jaime Bastidas', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (91, 43, 43, 'Gil Massey', '', '2021-09-13 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (92, 43, 43, 'Gil Massey', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (93, 44, 44, 'Jaime Bastidas', '', '2021-09-06 12:00:00', '2021-09-17 01:20:00', '2021-09-06 12:00:00', '2021-09-06 12:00:00', 7, 1);
INSERT INTO `client_scheduling` VALUES (94, 45, 45, 'Nina Ortiz', '', '2021-09-13 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (95, 45, 45, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (96, 46, 46, 'Jaime Bastidas', '', '2021-09-04 12:00:00', '2021-09-17 01:20:00', '2021-09-04 12:00:00', '2021-09-04 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (97, 46, 46, 'Jaime Bastidas', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (98, 47, 47, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (99, 47, 47, 'Nina Ortiz', '', '2021-08-13 12:00:00', '2021-09-17 01:20:00', '2021-08-13 12:00:00', '2021-08-13 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (100, 48, 48, 'Nina Ortiz', '', '2021-10-04 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (101, 48, 48, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (102, 49, 49, 'Jaime Bastidas', '', '2021-10-10 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (103, 50, 50, 'Jaime Bastidas', '', '2021-09-11 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 4, 1);
INSERT INTO `client_scheduling` VALUES (104, 51, 51, 'Jaime Bastidas', '', '2021-09-08 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 4, 1);
INSERT INTO `client_scheduling` VALUES (105, 52, 52, 'Gil Massey', '', '2021-10-10 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (106, 52, 52, 'Gil Massey', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (107, 53, 53, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (108, 53, 53, 'Nina Ortiz', '', '2021-09-01 12:00:00', '2021-09-17 01:20:00', '2021-09-01 12:00:00', '2021-09-01 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (109, 54, 54, 'Nina Ortiz', '', '2021-09-14 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (110, 54, 54, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (111, 55, 55, 'Nina Ortiz', '', '2021-09-16 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (112, 55, 55, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (113, 56, 56, 'Jaime Bastidas', '', '2021-08-30 12:00:00', '2021-09-17 01:20:00', '2021-08-30 12:00:00', '2021-08-30 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (114, 57, 57, 'Nina Ortiz', '', '2021-09-21 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (115, 57, 57, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (116, 58, 58, 'Nina Ortiz', '', '2021-09-23 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (117, 58, 58, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (118, 59, 59, 'Jaime Bastidas', '', '2021-10-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (119, 59, 59, 'Jaime Bastidas', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (120, 60, 60, 'Gil Massey', '', '2021-10-14 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (121, 60, 60, 'Gil Massey', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (122, 61, 61, 'Gil Massey', '', '2021-10-03 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (123, 61, 61, 'Gil Massey', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (124, 62, 62, 'Nina Ortiz', 'REMODEL MAY 24 - JUNE 25', '2021-08-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 3, 1);
INSERT INTO `client_scheduling` VALUES (125, 62, 62, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (126, 63, 63, 'Jaime Bastidas', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (127, 63, 63, 'Jaime Bastidas', '', '2021-08-13 12:00:00', '2021-09-17 01:20:00', '2021-08-13 12:00:00', '2021-08-13 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (128, 64, 64, 'Nina Ortiz', '', '2021-08-25 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 4, 1);
INSERT INTO `client_scheduling` VALUES (129, 65, 65, 'Nina Ortiz', '', '2021-09-21 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (130, 65, 65, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (131, 66, 66, 'Gil Massey', '', '2021-10-05 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (132, 66, 66, 'Gil Massey', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (133, 67, 67, 'Nina Ortiz', '', '2021-09-28 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (134, 67, 67, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (135, 68, 68, 'Nina Ortiz', '', '2021-10-21 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (136, 68, 68, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (137, 69, 69, 'Jaime Bastidas', '', '2021-09-14 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (138, 70, 70, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (139, 70, 70, 'Nina Ortiz', '', '2021-08-25 12:00:00', '2021-09-17 01:20:00', '2021-08-25 12:00:00', '2021-08-25 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (140, 71, 71, 'Gil Massey', '', '2021-10-07 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (141, 71, 71, 'Gil Massey', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (142, 72, 72, 'Nina Ortiz', '', '2021-09-16 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (143, 72, 72, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (144, 73, 73, 'Gil Massey', 'stripped in May for remodel', '2021-08-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 3, 1);
INSERT INTO `client_scheduling` VALUES (145, 73, 73, 'Gil Massey', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (146, 74, 74, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (147, 74, 74, 'Nina Ortiz', 'Remodel June/July', '2021-08-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 3, 1);
INSERT INTO `client_scheduling` VALUES (148, 75, 75, 'Nina Ortiz', 'remodel Oct 18-Nov 19', '2021-08-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 3, 1);
INSERT INTO `client_scheduling` VALUES (149, 75, 75, 'Nina Ortiz', 'remodel Oct 18-Nov 19', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 3, 1);
INSERT INTO `client_scheduling` VALUES (150, 76, 76, 'Nina Ortiz', '', '2021-08-27 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 4, 1);
INSERT INTO `client_scheduling` VALUES (151, 76, 76, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (152, 77, 77, 'Jaime Bastidas', '', '2021-09-16 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (153, 78, 78, 'Jaime Bastidas', '', '2021-08-29 12:00:00', '2021-09-17 01:20:00', '2021-08-29 12:00:00', '2021-08-29 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (154, 79, 79, 'Gil Massey', '', '2021-09-18 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (155, 79, 79, 'Gil Massey', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (156, 80, 80, 'Jaime Bastidas', '', '2021-10-07 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (157, 81, 81, 'Jaime Bastidas', '', '2021-10-03 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (158, 82, 82, 'Nina Ortiz', '', '2021-10-06 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (159, 82, 82, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (160, 83, 83, 'Nina Ortiz', '', '2021-09-08 12:00:00', '2021-09-17 01:20:00', '2021-09-08 12:00:00', '2021-09-08 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (161, 83, 83, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (162, 84, 84, 'Nina Ortiz', '', '2021-08-20 12:00:00', '2021-09-17 01:20:00', '2021-08-20 12:00:00', '2021-08-20 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (163, 84, 84, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (164, 85, 85, 'Nina Ortiz', '', '2021-08-23 12:00:00', '2021-09-17 01:20:00', '2021-08-23 12:00:00', '2021-08-23 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (165, 85, 85, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (166, 86, 86, 'Nina Ortiz', '', '2021-10-25 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (167, 86, 86, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (168, 87, 87, 'Nina Ortiz', '', '2021-10-10 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (169, 87, 87, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (170, 88, 88, 'Jaime Bastidas', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (171, 88, 88, 'Jaime Bastidas', '', '2021-08-16 12:00:00', '2021-09-17 01:20:00', '2021-08-16 12:00:00', '2021-08-16 12:00:00', 7, 1);
INSERT INTO `client_scheduling` VALUES (172, 89, 89, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (173, 89, 89, 'Nina Ortiz', '', '2021-09-01 12:00:00', '2021-09-17 01:20:00', '2021-09-01 12:00:00', '2021-09-01 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (174, 90, 90, 'Jaime Bastidas', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (175, 90, 90, 'Jaime Bastidas', 'remodel Aug 2-Sep 3', '2021-08-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 3, 1);
INSERT INTO `client_scheduling` VALUES (176, 90, 90, 'Jaime Bastidas', 'remodel Aug 3-Sep 2', '2021-08-09 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 4, 1);
INSERT INTO `client_scheduling` VALUES (177, 90, 90, 'Jaime Bastidas', 'remodel Aug 3-Sep 2', '2021-09-03 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (178, 91, 91, 'Nina Ortiz', '', '2021-09-19 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (179, 91, 91, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (180, 91, 92, 'Jaime Bastidas', 'Sales Floor: Sweep/Wash quarterly / Support Areas Strip & wax Annually)', '2021-09-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (181, 92, 93, 'Nina Ortiz', '', '2021-10-12 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (182, 92, 94, 'Gil Massey', 'Sales Floor: Sweep/Wash quarterly / Support Areas Strip & wax Annually)', '2021-09-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (183, 92, 93, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (184, 93, 95, 'Nina Ortiz', '', '2021-09-08 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 4, 1);
INSERT INTO `client_scheduling` VALUES (185, 93, 95, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (186, 94, 96, 'Jaime Bastidas', '', '2021-09-19 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (187, 95, 97, 'Gil Massey', '', '2021-10-26 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (188, 95, 97, 'Gil Massey', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (189, 96, 98, 'Nina Ortiz', '', '2021-10-17 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (190, 97, 99, 'Jaime Bastidas', '', '2021-09-28 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (191, 98, 100, 'Jaime Bastidas', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (192, 98, 100, 'Jaime Bastidas', '', '2021-08-19 12:00:00', '2021-09-17 01:20:00', '2021-08-19 12:00:00', '2021-08-19 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (193, 99, 101, 'Jaime Bastidas', '', '2021-10-16 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (194, 100, 102, 'Jaime Bastidas', '', '2021-09-03 12:00:00', '2021-09-17 01:20:00', '2021-09-03 12:00:00', '2021-09-03 12:00:00', 5, 1);
INSERT INTO `client_scheduling` VALUES (195, 100, 102, 'Jaime Bastidas', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (196, 101, 103, 'Gil Massey', 'stripped in April for remodel', '2021-10-28 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (197, 101, 103, 'Gil Massey', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (198, 102, 104, 'Gil Massey', '', '2021-09-19 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (199, 102, 104, 'Gil Massey', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (200, 103, 105, 'Gil Massey', '', '2021-10-21 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (201, 103, 105, 'Gil Massey', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (202, 104, 106, 'Jaime Bastidas', '', '2021-09-30 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (203, 105, 107, 'Gil Massey', 'stripped in March for remodel', '2021-10-24 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (204, 105, 107, 'Gil Massey', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (205, 106, 108, 'Nina Ortiz', '', '2021-10-14 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (206, 106, 108, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (207, 107, 109, 'Nina Ortiz', '', '2021-10-08 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (208, 107, 109, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (209, 108, 110, 'Nina Ortiz', '', '2021-10-19 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (210, 108, 110, 'Nina Ortiz', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (211, 109, 111, 'Jaime Bastidas', '', '2021-10-15 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (212, 109, 112, 'Jaime Bastidas', 'Sales Floor: Sweep/Wash quarterly / Support Areas Strip & wax Annually)', '2021-09-01 12:00:00', '2021-09-17 01:20:00', NULL, NULL, 2, 1);
INSERT INTO `client_scheduling` VALUES (213, 109, 111, 'Jaime Bastidas', '', '2021-08-27 12:00:00', '2021-09-17 01:20:00', '2021-08-27 12:00:00', '2021-08-27 12:00:00', 6, 1);
INSERT INTO `client_scheduling` VALUES (214, 1, 1, 'TESTE', 'teste', '2021-09-22 11:47:00', '2021-09-20 12:48:59', '2021-09-25 06:12:21', '2021-09-25 06:12:21', 6, 1);
INSERT INTO `client_scheduling` VALUES (215, 1, 1, 'TESTE 2', 'TESTE 2', '2021-09-25 17:57:16', '2021-09-25 20:56:12', '2021-09-25 20:56:12', NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (216, 1, 1, '10', '', '2021-09-27 18:07:36', '2021-09-25 21:01:35', '2021-09-25 21:01:35', NULL, 1, 1);
INSERT INTO `client_scheduling` VALUES (217, 1, 1, '101000110010', '0101010', '2021-09-26 18:04:00', '2021-09-25 21:07:31', '2021-09-25 21:07:31', NULL, 2, 1);

-- ----------------------------
-- Table structure for client_scheduling_historical
-- ----------------------------
DROP TABLE IF EXISTS `client_scheduling_historical`;
CREATE TABLE `client_scheduling_historical`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_client_scheduling` bigint NOT NULL,
  `obs` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client_scheduling_historical
-- ----------------------------

-- ----------------------------
-- Table structure for client_scheduling_invoices
-- ----------------------------
DROP TABLE IF EXISTS `client_scheduling_invoices`;
CREATE TABLE `client_scheduling_invoices`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_client_scheduling` bigint UNSIGNED NOT NULL,
  `terms` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price_total` decimal(10, 2) NOT NULL,
  `observacao` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `completed_date` date NOT NULL,
  `due_date` date NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `client_scheduling_invoices_id_client_foreign`(`id_client_scheduling`) USING BTREE,
  CONSTRAINT `client_scheduling_invoices_id_client_scheduling_foreign` FOREIGN KEY (`id_client_scheduling`) REFERENCES `client_scheduling` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client_scheduling_invoices
-- ----------------------------
INSERT INTO `client_scheduling_invoices` VALUES (1, 214, 'Net 15', 800.00, NULL, '2021-09-25', '2021-10-09', '2021-09-25 06:12:21', '2021-09-25 06:12:21', 1);

-- ----------------------------
-- Table structure for client_service_scheduling
-- ----------------------------
DROP TABLE IF EXISTS `client_service_scheduling`;
CREATE TABLE `client_service_scheduling`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_client_service` bigint UNSIGNED NOT NULL,
  `id_client_scheduling` bigint UNSIGNED NOT NULL,
  `id_user` bigint UNSIGNED NULL DEFAULT NULL COMMENT 'funcionario que irá fazer o serviço',
  `price` decimal(10, 2) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `client_service_scheduling_id_client_service_foreign`(`id_client_service`) USING BTREE,
  INDEX `client_service_scheduling_id_client_scheduling_foreign`(`id_client_scheduling`) USING BTREE,
  INDEX `client_service_scheduling_id_user_foreign`(`id_user`) USING BTREE,
  CONSTRAINT `client_service_scheduling_id_client_scheduling_foreign` FOREIGN KEY (`id_client_scheduling`) REFERENCES `client_scheduling` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `client_service_scheduling_id_client_service_foreign` FOREIGN KEY (`id_client_service`) REFERENCES `client_services` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `client_service_scheduling_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 223 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client_service_scheduling
-- ----------------------------
INSERT INTO `client_service_scheduling` VALUES (1, 1, 1, 1, 580.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (2, 2, 2, 1, 0.00, '2021-09-17 01:20:00', '2021-09-20 02:19:03', 1);
INSERT INTO `client_service_scheduling` VALUES (3, 3, 3, 1, 2180.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (4, 4, 4, 1, 350.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (5, 5, 5, 1, 55.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (6, 5, 6, 1, 55.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (7, 5, 7, 1, 55.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (8, 5, 8, 1, 55.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (9, 9, 9, 1, 0.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (10, 10, 10, 1, 1800.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (11, 11, 11, 1, 1703.03, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (12, 12, 12, 1, 450.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (13, 13, 13, 1, 1675.80, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (14, 14, 14, 1, 400.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (15, 15, 15, 1, 1500.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (16, 16, 16, 1, 2050.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (17, 17, 17, 1, 475.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (18, 18, 18, 1, 1775.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (19, 19, 19, 1, 0.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (20, 20, 20, 1, 1850.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (21, 21, 21, 1, 450.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (22, 22, 22, 1, 600.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (23, 23, 23, 1, 0.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (24, 24, 24, 1, 55.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (25, 24, 25, 1, 55.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (26, 24, 26, 1, 55.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (27, 24, 27, 1, 55.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (28, 28, 28, 1, 2200.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (29, 29, 29, 1, 500.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (30, 30, 30, 1, 1850.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (31, 31, 31, 1, 1577.77, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (32, 32, 32, 1, 1460.42, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (33, 33, 33, 1, 400.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (34, 34, 34, 1, 400.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (35, 35, 35, 1, 1700.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (36, 36, 36, 1, 425.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (37, 37, 37, 1, 1575.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (38, 38, 38, 1, 550.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (39, 39, 39, 1, 2200.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (40, 40, 40, 1, 925.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (41, 41, 41, 1, 3850.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (42, 42, 42, 1, 2000.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (43, 43, 43, 1, 500.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (44, 44, 44, 1, 1925.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (45, 45, 45, 1, 475.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (46, 46, 46, 1, 425.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (47, 47, 47, 1, 1750.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (48, 48, 48, 1, 1850.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (49, 49, 49, 1, 450.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (50, 50, 50, 1, 3660.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (51, 51, 51, 1, 875.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (52, 52, 52, 1, 2000.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (53, 53, 53, 1, 550.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (54, 54, 54, 1, 2125.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (55, 55, 55, 1, 500.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (56, 56, 56, 1, 2100.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (57, 57, 57, 1, 475.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (58, 58, 58, 1, 1650.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (59, 59, 59, 1, 425.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (60, 60, 60, 1, 1800.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (61, 61, 61, 1, 440.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (62, 62, 62, 1, 2147.46, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (63, 63, 63, 1, 550.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (64, 64, 64, 1, 3050.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (65, 65, 65, 1, 720.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (66, 66, 66, 1, 3000.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (67, 67, 67, 1, 725.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (68, 68, 68, 1, 400.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (69, 69, 69, 1, 1750.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (70, 70, 70, 1, 1825.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (71, 71, 71, 1, 400.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (72, 72, 72, 1, 3300.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (73, 73, 73, 1, 900.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (74, 74, 74, 1, 350.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (75, 75, 75, 1, 1450.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (76, 76, 76, 1, 1450.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (77, 77, 77, 1, 350.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (78, 78, 78, 1, 365.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (79, 79, 79, 1, 1450.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (80, 80, 80, 1, 1400.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (81, 81, 81, 1, 375.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (82, 82, 82, 1, 400.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (83, 83, 83, 1, 1767.12, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (84, 84, 84, 1, 451.82, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (85, 85, 85, 1, 2200.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (86, 86, 86, 1, 575.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (87, 87, 87, 1, 400.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (88, 88, 88, 1, 1675.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (89, 89, 89, 1, 2700.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (90, 90, 90, 1, 600.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (91, 91, 91, 1, 3000.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (92, 92, 92, 1, 725.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (93, 93, 93, 1, 1951.47, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (94, 94, 94, 1, 1800.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (95, 95, 95, 1, 445.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (96, 96, 96, 1, 1775.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (97, 97, 97, 1, 475.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (98, 98, 98, 1, 425.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (99, 99, 99, 1, 1675.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (100, 100, 100, 1, 1850.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (101, 101, 101, 1, 525.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (102, 102, 102, 1, 2026.15, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (103, 103, 103, 1, 2200.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (104, 104, 104, 1, 1969.98, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (105, 105, 105, 1, 2450.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (106, 106, 106, 1, 575.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (107, 107, 107, 1, 500.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (108, 108, 108, 1, 1850.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (109, 109, 109, 1, 2500.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (110, 110, 110, 1, 650.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (111, 111, 111, 1, 1900.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (112, 112, 112, 1, 460.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (113, 113, 113, 1, 2033.24, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (114, 114, 114, 1, 2125.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (115, 115, 115, 1, 500.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (116, 116, 116, 1, 2000.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (117, 117, 117, 1, 450.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (118, 118, 118, 1, 2200.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (119, 119, 119, 1, 525.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (120, 120, 120, 1, 2120.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (121, 121, 121, 1, 500.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (122, 122, 122, 1, 2450.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (123, 123, 123, 1, 550.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (124, 124, 124, 1, 0.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (125, 125, 125, 1, 500.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (126, 126, 126, 1, 500.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (127, 127, 127, 1, 2275.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (128, 128, 128, 1, 1850.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (129, 129, 129, 1, 3900.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (130, 130, 130, 1, 920.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (131, 131, 131, 1, 2050.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (132, 132, 132, 1, 450.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (133, 133, 133, 1, 1725.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (134, 134, 134, 1, 450.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (135, 135, 135, 1, 1725.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (136, 136, 136, 1, 420.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (137, 137, 137, 1, 1850.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (138, 138, 138, 1, 475.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (139, 139, 139, 1, 1850.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (140, 140, 140, 1, 2300.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (141, 141, 141, 1, 550.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (142, 142, 142, 1, 1700.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (143, 143, 143, 1, 475.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (144, 144, 144, 1, 0.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (145, 145, 145, 1, 470.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (146, 146, 146, 1, 350.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (147, 147, 147, 1, 0.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (148, 148, 148, 1, 0.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (149, 149, 149, 1, 0.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (150, 150, 150, 1, 1700.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (151, 151, 151, 1, 495.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (152, 152, 152, 1, 1900.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (153, 153, 153, 1, 1725.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (154, 154, 154, 1, 2050.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (155, 155, 155, 1, 470.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (156, 156, 156, 1, 1872.33, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (157, 157, 157, 1, 1903.44, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (158, 158, 158, 1, 1550.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (159, 159, 159, 1, 370.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (160, 160, 160, 1, 1500.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (161, 161, 161, 1, 350.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (162, 162, 162, 1, 1500.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (163, 163, 163, 1, 360.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (164, 164, 164, 1, 1450.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (165, 165, 165, 1, 375.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (166, 166, 166, 1, 1400.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (167, 167, 167, 1, 350.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (168, 168, 168, 1, 1500.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (169, 169, 169, 1, 375.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (170, 170, 170, 1, 335.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (171, 171, 171, 1, 1425.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (172, 172, 172, 1, 475.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (173, 173, 173, 1, 1800.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (174, 174, 174, 1, 450.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (175, 175, 175, 1, 0.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (176, 176, 176, 1, 1750.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (177, 177, 177, 1, 1275.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (178, 178, 178, 1, 2000.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (179, 179, 179, 1, 525.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (180, 178, 180, 1, 2000.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (181, 181, 181, 1, 2037.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (182, 181, 182, 1, 2037.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (183, 183, 183, 1, 485.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (184, 184, 184, 1, 1600.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (185, 185, 185, 1, 350.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (186, 186, 186, 1, 1830.21, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (187, 187, 187, 1, 2225.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (188, 188, 188, 1, 535.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (189, 189, 189, 1, 1900.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (190, 190, 190, 1, 1972.47, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (191, 191, 191, 1, 500.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (192, 192, 192, 1, 2100.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (193, 193, 193, 1, 1750.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (194, 194, 194, 1, 3100.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (195, 195, 195, 1, 750.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (196, 196, 196, 1, 2300.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (197, 197, 197, 1, 560.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (198, 198, 198, 1, 3700.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (199, 199, 199, 1, 900.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (200, 200, 200, 1, 2050.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (201, 201, 201, 1, 470.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (202, 202, 202, 1, 1853.70, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (203, 203, 203, 1, 2300.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (204, 204, 204, 1, 460.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (205, 205, 205, 1, 2100.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (206, 206, 206, 1, 550.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (207, 207, 207, 1, 1750.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (208, 208, 208, 1, 400.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (209, 209, 209, 1, 1950.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (210, 210, 210, 1, 475.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (211, 211, 211, 1, 500.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (212, 212, 212, 1, 2200.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (213, 212, 213, 1, 2200.00, '2021-09-17 01:20:00', NULL, 1);
INSERT INTO `client_service_scheduling` VALUES (218, 1, 214, NULL, 500.00, '2021-09-20 12:48:59', '2021-09-20 12:48:59', 1);
INSERT INTO `client_service_scheduling` VALUES (219, 3, 214, NULL, 300.00, '2021-09-20 12:48:59', '2021-09-20 20:09:56', 1);
INSERT INTO `client_service_scheduling` VALUES (220, 2, 215, NULL, 2000.00, '2021-09-25 20:56:12', '2021-09-25 20:56:12', 1);
INSERT INTO `client_service_scheduling` VALUES (221, 1, 216, NULL, 1000.00, '2021-09-25 21:01:35', '2021-09-25 21:01:35', 1);
INSERT INTO `client_service_scheduling` VALUES (222, 1, 217, NULL, 1000.00, '2021-09-25 21:07:31', '2021-09-25 21:07:31', 1);

-- ----------------------------
-- Table structure for client_services
-- ----------------------------
DROP TABLE IF EXISTS `client_services`;
CREATE TABLE `client_services`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_client` bigint UNSIGNED NOT NULL,
  `id_service` bigint UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `client_services_id_client_foreign`(`id_client`) USING BTREE,
  INDEX `client_services_id_service_foreign`(`id_service`) USING BTREE,
  CONSTRAINT `client_services_id_client_foreign` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `client_services_id_service_foreign` FOREIGN KEY (`id_service`) REFERENCES `services` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 214 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of client_services
-- ----------------------------
INSERT INTO `client_services` VALUES (1, 1, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (2, 1, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (3, 1, 3, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (4, 2, 4, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (5, 2, 5, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (6, 2, 5, '2021-09-13 22:19:01', '2021-09-25 17:21:16', 0);
INSERT INTO `client_services` VALUES (7, 2, 5, '2021-09-13 22:19:01', '2021-09-25 17:21:18', 0);
INSERT INTO `client_services` VALUES (8, 2, 5, '2021-09-13 22:19:01', '2021-09-25 17:21:20', 0);
INSERT INTO `client_services` VALUES (9, 3, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (10, 3, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (11, 4, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (12, 4, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (13, 5, 3, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (14, 6, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (15, 6, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (16, 7, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (17, 7, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (18, 8, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (19, 9, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (20, 9, 3, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (21, 9, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (22, 10, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (23, 10, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (24, 10, 5, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (25, 10, 5, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (26, 10, 5, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (27, 10, 5, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (28, 10, 3, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (29, 11, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (30, 11, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (31, 12, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (32, 13, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (33, 13, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (34, 14, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (35, 14, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (36, 15, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (37, 15, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (38, 16, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (39, 16, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (40, 17, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (41, 17, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (42, 18, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (43, 18, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (44, 19, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (45, 19, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (46, 20, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (47, 20, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (48, 21, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (49, 21, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (50, 22, 6, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (51, 22, 7, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (52, 23, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (53, 23, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (54, 24, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (55, 24, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (56, 25, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (57, 25, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (58, 26, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (59, 26, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (60, 27, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (61, 27, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (62, 28, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (63, 28, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (64, 29, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (65, 29, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (66, 30, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (67, 30, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (68, 31, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (69, 31, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (70, 32, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (71, 32, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (72, 33, 6, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (73, 33, 7, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (74, 34, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (75, 34, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (76, 35, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (77, 35, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (78, 36, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (79, 36, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (80, 37, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (81, 37, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (82, 38, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (83, 39, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (84, 39, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (85, 40, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (86, 40, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (87, 41, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (88, 41, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (89, 42, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (90, 42, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (91, 43, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (92, 43, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (93, 44, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (94, 45, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (95, 45, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (96, 46, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (97, 46, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (98, 47, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (99, 47, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (100, 48, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (101, 48, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (102, 49, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (103, 50, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (104, 51, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (105, 52, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (106, 52, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (107, 53, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (108, 53, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (109, 54, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (110, 54, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (111, 55, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (112, 55, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (113, 56, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (114, 57, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (115, 57, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (116, 58, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (117, 58, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (118, 59, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (119, 59, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (120, 60, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (121, 60, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (122, 61, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (123, 61, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (124, 62, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (125, 62, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (126, 63, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (127, 63, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (128, 64, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (129, 65, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (130, 65, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (131, 66, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (132, 66, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (133, 67, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (134, 67, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (135, 68, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (136, 68, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (137, 69, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (138, 70, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (139, 70, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (140, 71, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (141, 71, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (142, 72, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (143, 72, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (144, 73, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (145, 73, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (146, 74, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (147, 74, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (148, 75, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (149, 75, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (150, 76, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (151, 76, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (152, 77, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (153, 78, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (154, 79, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (155, 79, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (156, 80, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (157, 81, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (158, 82, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (159, 82, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (160, 83, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (161, 83, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (162, 84, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (163, 84, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (164, 85, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (165, 85, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (166, 86, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (167, 86, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (168, 87, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (169, 87, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (170, 88, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (171, 88, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (172, 89, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (173, 89, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (174, 90, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (175, 90, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (176, 90, 3, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (177, 90, 8, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (178, 91, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (179, 91, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (180, 91, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (181, 92, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (182, 92, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (183, 92, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (184, 93, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (185, 93, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (186, 94, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (187, 95, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (188, 95, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (189, 96, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (190, 97, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (191, 98, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (192, 98, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (193, 99, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (194, 100, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (195, 100, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (196, 101, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (197, 101, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (198, 102, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (199, 102, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (200, 103, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (201, 103, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (202, 104, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (203, 105, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (204, 105, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (205, 106, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (206, 106, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (207, 107, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (208, 107, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (209, 108, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (210, 108, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (211, 109, 1, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (212, 109, 2, '2021-09-13 22:19:01', NULL, 1);
INSERT INTO `client_services` VALUES (213, 109, 2, '2021-09-13 22:19:01', NULL, 1);

-- ----------------------------
-- Table structure for clients
-- ----------------------------
DROP TABLE IF EXISTS `clients`;
CREATE TABLE `clients`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `register` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code_access` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `code_web` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 110 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clients
-- ----------------------------
INSERT INTO `clients` VALUES (1, 'HomeGoods136', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (2, 'HomeGoods174', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (3, 'HomeGoods189', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (4, 'HomeGoods379', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (5, 'HomeGoods388', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (6, 'HomeGoods429', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (7, 'HomeGoods475', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (8, 'HomeGoods504', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (9, 'HomeGoods556', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (10, 'HomeGoods594', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (11, 'HomeGoods664', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (12, 'HomeGoods685', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (13, 'HomeGoods720', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (14, 'HomeGoods737', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (15, 'HomeGoods743', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (16, 'Marshalls1003', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (17, 'Marshalls1018', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (18, 'Marshalls1019', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (19, 'Marshalls1020', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (20, 'Marshalls1043', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (21, 'Marshalls1059', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (22, 'Marshalls1077', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (23, 'Marshalls108', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (24, 'Marshalls1132', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (25, 'Marshalls1135', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (26, 'Marshalls1181', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (27, 'Marshalls1198', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (28, 'Marshalls124', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (29, 'Marshalls1278', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (30, 'Marshalls1293', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (31, 'Marshalls1315', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (32, 'Marshalls1328', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (33, 'Marshalls1332', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (34, 'Marshalls1364', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (35, 'Marshalls1396', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (36, 'Marshalls1428', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (37, 'Marshalls1471', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (38, 'Marshalls1490', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (39, 'Marshalls1495', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (40, 'Marshalls153', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (41, 'Marshalls168', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (42, 'Marshalls176', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (43, 'Marshalls194', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (44, 'Marshalls196', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (45, 'Marshalls228', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (46, 'Marshalls232', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (47, 'Marshalls264', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (48, 'Marshalls329', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (49, 'Marshalls350', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (50, 'Marshalls392', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (51, 'Marshalls398', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (52, 'Marshalls408', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (53, 'Marshalls419', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (54, 'Marshalls420', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (55, 'Marshalls511', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (56, 'Marshalls653', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (57, 'Marshalls67', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (58, 'Marshalls678', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (59, 'Marshalls796', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (60, 'Marshalls805', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (61, 'Marshalls813', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (62, 'TJ Maxx1025', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (63, 'TJ Maxx1039', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (64, 'TJ Maxx1066', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (65, 'TJ Maxx1100', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (66, 'TJ Maxx1105', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (67, 'TJ Maxx1123', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (68, 'TJ Maxx1132', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (69, 'TJ Maxx1137', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (70, 'TJ Maxx1167', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (71, 'TJ Maxx1168', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (72, 'TJ Maxx1194', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (73, 'TJ Maxx1270', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (74, 'TJ Maxx1297', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (75, 'TJ Maxx1305', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (76, 'TJ Maxx1331', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (77, 'TJ Maxx1340', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (78, 'TJ Maxx1364', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (79, 'TJ Maxx1373', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (80, 'TJ Maxx138', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (81, 'TJ Maxx1387', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (82, 'TJ Maxx1408', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (83, 'TJ Maxx1410', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (84, 'TJ Maxx1499', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (85, 'TJ Maxx1506', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (86, 'TJ Maxx1522', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (87, 'TJ Maxx1530', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (88, 'TJ Maxx1535', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (89, 'TJ Maxx155', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (90, 'TJ Maxx197', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (91, 'TJ Maxx199', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (92, 'TJ Maxx20', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (93, 'TJ Maxx26', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (94, 'TJ Maxx269', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (95, 'TJ Maxx272', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (96, 'TJ Maxx283', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (97, 'TJ Maxx291', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (98, 'TJ Maxx33', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (99, 'TJ Maxx392', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (100, 'TJ Maxx417', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (101, 'TJ Maxx598', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (102, 'TJ Maxx603', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (103, 'TJ Maxx647', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (104, 'TJ Maxx70', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (105, 'TJ Maxx711', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (106, 'TJ Maxx755', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (107, 'TJ Maxx791', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (108, 'TJ Maxx802', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);
INSERT INTO `clients` VALUES (109, 'TJ Maxx84', '', NULL, NULL, '2021-09-13 21:58:31', NULL, 1);

-- ----------------------------
-- Table structure for companies
-- ----------------------------
DROP TABLE IF EXISTS `companies`;
CREATE TABLE `companies`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_companies`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of companies
-- ----------------------------
INSERT INTO `companies` VALUES (1, 'Allima Cleaning Service LLC', NULL, '2021-09-28 00:45:47', NULL, 1);
INSERT INTO `companies` VALUES (2, 'Casas Majori', NULL, '2021-09-28 01:17:02', NULL, 1);

-- ----------------------------
-- Table structure for companies_clients
-- ----------------------------
DROP TABLE IF EXISTS `companies_clients`;
CREATE TABLE `companies_clients`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `id_company` bigint UNSIGNED NOT NULL,
  `id_client` bigint UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `companies_clients_id_company_foreign`(`id_company`) USING BTREE,
  INDEX `companies_clients_id_client_foreign`(`id_client`) USING BTREE,
  CONSTRAINT `companies_clients_id_company_foreign` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `companies_clients_id_client_foreign` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of companies_clients
-- ----------------------------
INSERT INTO `companies_clients` VALUES (1, 1, 1, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (2, 1, 2, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (3, 1, 3, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (4, 1, 4, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (5, 1, 5, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (6, 1, 6, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (7, 1, 7, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (8, 1, 8, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (9, 1, 9, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (10, 1, 10, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (11, 1, 11, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (12, 1, 12, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (13, 1, 13, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (14, 1, 14, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (15, 1, 15, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (16, 1, 16, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (17, 1, 17, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (18, 1, 18, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (19, 1, 19, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (20, 1, 20, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (21, 1, 21, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (22, 1, 22, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (23, 1, 23, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (24, 1, 24, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (25, 1, 25, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (26, 1, 26, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (27, 1, 27, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (28, 1, 28, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (29, 1, 29, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (30, 1, 30, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (31, 1, 31, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (32, 1, 32, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (33, 1, 33, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (34, 1, 34, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (35, 1, 35, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (36, 1, 36, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (37, 1, 37, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (38, 1, 38, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (39, 1, 39, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (40, 1, 40, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (41, 1, 41, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (42, 1, 42, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (43, 1, 43, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (44, 1, 44, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (45, 1, 45, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (46, 1, 46, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (47, 1, 47, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (48, 1, 48, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (49, 1, 49, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (50, 1, 50, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (51, 1, 51, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (52, 1, 52, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (53, 1, 53, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (54, 1, 54, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (55, 1, 55, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (56, 1, 56, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (57, 1, 57, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (58, 1, 58, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (59, 1, 59, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (60, 1, 60, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (61, 1, 61, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (62, 1, 62, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (63, 1, 63, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (64, 1, 64, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (65, 1, 65, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (66, 1, 66, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (67, 1, 67, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (68, 1, 68, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (69, 1, 69, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (70, 1, 70, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (71, 1, 71, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (72, 1, 72, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (73, 1, 73, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (74, 1, 74, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (75, 1, 75, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (76, 1, 76, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (77, 1, 77, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (78, 1, 78, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (79, 1, 79, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (80, 1, 80, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (81, 1, 81, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (82, 1, 82, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (83, 1, 83, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (84, 1, 84, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (85, 1, 85, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (86, 1, 86, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (87, 1, 87, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (88, 1, 88, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (89, 1, 89, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (90, 1, 90, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (91, 1, 91, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (92, 1, 92, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (93, 1, 93, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (94, 1, 94, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (95, 1, 95, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (96, 1, 96, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (97, 1, 97, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (98, 1, 98, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (99, 1, 99, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (100, 1, 100, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (101, 1, 101, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (102, 1, 102, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (103, 1, 103, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (104, 1, 104, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (105, 1, 105, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (106, 1, 106, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (107, 1, 107, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (108, 1, 108, '2021-09-28 00:47:30', NULL, 1);
INSERT INTO `companies_clients` VALUES (109, 1, 109, '2021-09-28 00:47:30', NULL, 1);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT current_timestamp(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (2, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (3, '2021_08_03_200117_create_sys_permissions_table', 1);
INSERT INTO `migrations` VALUES (4, '2021_08_03_200227_create_sys_groups_table', 1);
INSERT INTO `migrations` VALUES (5, '2021_08_03_200228_create_sys_role_permissions_table', 1);
INSERT INTO `migrations` VALUES (6, '2021_08_03_200229_create_sys_languages_table', 1);
INSERT INTO `migrations` VALUES (7, '2021_08_03_200230_create_users_table', 1);
INSERT INTO `migrations` VALUES (8, '2021_08_03_200231_create_user_numbers_table', 1);
INSERT INTO `migrations` VALUES (9, '2021_08_03_222618_create_user_addresses_table', 1);
INSERT INTO `migrations` VALUES (10, '2021_08_04_023208_create_services_table', 1);
INSERT INTO `migrations` VALUES (11, '2021_08_04_023247_create_clients_table', 1);
INSERT INTO `migrations` VALUES (12, '2021_08_04_023305_create_client_services_table', 1);
INSERT INTO `migrations` VALUES (13, '2021_08_04_023325_create_user_client_table', 1);
INSERT INTO `migrations` VALUES (14, '2021_08_04_024509_create_client_emails_table', 1);
INSERT INTO `migrations` VALUES (15, '2021_08_04_024519_create_client_numbers_table', 1);
INSERT INTO `migrations` VALUES (16, '2021_08_04_024557_create_client_scheduling_table', 1);
INSERT INTO `migrations` VALUES (17, '2021_08_04_024652_create_client_service_scheduling_table', 1);
INSERT INTO `migrations` VALUES (18, '2021_08_04_035619_create_sys_log_updates_table', 1);
INSERT INTO `migrations` VALUES (19, '2021_08_04_035701_create_sys_status_table', 1);
INSERT INTO `migrations` VALUES (20, '2021_08_04_220143_create_sessions_table', 1);
INSERT INTO `migrations` VALUES (21, '2021_08_10_152814_create_sys_pages_table', 1);
INSERT INTO `migrations` VALUES (22, '2021_08_10_152854_create_sys_dicionary_pages_table', 1);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `base_price` decimal(10, 2) NOT NULL COMMENT 'Preço default para o client service',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of services
-- ----------------------------
INSERT INTO `services` VALUES (1, 'Scrub and Recoat', 0.00, '2021-09-13 22:17:29', NULL, 1);
INSERT INTO `services` VALUES (2, 'Strip and Wax', 0.00, '2021-09-13 22:17:29', NULL, 1);
INSERT INTO `services` VALUES (3, 'Remodel Strip', 0.00, '2021-09-13 22:17:29', NULL, 1);
INSERT INTO `services` VALUES (4, 'Overnight - Scrub', 0.00, '2021-09-13 22:17:29', NULL, 1);
INSERT INTO `services` VALUES (5, 'Restroom Cleaning', 0.00, '2021-09-13 22:17:29', NULL, 1);
INSERT INTO `services` VALUES (6, 'Matte - Strip', 0.00, '2021-09-13 22:17:29', NULL, 1);
INSERT INTO `services` VALUES (7, 'Matte - Scrub', 0.00, '2021-09-13 22:17:29', NULL, 1);
INSERT INTO `services` VALUES (8, 'Remodel Scrub/Spot Strip', 0.00, '2021-09-13 22:17:29', NULL, 1);

-- ----------------------------
-- Table structure for sessions
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED NULL DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sessions_user_id_index`(`user_id`) USING BTREE,
  INDEX `sessions_last_activity_index`(`last_activity`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sessions
-- ----------------------------
INSERT INTO `sessions` VALUES ('x5tGfXoaLuOqBczU2kIeFdSRFP9NvAbPi1XFTZ7t', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiOVg4a0N0bk1QdnJDVTd0OWFPb3lrODVSd002SVZwa1JFRU5vNm1MbSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czozNjoiaHR0cDovL2xvY2FsaG9zdDo4MDAwL2RhZG9zQ2xpZW50ZS8xIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1632800728);

-- ----------------------------
-- Table structure for sys_dicionary_pages
-- ----------------------------
DROP TABLE IF EXISTS `sys_dicionary_pages`;
CREATE TABLE `sys_dicionary_pages`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_language` bigint UNSIGNED NOT NULL,
  `id_page` bigint UNSIGNED NOT NULL,
  `variable` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_dicionary_pages_id_language_foreign`(`id_language`) USING BTREE,
  INDEX `sys_dicionary_pages_id_page_foreign`(`id_page`) USING BTREE,
  CONSTRAINT `sys_dicionary_pages_id_language_foreign` FOREIGN KEY (`id_language`) REFERENCES `sys_languages` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sys_dicionary_pages_id_page_foreign` FOREIGN KEY (`id_page`) REFERENCES `sys_pages` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dicionary_pages
-- ----------------------------
INSERT INTO `sys_dicionary_pages` VALUES (1, 2, 1, 'home', 'Inicio', '2021-08-10 13:47:31', NULL, 1);
INSERT INTO `sys_dicionary_pages` VALUES (2, 1, 4, 'dataTables_language', 'js/language/dataTables.English.json', '2021-09-20 12:59:06', NULL, 1);
INSERT INTO `sys_dicionary_pages` VALUES (4, 2, 4, 'dataTables_language', 'js/language/dataTables.Portuguese-Brasil.json', '2021-09-20 12:59:06', NULL, 1);
INSERT INTO `sys_dicionary_pages` VALUES (5, 3, 4, 'dataTables_language', 'js/language/dataTables.Spanish.json', '2021-09-20 12:59:06', NULL, 1);

-- ----------------------------
-- Table structure for sys_groups
-- ----------------------------
DROP TABLE IF EXISTS `sys_groups`;
CREATE TABLE `sys_groups`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_groups
-- ----------------------------
INSERT INTO `sys_groups` VALUES (1, 'Admin Master', 'cadastrar usuarios, clientes projetos e ver todas as opções no sistema', '2021-08-10 15:45:29', NULL, 1);
INSERT INTO `sys_groups` VALUES (2, 'Admin', 'controla somente as companias que estão cadastradas para ela', '2021-08-10 15:45:29', NULL, 1);
INSERT INTO `sys_groups` VALUES (3, 'employee', 'apenas ve o agendamento', '2021-09-28 00:48:33', NULL, 1);

-- ----------------------------
-- Table structure for sys_languages
-- ----------------------------
DROP TABLE IF EXISTS `sys_languages`;
CREATE TABLE `sys_languages`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `cod` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_languages
-- ----------------------------
INSERT INTO `sys_languages` VALUES (1, 'us', 'United States', 'images/flags/us.jpg', '2021-08-10 15:45:29', '2021-08-10 15:45:29', 1);
INSERT INTO `sys_languages` VALUES (2, 'br', 'Brasil', 'images/flags/br.jpg', '2021-08-10 15:45:29', '2021-08-10 15:45:29', 1);
INSERT INTO `sys_languages` VALUES (3, 'es', 'España', 'images/flags/es.jpg', '2021-08-10 15:45:29', '2021-08-10 15:45:29', 1);

-- ----------------------------
-- Table structure for sys_log_updates
-- ----------------------------
DROP TABLE IF EXISTS `sys_log_updates`;
CREATE TABLE `sys_log_updates`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` bigint UNSIGNED NOT NULL,
  `id_tabela` bigint UNSIGNED NOT NULL,
  `table_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `action` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `obs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_log_updates_id_user_foreign`(`id_user`) USING BTREE,
  INDEX `sys_log_updates_id_tabela_index`(`id_tabela`) USING BTREE,
  CONSTRAINT `sys_log_updates_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 59 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log_updates
-- ----------------------------
INSERT INTO `sys_log_updates` VALUES (1, 1, 216, 'client_service_scheduling', 'id', '216', '', 'INSERT', '', '2021-09-17 22:57:33', '2021-09-17 22:57:33', 1);
INSERT INTO `sys_log_updates` VALUES (2, 1, 216, 'client_service_scheduling', 'status', '0', '1', 'UPDATE', 'Excluido na area de Alteração no Agendamento - dadosClient', '2021-09-17 22:58:59', '2021-09-17 22:58:59', 1);
INSERT INTO `sys_log_updates` VALUES (3, 1, 217, 'client_service_scheduling', 'id', '217', '', 'INSERT', '', '2021-09-17 23:01:14', '2021-09-17 23:01:14', 1);
INSERT INTO `sys_log_updates` VALUES (4, 1, 217, 'client_service_scheduling', 'price', '12123.23', '0.00', 'UPDATE', 'Atualização de preço do serviço no agendamento', '2021-09-17 23:04:35', '2021-09-17 23:04:35', 1);
INSERT INTO `sys_log_updates` VALUES (5, 1, 217, 'client_service_scheduling', 'price', '1231.23', '0.00', 'UPDATE', 'Atualização de preço do serviço no agendamento', '2021-09-17 23:06:22', '2021-09-17 23:06:22', 1);
INSERT INTO `sys_log_updates` VALUES (6, 1, 217, 'client_service_scheduling', 'status', '0', '1', 'UPDATE', 'Excluido na area de Alteração no Agendamento - dadosClient', '2021-09-17 23:07:46', '2021-09-17 23:07:46', 1);
INSERT INTO `sys_log_updates` VALUES (7, 1, 217, 'client_service_scheduling', 'price', '4444.44', '1231.00', 'UPDATE', 'Atualização de preço do serviço no agendamento', '2021-09-17 23:08:40', '2021-09-17 23:08:40', 1);
INSERT INTO `sys_log_updates` VALUES (8, 1, 217, 'client_service_scheduling', 'price', '1000.00', '4444.44', 'UPDATE', 'Atualização de preço do serviço no agendamento', '2021-09-17 23:09:02', '2021-09-17 23:09:02', 1);
INSERT INTO `sys_log_updates` VALUES (9, 1, 217, 'client_service_scheduling', 'price', '20', '1000.00', 'UPDATE', 'Atualização de preço do serviço no agendamento', '2021-09-17 23:09:14', '2021-09-17 23:09:14', 1);
INSERT INTO `sys_log_updates` VALUES (10, 1, 1, 'client_scheduling', 'name_employer', 'teste', '', 'UPDATE', '', '2021-09-20 01:45:02', '2021-09-20 01:45:02', 1);
INSERT INTO `sys_log_updates` VALUES (11, 1, 1, 'client_scheduling', 'name_employer', '', 'teste', 'UPDATE', '', '2021-09-20 01:45:23', '2021-09-20 01:45:23', 1);
INSERT INTO `sys_log_updates` VALUES (12, 1, 2, 'client_service_scheduling', 'price', '10.00', '0.00', 'UPDATE', 'Atualização de preço do serviço no agendamento', '2021-09-20 02:15:36', '2021-09-20 02:15:36', 1);
INSERT INTO `sys_log_updates` VALUES (13, 1, 2, 'client_scheduling', 'name_employer', 'remodel Aug 16-Sep 10 teste', 'remodel Aug 16-Sep 10', 'UPDATE', '', '2021-09-20 02:16:12', '2021-09-20 02:16:12', 1);
INSERT INTO `sys_log_updates` VALUES (14, 1, 2, 'client_service_scheduling', 'price', '0', '10.00', 'UPDATE', 'Atualização de preço do serviço no agendamento', '2021-09-20 02:19:03', '2021-09-20 02:19:03', 1);
INSERT INTO `sys_log_updates` VALUES (15, 1, 2, 'client_scheduling', 'name_employer', 'remodel Aug 16-Sep 10', 'remodel Aug 16-Sep 10 teste', 'UPDATE', '', '2021-09-20 02:19:16', '2021-09-20 02:19:16', 1);
INSERT INTO `sys_log_updates` VALUES (16, 1, 2, 'client_scheduling', 'name_employer', 'remodel Aug 16-Sep 10 teste', 'remodel Aug 16-Sep 10', 'UPDATE', '', '2021-09-20 02:21:40', '2021-09-20 02:21:40', 1);
INSERT INTO `sys_log_updates` VALUES (17, 1, 214, 'clients_scheduling', 'id', '214', '', 'INSERT', '', '2021-09-20 12:48:59', '2021-09-20 12:48:59', 1);
INSERT INTO `sys_log_updates` VALUES (18, 1, 218, 'clients_services_scheduling', 'id', '218', '', 'INSERT', '', '2021-09-20 12:48:59', '2021-09-20 12:48:59', 1);
INSERT INTO `sys_log_updates` VALUES (19, 1, 219, 'clients_services_scheduling', 'id', '219', '', 'INSERT', '', '2021-09-20 12:48:59', '2021-09-20 12:48:59', 1);
INSERT INTO `sys_log_updates` VALUES (20, 1, 214, 'client_scheduling', 'name_employer', 'teste', '', 'UPDATE', '', '2021-09-20 20:07:26', '2021-09-20 20:07:26', 1);
INSERT INTO `sys_log_updates` VALUES (21, 1, 219, 'client_service_scheduling', 'price', '400.00', '100.00', 'UPDATE', 'Atualização de preço do serviço no agendamento', '2021-09-20 20:07:49', '2021-09-20 20:07:49', 1);
INSERT INTO `sys_log_updates` VALUES (22, 1, 219, 'client_service_scheduling', 'price', '300.00', '400.00', 'UPDATE', 'Atualização de preço do serviço no agendamento', '2021-09-20 20:09:56', '2021-09-20 20:09:56', 1);
INSERT INTO `sys_log_updates` VALUES (23, 1, 214, 'client_scheduling', 'name_employer', 'TESTE', 'Luiza bastidas', 'UPDATE', '', '2021-09-20 20:11:37', '2021-09-20 20:11:37', 1);
INSERT INTO `sys_log_updates` VALUES (24, 1, 214, 'client_scheduling', 'status_scheduling', '6', '2', 'UPDATE', 'Conclui Agendamento', '2021-09-23 20:45:45', '2021-09-23 20:45:45', 1);
INSERT INTO `sys_log_updates` VALUES (25, 1, 214, 'client_scheduling', 'end_date', '', '2021-09-23 20:45:45', 'UPDATE', 'Data que concluiu Agendamento', '2021-09-23 20:45:45', '2021-09-23 20:45:45', 1);
INSERT INTO `sys_log_updates` VALUES (26, 1, 214, 'client_scheduling', 'status_scheduling', '6', '1', 'UPDATE', 'Conclui Agendamento', '2021-09-24 22:41:21', '2021-09-24 22:41:21', 1);
INSERT INTO `sys_log_updates` VALUES (27, 1, 214, 'client_scheduling', 'end_date', '', '2021-09-24 22:41:21', 'UPDATE', 'Data que concluiu Agendamento', '2021-09-24 22:41:21', '2021-09-24 22:41:21', 1);
INSERT INTO `sys_log_updates` VALUES (34, 1, 214, 'client_scheduling', 'status_scheduling', '6', '1', 'UPDATE', 'Conclui Agendamento', '2021-09-25 05:48:25', '2021-09-25 05:48:25', 1);
INSERT INTO `sys_log_updates` VALUES (35, 1, 214, 'client_scheduling', 'end_date', '', '2021-09-25 05:48:25', 'UPDATE', 'Data que concluiu Agendamento', '2021-09-25 05:48:25', '2021-09-25 05:48:25', 1);
INSERT INTO `sys_log_updates` VALUES (36, 1, 1, 'client_scheduling_invoices', 'id', '1', '', 'INSERT', 'Criação de Invoice automatico', '2021-09-25 05:48:25', '2021-09-25 05:48:25', 1);
INSERT INTO `sys_log_updates` VALUES (37, 1, 3, 'client_scheduling', 'status_scheduling', '6', '2', 'UPDATE', 'Conclui Agendamento', '2021-09-25 05:50:08', '2021-09-25 05:50:08', 1);
INSERT INTO `sys_log_updates` VALUES (38, 1, 3, 'client_scheduling', 'end_date', '', '2021-09-25 05:50:08', 'UPDATE', 'Data que concluiu Agendamento', '2021-09-25 05:50:08', '2021-09-25 05:50:08', 1);
INSERT INTO `sys_log_updates` VALUES (39, 1, 2, 'client_scheduling_invoices', 'id', '2', '', 'INSERT', 'Criação de Invoice automatico', '2021-09-25 05:50:08', '2021-09-25 05:50:08', 1);
INSERT INTO `sys_log_updates` VALUES (40, 1, 3, 'client_scheduling', 'status_scheduling', '6', '2', 'UPDATE', 'Conclui Agendamento', '2021-09-25 05:52:47', '2021-09-25 05:52:47', 1);
INSERT INTO `sys_log_updates` VALUES (41, 1, 3, 'client_scheduling', 'end_date', '', '2021-09-25 05:52:47', 'UPDATE', 'Data que concluiu Agendamento', '2021-09-25 05:52:47', '2021-09-25 05:52:47', 1);
INSERT INTO `sys_log_updates` VALUES (42, 1, 3, 'client_scheduling_invoices', 'id', '3', '', 'INSERT', 'Criação de Invoice automatico', '2021-09-25 05:52:47', '2021-09-25 05:52:47', 1);
INSERT INTO `sys_log_updates` VALUES (43, 1, 214, 'client_scheduling', 'status_scheduling', '6', '1', 'UPDATE', 'Conclui Agendamento', '2021-09-25 05:55:49', '2021-09-25 05:55:49', 1);
INSERT INTO `sys_log_updates` VALUES (44, 1, 214, 'client_scheduling', 'end_date', '', '2021-09-25 05:55:49', 'UPDATE', 'Data que concluiu Agendamento', '2021-09-25 05:55:49', '2021-09-25 05:55:49', 1);
INSERT INTO `sys_log_updates` VALUES (45, 1, 4, 'client_scheduling_invoices', 'id', '4', '', 'INSERT', 'Criação de Invoice automatico', '2021-09-25 05:55:49', '2021-09-25 05:55:49', 1);
INSERT INTO `sys_log_updates` VALUES (50, 1, 214, 'client_scheduling', 'status_scheduling', '6', '1', 'UPDATE', 'Conclui Agendamento', '2021-09-25 06:12:21', '2021-09-25 06:12:21', 1);
INSERT INTO `sys_log_updates` VALUES (51, 1, 214, 'client_scheduling', 'end_date', '', '2021-09-25 06:12:21', 'UPDATE', 'Data que concluiu Agendamento', '2021-09-25 06:12:21', '2021-09-25 06:12:21', 1);
INSERT INTO `sys_log_updates` VALUES (52, 1, 1, 'client_scheduling_invoices', 'id', '1', '', 'INSERT', 'Criação de Invoice automatico', '2021-09-25 06:12:21', '2021-09-25 06:12:21', 1);
INSERT INTO `sys_log_updates` VALUES (53, 1, 215, 'clients_scheduling', 'id', '215', '', 'INSERT', '', '2021-09-25 20:56:12', '2021-09-25 20:56:12', 1);
INSERT INTO `sys_log_updates` VALUES (54, 1, 220, 'clients_services_scheduling', 'id', '220', '', 'INSERT', '', '2021-09-25 20:56:12', '2021-09-25 20:56:12', 1);
INSERT INTO `sys_log_updates` VALUES (55, 1, 216, 'clients_scheduling', 'id', '216', '', 'INSERT', '', '2021-09-25 21:01:35', '2021-09-25 21:01:35', 1);
INSERT INTO `sys_log_updates` VALUES (56, 1, 221, 'clients_services_scheduling', 'id', '221', '', 'INSERT', '', '2021-09-25 21:01:35', '2021-09-25 21:01:35', 1);
INSERT INTO `sys_log_updates` VALUES (57, 1, 217, 'clients_scheduling', 'id', '217', '', 'INSERT', '', '2021-09-25 21:07:31', '2021-09-25 21:07:31', 1);
INSERT INTO `sys_log_updates` VALUES (58, 1, 222, 'clients_services_scheduling', 'id', '222', '', 'INSERT', '', '2021-09-25 21:07:31', '2021-09-25 21:07:31', 1);

-- ----------------------------
-- Table structure for sys_pages
-- ----------------------------
DROP TABLE IF EXISTS `sys_pages`;
CREATE TABLE `sys_pages`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int NOT NULL DEFAULT 1,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_pages
-- ----------------------------
INSERT INTO `sys_pages` VALUES (1, 'menu', 1, '2021-08-10 13:45:06', NULL);
INSERT INTO `sys_pages` VALUES (2, 'show.cadastro.cliente', 1, '2021-08-10 13:45:06', NULL);
INSERT INTO `sys_pages` VALUES (3, 'show.Home', 1, '2021-08-10 13:45:06', NULL);
INSERT INTO `sys_pages` VALUES (4, 'language.dataTables', 1, '2021-09-20 12:58:35', NULL);

-- ----------------------------
-- Table structure for sys_permissions
-- ----------------------------
DROP TABLE IF EXISTS `sys_permissions`;
CREATE TABLE `sys_permissions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for sys_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_permissions`;
CREATE TABLE `sys_role_permissions`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_group` bigint UNSIGNED NOT NULL,
  `id_permission` bigint UNSIGNED NOT NULL,
  `table` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `sys_role_permissions_id_group_foreign`(`id_group`) USING BTREE,
  INDEX `sys_role_permissions_id_permission_foreign`(`id_permission`) USING BTREE,
  CONSTRAINT `sys_role_permissions_id_group_foreign` FOREIGN KEY (`id_group`) REFERENCES `sys_groups` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `sys_role_permissions_id_permission_foreign` FOREIGN KEY (`id_permission`) REFERENCES `sys_permissions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for sys_status
-- ----------------------------
DROP TABLE IF EXISTS `sys_status`;
CREATE TABLE `sys_status`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tabela` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `field` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cod_status` int NOT NULL,
  `obs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_status
-- ----------------------------
INSERT INTO `sys_status` VALUES (1, 'client_scheduling', 'status_scheduling.old', 'Excluido', 0, NULL, '2021-09-15 13:51:54', NULL);
INSERT INTO `sys_status` VALUES (2, 'client_scheduling', 'status_scheduling', 'Scheduled', 1, NULL, '2021-09-15 13:51:54', NULL);
INSERT INTO `sys_status` VALUES (3, 'client_scheduling', 'status_scheduling', 'Budgeted', 2, NULL, '2021-09-15 13:51:54', NULL);
INSERT INTO `sys_status` VALUES (4, 'client_scheduling', 'status_scheduling', 'Non Billable', 3, NULL, '2021-09-15 13:51:54', NULL);
INSERT INTO `sys_status` VALUES (5, 'client_scheduling', 'status_scheduling', 'To Reschedule', 4, NULL, '2021-09-15 13:51:54', NULL);
INSERT INTO `sys_status` VALUES (6, 'client_scheduling', 'status_scheduling', 'Partial / Unacceptable', 5, NULL, '2021-09-15 13:51:54', NULL);
INSERT INTO `sys_status` VALUES (7, 'client_scheduling', 'status_scheduling', 'Completed', 6, 'Quando o Agendamento foi concluido e faturado', '2021-09-15 13:51:54', NULL);
INSERT INTO `sys_status` VALUES (8, 'client_scheduling', 'status_scheduling', 'Post Confirmed', 7, NULL, '2021-09-15 13:51:54', NULL);
INSERT INTO `sys_status` VALUES (9, 'client_scheduling', 'status', 'Ativo', 1, NULL, '2021-09-15 13:51:54', NULL);
INSERT INTO `sys_status` VALUES (10, 'client_scheduling', 'status', 'Excluido', 0, NULL, '2021-09-15 13:51:54', NULL);
INSERT INTO `sys_status` VALUES (11, 'client_scheduling', 'status', 'Finalizado', 2, 'Contato Finalizado com outros estatos em ser Completed, por exemplo Partial / Unacceptable ou Non Billable', '2021-09-17 10:34:47', NULL);

-- ----------------------------
-- Table structure for user_addresses
-- ----------------------------
DROP TABLE IF EXISTS `user_addresses`;
CREATE TABLE `user_addresses`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` bigint UNSIGNED NOT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_addresses_id_user_foreign`(`id_user`) USING BTREE,
  CONSTRAINT `user_addresses_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_addresses
-- ----------------------------

-- ----------------------------
-- Table structure for user_client
-- ----------------------------
DROP TABLE IF EXISTS `user_client`;
CREATE TABLE `user_client`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` bigint UNSIGNED NOT NULL,
  `id_client` bigint UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_client_id_user_foreign`(`id_user`) USING BTREE,
  INDEX `user_client_id_client_foreign`(`id_client`) USING BTREE,
  CONSTRAINT `user_client_id_client_foreign` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_client_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_client
-- ----------------------------

-- ----------------------------
-- Table structure for user_companies
-- ----------------------------
DROP TABLE IF EXISTS `user_companies`;
CREATE TABLE `user_companies`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` bigint UNSIGNED NOT NULL,
  `id_company` bigint UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_companies_id_user_foreign`(`id_user`) USING BTREE,
  INDEX `user_companies_id_company_foreign`(`id_company`) USING BTREE,
  CONSTRAINT `user_companies_id_company_foreign` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_companies_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_companies
-- ----------------------------
INSERT INTO `user_companies` VALUES (1, 1, 1, '2021-09-28 01:16:41', NULL, 1);
INSERT INTO `user_companies` VALUES (2, 1, 2, '2021-09-28 01:17:19', NULL, 1);
INSERT INTO `user_companies` VALUES (3, 1, 2, '2021-09-28 01:17:19', NULL, 0);

-- ----------------------------
-- Table structure for user_numbers
-- ----------------------------
DROP TABLE IF EXISTS `user_numbers`;
CREATE TABLE `user_numbers`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` bigint UNSIGNED NOT NULL,
  `primary_number` int NOT NULL DEFAULT 0,
  `number` int NOT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `country_phone_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_numbers_id_user_foreign`(`id_user`) USING BTREE,
  CONSTRAINT `user_numbers_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_numbers
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_group` bigint UNSIGNED NOT NULL,
  `id_language` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_company` bigint NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  INDEX `users_id_group_foreign`(`id_group`) USING BTREE,
  INDEX `users_id_language_foreign`(`id_language`) USING BTREE,
  CONSTRAINT `users_id_group_foreign` FOREIGN KEY (`id_group`) REFERENCES `sys_groups` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `users_id_language_foreign` FOREIGN KEY (`id_language`) REFERENCES `sys_languages` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 1, 2, 'Pedro Ivo Santos Silva', 'pedroivosst@gmail.com', NULL, '$2y$10$zsmQ2xIga9WttyYqpavb/ezUqjsQ1RcigJPerIvjnqeMtEnSl7Tky', '', NULL, 0, '2021-08-04 18:54:08', NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
