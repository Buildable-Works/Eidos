---
name: eidos-property
description: >-
  Add, rename, or retire a custom property in an Eidos registry's Schema, and backfill it across the existing items. Use whenever someone wants a new field on their items — "add a `team` field to every spec", "we need to track a review date", "I want a risk property", "every entry should have an owner team" — or wants to rename or remove a custom property they added before. This is the only correct way to extend a registry's frontmatter contract: it presses the owner to decide the property's type, meaning, and whether it's required (not just a name), writes it into `.eidos/Schema.md`, and updates every existing item across the registry's collections. It does not touch the Eidos canonical properties — those move with the standard's version (use `eidos-migrate`).
---

# Eidos Property

Extend a registry's property contract — the right way. A custom property is added to `.eidos/Schema.md`, decided in full (name, type, required, meaning), and then **backfilled across every existing item** so the registry stays consistent. The Schema is registry-wide: it governs the frontmatter of every item in every collection — a spec is the common one, but the contract is the same for any collection's entries. Renaming and retiring a property are the same move in reverse.

This is the only place a registry's frontmatter contract grows. The `eidos` skill authors and validates against the Schema; this skill _changes_ the Schema's custom block and reconciles every item to it.

## How you work: press the owner to decide

A property nobody thought through is like an item nobody thought through — it reads as meaningful while no one actually knows what it holds. So you do **not** invent properties or guess their shape. Before writing anything, get the owner to decide all four:

- **name** — the frontmatter key. Lowercase, words joined by underscores, matching the canonical style (`owner`, `depends_on`). Short and stable.
- **type** — from the set Obsidian uses: **Text, List, Number, Checkbox, Date, Date & time**. If the owner wants something richer than one of those — a structured object, an enum with behavior — that almost belongs in the body (a shape), not a property. Say so.
- **required** — is every item expected to carry it? Required means a validator will treat its absence as a real gap _within this registry_.
- **meaning** — one line: what it holds and why. This is what stops the property from rotting into a mystery field.

If the owner only offers a name, ask for the rest. Don't fill them in yourself.

## Boundaries

- **Custom block only.** You edit `## Custom Registry Properties` in `.eidos/Schema.md`. Never touch `## Eidos Canonical` — those are the standard's, and they move with the version (`eidos-migrate`). If the owner wants to change a canonical property, that's a standards change, not a registry customization; redirect.
- **Needs a registry.** Read `.eidos/Schema.md` from the registry root (usually `Blueprint/.eidos/`). If there is no `.eidos/`, the registry isn't set up — offer `eidos-init` first.
- **Don't silently drop values.** Retiring or renaming a property touches real data in real items. Surface what's there before changing it.

## Adding a property

1. **Decide the four** (above) with the owner.
2. **Write the row** into `## Custom Registry Properties` in `.eidos/Schema.md`:

   ```markdown
   | name | type | required | meaning                     |
   | ---- | ---- | -------- | --------------------------- |
   | team | Text | no       | Owning team, for filtering. |
   ```

   (Create the table under the heading if it's the first custom property; replace the commented example.)
3. **Backfill the items.** Read the collections from `.eidos/Registry.md`, then walk every item across them — the `Specs` collection's specs, and any other collection's entries:
   - **Required** — add the key to each item's frontmatter with an empty or owner-supplied stub value, so each is conformant and the owner can fill it. Because new items are generated from the Schema, only the pre-existing ones need this.
   - **Optional** — offer to add the empty key to existing items, but don't force it; an optional property may simply be absent.
4. **Report** — the row added, and the list of items touched (with which still need a value filled).

## Renaming a property

1. Confirm the new name with the owner (same naming rule).
2. Update the `name` cell in `.eidos/Schema.md`.
3. Rename the key in every item's frontmatter, **carrying the value across unchanged**.
4. Report the items touched. The property's meaning and data are unchanged — only the key moved.

## Retiring a property

1. **Surface first.** Find every item that carries the property and show the owner the values that would be lost. Ask whether to fold them somewhere (e.g. into the body) or deliberately drop them.
2. Remove the row from `## Custom Registry Properties`.
3. Remove the key from every item's frontmatter, once the owner has agreed to let the values go.
4. Report the items touched and anything carried over.

## After

The registry's contract and its items are back in sync. From here, `eidos` validates against the updated Schema — a required custom property now counts among the fields it checks, surfaced and added with a note where an item is missing it, never failing the file.
