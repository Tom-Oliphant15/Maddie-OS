# Skill: Audience Persona Builder

---
triggers:
  - "audience persona"
  - "build persona"
  - "/audience-persona"
  - "who is the audience"
  - "build audience for"
type: Workflow
recommended_model: opus
recommended_model_reason: "Long synthesis pass across research + Brain + Maddie's inline input. Opus produces personas with sharper edges; Sonnet trends toward generic demographic descriptions that don't differentiate the brand. Worth the Opus spend because the persona feeds Campaign Brief Expander, Variation Generator, Keyword Builder, and Landing Page Brief downstream."
---

**Model check (before Step 1):** This skill works best on **Opus**. The persona feeds four other skills downstream — a generic persona makes all of them generic. Switch with `/model opus` if you're on Sonnet or Haiku, or carry on if you'd rather save your Opus budget for something else this 5-hour window. See [[Model Routing]] for the full picture.

**Purpose:** Build (or refresh) a target audience persona for a specific brand+service combination. Saves to `Brain/Audiences/[Brand]/[Service].md` where Campaign Brief Expander, Tone Check, and other skills can read it.

Maddie's role explicitly requires "client research, target audience analysis". This skill is how that work becomes durable Brain content rather than ad-hoc thinking lost between meetings.

---

## Methodology baseline

Modern persona work (2026 standard) is built on two frameworks. This skill bakes both in.

**Jobs-to-be-Done (JTBD):** open the persona with the job the customer hires the service to do. Three layers: the functional job (the practical thing they need done), the emotional job (how they want to feel about it), and the social job (how they want to be seen). JTBD reframes the persona around the work the service performs, not just the demographic profile of who consumes it.

**5 Rings of Buying Insight (Adele Revella, Buyer Persona Institute):** the dominant persona-research framework. Five questions a persona must answer:

1. **Priority Initiatives**, what triggered them to start looking now?
2. **Success Factors**, what does winning look like? What outcome are they paying for?
3. **Perceived Barriers**, what holds them back from booking?
4. **Decision Criteria**, what do they compare across providers when choosing?
5. **Buyer's Journey**, what they need at Awareness, Consideration, and Decision stages.

**Plus three modern-practice additions:**

- **Voice of Customer (verbatim quotes)**, not paraphrased mindset, actual phrases they use.
- **Information-seeking behaviour**, how they research, separate from where.
- **Stage of care / stage of journey segmentation**, same person at different stages is functionally a different persona (acute pain new patient vs returning chronic; first-time visitor vs returning member).

**Behavioural-first framing:** lead the persona with behaviour and motivation. Demographics support, they do not headline. "Person whose knee pain just stopped them finishing a parkrun" beats "32-year-old female, runs occasionally".

---

## Context

*Load these files before running this skill:*

- The relevant brand Brain file ([[Fade Golf]] / [[Stride Clinics]] / [[Fire & Earth Leamington]])
- [[Fade Group]] for group-level positioning
- [[Maddie]] for working style
- Existing persona file at `Brain/Audiences/[Brand]/[Service].md` if it exists (this skill refreshes, not just creates)

---

## Quick Start

Maddie says:
- "audience persona for Stride nail surgery"
- "build persona Fade Golf membership"
- "/audience-persona F&E meditation classes"
- "who is the audience for Stride orthotics"

---

## /goal integration

Set at start:

```
/goal output saved to Brain/Audiences/[Brand]/[Service].md, contains all required sections (Job-to-be-done, Primary persona behaviour-led, Voice of Customer, 5 Rings of Buying Insight with all five rings populated, Information-seeking behaviour, Watering holes, Search terms, Trust and proof signals, Brand interaction patterns, Anti-persona, Secondary persona if applicable, Notes for marketing, Research source log with per-field confidence), Brain Directory updated to include the new file, all sections either populated or marked deferred-with-reason. Stop after 15 turns if not met.
```

---

## Process

### 1. Gather inputs

