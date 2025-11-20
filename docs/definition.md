<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – key_wrappers

Composite wrappers protecting DEKs with multiple KMS/crypto layers.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| wrapper_uuid | CHAR(36) | NO | — | Stable UUID identifier. |  |
| kms1_key_id | BIGINT | NO | — | Primary wrapping KMS key. |  |
| kms2_key_id | BIGINT | NO | — | Secondary wrapping KMS key. |  |
| dek_wrap1 | BYTEA | NO | — | First wrapped DEK blob. |  |
| dek_wrap2 | BYTEA | NO | — | Second wrapped DEK blob. |  |
| crypto_suite | JSONB | YES | — | JSON description of the crypto suite used. |  |
| wrap_version | INTEGER | NO | 1 | Version number for the wrapper format. |  |
| status | TEXT | NO | 'active' | Lifecycle flag. | enum: active, rotated, retired, invalid |
| created_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Creation timestamp (UTC). |  |
| rotated_at | TIMESTAMPTZ(6) | YES | — | When the wrapper was rotated, if ever. |  |