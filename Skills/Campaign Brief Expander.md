# Skill: Campaign Brief Expander

---
triggers:
  - "expand campaign"
  - "campaign brief"
  - "plan campaign"
  - "build campaign for"
  - "brief expander"
type: Workflow
---

**Purpose:** Maddie feeds a campaign concept, audience, and deadline. The OS returns a full per-platform content plan: post types, vibe, dates, Google ad angles, suggested search terms, risks. She then creates the actual content herself in Canva or on camera. **Creative partner, not creative replacement.**

The headline skill of the OS. Validates and scales the pattern Maddie used with Tom's Claude for Paddle & Play.

---

## Context

*Load these files before running this skill (Step 2 audits and confirms each with Maddie before use):*

- [[Brand Voices/Fade Golf voice]] / [[Stride voice]] / [[Fire & Earth voice]] (whichever brand)
- [[Brand Guidelines/Fade Golf guidelines]] / [[Stride guidelines]] / [[Fire & Earth guidelines]] (for visual direction)
- The relevant brand Brain file ([[Fade Golf]] / [[Stride Clinics]] / [[Fire & Earth Leamington]])
- [[Brain/Audiences/]] persona file for the service if it exists
- **[[Information/Campaigns/Archive/]], past campaigns for the same brand AND service, with performance data where available.** This is the historical evidence the brief draws on. Skill queries this and surfaces relevant past campaigns to Maddie for inclusion as reference patterns.
- [[Fade Group]] for group-level positioning
- [[Maddie]] for working style

If the relevant audience persona file does NOT exist, flag this clearly and offer to run [[Audience Persona Builder]] first. A weak audience input is the single biggest cause of weak campaign output.

If no past campaigns exist for this brand + service, surface honestly: "No archived campaign performance data yet. This brief will be built from persona + voice only. As campaigns complete and Data Pull cycles run, the Archive populates and future briefs reference proven patterns."

---

## Quick Start

Maddie says:
- "expand campaign for [topic]"
- "plan campaign [topic] for [brand]"
- "build campaign for [Stride nail surgery]"
- "campaign brief for [Run Club, June]"

---

## /goal integration

Set at start:

```
/goal output saved to Information/Campaigns/[YYYY-MM-DD] [Brand] [Campaign].md, contains all sections (header, audience, per-platform table with 4+ platforms, Google Ads block, posting schedule, creative direction, risks), at least one risk identified, voice-match verified or stub-flagged, Tasks.md has one row per planned post with target date. Stop after 8 turns if not met.
```

---

## Process

### 1. Identify brand and topic

Brief opening exchange. Just confirm:

- **Brand:** Fade Golf, Stride, or Fire & Earth Leamington. Reject anything else with: "Out of scope. This OS covers three brands. Did you mean one of those?"
- **Campaign topic:** what is the campaign about, in one or two sentences?

Do NOT yet ask for goal / deadline / audience details. Those come after the Brain context check in Step 2.

### 2. Brain context audit and confirmation

**Before gathering more inputs or loading anything silently in the background, announce to Maddie what Brain content the skill plans to use. Confirm each piece with her. Never silently pull.**

This is the core interactive pattern: Maddie sees what context the skill is about to use, gets a chance to correct, update, or refuse it.

#### 2a. List the Brain content this skill needs

For a campaign brief on `[brand] [topic]`, the skill needs:

| Brain content | Path | Why |
|---|---|---|
| Brand Brain file | `Brain/Businesses/[Brand].md` | Strategic direction, active campaigns, channels, open threads, stakeholders |
| Brand voice | `Brain/Brand Voices/[Brand] voice.md` | Tone, vocabulary, reference posts |
| Audience persona | `Brain/Audiences/[Brand]/[Service].md` | Primary persona, watering holes, search terms, triggers, barriers |
| Brand guidelines | `Brain/Brand Guidelines/[Brand] guidelines.md` | Visual direction, mandatory elements (logo, contact, palette) |
| **Campaign Archive** | `Information/Campaigns/Archive/` | **Past campaigns for the same brand + service, with performance outcomes where Data Pull has run. The brief references proven winning patterns and avoids documented failures.** |

