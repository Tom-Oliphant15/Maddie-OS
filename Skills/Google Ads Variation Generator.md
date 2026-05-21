# Skill: Google Ads Variation Generator

---
triggers:
  - "google ads variations"
  - "/ads-variations"
  - "headlines for"
  - "ad copy for"
  - "google ads for"
type: Workflow
---

**Purpose:** Generate a full Google Ads asset suite for one Responsive Search Ad (RSA): up to 15 headlines + 4 descriptions + sitelinks + callouts + structured snippet sets + starter negative keywords, with optional pinning guidance and a Message Match check against the landing page. Hard character limits enforced (Google rejects over-limit). Variants are MEANINGFULLY different across documented angle clusters, so Google's machine learning has variety to optimise against and Ad Strength reaches Good or Excellent.

Used heavily during the Stride per-service Google Ads restructure (post-tag-fix). Also feeds Campaign Brief Expander's Google Ads section.

---

## What's Appropriate Here

Maddie is running Google Ads directly across three small UK local brands (Stride, Fade Golf, F&E Leamington), budgets typically £500 to £2,000/month per brand, no agency layer. The skill produces output Maddie pastes into the Google Ads UI.

The 2026 best-practice frame this skill encodes:

- **Asset volume:** max out the slots Google offers. Up to 15 headlines + 4 descriptions per RSA, plus the full Assets layer (sitelinks, callouts, structured snippets, location, call). Going from "Poor" to "Excellent" Ad Strength delivers ~15% more clicks AND conversions per Google's own data. Restricting to 10 headlines (the old cap) leaves performance on the table.
- **At least 2 RSAs per ad group** per Google's own guidance, ideally with unique Final URLs. The skill outputs enough material for one strong RSA AND flags what to vary for the second.
- **Pinning sparingly:** legal disclaimer, brand-name-must-appear, regulated-claim only. Heavy pinning collapses an RSA into a fixed ad and removes Google's optimisation surface.
- **Negatives as a discipline, not a one-shot list:** good accounts grow to hundreds of negatives curated over time. The skill produces a starter 10 to 15 negatives and frames the ongoing-curation rhythm.
- **Quality Score is a diagnostic, not an input:** Ad Rank uses the same components (expected CTR, ad relevance, landing page experience). Landing page experience carries roughly half the weight. The skill enforces Message Match between ad headlines/descriptions and the landing page; if there is a mismatch, it surfaces a flag back to Landing Page Brief.
- **Match types:** phrase or exact as default for small UK budgets; broad-match only after 30+ conversions/month AND a curated negatives list. The skill flags match type recommendation per keyword cluster.

