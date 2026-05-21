# OS Health Line Format

Reference for the metadata-only line appended to `Reviews/OS Health/current.md` in Step 7 of Session End.

---

## Privacy boundary (hard rule)

No content from the session. Not campaign briefs, not voice notes, not emails read, not draft copy, not personal details about colleagues, clients, or patients. Metadata about what kinds of things happened, never the substance.

---

## Line template

```markdown
### YYYY-MM-DD HH:MM, Session End

**Duration:** Xh Ym (or "unknown")
**Skills fired:** [list, comma-separated]
**Files updated:** [count by type, e.g. "Brain: 2, Information: 1, Status: 1, Tasks: 1, Reviews: 1"]
**Errors during session:** [count, or "none"]
**L3 escalations:** [count, or "none"]
**Goal status (this skill):** met / partial [one-line reason if partial]
```

---

## Field rules

**Duration anchor:**
- If the daily log has a `## Morning Briefing (HH:MM)` header, use that time as start. Duration = current UK time minus that timestamp.
- If no morning briefing (Maddie started mid-day), use the timestamp of the first session block already in `## Sessions`, if any.
- If neither exists, write `Duration: unknown` rather than guessing.

**Skills fired:** Use the list compiled during Step 1's conversation scan. Only skills that produced output count, not skills mentioned in passing.

**Files updated:** Counts by top-level folder type, derived from `git status --porcelain` after staging.

**Errors / L3 escalations:** Counts only. No details, no file names.

**Goal status:** Walk the `/goal` checklist at the top of the skill. If all met, `met`. If one or two slipped (e.g. push failed and we are in L4 freeze), `partial` plus a one-line note on what broke.

---

## Worked example

```markdown
### 2026-05-21 17:42, Session End

**Duration:** 6h 07m
**Skills fired:** Daily Briefing, Campaign Brief Expander, Voice Notes
**Files updated:** Brain: 1, Information: 2, Status: 1, Tasks: 1, Reviews: 1
**Errors during session:** none
**L3 escalations:** none
**Goal status (this skill):** met
```
