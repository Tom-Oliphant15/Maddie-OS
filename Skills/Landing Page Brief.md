# Skill: Landing Page Brief

---
triggers:
  - "landing page brief"
  - "/landing-page"
  - "landing page for"
  - "page brief"
  - "service page brief"
type: Workflow
---

**Purpose:** Per-service landing page brief grounded in current conversion-rate-optimisation practice. Drives the page builder (Mark for WordPress, Maddie for simpler builds) on WHAT goes on the page and WHY. Optimised for the brands Maddie serves (Stride, Fade Golf, Fire & Earth), with UK compliance baked in (PECR cookies, GDPR forms, CQC where applicable).

Used during Stride per-service Google Ads restructure (each service campaign needs a matched landing page), new service launches, page refreshes, and any campaign that needs a dedicated page.

---

## Context

*Load these files before running this skill:*

- The relevant brand Brain file
- Audience persona for the service (essential, drives page voice, trust signals, FAQ)
- Brand voice file (for headline tone)
- Linked Google Ads keyword list (so the landing page matches search intent for message match / Quality Score)
- Linked Campaign Brief Expander (for the broader campaign context)
- For Stride: relevant clinical claims approval status (Harry sign-off)

---

## Quick Start

Maddie says:
- "landing page brief for stride nail surgery"
- "/landing-page Fade Golf membership"
- "page brief for orthotic relaunch"

---

## /goal integration

```
/goal output saved to Information/Landing Page Briefs/[YYYY-MM-DD] [Brand] [Service].md, contains all required sections, every section tied to audience persona or campaign goal, conversion sequence (Relevance / Mechanism / Confidence / Action) explicit, message match to linked ad campaign verified, mobile-first CTA pattern specified, UK compliance section completed, no generic "industry best-practice" filler. Stop after 5 turns if not met.
```

---

## What's Appropriate Here

This brief is for Maddie running marketing across three small local UK businesses (Stride, Fade Golf, F&E), handing the brief to Mark for WordPress build. Pages drive bookings, memberships, or reservations from local customers. Traffic per page is modest (low hundreds to low thousands a month for most), with Stride paid-search pages the higher-volume exception. The brief is shaped to that reality, not to an enterprise CRO playbook.

Eight things the brief actually does (the rest is Mark's job or doesn't apply at this scale):

1. **Drives the page through the conversion sequence**: Relevance, Mechanism, Confidence, Action. Visitor questions answered in that order, or they leave.
2. **Picks a headline framework deliberately**: PAS for problem-led services (Stride, most cases), BAB for transformation (Fade Golf coaching), 4U's for time-bound offers (F&E events), JTBD for membership / lifestyle. Defaulting to one approach kills half of brand cases.
3. **Verifies message match to the source ad**: the ad's specific promise is visibly addressed on the page in the first few seconds. Only relevant for paid pages (mostly Stride) but where it applies, it is now an AI-driven Google Ads Quality Score factor (above-average landing page experience drops CPC ~36%).
4. **Names a single conversion goal per page**: secondary CTAs allowed but explicitly secondary. Multi-goal pages confuse and lose.
5. **Places trust signals by power**: named outcomes with photos > numbers with context > press > credentials > generic testimonials. Highest-power signal in the first screen, not buried at the bottom.
6. **Includes risk reversal**: free consultation, no-commitment trial, cancel anytime. Service businesses routinely skip this and pay the conversion tax.
7. **Reduces form fields ruthlessly**: every field answers "does this change what happens next?" If not, cut it. Form length is the single biggest controllable conversion lever.
8. **Bakes in UK compliance**: PECR cookie banner (equal-prominence Accept / Reject per ICO 2026), GDPR form consent (granular marketing opt-in separate from booking), CQC display and evidence-based claims for Stride.

**What this brief does NOT specify** (Mark's build decisions or out of scope at Maddie's volume):
- Specific Core Web Vitals targets, page speed budgets, or technical SEO. The brief asks Mark to confirm "under 2.5s LCP" as a sanity floor; he owns the implementation.
- Statistical A/B testing. Most Maddie pages don't have the traffic for valid tests. The brief proposes a single named variant to try (headline, CTA, or hero) as before-and-after, not a formal A/B test.
- Detailed analytics event schema. Mark configures conversion tracking; if the brief needs a non-default event (e.g. "phone-click on mobile" for Stride), it asks for that specifically.

