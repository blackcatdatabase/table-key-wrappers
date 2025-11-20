-- Auto-generated from schema-map-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  key_wrappers
CREATE UNIQUE INDEX IF NOT EXISTS ux_kw_k1_k2_version ON key_wrappers (kms1_key_id, kms2_key_id, wrap_version);

CREATE INDEX IF NOT EXISTS idx_kw_status_created ON key_wrappers (status, created_at);
