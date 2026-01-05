# Infrastructure Repository

## What This Repository Is For
This repository defines shared infrastructure used by applications.
It describes networks, compute boundaries, and base platform setup.
The purpose is to provide stable foundations for running services.

## What Type of Changes Are Allowed
Updates that improve stability or reliability.
Changes that support new application requirements.
Improvements that reduce cost or operational risk.
Documentation updates related to infrastructure behavior.

## What Changes Are NOT Allowed
Application business logic changes.
Release or delivery flow changes.
Temporary fixes that bypass safety controls.
Unreviewed changes that affect all environments.

## Who Owns This Repository
This repository is owned by the platform infrastructure team.
They review and approve all changes.
They are responsible for environment health.

## What Happens When Things Fail
Applications may become unavailable or slow.
New environments may fail to come up.
Teams may be blocked from releasing changes.

## How Rollback or Recovery Works
Problematic changes should be reverted quickly.
Previous stable infrastructure state should be restored.
Recovery focuses on restoring service first, then fixing the cause.

## Who Is Impacted by Failure
Application teams may be unable to deploy or operate services.
End users may experience outages or degraded performance.
Support teams may receive increased incidents.

## Risk If Misused
If unsafe changes are applied without review,
shared environments can be disrupted.
This may cause outages affecting multiple applications at once.

# Infrastructure Repository – AWS VPC & Compute (Terraform)

## Overview

This repository contains Terraform code to provision a secure and production-grade AWS infrastructure.  
The infrastructure is modular, environment-aware, and follows security-first design principles.

All resources are created using Terraform modules and are wired together in the environment layer.

---

## Architecture Decisions

- Infrastructure is split into independent Terraform modules (VPC, subnets, routing, NAT, security groups, EC2).
- Modules are reusable and contain no environment-specific logic.
- Environments (such as `dev`) only connect modules together and pass variables.
- A private EC2 instance is used only for validation, not for application hosting.
- Private workloads never receive public IP addresses.

This design improves clarity, reuse, and safe scaling.

---

## Why CIDRs Were Chosen

- A single VPC CIDR block is used to keep networking predictable.
- CIDRs are divided based on subnet purpose:
  - Public subnets
  - Private application subnets
  - Private data subnets
- CIDR sizes allow:
  - Adding new subnets
  - Adding new Availability Zones
  - Adding new environments (dev, stage, prod)

This avoids future rework and IP exhaustion.

---

## How Routing Works

- Public subnets route internet traffic (`0.0.0.0/0`) through an Internet Gateway.
- Private subnets route internet traffic (`0.0.0.0/0`) through a NAT Gateway.
- Each subnet is explicitly associated with a route table.
- No implicit or shared routing is used.

All routing behavior is intentional and clearly defined in code.

---

## How Security Is Enforced

### Network Security
- Private subnets do not allow inbound internet access.
- Outbound internet access from private subnets is only via NAT Gateway.

### Security Groups
- Security groups are created per role and are not reused blindly.
- Ingress rules are:
  - Explicit
  - Minimal
  - Variable-driven (ports and CIDRs)
- Wide-open access (`0.0.0.0/0`) is avoided unless explicitly required and documented.

### IAM Security
- EC2 instances use IAM roles instead of static credentials.
- Permissions are attached using managed IAM policies.

Security is enforced by default across all layers.

---

## How to Add a New Subnet

1. Update subnet CIDR and AZ values in variables.
2. Add the subnet configuration in the subnet module.
3. Associate the subnet with the correct route table.
4. Run `terraform plan` and `terraform apply`.

No changes to existing resources are required.

---

## How to Add a New Availability Zone

1. Extend subnet variables to include the new AZ.
2. Create matching public and private subnets.
3. Associate routing for each subnet.
4. Apply Terraform.

The design supports multi-AZ expansion safely.

---

## How to Add a New Environment

1. Create a new folder under `environments/` (for example: `stage`).
2. Reuse existing modules without modification.
3. Provide environment-specific variable values.
4. Run Terraform from the new environment directory.

No module duplication is required.

---

## How to Safely Run Terraform

Always run Terraform from an environment directory:

```bash
cd environments/dev
terraform init
terraform plan
terraform apply
