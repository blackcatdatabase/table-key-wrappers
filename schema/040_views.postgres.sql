-- Auto-generated from schema-views-postgres.yaml (map@4ae85c5)
-- engine: postgres
-- table:  key_wrappers

-- Contract view for [key_wrappers]
-- Hides DEK wraps; exposes hex helpers and status flags.
CREATE OR REPLACE VIEW vw_key_wrappers AS
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
  UPPER(encode(digest(dek_wrap1,'sha256'),'hex'))::char(64) AS dek_wrap1_hex,
  UPPER(encode(digest(dek_wrap2,'sha256'),'hex'))::char(64) AS dek_wrap2_hex
FROM key_wrappers;
