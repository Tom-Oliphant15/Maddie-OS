# Skill: Session End

---
triggers:
  - "done"
  - "I'm done"
  - "that's it"
  - "wrap up"
  - "finished for now"
  - "session end"
  - "see you tomorrow"
  - "ok done for today"
type: Lifecycle
---

**Purpose:** Close out a working session. Update Status.md, Tasks.md, today's daily log, write a metadata-only line to OS Health, push the lot to GitHub so Tom can manage from Australia.

The OS's most-fired skill after Daily Briefing. Every session ends with this.

---

## Context

*Load these files before running this skill:*

- [[Status]] for current state to update
- [[Tasks]] for completed / new items
- [[Brain Directory]] for verification step

---

## Quick Start

Maddie says "done", "I'm done", "that's it", "wrap up", "finished for now", "session end", "save and close".

The skill detects whether real work happened. If yes, runs the full close-out. If the session was a brief question or chat, skips most of it but still ensures git is clean before exiting.

---

## /goal integration

Set goal at start:

```
/goal .install-state.json is committed, today's daily log has a session entry, any tasks completed in this conversation are moved to Done in Tasks.md, Status.md last-updated is today, git status is clean, latest commit pushed to origin/main returns success. Stop after 8 turns if not met.
```

The 8-turn cap is enough for a normal session-end. If we hit it, something is genuinely stuck.

---

## Process

### 0. Pre-check, install must have run at least once

If `.install-state.json` is missing from the OS root, the OS has never been installed and there is nothing structural to update or push. Tell Maddie:

> Looks like the OS hasn't been installed yet. Run /install first, then come back to this when you're done.

Then stop. Do not run any of the steps below.

### 1. Detect whether full close-out is needed

Scan the conversation for any of:
- File edits (Edit, Write tool calls)
- Skill runs with output (Campaign Brief Expander, Cross-Platform Repurposer, Data Pull, Voice Notes, Learning)
- Task references (anything that touched Tasks.md content)
- New campaigns, briefs, or briefs flagged

**If none:** session was casual chat. Skip to step 8 (git-clean check only).
**If any:** continue with full close-out.

### 2. Update Status.md

For each significant thing that happened in the session:

- **Completed task in a "This Week's Priorities" row:** mark Status as `Done` and move the row to a "Recently Completed" section if one exists, or add the section at the bottom.
- **Brand-specific update** (e.g. new Stride campaign launched, Fade Golf filming complete): update the brand's row in the "Active Brands" table.
- **New open action discovered:** add to the "Open Actions" table.

Update the "Last updated" date at the top of `Status.md` to today's UK date.

**Critical persona check before writing:** if Maddie said something contradicting an existing Status entry, flag and ask before overwriting.

### 3. Update Tasks.md

- Move completed tasks from `In Progress` to `Done`. Never delete.
- Add new tasks discovered in the session under the correct brand section.
- Update `Blocked` if the blocker shifted (resolved → move out of Blocked; new blocker → into Blocked).

### 4. Append to today's daily log

File: `Reviews/Daily/YYYY-MM-DD.md` (UK date).

Full block template, three worked examples (substantive / voice-note / casual), and the Top 3 carry-over algorithm are in [[daily-log-entry-format]]. The block always sits inside the `## Sessions` section so the file stays parseable.

**Critical persona:** if Maddie's Top 3 from this morning's briefing had three items and only one is done, surface the carry-over in the **Next** line per the template. Do not silently lose her Top 3.

### 5. Update Brain Directory if files were created, moved, renamed, or deleted

```bash
git status --porcelain Brain/ | head
```

Any line with `??` (untracked, new file), `A` (added), `D` (deleted), `R` (renamed), or `M` (modified) in the `Brain/` tree counts. The earlier filter that only matched `A|D|R|M` missed untracked new files, which is the most common case for a new Brain file Maddie created mid-session.

If anything in `Brain/` changed:
- Update [[Brain Directory]] with the new entries, removed entries, or renamed paths
- Bump the "Last updated" timestamp on Brain Directory

Anti-pattern check: dead wiki-links to deleted files. Remove them.

### 6. Verify session record

Read back Status.md, Tasks.md, and today's daily log. Sanity-check:
- Does Status.md reflect what happened?
- Did any completed task get missed?
- Does the daily log entry name what was actually done?

If anything looks wrong, fix before pushing.

### 7. Write a metadata-only line to OS Health

Walk the `/goal` checklist at the top of this file to determine Goal status (`met` / `partial` + one-line reason).

Append the metadata-only block to `Reviews/OS Health/current.md`. Full block template, duration-anchor rules (morning-briefing timestamp, fallback to `unknown` rather than guess), skills-fired source rule, and the privacy boundary are in [[os-health-line-format]].

**Hard rule:** metadata only. No campaign briefs, voice notes, email content, or personal details. What kinds of things happened, never the substance.

### 8. Commit and push to GitHub

**Working directory:** Read `install_path` from `.install-state.json` (written by /install at the end of bootstrap). If the file is in the current working dir, you are already in the OS root, no `cd` needed. Do not hardcode a `~/Documents/...` path, Maddie may have installed anywhere on disk.

```bash
# Stage everything that changed (respects .gitignore)
git add -A

# Refuse if there is nothing to commit
if git diff --cached --quiet; then
  echo "Nothing to commit, working tree clean. Exiting Session End."
  exit 0
fi

# Commit with auto-tagged message
TIMESTAMP=$(date -u +%Y-%m-%dT%H%M%SZ)
git commit -m "[auto-sync] Maddie OS session $TIMESTAMP"

# Push
git push origin main
PUSH_EXIT=$?
```

**If `PUSH_EXIT` is non-zero:**

