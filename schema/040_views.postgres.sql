-- Auto-generated from schema-views-postgres.psd1 (map@62c9c93)
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
  (status = ''active'')  AS is_active,
  (status = ''rotated'') AS is_rotated,
  created_at,
  rotated_at,
  dek_wrap1,
  dek_wrap2,
  UPPER(encode(dek_wrap1,''hex'')) AS dek_wrap1_hex,
  UPPER(encode(dek_wrap2,''hex'')) AS dek_wrap2_hex
FROM key_wrappers;

-- Auto-generated from schema-views-feature-postgres.psd1 (map@62c9c93)
-- engine: postgres
-- table:  key_wrappers_layers
-- Key wrappers with layer counts and PQC flag
CREATE OR REPLACE VIEW vw_key_wrappers_layers AS
SELECT
  kw.id,
  kw.wrapper_uuid,
  kw.status,
  COUNT(kwl.id)                           AS layer_count,
  MIN(kwl.layer_no)                       AS first_layer_no,
  MAX(kwl.layer_no)                       AS last_layer_no,
  BOOL_OR(ca.nist_level IS NOT NULL)      AS has_pq_layer
FROM key_wrappers kw
LEFT JOIN key_wrapper_layers kwl ON kwl.key_wrapper_id = kw.id
LEFT JOIN crypto_algorithms ca   ON ca.id = kwl.kem_algo_id
GROUP BY kw.id, kw.wrapper_uuid, kw.status
ORDER BY kw.id DESC;

