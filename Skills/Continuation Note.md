# Skill: Continuation Note

---
type: Recipe
triggers:
  - "save this for later"
  - "I want to come back to this"
  - "park this"
  - "pick up where we left off"
  - "/continue"
---

**Purpose:** Save a structured continuation note when Maddie wants to pause work mid-task and resume in a fresh session without losing context.

---

## When to Use

- Maddie says "save this for later", "park this", "I want to come back to this", or similar
- Maddie says "pick up where we left off on X", find and resume from the existing note
- **Never create automatically** as part of Session End wrap-up. Only when she explicitly asks.

---

## Where to Save

All continuation notes save to `Information/Continue - [Topic].md` inside the Maddie OS root (`~/Documents/Maddie OS/Information/`).

Never embed inside Status.md or any other file. Continuation notes must be standalone.

---

## Format

```markdown
# Continue: [Task Name]

**Started:** [YYYY-MM-DD]
**Brand:** [Fade Golf / Stride / Fire & Earth, or "Cross-brand"]

## Goal
[What we're trying to achieve, one sentence]

## Progress So Far
- [What has already been done]

## Key Decisions Made
- [Any decisions taken that the next session must know about]

## Files in Play
- [Exact paths of files being created or edited]

## Next Step
[The very first action to take when resuming, specific enough to act on immediately without re-reading the whole conversation]

## Open Questions
- [Anything unresolved that needs a decision before work can continue]
```

---

## On Resuming

When Maddie says "pick up where we left off on X" or similar:
1. Find the relevant `Information/Continue - [Topic].md` file
2. Read it in full
3. Resume from the Next Step without re-asking for context she has already provided

---

## On Completion

When the task described in a continuation note is finished, **delete the note immediately**. Continuation notes are temporary, not permanent records. Stale ones must not accumulate.

---

## Rules

- Never create automatically as part of Session End wrap-up. That process updates Status.md and Tasks.md only.
- Never embed inside Status.md or any other doc. Must be a standalone file in `Information/`.
- Always delete on completion.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-21 | Initial creation, adapted from Tom OS master Continuation Note. Save path simplified to single Maddie OS location (no project-vs-OS-level branching since Maddie operates in a single OS). |
