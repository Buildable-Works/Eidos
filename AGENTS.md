# Agents

This repository is the home of the **Eidos** standard. `EIDOS.md` is the authoritative definition of the format; everything else supports it.

**Use the skills.** Four live in the top-level [`skills/`](skills) and ship as a Claude plugin: `eidos` (author + validate), `eidos-format` (reshape a rough draft into the spec shape), `eidos-init` (scaffold a new registry), and `eidos-migrate` (move specs to a new version). The fill-in templates are the standard's own, in the top-level [`templates/`](templates) folder; `scripts/sync-skills.sh` vendors copies into the skills for standalone use, but the canonical copies stay at the top level. Read the relevant skill (and `EIDOS.md`) before creating, scaffolding, migrating, or reviewing any spec or product doc.

**Eidos is human-first: facilitate, don't author.** The product owner holds the intent, the scope, and the decisions. Format, supplement, ask clarifying questions, and press on scope; do not generate finished specs or set direction.

**Keep the version in sync.** `EIDOS.md` always holds the current version (its `**Version:**` header and Versioning section). When it changes, update the badge at the top of `README.md` (e.g. `[Eidos v2.1.0](EIDOS.md)`), the `version` in `.claude-plugin/plugin.json`, and `CHANGELOG.md`. After changing `EIDOS.md`, `templates/`, `versions/`, or `CHANGELOG.md`, run `scripts/sync-skills.sh` so the skills' vendored copies stay current.

**On each release (tag),** copy the current `EIDOS.md` into `versions/` under its full semver name (e.g. `versions/v2.1.0.md`) — snapshot at tag time, from the live file, so there's nothing historical to dig up. `EIDOS.md` itself stays the current version. Migrate existing specs with the `eidos-migrate` skill.
