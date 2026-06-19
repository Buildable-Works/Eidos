# Changelog

All notable changes to the Eidos standard are documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html). The current version of the standard always lives in `EIDOS.md`; when a version is tagged, that `EIDOS.md` is copied into `versions/` under its full semver name.

## [Unreleased]

## [3.0.0] - 2026-06-19

A breaking release that moves a registry's **form** — its body shapes and its property contract — out of the standard and into the registry itself, as a hidden `.eidos/` folder. Eidos becomes an opinionated baseline you can extend without forking: adopt as-is, add your own properties, still migrate.

### Added

- **The `.eidos/` form layer.** Every registry now owns its form in a hidden `.eidos/` at its root: `shapes/` (the body template for each kind of document), `Schema.md` (the property contract), and `Registry.md` (the Eidos version). Seeded by `eidos-init` from an opinionated baseline; the skills read it from there.
- **`Schema.md` — a registry-defined property contract.** Two blocks: `## Eidos Canonical` (the standard's properties, managed by `eidos-migrate`) and `## Custom Registry Properties` (yours, preserved across migration). Each property declares name, type, required, and meaning. Property types are drawn from the Obsidian set — Text, List, Number, Checkbox, Date, Date & time — so frontmatter renders natively in an Obsidian vault.
- **Generated frontmatter.** A spec's frontmatter is emitted from the Schema's required properties, so every new spec is born conforming.
- **Registry-defined validation.** A check reads _that registry's_ Schema — canonical required plus any custom-required — and surfaces a missing field by adding it with a note on why, never refusing the file.
- **`eidos-property` skill** — add, rename, or retire a custom property: it presses the owner to decide type, meaning, and whether it's required, writes the row into `Schema.md`, and backfills every existing spec.
- **`eidos-domains` skill** — regenerate `Domains.md` as a navigation index: each domain's hand-written description plus a generated list of its specs (links + a one-line summary distilled from each spec's Intent). Makes `Domains.md` the map humans and agents read first instead of scraping the tree.
- **`Registry.md`** — records the Eidos version in one spot, read and bumped by `eidos-migrate`.

### Changed

- **Skills consume the registry's form instead of vendoring templates.** The canonical baseline lives, public and front-facing, in the top-level `standard-seed/`; `eidos-init` installs it, and `eidos`, `eidos-format`, and `eidos-property` read the live `.eidos/` from the registry in the working directory. The old template triplication is gone; the three skills that need the standard (`eidos`, `eidos-init`, `eidos-migrate`) carry committed copies of just what they need, kept in sync by `scripts/sync-skills.sh`, so a git-marketplace install works on Claude Code and sandboxed Claude Desktop alike.
- **"Works from `EIDOS.md` alone" is retired.** `EIDOS.md` gives the method; doing Eidos now needs the skills and a seeded registry. The `## AI` section and the "templates ship with the standard" guidance were rewritten accordingly.
- **Body shapes** moved from the top-level `templates/` into `.eidos/shapes/`. The Spec shape is body-only (frontmatter is generated); the product-doc shapes keep their own light frontmatter. The baseline section set is unchanged from 2.1.
- **The canonical baseline is a public, top-level `standard-seed/`.** The seed (shapes + `Schema.md` + `Registry.md`) is browsable at the repo root, not tucked inside a skill; `eidos-init` installs it, and `eidos-migrate` reads it.
- **The `eidos` skill is lean and defers to `EIDOS.md`.** It holds the facilitation flow and reads the registry's `.eidos/`, and points to `EIDOS.md` — the officially maintained ruleset, carried as a committed copy in the skill — instead of restating the rules. Its `core-overview.md` and `spec-schema.md` references were removed as duplicative; `example-spec.md` stays.
- **`Domains.md` became the registry's navigation map** — each domain's description plus a generated per-spec index — rather than descriptions alone. The body-section catalog was also pulled out of `EIDOS.md` into the Spec shape, leaving `EIDOS.md` with the rules for using a body, not the section list.

### Removed

- **The per-doc `eidos_version` frontmatter field** — the version is a registry fact now, in `.eidos/Registry.md`.
- **The top-level `templates/` folder** and **`scripts/sync-skills.sh`** — replaced by the seed in `eidos-init` and the registry's own `.eidos/`.

**Migration from 2.x:** use the `eidos-migrate` skill, or diff `versions/v2.1.0.md` against `EIDOS.md`. The net per registry is small: install `.eidos/` from the v3 seed (shapes, canonical `Schema.md`, `Registry.md`), drop `eidos_version` from every spec and product doc, and write `**Eidos Version:** 3.0.0` into `.eidos/Registry.md`. The body section set is unchanged, so specs need no restructuring.

## [2.1.0] - 2026-06-18

### Added

