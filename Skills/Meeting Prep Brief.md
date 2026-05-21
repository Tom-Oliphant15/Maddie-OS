# Skill: Meeting Prep Brief

---
triggers:
  - "meeting prep"
  - "/meeting-prep"
  - "prep for [meeting]"
  - "brief me for [name]"
  - "agenda for"
type: Workflow
---

**Purpose:** Pre-meeting one-pager. Pulls what was last discussed, open actions on either side, relevant brand data, suggested agenda with timings. Maddie walks into the meeting ready instead of reactive.

Used for: weekly Tom Zoom, daily/weekly Harry, three-way Tom+Harry+Maddie, four-way (with Luke), Britt threads, external partner meetings (Mark, Jason, future GP referrers).

---

## What's Appropriate Here

Maddie's meeting reality is mostly internal, mostly recurring (weekly Tom Zoom, daily/weekly Harry, three-way strategic, occasional external partner), with people she works with every week. Less negotiation-heavy than Tom's meeting load, more workstream-update and blocker-clearing. Slot length usually 30 to 60 minutes.

What this skill IS:
- A glanceable single-page brief, readable in 60 seconds, that gives Maddie an outcome and a sharp agenda before she walks in.
- An outcome anchor: each meeting earns a single declared outcome before topics are listed. If the outcome cannot be named, the meeting may not be the right format.
- A workstream-status pull for recurring meetings: open actions on both sides, what landed since last time.

