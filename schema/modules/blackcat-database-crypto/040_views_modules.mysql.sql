-- Auto-generated from feature-modules-mysql.yaml (map@sha1:F2224DD310A34E10A80882FE9641E685E98B51E8)
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
