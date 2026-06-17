# Agents

This repository is the home of the **Eidos** standard. `EIDOS.md` is the authoritative definition of the format; everything else supports it.

**Use the skills.** Three live in the top-level [`skills/`](skills) and ship as a Claude Code plugin: `eidos` (author + validate), `eidos-init` (scaffold a new registry), and `eidos-migrate` (move specs to a new version). The fill-in templates are not bundled into the skills or the example — they are part of the standard, in the top-level [`templates/`](templates) folder. Read the relevant skill (and `EIDOS.md`) before creating, scaffolding, migrating, or reviewing any spec or product doc.

**Eidos is human-first: facilitate, don't author.** The product owner holds the intent, the scope, and the decisions. Format, supplement, ask clarifying questions, and press on scope; do not generate finished specs or set direction.

**Keep the README badge in sync.** When `EIDOS.md` changes version (the `**Version:**` header and the Versioning section), update the badge line at the top of `README.md` so it shows the current version, e.g. `[Eidos v2.0.0](EIDOS.md)`. Also update `version` in `.claude-plugin/plugin.json`, and add an entry to `CHANGELOG.md`. After changing `EIDOS.md`, `templates/`, `versions/`, or `CHANGELOG.md`, run `scripts/sync-skills.sh` so the skills' vendored copies stay current.

**On each release,** preserve the outgoing `EIDOS.md` in `versions/` under its full semver name (e.g. `versions/v1.0.0.md`) before editing `EIDOS.md` in place. Migrate existing specs to a new version with the `eidos-migrate` skill.
