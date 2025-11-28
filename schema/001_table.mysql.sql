-- Auto-generated from schema-map-mysql.psd1 (map@mtime:2025-11-27T15:13:14Z)
-- engine: mysql
-- table:  key_wrappers

CREATE TABLE IF NOT EXISTS key_wrappers (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  wrapper_uuid CHAR(36) NOT NULL,
  kms1_key_id BIGINT UNSIGNED NOT NULL,
  kms2_key_id BIGINT UNSIGNED NOT NULL,
  dek_wrap1 LONGBLOB NOT NULL,
  dek_wrap2 LONGBLOB NOT NULL,
  crypto_suite JSON NULL,
  wrap_version INT NOT NULL DEFAULT 1,
  status ENUM('active','rotated','retired','invalid') NOT NULL DEFAULT 'active',
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  rotated_at DATETIME(6) NULL,
  UNIQUE KEY uq_key_wrappers_uuid (wrapper_uuid)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