- Apache License 2.0 (`LICENSE`); `license: Apache-2.0` declared in the plugin manifest.
- `eidos-format` skill — reshapes a rough draft or brain-dump into the Eidos spec shape, preserving the author's words and adding nothing. It reads the spec template for the target shape and is mostly a format-and-organize pass within a single file.
- An `## AI` section at the foot of `EIDOS.md` — condensed operating guidance (facilitate-don't-author, authoring, validating, the link format) for an AI working without the skills installed; humans can stop above it. The former top-level `## Validation` section folded into it.

### Changed

- Clarified that the spec body sections are a scaffold, not a form: shape them for readability (sub-headings, tables, lists), never flatten rich content onto one line, and keep acceptance criteria short with supporting detail pushed into tables or sub-sections. Captured as Rule 3, _Write it like a human would read it_, and echoed in the schema, the `eidos` skill, and the Spec Template.
- Cross-references between specs are now markdown links (relative path, `%20` for spaces, `#heading` for a section), never bare `code-style` names — readable and navigable. Captured as Rule 4, _Reference other specs as links, never bare names_, with a new _Referencing other specs_ section; the example specs' Dependencies were converted, and `eidos-format` treats name→link as a formatting fix. The convention extends to linking properties: `depends_on` now holds markdown-link strings rather than bare ids (the linked spec's `id` stays its permanent identity).
- Clarified the shared spec shape: _which_ sections appear is flexible (omit what doesn't apply, no empty headings), but their order and names are strongly encouraged — close to required — so every spec reads predictably and is not a free-for-all. Reworded Rule 5 (was _One shape for specs, always_) to _One shared shape, in a predictable order_.

### Fixed

- The `eidos` skill resolved templates from a bare `templates/` path, so when used in an adopting repo it looked in that project's working directory instead of the standard. It now resolves them the same way `eidos-init`/`eidos-migrate` do — `${CLAUDE_PLUGIN_ROOT}/templates/` in Claude Code, a vendored copy inside the skill on Claude Desktop — and `scripts/sync-skills.sh` vendors `templates/` into `eidos` too. An adopting repo holds only `Blueprint/`; it never needs a `templates/` folder of its own.

## [2.0.0] - 2026-06-17

A breaking redesign of the spec contract and body. Eidos now captures the _intent_ of the build (never work or status), carries requirements as labeled acceptance criteria, and ships a default `Domains.md` and a `Blueprint/` root.

### Added

- `created` and `modified` frontmatter fields (`YYYY-MM-DD`).
- `## Dependencies` and `## Testing` body sections.
- Optional `### Implementation Notes` under `## Intent` — the intent of the implementation, never its state.
- `**AC{n}:**` labels for acceptance criteria, unique within a spec for reference, under requirement sub-headings (Functional, Performance, Design, External interface, Quality attributes) inside `## Behaviors & Acceptance Criteria`.
- `Domains.md` as part of the default layout, with a new `templates/Domains Template.md`.
- Full-semver version snapshots in `versions/`, plus an `eidos-migrate` skill for non-sequential migration between any two versions.
- An optional, recommended `eidos_version` frontmatter field, so each doc declares the standard it targets (aids migration and tooling).
- An `eidos-init` skill that scaffolds a new registry from the templates, following the current `EIDOS.md` (no example-copying).
- Packaged as an installable Claude Code plugin (`.claude-plugin/`), with the skills in the top-level `skills/` and `scripts/sync-skills.sh` to vendor assets for standalone use.

### Changed

- Renamed the registry root from `product/` to `Blueprint/` — it sorts to the top of the file tree and reads as the product's defining document; still low-stakes and renameable, since nothing points at it by path.
- `## Behavior` → `## Behaviors & Acceptance Criteria`.
- Merged `## Constraints` and `## Decisions` into a single `## Constraints & Decisions`; decision dates are now optional.
- `status` is a soft baseline — `Draft | Intake | In Progress | Done | Archived | Deprecated` (an off-list value warns, never fails) — shown bracketed in the template; `type` is shown bracketed too.
- `Domains.md` uses `##` sub-headings per domain instead of a bullet list, and is listed among the product docs.
- `Open Questions` → `Open Questions & Assumptions`, moved up to just after Intent.
- Criteria: `Objective and scope` → `Scope Objectives`, plus a new `Parameters & Variables` section. Market: a new `Competitors` section, with `Position and difference` → `Positioning & Differentiators` and `How it earns` → `Earning Capabilities`. Product docs no longer carry a `Decisions` log.
- Plain-language pass across `EIDOS.md` and the README for non-technical readers.

### Removed

- Frontmatter fields `last_validated`, `implements`, `serves_job`, `activity`, and `supersedes`.
- The `manifest.json` version pointer — the `EIDOS.md` header and `.claude-plugin/plugin.json` already carry the version, and nothing consumed it.

**Migration from 1.x:** use the `eidos-migrate` skill, or diff `versions/v1.0.0.md` against `EIDOS.md`. Map `status` (`proposed`/`accepted` → `Intake`, `in-progress` → `In Progress`, `shipped` → `Done`, `deprecated` → `Deprecated`); carry `last_validated` into `modified`; relabel behaviors as `AC{n}`; merge Constraints and Decisions; add `Dependencies` and `Testing`.

## [1.0.0] - 2026-06-16

Initial published version of the Eidos standard. The normative definition lives in a single top-level `EIDOS.md`; the repository is the versioned home of the standard, modeled on the backlog.md layout.

### Added

- `EIDOS.md` — the authoritative standard: what a spec is, the two-tier document model, directory layout, product docs, the spec frontmatter contract (required + optional fields), recommended body sections, load-bearing rules, the optional `Domains.md` descriptions, validation, and versioning.
- `CHANGELOG.md`, `manifest.json` (machine-readable version pointer), and `AGENTS.md`.
- `versions/` — reserved for preserved prior versions of `EIDOS.md`.
- `example/` — a filled-in worked example of an Eidos product definition.
- `.claude/skills/eidos/` — the authoring/validation skill, vendored in-repo.

### Removed

- The blank `product/` scaffold. Authors copy `example/` (or run the skill) instead of filling empty templates checked into the standard's repo.

[Unreleased]: https://github.com/BuildableWorks/Eidos/compare/v3.0.0...HEAD
[3.0.0]: https://github.com/BuildableWorks/Eidos/compare/v2.1.0...v3.0.0
[2.1.0]: https://github.com/BuildableWorks/Eidos/compare/v2.0.0...v2.1.0
[2.0.0]: https://github.com/BuildableWorks/Eidos/compare/v1.0.0...v2.0.0
[1.0.0]: https://github.com/BuildableWorks/Eidos/releases/tag/v1.0.0
