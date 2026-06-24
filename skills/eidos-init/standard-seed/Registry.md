---
# The Eidos version this registry targets; eidos-migrate reads and bumps it.
eidos_version: 4.0.0
# How files, folders, and links are named: Title Case | TitleCase | kebab-case. Absent = Title Case.
naming: Title Case
---

# Registry

The registry's index and config: the version and naming convention above, and below the Top-Level
documents and the Collections with their flavors and grouping — the one place to read the whole
registry at a glance. The visible `README.md` at the registry root is the friendly door to it; keep
both current with the `eidos-registry` skill.

## Top-Level

<!-- eidos-registry: top-level index (regenerated) -->
<!-- One bullet per top-level document — a link and a one-line description you write. eidos-init fills
     this in as it scaffolds the top-level docs; eidos-registry refreshes it. For example:
- [Architecture](../Architecture.md) — the system as a built whole, the one entry door.
- [Audience](../Audience.md) — who it serves, and how each kind of user differs.
-->

## Collections

A collection is a top-level folder of repeated units that share a body shape. `Specs` is the default;
add more with `eidos-registry`. Each lists its flavors (the default marked) and its grouping, and points
at its generated `index.md` leaf.

### Specs

The product's units, one per spec, grouped by domain.

- **Leaf:** [Specs/index.md](../Specs/index.md)
- **Flavors:**
  - [full](shapes/spec.full.md) — the complete spec shape (default).
  - [micro](shapes/spec.micro.md) — Intent, Open Questions, ACs, Out of Scope; grow into full.
- **Domains:** _(add one bullet per domain — a name and a short description — as domains accrue)_
