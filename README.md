# Eidos

> **[Eidos v2.0.0](EIDOS.md)** — the full standard.

A markdown spec registry for defining what a product _is_. One file completely defines one unit of a product, true whether or not the thing has been built. Specs live as plain `.md` files next to your code. No SaaS. No lock-in. No hidden state.

A **spec** captures **state and intent, not work**. Tasks describe work and die when the work ships; a spec describes the product and stays accurate across its whole life: drafted, built, deprecated.

Eidos is **human-first**. A product owner holds the intent, the scope, and the decisions. An agent — via the `eidos` skill — facilitates: it formats, supplements, asks clarifying questions, and presses on scope. It does **not** author specs for you. A spec no one thought through is worse than none.

## Why

Product knowledge rots in tickets, wikis, and people's heads. Eidos keeps the authoritative answer to "what is this thing" as version-controlled markdown, reviewed in PRs alongside the code it describes. Humans and coding agents read the same source of truth.

## How it works

Drop a `Blueprint/` folder into any repo:

```txt
Blueprint/
  Architecture.md     # overarching system shape
  Audience.md         # who it serves and how each type interacts
  Criteria.md         # budget, scope objectives, timeline
  Market.md           # where it sits, how it differs, how it earns
  Domains.md          # the domains as descriptions; present by default
  Specs/
    <Domain>/
      <Title>.md      # one spec per unit, grouped by domain
```

- **Product docs** are four files — one of each — that frame the whole product.
- **Specs** are the many, one per unit, grouped into `<Domain>/` folders. Every spec shares one shape — Intent, Behaviors & Acceptance Criteria, Out of Scope, and the rest; the fields at the top are the firm part, the body is guidance.
- **Templates** are part of the standard, in their own top-level `templates/` — not bundled into the example. Fill from them directly.
- Human-facing names are **Title Case** (the tree reads like a table of contents); the `id` inside each spec — lowercase words joined by hyphens — is its permanent reference.

The full rules are in **[EIDOS.md](EIDOS.md)**. See **[`example/`](example/)** for a filled-in product definition you can pattern-match against.

## Quick start

Use Eidos on your own project:

1. **Get the skills.** Install `eidos` (author + validate), `eidos-init` (scaffold a new registry), and `eidos-migrate` (move specs to a new version) — see [Installing the skills](#installing-the-skills). Or work by hand from `EIDOS.md` and [`templates/`](templates/).
2. **Initialize.** Run `eidos-init`: it scaffolds a `Blueprint/` from the standard's templates, following the current `EIDOS.md` — no copying the example and deleting its contents. (By hand: make a `Blueprint/` folder, copy the four product-doc templates and `Domains.md` from [`templates/`](templates/), and add a `Specs/` folder.)
3. **Fill the product docs.** Architecture, Audience, Criteria, Market — prose, loose, point-in-time; fill what's known, leave the rest. Describe each domain in `Domains.md` as specs accrue.
4. **Author specs.** One file per unit under `Specs/<Domain>/`, named for its title in Title Case (`Magic Link Sign-In.md`). Lead with Intent and Behaviors & Acceptance Criteria; press hard on **Out of Scope** — that's where scope is held. The `eidos` skill facilitates; it does not author for you.
5. **Commit it.** Specs are the product definition. Review them in PRs alongside code. Eidos relies on git history (`created`/`modified` dates, the Decisions log, scope drift), so do **not** gitignore them.

See [`example/`](example/) for a filled-in registry to pattern-match against.

## Installing the skills

Eidos ships as a **Claude Code plugin** bundling three skills:

- **`eidos`** (author + validate)
- **`eidos-init`** (scaffold a new registry)
- **`eidos-migrate`** (move specs to a new version).

The plugin carries the standard with it — `EIDOS.md`, the templates, and the full version history — so the skills behave the same in this repo or anywhere else.

**Install the plugin** (recommended):

```
/plugin marketplace add https://gitlab.com/the-virtual-panda/Eidos.git
/plugin install eidos@eidos
```

Developing locally? Load it straight from a clone with `claude --plugin-dir .`, or `/plugin marketplace add ./` and then install.

**Or use a skill raw**, without the plugin — a skill is just a folder with a `SKILL.md`, auto-discovered, no registration:

- **One project:** drop the folder at `<repo>/.claude/skills/<name>/`.
- **All your projects:** drop it at `~/.claude/skills/<name>/` (a project copy wins over a global one).

To use a skill on its own, run [`scripts/sync-skills.sh`](scripts/sync-skills.sh) first — it copies the templates and version history into each skill folder so the folder works standalone. (Those copies are gitignored; the installed plugin reads the originals from its own root instead.) Re-run it whenever the standard changes.

**Adding your own skill:** create `skills/<your-skill>/SKILL.md` — it ships with the plugin automatically (the plugin's skills live in the top-level `skills/`).

> The skills live in the top-level **`skills/`** — the conventional plugin layout, visible and portable across AI tools. They aren't auto-loaded just by opening the repo; use `claude --plugin-dir .` (or install the plugin) to activate them, and run `scripts/sync-skills.sh` to populate the assets they vendor.

## Versioning

The standard is versioned with [Semantic Versioning](https://semver.org/). The current version is in [`EIDOS.md`](EIDOS.md); history and migrations are in [`CHANGELOG.md`](CHANGELOG.md); prior versions are preserved in [`versions/`](versions/) under their full semver names.

## License

TBD.
