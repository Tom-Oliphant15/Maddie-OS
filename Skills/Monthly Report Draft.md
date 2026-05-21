# Skill: Monthly Report Draft

---
triggers:
  - "monthly report"
  - "/monthly-report"
  - "draft my monthly"
  - "month end report"
type: Workflow
---

**Purpose:** Draft Maddie's monthly written marketing report for Tom + Harry. Longer-form than the Weekly Slack Report. Audience is "the leadership pair", not "the team channel". Combines numbers (Data Pull), narrative (what happened, why), and forward look (where we are going).

Phase 2 deliverable. First live run ~30 May. Sets the cadence for the rest of the year.

---

## What's Appropriate Here

The audience is Tom and Harry, working owner-operators of Fade Group running three small UK brands (Fade Golf, Stride, F&E Leamington). They will read this carefully but quickly. They want to know what changed, why, what £ bought, and what's next. They are not enterprise execs reading a CMO scorecard.

The 2026 best-practice frame this skill encodes:

- **"So What" discipline on every metric.** A metric earns its place in the report if a change in it would prompt a decision or action. If the answer to "if this doubled tomorrow, what would we do?" is "nothing", the metric is vanity and gets cut. 5 to 7 metrics per brand is the right volume; more becomes noise.
- **Goals-to-actuals framing**, not numbers-in-isolation. Every reported metric sits next to its target. Up / flat / down vs target, not a raw figure.
- **Spend and CPA reporting at small-business scale.** Tom + Harry want to see what £X bought. The skill reports total marketing spend per brand AND cost per acquisition (CPA = total spend / new customers / patients / members) where calculable. Attribution caveats stated explicitly: "we cannot prove channel X drove Y, but the window aligns."
- **Channel split where it changes the story.** Organic vs paid vs direct vs referral, when the brand has meaningfully distinct channels. Not a forced split if all activity is one channel.
- **Brand-building vs direct-response separation.** Some activity (Luke ambassador shoot, F&E content cadence) is brand-building with delayed payback. Some (Stride paid ads on nail surgery) is direct-response with this-month measurement. The report separates these so a flat brand-building month is not misread as failure.
- **Retention metrics for brands with retention dynamics.** Stride (patient repeat visit rate), F&E (member renewal / churn), Fade Golf (member renewal). Acquisition without retention is half the picture; the report includes one retention indicator per brand where retention is the business model.
- **Honest attribution.** Small-business reporting cannot model multi-touch attribution. The skill states what we can and cannot measure, treats correlations as correlations, and never claims causation that the data does not support.
- **Visualisation where it aids comprehension.** A single line chart of monthly trend or a bar comparing target vs actual is worth 200 words. Encourage Maddie to add a Sheets screenshot or simple chart when one would replace a paragraph. Not mandatory.

What this skill does NOT do at Maddie's scale:
- Multi-touch attribution modelling, marketing mix modelling, full LTV:CAC cohort analysis
- A/B test statistical significance frameworks (insufficient volume)
- Enterprise CMO scorecards, brand-lift studies, OKR cascade reporting
- Investor-update / board-pack framing (different audience, different document)
- Quarterly business review (QBR) heaviness folded into a monthly

---

## Context

*Load these files before running this skill:*

- [[Status]] for current state across all brands
- All four Weekly Slack Reports from the month (`Reviews/Weekly Reports/`)
- All Data Pulls from the month (`Reviews/Data Pulls/`)
- Active Campaign Brief Expander outputs (`Information/Campaigns/`)
- [[Fade Group]] for group-level context
- Master Marketing Document (Google Drive, via Drive MCP, if accessible)

---

## Quick Start

Maddie says:
- "monthly report for May"
- "/monthly-report"
- "draft my monthly"
- "month end report" (default: previous month)

Default scope is the previous full calendar month. Override: "monthly report for April".

---

## /goal integration

