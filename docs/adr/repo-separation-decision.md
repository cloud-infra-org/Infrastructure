# ADR: Repository Separation Decision

## Problem
We needed to decide how to organize our code repositories.
The main question was whether infrastructure code should live in the same repository
as application and CI/CD code, or be separated into its own repository.

Mixing everything in one repository can make it hard to manage permissions,
reviews, and changes safely.

## Options Considered
1. Keep application, infrastructure, and CI/CD code in one repository.
2. Create separate repositories for application, infrastructure, and CI/CD.

## Final Decision
We decided to keep **infrastructure code in a separate repository**.

This makes it easier to manage infrastructure changes, apply strict access controls,
and review changes carefully without affecting application code.


## Risks and Trade-offs

- Managing multiple repositories requires more coordination.
- Engineers must clearly understand which repository to use.
- Changes that span multiple repositories may take longer to review.
- Additional documentation is needed to avoid confusion.
- Tooling and automation must stay consistent across repositories.
