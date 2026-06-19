# standard-seed

The canonical Eidos baseline — the **form** a new registry starts from. `eidos-init` copies this into a registry's hidden `.eidos/` folder; from there it belongs to the registry, to use as-is or extend.

```
standard-seed/
  shapes/          # the body template for each kind of document
    Spec.md        # the Spec shape — sections, order, and guidance
    Architecture.md
    Audience.md
    Criteria.md
    Market.md
    Domains.md
  Schema.md        # the canonical property contract (the "Eidos Canonical" block)
  Registry.md      # the Eidos version a new registry targets
```

This is the public, front-facing home of the canon. If you want to read what Eidos ships by default — or propose a change to it — this is the place.

- **To change your *own* registry, edit its `.eidos/`, not this.** This is the standard's baseline, versioned with the standard; your registry's copy is yours.
- **The shapes document themselves.** [`EIDOS.md`](../EIDOS.md) lays out the *rules* for using a body; the shape files here are where the *specific sections* and their guidance live, so a registry can rework its shape without contradicting the standard.
- **The property contract** is the one firm part — its canonical baseline is in `Schema.md` here and specified in [`EIDOS.md`](../EIDOS.md). Add your own via the `eidos-property` skill, which writes into your registry's `.eidos/Schema.md`.
