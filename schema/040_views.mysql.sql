-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
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
  UPPER(HEX(dek_wrap1)) AS dek_wrap1_hex,
  UPPER(HEX(dek_wrap2)) AS dek_wrap2_hex
FROM key_wrappers;

-- Auto-generated from schema-views-feature-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  key_wrappers_layers
-- Key wrappers with layer counts and PQC flag
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_key_wrappers_layers AS
SELECT
  kw.id,
  kw.wrapper_uuid,
  kw.status,
  COUNT(kwl.id)                           AS layer_count,
  MIN(kwl.layer_no)                       AS first_layer_no,
  MAX(kwl.layer_no)                       AS last_layer_no,
  MAX(CASE WHEN ca.nist_level IS NOT NULL THEN 1 ELSE 0 END) AS has_pq_layer
FROM key_wrappers kw
LEFT JOIN key_wrapper_layers kwl ON kwl.key_wrapper_id = kw.id
LEFT JOIN crypto_algorithms ca   ON ca.id = kwl.kem_algo_id
GROUP BY kw.id, kw.wrapper_uuid, kw.status
ORDER BY kw.id DESC;

