# Skill: Social Trends Watch

---
triggers:
  - "social trends"
  - "/social-trends"
  - "what is working on social"
  - "social media trends report"
  - "trends report"
type: Scheduled / On-demand
---

**Purpose:** Monthly research and synthesis on what is currently working in social media creative + platform trends, focused on Maddie's three brand verticals (clinical/health, golf/sport, wellness/coworking). Outputs to `Reviews/Social Trends/[YYYY-MM].md`. Feeds [[Campaign Brief Expander]]'s creative direction section with current platform-specific guidance.

Auto-runs monthly via Daily Briefing state-file check. Available on-demand any time.

---

## Context

*Load these files before running this skill:*

- [[Fade Group]] for the three brands in scope
- [[Brand Voices/]] for current voice baselines (research findings are filtered through these)
- The last 2 to 3 trends reports from `Reviews/Social Trends/` to identify what is new vs ongoing
- `.last-trends-run` state file

---

## Quick Start

- Maddie says: "social trends", "/social-trends", "trends report", "what is working on social"
- Or Daily Briefing fires it automatically when `.last-trends-run` is more than 30 days old

---

## /goal integration

```
/goal report written to Reviews/Social Trends/[YYYY-MM].md, covers all 3 brand verticals (clinical/health, golf/sport, wellness/coworking), each vertical has 3 to 5 specific patterns flagged with sources, platform-level updates section (algorithm/format changes from the month), what to test in the next campaign brief section, .last-trends-run state file updated, OS Health metadata entry written. Stop after 8 turns if not met.
```

---

## Process

### 1. Pull the last 2 reports for context

```bash
ls "Reviews/Social Trends/" 2>/dev/null | sort -r | head -2
```

Read them. Identify:
- What patterns the OS flagged last month and the month before
- What has been recommended to test
- What is starting to feel old (3+ months running)

This avoids re-flagging the same trend every month as if it were new.

**First-run case (no prior reports).** If the folder is empty or does not exist yet, skip reconciliation entirely. Output notes "baseline report, no prior runs for comparison" in the headline paragraph and the reconciliation section is omitted from the saved file (do not write an empty section). The "what is starting to feel old" drop list is also omitted; nothing has been flagged 3 months running on month 1.

### 2. Run a multi-source research pass

**Tool availability pre-check.** This skill depends on WebSearch (the Anthropic web-search tool). If WebSearch is unavailable in the current session, refuse cleanly:

> Social Trends Watch needs WebSearch. It is not available in this session. Re-run when WebSearch is reachable, or check the Tech Stack note on which sessions have web tools enabled.

Do not produce a report from memory/training data. The whole point of the skill is current-month synthesis with cited sources.

**Date resolution.** Resolve `[current month]` and `[current year]` placeholders from the system date at run time. If Maddie has invoked the skill late in a month (e.g. 28th), use that current month, not the next one.

Use WebSearch. 5 to 8 search angles, parallel where possible.

**Vertical-specific (3 per brand):**
- "[Clinical health / podiatry / private medical] social media trends [current month] [current year]"
- "[Golf membership / boutique sport club] social media engagement [current year]"
- "[Wellness / coworking / retreat] social media content patterns [current year]"

**Platform-level (2 to 3):**
- "Instagram Reels algorithm update [current month]"
- "TikTok format trends [current month] [current year]"
- "[Specific platform if you spot a major change] [current month]"

**Creative-format-level (1 to 2):**
- "Short-form video best practice [current month]"
- "Caption length engagement data [current year]"

**Cap rules:**
- Max 8 search angles total
- Max 3 sources cited per finding
- If a source is paywalled / non-credible, do not cite it

### 3. Filter for relevance

