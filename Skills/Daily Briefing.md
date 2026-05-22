# Skill: Daily Briefing

---
triggers:
  - "hey"
  - "morning"
  - "good morning"
  - "hi"
  - "hello"
  - "daily briefing"
  - "what's on today"
  - "what's up"
type: Greeting
---

**Purpose:** Maddie's morning snapshot. Diary, messages, top 3 priorities, weekly checklist across her three brands, to-do, awaiting others, recommendations. Pulls latest from GitHub first so any overnight fixes Tom pushed are picked up. Triggers Diagnostics inline if it has been more than 7 days, surfaces Learning recommendation if more than 30 days.

The most-fired skill in the OS. Done well, it sets the tone for her whole day.

---

## Context

*Load these files before running this skill:*

- [[Status]] for open actions, this week's priorities
- [[Tasks]] for full task list
- [[Brain Directory]] for routing if a brand-specific question arises mid-briefing
- [[Maddie]] for her working style (visual person, push when she is ducking)
- `.last-diagnostics-run`, `.last-learning-run` for the state-file triggers

Note: this skill does NOT load brand-specific Brain files in advance. It pulls them only if her email / Slack content references a brand-specific action.

---

## Quick Start

Maddie says "hey", "morning", "good morning", "hi", "hello", "daily briefing", "what's on today", "what's up".

---

## /goal integration

Set this goal at the start:

```
/goal Daily Briefing markdown has been written to Reviews/Daily/YYYY-MM-DD.md, contains all 7 sections (Diary, Messages, Top 3, Weekly checklist, To-do, Awaiting, Recommendations), AND state-file checks for Diagnostics and Learning have been evaluated. Stop after 6 turns if not met.
```

---

## Process

### 1. Pull from GitHub

```bash
cd "$HOME/Documents/Maddie OS"
git pull --rebase origin main
```

**If conflicts:** L4 freeze (do not auto-resolve). Auto-Slack-ping Tom, tell Maddie "git conflict, paused, Tom has been pinged, carry on with anything else for now." Stop the briefing.

### 1a to 1d. State-file checks and MCP availability

Run all four pre-assembly checks. Full bash blocks, conditional logic, and behaviour per check are in [[daily-briefing-state-file-checks]].

- **1a, Diagnostics.** If `.last-diagnostics-run` is missing or older than 7 days, fire [[Diagnostics]] inline before assembling. Hold its summary for Section 0.
- **1b, Onboarding P1 bar.** If install is still in onboarding or `P1_REMAINING > 0`, hold the P1 gap list as recommendation #1 in Section 7. Replaces the old monthly Learning auto-recommend.
- **1c, Social Trends Watch.** If `.last-trends-run` is missing or older than 30 days, fire [[Social Trends Watch]] inline. Hold its headline for Section 7.
- **1d, MCP availability.** Quick check of Google Workspace, Slack, and Metricool. If any is down, do not abort: degrade the affected section to a one-line fallback and add one reconnect entry to Section 7.

### 2. Date and time anchor

Use today's UK local date (BST or GMT depending on season). State at the top.

### 3. Section 0: Diagnostics summary (only if fired in 1a)

If Diagnostics fired, render the OS Health Check block per [[daily-briefing-output-template]]: one-line headline when all is healthy, full L3 issue list with three-way choices when any surfaced. If no issues, the section is one line and we move on.

### 4. Section 1: Diary

If Google Workspace MCP was flagged unavailable in 1d, replace this section with the one-line fallback from 1d and skip the rest.

**Today (Day, DD Month YYYY):**
- Pull calendar events from Google Workspace MCP (Calendar API)
- Filter out routine personal events (wake-up alarms, fitness, etc)
- One line per event: `HH:MM, [event], [attendees if any], [location if not default]`

**Tomorrow:**
- Same pattern, one-line each

**Flag for each meeting:**
- Has a briefing pack / agenda? (check `Information/Briefing Packs/` and `Information/Meetings/` for matching dated files)
- Open prep items? (check Tasks.md for "prep [meeting name]" entries)

If a meeting has no agenda and no prep noted: critical persona flags it. "Stride 1:1 at 14:00, no agenda found. Worth running /meeting-prep before 13:00?"

### 5. Section 2: Messages for today

If Google Workspace MCP and Slack MCP were both flagged unavailable in 1d, replace this section with the one-line fallback and skip. If one is available and the other is not, run the available half, and replace the unavailable half with the fallback line.

