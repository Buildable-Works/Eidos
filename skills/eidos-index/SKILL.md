---
name: eidos-index
description: >-
  Build or refresh a collection's `index.md` in an Eidos registry — the generated leaf that lists a collection's items so a human or agent can navigate without scraping the tree. Use when someone wants to "regenerate the index", "rebuild the specs index", "update Specs/index.md", "reindex the registry", "map the registry", says an index is stale, or after items have been added, renamed, moved, or removed. It reads the registry's declared collections, asks which to re-index, walks each collection's one-level sub-folders, and rewrites its `index.md` wholesale — each item a markdown link with a one-line summary drawn from its Intent, grouped by sub-folder (Specs by domain) or flat. Replaces the former `eidos-domains` skill; there is no top-level `Domains.md`, and descriptions live in the Registry, so the index is purely the listing. Regenerable and never gates.
---

# Eidos Index

Keep each collection's **`index.md`** current — the leaf a human or an agent reads to find an item without scraping the tree. An index lives inside its collection's folder (`Specs/index.md`), lists the collection's items grouped under their one-level sub-folders (Specs by domain) or flat, and is **fully generated**: a markdown link per item with a one-line summary from its Intent. Descriptions live in `.eidos/Registry.md`; this skill rebuilds only the listing.

This generalizes the former `eidos-domains` skill — every collection gets the same treatment, not just Specs.

## How you work: derive, don't author

The index is navigation derived from the items, so regenerating it is safe and mechanical. Two things stay the human's:

- **Descriptions.** A collection's description, and its sub-folder (e.g. domain) descriptions, live in `.eidos/Registry.md`, written once by the owner — the index does not carry them. If a sub-folder has no description in the Registry, note it and ask the owner; don't invent one.
- **The items themselves.** A summary distills an item's _own_ Intent into one line; it never adds meaning the item doesn't have. The item is the source of truth; the index just points at it.

## Where things are

- The collections are declared in `.eidos/Registry.md` (the `## Collections` section), each with its folder.
- Each collection's items live under `<Collection>/`, optionally in one level of sub-folders (`Specs/<Domain>/`).
- Each collection's index is `<Collection>/index.md`.
- This needs a set-up registry. If there's no `.eidos/`, it isn't an Eidos registry yet — offer `eidos-init`.

## Procedure

1. **Read the actor** (`.eidos/user.md`) and the declared collections (`.eidos/Registry.md`).
2. **Ask which collections to re-index.** With `AskUserQuestion`, offer the declared collections (multi-select) — default to all, or to the ones whose folders have changed. Re-indexing everything is fine for a small registry; the prompt matters when there are several.
3. **For each chosen collection, walk its folder.** Read its one-level sub-folders (the grouping) and the items in each — or the items directly in the collection folder, if it's flat. For each item read its `title`, path, and `## Intent`.
4. **Summarize each item.** Distill its Intent to one plain line — the first sentence tightened, or a faithful one-line paraphrase. One line, never beyond what the Intent says.
5. **Rewrite `<Collection>/index.md` wholesale.** It is fully generated — no hand-written prose to preserve — so rebuild the whole file:
   - An H1 of the collection name (`# Specs`) and the marker comment `<!-- eidos-index: <Collection> (regenerated) -->`.
   - **Grouped collection:** one `##` per sub-folder, then a bullet per item — `- [Title](<Sub-folder>/<File>.md) — summary`. Links are **relative to the collection folder** (`Identity/Magic%20Link%20Sign-In.md`, not `Specs/Identity/…`), built in the registry's naming convention (read `naming` from `.eidos/Registry.md`): encode spaces as `%20` in a Title Case registry; a TitleCase or kebab-case one has none.
   - **Flat collection:** no `##` groupings — just the bullet list of items under the marker.

   ```markdown
   # Specs

   <!-- eidos-index: Specs (regenerated) -->

   ## Identity
   - [Magic Link Sign-In](Identity/Magic%20Link%20Sign-In.md) — passwordless sign-in by an emailed single-use link.
   - [Session Management](Identity/Session%20Management.md) — keep a signed-in user across visits, and let them end access on a device.
   ```
6. **Reconcile against the Registry.**
   - A sub-folder (domain) with items but **no description in the Registry** — note it and ask the owner to add one to the Collections section; don't invent it.
   - A sub-folder described in the Registry but **with no items** — dangling; flag it.
7. **Report** — the collections and items indexed, any summaries you'd like the owner to sharpen, and any sub-folder still needing a description in the Registry.

## Notes

- Regenerable and idempotent: running it again yields the same file (plus any new items). It never gates — an index annotates and navigates, it doesn't validate.
- More than one level of sub-folders under a collection is discouraged (see EIDOS.md). If you find deeper nesting, index the first level and flag the rest for the owner.
- This is the leaf half of Eidos navigation; the top index is `.eidos/Registry.md` (Top-Level documents + Collections), kept by `eidos-registry`, with the visible root `README.md` as its door. The property/shape form lives in `.eidos/` and is handled by the other skills.
