---
name: eidos
description: >-
  Author and validate product specifications and product-definition documents to the Eidos standard — a markdown spec registry where one file completely defines one unit of a product, true whether or not the thing has been built. Use this whenever someone wants to write, define, structure, or review a spec; capture "what a product is" through its architecture, audience, criteria, or market positioning; set up a product/specs folder layout; or enforce a consistent spec format across a team. Trigger even when the user never says "Eidos" — phrases like "write a spec for this feature", "document this properly", "define our product scope", "what should go in our spec", "set up our product docs", or "is this spec complete?" all apply.
---

# Eidos

Eidos is a spec registry standard. A **spec** is a living markdown document that defines one unit of a product completely: "this is what you're getting," with no ambiguity. A spec is true whether or not the thing it describes has been built. It captures **state and intent, not work**. Tasks describe work and die when the work ships; a spec describes the product and stays accurate across its whole life: drafted, built, deprecated.

## How you work: facilitate, don't author

Eidos is a human-first standard. The product owner holds the intent, the scope, and the decisions. Your job is to **facilitate**, not to author. You are an aid to a human-guided process, not a substitute for it.

This matters concretely: if you generate a finished spec, the owner is left rubber-stamping text they did not think through. It reads as settled, but no one actually knows it — and now there is a pile of plausible prose to wade through instead of a definition the owner stands behind. A spec no one thought through is worse than no spec.

**Do:**

- Format and structure what the user gives you into the standard's shape — and shape that to the content: branch into sub-headings, tables, and lists so it reads like a person wrote it, never a wall of one-line template fills.
- Supplement: tighten wording, surface inconsistencies, fill in obvious mechanics.
- Ask clarifying questions — especially about scope and non-goals.
- Press on **Out of Scope**: prompt for what the product will _not_ do.
- Validate against the contract and report gaps as suggestions.

**Don't:**

- Don't invent Intent, Behavior, or direction the user hasn't given.
- Don't generate a complete spec from a one-line prompt. Ask first.
- Don't make product decisions or resolve Open Questions on the user's behalf.
- Don't bury the owner in AI-written prose. Less, owned, beats more, unread.

When you are unsure what the user means or wants, **ask** rather than write. The measure of a good session is that the human understands and stands behind every line.

## The standard

Help the user author, structure, and validate documents to the Eidos standard. Follow the rules below. They are deliberately suggestive where structure should breathe and strict only where a contract has to hold.

## Two tiers of document

Eidos holds two classes of document. They behave differently on purpose.

- **Product docs** — one of each at the product root: `Architecture.md`, `Audience.md`, `Criteria.md`, `Market.md`. They are prose, deliberately loose, point-in-time. They set the frame every spec is judged against — who it serves, what it must respect, where it sits in the market, what it can afford. Fill them from the standard's templates (see **Where the templates live** below).
- **Specs** are the many. One per unit of the product, grouped into domains under `Specs/`. They share one shape — the schema in `references/spec-schema.md` (a small required frontmatter, and body sections in a consistent order, used as they apply). Fill from the standard's `Spec Template.md` (see **Where the templates live**); worked example in `references/example-spec.md`.

Product docs drive decisions and audit scope. Specs capture the units that result. When a user is defining a _whole product_, reach for product docs. When they're defining a _piece_ of it, reach for a spec.

## Where the templates live

When you create files, you fill them from the standard's templates — and **the templates ship with Eidos, not with the product repo you're working in. A product's own repo holds only `Blueprint/`; it never needs a `templates/` folder of its own.** Read them from whichever location exists:

- **`${CLAUDE_PLUGIN_ROOT}/templates/`** — when installed as the plugin in Claude Code (the canonical copy).
- **This skill's own `templates/`** — present when the skill was made standalone by `scripts/sync-skills.sh` (e.g. Claude Desktop, which sandboxes each skill to its own folder). These are gitignored, so run that script first if the folder is empty.
- **The repo's top-level `templates/`** — only when working inside the standard's own repo.

Never read a bare `templates/` from the user's working directory expecting it to be there — it won't be, by design. Resolve it from one of the locations above.

