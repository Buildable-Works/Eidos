# Example — a small subset of YouTube

A filled-in Eidos registry to read and pattern-match against. It models a deliberately small **subset of YouTube** — watching and resuming videos, running and following a channel — so the structure is recognizable. [`Blueprint/`](Blueprint) is the registry itself; this README sits outside it.

For what the pieces _are_ — registry, top-level docs, collections, shapes, flavors, Schema, personas — see the [root README](../README.md) and [`EIDOS.md`](../EIDOS.md). This file just walks the example.

```
example/
  README.md                  # this file — outside the registry
  Blueprint/                 # the registry (Blueprint is the default name; rename freely)
    README.md                # the registry's own "start here" front door
    .eidos/                  # the form layer (hidden): shapes, templates, personas, Schema, Registry, user, .gitignore
    Architecture.md  Audience.md  Criteria.md  Market.md   # the top-level docs
    Roadmap.md               # a custom top-level doc — free-form, no shape
    Specs/                   # the default collection
      index.md               #   generated index of the collection
      Playback/              #   ┐ domains — the Specs collection's grouping
        Watch a Video.md     #   │
        Resume Playback.md   #   │ (flavor: micro)
      Channels/              #   ┘
        Subscribe to a Channel.md
        Upload a Video.md
```

What to notice in this example:

- The four **top-level docs** ([Architecture](Blueprint/Architecture.md), [Audience](Blueprint/Audience.md), [Criteria](Blueprint/Criteria.md), [Market](Blueprint/Market.md)) frame the product; [Roadmap](Blueprint/Roadmap.md) is a custom one the registry added.
- The **Specs collection** holds the units, grouped into the **Playback** and **Channels** domains, listed in the generated [`Specs/index.md`](Blueprint/Specs/index.md).
- It offers two **flavors** — `spec.full` (default) and `spec.micro`. [Resume Playback](Blueprint/Specs/Playback/Resume%20Playback.md) carries `flavor: micro`, so it's checked against the lighter shape.
- [`.eidos/Schema.md`](Blueprint/.eidos/Schema.md) adds one **custom property**, `beta` — a registry extending the baseline without forking the standard.
- [`.eidos/personas/`](Blueprint/.eidos/personas) holds the **response contracts**, and [`.eidos/user.md`](Blueprint/.eidos/user.md) names the **actor** (here a technically-fluent product owner). `user.md` is normally gitignored; it's committed here only to show its shape.

To start your own registry, run the `eidos-init` skill — don't copy this one.
