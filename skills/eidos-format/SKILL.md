---
name: eidos-format
description: >-
  Reshape an existing rough draft — a brain-dump, rough notes, or half-formed prose — into the Eidos spec shape, preserving the author's own words and adding nothing. Use when someone has already written something and wants it organized, formatted, tidied, cleaned up, or "made to conform" to the shape — e.g. "I brain-dumped a spec, format it", "organize these notes into the Eidos shape", "clean up this spec", "structure what I wrote", "give my draft a once-over and format it", "make this match the template". This is a formatting and organizing pass within a single file, not authoring: it moves and shapes the content that is already there. To develop new content with you (questions, scope-pressing, supplementing), use `eidos`; to scaffold an empty registry, use `eidos-init`; to upgrade versions, use `eidos-migrate`.
---

# Eidos Format

Take a file someone has already written — a brain-dump, rough notes, half-formed prose — and reshape it into the Eidos spec shape. You **organize and format**; you do not author. The thinking is already on the page; your job is to give it the registry's structure and make it read well, while keeping the author's words and meaning intact.

This is the companion to `eidos`, which develops content _with_ the user — asking, supplementing, pressing on scope. Reach for `eidos-format` when the content already exists and the user just wants it shaped; reach for `eidos` when there is thinking still to be done.

## The one rule: preserve, don't pad

The author's words carry their intent. Move them into the right place, fix the obvious formatting, and stop.

- **Keep their wording.** Relocate sentences into the section they belong in; tidy grammar and markdown; do not rewrite their voice or inflate three words into a paragraph.
- **Add nothing of substance.** No invented behaviors, intent, decisions, scope, or acceptance criteria. The product decisions that aren't on the page are not yours to make.
- **Surface gaps; don't fill them.** Omit sections that genuinely don't apply (no Open Questions heading when there are none) — the shape is a framework, not a checklist. For a section that clearly _should_ have content but doesn't — Out of Scope most often — keep the heading with a short `<!-- TODO: … -->` and call it out, rather than papering over it with plausible prose. An honest hole beats invented content.
- **Mark anything you inferred.** If you guess a `title`, or group a loose sentence under a heading you picked, flag it so the user can confirm or correct.

A formatting pass that quietly adds content is worse than none: the user stops trusting that the words on the page are theirs.

## Read like a human would read it

Shape the content; don't pour it into a form. The recommended sections are a scaffold — reshape within and beneath them so the result reads like a person wrote it:

- Break rich content out of a single line. A data model belongs in a **table**, a sequence in a **numbered list**, an enumeration in a **bulleted list**.
- Add your own `####` sub-headings inside a section when it has internal structure.
- Keep acceptance criteria short and checkable. When an AC has rich detail behind it, state the AC briefly and put the detail in a table or sub-section the AC points to — never cram `AC1: create X entity with a, b, c, d, e` onto one line.
- Turn references to other specs into markdown links — `[Title](Title%20With%20Spaces.md)`, a `#heading` for a section — never bare `code-style` names. Converting a name into a link is formatting, not adding content, so it's squarely in scope.

## Where the form lives

This skill reads the target shape from the **registry's own `.eidos/`** — it does not carry a template of its own. The file you're reshaping is in the user's project; so is the shape you reshape it toward:

- **`.eidos/shapes/Spec.md`** — the body shape, for a spec. For a product doc, the matching shape (`Architecture.md`, `Audience.md`, …).
- **`.eidos/Schema.md`** — the property contract, for the frontmatter.

Find `.eidos/` at the registry root in the working directory (usually `Blueprint/.eidos/`). **If there is no `.eidos/`, the registry isn't set up — offer `eidos-init` before reshaping**, so you're shaping toward the registry's real form (which may include custom properties or an adjusted section set), not a guess.

## Procedure

1. **Read the whole file first, as-is.** Understand what the author means before moving anything.
2. **Get the shape from the registry.** Open `.eidos/shapes/Spec.md` for the recommended sections, in order, and `.eidos/Schema.md` for the frontmatter contract. For a product doc, use the matching shape instead.
3. **Sort the existing content into sections, using their words.** Intent; Open Questions & Assumptions; Behaviors & Acceptance Criteria; Out of Scope; Dependencies; Testing; Constraints & Decisions. A loose sentence about what it won't do goes to Out of Scope; an uncertainty goes to Open Questions; an observable outcome becomes an `AC{n}:`.
4. **Format for readability, not shape-fidelity.** Tables for data models, lists for enumerations, `####` sub-headings where a section has internal structure. Keep ACs short and labeled; push rich detail into a table or sub-section the AC references.
5. **Fill only derivable frontmatter.** Generate the frontmatter keys from `.eidos/Schema.md`'s required properties; fill `title` from the document's heading and `created`/`modified` to today. Leave `id`, `owner`, `domain`, `status`, and any custom-required value for the user where you can't derive them honestly — don't guess a `status`.
6. **List the gaps and your changes — don't act on them.** The recommended sections left empty (Out of Scope first), anything ambiguous, and any structure you inferred. These are questions for the user, not edits you make silently.
7. **Hand back the reshaped file plus that short list.** The user confirms, fills the gaps, and can take it to `eidos` for deeper work.

## Scope of this skill

- **In scope:** reorganizing and formatting content that already exists, within one file; light grammar and markdown cleanup; readability.
- **Out of scope:** inventing content (use `eidos` to develop it with the user), scaffolding a new registry (`eidos-init`), version migration (`eidos-migrate`).
- If a single dump clearly covers several units of the product, don't silently split it into multiple specs — point it out and ask how the user wants it divided.
