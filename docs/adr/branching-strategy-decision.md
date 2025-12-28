# ADR: Branching Strategy Decision

## Problem
We needed to choose a branching strategy that keeps production infrastructure safe
while allowing engineers to work on changes in a structured way.

The strategy should be easy to understand and support releases and emergency fixes.

## Options Considered
1. Trunk-Based Development
2. GitFlow

## Final Decision
We chose **GitFlow** as the branching strategy for this infrastructure repository.

GitFlow provides clear branches for development, releases, and emergency fixes.
It helps protect the production branch and makes changes easier to track and review.

## Risks
Here is a **simple 5–6 line description** you can add at the top of
`docs/adr/repo-separation-decision.md`
written in **plain English** and suitable for an **Infrastructure repository**:

---

### Description

This document explains why infrastructure code is kept in a separate repository.
It helps new engineers understand the reason behind this decision.
Separating repositories improves security and access control.
It also makes reviews and changes easier to manage.
This approach reduces risk to production infrastructure.
It keeps infrastructure work clear and organized.
