---
# The Eidos version this registry targets; eidos-migrate reads and bumps it.
eidos_version: 4.0.0
# How files, folders, and links are named: Title Case | TitleCase | kebab-case. Absent = Title Case.
naming: Title Case
---

# Registry

This registry's index and config: the version and naming convention above, and below the Top-Level
documents and the Collections with their flavors and grouping. The root `README.md` is the friendly
door to it. Kept current with `eidos-registry`.

## Top-Level

<!-- eidos-registry: top-level index (regenerated) -->
- [Architecture](../Architecture.md) — the YouTube subset as a built system, the one entry door.
- [Audience](../Audience.md) — who it serves: viewers, creators, and how each differs.
- [Criteria](../Criteria.md) — budget, scope objectives, and timeline that decide and audit scope.
- [Market](../Market.md) — where it sits among video platforms, and how it would earn.
- [Roadmap](../Roadmap.md) — where the subset is headed, in plain horizons (a custom top-level doc).

## Collections

### Specs

The product's units, one per spec, grouped by domain.

- **Leaf:** [Specs/index.md](../Specs/index.md)
- **Flavors:**
  - [full](shapes/spec.full.md) — the complete spec shape (default).
  - [micro](shapes/spec.micro.md) — Intent, Open Questions, ACs, Out of Scope; grow into full.
- **Domains:**
  - **Playback** — watching a video, and picking up where you left off.
  - **Channels** — publishing to a channel, and following one.
