# key_wrappers

Composite wrappers protecting DEKs with multiple KMS/crypto layers.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| created_at | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |
| crypto_suite | JSON | YES |  | JSON description of the crypto suite used. |
| dek_wrap1 | LONGBLOB | NO |  | First wrapped DEK blob. |
| dek_wrap2 | LONGBLOB | NO |  | Second wrapped DEK blob. |
| id | BIGINT | NO |  | Surrogate primary key. |
| kms1_key_id | BIGINT | NO |  | Primary wrapping KMS key. |
| kms2_key_id | BIGINT | NO |  | Secondary wrapping KMS key. |
| rotated_at | DATETIME(6) | YES |  | When the wrapper was rotated, if ever. |
| status | ENUM('active','rotated','retired','invalid') | NO | active | Lifecycle flag. (enum: active, rotated, retired, invalid) |
| wrap_version | INT | NO | 1 | Version number for the wrapper format. |
| wrapper_uuid | CHAR(36) | NO |  | Stable UUID identifier. |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| uq_key_wrappers_uuid | wrapper_uuid |
| ux_kw_k1_k2_version | kms1_key_id, kms2_key_id, wrap_version |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_kw_status_created | status,created_at | CREATE INDEX idx_kw_status_created ON key_wrappers (status, created_at) |
| uq_key_wrappers_uuid | wrapper_uuid | UNIQUE KEY uq_key_wrappers_uuid (wrapper_uuid) |
| ux_kw_k1_k2_version | kms1_key_id,kms2_key_id,wrap_version | CREATE UNIQUE INDEX ux_kw_k1_k2_version ON key_wrappers (kms1_key_id, kms2_key_id, wrap_version) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_kw_kms1 | kms1_key_id | kms_keys(id) | ON DELETE RESTRICT |
| fk_kw_kms2 | kms2_key_id | kms_keys(id) | ON DELETE RESTRICT |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| uq_key_wrappers_uuid | wrapper_uuid |
| ux_kw_k1_k2_version | kms1_key_id, kms2_key_id, wrap_version |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_kw_status_created | status,created_at | CREATE INDEX IF NOT EXISTS idx_kw_status_created ON key_wrappers (status, created_at) |
| uq_key_wrappers_uuid | wrapper_uuid | CONSTRAINT uq_key_wrappers_uuid UNIQUE (wrapper_uuid) |
| ux_kw_k1_k2_version | kms1_key_id,kms2_key_id,wrap_version | CREATE UNIQUE INDEX IF NOT EXISTS ux_kw_k1_k2_version ON key_wrappers (kms1_key_id, kms2_key_id, wrap_version) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_kw_kms1 | kms1_key_id | kms_keys(id) | ON DELETE RESTRICT |
| fk_kw_kms2 | kms2_key_id | kms_keys(id) | ON DELETE RESTRICT |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_key_wrappers | mysql | algorithm=MERGE, security=INVOKER | [schema\040_views.mysql.sql](schema\040_views.mysql.sql) |
| vw_key_wrappers | postgres |  | [schema\040_views.postgres.sql](schema\040_views.postgres.sql) |
