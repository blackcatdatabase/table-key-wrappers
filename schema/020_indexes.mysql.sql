-- Auto-generated from schema-map-mysql.psd1 (map@mtime:2025-11-27T15:13:14Z)
-- engine: mysql
-- table:  key_wrappers

CREATE UNIQUE INDEX ux_kw_k1_k2_version ON key_wrappers (kms1_key_id, kms2_key_id, wrap_version);

CREATE INDEX idx_kw_status_created ON key_wrappers (status, created_at);
