# Infrastructure Repository

This repository defines the cloud infrastructure required to run our applications.
It controls how environments are created, secured, and kept available.

Changes here directly affect system stability and access.

---

## What This Repository Is For

This repository is used to:
- Define shared platform resources used by applications
- Control configuration that affects availability and security

If infrastructure exists in the cloud, it should be defined here.

---

## What Type of Changes Are Allowed

Allowed changes include:
- Adding or updating infrastructure definitions
- Environment-specific configuration updates
- Improving reliability, security, or scalability
- Fixing infrastructure-related issues

All changes must go through a pull request.

---

## What Changes Are NOT Allowed

The following are not allowed:
- Manual changes directly in the cloud
- Committing secrets or credentials
- Application code or deployment logic
- Emergency fixes without follow-up documentation

These changes create drift and hidden failures.

---

## Who Owns This Repository

This repository is owned by the Infrastructure and Platform team.
They are responsible for reviews, approvals, and safe execution of changes.

---

## One Realistic Risk If Misused

A small configuration mistake can remove network access or reduce capacity,
causing multiple applications to go down at the same time.
Recovery may take hours and may require manual intervention.

---

## Acceptance Criteria

A change is acceptable only if:
- It has a clear purpose and impact description
- It is reviewed and approved
- It is tested in non-production first
- It does not break existing environments