Scan the email inboxes and Slack channels listed in [[daily-briefing-watchlists]] for anything new since the last briefing. Categorise into "Requires response from Maddie today", "FYI Cc'd", or skip (newsletters / automated).

Critical filter: the goal is "what needs your attention", not "everything new". If nothing requires a response today, say it plainly: "Nothing in your inboxes needs a reply today." If a Slack channel is quiet, say so in one line. Do not pad.

### 6. Section 3: Top 3 today

Three concrete commits for today. Each one a real thing she will move forward. Drawn from Status.md "This Week's Priorities" cross-referenced with today's calendar load, urgent open actions from Tasks.md, and anything surfaced in the email / Slack scan that needs a response today. Format per [[daily-briefing-output-template]].

**Critical persona check:** if Top 3 feels light (e.g. only 2 items, or 1 trivial item), push back: "Today is genuinely quiet, is this right? Anything you are ducking?"

If Maddie's previous-day Top 3 had incomplete items, surface them as carry-over candidates: "Yesterday's Top 3 had [X] outstanding. Carry over or drop?"

### 7. Section 4: Weekly checklist

Brand-by-brand proactive monitoring. This is the section Maddie explicitly asked for in the wishlist meeting ("are we ticking the boxes of posting five times on social this week").

If Metricool MCP was flagged unavailable in 1d, show the table with `[Metricool pending]` in the post-count column and continue. The campaign + tools columns are populated from Status.md and do not depend on Metricool, so the table is still useful at a glance.

Pull from Metricool MCP (once connected) for post counts. Pre-Metricool, query Slack canvases for the per-brand marketing tracker. Render the per-brand table per [[daily-briefing-output-template]] (one row each for Fade Golf, Stride, Fire & Earth, columns: posts this week vs target, active campaign on track, tools healthy).

Below the table, flag anything trending wrong:
- "Stride is at 1 post this week with a target of 5. Behind. Carry-over from yesterday's Top 3?"
- "Fade Golf has no active campaign running. Was a Luke ambassador campaign meant to be live by now?"

This is the section that catches drift before it costs her a week.

### 8. Section 5: To-do (next 10)

Pull from Tasks.md, ordered by:
1. Deadline today
2. Deadline this week
3. In Progress
4. Top of To Do per brand

Skip anything completed since yesterday's briefing. Skip Blocked items unless the blocker shifted.

One bullet per item: `[Brand] [Deadline] [Task title]`.

### 9. Section 6: Awaiting others

Pull from Status.md "Awaiting" section plus any open actions where Maddie is not the owner. One bold-name line per person (Tom, Harry, Mark, others), chase-date where relevant. Format per [[daily-briefing-output-template]].

Critical persona: if an "awaiting" item is more than 2 weeks past due-date, surface: "[Person] [item] is X weeks overdue. Worth chasing this week or moving on without it?"

### 10. Section 7: Recommendations

Two to four sharp recommendations. Each one specific, actionable, with reasoning in one sentence. Format per [[daily-briefing-output-template]].

**If Step 1b held an onboarding-P1 gap list, that is recommendation #1, every morning, until cleared.** Full wording for the P1 nag is in the template.

**Open Questions surface (always, post-install).** Read `Information/Open Questions.md`. Pull rows where status is **Open**, **Blocked**, or **Parked** AND the ETA has passed OR is "TBC" AND the row was discovered more than 7 days ago. Surface up to 3 in priority order (older first), as a separate "Open questions worth resolving this week" recommendation block. One row per line: `[Question] — [Owner] — [Blocker]`. Skip silently if Open Questions.md doesn't exist (pre-install) or has no qualifying rows.

This is the durable companion to the bootstrap `gap_list` surfacer: even after install completes, Open Questions keeps surfacing follow-ups Maddie needs to chase to resolution. Stops stub-state skills from becoming invisible.

Critical persona: do not pad to 4 if there are only 2 real recommendations. Quality over quantity. If Diagnostics surfaced L3 issues in Section 0, do NOT re-surface them as recommendations. They are already there with their three-way choice.

### 11. Write to file

Save the full briefing to `Reviews/Daily/YYYY-MM-DD.md`. If the file does not exist, create it with a `## Sessions` placeholder for Session End to append to later. Full file structure, section ordering, and graceful-degradation fallback wording are in [[daily-briefing-output-template]].

