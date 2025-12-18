-- Auto-generated from schema-map-postgres.yaml (map@sha1:621FDD3D99B768B6A8AD92061FB029414184F4B3)
-- engine: postgres
-- table:  key_wrappers

CREATE UNIQUE INDEX IF NOT EXISTS ux_kw_k1_k2_version ON key_wrappers (kms1_key_id, kms2_key_id, wrap_version);

CREATE INDEX IF NOT EXISTS idx_kw_status_created ON key_wrappers (status, created_at);