#### 2b. Audit the status of each

For each source above, check:
- **Locked** (file exists, all required sections populated, not stub-flagged)
- **Stub** (file exists but marked `STATUS: Stub` or missing required sections)
- **Missing** (file does not exist)

#### 2c. Show Maddie a summary and ask for confirmation

```markdown
Here is what I plan to use from the Brain for this campaign. Tell me if any of these are out of date or wrong before we start.

| Brain content | Status | What I have | Action |
|---|---|---|---|
| Stride brand strategy | Locked | "Multi-service clinical health; per-service Google Ads restructure incoming once tag fix lands; nail surgery flagged as high-revenue ad focus" | Confirm? |
| Stride voice | Locked | "Clinical-warm. Reassuring without patronising. Plain English over jargon." | Confirm? |
| Stride nail surgery audience | Locked | "40 to 65 Leamington locals, often have tried home remedies, late-night Googlers, fear cost + pain + embarrassment" | Confirm? |
| Stride brand guidelines | Locked | "Navy + ice-blue + cream palette, Georgia headline serif, real clinical photography only" | Confirm? |
```

Maddie can respond:
- **"All correct, continue"** → proceed to Step 3
- **"Update [X] first"** → trigger the relevant prerequisite skill, then resume CBE:
  - Wrong / outdated audience → run [[Audience Persona Builder]] first
  - Stub voice or guidelines → run [[Learning]] focused on that file
  - Stale brand strategy → small edits inline, or run /learning if substantial
- **"[X] is wrong / out of date"** → ask what to change, update inline if small, escalate to a prerequisite skill if substantial
- **"Skip [X]"** → note that the corresponding output section will be best-guess / soft / skipped

#### 2d. Handle stubs and missing files

**If any source is stub or missing**, do not silently push through. Surface clearly:

For a **stub voice file:** "Stride voice is still a stub. Two options: (A) run /learning now to start filling it (10 to 15 min, recommended), or (B) push through with best-guess voice clearly flagged in the output. Which?"

For a **missing audience persona:** "There is no locked persona for Stride nail surgery yet. Two options: (A) run /audience-persona first (recommended, 15 min, produces a reusable Brain file the skill will use forever), or (B) push through with a best-guess description from you right now. Which?"

For **stub brand guidelines:** "Guidelines for Stride are still a stub. The Google Ads visual direction will be best-guess. Recommend running /learning on guidelines after this campaign brief, not before, since the campaign brief is more urgent."

Maddie picks. If she picks (A) on anything, pause CBE, run the prerequisite skill, then resume.

#### 2e. Confirm before proceeding

Once Maddie has confirmed each Brain source (used as-is, updated, or skipped with the consequence understood), summarise the agreed context and move to Step 3:

```markdown
OK, working with:
- Stride brand strategy: as is
- Stride voice: as is
- Audience persona: just-built via /audience-persona, includes [N] watering holes and [M] search terms
- Brand guidelines: skipped, visual direction will be best-guess and flagged

Now I need a few campaign-specific things from you.
```

### 3. Gather campaign-specific inputs (push back on weakness)

ONLY after Brain context is confirmed. Work through the ten campaign-specific inputs in [[campaign-input-gathering]]: Background, Primary Goal, Supporting KPIs (2 to 3 max), Key Messages (2 to 4 max), Deadline + milestones, Budget allocation (broken down, not lump sum), Stakeholders + approval gates, Reference material + Archive review, Out of scope (explicit), Kill criteria.

The guide contains the question, examples of strong answers, and an explicit push-back pattern for each input. Apply critical persona throughout: if any input is weak, surface the gap before producing the plan. Do not produce a plan around a flawed brief.

### 3. Research (optional, automatic if topic is new)

If the topic is something the brand has not posted about before AND Quick Research / web fetch is available:
- 1 search angle: "What [competitors / category] are saying about [topic]"
- 1 search angle: "Trending angles for [audience demographic] on [topic]"
- 1 search angle: "Google Trends for [topic] [region]"

Cap at 3 angles. Cite sources. Don't bury Maddie in research.

