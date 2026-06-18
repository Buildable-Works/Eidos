---
id:
title:
type: [feature | capability | domain | integration]
domain:
status: [Draft | Intake | In Progress | Done | Archived | Deprecated]
created:
modified:
eidos_version: 2.0.0
owner:
depends_on: []
tags: []
---

# {{title}}

_Keep the sections that apply and delete the rest, but leave the order and headings as they are — a reader should know what to expect from any spec._

## Intent

Why this exists. The problem and who has it. One or two paragraphs. Keep it stable.

### Implementation Notes

_Optional. The intent of the implementation — the approach you mean to take and why. Direction, not status: how you intend to build it, never how far along it is. Delete this section if the approach is obvious or undecided._

## Open Questions & Assumptions

Unresolved questions, and the assumptions you're proceeding on. Kept high so they're seen, not buried at the bottom. Park uncertainty here, not in Behaviors.

## Behaviors & Acceptance Criteria

What it does, as observable outcomes. If it is not here, it is not promised. Label each criterion **AC1:**, **AC2:**, … — numbered continuously and unique within this spec, for reference. Group under the requirement types that apply; the sub-headings are suggestive, use what fits. Keep each AC short and checkable; when the detail is rich (a data model, a payload, a state table), put it in a table or a `####` sub-heading and have the AC point to it — don't cram it onto the line.

### Functional

- **AC1:** <!-- what the system must do: features, behaviors, business rules -->
<!-- Rich detail (a data model, a payload) → a table or a #### sub-heading the AC points to, not a long AC line. -->

### Performance

- **AC2:** <!-- speed, throughput, response time, capacity, concurrent users -->

### Design

- **AC3:** <!-- mandated tech, standards, regulatory rules, platform limits -->

### External interface

- **AC4:** <!-- how it connects to users, hardware, other software, networks: UI, APIs, protocols -->

### Quality attributes

- **AC5:** <!-- the other -ilities: reliability, security, usability, maintainability, scalability, portability -->

## Out of Scope

Explicit non-goals. Do not skip this. This is where scope is held.

## Dependencies

Anything this needs to build or run: services, libraries, teams, data, other specs. List the spec dependencies in `depends_on` at the top as links too (same markdown form). Reference other specs as markdown links — `[Session Management](../Identity/Session%20Management.md)` — never bare names.

## Testing

How this is verified. The testing approach and the key cases that prove the behaviors hold. Reference AC labels where useful.

## Constraints & Decisions

Hard boundaries and limits the build must respect — not architecture itself. Then a decisions log, one line each, with an optional date:

## <!-- append-only; date optional but recommended -->