What this skill does NOT do at Maddie's scale:
- Performance Max creative production (different campaign type, separate skill if needed).
- AI Max / AI-driven Search campaign architecture (still emerging, complex, not where Maddie's volume sits).
- Account-level Quality Score monitoring dashboards or enterprise A/B significance testing.
- Replace Tone Check, Landing Page Brief, or Campaign Brief Expander. Pairs with all three.

---

## Context

*Load these files before running this skill:*

- The relevant brand Brain file
- The relevant brand voice file (for tone if not stub)
- Audience persona file for the service if it exists
- Linked campaign brief if one exists
- Past ad performance from `Reviews/Data Pulls/` if available (so the generator learns what is working)

---

## Quick Start

Maddie says:
- "google ads variations for stride nail surgery"
- "/ads-variations Fade Golf membership"
- "headlines for the orthotics campaign"

---

## /goal integration

```
/goal output contains 15 headlines (each <=30 chars) clustered into 4+ angles with MEANINGFUL difference (not word-swaps), 4 descriptions (each <=90 chars), 6 sitelinks (link text <=25 chars, two-line description <=35 chars each line, unique landing-page paths), 6 callouts (<=25 chars each), 1-2 structured snippet sets (header from Google's defined list + 3-10 values <=25 chars each), 10-15 starter negative keywords with reasons grouped by category, Message Match check against landing page URL, pinning recommendation (default none / where compliance forces it), match-type recommendation per keyword cluster, output saved to Information/Ad Variations/[YYYY-MM-DD] [Brand] [Service].md, all character counts validated, no em or en dashes, no smart quotes. Stop after 4 turns if not met.
```

---

## Process

### 1. Gather inputs

1. **Brand:** Fade Golf / Stride / F&E Leamington
2. **Service / focus:** what is being advertised (e.g. "nail surgery", "membership", "orthotic assessment")
3. **Final URL (mandatory):** the exact landing page this ad sends traffic to. Needed for Message Match check in Step 8.

   Three branches if Maddie can't supply a Final URL:
   - **No service-specific page exists yet, only the generic homepage** → flag upfront. Generate the ad suite, but pre-flag the Message Match risk and recommend running [[Landing Page Brief]] for a dedicated nail-surgery / membership / day-pass landing page before the ads go live.
   - **No URL at all (the brand site doesn't cover this service)** → refuse to proceed and route to Landing Page Brief first. Without a destination, Ad Rank's landing page component (~half the Quality Score signal) is structurally broken. Ad variations generated against nothing is wasted output.
   - **URL not yet decided but a draft brief is in flight** → proceed with a `Final URL TBC, awaiting LP brief approval` placeholder and tag the saved output for re-running once the URL is locked.
4. **Campaign context (optional):** is there an existing Campaign Brief Expander output for this? If yes, load it for goal + audience.
5. **What is in market already (optional):** Maddie can paste existing ad copy or link to the current ad group. Helps avoid producing variants too close to what is already running.
6. **Pinning constraints (optional):** any headline or description that MUST appear (legal disclaimer, brand-name requirement, regulated-claim wording). Default is none. Pinning is opt-in, not default.
7. **Match-type intent:** is this ad group running phrase / exact / broad? If unknown, the skill recommends phrase-default for low-volume campaigns.

### 2. Apply context

Load brand voice + audience persona.

**Voice stub handling.** If voice is stub, flag and proceed (Google Ads copy is constrained enough that voice stub matters less than for organic copy). Output gains a "Voice file is stub, headline tone applied at best-guess" line in the header block.

**Persona-missing fallback** (mirror Filming Brief Generator Stage 2). If no audience persona file exists for the service, offer Maddie three options before generating:
- A) Run [[Audience Persona Builder]] inline for this service first, then resume (recommended when the persona will be reused for organic content, landing page, and future ads)
- B) Best-guess persona from the brand Brain + service knowledge, downgrade headline-confidence one notch, persist the assumptions used in the output header block so they can be validated later
- C) Maddie supplies the pain + outcome triggers verbatim in 2 to 3 lines, skill uses those directly without inventing audience

Without one of these, headlines drift to generic "expert care for your needs" filler and Ad Relevance suffers. Default option if Maddie skips: A on a high-ticket service (Stride orthotics, Fade Golf membership) where conversion value justifies a real persona; B on a lower-ticket or already-well-understood service.

**Past ad performance.** Load `Reviews/Data Pulls/` if available. If no Data Pulls exist yet (install window pre-Metricool MCP), note in output header "first paid campaign on record for [Brand] [Service], no historical baseline. The first 30 days are calibration not optimisation; expect to add ~10 to 20 negative keywords from the Search Terms report in week 1."

### 3. Identify angle clusters

Before generating headlines, propose 4 to 6 ANGLES the variants should cover. Variety drives Ad Strength; clusters guarantee the 15 headlines are not word-swaps:

- **Pain-and-relief angle** (the problem, the resolution)
- **Speed angle** (same-week, fast, immediate)
- **Local-credibility angle** (Leamington, Warwick, local team)
- **Price angle** (from £X, free consultation)
- **Reassurance angle** (friendly, not scary)
- **Authority angle** (experienced, specialist)
- **Outcome angle** (your life after)
- **Brand-name angle** (Stride, Fade Golf, F&E Leamington - useful as a pinned slot if brand recognition matters)
- **Keyword-match angle** (headline contains the core query keyword verbatim, signals relevance to both user and Google)

Pick 4 to 6 that fit the brand + service. Always include Keyword-match angle (Ad Relevance / Quality Score driver). Confirm with Maddie before generating headlines so she can adjust the cluster.

### 4. Generate headlines (15 total, distributed across clusters)

