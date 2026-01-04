# Terraform Backend Bootstrap

This directory bootstraps Terraform remote backend infrastructure.

## Why local state is used here

Terraform requires backend infrastructure before it can use a remote backend.
This folder is intentionally executed once using local state to create:

- S3 state bucket
- DynamoDB lock table

## Rules

- Run once only
- Never used for application or network resources
- No environment logic
- No reuse

## After creation

All other Terraform must use the remote backend.
Local state usage outside this folder is forbidden.