---

## The Conversion Sequence (every page follows this)

Visitors ask four questions in this order. The page must answer them in this order or they leave at the unanswered step.

1. **Relevance.** "Am I in the right place?" Answer above the fold within 5 seconds. Headline names their pain or outcome in their words. Match the ad if traffic is from Google Ads.
2. **Mechanism.** "How does this work / what do I get?" Plain-English explanation of what the service is, who it's for, what happens. Process in 3 to 4 steps. Visual where useful.
3. **Confidence.** "Can I trust this? What's the risk?" Trust signals weighted by power, near the decision point. Risk reversal (free consultation, no commitment). Top objections handled in FAQ.
4. **Action.** "What do I do next?" One clear next step. CTA in their language. Friction-reducing assurance next to the button ("Takes 2 minutes", "No commitment", "We'll call you back within 24 hours").

The Sections block below is structured around this sequence. Section names can vary; the sequence does not.

---

## Headline Frameworks (pick one, name it in the brief)

Different services need different headline approaches. The brief names which framework it's using.

**PAS (Problem - Agitation - Solution).** Best for services that solve a clear, named pain. Example for Stride nail surgery: "End ingrown toenail pain. Same-week appointments, friendly local team." Stride works almost everywhere with PAS.

**AIDA (Attention - Interest - Desire - Action).** Best for unfamiliar services where the visitor needs to be walked through. Sequential across whole page, not just headline.

**BAB (Before - After - Bridge).** Best for transformation services. "Knee pain stopping you walking? Get back on the course in 6 weeks." Fade Golf coaching, F&E pivot moments.

**4U's (Useful, Urgent, Unique, Ultra-specific).** Best for time-sensitive offers and competitive markets. "Book your free 15-minute podiatry assessment this week, only at our Leamington clinic." Strongest when the offer is genuinely limited or unique.

**Jobs-to-Be-Done framing.** Best for membership / lifestyle. "Get a round in before work, every week" (Fade Golf). Names the job the visitor is hiring the service to do.

Specificity beats generality in every framework. "Quantify the benefit and name the pain" outperforms generic by a wide margin. The brief includes the specific framework chosen and why.

---

## Process

### Stage 1 - Gather inputs and apply context

Inputs:
1. **Brand**: Fade Golf / Stride / F&E
2. **Service / page subject** (specific service or campaign)
3. **Page purpose**: new / refresh / campaign-specific
4. **Existing page URL (if refresh)**
5. **Traffic source**: Google Ads / organic / direct (drives framework choice and message-match need)
6. **Linked ad campaign + keywords (if Google Ads):** if a finished keyword list exists, use it for message match. If not (the page is being drafted before [[Google Ads Keyword Builder]] has run), 3 to 5 example search queries Maddie or Mark expect for the service are sufficient to inform the page direction; the formal message-match verification happens once both the page and the ads are drafted. This removes the circular dependency between [[Google Ads Variation Generator]] (which routes here on no-URL) and the keyword skill
7. **Primary conversion goal** (single): booking / lead form / call / WhatsApp / membership signup
8. **Secondary conversion (optional)**
9. **Stride compliance flag**: clinical claims involved? Harry sign-off status?

Then load persona + voice + linked keywords + campaign brief. Cross-reference headline language to search-intent keywords, trust signals to persona Trust Signals, FAQ to persona Barriers, tone to brand voice.

**Persona-missing fallback** (mirror [[Google Ads Variation Generator]] Step 2, [[Google Ads Keyword Builder]] Step 2, [[Filming Brief Generator]] Stage 2). If no audience persona file exists for the service, offer Maddie three options before drafting:

- A) Run [[Audience Persona Builder]] inline for this service first (~15 min, builds a reusable Brain file that this brief, the keyword list, the ad variations, and the campaign brief all share)
- B) Best-guess from the brand Brain + service standard customer-language patterns; log assumptions in the brief header so they can be validated when persona work catches up
- C) Maddie supplies the pain + outcome triggers verbatim in 2 to 3 lines (and 5 to 15 customer search terms if she has them), skill uses those directly

Default if Maddie skips: A for high-ticket / repeated-use services; B for one-off pages with the assumption log.