### 12. Display the briefing to Maddie

Render the briefing in the conversation, neatly formatted. Do not summarise unless she asks.

If Diagnostics surfaced L3 issues, hold for her A/B/C response before the briefing's other sections become actionable. Other sections still display; she just knows to deal with L3 first.

---

## Example briefings

Two worked references for tone and depth (quiet day and busy day) are in [[daily-briefing-examples]]. They show the critical persona in action, weekly-checklist push-back, awaiting-others chase prompts, and the recommendations format.

---

## Critical persona running through

The whole briefing applies the critical-by-default rule:

- If Top 3 looks light, push for more.
- If a task has been sitting in Awaiting more than 2 weeks, flag it for chase-or-drop.
- If a brand is silent on socials for a week, flag.
- If Maddie keeps deferring the same Diagnostics issue, surface it.

Never lecture. One short sentence per nudge.

---

## Rules

- ALWAYS pull from GitHub FIRST. Tom's overnight fixes must be picked up.
- ALWAYS run the state-file checks (1a, 1b, 1c) before assembling. They are the autonomous-monitoring mechanism. Step 1b is the install-onboarding gate, not a Learning recommendation any more.
- ALWAYS run the MCP availability check (1d) before assembling. The briefing must still run when a connection is down, just with the affected sections degraded to a one-line fallback.
- Apply critical persona consistently. Maddie wants judgement, not a menu.
- Never skip the weekly checklist. That is the proactive monitoring she explicitly asked for.
- If GitHub pull fails, report and flag (L4). Do not silently skip.
- If Diagnostics surfaces L3 or L4 in section 0, surface them prominently. Do not bury.
- Briefing output goes to `Reviews/Daily/YYYY-MM-DD.md` AND is shown to Maddie. Do not skip either.
- No em or en dashes in output.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-18 | Skill stub created during scaffold. Adapted from Tom OS Daily Briefing. |
| 2026-05-18 | Added Step 1a (Diagnostics state-file check, fires inline if >7 days stale) and Step 1b (Learning recommendation surface if >30 days). State files committed to git for Tom's remote view. |
| 2026-05-19 | Full implementation: exact bash for state-file checks, watchlist of email addresses + Slack channels, section-by-section format with critical persona checks, two worked example briefings (quiet day, busy day), L4 freeze handling for git pull failures. |
| 2026-05-19 | Added Step 1c: Social Trends Watch state-file check, fires inline if >30 days stale. Trends Watch is the third auto-triggered skill from Daily Briefing alongside Diagnostics (7-day) and Learning (suggested at 30 days). |
| 2026-05-20 | **Skill testing surfaced two implementation gaps.** (1) Changelog claimed Step 1c was added on 19 May but the Process section had no Step 1c body. Now written in full (Trends Watch state-file check, parallels 1a Diagnostics). (2) Skill had no graceful degradation for missing MCPs (Google Workspace, Slack, Metricool). Added Step 1d MCP availability check + per-section fallback wording so the briefing still runs when a connection is down. Rules section updated. Tested as Maddie, Wed 20 May, on this build folder. |
| 2026-05-20 | **Step 1b repurposed: now checks install-onboarding P1 bar instead of recommending monthly Learning.** Tom's decision: Learning is install-bootstrap + complete-reinstall only. Ongoing Brain growth happens via Live Brain Update in Instructions.md. Daily Briefing's role here is to nag until P1 is cleared. P1 gap list becomes recommendation #1 every morning until empty. Section 7 format updated accordingly. |
| 2026-05-21 | **Guide extraction pass.** Skill at 447 lines, well over the 250-line lean target. Extracted four blocks to a sibling guides folder: state-file and MCP checks for Steps 1a to 1d to [[daily-briefing-state-file-checks]] (66 lines), Section 2 email and Slack watchlists to [[daily-briefing-watchlists]] (39 lines), Section 11 output file template + fallback wording to [[daily-briefing-output-template]] (96 lines), two worked example briefings (quiet day + busy day) to [[daily-briefing-examples]] (76 lines). Per-section format code blocks (Sections 3, 4, 6, 7) compressed to wiki-link references back to the output template, since they duplicated the template. Skill body now wiki-links to each guide with a one-paragraph summary. Em dashes in two extracted passages also cleaned up (paste-safe rule). No content lost. Skill body now 209 lines (was 447), focused on workflow, persona checks, and rules. |