```
/goal output is well-structured written report (not Slack-formatted), under ~1500 words, contains 8 sections (Headline, Per-brand recap with goals-to-actuals + 5-7 metrics each + spend + CPA where calculable + channel split where meaningful + one retention indicator per brand with retention dynamics, Campaign results, What worked, What did not, Risks for next month, Next month priorities, Questions for Tom + Harry), every metric passes the "So What" test, attribution caveats explicit where claims are correlational, brand-building vs direct-response separated, every section grounded in data from Weekly Reports + Data Pulls (no invented numbers), written in Maddie's voice for Tom + Harry, saved to Reviews/Monthly Reports/. No em or en dashes. Stop after 8 turns if not met.
```

---

## Process

### 1. Determine the reporting window

Default: previous full calendar month (1st to last day).
Override: parse "April", "month of March", etc.

**Window-vs-OS-history pre-check (first-month framing).** Before pulling data, compare the window's start date against the OS's first install date (`.install-state.json` `install_completed_at` field) and the date of the first weekly report on file:

- If the window starts **before the OS existed** (e.g. April 2026 default but OS installed mid-May): tell Maddie. Offer three options:
  - A) Shift the window to the current partial month (e.g. "May 2026 to date")
  - B) Run a "first-month baseline" report covering the partial month with explicit framing
  - C) Cancel, no report
- If the window starts before the first weekly report was authored (so there are zero Weekly Reports to aggregate, expected on the very first monthly run): switch to **first-month baseline mode**. The report is honest about what is and is not measurable: report on the activity that happened (campaigns shipped, OS milestones, brand foundations laid) without inventing acquisition or spend tables that no upstream data supports.

This branch keeps the very first monthly from either silently failing or producing fake-looking metrics tables full of zeros.

### 2. Pull all month inputs

Folder existence pre-check first; create any missing target folder before reading.

```bash
# Adapt YYYY-MM to the actual window, e.g. 2026-05 for May 2026.

# All weekly reports in window
[ -d "Reviews/Weekly Reports" ] && ls "Reviews/Weekly Reports/" | grep "^2026-05" || echo "(folder missing or empty)"

# All data pulls in window
[ -d "Reviews/Data Pulls" ] && ls "Reviews/Data Pulls/" | grep "^2026-05" || echo "(folder missing or empty)"

# All campaign briefs (any modified in window, filter by mtime)
[ -d "Information/Campaigns" ] && find "Information/Campaigns" -maxdepth 1 -name "*.md" -newermt "2026-05-01" || echo "(folder missing or empty)"
```

**Data Pull state branching** (mirror Weekly Slack Report Step 2):
1. **Data Pull skill is a stub** (Metricool MCP not yet configured during the install window). Detect: check the Data Pull skill file's first 10 lines for `STATUS: Stub`. If stub, **do not offer to run Data Pull**. The Numbers per brand will come from the manual-data fallback in Step 3.
2. **Data Pull is live but stale or missing window data.** Offer to run /data-pull for the full window before drafting.
3. **Data Pull is live and fresh for the window.** Use the runs as primary source.

### 3. Aggregate per brand (apply "So What" discipline)

For each brand (Fade Golf, Stride, F&E), pull 5 to 7 metrics that pass the "So What" test. Default starter set:

**Acquisition layer (always include):**
- New customers / patients / members this month vs target
- Marketing spend total (paid ads + tools + freelancer time + Mark's billable hours where attributable)
- Cost per acquisition (CPA = spend / new acquisitions) where calculable
- Channel split where channels are meaningfully distinct (organic social, paid search, paid social, direct, referral)

**Manual-data fallback when Data Pull is stub or missing.** Acquisition counts and spend live in upstream systems before Metricool MCP is set up. Ask Maddie for the numbers explicitly, do not silently produce blank tables:

| Brand | Acquisition source | Spend source |
|---|---|---|
| Stride | Cliniko (new patient count for the month, filterable by service) | Google Ads + Meta Ads dashboards + any freelancer invoices |
| Fade Golf | Membership system (new members for the month) | Meta Ads + any sponsorship outlay + filming costs (Luke shoot, Jason filming) |
| Fire & Earth Leamington | Booking system / Linda's records (new members + new day-pass guests) | Meta Ads + any local-press / leaflet spend |

If Maddie cannot pull a particular number for this month, mark the row "data not available, [reason]" rather than inventing or zeroing. Honesty beats false precision.

**Retention layer (for brands with retention dynamics):**
- Stride: returning patient rate / repeat-visit count for the month
- F&E: member renewal rate / churn for the month
- Fade Golf: member renewal rate / churn

**Activity layer (informational, not the headline):**
- Total posts vs target
- Engagement / reach trend (only if it correlates to acquisition or retention, otherwise drop as vanity)
- Campaigns that ran (with status: completed / in flight / delayed)
- Tasks completed vs deadline (from Tasks.md Done section in window)
- Slack reports headline themes (what came up week after week)

Apply the three-question test to every metric before including:
1. Does the number drive a decision?
2. Does it correlate to revenue, retention, or customer acquisition?
3. If it doubled tomorrow, would Tom or Harry change anything?

If any answer is "no", cut the metric. Better five sharp numbers than fifteen blurry ones.

### 4. Separate brand-building activity from direct-response

Within the per-brand recap, split activity into:

- **Direct-response:** measurable this month (paid search ads, lead-gen landing pages, Stride nail surgery campaign with tracked conversions, F&E day-pass paid push)
- **Brand-building:** delayed payback (Luke ambassador shoot, organic content cadence, F&E community-building posts, audience persona builds)

This stops a flat brand-building month being misread as failure. Brand-building gets reported on what was DONE, not what was MEASURED.

### 5. Identify the headline

The single thing the report most needs to communicate. Drawn from:
- Biggest performance shift (vs target or vs prior month)
- Biggest milestone hit or missed
- Biggest learning that changes next month
- Biggest risk that needs Tom or Harry to act

Critical persona: if the month was middling, do not invent a headline. Say "steady month, no major wins or losses, [one sentence on what is queued]".

**First-month baseline headline framing.** If the report is running in first-month baseline mode (Step 1), the headline is not about performance, it is about the foundation laid. Frame as: "Marketing OS live from [install date], [N] brands now under structured cadence, baseline metrics for [partial-month window] captured below, full monthly reporting from [first full month]." Do not invent performance language for a month where measurement was only standing up.

Similarly, when a major capability has just landed (e.g. Stride Google tag fix unlocking paid measurement), the headline can mark the unlock and the first numbers it makes possible, even if the underlying month was quiet.

### 6. Compose the report

Full output template is in [[monthly-report-template]] (loaded when the skill runs). Eight sections: Headline, Per-brand recap (with 5 to 7 metrics goals-to-actuals table, channel split, direct-response vs brand-building activity, retention indicator, attribution caveats per brand), optional Visual snapshot, Campaign results, What worked, What did not, Risks (likelihood + impact + mitigation), Next month priorities, Questions for Tom + Harry (decisions with Maddie's recommendation), Appendix with data sources and method notes.

### 7. Voice and tone

The Monthly Report is written FOR Tom + Harry, FROM Maddie. Voice rules:

- **Direct and concise.** Not corporate. Not casual. Plain English written by someone who knows what they did and is reporting back to people she works closely with.
- **Honest.** What worked AND what did not. If a campaign flopped, say so and say why.
- **Forward-looking.** Each section connects to what is next, not just what happened.
- **Numbers without spin.** Up = up, flat = flat, down = down. No "challenging engagement environment".
- **Attribution honesty.** Never claim causation that the data does not support. "Engagement up 22% in the window of the Luke shoot" is correlational. "The Luke shoot drove a 22% engagement uplift" is not defensible without controlled data. Default to the correlational phrasing with an explicit caveat.
- **Every metric earns its place.** If you cannot answer "if this doubled tomorrow, what would Tom or Harry change?", do not include the metric.

This is different from the Weekly Slack Report (which is shorter, more punctuation-light, channel-formatted). The Monthly is a written document.

### 8. Save and surface

**Folder pre-check.** Ensure `Reviews/Monthly Reports/` exists; create if missing. Install does not currently create this subfolder on first run, self-heal rather than refuse.

Save to `Reviews/Monthly Reports/[YYYY-MM] Monthly Report.md`.

**Drive MCP availability check** for the Google Doc option (mirror Daily Briefing 1d):
- Drive / Workspace MCP connected → Option B available.
- Not connected → Option B replaced with "Copy as markdown for paste into Google Docs manually", with a one-line note "Drive MCP not connected, automated export unavailable until configured."

Tell Maddie:
> Monthly report drafted. ~[N] words. Ready for your review. Options:
> A) Open in editor for me to make changes before sending
> B) Format as a Google Doc to share with Tom + Harry directly [available only if Drive MCP connected]
> C) Done, you will send from here