**Try pull-then-push once (L2 patch):**
```bash
git pull --rebase origin main && git push origin main
REBASE_EXIT=$?
```

**If the L2 retry fails (push still rejected, or rebase itself conflicts):** go to L4 freeze. Full protocol (abort-mid-rebase, OS Health L4 marker, Slack-availability check, Slack template, plain-English message to Maddie) is in [[l4-freeze-protocol]].

Hard rule: do not force-push, amend, or delete anything in L4. Do not leave the repo mid-rebase.

### 9. Report back to Maddie

One short message:

> Saved and pushed. [N] tasks marked done, [M] new items in Tasks. Daily log updated. See you next session.

If anything was carried over from her Top 3:
> Note: [carry-over items] are on tomorrow's list. Did not want to lose them silently.

If Diagnostics had surfaced anything L3 during the session that she chose to defer:
> Also: the [issue] you chose to defer earlier is in OS Health for Diagnostics to retry next week. If it gets worse, ping Tom.

---

## Critical persona at session end

The OS uses session end as a checkpoint to push Maddie where she is drifting:

- **Top 3 incomplete:** flag in the daily log Next line. Do not silently move on.
- **Stale In Progress task:** any task that is still In Progress at session end AND was already In Progress at the start of this session AND was not touched in this session is a candidate for a nudge. Surface one nudge per session, not all of them: "[Task name] has been In Progress without movement. Real status? Blocked, deferred, or actually still being worked on?" Do this signal-based, not date-based, because Tasks.md has no per-row timestamps. The Weekly Review skill handles the longer-window check separately using `git log -- Tasks.md`.
- **Recurring escalations:** if Diagnostics has surfaced the same L3 three runs in a row and Maddie keeps deferring, surface it: "Slack MCP latency has been flagged three weeks running. Worth escalating to Tom?"

These are friendly nudges, not nags. One short sentence each. Never lecture.

---

## Casual-session path

If step 1 detected no real work:
1. Skip steps 2 to 7.
2. Run `git status --porcelain` only. Do NOT auto-stage with `git add -A` in this path, the conversation gave no signal about what changed and a surprise file could be anything.
3. If output is empty, tell Maddie: "Nothing to save. Catch you later." Done.
4. If output is non-empty, tell Maddie: "Nothing tracked this session but the working tree shows uncommitted changes in [files]. Want me to commit and push, or leave them?" Wait for her answer. Commit only what she confirms.

---

## What does NOT go in any output of this skill

- The content of conversations
- The content of campaign drafts, post copy, email drafts
- Personal information about colleagues / clients / patients

Only metadata, structural updates, and Status/Tasks-row-level content.

---

## Rules

- Never amend the latest commit. Always create a new commit.
- Never force-push to main.
- Never skip hooks.
- No em or en dashes in any log entry.
- If git push fails, the L4 freeze flow handles it. Do not silently swallow.
- OS Health entries are metadata only. Privacy boundary is hard.
- Critical persona is mandatory, not optional. Flag drift even when Maddie is wrapping up.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-18 | Skill stub created during scaffold. Process outline, basic git pattern. |
| 2026-05-19 | Full implementation: exact git commands with L2-then-L4 push handling, daily log examples, OS Health metadata-only line, critical persona checkpoints at wrap, Slack escalation template for L4 freeze. |
| 2026-05-20 | Cold-simulation test as Maddie (Wed 21 May, MCPs partly disconnected, install-in-progress state). 9 edits applied: (1) Step 0 added, pre-check for `.install-state.json` existing before any close-out work, (2) Step 4 daily-log append now locates the `## Sessions` header explicitly + adds a Top 3 cross-reference algorithm (read morning briefing, cross-ref Tasks.md changes, carry over un-Done items to Next line), (3) Step 5 Brain Directory check now uses `git status --porcelain Brain/` covering `??` untracked files instead of an A/D/R/M-only regex that missed new files, (4) Step 7 OS Health line gained a goal-verification sub-step, a defined duration anchor (morning briefing timestamp, fallback to "unknown" instead of guessing), and explicit Step 1 as the skills-fired source, (5) Step 8 working-dir guidance changed from hardcoded `cd "$HOME/Documents/Maddie OS"` to "read install_path from .install-state.json", (6) Step 8 rebase-abort path added so a failed L2 pull-rebase does not leave the repo mid-rebase, (7) Step 8 L4 Slack-ping gained a Slack-MCP availability check mirroring Daily Briefing 1d, with explicit fallback to OS Health log + plain-English instruction to Maddie if Slack is unavailable, (8) L4 Slack template gained a "Rebase: completed-and-pushed / aborted / not-attempted" line, (9) Critical persona "Task In Progress > 5 days" rewrote to a signal-based test (still In Progress at start + still In Progress at end + untouched this session = nudge) because Tasks.md has no per-row timestamps; deferred date-based check to Weekly Review. Casual-session path tightened: no auto `git add -A`, prompts Maddie before staging surprise changes. Triggers list dropped "save and close" (unnatural phrasing) and added "see you tomorrow" / "ok done for today". |
| 2026-05-21 | Guide extraction pass. Skill bloated to 334 lines after the 2026-05-20 cold-sim edits. Three reference blocks moved to sibling guides folder: daily-log block template + 3 worked examples + Top 3 carry-over algorithm to [[daily-log-entry-format]], OS Health metadata-line template + duration-anchor rules + privacy boundary to [[os-health-line-format]], L4 freeze protocol (abort-mid-rebase, OS Health L4 marker, Slack-availability check, Slack template, plain-English message to Maddie) to [[l4-freeze-protocol]]. Skill body retains all procedure (the 9 steps, /goal block, casual-session path, critical persona, rules). Skill body now ~230 lines. No content lost. |
