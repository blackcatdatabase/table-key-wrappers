-- Auto-generated from schema-views-mysql.psd1 (map@mtime:2025-11-27T15:35:35Z)
-- engine: mysql
-- table:  key_wrappers

-- Contract view for [key_wrappers]
-- Hides DEK wraps; exposes hex helpers and status flags.
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_key_wrappers AS
SELECT
  id,
  wrapper_uuid,
  kms1_key_id,
  kms2_key_id,
  crypto_suite,
  wrap_version,
  status,
  (status = 'active')  AS is_active,
  (status = 'rotated') AS is_rotated,
  created_at,
  rotated_at,
  dek_wrap1,
  dek_wrap2,
  CAST(UPPER(SHA2(dek_wrap1, 256)) AS CHAR(64)) AS dek_wrap1_hex,
  CAST(UPPER(SHA2(dek_wrap2, 256)) AS CHAR(64)) AS dek_wrap2_hex
FROM key_wrappers;
