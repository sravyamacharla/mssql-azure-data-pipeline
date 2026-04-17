# MSSQL to Azure Cloud Data Pipeline

End-to-end Azure data pipeline migrating on-premise SQL Server
sales data to Azure cloud using medallion architecture.

## Architecture
MSSQL → ADF (watermark) → ADLS Bronze → Databricks PySpark
→ ADLS Silver (Delta) → Databricks → ADLS Gold (Delta) → MSSQL

## Tech Stack
- Source: SQL Server (MSSQL) — 10,000 sales orders
- Ingestion: Azure Data Factory with watermark pattern
- Storage: ADLS Gen2 (bronze/silver/gold containers)
- Transform: Azure Databricks, PySpark, Delta Lake
- Write-back: JDBC to Azure SQL reporting table

## What I Built
- Incremental ADF pipeline using watermark control table
- SHIR for on-premise SQL Server connectivity
- PySpark data quality checks (dedup, null filter, validation)
- Delta Lake with year/month partitioning
- Gold aggregations: monthly revenue by region, top products
- JDBC write-back to close the loop
