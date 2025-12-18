-- Auto-generated from schema-map-postgres.yaml (map@sha1:8C4F2BC1C4D22EE71E27B5A7968C71E32D8D884D)
-- engine: postgres
-- table:  key_wrappers

ALTER TABLE key_wrappers ADD CONSTRAINT fk_kw_kms1 FOREIGN KEY (kms1_key_id) REFERENCES kms_keys(id) ON DELETE RESTRICT;

ALTER TABLE key_wrappers ADD CONSTRAINT fk_kw_kms2 FOREIGN KEY (kms2_key_id) REFERENCES kms_keys(id) ON DELETE RESTRICT;
