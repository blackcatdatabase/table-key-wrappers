-- Auto-generated from feature-modules-postgres.yaml (map@sha1:A8D58997CBCD2EEE06670B1C02AD89FA65E66F67)
-- engine: postgres
-- table:  key_wrappers_missing_pq

-- Wrappers without any PQ layer
CREATE OR REPLACE VIEW vw_key_wrappers_missing_pq AS
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