---

## When inputs are missing or thin

**Weekly Reports missing:** Flag in the appendix: "Weekly reports were not run in W of [date] and W of [date]. Month data may be incomplete." Generate the best-possible from what is available.

**Data Pulls stale:** Offer to run fresh Data Pull for the month before drafting.

**No campaigns in month:** Note "no full campaigns ran this month" in Campaign Results section. Do not invent one.

**Stride tag-fix not landed:** flag in Stride section, repeat in Risks for next month.

---

## Critical persona at month end

Monthly report is the natural moment to surface drift:

- **A brand has been below target every week of the month:** flag in What did not, with the why, and what changes next month.
- **The same risk has appeared 3+ months running:** escalate it. "Stride WordPress access has been blocked since [date]. This is the [N]th month I am flagging it. Is the workaround Mark proposed enough, or do we need a different approach?"
- **A campaign delivered far below goal:** call it out specifically and lessons-extract.

Critical persona on monthly report is more material than on weekly because Tom + Harry actually read this carefully.

---

## Worked example

Full May 2026 worked example is in [[monthly-report-worked-example]]. Demonstrates the template applied across all three brands with full metrics tables, channel splits, retention indicators, attribution caveats, brand-building vs direct-response separation, action-hook bullets on What worked / What did not, likelihood-impact-mitigation Risks, and decision-framed Questions.

---

## Rules

