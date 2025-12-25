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
