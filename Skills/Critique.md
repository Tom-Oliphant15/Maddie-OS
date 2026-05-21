# Skill: Critique

---
triggers:
  - "critique this"
  - "run critique on"
  - "review and improve"
  - "/critique"
type: Multi-Agent Review
---

**Purpose:** Take a finished deliverable and run it through an iterative 4-agent improvement chain. Each agent reviews and improves the previous agent's work, producing a progressively stronger output. Returns the final deliverable plus a change log showing exactly what each agent changed, so Maddie can review and revert individual changes if needed.

Different from [[Grill Me]]:
- **Grill Me** = before the work is finished. Tests plans and decisions.
- **Critique** = after the work is finished. Iteratively improves a near-final deliverable.

---

## Context

*Load these files before running this skill:*

- The deliverable being critiqued (path provided by Maddie)
- Any reference files she points to that provide context (brand guidelines, voice file, campaign brief, audience persona)
- The relevant brand voice file from `Brain/Brand Voices/` if the deliverable is brand-specific
- The relevant brand guidelines from `Brain/Brand Guidelines/` if the deliverable has visual or written-format implications

This skill is input-driven. No standing context required.

---

## Quick Start

Maddie says:
- "critique this Stride campaign brief"
- "run critique on the Fade Golf landing page copy"
- "review and improve this email to Luke"
- "/critique [filepath]"

---

## When to Use

Run on any finished deliverable before it ships:

- **External-facing** — campaign briefs going to Tom or Harry, ambassador briefs going to Luke or Katie, landing page copy, ad copy, monthly reports, emails to suppliers or partners
- **Strategic** — positioning docs, new service launches, partnership pitch one-pagers
- **Internal** — meeting agendas for important calls, written follow-ups, weekly Slack reports she wants to land well

Do NOT use for:
- Quick throwaway drafts (single Slack reply, internal note)
- Work-in-progress still being designed (use [[Grill Me]] or direct iteration)
- Trivial edits (just edit them)

---

## /goal integration

```
/goal output runs all 4 agents in order on a working copy not the original, every change is logged with a unique ID + location + reason, flagged issues are surfaced separately for Maddie's judgement, final deliverable + change log + clear ready-to-ship-or-not recommendation. Stop after 1 full pass.
```

---

## How It Works

A 4-agent iterative chain. Each agent reads the previous agent's output and improves on it. They do not work in parallel. Every change is logged.

| # | Agent | What It Does |
|---|---|---|
| 1 | **Structure & Logic** | Fixes structural issues, logic gaps, missing sections, weak arguments, ordering problems |
| 2 | **Clarity & Tone** | Improves clarity, simplifies language, fixes tone, audience fit, flow. **Anchors on the relevant brand voice file.** |
| 3 | **Brutal Critic** | Asks the hard questions. Stress-tests every claim, challenges assumptions, plays devil's advocate, identifies what a hostile reader would attack |
| 4 | **Accuracy & Edge Cases** | Verifies facts, checks numbers, catches edge cases, final polish. **Includes em/en dash check, brand spelling, UK English.** |

Each agent logs every change with enough detail that Maddie can identify and revert any specific edit.

---

## Process

### Step 1: Gather Inputs

Confirm with Maddie:
- **What is the deliverable?** (file path)
- **What is it for?** (campaign launch, ambassador brief, monthly report, partner email)
- **Who is the audience?** (Tom / Harry / Luke / a supplier / Stride patients / Fade Golf members)
- **Which brand?** (Fade Golf / Stride / Fire & Earth, or cross-brand). Determines which voice file Agent 2 anchors on.
- **What's the success criteria?** (what does "good" look like for this?)
- **Any constraints?** (length, tone, must-include points, must-avoid points, ASA disclosure if ambassador-facing)

Save these as the critique brief.

### Step 2: Create a working copy

Copy the deliverable to a working location so the original is preserved:
- Original: `[original path]`
- Working copy: `[original path]` with ` - Critique Working` appended before the extension

All agents work on the working copy. The original stays untouched until Maddie approves the final.

### Step 3: Run Agent 1 — Structure & Logic

**Mindset:** "Does this make sense structurally? Is anything missing? Is the argument logical? Does it flow in the right order?"

**Checks:**
- Clear beginning, middle, end?
- Information in the right order for the audience?
- Obvious gaps (missing sections, unanswered questions, unfinished thoughts)?
- Do the points actually support the conclusion?
- Redundant or repetitive sections?
- Information that doesn't belong?
- Does the structure match the deliverable type? (campaign brief = goal → audience → message → channel → measure; ambassador brief = ask + deadline + assets + disclosure)

**Action:** Make structural improvements directly to the working copy. Log every change.

### Step 4: Run Agent 2 — Clarity & Tone

**Mindset:** "A reader in the target audience is reading this. Are they going to understand it? Does the tone match the brand voice? Is anything ambiguous?"

**Brand voice anchor.** Before reading the deliverable, Agent 2 loads `Brain/Brand Voices/[brand] voice.md`. Every clarity/tone change must respect the voice file.

**Checks:**
- Language appropriate for audience's level?
- Ambiguous phrases ("appropriate", "as needed", "when relevant")?
- Long sentences that should be split?
- Jargon without explanation?
- Tone matches the brand voice file and the relationship (formal/informal, warm/direct)?
- Smooth flow, working transitions?
- Any paragraph cuttable without losing meaning?