Not every trend matters for Maddie's three brands. Apply this filter:
- **Drop:** trends that need >£10k/month budget (TikTok Shop creator partnerships, paid influencer programs, etc.)
- **Drop:** trends specific to verticals Maddie does not serve (e.g. e-commerce shoppable feed for brands she has no products in)
- **Drop:** trends that contradict the brand voice (e.g. shouty viral hooks contradict Stride's clinical-warm voice)
- **Keep:** trends that small brands with limited spend can act on this month or next
- **Keep:** algorithm changes that affect organic reach regardless of budget
- **Keep:** content format shifts (longer/shorter video, caption format, story patterns)

### 4. Synthesise

Per brand vertical, identify 3 to 5 specific patterns to flag. For each:
- The pattern in one sentence (plain English, no jargon)
- Why it is relevant to Maddie's brand
- One specific way to test it in the next campaign
- Source citation

For platform-level updates:
- The change in one sentence
- What it means for Maddie's posting strategy
- When to act on it

### 5. Write the report

Use the full output template in [[social-trends-watch-template]]. Save to `Reviews/Social Trends/[YYYY-MM].md`. The template covers: headline paragraph, "what is working" by brand vertical (3 to 5 patterns each, with why / how to test / source), platform-level updates table, "what to test in the next campaign brief" priority list, "what is starting to feel old" drop list, sources list, and reconciliation against previous reports.

**Overwrite guard.** If `Reviews/Social Trends/[YYYY-MM].md` already exists (Maddie re-running mid-month), do not silently overwrite. Ask:

> A report for [Month] already exists. Replace it, save as `[YYYY-MM] mid-month update.md`, or cancel?

Default to "save as mid-month update" if Maddie skips, never silent overwrite.

### 6. Update state and commit

```bash
cat > .last-trends-run <<EOF
{
  "last_run": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "report_path": "Reviews/Social Trends/[YYYY-MM].md",
  "verticals_covered": ["clinical", "golf", "wellness"]
}
EOF
```

**Commit + push** (defensive). Run `git rev-parse --is-inside-work-tree` first. Branches:
- Inside a git repo with remote configured → `git add .last-trends-run "Reviews/Social Trends/" && git commit -m "Social trends report [YYYY-MM]" && git push`. If push fails (auth / no remote / divergence), log to OS Health "report saved, commit deferred to next session" and continue, do not fail the whole run. Mirror Session End L1/L2/L4 fallback semantics, the report is the value, the commit is housekeeping.
- Not inside a git repo (install-window edge before Maddie's repo is initialised) → skip commit silently, log "git repo not yet initialised, report saved locally only" to OS Health. Install completion will pick up these files on first commit.

### 7. Write to OS Health (metadata only)

```markdown
### YYYY-MM-DD HH:MM, Social Trends Watch

**Trigger:** automatic (Daily Briefing surfaced) / manual
**Verticals covered:** clinical, golf, wellness
**Patterns flagged:** [total count across verticals]
**Sources cited:** [count]
**Goal status:** met / partial
```

(NEVER log the report content. Metadata + counts only.)

### 8. Tell Maddie

If Maddie ran the skill manually, surface a 2-line summary + the report file path:

> Trends report for [Month] saved to Reviews/Social Trends/. Headline: [1 line]. Top 3 patterns to test next campaign: [3 short bullets]. Full report at [path].

If it ran via Daily Briefing's monthly trigger, the briefing surfaces:

> Social Trends report for [Month] is in. [1-line headline]. Worth reading before your next campaign brief.

---

## Integration with Campaign Brief Expander

When Campaign Brief Expander runs Step 2 (Brain context audit), it now includes:

```
| Latest Social Trends report | Locked / Stale (>45 days) | [report file path] | Use latest patterns? |
```

If the latest report is fresh (within 30 days), CBE pulls the "What to test in the next campaign brief" section and references it in Section 15 (Creative direction).

If the report is stale (45+ days, scheduled run missed), CBE flags: "Social Trends report is stale. Want to run /social-trends now (5 to 10 min) before generating the brief?"

---

## Cadence and self-discipline rules

- **Monthly is the right cadence.** More often = noise. Less often = stale.
- **Do not flag the same trend more than 3 months running.** If it has been flagged 3 months and is still working, it is not a trend, it is part of how social media works. Move it to the brand voice or the platform-format reference docs.
- **Cite sources.** No claim without a link. If a "trend" cannot be sourced, it is not in the report.
- **Filter for affordability.** Maddie's three brands are small-budget. Trends that need £10k/month are noise.
- **Reconcile with previous reports.** Avoid groundhog day. Each report should show what changed vs last month.

---

## Anti-patterns

- Generic "video is hot in 2026" findings (no specific action)
- Trend-of-the-week chasing (one viral moment is not a trend)
- Citing 10+ sources for one finding (looks rigorous, is noise)
- Skipping the "what to test" section (the whole point is action, not awareness)
- Treating every report as new even when patterns are continuing (use reconciliation section)
- Logging the content to OS Health (privacy boundary holds even on synthesised research)

---

## Worked example

Abbreviated June 2026 report covering all three brand verticals is in [[social-trends-watch-worked-example]].

---

## Rules

- Monthly cadence. Override only on Maddie's explicit request.
- Cite every claim with a source link.
- Filter for small-brand affordability.
- 3 to 5 patterns per vertical maximum.
- Sources section at the bottom is mandatory.
- Reconciliation with previous reports is mandatory.
- Metadata only to OS Health.
- No em or en dashes.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-19 | Skill created. Monthly cadence, 3 brand-vertical focus (clinical/health, golf/sport, wellness/coworking), 8-search-max research pass, affordability filter, reconciliation-with-previous-reports discipline, integration with Campaign Brief Expander Section 15. Auto-fires via Daily Briefing state-file check at >30 days. Worked example for June 2026. Triggered by feedback that CBE creative direction was generic. |
| 2026-05-21 | **Guide extraction pass.** Skill body trimmed from 335 lines to keep it lean. Extracted the full report output template (82 lines) to [[social-trends-watch-template]] and the abbreviated June 2026 worked example (49 lines) to [[social-trends-watch-worked-example]]. Skill body now links to both rather than embedding. No content lost. Also removed two em dashes that appeared inside the worked example (now expressed with commas / "to" range, per Tom OS paste-safe rule). |
| 2026-05-21 | **Cold-tested as Maddie (P2 #6).** Scenario: first ever manual /social-trends run on 21 May, Reviews/Social Trends/ folder exists but empty, no `.last-trends-run` state file, all voice files STUB, WebSearch availability unverified. 5 edits applied. (1) Step 1 first-run case added: empty folder skips reconciliation, baseline-report framing, omits reconciliation + "feel old" sections from saved file rather than writing empty sections. (2) Step 2 WebSearch availability pre-check added: refuse cleanly with explanation if WebSearch is unreachable, do NOT produce a report from training-data memory (the whole point is current-month sourced synthesis). Also clarified date-resolution rule (resolve `[current month]` / `[current year]` placeholders from system date at run time). (3) Step 2 ambiguous "Quick Research / Web Search" reference cleaned up to plain WebSearch (Quick Research is Tom OS terminology, not present in Maddie OS). (4) Step 5 overwrite guard added: if `Reviews/Social Trends/[YYYY-MM].md` already exists, ask before overwriting, default to `[YYYY-MM] mid-month update.md` rather than silently overwriting a prior monthly report. (5) Step 6 git commit gracefulness added (mirror Session End L1/L2/L4 fallback): `git rev-parse --is-inside-work-tree` guard, push-failure path that logs "commit deferred" to OS Health and continues, no-git-repo install-window path that skips commit silently with OS Health note. Report is the value, commit is housekeeping; never fail the run on git plumbing. |
