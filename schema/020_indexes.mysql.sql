-- Auto-generated from schema-map-mysql.psd1 (map@734a489)
-- engine: mysql
-- table:  key_wrappers
CREATE UNIQUE INDEX ux_kw_k1_k2_version ON key_wrappers (kms1_key_id, kms2_key_id, wrap_version);

CREATE INDEX idx_kw_status_created ON key_wrappers (status, created_at);
