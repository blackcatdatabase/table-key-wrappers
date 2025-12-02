-- Auto-generated from feature-modules-mysql.yaml (map@94ebe6c)
-- engine: mysql
-- table:  key_wrapper_layers_summary

-- Key wrappers with layer counts and PQC flag
CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_key_wrapper_layers_summary AS
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

-- Auto-generated from feature-modules-mysql.yaml (map@94ebe6c)
-- engine: mysql
-- table:  key_wrappers_missing_pq

-- Wrappers without any PQ layer
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_key_wrappers_missing_pq AS
SELECT
  kw.id,
  kw.wrapper_uuid,
  kw.status,
  kw.created_at
FROM key_wrappers kw
WHERE NOT EXISTS (
  SELECT 1
  FROM key_wrapper_layers kwl
  JOIN crypto_algorithms ca ON ca.id = kwl.kem_algo_id
  WHERE kwl.key_wrapper_id = kw.id AND ca.nist_level IS NOT NULL
);