Without one of these, headlines and FAQ drift to "industry best practice" filler and Trust Signals lose persona grounding.

### Stage 2 - Pick the headline framework

Choose one and name it in the brief: **PAS** (named pain - Stride, most cases), **BAB** (transformation - Fade Golf coaching, F&E pivots), **4U's** (time-bound or distinctive offer - F&E events, Fade Golf limited slots), **JTBD** (lifestyle / membership - Fade Golf membership), **AIDA** (unfamiliar service needing walk-through). Draft headline + sub-head using that structure.

### Stage 3 - Message match (Google Ads pages only - skip otherwise)

Two paths:

- **Ads already drafted** (linked keyword list + variations exist): confirm the page above-the-fold visibly addresses the ad's specific promise / audience / outcome in the visitor's first 5 seconds. State the match in the brief, ad promise vs page answer side by side.
- **Parallel build** (the page is being drafted before Variation Generator runs, common during the install window when no per-service ads exist yet): document the page's intended search-intent answers in the brief and label the message-match section "Pre-match draft, verify on re-run". Once Variation Generator produces the ads, re-run /landing-page or /pre-publish on the page to lock the match. Do not silently produce a "match confirmed" line when there are no ads to match against.

### Stage 4 - Compose the brief

Follow the output format below. Every section ties to the conversion sequence (Relevance / Mechanism / Confidence / Action).

### Stage 5 - UK compliance pass

Confirm and note in the brief:
- **PECR cookies**: banner must offer Accept All and Reject All with equal visual prominence (ICO 2026). Flag if current site banner doesn't comply, ask Mark to fix before launch.
- **GDPR forms**: marketing opt-in is a granular tick-box separate from booking submission. Privacy notice linked. Lawful basis: contract (booking) or consent (marketing).
- **CQC (Stride only)**: registration number + link visible (footer or trust section), claims evidence-based, no "guarantee" language for clinical outcomes, any specific outcome statement signed off by Harry.

**Compliance facts Brain cache** (mirror [[Filming Brief Generator]] Step 9c Release Form Facts pattern). The first time these facts are needed for a brand, the skill asks Maddie once, caches the answers to a `## Compliance facts` section in the brand's Brain file, and reuses on every subsequent brief. Fields per brand:

| Field | Stride | Fade Golf | Fire & Earth |
|---|---|---|---|
| Registered company name | yes | yes | yes |
| Registered company number | yes | yes | yes |
| Registered address | yes | yes | yes |
| Privacy notice URL | yes | yes | yes |
| Marketing withdrawal contact email | yes | yes | yes |
| CQC registration number | yes | no | no |
| Special category data (Article 9) flag | yes (health) | no | no |

Asking once, caching, reusing keeps the brief production fast and stops Maddie hunting for the same details on every run.

### Stage 6 - Save and surface

Save the brief. Propose one named variant to test (headline / CTA / hero) as before-and-after comparison, not a formal A/B test, unless the page is a high-volume Stride paid page where statistical testing is realistic. Surface to Maddie per the format at the bottom.

---

## Output Format

Full brief template is in [[landing-page-brief-template]] (loaded when the skill runs). The template covers 10 sections: header block, page purpose, above-the-fold (Relevance), seven page sections in order (Mechanism + Confidence), CTAs table, trust signals power-hierarchy table, FAQ, form fields with justifications, technical notes for Mark, UK compliance pass (PECR cookies / GDPR forms / CQC for Stride / WCAG 2.2 AA accessibility), and One Thing to Test Next.

---

### Save and surface

```bash
mkdir -p "Information/Landing Page Briefs"
# Write the file
```

**Slack MCP availability check** for Option A (mirror Daily Briefing 1d). If Slack MCP is connected, Option A is available. If not, replace with "Copy the brief to clipboard for paste into Slack DM" with a one-line note "Slack MCP not connected, automated DM unavailable until configured."

Tell Maddie:
> Landing page brief saved. Headline framework: [chosen]. [N] sections, [M] CTAs (single primary goal), [P] trust signals (top tier: [tier]), [Q] FAQ items. Message match: [confirmed / parallel build, verify on re-run / adjust]. UK compliance pass: [clean / X items to fix]. A/B test plan: [variable] vs control.
>
> Three options:
> A) Send the brief to Mark (drafts a Slack DM with the brief inline plus "any questions before building?") [available only if Slack MCP connected]
> B) Add the build task to Tasks.md with target date
> C) Done, you will share it from here

