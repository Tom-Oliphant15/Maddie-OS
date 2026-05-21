# Skill: Voice Notes

---
triggers:
  - "check my notes"
  - "process my notes"
  - "voice notes"
  - "voice note"
  - "add to notes"
type: Recipe
---

**Purpose:** Capture Maddie's solo thinking and route it into a living idea file per brand. Catches ideas before they evaporate.

---

## Context

*Load these files before running this skill:*

- [[Brain Directory]] — to identify which brand the note is for
- The relevant brand Brain file ([[Fade Golf]], [[Stride Clinics]], [[Fire & Earth Leamington]]) for context

---

## Quick Start

Two trigger paths:

1. **Otter recordings.** Maddie records a solo voice note via the Otter iOS app. Transcript lands in Google Drive (Otter's auto-export, or she shares the link). Maddie says "check my notes" or "process my notes" and the OS processes any new solo recordings.
2. **Inline notes.** Maddie says "add to notes: [thought]" in any conversation. The OS routes it to the right brand notes file.

---

## When to Use

- Maddie has dictated a solo thought (in-car, walking, between meetings)
- Maddie says "I had an idea about X" mid-conversation
- After a meeting or research session with takeaways that are not actions but are worth keeping

---

## Process

### 1. Identify the brand
Read the content. Route to one of:
- `Brain/Notes/Fade Golf Notes.md`
- `Brain/Notes/Stride Notes.md`
- `Brain/Notes/Fire & Earth Notes.md`
- `Brain/Notes/General Notes.md` (cross-brand or genuinely unscoped)

If unclear, ask Maddie before filing.

If the target Notes file does not exist, create it with the structure below.

### 2. Extract the ideas
A single recording often contains multiple ideas. Split into discrete ideas, each with:
- One-line title
- Detail (1 to 3 sentences from the source)
- Status: **Active** / **Parked** / **Done**
- Date captured

### 3. Cross-reference
Before adding a new idea, check the existing Notes file. If the idea is already there, update the existing entry rather than duplicating. If contradicting an existing idea, flag the conflict to Maddie.

### 4. File the ideas
Append to the relevant Notes file under the **Active Ideas** section. Format:

```markdown
### [Idea title]
*Captured: YYYY-MM-DD. Status: Active*

[Detail in 1 to 3 sentences.]
```

### 5. Mark the source as processed
If the source was an Otter recording, note the Otter ID in the Notes file footer so it does not get reprocessed. If inline, no action needed.

### 6. Report back
Tell Maddie: which Notes file was updated, how many ideas added, any conflicts flagged.

---

## Notes File Structure (when creating fresh)

```markdown
# [Brand] — Notes

*Living idea file for [Brand]. Active ideas grow and shrink as work progresses.*

## Active Ideas

## Parked Ideas

## Resolved (Done)

---

## Processed Otter Recordings
- (Otter IDs listed here so they are not reprocessed)
```

---

## Cross-Integration

When Maddie processes a meeting summary or campaign result that resolves an Active Idea, move it to **Resolved**. Do not delete.

When Daily Briefing runs, surface any Active Ideas that have been sitting >2 weeks without movement. Critical persona: ask "are we doing this or parking it?"

---

## Rules

- Never delete ideas. Move to Parked or Resolved.
- Always cross-reference before adding to avoid duplicates.
- Route to brand-specific files where possible. General Notes is the fallback, not the default.
- No em or en dashes in output.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-18 | Skill stub created during Maddie OS scaffold. Adapted from Tom OS Voice Notes. To be fleshed out during build week. |