Confirm with Maddie:
1. **Brand:** Fade Golf, Stride, or F&E Leamington (normalise via the canonical table in [[Tone Check]] Step 1)
2. **Service:** the specific service (e.g. "nail surgery", "membership", "Run Club", "meditation classes")
3. **Goal of building this persona:** "general reference" (default) OR "for upcoming campaign [X]" (narrows research focus)
4. **Stage of journey (if applicable):** for clinical or membership services, ask whether this persona is for a new prospect, an existing customer at a different stage, or all stages. Same person at acute vs chronic vs post-treatment stage is functionally a different persona. Default to "new prospect" if Maddie has not specified.

**Filename convention.** Normalise the service name to Title Case with single spaces before the save path: `nail surgery` → `Nail Surgery.md`, `run club` → `Run Club.md`, `meditation classes` → `Meditation Classes.md`. Matches the Tom OS file-naming rule in CLAUDE.md (Title Case with spaces, no kebab-case for Brain content). Stop fragmentation from `nail-surgery.md` / `nail surgery.md` / `NailSurgery.md` variants accumulating.

If Brand is out of scope: reject with "This OS covers three brands only. Did you mean one of those?"

**Persona count discipline check.** Before building, count existing personas across Fade Group: `ls Brain/Audiences/*/*.md 2>/dev/null | wc -l`. Top-performing organisations average 4 to 5 active personas across a business portfolio. If Fade Group is already at 6+, push back: "We have [N] personas across Fade Group. Adding more risks dilution. Is this service genuinely a distinct audience, or could it map to an existing persona with a stage-of-journey overlay?" Only proceed if Maddie confirms it is genuinely distinct.

### 2. Check for existing persona

```bash
ls "Brain/Audiences/[Brand]/[Service].md" 2>/dev/null
```

If exists:
- Read current content
- Tell Maddie what is already there
- Ask: "Refresh from scratch, fill in only the gaps, or pull in fresh research and merge?"

If not exists: proceed to fresh build.

### 3. Maddie-first input pass

Before any research, ask Maddie what she already knows. She is the person in the clinic / on the golf floor / at the front desk. Her ground-truth observation beats secondary research.

Ask the questions below, one at a time for a fresh build. The order matters: behavioural and motivational questions first, demographics in the description as supporting context. Maddie can batch later questions (Q6 onwards) into one answer if she is rolling, let her, do not force one-at-a-time when she is in flow.

**Refresh mode:** if this is a refresh of an existing persona (not a fresh build), only ask about fields Maddie flagged as changed or fields marked Low confidence in the existing Research Source Log. Do not re-run all 10 questions every quarter.

**Question 1, Job-to-be-done:**
> When someone hires [brand]'s [service], what job are they trying to get done? Three layers if you can: the practical thing (e.g. "stop my knee hurting so I can keep training"), the feeling they want (e.g. "feel like a serious athlete again, not a patient"), and how they want to be seen by others (e.g. "the friend who fixed it, not the one who gave up running"). One sentence per layer is plenty.

**Question 2, Primary persona description (behaviour-led):**
> Picture the person who walks in (or books online) for this. Describe them, leading with what is going on in their life and what they are doing when they decide to book. Add age range, location, gender skew, and family or work context as supporting detail, not the headline. 4 to 6 sentences.

**Question 3, Voice of Customer:**
> What do they actually say when they book or arrive? Give me 3 to 5 real phrases or sentences you have heard. Not what marketing would write, the actual words. Even half-sentences and complaints count.

**Question 4, Success factors:**
> If this works for them, what does winning look like 3 months later? Pain gone, handicap dropped 2 shots, finally got dinner with friends without dietary stress, slept through the night, back at parkrun. Be specific. This is the outcome they are paying for.

**Question 5, Decision criteria:**
> When they are choosing between you and another option, what are they weighing up? Price, location, opening hours, who the practitioner is, reviews, parking, whether they were referred, NHS vs private, vibe of the place. List the top 3 to 5.

**Question 6, Triggers:**
> What is the moment they go from "I have this problem" to "I am booking today"? Examples: pain hits a threshold, school holidays end, a friend recommends, they Google late at night, a leaflet arrives, an event is coming up.

**Question 7, Barriers:**
> What stops them booking even when they have the need? Cost worry, fear of pain, embarrassment, "I should be able to fix this myself", confusion about whether they need [service A] or [service B], partner or family disapproval.