Hard rules:
- **Max 30 characters each** (count spaces). Reject any over.
- **Aim for length variety:** mix short (15 to 20 chars) and long (25 to 30 chars). Length variety improves Ad Strength and gives Google more layout flexibility.
- **At least 3 headlines contain the core query keyword verbatim** (Ad Relevance driver). E.g. for "nail surgery" service, at least 3 headlines say "Nail Surgery".
- **No em or en dashes.** ASCII hyphens fine.
- **No smart quotes.** ASCII apostrophes (`'`) only.
- **Title Case** (Google convention).
- **No double exclamations, no all-caps words**, except brand names if styled.
- **No repeated language across headlines** (Ad Strength penalises redundancy).
- **Each headline can stand alone** (Google may serve them in any combination of 1, 2 or 3 with the brand name).

Distribute across clusters: target ~3 headlines per cluster across 5 clusters, or ~4 across 4 clusters. Always include the Keyword-match cluster.

### 5. Generate descriptions (4 total)

Hard rules:
- **Max 90 characters each.**
- **End with implicit or explicit CTA**.
- **At least 2 descriptions contain the core query keyword verbatim** (Ad Relevance).
- **Combinable**: any pair should make sense together (Google may show in pairs).
- **No fluff fillers** ("at our clinic", "with our team") unless they earn the chars.

### 6. Generate the asset suite (sitelinks + callouts + structured snippets)

These are Google's "Assets" layer (formerly Extensions). Using the full Assets layer delivers ~10 to 15% CTR uplift per Google's own data and is treated as core, not optional, in the 2026 auction. Generate alongside the headlines/descriptions, even if Maddie eventually only deploys a subset.

**6a. Sitelinks (6, one per relevant landing page path):**
- Each has: link text (max 25 chars) + two description lines (each max 35 chars)
- Each must point to a different, relevant URL (not the same Final URL as the main ad)
- Healthcare / local-service patterns that work well: "Book Online", "Pricing", "Treatments We Offer", "Meet the Team", "Find Us", "Patient Reviews"
- Match the brand: Fade Golf might use "Membership", "Lessons", "Practice Bays", "Book a Tee Time", "Our Pros", "Tour the Site"
- Skip if the brand site doesn't have a deep-link surface (single-page sites get 0 to 2 sitelinks)

**6b. Callouts (6, non-clickable benefit statements):**
- Max 25 chars each
- Highlight value, not categories (categories are structured snippets territory)
- Examples: "Same-Week Bookings", "Free 15-Min Consultation", "Local Leamington Team", "Open Saturdays", "10+ Years Experience", "No Pressure Approach"
- Keep concrete and proof-able - vague callouts ("Best in Town") trigger Google policy reviews

**6c. Structured snippets (1 to 2 sets):**
- Pick from Google's defined header list: Services, Types, Brands, Courses, Insurance Coverage, Degree Programs, Featured Hotels, Models, Neighbourhoods, Service Catalog, Shows, Styles, Amenities, Destinations, Featured Specials
- Each header gets 3 to 10 values (each value max 25 chars)
- For Stride: header `Services` with values "Nail Surgery", "Orthotic Assessment", "Sports Podiatry", "Diabetic Foot Care", "Children's Podiatry"
- For Fade Golf: header `Amenities` with values "Practice Bays", "Coaching Studio", "Lounge", "Pro Shop"
- Structured snippets are category-organising, not value-selling. Use callouts for value.

### 7. Pinning recommendation

Default: pin nothing. RSAs perform best when Google has full freedom to test combinations.

