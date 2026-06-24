# standard-seed

The canonical Eidos baseline — the **form** a new registry starts from. `eidos-init` copies this into a registry's hidden `.eidos/` folder; from there it belongs to the registry, to use as-is or extend.

```
standard-seed/
  shapes/             # collection body shapes (flavored, shared)
    spec.full.md      #   the Specs collection's default flavor — sections, order, and guidance
    spec.micro.md     #   a lighter flavor of the spec, to grow into full
  templates/          # one-of-each top-level-doc templates (no flavors)
    Architecture.md
    Audience.md
    Criteria.md
    Market.md
  Schema.md           # the canonical property contract (the "Eidos Canonical" block)
  Registry.md         # the registry's index + config: version, naming, Top-Level, Collections
  user.md             # blank actor frame (installs to .eidos/user.md — personal, gitignored)
  gitignore           # installs to .eidos/.gitignore (ignores user.md beside it)
  README.template.md  # the registry's root README (installs to <root>/README.md — the start-here)
```

This is the public, front-facing home of the canon. If you want to read what Eidos ships by default — or propose a change to it — this is the place.

- **To change your *own* registry, edit its `.eidos/`, not this.** This is the standard's baseline, versioned with the standard; your registry's copy is yours.
- **Shapes and templates document themselves.** [`EIDOS.md`](../EIDOS.md) lays out the *rules*; the files here hold the *specific sections* and their guidance. A **shape** (`shapes/`) is a collection's body form — shared, flavored, validated against. A **template** (`templates/`) is a one-of-each scaffold for a top-level doc — no flavors, not validated, kept as the record of the doc's intended full form. A registry can rework either without contradicting the standard.
- **The property contract** is the one firm part — its canonical baseline is in `Schema.md` here and specified in [`EIDOS.md`](../EIDOS.md). Add your own via the `eidos-property` skill, which writes into your registry's `.eidos/Schema.md`.
- **Collections and flavors live in `Registry.md`.** `Specs` is the default collection, with a `full` (default) and a `micro` flavor — each a shape file named `<kind>.<flavor>.md`. Add a collection or a flavor with the `eidos-registry` skill, which also keeps the Registry's Top-Level and Collections index current. Each collection's per-item listing lives in a generated `index.md` inside its folder (`Specs/index.md`), rebuilt by `eidos-index` — there is no top-level `Domains.md`.
- **`user.md` and `gitignore` are the actor pieces.** `user.md` installs blank to `.eidos/user.md` — the personal, gitignored file that says who is in the seat; `gitignore` installs to `.eidos/.gitignore` and keeps `user.md` (beside it) out of version control. The dotless name here is so it isn't an active ignore inside the standard's own repo.
- **`README.template.md` is the registry's front door.** It installs to `<root>/README.md` — the thin, visible "start here" that points into `.eidos/Registry.md`. The `.template` name keeps it from shadowing this seed's own README.
