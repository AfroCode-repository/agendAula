/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 100419
 Source Host           : localhost:3306
 Source Schema         : agendaula

 Target Server Type    : MySQL
 Target Server Version : 100419
 File Encoding         : 65001

 Date: 08/10/2021 06:25:23
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for agendamentos
-- ----------------------------
DROP TABLE IF EXISTS `agendamentos`;
CREATE TABLE `agendamentos`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `schedule_date` datetime(0) NOT NULL,
  `obs` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status_scheduling` int NOT NULL DEFAULT 1,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of agendamentos
-- ----------------------------
INSERT INTO `agendamentos` VALUES (1, '2021-10-05 10:00:00', '', '2021-10-06 13:45:28', NULL, 1, 1);
INSERT INTO `agendamentos` VALUES (2, '2021-10-07 10:00:00', '', '2021-10-06 13:45:28', NULL, 1, 1);
INSERT INTO `agendamentos` VALUES (3, '2021-10-12 10:00:00', '', '2021-10-06 13:45:28', NULL, 1, 1);
INSERT INTO `agendamentos` VALUES (4, '2021-10-14 10:00:00', '', '2021-10-06 13:45:28', NULL, 1, 1);
INSERT INTO `agendamentos` VALUES (5, '2021-10-19 10:00:00', '', '2021-10-06 13:45:28', NULL, 1, 1);
INSERT INTO `agendamentos` VALUES (6, '2021-10-21 10:00:00', '', '2021-10-06 13:45:28', NULL, 1, 1);
INSERT INTO `agendamentos` VALUES (7, '2021-10-26 10:00:00', '', '2021-10-06 13:45:28', NULL, 1, 1);
INSERT INTO `agendamentos` VALUES (8, '2021-10-28 10:00:00', '', '2021-10-06 13:45:28', NULL, 1, 1);
INSERT INTO `agendamentos` VALUES (9, '2021-10-04 09:30:00', '', '2021-10-06 14:03:31', NULL, 1, 1);
INSERT INTO `agendamentos` VALUES (10, '2021-10-08 09:30:00', '', '2021-10-06 14:03:31', NULL, 1, 1);
INSERT INTO `agendamentos` VALUES (11, '2021-10-11 09:30:00', '', '2021-10-06 14:03:31', NULL, 1, 1);
INSERT INTO `agendamentos` VALUES (12, '2021-10-15 09:30:00', '', '2021-10-06 14:03:31', NULL, 1, 1);
INSERT INTO `agendamentos` VALUES (13, '2021-10-18 09:30:00', '', '2021-10-06 14:03:31', NULL, 1, 1);
INSERT INTO `agendamentos` VALUES (14, '2021-10-22 09:30:00', '', '2021-10-06 14:03:31', NULL, 1, 1);
INSERT INTO `agendamentos` VALUES (15, '2021-10-25 09:30:00', '', '2021-10-06 14:03:31', NULL, 1, 1);
INSERT INTO `agendamentos` VALUES (16, '2021-10-29 09:30:00', '', '2021-10-06 14:03:31', NULL, 1, 1);

-- ----------------------------
-- Table structure for aluno_agendamentos
-- ----------------------------
DROP TABLE IF EXISTS `aluno_agendamentos`;
CREATE TABLE `aluno_agendamentos`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` bigint UNSIGNED NOT NULL,
  `id_aluno` bigint UNSIGNED NOT NULL,
  `id_agendamento` bigint UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `aluno_agendamentos_id_user_foreign`(`id_user`) USING BTREE,
  INDEX `aluno_agendamentos_id_aluno_foreign`(`id_aluno`) USING BTREE,
  INDEX `aluno_agendamentos_id_agendamento_foreign`(`id_agendamento`) USING BTREE,
  CONSTRAINT `aluno_agendamentos_id_agendamento_foreign` FOREIGN KEY (`id_agendamento`) REFERENCES `agendamentos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `aluno_agendamentos_id_aluno_foreign` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `aluno_agendamentos_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aluno_agendamentos