Recommend pinning ONLY when:
- A legal disclaimer or regulated-claim wording must appear in every ad (e.g. financial services FCA disclosure - unlikely for Maddie's brands).
- The brand name must appear in every served ad (consider pinning the brand-name headline to Position 2 or 3).
- Strong historical data shows a specific headline always wins (unlikely on small-budget campaigns).

If pinning is recommended, note: heavy pinning collapses the RSA into something close to the old fixed-format ad and removes most of Google's optimisation surface. Pin one or two assets at most.

### 8. Message Match check against landing page

Open the Final URL provided in Step 1.3. Check:
- Does the H1 of the landing page repeat (or near-repeat) the core query keyword?
- Does the page's primary CTA match the implicit CTA in the descriptions?
- Is there a price / offer mentioned in the ad that the landing page confirms or contradicts?

If mismatch: flag back to Maddie with a note like "Headlines promise same-week bookings; landing page H1 says 'Welcome to Stride Clinics'. Recommend updating the landing page H1 to 'Same-Week Nail Surgery in Leamington' or running Landing Page Brief on a new page." Landing page experience carries roughly half the Quality Score weight - this is the highest-impact lever the skill can flag.

### 9. Generate negative keywords (starter list, 10 to 15)

This is a STARTER list, not a final list. Good Google Ads accounts grow to hundreds of negatives curated over months. The output flags negatives as a discipline to maintain, not a one-time task.

Draw starter negatives from:
- **Free / cheap intent** ("free", "diy", "home remedy")
- **Job-search intent** ("jobs", "training", "course", "career", "salary") for service businesses
- **Wrong-product intent** (e.g. for nail surgery: "fake nails", "nail polish", "manicure")
- **Locations out of catchment** (e.g. "london", "manchester", "birmingham" if firmly Leamington-local)
- **Out-of-scope variants** (e.g. for adults-only services: "child", "kids", "paediatric")
- **Competitor names** (if relevant - only after Maddie confirms competitor list with Tom)
- **Information-seeking intent** ("what is", "how to", "definition") if the ad is purely commercial

Output flags "after 30 days running, pull Search Terms report and add 5 to 10 more negatives weekly until the list stabilises".

### 10. Compose output

Full output template lives in [[google-ads-variation-template]] (loaded when the skill runs). Template covers: header block (Final URL, voice, pinning, match-type, Message Match verdict), angle clusters used, 15 headlines table (char + angle + pin), 4 descriptions table, assets layer (6 sitelinks + 6 callouts + 1 to 2 structured snippet sets), suggested combinations to test, second-RSA variation strategy, Message Match check block, starter negative keywords table with ongoing-curation note, "What to do next" checklist, and Linked references.

### 11. Save and surface

**Folder pre-check.** Ensure `Information/Ad Variations/` exists; create if missing. Install does not currently create this subfolder on first run, self-heal rather than refuse.

Save to `Information/Ad Variations/[YYYY-MM-DD] [Brand] [Service].md`. Tell Maddie:
> Generated 15 headlines across [N] angles, 4 descriptions, 6 sitelinks, 6 callouts, 1-2 structured snippet sets, [N] starter negatives. All within char limits. Message Match: [pass / flag]. Pinning: [none / specific]. Want me to A) format as a copy-paste block for Google Ads, B) draft the Tasks.md follow-ups for the 2-week + 30-day reviews, C) run Tone Check on the headlines, D) done?

---

## Worked example output (Stride nail surgery)

Full worked example output for the Stride nail surgery campaign lives in [[google-ads-variation-worked-example]]. Shows the complete suite: 15 headlines across 5 angles, 4 descriptions, 6 sitelinks, 6 callouts, 1 structured snippet set, 12 starter negatives, Message Match pass, and the "what to do next" checklist exactly as Maddie would receive it.

---

## Character-limit enforcement

The skill counts characters PRECISELY before output. If any headline is over 30 or description over 90, regenerate that specific one. Do not pass through over-limit copy.

Counting rule: every visible character including spaces. Smart quotes count as their character equivalent. The skill uses ASCII apostrophes (`'`) not smart quotes.

---

## Voice considerations

- Google Ads is constrained enough that brand voice is half-applied. Tone matters, vocabulary use/avoid matters, but sentence rhythm is largely dictated by char limits.
- Tone Check on headlines and descriptions is recommended before publishing. Flag this in the output.

---

## Rules

