# AWS Data Engineering Portfolio — Finance Track

Production-shaped data engineering on AWS, built from finance and markets data.

## About

I'm Ronald, a Data Analyst with 2+ years' experience working in Python, SQL, BigQuery, GCP and Dataform. This repo is the index for a structured 26-week build toward **Analytics Engineer** and **Data Engineer** roles in fintech, banking and capital markets — a more winnable first move than Software Engineer given my SQL and cloud background. Quant Developer is the later step, reached from inside a markets-data engineering role rather than applied to cold.

Every week produces a committed artefact. Small components accumulate into three major projects, so nothing here is throwaway practice — the utility module written in Week 1 is imported by the capstone in Week 25.

## Why AWS

My paid GCP/BigQuery/Dataform experience stays on my CV as evidence of multi-cloud strength; it isn't rebuilt here. This portfolio is deliberately AWS because AWS has the widest data engineering job volume in London fintech, and capital markets and hedge funds are increasingly AWS-based (Amazon FinSpace, Snowflake-on-AWS). Snowflake is the one warehouse learned alongside Athena, since it appears across banks, hedge funds and fintech regardless of hyperscaler.

## Projects

| # | Project | Stack | Status |
|---|---------|-------|--------|
| 1 | [**Equity Markets Analytics**](https://github.com/<user>/equity-markets-analytics) — public equities → S3 → Athena (via a Python `AthenaClient` class) → pandas → QuickSight → a written insight | Python, boto3, S3, Athena, Glue, QuickSight | In progress |
| 2 | [**Market Data ELT Pipeline**](https://github.com/<user>/market-data-elt) — markets API → S3 → Glue/Athena → dbt star schema → QuickSight, fully provisioned with Terraform | dbt, Glue, Terraform, Docker, pytest | Planned |
| 3 | [**Trading-Data Platform**](https://github.com/<user>/trading-data-platform) — capstone. Adds a Kafka streaming path (simulated ticks), Airflow 3 orchestration with backfills and dynamic task mapping, least-privilege IAM, data-quality checks with alerting, and CI/CD | Kafka, Airflow 3, IAM, Great Expectations, GitHub Actions | Planned |

Each project is a standalone repository with its own README, architecture diagram and written findings. **21 mini-projects** across the 26 weeks feed into them — a SQL query library, a packaged ingestion module, a Terraform stack, a dbt project, a production-shaped DAG.

## Engineering standards

Applied across every repo from Week 1:

- **Idempotent loads.** Re-running a pipeline must not duplicate data; deterministic S3 key naming is how that is achieved, and it is proven by running twice.
- **Infrastructure as code.** Terraform, not console clicks. The stack is destroyed and rebuilt on demand.
- **Tested transforms.** dbt tests on uniqueness, nullability and business rules; Great Expectations for the checks dbt cannot express.
- **No secrets, ever.** Environment variables locally, AWS Secrets Manager in the cloud, and git history checked as well as the working tree.
- **Least privilege.** One IAM role per service, and every policy tested to confirm it fails when it should.
- **CI on every pull request.** pytest, `dbt build`, ruff and sqlfluff, with merges gated on green checks.

## Cost control

Built on free tiers and local tooling wherever possible — dbt Core, Airflow 3 and Kafka run under Docker Compose locally rather than as paid managed services — with an AWS Budgets alert set from day one and billable resources torn down when idle. Athena cost work is measured rather than assumed: Project 2 documents bytes scanned before and after converting to partitioned Parquet.

## Roadmap

A 26-week plan in five phases:

| Phase | Weeks | Focus |
|---|---|---|
| 1 | 1–5 | Core skills — Python, SQL, pandas, advanced SQL, OOP |
| 2 | 6–10 | AWS foundations — S3, Athena, Glue, statistics, BI — and **Project 1** |
| 3 | 11–19 | DE core — modelling, dbt, cost tuning, Terraform, Docker, production Python — and **Project 2** |
| 4 | 20–24 | Production systems — Airflow in depth, IAM, data quality, CI/CD, Kafka |
| 5 | 25–26 | **Capstone** and interview preparation |

Environment setup (AWS account, budget alerts, first S3 bucket, tooling) was completed before Week 1. Applications begin in Week 10, in parallel with Phases 3–5, rather than at the end.

## Progress

Full interactive tracker: [`docs/aws-de-tracker.html`](docs/aws-de-tracker.html).

**Phase 1 — Core Skills (Weeks 1–5)**
- [x] Week 1 — Python Fundamentals
- [x] Week 2 — SQL Fundamentals
- [x] Week 3 — Pandas Fundamentals
- [ ] Week 4 — Advanced SQL: Window Functions, CTEs, Optimisation
- [ ] Week 5 — Python OOP for Data Engineers

**Phase 2 — AWS Foundations & First Project (Weeks 6–10)**
- [ ] Week 6 — S3 & Athena: Building the Lake
- [ ] Week 7 — Statistics & Maths for a Quant-Track Engineer
- [ ] Week 8 — Visualisation Principles & BI (QuickSight)
- [ ] Week 9 — Major Project 1: Equity Markets Analytics
- [ ] Week 10 — Project 1 Polish + Start Applying

**Phase 3 — Data Engineering Core (Weeks 11–19)**
- [ ] Week 11 — Data Modelling & Normalisation
- [ ] Week 12 — Dimensional Modelling (Kimball) + Snowflake Awareness
- [ ] Week 13 — ETL vs ELT & Pipeline Architecture
- [ ] Week 14 — dbt on Athena
- [ ] Week 15 — Athena & S3 Performance and Cost
- [ ] Week 16 — Infrastructure as Code (Terraform)
- [ ] Week 17 — Docker & Containerisation
- [ ] Week 18 — Production Python for Data Engineering
- [ ] Week 19 — Major Project 2: Market Data ELT Pipeline

**Phase 4 — Production Systems (Weeks 20–24)**
- [ ] Week 20 — Orchestration I: Airflow Foundations
- [ ] Week 21 — Orchestration II: Airflow in Production
- [ ] Week 22 — Security & IAM for Data Platforms
- [ ] Week 23 — Data Quality, Testing & CI/CD
- [ ] Week 24 — Streaming with Kafka

**Phase 5 — Capstone & Job Hunt (Weeks 25–26)**
- [ ] Week 25 — Major Project 3: Trading-Data Platform (Build)
- [ ] Week 26 — Capstone Polish, CV & Interview Prep

## Contact

[LinkedIn](https://linkedin.com/in/<user>) · rwyiadom@gmail.com