-- ----------------------------
INSERT INTO `aluno_agendamentos` VALUES (1, 2, 1, 1, '2021-10-06 13:46:09', NULL, 1);
INSERT INTO `aluno_agendamentos` VALUES (2, 2, 1, 2, '2021-10-06 13:46:09', NULL, 1);
INSERT INTO `aluno_agendamentos` VALUES (3, 2, 1, 3, '2021-10-06 13:46:09', NULL, 1);
INSERT INTO `aluno_agendamentos` VALUES (4, 2, 1, 4, '2021-10-06 13:46:09', NULL, 1);
INSERT INTO `aluno_agendamentos` VALUES (5, 2, 1, 5, '2021-10-06 13:46:09', NULL, 1);
INSERT INTO `aluno_agendamentos` VALUES (6, 2, 1, 6, '2021-10-06 13:46:09', NULL, 1);
INSERT INTO `aluno_agendamentos` VALUES (7, 2, 1, 7, '2021-10-06 13:46:09', NULL, 1);
INSERT INTO `aluno_agendamentos` VALUES (8, 2, 1, 8, '2021-10-06 13:46:09', NULL, 1);
INSERT INTO `aluno_agendamentos` VALUES (9, 2, 3, 9, '2021-10-06 14:04:00', NULL, 1);
INSERT INTO `aluno_agendamentos` VALUES (10, 2, 3, 10, '2021-10-06 14:04:00', NULL, 1);
INSERT INTO `aluno_agendamentos` VALUES (11, 2, 3, 11, '2021-10-06 14:04:00', NULL, 1);
INSERT INTO `aluno_agendamentos` VALUES (12, 2, 3, 12, '2021-10-06 14:04:00', NULL, 1);
INSERT INTO `aluno_agendamentos` VALUES (13, 2, 3, 13, '2021-10-06 14:04:00', NULL, 1);
INSERT INTO `aluno_agendamentos` VALUES (14, 2, 3, 14, '2021-10-06 14:04:00', NULL, 1);
INSERT INTO `aluno_agendamentos` VALUES (15, 2, 3, 15, '2021-10-06 14:04:00', NULL, 1);
INSERT INTO `aluno_agendamentos` VALUES (16, 2, 3, 16, '2021-10-06 14:04:00', NULL, 1);

-- ----------------------------
-- Table structure for aluno_observacoes
-- ----------------------------
DROP TABLE IF EXISTS `aluno_observacoes`;
CREATE TABLE `aluno_observacoes`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_user` bigint UNSIGNED NOT NULL,
  `id_aluno` bigint UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `aluno_observacoes_id_user_foreign`(`id_user`) USING BTREE,
  INDEX `aluno_observacoes_id_aluno_foreign`(`id_aluno`) USING BTREE,
  CONSTRAINT `aluno_observacoes_id_aluno_foreign` FOREIGN KEY (`id_aluno`) REFERENCES `alunos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `aluno_observacoes_id_user_foreign` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of aluno_observacoes
-- ----------------------------