Skip this step if:
- Maddie says "skip research"
- The topic is familiar (brand has posted about it >3 times in the last 90 days)
- Search tool not available

### 4. Build the plan

Produce output to the template in section 6. Each section enforces critical thinking:

- **Per-platform table** forces per-platform thinking (different demographic per platform, different copy hook)
- **Posting schedule** forces date discipline
- **Risks section** forces overlap and audience-fatigue checks
- **Creative direction** stops short of writing the actual copy

### 5. Save and create follow-on tasks

- Save the plan to `Information/Campaigns/[YYYY-MM-DD] [Brand] [Campaign Name].md`
- Open Tasks.md, add one row per planned post with its target date:
  ```markdown
  | [Brand] | [Target date] | Post: [campaign] [platform] [post type] | Maddie | To Do |
  ```
- If the plan includes Google Ads, add a task: `[Brand] [Date] Launch [Campaign] Google Ads (10 headlines, 4 descriptions, [N] keywords)`
- If the plan includes filming, add a task: `[Brand] [Date] Filming brief for [Campaign] (run /filming-brief)`

### 5a. Offer Word doc export for sharing

After saving the markdown, ask Maddie:

> Want this brief as a Word doc to share with Tom and Harry?
> A) Yes, use the [Brand] Campaign Brief Template (if saved), formatted to match
> B) Yes, no template, sensible default Word formatting
> C) No, markdown is fine for now

**If A and a `[Brand] Campaign Brief Template` exists** in `Brain/Document Templates/`: chain to [[Document Template]] Apply mode with the saved template and this campaign brief markdown as the new content. Output saved to `Information/Campaigns/[YYYY-MM-DD] [Brand] [Campaign Name].docx`.

**If A and no template exists yet:** surface honestly. "No `[Brand] Campaign Brief Template` saved yet. Two paths: (1) capture one now, drop a Word doc you like and I will save it as a template, then we apply it. (2) Use default Word formatting and capture the template later when you have a sample. Which?"

**If B:** chain to [[Document Template]] Apply mode with no named template, produces sensible default Word formatting (Stride/Fade Golf/F&E palette per brand guidelines if locked, otherwise neutral).

**If C:** skip. Maddie can ask later by saying "create a Word version of [campaign brief file]".

### 6. Output Format

Full brief template is in [[campaign-brief-template]] (loaded when the skill runs). The template covers 18 sections: header block, Executive Summary, Background, Primary Goal, Supporting KPIs, Key Messages, Audience, Past Performance, Per-platform plan, Deliverables specs, Mandatories, Out of Scope, Budget Allocation, Stakeholders + Approval Gates, Google Ads angle, Posting Schedule, Creative Direction, Risks, Kill Criteria, Next Steps.

Section 15 (Creative Direction) draws on hook formulas, caption structure, platform format guidance, CTA per platform, UGC, and posting cadence patterns documented in [[campaign-creative-direction]].

---

## Worked example output (reference)

Full Stride nail surgery June 2026 worked example is in [[campaign-brief-worked-example]]. Use it as a sanity-check pattern for what a completed brief reads like.

---

## Push-back patterns (critical persona examples)

**Weak audience:**
> Maddie's input: "people who want nail surgery"
> Skill response: "That is the universe of customers, not an audience. Who specifically? Age range, prior attempts, where they search? If you do not have this locked, I recommend running /audience-persona for Stride nail surgery first. About 15 minutes, produces a Brain file you reuse forever. Want to do that first, or push through with a best-guess?"

**Weak goal:**
> Maddie's input: "raise awareness of orthotics"
> Skill response: "Awareness of what, measured how? Awareness in itself is not actionable. Better goals: '50 enquiries on the orthotics page in July', '20 booked orthotic assessments by end July', '5 podiatrist referrals from local GPs by August'. Which of those, or something more specific?"

**Crowded calendar:**
> Detected: another Stride campaign already running in the same window
> Skill response: "Heads up: Stride's Run Club campaign is live this fortnight. Adding nail surgery to the same window splits attention. Three options: stagger nail surgery to after 20 June, run both with clearly different platforms, or pause Run Club content this week. Which?"

