# Branching Strategy

## Purpose

This repository follows the **GitFlow** branching model to ensure infrastructure
changes are safe, reviewed, and released in a controlled way.

## Branching Strategy Used
We use **GitFlow** as our branching strategy.

GitFlow separates daily work, testing, releases, and emergency fixes into
different branches. This helps protect production infrastructure and reduces
the risk of outages.

---

## Production Branch
- The **`main`** branch is the production branch.
- It represents the live infrastructure running in production.
- Only stable and approved changes are merged into this branch.
- Direct commits to `main` are not allowed.
- The `main` branch is always protected using GitHub branch protection rules.

---

## Daily Development Work
- Engineers do their daily work on the **`develop`** branch.
- This branch contains infrastructure changes that are under development.
- The `develop` branch is used for testing and validation before release.
- All new work starts from the `develop` branch.

---

## Feature Development
- New infrastructure changes are done using **feature branches**.
- Feature branches are created from the `develop` branch.
- Naming format: `feature/<short-description>`.
- Examples include new Terraform modules, IAM updates, or networking changes.
- After review and approval, feature branches are merged back into `develop`
  using a pull request.

---

## Bug Fixes
- Bugs found during development are fixed using **bugfix branches**.
- Bugfix branches are created from the `develop` branch.
- The fix is tested and reviewed before merging.
- After approval, the bugfix branch is merged back into `develop`.

---

## Releases
- When infrastructure changes are ready for production, a **release branch**
  is created from the `develop` branch.
- Final testing, validation, and approvals happen in the release branch.
- Once approved, the release branch is merged into:
  - `main` (production)
  - `develop` (to keep branches in sync)

### What Happens During Emergencies

* An emergency is a serious issue in production.
* A **hotfix branch** is created from the **`main`** branch.
* The issue is fixed and tested in the hotfix branch.
* The fix is merged into **`main`** and **`develop`**.
* This quickly restores production and keeps all branches updated.

---

If you want it even shorter (2 lines), tell me 👍

---

## Branch Protection Rules
- The `main` branch is always protected.
- Pull request reviews are required before merging.
- Required checks must pass before changes are merged.
- These rules prevent accidental changes and protect production systems.

---

## Summary
This GitFlow-based branching strategy ensures:
- Production infrastructure is always protected
- Changes are reviewed and tested
- Releases are controlled and predictable
- Emergencies are handled quickly and safely