- Written-document format, NOT Slack-formatted
- Under ~1500 words (worked example will run longer due to the metrics tables, that is acceptable)
- **5 to 7 metrics per brand**, every one passing the "So What" test. More than 7 becomes noise, fewer than 5 misses material context.
- **Goals-to-actuals framing** mandatory. Every metric sits next to its target with delta. No raw figures in isolation.
- **Marketing spend per brand** mandatory. Tom + Harry need to see what £X bought.
- **CPA reported where calculable** with attribution caveats stated.
- **Channel split** included where channels are meaningfully distinct (organic / paid search / paid social / direct / referral). Skip if all activity is one channel.
- **Retention indicator per brand** with retention dynamics (Stride patient repeat rate, F&E member churn, Fade Golf member renewal). Skip if not applicable.
- **Direct-response vs brand-building separated.** Brand-building reports activity done; direct-response reports measured results.
- **Attribution honesty.** Correlational claims phrased as correlational. Caveats in the Appendix.
- **"What worked" and "What did not" bullets each end with a "so we will [action]" hook.** Not just retrospective.
- **Risks framed with likelihood + impact + mitigation**, not a worry list.
- **Questions for Tom + Harry phrased as decisions** (Options A/B + Maddie's recommendation), not topics.
- Honest about what did not work
- Every section grounded in real Weekly / Data Pull inputs, not invented
- Critical persona on cross-month drift signals
- Save to `Reviews/Monthly Reports/[YYYY-MM] Monthly Report.md`
- No em or en dashes

---

## Anti-patterns

- Inventing campaigns or numbers when inputs are thin
- Corporate-marketing tone ("we delivered exceptional results")
- Vanity metrics (impressions, reach, follower count) reported without a connecting "so what"
- More than 7 metrics per brand (signal-to-noise collapses)
- Reporting numbers without targets (no goals-to-actuals framing)
- Skipping spend / CPA (Tom + Harry want to know what £X bought)
- Claiming causation where the data only supports correlation ("the shoot drove the uplift")
- Softening what did not work
- Padding "what worked" with weak items
- "What worked / What did not" bullets without a forward-looking action hook
- Risks as a worry list rather than likelihood + impact + mitigation
- Questions framed as topics not decisions
- Forgetting to update Next month priorities into Tasks.md after Tom + Harry sign off
- Treating a brand-building month as a failure because direct-response numbers are flat

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-19 | Skill created. 7-section written-report template, per-brand recap with tag-fix flag for Stride, campaign results with lessons extraction, critical persona on cross-month drift, worked example for May 2026. First live run targeted end May. |
| 2026-05-21 | **Guide extraction pass.** Skill had bloated to 494 lines after the research-first retrofit. Extracted the full Step 6 output template (~140 lines) to [[monthly-report-template]] and the full May 2026 worked example (~105 lines) to [[monthly-report-worked-example]]. Skill body now links to both rather than embedding. No content lost. Skill body now under 250 lines (workflow + rules + anti-patterns + changelog). |
| 2026-05-21 | **Cold-tested as Maddie (P2 #2).** Scenario: "monthly report for May" run on 30 May 2026 partial first-month, install was 18 May, no weekly reports yet (first scheduled wk of 1 June), no Data Pulls (Metricool MCP stub), empty Information/Campaigns/, no Reviews/Monthly Reports/ folder. 8 edits applied. (1) Step 1 first-month / window-vs-OS-history pre-check added: compares window start to install date AND first weekly report date, offers explicit "first-month baseline mode" with three-option route, stops the very first monthly either silently failing or producing zero-padded tables. (2) Step 2 bash snippets rewritten: replaced ambiguous `grep "[YYYY-MM-]"` regex-bracket placeholders with concrete patterns (`grep "^2026-05"`, `find -newermt "2026-05-01"`), added folder-existence pre-checks with `[ -d ... ]` guards, no more silent ls-failures on missing install-window folders. (3) Step 2 Data Pull state branching added (same pattern as Weekly Slack Report Step 2 fix): stub detection skips the offer-to-run; live-stale offers fresh run; live-fresh uses as primary source. (4) Step 3 manual-data fallback table added covering Stride (Cliniko), Fade Golf (membership tool), F&E (Linda's booking records) for acquisitions, plus per-brand spend sources (Google Ads / Meta Ads dashboards + freelancer invoices). Mandate "data not available, [reason]" cells over zeroing or inventing. (5) Step 5 first-month baseline headline framing added (foundation-laid framing instead of performance framing; major-capability-just-landed alt for months like the Stride tag fix unlock). (6) Step 8 folder pre-check added (Reviews/Monthly Reports/ self-heal). (7) Step 8 Drive MCP availability check added for Option B (mirror Daily Briefing 1d): if disconnected, replace with "Copy as markdown for paste into Google Docs manually" plus a plain fallback note. (8) Worked example guide gained a Note on maturity at the top warning that the example assumes a mature month, pointing first-run callers to Step 1 first-month mode + Step 3 manual-data fallback. Cross-skill install gap reaffirmed (Reviews subfolders not created on first install). Observation, not fixed: changelog ordering is non-chronological (2026-05-21 guide extraction entry sits between 2026-05-19 and 2026-05-20 retrofit), minor pre-existing formatting bug, left alone for now. |
| 2026-05-20 | **Research-first retrofit pass** per [[Continue - Research-First Skill Retrofits]] and the CLAUDE.md Skill Creation Discipline. Anchored on the actual audience (Tom + Harry, owner-operators of three small UK brands, reading carefully but quickly), not enterprise CMO scorecards. Ran Step 1c research filtered through that context. **Key findings folded in:** (a) "So What" test must apply to every metric (does it drive a decision, does it correlate to revenue / retention / acquisition, if it doubled tomorrow would anyone change anything); (b) 5 to 7 metrics per dashboard is the right volume, more becomes noise; (c) goals-to-actuals framing required, every metric needs its target alongside; (d) marketing spend per brand mandatory (Tom + Harry need to see what £X bought); (e) CPA reporting where calculable, with explicit attribution caveats; (f) channel split (organic / paid / direct / referral) where channels are meaningfully distinct; (g) retention metrics for brands with retention dynamics (Stride patient repeat rate, F&E member churn, Fade Golf member renewal) - acquisition without retention is half the picture; (h) brand-building vs direct-response separation prevents flat brand-building months being misread as failure; (i) attribution honesty (correlational phrased as correlational, no claimed causation); (j) visualisation encouraged where one chart replaces 200+ words. **Edits:** new What's Appropriate Here section near top (audience anchor + best-practice frame + what the skill does NOT do); Step 3 aggregate rewritten with structured 5-to-7 metrics per brand (acquisition layer + retention layer + activity layer) + three-question "So What" test embedded; new Step 4 separating brand-building from direct-response activity; Step 5 headline guidance kept; Step 6 output template rewritten with per-brand metrics tables (goals to actuals + trend), channel split, direct-response vs brand-building separation, retention indicator per brand, attribution caveats per brand, new Visual snapshot optional section, Campaign Results gaining Spend line, What worked / What did not bullets requiring "so we will [action]" hook, Risks reformatted as likelihood + impact + mitigation, Questions reformatted as decisions with Maddie's recommendation; Step 7 voice rules gained attribution honesty and "every metric earns its place"; worked example rebuilt with full metrics tables for all three brands at May 2026 reality (Fade Golf 5 metrics, Stride 6, F&E 5, including CPA, retention indicators, channel splits, attribution caveats, So What hooks on What-worked / What-did-not, likelihood-impact-mitigation Risks, decision-framed Questions); rules + anti-patterns substantially expanded (5-7 metric cap, goals-to-actuals mandatory, spend mandatory, CPA where calculable, correlational-not-causal language, action-hook bullets, brand-building-not-failure). Stress-tested mentally against May 2026 scenario (passes, all three brands have full metric tables with appropriate context, brand-building heavy month framed correctly, attribution caveats keep Stride pre-tag-fix data honest), hypothetical August scenario at full Smart-Bidding-and-multi-channel maturity (passes, channel split shows real value, retention metrics carry weight), worst-case quiet-flat month (passes, headline says "steady" plainly without inventing). Skill grew from 333 to 494 lines, single file. British English verified. No em / en dashes. **Sources:** Visme monthly report templates 2026 guide, Smartsheet free monthly marketing report templates, Unito 2026 Marketing Reporting KPIs and Tools guide, Porter Metrics free 2026 KPI report templates, Monday.com 2026 KPI dashboard templates, Beautiful.ai KPI marketing presentation template, Metrics Watch sample KPI templates 2026, DashThis KPI tracking templates, Genesys Growth 2026 CAC benchmarks (44 statistics), Magic Logix 2026 CPA calculation guide, MNTN CPA complete guide, Improvado CPA strategy and optimisation guide, Triple Whale CPA complete guide, Usermaven 2026 industry CAC benchmarks, Shopify vanity metrics 2026 guide, Lift Digital small business vanity metrics, Userpilot vanity metrics definition, ZoomInfo Pipeline B2B vanity metrics, WSI World Marketing Metrics That Matter 2026, Saras Analytics best marketing dashboards 2026, Analytics Beyond 10 must-track marketing dashboard metrics 2026, Improvado marketing dashboard examples 2026, Monday.com 2026 marketing dashboard scaling guide. |