**Action:** Rewrite for clarity and on-brand tone. Log every change.

### Step 5: Run Agent 3 — Brutal Critic

**Mindset:** "I am hostile to this deliverable. I want to find every weak point, every unsupported claim, every gap a smart adversary would exploit. I am Tom on a bad morning, Harry's investor brain, the ambassador who reads it twice and finds the holes."

**Checks:**
- Weakest argument in this document?
- What question would a hostile reader ask that isn't answered?
- What claim is made without evidence?
- What assumption might not hold?
- Where does Maddie's bias show through?
- What would the opposing view say? Is it addressed?
- What's conveniently left out?
- What promises can't actually be kept (delivery, audience reach, results)?
- Where does the document overreach?
- What would cause Tom or Harry to push back?

**Action:** Strengthen weak points, add evidence, address counterarguments, qualify overreaches, cut anything indefensible. If a claim can't be strengthened, flag it for Maddie's call. Log every change.

### Step 6: Run Agent 4 — Accuracy & Edge Cases

**Mindset:** "Final pass. Every fact must be checked. Every number verified. Every edge case considered. Every CLAUDE.md rule respected."

**Checks:**
- All figures, dates, names, brand spellings correct? (Stride Clinics not Stride Clinic, Fire & Earth Leamington not F&E in external copy, Fade Golf not Fade)
- Spelling, grammar, punctuation (UK English)?
- **Em / en dashes? None allowed.** Use commas, periods, colons, parentheses, or "to" for ranges.
- Formatting consistency (bullets, headings, table alignment)?
- Edge cases (what if the recipient misreads, what if numbers change, what if the deadline slips)?
- Ambiguous references ("the document", "last week's meeting" with no date)?
- ASA disclosure correctness if any influencer/ambassador content?

**Action:** Final corrections and polish. Log every change.

### Step 7: Produce the Change Log

At the top of the final working copy (or as a separate `[filename] - Critique Change Log.md` saved alongside), produce the change log in this exact format:

```markdown
# Critique Change Log

**Deliverable:** [filename]
**Purpose:** [what it's for]
**Audience:** [who it's for]
**Brand:** [Fade Golf / Stride / F&E / Cross-brand]
**Run date:** [YYYY-MM-DD]

---

## Summary

| Agent | Changes | Key Impact |
|---|---|---|
| 1. Structure & Logic | [count] | [one-line summary] |
| 2. Clarity & Tone | [count] | [one-line summary] |
| 3. Brutal Critic | [count] | [one-line summary] |
| 4. Accuracy & Edge Cases | [count] | [one-line summary] |

---

## Agent 1 - Structure & Logic

| # | Change | Location | Reason |
|---|---|---|---|
| 1.1 | [concise description] | [section / heading / paragraph reference] | [why] |

## Agent 2 - Clarity & Tone

| # | Change | Location | Reason |
|---|---|---|---|

## Agent 3 - Brutal Critic

| # | Change | Location | Reason |
|---|---|---|---|

## Agent 4 - Accuracy & Edge Cases

| # | Change | Location | Reason |
|---|---|---|---|

---

## Flagged Issues (Unresolved)

- [issue] - [which agent raised it] - [why it couldn't be fixed]

---

## Change ID Reference

Each change is tagged `[AgentNumber.ChangeNumber]`. To revert, say "revert change 2.5".
```

### Step 8: Present to Maddie

Deliver:
1. **File path** of the improved working copy
2. **Change log** shown inline for quick review
3. **Flagged issues** needing her judgement call
4. **Recommendation**: ready to ship / needs another round / needs her input on flagged items

**Do not overwrite the original.** She reviews and explicitly approves before the working copy replaces the original.

---

## Rules

- **Never work on the original file.** Always use a working copy.
- **Every change must be logged** with unique ID, description, location, and reason. No silent edits.
- **Flag, don't guess.** If an agent can't fix something without Maddie's judgement, it goes in Flagged Issues.
- **Chain order matters.** Run agents sequentially. Do not parallelise.
- **One pass only.** Single-pass chain, not multi-round loop. If more work is needed after Maddie reviews, either re-run or make targeted edits.
- **Stay in scope.** Agents improve the deliverable, they don't expand scope or change the purpose.
- **Respect the brand voice.** Agent 2 must load the brand voice file. Critiquing Fade Golf copy as if it were Stride is a defect.
- **Em / en dash hard rule** at Agent 4. CLAUDE.md paste-safe rule applies to every Maddie OS output.

---

## Output Location

- **Working copy** saved next to the original with ` - Critique Working` appended before the extension
- **Change log** either at the top of the working copy OR as a separate `[filename] - Critique Change Log.md` in the same folder (Maddie's preference; default to separate file for cleaner working copy)

---

## Anti-Patterns

- Running Critique on a campaign brief that's still in design phase. Use [[Grill Me]] instead.
- Skipping the brand voice file load at Agent 2 because "I know the brand". The voice file is canonical.
- Letting Agent 3 turn into a rewrite. Brutal Critic strengthens weak points, it does not rewrite from scratch.
- Overwriting the original before Maddie has reviewed.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-21 | Initial creation, adapted from Tom OS master Critique. Agent 2 anchored on Maddie's `Brain/Brand Voices/` files. Agent 4 includes the em/en dash hard rule and brand spelling check. Use cases reframed for marketing deliverables (campaign briefs, ambassador briefs, landing pages, ad copy, monthly reports). |