- Hard char limits, validation pass before output. Headlines <=30, descriptions <=90, sitelink link text <=25, sitelink description lines <=35 each, callouts <=25, structured snippet values <=25.
- **15 headlines is the default**, not 10. Going short loses Ad Strength upside.
- Headlines distributed across 4+ angles. Keyword-match cluster always included (Ad Relevance / Quality Score driver).
- **At least 3 headlines contain the core query keyword verbatim**, at least 2 descriptions same.
- **Length variety in headlines** (mix of short / medium / long).
- **Full asset suite generated** (sitelinks + callouts + structured snippets) alongside headlines and descriptions. Maddie may deploy a subset, but the skill produces the full set.
- **Final URL must be provided in Step 1.3** so Step 8 Message Match can run.
- **Pinning is opt-in, not default.** Only pin for legal disclaimer, brand-name requirement, or strong historical data. Pin at most 1 to 2 assets.
- **Match type recommendation** included (phrase or exact default; broad only after 30+ conversions/month + curated negatives list).
- **Negatives framed as a discipline, not a one-shot.** Starter list + 30-day curation pass + ongoing additions from Search Terms report.
- **At least 2 RSAs per ad group** per Google's own guidance. Skill output flags the second-RSA variation strategy.
- No em or en dashes, no smart quotes, no all-caps words
- Save to `Information/Ad Variations/[YYYY-MM-DD] [Brand] [Service].md`
- Recommend Tone Check before publishing

---

## Anti-patterns