---

## Worked example

Full Stride nail surgery refresh worked example is in [[landing-page-brief-worked-example]].

---

## Rules

- **Conversion sequence is mandatory.** Every page brief follows Relevance > Mechanism > Confidence > Action. Section names can vary; sequence does not.
- **Headline framework named explicitly.** PAS / BAB / 4U's / JTBD / AIDA. Don't draft without picking one.
- **Specificity beats generality.** Headlines name the benefit AND the pain or audience. "End ingrown toenail pain" beats "Quality podiatry care".
- **Message match check for Google Ads pages.** State the ad promise and the page answer side by side. If they don't match, the page draft is wrong, not the ad. Skip for organic / direct pages.
- **Single primary conversion goal per page.** Secondary CTAs allowed but explicitly secondary.
- **Form fields each justify themselves.** Every field answers "does this change what happens next?" If no, cut it.
- **Trust signals placed by power.** Highest power above the fold and at decision points. Don't dump them in one block.
- **Risk reversal section is not optional.** Free consultation, no-commitment, cancel anytime - whichever applies.
- **UK compliance pass is mandatory.** PECR cookies, GDPR form consent, CQC for Stride.
- **Stride clinical claims need Harry sign-off.** Flag any claim that hasn't been signed off.
- **Mobile and speed floors stated to Mark.** Under 2.5s LCP, 16px text, 48x48 tap targets, sticky CTA / click-to-call for service pages. Brief states the floor; Mark owns the implementation. Do not specify enterprise CWV detail unless Mark asks for it.
- **One thing to test next, before-and-after by default.** Formal A/B testing only for high-volume Stride paid pages (>500 conversions / month).
- **Every section ties back to persona or campaign goal.** No "industry best practice" filler.
- **No em / en dashes anywhere in output.** Per CLAUDE.md / Tom OS paste-safe rule.
- **Save to `Information/Landing Page Briefs/[YYYY-MM-DD] [Brand] [Service].md`.**

---

## Anti-patterns