**Question 8, Information-seeking behaviour:**
> Before they book, how do they research? Late-night Google, asking in a WhatsApp group, lurking in Facebook groups for weeks, getting a GP recommendation, asking at the club bar, reading reviews on Trustpilot or Google, checking Instagram for before/afters. The how, not just where.

**Question 9, Anti-persona:**
> Who looks like they would book this but actually does not, or who would book and be a bad fit? Examples: tourists who think Fade Golf is pay-and-play, people who want a free chat not a paid consultation, runners looking for sympathy not a fix.

**Question 10, Secondary persona (if any):**
> Is there a secondary audience that also books this service but for different reasons? If yes, describe them with the same behaviour-led framing. If no, say "no second audience" and we move on.

If Maddie does not know an answer, mark it explicitly so the research pass can target it. Do not skip it silently.

### 4. Research pass (Quick Research pattern)

**WebSearch availability pre-check** (mirror [[Social Trends Watch]] Step 2):
- WebSearch available → proceed with 2 to 4 search angles below.
- WebSearch unavailable → skip the research pass cleanly. Mark the Research Source Log "WebSearch unavailable in this session, persona based on Maddie input only". Downgrade confidence markers in Step 5: any field that would have been triangulated by research stays at the confidence Maddie's input alone supports (typically M not H). Surface to Maddie at Step 6: "Research pass did not run, suggest re-running this persona's research-triangulation in a future session when WebSearch is available, especially for [N] fields currently at Low confidence." Do not fabricate sources.

The skill is Maddie-first by design (Rules: "Research is for triangulation and gap-filling, not for replacing her observation"), so the missing research pass produces a thinner but honest persona, not a failed run.

Run 2 to 4 search angles to triangulate Maddie's input. Cap research to 5 minutes equivalent.

**Default angles:**
1. "[service] [region or UK] customer search behaviour OR demographics"
2. "[service] local competitor pricing and positioning [region]"
3. "[service] common patient/customer concerns OR objections"
4. (Optional) "[service] watering holes UK Facebook groups OR forums"

Each search:
- Cite source
- Note whether it confirms or contradicts Maddie's input

**Cap rules:**
- Maximum 5 sources cited
- Maximum 3 paragraphs of synthesis
- If research contradicts Maddie's input, flag clearly, do not silently overwrite

### 5. Compose the persona file