What this skill is NOT:
- An enterprise pre-read distributed to attendees (Maddie's brief is private prep, not a shared agenda; only the four-way and external partner variants ever surface the agenda externally).
- A meeting facilitation playbook (no IDOARRT openings, role assignments, formal close protocols).
- A 5-minute read (rule of thumb: if a brief takes more than 60 seconds to skim, it's too long).
- An anticipation block for every meeting (only four-way and external partner meetings need a "what they'll likely raise" section; weekly Tom and Harry catch-ups skip it).

---

## Context

*Load these files before running this skill:*

- [[Status]] for current state, open priorities
- [[Tasks]] for tasks awaiting the meeting attendee(s)
- [[Contacts]] for canonical attendee details (email, Slack, role, relationship notes). Use this to resolve colloquial attendee names ("Lynda", "Mark") to canonical identifiers and to pull the right relationship context for the "One thing to remember" section.
- Calendar event for context (via Google Workspace MCP) if a calendar event exists
- Recent Slack/email threads with the attendee(s) (via Slack/Gmail MCPs)
- Any past meeting summaries with the same attendees in `Information/Meetings/` (mirror Tom's Meeting Summaries pattern)

---

## Quick Start

Maddie says:
- "meeting prep for Tom Zoom tomorrow"
- "/meeting-prep Harry 1:1 Friday"
- "prep for the four-way with Luke"
- "brief me for the Britt call"

---

## /goal integration

```
/goal output saved to Information/Briefing Packs/[YYYY-MM-DD] [Meeting].md, contains all 5 sections (Last time, Open actions, Topics to raise, Suggested agenda, One thing to remember) plus the header block (attendees, type, date/time, generated-by line), each topic-to-raise has data/context backing it, "One thing to remember" is critical-persona pointed not generic, glanceable in 60 seconds, max 1 page when rendered. Stop after 5 turns if not met.
```

---

## Process

### 1. Identify the meeting

Maddie says "prep for X". Resolve to:
- Specific calendar event if it exists (via Calendar MCP)
- Otherwise: ask date + attendees

If she names a recurring meeting type (e.g. "Tom Zoom"), match to the next scheduled instance.

### 2. Pull context

**MCP availability check first.** Mirror Daily Briefing 1d:
- Calendar MCP, needed for the calendar event + attendee resolution
- Slack MCP, needed for "Recent threads"
- Gmail MCP, needed for "Recent threads"

For any MCP that isn't connected, do NOT abort. Replace the affected context with a one-line fallback in the brief ("Slack threads not pulled, Slack MCP not connected. /install to reconnect.") and continue with the rest.

**Last meeting:** check `Information/Meetings/` for the most recent meeting with the same attendees. Read summary.

If `Information/Meetings/` is empty (likely on day 1 of using Maddie OS even though Maddie has years of context outside the OS), do not silently default to "First meeting on record". Offer Maddie:
> No prior meeting summary on file with [Attendees] inside this OS. Three options:
> - **A. Recall it for me.** Maddie types a 3-line summary of the last meeting; skill uses it as the "Last time" section and saves it as `Information/Meetings/[YYYY-MM-DD] [Meeting] - Recalled by Maddie.md` for future runs.
> - **B. Skip Last Time.** Skill renders the section with "First meeting on record inside this OS (Maddie has prior context outside it)."
> - **C. Hold the brief.** If the recall would take more than a minute, Maddie can skip the brief and run /meeting-prep again after the meeting is summarised.

**Open actions awaiting these attendees:** query Tasks.md for any row where the attendee is the owner OR the task is in Blocked status. (Status.md has no "Awaiting" section in Maddie OS; Tasks.md "Blocked" + Owner field is the source of truth.)

**Open actions THEY are waiting on Maddie for:** flip the lens. Tasks.md rows where Maddie is owner AND the deadline is before the meeting + 7 days.

**Relevant data:** if the meeting is brand-specific, offer to pull Data Pull output for that brand. Data Pull is currently a stub pending Metricool MCP setup. If it's still a stub at run time, skip the offer and note "Data Pull unavailable until Metricool MCP is configured" in the brief; do not fail.

**Recent threads:** Slack/email threads with this attendee since the last meeting. Pull the substantive ones, not every chat. (See MCP check above for fallbacks.)

### 2.5. Name the outcome and the meeting type

Before drafting topics, declare:

**Outcome (one sentence):** "By the end of this meeting, [specific thing] will be [done / decided / unblocked / aligned]."

If the outcome cannot be named in one sentence, surface it to Maddie:
> No clear outcome for this meeting. Three options:
> - **A. Make the outcome specific.** Maddie names a decision needed, a blocker to clear, or an alignment to land.
> - **B. Hold a "loose update" outcome.** Accept the meeting is a workstream sync with no single decision (legitimate for weekly Tom Zoom, but flag if used three weeks running).
> - **C. Suggest cancelling or shortening.** If there is no outcome and no update needed, the slot may not need to run.

**Meeting type (one category):** Decision / Alignment / Problem-solving / Update / Mixed.

Why: 2026 best practice (Asana, PerformYard, PPAI agenda guides) is that meetings without a stated outcome and type drift. For Maddie, "Update" is the honest type for recurring catch-ups; "Decision" or "Problem-solving" raises the bar.

Outcome and type drive the agenda template chosen in Step 4. An "Update" meeting allocates more time to status walk-through; a "Decision" meeting cuts to the decision and leaves status to the brief.

### 3. Build the brief

Full brief template is in [[meeting-prep-brief-template]] (loaded when the skill runs). The template covers the header block plus five sections in order: Last time, Open actions (split by owner including a "bring an update" column for Maddie's own actions), Topics to raise (max 8, question-framed, each tagged D/A/U) plus anticipation block 3a (four-way and external only) and kill-list 3b, Suggested agenda with timings and time-box check, and One thing to remember.

### 4. Save and surface

```bash
mkdir -p "Information/Briefing Packs"
# Write the file
```

Show Maddie:
> Brief saved. [N] open actions on your side, [M] on theirs. Agenda suggests [N] topics in [time]. The one thing flagged: [the one thing]. Want me to:
> A) Draft a pre-meeting Slack DM to confirm time + agenda
> B) Add this brief to a "ready" Slack DM for sending after the meeting
> C) Done, you have what you need

---

## Meeting-type-specific patterns

Per-meeting-type prep notes (Weekly Tom Zoom, Harry 1:1, three-way Tom + Harry + Maddie, four-way with externals like Luke, external partners like Mark / Jason) plus the explicit detection rule that maps attendee lists to type are in [[meeting-type-patterns]]. The skill detects type from attendees and adjusts the agenda template accordingly.

---

## Worked example

Full Tom Zoom prep flow worked example is in [[meeting-prep-brief-worked-example]].

---

## Rules

- Outcome is named in one sentence before topics are listed (Step 2.5). No outcome = three-option fallback to Maddie.
- Meeting type is named: Decision / Alignment / Problem-solving / Update / Mixed.
- Topics in section 3 are question-framed or decision-named, not topic labels. ("Should we...", "Can you...", not "Budget"). Each topic carries D/A/U tag.
- Maximum 8 main points in section 3. Glanceability matters in a live meeting.
- Anticipation block (3a) runs ONLY for four-way and external partner meetings. Recurring 1:1 and three-way meetings skip it (would be noise).
- Out of Scope (3b) runs only if items exist to park. Max 3, single line each.
- Each agenda topic has timing in section 4. Time-box check is mandatory: sum + 5 min for next steps must fit the slot.
- "One thing to remember" is critical-persona pointed, not a polite recap. Source it from: (a) explicit notes in the relevant brand Brain file's Key People section if present; (b) patterns surfaced by past meeting summaries in `Information/Meetings/`; (c) the active campaign or Status row this meeting touches; (d) Maddie's own conversation-history flags ("Tom asked you to bring X" earlier in the week). If none of those have anything sharp, ask Maddie one question: "Anything Tom / Harry has been pressing on that I should pin to the top?", better one honest question than a bland line.
- Lead time matters: brief should ideally land 2h+ before the meeting. Daily Briefing's Section 1 Diary already lists today's meetings, if Maddie wants a "no brief yet" nudge in the morning, that integration belongs in Daily Briefing (out of scope for this skill to enforce). For now, the responsibility sits with Maddie at greet.
- Save to `Information/Briefing Packs/[YYYY-MM-DD] [Meeting].md`.
- Meeting-type detection auto-adjusts the agenda template.
- No em or en dashes.

---

## Anti-patterns

- Drafting topics before naming the outcome (the meeting drifts in the call).
- Topic-label framing instead of question framing ("Budget" vs "Should we shift Stride to YouTube?"). Generic labels guarantee a generic discussion.
- More than 8 topics-to-raise (overwhelm).
- Anticipation block on a recurring 1:1 (noise, not signal). Only four-way and external partner meetings need it.
- Agenda without timings (cannot pace in the call).
- Agenda that does not fit the slot (cuts will happen in the meeting if not before, and the wrong topic gets cut).
- "One thing to remember" being a polite summary instead of a sharp pointer.
- Brief that needs 5 minutes to read (a brief is glanceable, not a document).
- Brief generated 5 minutes before the meeting (no time to act on it).
- Default "Update" outcome used three weeks running on the same meeting (signal the meeting may not need to run weekly).

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-19 | Skill created. 5-section template, meeting-type-specific patterns (1:1, three-way, four-way, external), worked example for Tom Zoom prep, glanceability constraint (max 8 topics, timed agenda). |
| 2026-05-20 | Cold-simulation test as Maddie (Tom Zoom prep, install-in-progress state, empty Information/Meetings/, Maddie's Status.md has no "Awaiting" section, Data Pull stub). Seven edits applied: (1) `/goal` text rewritten — was listing 5 sections including "Who and when" (which isn't a section, it's the header block) and was missing "One thing to remember" entirely; corrected to 5 numbered sections + header block, with explicit goal that "One thing to remember" is critical-persona pointed, (2) Step 2 gained MCP availability check mirroring Daily Briefing 1d (Calendar / Slack / Gmail); affected context lines get one-line fallbacks instead of silent failure, (3) Empty `Information/Meetings/` fallback added — instead of "First meeting on record" (silently wrong for Maddie's reality), skill offers three options including "Recall it for me" with a 3-line Maddie summary saved for future runs, (4) Status.md "Awaiting" reference removed — section doesn't exist in Maddie OS; uses Tasks.md Blocked status + Owner field instead (matches the format-standard sections that actually exist), (5) Data Pull stub-state handling added: skill detects stub status, skips the offer, notes "Data Pull unavailable until Metricool MCP configured" in the brief instead of failing, (6) Meeting-type detection rule made explicit (was vague "skill detects type from attendees" with no rule): 1+Maddie+Tom = Tom Zoom, 1+Maddie+Harry = Harry 1:1, 3 attendees Tom+Harry+Maddie = three-way, 4+ including external = four-way, anything else without Tom or Harry = external partner, (7) Rules: lead-time-nudge cross-skill claim ("Surface in Daily Briefing if a meeting today has no brief") replaced — Daily Briefing has no such step, fixing it belongs in Daily Briefing not here; current rule says Daily Briefing's Diary already lists meetings and Maddie is responsible for spotting the gap at greet. "One thing to remember" source now defined (Brain Key People if present / past meeting summaries / active campaign or Status row / Maddie conversation-history flags / honest one-question fallback to Maddie). |
| 2026-05-20 | **P3 research-first retrofit** per [[Continue - Research-First Skill Retrofits]]. Sources: Asana 2026 Meeting Agenda Templates and Examples, Asana 2026 One-on-One Meeting Template, PerformYard Effective Meeting Agenda Best Practices, PerformYard 85 Meeting Agenda Topics, PPAI Effective Meetings 2026, Reclaim 2026 Meeting Agenda Guide (20 templates), Monday.com 2026 Meeting Agenda Templates, Joan Workplace Essential Agenda Items 2026, Range SaaS Marketing Team Weekly Meeting Agenda (Emily Kramer MKT1), Lattice Manager One-on-One Agenda Template, Thrivesparrow 1:1 Meeting Template, Salesmotion 12 Sales Meeting Agenda Templates, Spinach 6 Best Team Meeting Agendas. **Anchored on Maddie's reality** (mostly internal recurring meetings with people she works with daily, fewer negotiation-heavy meetings than Tom, 30-60 min slots, brief is private prep not shared pre-read). Added What's Appropriate Here block (IS a glanceable single-page outcome-anchored prep, IS NOT enterprise pre-read / facilitation playbook / 5-min read / anticipation block for every meeting). New Step 2.5: name the outcome ("By the end of this meeting, [specific thing] will be [done / decided / unblocked / aligned]") AND name the meeting type (Decision / Alignment / Problem-solving / Update / Mixed) BEFORE drafting topics; no-outcome triggers three-option fallback. Output template header gained Format type and Meeting type lines, plus explicit Outcome line. Section 3 (Topics to raise) restructured: topics now framed as questions or decision-needed not topic labels, each topic carries D/A/U tag (Decision needed / Ask / Update to give). New Section 3a (Anticipation block, "What they'll likely raise") with mandatory rule that it runs ONLY for four-way and external partner meetings, never for recurring 1:1 or three-way (would be noise at Maddie's scale). New Section 3b (Out of Scope today / kill list) max 3 items, single line. Section 4 (Suggested agenda) gained time-box check (sum + 5 min must fit slot, cut or follow-up if over) and agenda-weight-by-meeting-type guidance (Decision = bulk on the decision, Update = bulk on status, etc.). Rules expanded with outcome-mandatory, type-mandatory, question-framing-mandatory, anticipation-only-for-4way-external, time-box-mandatory. Anti-patterns expanded with topic-label-framing, anticipation-block-on-1:1, agenda-overrun-cuts-wrong-topic, default-Update-three-weeks-running (signal the recurring meeting may not need to be weekly). Stress-tested mentally against three real Maddie scenarios: (a) weekly Tom Zoom (Outcome: "Master Marketing Document status aligned and budget question landed", Type: Update + Decision, anticipation skipped per recurring rule, 30 min slot, fits cleanly); (b) four-way with Luke (Anticipation block runs, surfaces Luke's likely questions about paid-media usage rights from previous shoot, time-box check forces cut from 6 to 5 topics); (c) Harry 1:1 in-person (Outcome: "WordPress access blocker cleared", Type: Problem-solving, anticipation skipped, 3 topics question-framed). British English verified. No em / en dashes per CLAUDE.md. Skill grew from ~280 to ~365 lines, single file. |
| 2026-05-21 | **Guide extraction pass.** Skill had grown to 365 lines after the research-first retrofit. Extracted three blocks to `guides/`: full output brief template (5 sections + header) to [[meeting-prep-brief-template]], meeting-type-specific patterns + detection rule to [[meeting-type-patterns]], and the Tom Zoom worked example to [[meeting-prep-brief-worked-example]]. Skill body now links to each rather than embedding. No content lost. Skill body reduced to ~155 lines (workflow + rules + anti-patterns + changelog). |