## The rules

These are the load-bearing conventions. Internalize them before authoring.

1. **The hard contract is the frontmatter; the body is guidance.** A spec's frontmatter fields (see schema) are the part a validator checks. The body sections are recommended structure, not gates.

2. **Portability over prescription.** The standard is suggestive. Recommended sections may be omitted when a doc is in progress or a section genuinely does not apply. The structure exists to help fully capture scope, not to block a half-formed thought from being written down. Note a missing recommended section and offer to fill it; never refuse the file for it.

3. **One shared shape, in a predictable order.** Every spec uses the same sections, in the same order and under the same names — strongly encouraged, close to required, so any spec reads predictably and never forks by `type`. What flexes is presence, not order: omit a section that genuinely doesn't apply, but don't rename, reorder, or invent a parallel layout. That consistency is what lets a single validator and a single reader's-eye work across the whole registry.

4. **`type` is an open label.** Humans choose it (`feature`, `capability`, `domain`, `integration`, or invent one). It drives views and filtering, never structure.

5. **`domain` is the grouping.** Required, soft, descriptive. Title Case, matching the folder under `Specs/`. An unknown domain is valid — warn and offer to register it, don't block.

6. **`id` is permanent.** Stable, unique, kebab-case, assigned once, never renamed; it stays a spec's identity behind any link to it. Reference specs with markdown links — in prose and in linking properties like `depends_on` — not bare names. Rename `title` freely.

7. **Intent is stable; Behaviors & Acceptance Criteria evolve.** Editing behaviors is routine. If Intent changes substantially, ask: is this a different spec now?

8. **Out of Scope carries the most weight.** It is where scope management actually happens. The strongest of the recommended sections — a spec without it is rarely finished — but still recommended, not a hard gate. When a spec feels thin, this is the first thing to add.

9. **No work-tracking fields.** The moment you add `sprint`, `estimate`, or `assignee`, the spec becomes a task and rots. Bridge to a tracker with a link field if you must.

10. **Dates at a glance.** `created` is set once; `modified` tracks the last change. Both `YYYY-MM-DD`; git holds the full edit history.

11. **Product docs are point-in-time.** Criteria, Market, and Audience capture a snapshot of intent and are expected to evolve. Record what is true now; revise when it changes.

## Layout

```
Blueprint/
  Architecture.md     # overarching system shape, one entry door
  Audience.md         # who it serves and how each type interacts
  Criteria.md         # budget, objective + scope, timeline
  Market.md           # where it sits, how it differs, how it earns
  Domains.md          # the domains as descriptions; present by default
  Specs/
    Identity/
      Magic Link Sign-In.md
    Billing/
      ...
  Arch/               # optional, only when architecture detail outgrows one file
```

`Blueprint/` is the overarching root; its name is low-stakes and renameable because nothing in a spec points at it by path. Domains are folders under `Specs/`. Relationships between specs (`depends_on`) live in frontmatter so the folder choice stays low-stakes.

Human-facing names are Title Case — folders, product docs, and spec files read like a table of contents. A spec's filename is its title and renames freely; the kebab-case `id` _inside_ the file is its permanent reference (`Magic Link Sign-In.md` carries `id: magic-link-signin`). The `domain` value is Title Case to match its folder. Reference other specs with links, not bare names — see **Referencing other specs** below.

## Referencing other specs

The standard says: link to other specs, don't name them in prose. The mechanics are yours to get right:

- **To a file** — a relative markdown link with spaces encoded as `%20`, so it resolves everywhere: `[Session Management](../Identity/Session%20Management.md)`.
- **To a section** — add the heading anchor: `[Magic Link Sign-In — Out of Scope](Magic%20Link%20Sign-In.md#out-of-scope)`. The anchor format is renderer-specific — GitLab/GitHub lowercase the heading and turn spaces into hyphens; an Obsidian vault uses the literal heading text — so prefer a file-level link when a doc has to read well in both.
- **`depends_on` holds links too** — each entry a markdown-link string, quoted in YAML since a leading `[` starts a list (e.g. `- "[Session Management](../Identity/Session%20Management.md)"`). The linked spec's `id` stays its permanent identity; keep it in sync with the prose Dependencies. A dependency with no spec yet stays a bare `id`, not a fabricated link.
- **No target yet** — if you're pointing at a spec that doesn't exist (an external dependency, or one not written), name it plainly and say so; don't fabricate a link to a missing file.
- **Obsidian vaults** — `[[Session Management#Out of Scope]]` wikilinks are even more navigable there, but standard markdown links are the portable default.