Full output template is in [[audience-persona-template]] (loaded when the skill runs). The template covers, in order: header block with stage-of-journey note, Job to be done (functional / emotional / social), Primary persona behaviour-led, Voice of customer verbatims, 5 Rings of Buying Insight (Priority Initiatives / Success Factors / Perceived Barriers / Decision Criteria / Buyer's Journey across awareness, consideration, decision), Information-seeking behaviour, Watering holes (online + offline), Search terms, Trust and proof signals, Brand interaction patterns, Anti-persona, Secondary persona, Notes for marketing, and a field-by-field Research source log with H/M/L confidence markers.

Order matters: JTBD and behaviour open the persona, demographics support, 5 Rings structure the buying decision, modern-practice fields close it out. Every field gets its own confidence marker (H / M / L) and source (Maddie / research / both), because some claims are strong and some are inferred.

### 6. Confirm with Maddie

Show her the draft. Ask:
> "Does this match what you see in clinic / on the golf floor / at the front desk? Anything off?"

If she pushes back on any section: revise that section, do not rewrite the whole file. Confirm the change before saving.

### 7. Save and update Brain Directory

```bash
mkdir -p "Brain/Audiences/[Brand]"
# Write the file
```

Update `Brain/Brain Directory.md` to list the new persona file under Audiences. Bump directory timestamp.

### 8. Commit and push

```bash
# Defensive guard: only commit if we are inside a git work tree (mirror Social Trends Watch + Learning + Install pattern).
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git add "Brain/Audiences/" "Brain/Brain Directory.md"
  git commit -m "[learning] Audience persona built: [Brand] [Service]"
  # Use tracking branch (plain `git push`) so master / feature branches also work.
  if ! git push 2>/dev/null; then
    echo "(push failed, commit local only; OS Health logged 'commit deferred to next session')"
  fi
else
  echo "(git repo not yet initialised, persona + Brain Directory saved locally only)"
fi
```

Push failure or no-repo state is logged to OS Health but does not fail the Persona Builder run. The persona is the value; commit is housekeeping.

### 9. Surface follow-on opportunities

After saving, tell Maddie what the persona specifically unlocks. Be concrete, point to the actual fields and how they feed downstream skills:

> "Persona saved. This unlocks:
> - **Campaign Brief Expander** now has Voice of Customer verbatims to use as headlines, 5 Rings to structure the message hierarchy, and Trust Signals to dictate creative direction.
> - **Tone Check** has a richer brand-and-audience context to reference (full persona Voice of Customer integration into Tone Check's pattern-match step is a future enhancement, currently Tone Check reads brand voice files only).
> - **Buyer's Journey** field gives a 3-stage funnel template (awareness / consideration / decision) for campaign planning.
> - **Decision Criteria** can be cross-referenced against competitor positioning so we know which criteria to lead on.
> - **Google Ads Variation Generator**, **Google Ads Keyword Builder**, **Landing Page Brief**, **Filming Brief Generator** all consume this persona via their persona-missing three-option fallback (locked 2026-05-21). Until this persona existed, those skills ran Option B (best-guess) or Option C (Maddie supplies triggers verbatim). Now they can default to Option A (use this persona).
> - [If multiple personas now exist] You can compare across services to see where audiences overlap or differ.
>
> Anything you noticed building this that should be a separate persona (e.g. the secondary audience deserves its own file, or a stage-of-journey overlay for existing customers)?"

---

## Worked example interaction

Full Stride orthotics relaunch worked example is in [[audience-persona-worked-example]]. It shows Maddie-first input across all 10 questions, the research-triangulation pass returning three substantive additions (NHS waiting times, cross-sport stigma, before/after photos as top trust signal), a single revision pass on Decision Criteria, and the follow-on opportunity surfacing that hands the persona to Campaign Brief Expander and flags the diabetic-foot secondary as a separate file.

---

## Rules

- Maddie-first. Always ask what she knows before researching.
- Research is for triangulation and gap-filling, not for replacing her observation.
- Cite sources clearly. Maddie should be able to disagree with research and have her observation win unless research is overwhelming.
- Behavioural-first framing. Lead the persona with behaviour and motivation. Demographics support, they do not headline.
- Confidence markers (H/M/L) on every field, not just the persona overall. A field-level marker tells future-Claude what to trust and what to validate.
- Voice of Customer must be verbatim phrases, not paraphrases. If Maddie cannot give 3 real phrases, mark the field Low confidence and target the research pass at it.
- Save to the exact path: `Brain/Audiences/[Brand]/[Service].md`. Update Brain Directory in real time.
- No em or en dashes in output.
- Push back if Maddie's description is generic ("athletic people", "busy mums"). Force specificity.
- Stop and consolidate if Fade Group hits 6+ active personas. Persona sprawl dilutes targeting.

---

## Anti-patterns

- Researching before asking Maddie
- Writing a persona that sounds like an industry report ("the modern wellness consumer", "the discerning golfer")
- Leading the persona with demographics ("32-year-old female, household income £50k+") instead of behaviour ("just stopped finishing parkruns because of knee pain")
- Dumping all research sources verbatim, no synthesis
- Paraphrasing Voice of Customer phrases into marketing language ("seeks restorative pain relief" instead of "I just want my knee to stop hurting")
- Skipping the 5 Rings fields because they feel formal. Success Factors and Decision Criteria are where the marketing leverage lives.
- Treating a service with only 10 bookings/year the same as one with 200/month
- Saving the file before Maddie has confirmed the content
- Filling Buyer's Journey with generic content marketing ("blog post for awareness, case study for consideration"). It must be specific to this audience's actual behaviour.
- Building a new persona for every micro-service when a stage-of-journey overlay on an existing persona would do the job.

---

## When to re-run

- Every 3 months on actively-marketed services (2026 standard is quarterly minimum)
- Every 6 months on services in maintenance mode (steady performance, no active campaigns)
- When campaign performance unexpectedly shifts (audience may have changed)
- When Maddie returns from a quarter of front-line clinic time with new observations
- When a competitor enters or repositions and decision criteria may shift
- Surfaced by Learning skill if file is >3 months stale for active services or >6 months for maintenance services

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-19 | Skill created. Maddie-first input pattern, Quick Research triangulation, 6-section persona template, worked example for Stride orthotics, follow-on opportunity surfacing. |
| 2026-05-19 | Research-first retrofit per [[Continue - Research-First Skill Retrofits]]. Added methodology baseline (Jobs-to-be-Done + Adele Revella's 5 Rings of Buying Insight). Expanded Maddie-first input pass from 4 to 10 questions covering JTBD, Voice of Customer, Success Factors, Decision Criteria, Information-Seeking, Anti-persona. Rewrote Output template with behaviour-led framing, 5 Rings structure (Priority Initiatives, Success Factors, Perceived Barriers, Decision Criteria, Buyer's Journey), Voice of Customer verbatims, Information-Seeking Behaviour, Trust and Proof Signals, Brand Interaction Patterns, Anti-Persona, Research Source Log with field-by-field confidence markers. Added Persona Count Discipline check (cap at 6 active personas before consolidation pushback). Added Stage of Journey segmentation to Step 1. Updated refresh cadence to quarterly (2026 standard, was 6 months). Rewrote Rules and Anti-patterns. Extended worked example. Sources: Userpilot 2026 persona examples, HubSpot Make My Persona, M1 Project demographic segmentation guide, Hotjar psychographics, Improvado healthcare marketing 2026, Health Union patient personas, Adconversion B2B buyer personas, Wildnet 2026 persona guide. |
| 2026-05-21 | **Guide extraction pass.** Skill bloated to 527 lines after the research-first retrofit. Extracted the full Step 5 output template (~200 lines covering header, JTBD, primary persona, voice of customer, full 5 Rings of Buying Insight, information-seeking, watering holes, search terms, trust signals, brand interaction, anti-persona, secondary, marketing notes, research source log table) to [[audience-persona-template]]. Extracted the Stride orthotics worked example interaction (~70 lines) to [[audience-persona-worked-example]]. Skill body now links to both with 1 to 2 sentence summaries rather than embedding. No content lost. Skill body now 257 lines (methodology, context, quick start, /goal, 9-step process, rules, anti-patterns, re-run cadence, changelog). |
| 2026-05-21 | **Cold-tested as Maddie (post-retrofit, post-guide-extraction).** Scenario: "audience persona for stride nail surgery", `Brain/Audiences/` does not yet exist, no prior persona, Stride voice STUB, WebSearch availability unverified. 4 edits applied. (1) Step 1 filename casing convention locked: normalise service name to Title Case with single spaces (`Nail Surgery.md` not `nail surgery.md` / `nail-surgery.md` / `NailSurgery.md`) per the Tom OS CLAUDE.md naming rule. Brand name normalisation also chained to the [[Tone Check]] Step 1 canonical table for consistency across persona-dependent skills. (2) Step 4 WebSearch availability pre-check added (mirror [[Social Trends Watch]] Step 2): if unavailable, skip the research pass cleanly, mark the Research Source Log "WebSearch unavailable in this session, persona based on Maddie input only", downgrade confidence markers to what Maddie's input alone supports, surface re-run suggestion to Maddie. Maddie-first design means the persona still produces; this stops silent fabrication of sources or false-confident triangulation when the research pass could not actually run. (3) Step 8 git resilience added (mirror Social Trends + Learning + Install pattern): `git rev-parse --is-inside-work-tree` guard + push-failure fallback + no-repo install-window path + plain `git push` not hardcoded `origin main`. Persona is the value, commit is housekeeping. (4) Step 9 cross-skill claims tightened: the "Tone Check can match against persona verbatim" line was aspirational, not implemented (Tone Check post-2026-05-20 retrofit reads brand voice files, not persona Voice of Customer); softened to "has a richer brand-and-audience context to reference, full integration is a future enhancement". Added explicit cross-skill connection to the four persona-dependent skills whose three-option fallback now defaults from B/C to A once a persona exists ([[Google Ads Variation Generator]], [[Google Ads Keyword Builder]], [[Landing Page Brief]], [[Filming Brief Generator]]). This is the chain end-to-end validation: persona unblocks all four. |
