-- Auto-generated from schema-map-mysql.psd1 (map@mtime:2025-11-27T15:13:14Z)
-- engine: mysql
-- table:  key_wrappers

ALTER TABLE key_wrappers ADD CONSTRAINT fk_kw_kms1 FOREIGN KEY (kms1_key_id) REFERENCES kms_keys(id) ON DELETE RESTRICT;

ALTER TABLE key_wrappers ADD CONSTRAINT fk_kw_kms2 FOREIGN KEY (kms2_key_id) REFERENCES kms_keys(id) ON DELETE RESTRICT;
