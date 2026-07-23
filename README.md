# AWS Data Engineering Portfolio — Finance Track

Building a portfolio of AWS data engineering projects on finance/markets data, as a stepping-stone toward Quant Developer roles.

## About

I'm Ronald, a Data Analyst (2+ years) at Publicis Groupe, working in Python, SQL, BigQuery, GCP and Dataform. This repo is a structured, 25-week build toward a Data Engineer role in fintech/capital markets — a more winnable first move than Software Engineer given my SQL/GCP background —

## Why AWS

My paid GCP/BigQuery/Dataform experience stays on my CV as evidence of multi-cloud strength — it isn't rebuilt here. This portfolio is deliberately AWS because AWS has the widest data-engineer job volume in London fintech, and capital markets/hedge funds are increasingly AWS-based too (Amazon FinSpace, Snowflake-on-AWS). Snowflake is the one warehouse learned alongside Athena, since it's used across banks, hedge funds and fintech regardless of hyperscaler.

## Projects

| # | Project | Stack | Status |
|---|---------|-------|--------|
| 1 | **Equity Markets Analytics** — stock data → S3 → Athena (via a Python OOP `AthenaClient`) → QuickSight → written insight | Python, S3, Athena, QuickSight | In progress |
| 2 | **Market Data ELT Pipeline** — markets API → S3 → Glue/Athena → dbt (star schema) → QuickSight, provisioned with Terraform | Glue, dbt, Terraform | Planned |
| 3 | **Trading-Data Platform (capstone)** — adds Kafka streaming (simulated ticks), Airflow orchestration with retry logic, least-privilege IAM, CI/CD via GitHub Actions, data-quality tests with alerting | Kafka, Airflow, IAM, GitHub Actions | Planned |

Each project lives in its own directory with its own README, code, and a written summary of findings.

## Tooling notes

Built on free tiers and local tools wherever possible — dbt Core, Airflow and Kafka run via Docker Compose locally rather than paid managed services — with an AWS Budgets alert set from day one to avoid surprise billing.

## Roadmap

Following a 25-week structured plan: Phase 0 (environment setup), Phase 1 (engineering foundations — SQL, Python OOP, maths, Project 1), Phase 2 (DE core — modelling, dbt, Terraform, Docker, Project 2), Phase 3 (orchestration, security, production — Airflow, IAM, Kafka, CI/CD, Capstone), Phase 4 (job hunt).

## Contact

[LinkedIn] · [rwyiadom@gmail.com]
