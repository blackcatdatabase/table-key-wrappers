-- Auto-generated from schema-map-postgres.yaml (map@sha1:6D9B52237D942B2B3855FD0F5500331B935A7C62)
-- engine: postgres
-- table:  key_wrappers

ALTER TABLE key_wrappers ADD CONSTRAINT fk_kw_kms1 FOREIGN KEY (kms1_key_id) REFERENCES kms_keys(id) ON DELETE RESTRICT;

ALTER TABLE key_wrappers ADD CONSTRAINT fk_kw_kms2 FOREIGN KEY (kms2_key_id) REFERENCES kms_keys(id) ON DELETE RESTRICT;
