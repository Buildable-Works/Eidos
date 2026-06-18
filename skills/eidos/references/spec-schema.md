---
type: system
title: Eidos Schema
tags: [eidos, meta, schema]
created: Thursday, June 11th 2026, 10:59 pm
modified: Thursday, June 11th 2026, 11:09 pm
---

# Eidos Schema

The contract every spec follows. Skills validate against this. Two parts: frontmatter fields and body sections.

## Frontmatter

### Required

| Field | Type | Notes |
| --- | --- | --- |
| `id` | string | Stable, unique, kebab-case. Never changes once assigned. Used for references. |
| `title` | string | Human-readable name. |
| `type` | string | Open, soft label. Human-chosen. Drives views, never structure. Suggested: `feature`, `capability`, `domain`, `integration`. Invent your own. |
| `domain` | string | The grouping. Required, soft, descriptive. Title Case, matching the folder under `Specs/`. Validated against `Domains.md` only as a warning. |
| `status` | list (soft) | Suggested baseline: `Draft` \| `Intake` \| `In Progress` \| `Done` \| `Archived` \| `Deprecated`. Single value; off-list warns, never fails. `Intake` encapsulates the old `proposed`/`accepted`. |
| `created` | date | `YYYY-MM-DD`. The day the spec was first written. Set once. |
| `modified` | date | `YYYY-MM-DD`. The day the spec was last changed. Git holds the full history. |

### Optional

| Field | Type | Notes |
| --- | --- | --- |
| `eidos_version` | string | The Eidos version this doc targets, e.g. `2.0.0`. Optional but recommended — aids migration and tooling. |
| `owner` | string | Who answers questions about this spec. |
| `depends_on` | list of links | Specs this one needs, each a link to that spec (a markdown-link string, quoted in YAML). The linked spec's `id` stays its permanent identity. |
| `tags` | list | Free tags. |

### Rules

- `type` is never branched on for structure. Every spec draws on the same rough body shape no matter its type — though the sections are recommended, not required (see Body sections): use what applies and omit the rest. Requirement categories are sub-headings _inside_ Behaviors & Acceptance Criteria, never structural variants.
- `domain` is soft. An unknown domain is valid; a skill may warn and offer to register it.
- `id` is permanent. Rename `title` freely; never rename `id`.
- Reference other specs as markdown links (relative path, `#heading` for a section), never bare `code-style` names — in prose and in linking properties like `depends_on` (a quoted markdown-link string per entry). Each linked spec's `id` stays its permanent identity.
- `status` is a soft baseline, not a fixed list; an off-list value warns rather than fails.
- Acceptance criteria are labeled `AC{n}`, unique within a spec for reference — not across the registry.
- Implementation Notes are intent, not status: how you mean to build a thing, never how far along it is.
- Do not add work-tracking fields (sprint, estimate, assignee). The moment you do, it becomes a task and rots. Bridge to a tracker with a link field if you must.

## Body sections

The body is guidance, not contract — the frontmatter is the firm part — but it is not a free-for-all. The sections below have a set order and set names; keeping to them is strongly encouraged, close to required, so every spec reads predictably. You may leave a section out when it genuinely doesn't apply (no Open Questions heading when there are none); you should not reorder them, rename them, or invent a parallel layout. A skill may note a missing recommended section and offer to fill it; it never refuses the file. See Core Overview on portability.

Within a section, shape the content to fit — don't just pour text in. Add `###`/`####` sub-headings, tables, lists, or code blocks wherever they read clearer, and never flatten rich content onto one line — a data model is a table, not a sentence; a sequence is a numbered list. Keep acceptance criteria short and observable, with rich detail pushed into a table or sub-section the criterion points to. The result should read like a person wrote it.

### Intent

Why this exists. The problem and who has it. One or two paragraphs. Stable. If Intent changes substantially, you probably have a different spec.

#### Implementation Notes (optional, nested under Intent)

The _intent_ of the implementation — the approach you mean to take and why. Direction, not status. This is where the HOW lives, kept as intent rather than work: how you mean to build it, never how far along it is. Omit when the approach is obvious or undecided.

### Open Questions & Assumptions

Unresolved questions, and the assumptions you're proceeding on. Placed high, right after Intent, so uncertainty is seen rather than buried. Holding it here keeps guesses from leaking into Behaviors.

### Behaviors & Acceptance Criteria

What it does, as observable outcomes. This is the "this is what you're getting" section. If a behavior is not listed here, it is not promised. Label each criterion **AC1:**, **AC2:**, … — bold with a colon, unique within this spec for reference. Group criteria under the requirement categories that apply, as `###` sub-headings — **Functional** (features, behaviors, business rules), **Performance** (speed, throughput, capacity, concurrent users), **Design** (mandated tech, standards, regulatory rules, platform limits), **External interface** (how it connects to users, hardware, other software, networks — UI, APIs, protocols), and **Quality attributes** (the other -ilities: reliability, security, usability, maintainability, scalability, portability). The sub-headings are suggestive; use what fits. AC numbers run continuously across them. Keep each criterion a short, checkable statement; when the detail is rich — a data model, a payload, a state table — put it in a table or a `####` sub-heading and have the AC reference it rather than cramming it onto the line. Prose or Given/When/Then, your call. Evolves freely.

### Out of Scope

Explicit non-goals. The section the standard leans on hardest, because this is where scope management happens. Strongly recommended: a spec without it is rarely finished. Still not a hard gate, in keeping with portability, but the first thing to add when a spec feels thin.

### Dependencies

Dependencies of any kind that must be known to build or run the unit: external services, libraries, teams, data sources, other specs. The `depends_on` frontmatter is the spec-only subset of what is documented here, each entry a link to that spec. Reference other specs as markdown links — `[Session Management](../Identity/Session%20Management.md)`, with a `#heading` anchor for a section — never a bare `code-style` name.

### Testing

How the unit is verified: the testing approach and the key cases that prove the behaviors hold. Reference AC labels where useful (e.g. "AC1–AC3 covered by …").

### Constraints & Decisions

Two things under one header. _Constraints_: non-functional boundaries and hard limits the build must respect — not the architecture itself. _Decisions_: an append-only log, one line per decision, with an optional but recommended date.

```
2026-06-17: Dropped SMS fallback, carrier cost. (brenton)
```

## Domain descriptions

`Domains.md` at the registry root. Present by default, optional and derived. Holds domain descriptions only; existence is proven by specs. Uses `##` sub-headings, one per domain:

```markdown
# Domains

## Identity

Who the user is and how they prove it.

## Billing

Money in, money out, what they're entitled to.
```

- A domain with specs but no entry here: valid, just undescribed. A skill may offer to write one.
- A domain with an entry here but no specs: dangling. A skill may flag it.
- `Domains.md` never gates. It annotates.
- Regenerable: crawl every spec's `domain`, rebuild the headings, keep hand-written descriptions.