-- ----------------------------
-- Table structure for alunos
-- ----------------------------
DROP TABLE IF EXISTS `alunos`;
CREATE TABLE `alunos`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `endereco` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `numero` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `complemento` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `cidade` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `estado` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CEP` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone 1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone 2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone 3` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alunos
-- ----------------------------
INSERT INTO `alunos` VALUES (1, 'Gilson', '', '', '', '', '', '', '', '', '', NULL, NULL, 1);
INSERT INTO `alunos` VALUES (2, 'Yasmim', '', '', '', '', '', '', '', '', '', NULL, NULL, 1);
INSERT INTO `alunos` VALUES (3, 'Gabrielly', '', '', '', '', '', '', '', '', '', NULL, NULL, 1);
INSERT INTO `alunos` VALUES (4, 'Supera', '', '', '', '', '', '', '', '', '', NULL, NULL, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (4, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (5, '2021_10_05_155849_create_alunos_table', 1);
INSERT INTO `migrations` VALUES (6, '2021_10_05_160003_create_agendamentos_table', 1);
INSERT INTO `migrations` VALUES (7, '2021_10_05_160021_create_aluno_agendamentos_table', 1);
INSERT INTO `migrations` VALUES (8, '2021_10_05_161220_create_aluno_observacoes_table', 1);

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
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint UNSIGNED NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------

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
INSERT INTO `sessions` VALUES ('5e0Q12JKKWgpajYj1yyL3Ap5zG5mTk6z68D7yutA', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoieEZ2aXhCQTZsaUVYVHRJUGZHQ290VjhGaTQ5RVMzSWtBb0ExZHZ2MiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1633540270);
INSERT INTO `sessions` VALUES ('9hgrSHNYkx2K2dtNP2Qtoh7QBe35E2QWPhcXE9z3', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiRTJpbm9ZZWhLSU9uRFRlaEwwNk5uUHREOU9EN1ZZVkxOdk9hZ0tXbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1633570933);
INSERT INTO `sessions` VALUES ('CjAppRJia3BaF18pyRXaAuBdKrcX9E2op2n8Qqgg', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiRUdwcHNVVElSMnVjTmd0dFdJUUxCUVo2UTZPN21ydFJiT1ZJMExmTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzY6Imh0dHA6Ly9sb2NhbGhvc3QvY2FsZW5kYXJpb19rL3B1YmxpYyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1633320229);
INSERT INTO `sessions` VALUES ('DLW2CbSCDOIlrDQfZfkX88sEWusQKbNc5wk8go4j', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.71 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoibU5NWHdGWHYwTVYyaDVzT2pRNnVkdldjODA0YUFWN2JSM3BOWXVUOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1633531626);
INSERT INTO `sessions` VALUES ('ESxUrkmeDnwA8QfSsgAd0NDPh4HWpYoPzYxrUg1i', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3UxZkJBN21vdzJORmVkUm41MUgyN1VVdkVDc1lreW1yV2MxMjNqcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly9sb2NhbGhvc3QvYWdlbmRhdWxhL3B1YmxpYyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1633361264);
INSERT INTO `sessions` VALUES ('oDaZ521G0tK3pMN373cEkW9W62G1N61pN3LirfcR', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiQ2Y4c0hmeEpENEJoWm9tZkp3VmhqQXEyWXBnN0t5anVyaWZIcUlIMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9wZXJmaWwiO31zOjM6InVybCI7YToxOntzOjg6ImludGVuZGVkIjtzOjM2OiJodHRwOi8vbG9jYWxob3N0OjgwMDAvZGFkb3NDbGllbnRlLzEiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1633282856);
INSERT INTO `sessions` VALUES ('Tmvp0HPO5Sqhbc2HorzdxdR1l7nm5XW8ho92fq2K', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWVdGVU9oVXZNVUR0M2VnUVR0ajJGUTJreFpPSThGb1Q1bUFqUXhnRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9ob21lIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1633490869);
INSERT INTO `sessions` VALUES ('xBigwgcP06pfVc8CltVEFHoUyOdgaFPsObfL6NbL', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/94.0.4606.61 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVjRscmRycUtHMHBHWTlwQ0JHQ1BJUk9vN0tkcWlxVFJpTmZiVWZSUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDQ6Imh0dHA6Ly9sb2NhbGhvc3Qvc2VydmljZUNvbnRyb2wvcHVibGljL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1633353408);

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
  CONSTRAINT `sys_log_updates_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_log_updates
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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_status
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `status` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Pedro Ivo', 'pedroivosst@gmail.com', NULL, '$2y$10$Cxy1SUSsWIdIHNVuVaEEauwCNPIeyfFgCoYlPBBu2Vmo4lifnXVmi', NULL, '2021-10-05 13:10:22', NULL, 1);
INSERT INTO `users` VALUES (2, 'Katryanne Passos de Oliveira', 'katryannepassos@hotmail.com', NULL, '$2y$10$Cxy1SUSsWIdIHNVuVaEEauwCNPIeyfFgCoYlPBBu2Vmo4lifnXVmi', NULL, '2021-10-05 13:10:22', NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
