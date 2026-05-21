# Skill: Weekly Slack Report Draft

---
triggers:
  - "weekly report"
  - "/weekly-report"
  - "draft my weekly"
  - "slack report"
  - "weekly marketing report"
type: Workflow
---

**Purpose:** Draft Maddie's weekly marketing report for Slack. Pulls numbers from Data Pull (if recent) + tasks completed this week + active campaigns + risks. Outputs Slack-formatted markdown ready to paste into `#fade-group-marketing` (or wherever the weekly slot lives).

Phase 2 deliverable. First live run targeted Wk of 1 June. Templates the weekly rhythm so it does not slip when Maddie is busy.

---

## What's Appropriate Here

Audience is Tom + Harry, both owner-operators of three small UK brands, both reading the report on Slack in 2 to 3 minutes between other things. They are not marketing professionals reviewing a polished agency deliverable. They want: "did the week move the business forward, what did Maddie need from us, what is she betting on next week."

What this skill IS:
- A 2 to 3 minute Slack read leading with business impact, not activity.
- An insight-not-data-points report: every number carries a "so what" hook.
- An honest scoring of last week's commitments against this week's reality (what landed, what slipped, why).
- An asks-callout: if Maddie needs a decision from Tom or Harry, it sits at the top so they cannot miss it.

What this skill is NOT:
- A polished agency-style marketing report (that is what Monthly Report Draft delivers monthly).
- A full data pull / dashboard (Numbers section is summary only, links to Data Pull for detail if needed).
- A task list (the report is for impact and decisions, not activity logging).
- Above ~400 words (hard cap; if it cannot fit, the headline is wrong).

---

## Context

*Load these files before running this skill:*

- [[Status]] for this week's priorities and recent completions
- [[Tasks]] for completed tasks (this week) and active items
- [[Fade Group]] for cross-brand context
- The most recent Data Pull output from `Reviews/Data Pulls/` if available
- Active Campaign Brief Expander outputs from `Information/Campaigns/` for in-flight campaigns

---

## Quick Start

Maddie says:
- "weekly report"
- "/weekly-report"
- "draft my weekly"
- "slack report for this week"

By default covers Mon-to-Sun of the current week. Override: "weekly report for last week", "weekly report w/c 26 May".

---

## /goal integration

```
/goal output is Slack-formatted markdown ready to paste, under ~400 words, contains all 5 sections (Headline, Done this week, In flight, Numbers, Next week), each brand has at least one line, written in Maddie's voice (not corporate marketing-speak). Stop after 4 turns if not met.
```

---

## Process

### 1. Determine reporting window

Default depends on the day of week the skill is invoked:
- **Sunday or Monday morning:** previous completed Mon-to-Sun week (the most-recent fully-finished week, no half-week data).
- **Mid-week (Tue-Sat):** ask Maddie. "Mid-week run. Do you want last week's report (w/c [Mon of prev week]), or a partial report on the current week so far (Mon to today)?" Do not silently default; either choice is valid but they produce different reports.

Override: parse Maddie's input (e.g. "last week", "w/c 26 May", "this week so far").

### 2. Pull data

**Last week's commitments (honesty check):**
Read the previous week's report (`Reviews/Weekly Reports/[previous date] Weekly Report.md`) and capture its Next Week section. Score each commitment against this week's reality: landed / partial / slipped, with one-line reason for any slip. This pairs with the Done This Week section to keep the report honest. If no previous report on file, skip this check (first run).

**Tasks completed this week:**

Tasks.md is section-based (To Do / In Progress / Done / Blocked), no per-row completion timestamps. So "tasks completed within the window" is determined relative to the previous weekly report's `.weekly-report-state` timestamp, not by per-row dates.

```bash
# Read Tasks.md, find the Done section
grep -A 50 "^## Done" Tasks.md

# Boundary timestamp: read .weekly-report-state if it exists.
# Everything in Done that is newer than that timestamp is "this week's".
# First run (no state file): treat every row currently in Done as "this week's" (the only honest first-week framing).
```