- Capping at 10 headlines when Google accepts 15 (leaves Ad Strength on the table)
- 15 headlines that are word-swaps of each other (no real testing signal, Ad Strength penalised for redundancy)
- Generic "Quality Service Near You" filler that fails Google policy or Ad Relevance
- Descriptions without implicit CTA
- Skipping the asset suite (sitelinks / callouts / structured snippets) - 10 to 15% CTR uplift left untaken
- Building only one RSA when Google recommends at least two per ad group
- Pinning by default (collapses RSA into a fixed ad, removes optimisation surface)
- No Message Match check (ignores ~50% of Quality Score signal)
- Treating negatives as a one-time list instead of an ongoing curation discipline
- Recommending broad match for a small UK budget without first checking conversion volume and negative list maturity
- Missing keyword-match headlines (Ad Relevance falls)
- Skipping char count validation
- Final URL not requested at intake (Message Match cannot run, asset reporting harder to interpret)

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-19 | Skill created. Angle-cluster discipline, char-limit enforcement, negative keyword categories, worked example for Stride nail surgery, 2-week review handoff via Tasks.md. |
| 2026-05-20 | **Research-first retrofit pass** per [[Continue - Research-First Skill Retrofits]] and the CLAUDE.md Skill Creation Discipline. Anchored on Maddie's actual context (three small UK local brands, £500 to £2,000/month per brand, Maddie running directly without agency, Stride is the heaviest user). Ran Step 1c research filtered through that context. **Key findings folded in:** (a) Google RSA accepts up to 15 headlines + 4 descriptions per ad - skill was capping at 10, raised to 15 default; (b) Ad Strength Poor to Excellent delivers ~15% more clicks AND conversions per Google's own data, driven by asset variety, length variety, keyword inclusion, and lack of redundancy - new Ad Strength logic baked into Step 4; (c) the Assets layer (formerly Extensions) is no longer optional and delivers 10-15% CTR uplift per Google - new Step 6 generates sitelinks (6) + callouts (6) + structured snippets (1-2 sets) alongside the RSA; (d) pinning is supported but collapses optimisation when heavy - new Step 7 pinning recommendation with conservative defaults (none) and explicit when-to-pin criteria; (e) Quality Score landing page experience carries roughly half the weight - new Step 8 Message Match check against Final URL, cross-references [[Landing Page Brief]] if mismatch found; (f) Google recommends at least 2 RSAs per ad group with unique Final URLs - output template now flags the second-RSA variation strategy; (g) good UK small-business accounts grow to 100+ curated negatives over months - negatives reframed as ongoing discipline with starter 10-15 + 30-day Search Terms curation cadence; (h) for small UK budgets, phrase or exact match default, broad only after 30+ conversions/month + mature negatives list - match-type recommendation now part of intake and output. **Edits:** new What's Appropriate Here section near the top (regulatory frame + practical compliance pattern + what the skill does NOT do); Step 1 intake expanded from 4 to 7 items (added Final URL, pinning constraints, match-type intent); Step 3 angles expanded from 3-5 to 4-6 with mandatory Keyword-match cluster; Step 4 headlines raised from 10 to 15 with length-variety rule, keyword-verbatim rule, and explicit no-redundancy rule; Step 5 descriptions gained keyword-verbatim rule; new Step 6 asset suite (sitelinks + callouts + structured snippets) with brand-specific patterns; new Step 7 pinning recommendation; new Step 8 Message Match check; Step 9 negatives raised from 5-10 to 10-15 starter with curation cadence and competitor / info-intent additions; output template rewritten to include all new elements + second-RSA suggestion + ongoing-curation reminders; worked example rebuilt for Stride nail surgery showing the full 15-headline / asset suite / Message Match pass; rules section restructured; anti-patterns expanded with capping at 10, pinning-by-default, missing assets, no Message Match, treating negatives as one-time. Stress-tested mentally against three real scenarios: Stride nail surgery (passes, full suite produced with Message Match pass), hypothetical Fade Golf membership (passes, Amenities structured snippets, /book Final URL suggests Message Match flag if LP H1 doesn't mention membership), hypothetical F&E Leamington day pass (passes, Services structured snippets, callouts highlight day-pass value). Skill grew from 272 to ~480 lines, single file. British English verified. No em / en dashes per CLAUDE.md paste-safe rule. **Sources:** Google Ads Help on responsive search ads (support.google.com/google-ads/answer/7684791, /9921843 Ad Strength, /6280012 structured snippets, /13548268 campaign-level text assets), Search South 2026 RSA best practice (search-south.com/2026/02), Growth Minded Marketing 2026 RSA Guide, Semrush RSA Ultimate Guide, Search South 2026 pinning guide, Adalysis RSA Handbook, Kiosk Agency pin-or-not-to-pin, Practical Ecommerce on Google's new per-headline asset stats, Aimpro Digital 2026 UK SME playbook (£500-£2k budgets), McAllister Digital 2026 UK SME spend guide, Lucky Penny 2026 UK SME PPC guide, Store Growers 2026 Quality Score breakdown, Optmyzr 2026 Quality Score in automation-heavy accounts, Two Trees PPC 2026 ad extensions guide, Search Scientists 2026 sitelink examples (25+), Saffron Edge 2026 ad extensions guide, Invoke Media UK sitelinks+callouts guidance, Wordstream extensions guide. |
| 2026-05-21 | **Guide extraction pass.** Skill bloated to 491 lines after the research-first retrofit. Extracted the full output template (~115 lines, Step 10 markdown block) to [[google-ads-variation-template]] and the Stride nail surgery worked example (~127 lines) to [[google-ads-variation-worked-example]]. Skill body now links to both with a 1-2 sentence summary rather than embedding. No content lost. Skill body now ~250 lines (workflow + rules + anti-patterns + changelog), guides folder mirrors the convention used by [[Landing Page Brief]] and [[Contract Reviewer]]. |
| 2026-05-21 | **Cold-tested as Maddie (P2 #3).** Scenario: "google ads variations for stride nail surgery" on 21 May, Stride voice STUB, no nail-surgery audience persona, no campaign brief, no Data Pulls, no `Information/Ad Variations/` folder. 5 edits applied. (1) Step 1.3 Final URL gained three explicit no-URL branches: generic-homepage-only (proceed but pre-flag Message Match risk + recommend Landing Page Brief), no-URL-at-all (refuse, route to Landing Page Brief first, no destination means Ad Rank LP component is structurally broken), URL-TBC-pending-LP-brief (proceed with placeholder + tag for re-run). Stops silently generating 15 headlines against nothing. (2) Step 2 voice-stub line moved into a sub-block + audience-persona-missing fallback added mirroring [[Filming Brief Generator]] Stage 2 (three options: run Audience Persona Builder inline / best-guess with logged assumptions / Maddie supplies pain + outcome triggers verbatim) with sensible default-choice per service value tier. (3) Step 2 first-paid-campaign baseline note added (no Data Pulls yet, frame first 30 days as calibration not optimisation, prime expectation of 10 to 20 weekly negative additions from Search Terms). (4) Step 11 folder pre-check added (Information/Ad Variations/ self-heal, same install-window pattern flagged across P2 testing). (5) (Cross-skill chain to Landing Page Brief in Step 1.3 is the same hook that Step 8 already used after generation, but now triggers upfront so Maddie does not waste a generation cycle on a doomed Message Match.) Cross-skill install gap reaffirmed. |
