insurance-fraud-data-pipeline
# Insurance Fraud Data Pipeline

## Objective
Build a full end-to-end data pipeline for analyzing insurance fraud using a 21M row synthetic dataset.

## Architecture
Dataset -> Kestra -> GCS -> BigQuery -> dbt -> Dashboard

## Tools
- Docker
- Terraform
- Kestra
- GCP (GCS + BigQuery)
- dbt Core
- Dashboard (Looker Studio / Streamlit)

## Steps
1. Run Terraform to create GCP infra.
2. Launch Docker (Kestra + dbt) locally.
3. Execute Kestra workflow to:
   - Download dataset
   - Upload to GCS
   - Load into BigQuery
4. Run dbt transformations.
5. Build a dashboard with 2 tiles:
   - Fraud by transaction type
   - Fraud over time
  