- Generic "About Us" or "Why Choose Us" sections that aren't tied to the conversion sequence
- All trust signals dumped in one block at the bottom of the page
- CTAs that say "Click here" or "Submit"
- Headline that doesn't name a benefit, pain, or audience
- FAQ that addresses objections nobody actually has (not from persona Barriers)
- Pages designed without checking matched keyword search-intent
- Form with fields that don't change what happens next
- Multi-goal page (booking AND newsletter AND brochure AND call) where everything is "primary"
- Trust signal placed only in footer (visitors who haven't scrolled never see it)
- Mobile design treated as a responsive adaptation of desktop
- Cookie banner with bigger "Accept All" than "Reject All" (now an ICO violation per 2026 guidance)
- Marketing opt-in pre-ticked or bundled with booking submission
- "Consider variants" as the next-test plan, OR running a formal A/B test on a page with too little traffic to be statistically valid
- Stride pages with clinical outcome claims that haven't been Harry-signed-off
- Brief that asks Mark for an enterprise CWV / event-tracking schema on a page that gets a few hundred visits a month - state the floor, let him build it
- Hero image over 500kb (kills LCP)

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-19 | Skill created. 7-section brief template, persona-grounded trust signals, progressive trust-signal placement, FAQ from persona Barriers, Stride compliance flag for clinical claims, technical notes section for tracking and mobile. |
| 2026-05-20 | **Tightened through business-context lens** per [[feedback_research_through_business_context]] and updated Skill Creation Discipline step 1c.1. The 2026-05-20 retrofit was over-engineered for Maddie's actual context (three small UK local brands, modest per-page traffic, Mark owning WordPress build). What stays: conversion sequence, headline framework choice, message match for Google Ads, single conversion goal, form-field discipline, trust signal power hierarchy, risk reversal, UK compliance (PECR / GDPR / CQC), worked example. What changed: "What Professionals Expect" rewritten as "What's Appropriate Here" with explicit "what this brief does NOT specify" block (Core Web Vitals detail, statistical A/B testing, full event schema - all Mark's domain or out of scope at Maddie's volume). Process compressed from 8 stages to 6 by merging inputs+context and folding save+propose-test together. Technical Notes block restructured as floors-to-Mark, not enterprise targets. A/B test section reframed as "One thing to test next" - before-and-after by default, formal A/B only for high-volume Stride paid pages. Rules list trimmed accordingly. Anti-patterns updated. Final length ~525 lines (was 575). |
| 2026-05-20 | **Research-first retrofit per [[Projects/Continue - Research-First Skill Retrofits]].** Added What Professionals Expect summary. New Conversion Sequence section (Relevance > Mechanism > Confidence > Action) as mandatory page architecture. New Headline Frameworks section: PAS, AIDA, BAB, 4U's, JTBD chosen deliberately per service type. New Message Match check for Google Ads pages (2026 AI-driven Quality Score factor, ~36% CPC lever). New Risk Reversal section. New UK Compliance pass: PECR cookies with equal-prominence Accept / Reject (per ICO 2026 update), GDPR-lawful form consent with granular marketing opt-in, CQC compliance block for Stride. Trust signals reorganised by power hierarchy (named outcome > number > press > credential > generic). Form-field rule: every field justifies itself (form reduction = 120% conversion lift). Single primary conversion goal enforced. Mobile-first treated as discipline not afterthought (16px text, 48x48 tap targets, sticky CTA, click-to-call). Core Web Vitals targets stated (LCP <2.5s, INP <200ms, CLS <0.1). Analytics events beyond conversion (scroll, abandonment, CTA clicks, FAQ expansion). A/B test plan section expanded: hypothesis, single variable, success metric, sample size, low-traffic fallback. Anti-patterns list expanded. Worked example updated. Sources cited: Apexure 2026 landing page CRO guides, Genesys Growth 2026 landing page statistics, Foundry CRO 2026 Google Ads landing page checklist, VWO landing page copywriting guide, Thrive Themes 2026 copywriting formulas, Incremys 2026 Core Web Vitals guide, Webnyxt mobile-first 2026, ICO PECR cookie guidance 2026 via CookieYes, Kiteworks UK Healthcare GDPR 2026, UK Care Consultants on CQC for independent clinics. British English verified, no em / en dashes per CLAUDE.md. |
| 2026-05-21 | **Guide extraction pass.** Skill bloated to 528 lines after the research-first retrofit. Extracted the full output template (280 lines) to [[landing-page-brief-template]] and the Stride nail surgery worked example (33 lines) to [[landing-page-brief-worked-example]]. Skill body now links to both rather than embedding. No content lost. Skill body now ~220 lines (workflow + rules + anti-patterns + changelog). |
| 2026-05-21 | **Cold-tested as Maddie (P2 #5).** Scenario: "landing page brief for stride nail surgery" on 21 May, install-window state (Stride voice STUB, no nail-surgery persona, no linked keyword list, no campaign brief, no Information/Landing Page Briefs/ folder, clinical claims involved → Harry sign-off required). 5 edits applied. (1) Stage 1 input #6 softened to remove circular dependency with [[Google Ads Variation Generator]] (Variation Generator routes here on no-URL, this skill required a linked keyword list, mutually blocking): now accepts 3 to 5 example search queries as sufficient input when Keyword Builder has not yet run, formal message-match locks on re-run once both exist. (2) Stage 1 persona-missing fallback added (mirror Variation Generator + Keyword Builder + Filming Brief Generator three-option pattern: run Audience Persona Builder inline / best-guess with logged assumptions / Maddie supplies pain + outcome triggers verbatim plus optional customer search terms). (3) Stage 3 Message Match gained explicit parallel-build branch: when no ads exist yet, document intended search-intent answers and label "Pre-match draft, verify on re-run", stops silent "match confirmed" lines against no ads. (4) Stage 5 Compliance facts Brain cache section added (mirror Filming Brief Generator release-form-facts pattern): canonical fields per brand (registered company name / number / address, privacy notice URL, marketing withdrawal contact email, CQC registration number for Stride only, Article 9 special-category-data flag for Stride only), asked once, cached to `## Compliance facts` in each brand's Brain file, reused on every subsequent brief. (5) Stage 6 Slack MCP availability check added for Option A (Send-to-Mark via Slack DM), mirror Daily Briefing 1d, plain fallback to clipboard copy if MCP not connected. Cross-skill chain order documented in the Step 1.6 softening, no longer circular. |
