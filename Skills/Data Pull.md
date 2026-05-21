# Skill: Data Pull

---
triggers:
  - "pull the data"
  - "data pull"
  - "weekly numbers"
  - "monthly numbers"
  - "stride numbers"
  - "fade golf numbers"
  - "f&e numbers"
type: Workflow
---

**Purpose:** Gather analytics across Metricool (social), Google Ads, and Google Search Console for a brand or across all three brands, into one clean table. Maddie reviews and approves, then takes the numbers into reporting. Replaces ~half a day to a day of manual data entry per cycle.

---

## Context

*Load these files before running this skill:*

- [[Tech Stack]] — to know which data sources are connected
- The relevant brand Brain file for context (e.g. which campaigns ran in the period)

---

## Quick Start

Maddie says "pull the data for Stride this week" or "monthly numbers, all brands" or "weekly numbers". The OS asks for missing inputs (brand, period), pulls, presents.

---

## When to Use

- Weekly numbers ahead of a Slack weekly marketing report
- Monthly numbers ahead of the written marketing report (~30th of the month)
- Pre-meeting prep when Tom or Harry asks "how is Stride going"
- Mid-campaign check (was the bump real? did the ad spend convert?)

---

## Process

### 1. Gather inputs
- **Brand.** Fade Golf, Stride, Fire & Earth Leamington, or all three.
- **Period.** This week, last week, this month, last month, custom date range.
- **Sources.** Default: Metricool + Google Ads + Google Search Console. Maddie can narrow.

### 2. Pull from each source

**Metricool (via MCP):**
- Per platform: reach, impressions, engagement rate, follower change, top 3 posts
- Across platforms: aggregate engagement, biggest posting gap

**Google Ads (via `google-ads` CLI once installed; manual screenshot fallback until then):**
- Spend
- Clicks
- Impressions
- Conversions (depends on Stride tag fix landing)
- CTR
- Cost per conversion
- Top-performing keyword

**Google Search Console (via `google-search-console` CLI once installed; manual screenshot fallback until then):**
- Total impressions
- Total clicks
- Average position
- Top 5 queries
- Top 5 landing pages

### 3. Tag-fix dependency (Stride only, until resolved)
Stride Google Ads conversion data is unreliable until Mark's Google tag fix lands. Flag this in the output until the fix is confirmed.

### 4. Present the numbers
Single table per brand:

| Metric | This period | Previous period | Delta | Notes |
|---|---|---|---|---|
| ... | | | | |

Plus a short summary block: "Headline: [the one number that matters]. Watch: [the one thing trending wrong]."

### 5. Cross-reference to campaigns
Pull from Status.md and the Campaigns folder: which campaigns ran in the period. Match results to campaigns where possible. If a campaign launched mid-period and the numbers moved, surface the correlation (without claiming causation unless it is obvious).

### 6. Save
Output to `Reviews/Data Pulls/[YYYY-MM-DD] [Brand or All] [Period].md`. Make it copy-paste ready for the weekly Slack report or monthly written report.

### 7. Push back
Apply critical persona. If the numbers are bad, say so plainly. If Maddie is about to take a flattering snapshot to Slack, flag the underlying trend.

---

## Output Format

```markdown
# Data Pull, [Brand or All], [Period]

*Generated [YYYY-MM-DD HH:MM]. Sources: [list].*

## Headline
[The one number that matters this period.]

## Watch
[The one thing trending the wrong way.]

## [Brand] — Numbers

### Social (Metricool)
| Metric | This period | Prev | Delta |
| ... |

### Google Ads
[Note tag-fix dependency if Stride and not yet resolved.]

### Search Console

## Campaign cross-reference
[Which campaigns ran. Visible correlations.]

## Recommendations
[2 to 3 sharp recommendations from the numbers.]
```

---

## Fallback (Pre-MCP / Pre-CLI)

Until Metricool MCP is connected (Wed 21 May) and CLIs are installed (post Thu 29 May evaluation), Maddie can:
- Screenshot the relevant dashboards
- Drop the screenshots into `Information/Data Pulls/raw/[YYYY-MM-DD]/`
- Trigger the skill, which then OCRs / reads the screenshots and produces the same output table

This fallback is intentional. Maddie gets the report skill running Day 3 even if Metricool MCP is not in yet.

---

## Rules

- No em or en dashes
- British English
- Always cite the source (Metricool / Ads / SC)
- Flag any data source that was unavailable
- Critical persona on the recommendations

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-18 | Skill stub created during Maddie OS scaffold. To be fleshed out Wed 21 May once Metricool MCP is connected. |
