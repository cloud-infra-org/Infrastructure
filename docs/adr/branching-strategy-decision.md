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

## Risks and Trade-offs

- GitFlow uses multiple branches, which may be confusing for new engineers at first.
- Engineers must strictly follow the branching rules to avoid mistakes.
- Incorrect merges can delay infrastructure releases.
- Additional reviews may slow down urgent changes.
- Clear documentation and onboarding are required to reduce errors.