---

## Rules

- No em or en dashes in any output
- British English
- Voice-matched to the brand or flagged if voice file is stub
- Push back on weak inputs, do not write around them
- Plan should be glanceable, tables and bullets, not paragraphs
- Add Tasks.md entries automatically, do not ask
- Never write the actual post copy unless explicitly asked. The plan tells Maddie what to write, she writes it.
- Cite sources for any research used in the audience / risks section

---

## Anti-patterns

- Producing a plan around a vague audience or goal
- Writing identical content across all platforms (algorithm penalty)
- Inventing demographic data when the persona file is empty (use option A or B from input gathering)
- Producing the actual post copy without being asked
- Skipping the Risks section because nothing obvious comes to mind. Always check overlap + audience fatigue.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-18 | Skill stub created during scaffold. |
| 2026-05-19 | Full implementation: input-gathering with push-back patterns, voice-stub flagging, audience persona file integration, full output template, worked example for Stride nail surgery, push-back examples, auto Tasks.md row creation. |
| 2026-05-19 | Restructured Process: Brain context audit + confirmation (Step 2) moved before campaign-specific inputs (Step 3). Skill now ALWAYS announces what Brain content it plans to use, asks Maddie to confirm or correct each, and triggers prerequisite skills (/audience-persona, /learning) inline if anything is stub or missing. This is the canonical interactive pattern for all Brain-dependent skills: show context first, confirm, then run. |
| 2026-05-19 | Major output upgrade after test surfaced "generic" output. Added 13 new sections to bring brief to professional standard: Background, Supporting KPIs (not just one goal), Key Messages (the must-communicate list), Past Performance / Reference Campaigns (drawing on `Information/Campaigns/Archive/`), Deliverables specs (3rd-party-supplier-ready with format/aspect/resolution/file specs), Mandatories (hard requirements every asset must include), Out of Scope (explicit non-targets), Budget Allocation (broken down, not lump sum), Stakeholders + Approval Gates (per-stage owners and dates), Kill Criteria (decision rules to pause/pivot/double-down mid-campaign). Step 3 input gathering restructured into 10 sub-steps with push-back patterns per section. Brain context check now includes Campaign Archive query and surfaces past winning + losing patterns for Maddie's confirmation. Reference: Webrand, Brafton, HubSpot, Asana, BetterBriefs research on what professional briefs include (May 2025). |
| 2026-05-19 | Added Executive Summary block at top of output for strategy approvers. Major upgrade to Section 15 Creative Direction with platform-specific creative writing patterns drawn from social media research: 4 hook formulas (Specific Claim, Relatable Problem, Open Loop, Counter-intuitive), three-part caption structure (hook/value/CTA), platform-specific format guidance (Reels/TikTok/Shorts/IG/FB), UGC pattern for health and wellness, cadence guidance (3-5 posts/wk, multi-platform 4-5x reach). Creative direction now references `Reviews/Social Trends/` monthly report for current platform-specific guidance. Triggered by feedback that creative output was generic. Research sources: Heropost 2026, OUI Creatives, ShortSync, ALM Corp, Sprout Social 2026, Dash Social wellness brands. |
| 2026-05-21 | **Guide extraction pass.** Skill bloated to 678 lines after the research-first retrofits. Extracted four blocks to guides: the full output template (Section 6, ~245 lines) to [[campaign-brief-template]], the Stride nail surgery worked example (~85 lines) to [[campaign-brief-worked-example]], the Section 15 Creative Direction reference patterns (hook formulas, caption structure, platform format guidance, CTA per platform, UGC, posting cadence, ~50 lines) to [[campaign-creative-direction]], and the Step 3 input-gathering detail (the ten push-back-driven sub-steps 3.1 to 3.10, ~100 lines) to [[campaign-input-gathering]]. Skill body now links to all four rather than embedding. No content lost. Em / en dashes removed from skill body and guides per CLAUDE.md paste-safe rule. Skill body now ~250 lines (workflow + push-back patterns + rules + anti-patterns + changelog). |