For per-row recency, fall back to `git log --since="[state-file-timestamp]" -- Tasks.md` to see when each Done row landed, if git history is available. If not (Maddie's repo not initialised yet during install window), use the conservative "everything in Done is this week's" rule and note "first weekly report, baseline week".

Group the resulting list by brand.

Insight test: each "Done" item must answer "so what did this move?" If the answer is "we did the activity", the line is a task log not an impact line; rewrite as the impact, or drop.

**Active campaigns:**

Primary: list `Information/Campaigns/*.md` files modified within the window OR with target dates in the next 2 weeks. One line per campaign.

Fallback when Information/Campaigns/ is empty (early in the install window before Campaign Brief Expander has produced its first brief): derive an In Flight list from Tasks.md In Progress + To Do rows with deadlines inside the next 2 weeks, grouped by brand. One line per workstream. Note in the output "Campaign briefs not yet authored, In Flight section sourced from Tasks.md" so Maddie can see the source and trigger Campaign Brief Expander when ready.

**Numbers (if Data Pull is fresh):**

Three-state detection:
1. **Data Pull skill is a stub** (Metricool MCP not yet configured during the install window). Detect: check the Data Pull skill file's first 10 lines for `STATUS: Stub` OR `[[Metricool]] MCP` referenced as a dependency that is not yet installed. If stub, **do not offer to run Data Pull**, write the Numbers section as "Data Pull unavailable until Metricool MCP is configured. Numbers section will activate from Wk of [date when MCP lands]." Skip the offer.
2. **Data Pull is live but stale** (>10 days since last run in `Reviews/Data Pulls/`). Flag and offer to run /data-pull first.
3. **Data Pull is live and fresh.** Use the latest numbers.

Insight rule: every number carries a "so what" hook in the same bullet. "Engagement up 22%" is a data point. "Engagement up 22% on Fade Golf, driven by member-experience posts which now go in the rotation" is an insight. Apply across all metrics.

**Asks of Tom or Harry:**

Scan Tasks.md for rows where:
- Owner contains "Tom" or "Harry" AND
- Status is Blocked OR deadline is overdue (relative to the report's end date) AND
- Brand is a marketing brand (Fade Golf / Stride / F&E / Cross), **NOT** "OS" or other internal-tooling brand tags

Excluding OS / internal rows keeps the Asks block focused on what the audience (Tom + Harry as owner-operators of the business) actually needs to decide. Tom's OS-build tasks are not marketing decisions; they would clutter the Asks block.

Also scan Status.md for any decision row waiting on Tom + Harry sign-off (marketing scope only).

Surface as Asks at top of the report. If none, omit the Asks block; do not fabricate.

**Risks / blockers:**

Maddie OS Status.md does not have an "Awaiting" section (the canonical Tom OS uses this; Maddie's does not). Use these sources instead:
- Tasks.md rows with `Blocked` status (any brand) → primary
- Status.md changelog rows mentioning escalation / unresolved / stuck → secondary
- Cross-week pattern: same row Blocked across 2+ weekly reports → flag explicitly

Pair each risk with the mitigation Maddie is taking, not just the risk.

**Next week's priorities (with hypothesis + metric where applicable):**

Primary source: Tasks.md filtered to rows with deadlines inside the next 7 days (relative to the report's end date), grouped by brand, ranked by impact.

Secondary: Status.md "This Week's Priorities" if it has been rotated by Session End to reflect the upcoming week (this rotation happens on the Sunday/Monday boundary; mid-week the section still describes the running week, not next week). Treat Status.md as additive context, not the spine.

For any campaign launch or test, add a one-line hypothesis + the metric that will tell us if it worked. ("Stride nail surgery campaign launches Mon, bet is on the patient-journey hook, watching cost-per-booking against the Mar baseline of £42.")

### 3. Apply Maddie's voice (not marketing-speak)

Critical: this report is in MADDIE's voice, not the brand voices. She is talking to Tom and Harry as a colleague, not pitching to customers.

Voice guidance:
- Plain English, direct
- Honest about what went well and what slipped
- Numbers without spin (no "great engagement" if engagement was flat)
- Forward-looking next-week without over-promising

### 4. Compose the report

Output template (Slack-formatted: `*bold*` not `**bold**`, single-line bullets):

```
*Marketing Weekly: [Date range]*

*Headline:* [One line on business impact this week. What moved (or did not). Not "we did X tasks". Examples: "Stride tag fix landed, paid ROI now measurable. First nail-surgery campaign launches Mon." NOT "Lots of tasks completed across all three brands."]

*Asks of Tom + Harry*
• [Decision needed / blocker to clear, with deadline]
[Omit the section if no asks. Never fabricate.]

*Done this week (impact, not activity)*
• [Brand] [what moved, not what was done. e.g. "Stride: tag tracking live, first cost-per-booking baseline now possible" not "Worked with Mark on tags"]
• [Brand] [item with impact]
• [Brand] [item with impact]

*Last week's commitments*
• [Commitment from last week's Next Week]: landed / partial / slipped, [one-line reason]
• [Commitment]: landed / partial / slipped, [reason]
[Omit the section on first run (no previous report). Show every commitment, no cherry-picking.]

*In flight*
• [Brand] [campaign or workstream] [status]
• [Brand] [campaign or workstream] [status]

*Numbers* (week of [date]; pulled [Data Pull date])
• Fade Golf: [N] posts (target [M]), [metric with "so what" hook]
• Stride: [N] posts (target [M]), [metric with "so what" hook]
• F&E: [N] posts (target [M]), [metric with "so what" hook]
[If Data Pull is stale, replace with: "Numbers due, Data Pull last ran [date]. Refreshing next week."]

*Slips / risks*
• [Item that slipped, why, mitigation]
• [Risk for next week, mitigation]
[Omit if genuinely nothing to flag. Do not pad. Each risk has the mitigation Maddie is running, not just the risk.]

*Next week (with bets, not just priorities)*
• [Priority 1, framed as the bet. Hypothesis + metric where applicable. e.g. "Stride nail surgery launches Mon, bet is the patient-journey hook, watching cost-per-booking vs £42 baseline."]
• [Priority 2, same framing]
• [Priority 3]

[Optional close line: "Questions before next sync, ping me."]
```

### 5. Save and offer

**Folder pre-check.** Ensure `Reviews/Weekly Reports/` exists; create if missing. (Install does not currently create this subfolder on first run; self-heal rather than refuse.)

Save to `Reviews/Weekly Reports/[YYYY-MM-DD] Weekly Report.md` where `YYYY-MM-DD` is the end-date of the reporting window.

**Slack MCP availability check** (mirror Daily Briefing Step 1d):
- If Slack MCP is configured AND a `weekly_report_channel` is cached in [[Tech Stack]] → Option A available.
- If Slack MCP is configured but channel not yet cached → ask Maddie once: "Which Slack channel for the weekly report? (e.g. #fade-group-marketing)". Cache the answer to `## Slack channels` in [[Tech Stack]]. Option A available going forward.
- If Slack MCP not configured → Option A unavailable, only Options B and C offered, with a one-line note "Slack MCP not connected, copy-to-clipboard route only until configured."

Show Maddie:
> Weekly report drafted. ~[N] words. Options:
> A) Post directly to [channel from Tech Stack] (Slack MCP) [available only if MCP + channel cached]
> B) Copy to clipboard for review
> C) Save only, post later

If A, post and confirm.

### 6. Track posting cadence

After posting (or after Maddie says "done with the weekly"), update `.weekly-report-state` with the timestamp.

**Cross-skill hook.** Daily Briefing should surface missed weeks on Monday mornings ("last week's marketing report did not go out, want to run /weekly-report now?"). Whether this hook is implemented in Daily Briefing is verified during Daily Briefing testing; if not yet implemented, the cross-skill change lands there, not here. Do not silently assume the hook fires.

---

## Worked example output

```
*Marketing Weekly: 26 May to 1 June*

*Headline:* Stride Google tag fix landed Thursday, per-service Ads restructure now unblocked. First nail-surgery test campaign launches Mon 2 June.

*Done this week*
• Stride: tag/conversion tracking fixed with Mark, verified
• Stride: nail surgery campaign brief built, Google Ads variations drafted
• Fade Golf: Luke ambassador intro reel filmed Wed, first cut in review
• F&E: website refresh content shotlist locked
• Cross: Master Marketing Document section drafts for Stride and Fade Golf complete

*In flight*
• Stride: nail surgery campaign launches 2 June (paid live, organic across the week)
• Fade Golf: ambassador rollout, Luke first post Tue 4 June
• F&E: open-day campaign scoping, target 21 June

*Numbers* (week of 26 May; pulled 1 June)
• Fade Golf: 4 posts (target 4), avg engagement up 22% vs last 4 weeks
• Stride: 3 posts (target 5), 2 slipped to next week (Run Club edits)
• F&E: 2 posts (target 2), engagement flat

*Slips / risks*
• Stride two posts slipped due to Run Club editing time, carrying over to Mon
• F&E engagement flat, may need a content angle refresh (raising at three-way Tue)

*Next week*
• Stride nail surgery campaign launch + first weekend monitoring
• Master Marketing Document final review (Tom + Harry sign-off Wed)
• Fade Golf Luke first ambassador post + cross-account boost
```

---

## When Data Pull is stale

If `Reviews/Data Pulls/` has no entry within the reporting window OR the latest is >10 days old:

```
Numbers due, Data Pull last ran [date]. Want me to run /data-pull before the report? Otherwise I will leave the Numbers section as "to follow on [day]".
```

Two paths:
- Maddie says yes → fire Data Pull, then resume report
- Maddie says no → write the section as "to follow, Data Pull queued for [day]"

---

## Cross-week intelligence

When the skill detects patterns across weeks, surface them in the report (sparingly, not every week):

- A brand has been below target 3 weeks running → flag in Slips/risks
- Engagement trending up or down 4+ weeks → mention in Numbers
- Same task slipping multiple weeks → call it out (critical persona)

These cross-week observations come from comparing the current report against the last 3 to 4 weekly reports.

---

## Rules

- Slack-formatted markdown (`*bold*`, single-line bullets, no headers larger than `*Section*`).
- Maddie's voice, not brand voice. Direct, plain English, honest.
- Under ~400 words. Glanceability for Tom and Harry.
- Headline is business impact, not activity. "X landed, Y now possible" not "did lots of work".
- Asks block sits at the TOP of the report (right after Headline), not buried. Tom and Harry must not have to hunt for what Maddie needs.
- Every "Done This Week" line answers "so what did this move". Activity logs do not belong.
- Every number carries a "so what" hook in the same bullet. Bare data points are anti-patterns.
- Last Week's Commitments section runs every week (after the first). Every commitment from last week's Next Week section is scored landed / partial / slipped with a one-line reason. No cherry-picking.
- Next Week priorities are framed as bets where applicable: hypothesis + metric. "We're betting on X, watching Y" not just "launch X".
- Risks always pair with the mitigation Maddie is running, not just the risk.
- Omit Asks, Last Week's Commitments, Slips/risks sections if genuinely empty. Do not pad. Padding signals a process problem, not a report problem.
- Save to `Reviews/Weekly Reports/[YYYY-MM-DD] Weekly Report.md`.
- Track cadence via `.weekly-report-state`, surface missed weeks in Daily Briefing.
- No em or en dashes.

---

## Anti-patterns

- Activity-log headlines ("Lots got done this week across three brands"). Headlines are business impact.
- Marketing-speak from the brand voices ("great engagement", "exciting campaigns").
- Over-claiming when numbers were flat or down.
- Bare data points without "so what" hooks (Tom and Harry are not marketing professionals; the hook is what makes the number useful).
- Buried asks. If Maddie needs a decision from Tom or Harry, it belongs at the top of the report.
- Cherry-picking last week's commitments (only listing the ones that landed). The honesty is the value.
- Padding Slips/risks with hypotheticals.
- Risk without mitigation (the founders will ask "so what are you doing about it" anyway, build it in).
- Next-week priorities as a task list with no bet ("launch Stride campaign Monday"). Should be the bet ("Stride patient-journey hook, watching cost-per-booking vs £42 baseline").
- More than 400 words (Tom + Harry have other things to read).
- Posting before Maddie has reviewed.
- Forgetting to track posting cadence so missed weeks slip silently.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-19 | Skill created. Slack-formatted output template, Maddie-voice not brand-voice rule, worked example for week of 26 May, Data Pull staleness handling, cross-week intelligence patterns, cadence tracking. |
| 2026-05-21 | **Cold-tested as Maddie (P2 first skill).** Scenario: invoked Wed 21 May mid-week, install-window state (no Reviews/Weekly Reports/, no Reviews/Data Pulls/, no `.weekly-report-state`, no live campaign files, Data Pull is a STUB pending Metricool MCP, Status.md has no "Awaiting" section). 9 edits applied. (1) Step 1 default-window now branches by weekday: Sun/Mon defaults to previous completed week, Tue-Sat asks Maddie to choose between last completed week or partial current-week. Stops silent half-week reports. (2) Step 2 Tasks-completion detection rewritten: per-row timestamp filter was unimplementable (Tasks.md is section-based); now uses `.weekly-report-state` timestamp as boundary, `git log` for per-row recency where available, falls back to "everything currently in Done is this week's, baseline week" on first run. (3) Step 2 Data Pull stub detection added (mirror Meeting Prep Brief Step 5 fix): if Data Pull is stub, skip the offer to run it, write Numbers section as "unavailable until Metricool MCP configured". (4) Step 2 Asks scope filter: exclude OS / internal-tooling brand tags, only marketing-domain rows surface as Asks of Tom + Harry. Without this, Tom's OS-build tasks would clutter the founders' weekly read. (5) Step 2 Risks source changed: removed reference to Status.md "Awaiting" section (does not exist in Maddie OS, same gap as Meeting Prep Brief Step 7); now Tasks.md Blocked rows are primary, Status.md changelog escalation lines secondary, cross-week stuck pattern flagged. (6) Step 2 Empty Campaigns folder fallback: when Information/Campaigns/ has only Archive (early install window), derive In Flight from Tasks.md In Progress + To Do next-2-weeks rows, noted in output so Maddie can trigger Campaign Brief Expander when ready. (7) Step 2 Next Week priorities source priority clarified: Tasks.md filtered to next-7-day deadlines is primary, Status.md "This Week's Priorities" is additive context only (Session End rotates it on the Sun/Mon boundary, mid-week it still describes the running week). (8) Step 5 folder pre-check added (self-heal Reviews/Weekly Reports/, install-window pattern). (9) Step 5 Slack MCP availability check added (mirror Daily Briefing 1d): channel name no longer hardcoded, cached to `[[Tech Stack]] ## Slack channels` on first run, Option A only offered when MCP + channel both available, plain fallback to Options B/C with explicit "MCP not connected" note when MCP is down. (10) Step 6 cross-skill claim about Daily Briefing surfacing missed weeks softened to a hook-to-verify pointer rather than an assumption (the missed-week surfacing change lands in Daily Briefing if not yet implemented; do not silently rely on it from here). |
| 2026-05-20 | **P3 research-first retrofit** per [[Continue - Research-First Skill Retrofits]]. Sources: Slack "How to Write a Status Report" + "How to Make the Most of Your Project Status Updates", Reclaim 2026 Weekly Status Reports for Teams, Geekbot Weekly Status Update guide (Slack and MS Teams async pattern), Week Blast 2026 8 Essential Weekly Status Report Examples, Sona Weekly Marketing Report Template guide, Dashthis "How to wow your bosses with weekly reports", Stackmatix Marketing Report Templates Formats That Get Read by Leadership, M13 (Pranav Piyush via Anvil) How to Improve Your Startup's Paid Marketing Report, AgencyAnalytics weekly reports, AskNeedle Your Weekly Marketing Report Template, Semrush 7 Free Marketing Report Templates. **Anchored on Tom + Harry as the audience** (owner-operators reading on Slack, 2-3 min skim, not marketing professionals reviewing an agency deliverable). Added What's Appropriate Here block (IS impact-led 2-3 min Slack read, IS NOT polished agency report / full data dashboard / task list / above 400 words). **Key findings folded in:** lead with business impact not activity; insights not data points ("traffic +12%, driven by X, produced +15% Y" beats "traffic +12%"); leadership reports must call out what is working, what needs improvement, what is next; explicit hypothesis + metric for next week's bets; honest scoring of last week's commitments builds trust over weeks; asks of leadership must be unmissable, not buried. **Edits:** new Step 2 sub-section Last Week's Commitments (read previous week's Next Week section, score every line landed / partial / slipped); new Asks block scanning Tasks.md for Tom/Harry-owned blockers and Status.md for decisions waiting on Tom + Harry sign-off; new insight test on Done This Week (each bullet must answer "so what did this move", reject pure activity logs); new "so what" hook rule on every number; new Next Week framing rule (hypothesis + metric where applicable, bet-framed not task-list-framed); Risks now require paired mitigation. Output template restructured: Headline tightened to business impact framing, new *Asks of Tom + Harry* block at top of report (right after Headline), new *Last Week's Commitments* section, Done This Week now framed as impact lines, Numbers section gained "so what" hook examples, Slips/risks gained mitigation requirement, Next Week reframed as bets with hypothesis + metric. Rules expanded with headline-is-impact-not-activity, asks-at-top-not-buried, every-line-answers-so-what, last-week-commitments-no-cherry-picking, next-week-as-bets, risks-paired-with-mitigation, no-padding-empty-sections. Anti-patterns expanded with activity-log-headlines, bare-data-points, buried-asks, cherry-picked-commitments, risk-without-mitigation, next-week-as-task-list. Stress-tested mentally against three scenarios: (a) first run (no previous report, Last Week's Commitments omitted cleanly), (b) typical week with mixed landed/slipped (honest scoring forces the slipped Stride Run Club edits to be visible, which is the value), (c) the existing worked example (Stride tag fix week) regenerated under new rules: Headline tightens, Asks block stays empty cleanly (no fabricated asks), Last Week's Commitments would show Master Marketing Document drafting landed and budget question waiting, Next Week bullet about nail surgery launch gains hypothesis + metric framing. British English verified. No em / en dashes per CLAUDE.md. Skill grew from ~235 to ~310 lines, single file. |