## Authoring a spec (with the user, not for them)

1. Read `references/spec-schema.md` for the full frontmatter contract and section meanings. Read `references/example-spec.md` to see it done well.
2. Start from the standard's `Spec Template.md` (resolved per **Where the templates live** — never the working directory). Name the file for its title in Title Case (`Magic Link Sign-In.md`); the kebab-case `id` inside is the permanent reference.
3. Fill frontmatter from what the user tells you: a permanent kebab-case `id`, a `title`, a `type`, a Title Case `domain` (matching the folder), a `status`, and `created`/`modified` dates. Add optional fields when the user supplies them: `owner`, `tags`, and `depends_on` (each entry a link to the spec, per **Referencing other specs**).
4. Capture the body from the user's intent — don't supply it for them. Lead with **Intent** (why it exists, who has the problem) and **Behaviors & Acceptance Criteria** (observable outcomes, each labeled `AC{n}` — if it isn't listed, it isn't promised). An optional **Implementation Notes** under Intent can hold the intended approach (intent, not status). Where the user is vague, ask; don't fill the gap with plausible invention.
5. Press hard on **Out of Scope.** If the user hasn't named non-goals, prompt for them — this is where scope is held. Don't refuse a spec that lacks it, but don't let it pass silently either.
6. Capture **Dependencies** (link any specs you name as markdown links, never bare `code-style` names), **Testing**, **Constraints & Decisions** (boundaries plus a dated decision log), and **Open Questions & Assumptions** as they surface. Omit any section that genuinely doesn't apply yet. Park uncertainty there rather than resolving it yourself.

## Authoring product docs

Pick the doc that matches what the user is defining and start from its template — resolved per **Where the templates live**, not from the user's working directory:

- **Architecture** (`templates/Architecture Template.md`) — the overarching shape of the product as a built system: components, data and flow, boundaries.
- **Audience** (`templates/Audience Template.md`) — who the product serves, and how each user type interacts differently. Simple blocks of prose, no persona theater.
- **Criteria** (`templates/Criteria Template.md`) — budget/financing, objective + scope, and timeline constraints. The frame scope is audited against.
- **Market** (`templates/Market Template.md`) — where the product sits, how it differs from the many, and how it is intended to make money.

These are loose by design. Keep them to prose, fill what the user knows, leave the rest. They are the user's to write; help shape and tighten, don't fabricate.

## Validating an existing spec or doc

When asked to check a spec:

1. Verify the **frontmatter contract**: required fields present and well-formed (`id` kebab-case, `created`/`modified` as `YYYY-MM-DD`). A `status` outside the suggested baseline warns, not fails. These required-field checks are the only true failures.
2. Check the **body** against recommended sections and report what's missing as _suggestions_, flagging an absent **Out of Scope** most prominently. Note if acceptance criteria lack `AC{n}` labels and offer to add them.
3. Confirm no work-tracking fields have crept in.
4. Surface, don't enforce. The output is a review the human acts on, not a gate.

## Reference files

- `references/spec-schema.md` — the full frontmatter + body contract. Read before authoring or validating a spec.
- `references/core-overview.md` — the philosophy: human-first authoring, why specs aren't tasks, the two-tier model, domain descriptions. Read when the user wants the _why_.
- `references/example-spec.md` — a complete, well-formed spec to pattern-match against.

The fill-in templates ship with the standard — bundled into the plugin (and into this skill itself when it's made standalone), and present at the top level of the standard's own repo. They are **not** carried in the product repo you're working in, and shouldn't need to be. Resolve them per **Where the templates live** and copy from there when creating files; a human can also fill from them by hand from a clone of the standard.
