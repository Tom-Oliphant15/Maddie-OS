# Skill: Filming Brief Generator

---
triggers:
  - "filming brief"
  - "/filming-brief"
  - "shotlist for"
  - "shoot brief"
  - "filming plan for"
type: Workflow
---

**Purpose:** Given a content shoot (talent, location, goal, deadline), produce a complete platform-native filming brief: hook, script architecture, shotlist for 9:16 first, sequence with retention pacing, talking points, B-roll grouped by use case, captions and post direction, UK consent and usage rights, mini call sheet, deliverables matrix. Maddie hands the brief to the talent and crew. They film. She edits.

Recurring need: Luke and Jason swing / membership reels (filming within 2 weeks), Lynda F&E shoot, Run Club content with Katie, future ambassador filming, Stride patient content.

---

## Context

*Load these files before running this skill:*

- The relevant brand Brain file
- [[Brand Voices/[Brand] voice]] for tone direction
- The campaign plan if this shoot is tied to one (look in `Information/Campaigns/`)
- The relevant audience persona file if it exists
- For Stride patient content: clinical-claim approval status (Harry sign-off)

---

## Quick Start

Maddie says:
- "filming brief for Luke swing reels"
- "/filming-brief Run Club catch-up"
- "shotlist for F&E open day"
- "shoot brief Fade Golf membership"

---

## /goal integration

```
/goal output saved to Information/Filming Briefs/[YYYY-MM-DD] [Brand] [Subject].md, contains all required sections (Overview, Hook + Script Architecture, Shotlist, Sequence, Talking Points, B-roll grouped by purpose, Sound, Captions + Post, UK Consent + Usage Rights, Logistics + Call Sheet, Deliverables Matrix), 9:16 vertical-first specified, hook locked in first 3 seconds, one populated `.docx` per identifiable on-camera person saved under Information/Talent Releases/Drafts/, Tasks.md has one row per follow-up. Stop after 6 turns if not met.
```

---

## What Professionals Expect

A filming brief built on intuition produces nice-looking content that underperforms because it ignores the platform reality. The 2026 algorithm rewards completion rate above all else: videos hitting 70%+ watch-through get priority boost, those below 30% struggle regardless of production quality. A professional brief drives:

1. **Platform-native format from the start.** 9:16 vertical (1080x1920) is the 2026 default, covering TikTok, Reels, Shorts, Stories, FB Reels, LinkedIn vertical, and Pinterest natively. Other aspect ratios are derived crops, not the primary frame.
2. **Hook discipline.** First 3 seconds determine retention. Hook is its own brief field with a specific objective: outcome stated, curiosity created, or pattern interrupt landed. Weak hook = wasted shoot.
3. **Script architecture.** Hook → Problem → Solution → CTA. Standard short-form structure. Brief tells talent which beat each line is hitting.
4. **Retention pacing.** Cuts every 2 to 4 seconds. Alternate wide / medium / close. Never stay on the same shot for more than 3 sentences. Brief specifies pacing per segment, not as a vague "fast cuts" note.
5. **Captions assumed.** 85% of views happen without sound. Burned-in captions are not optional. Brief specifies caption style, position, and timing.
6. **CTA with value exchange.** Best-performing 2026 CTAs offer something concrete ("Get the 20% code in our bio", "Tap for free 15-min assessment"), not "follow for more".
7. **Authentic over polished.** Raw, authentic content performs ~60% better than over-produced. Brief steers talent toward conversational, personal delivery and crew away from over-staging.
8. **Talent release and usage rights documented.** UK GDPR / Data (Use and Access) Act 2025 raised PECR maximum fines to £17.5M or 4% of turnover. Any identifiable person on camera needs a signed talent release specifying scope, duration, platforms, geography, paid-media use, and whether the talent can post their own version.
9. **Patient consent for Stride before/afters.** Specific clinical-consent form, not a general talent release. Harry sign-off on the claim being made.
10. **Background-incidental people handled.** Customers in frame at F&E, members in frame at Fade Golf, public in Run Club shots. Consent, blur, or controlled location.
11. **Call sheet for any shoot with more than one person on set.** Location, arrival time, contact, schedule, talent, crew. Distributed evening before.
12. **Deliverables matrix.** When one shoot feeds multiple posts, the brief specifies the spec for each: length, aspect, caption style, CTA, platform.
13. **B-roll grouped by purpose, not flat list.** Detail / environment / ambient / transition. Each B-roll item tagged with which future content it may feed.
14. **Reference visuals.** At least one named reference video or still that aligns talent and crew on the look. Not a stock-image direction.
15. **Pre-production timeline.** T-7 brief locked, T-3 call sheet out, T-1 equipment check, T-0 shoot, T+1 footage review.

---

## Platform-Native Framing and Script Architecture

Full reference detail (9:16 default + safe-zone framing rule + secondary 1:1 and 16:9 crops, plus the Hook to Problem to Solution to CTA script architecture with hook types, beat timings, CTA value-exchange examples, and retention rules) is in [[filming-platform-and-script-reference]]. Load it when drafting any talking-talent shoot. Headline rules: 9:16 vertical (1080x1920) master in 4K, framed with headroom for 1:1 and 16:9 crops. Every speaking shoot follows Hook (first 3s, names outcome or problem or interrupt or curiosity) to Problem (3 to 8s, in viewer's words) to Solution (8 to 30s, cuts every 2 to 4 sec) to CTA (last 5s, value exchange, never "follow for more"). Burned-in captions from second 0.

---

## Process

**Scale the brief to the shoot.** Three shoot sizes Maddie actually runs:

- **Phone-only solo shoot** (Maddie or talent filming on a phone, no crew, one location, one platform). Run Stages 1, 3, 4, 9 (release if anyone identifiable is on camera), 12. Skip Stages 5-8 detail, 10 (no call sheet needed for a solo phone shoot), 11 (deliverables matrix only if it feeds multiple platforms).
- **Standard shoot** (Maddie + one other person, single location, single day, 1-2 platforms). Run Stages 1-9, 12. Skip Stage 10 mini-call-sheet (a Slack message with time and location is enough). Stage 11 only if multi-post.
- **Multi-person crew shoot** (talent + filmer + Maddie + maybe extras, multiple setups, multiple deliverables). Run all stages including the full call sheet and deliverables matrix.

If in doubt, ask Maddie which size. Default to "standard" not "multi-person crew".

### Stage 1 - Gather inputs

Ask in order, skipping any Maddie has supplied:

1. **Brand**: Fade Golf / Stride / F&E Leamington
2. **Shoot subject**: what is being filmed
3. **Talent**: who is on camera (name + role)
4. **Crew**: who is filming (Maddie? self-filmed? external? phone-only?)
5. **Location**: specific venue, indoor / outdoor
6. **Date**: single shoot day or window
7. **Primary platform**: Instagram Reels / TikTok / YouTube Shorts / paid media - drives the script architecture and CTA style
8. **Secondary platforms**: any 1:1 or 16:9 derivatives needed
9. **Campaign tie-in (optional)**: link to campaign brief if any
10. **Talent-release status**: has on-camera person signed? If no, flag as blocker
11. **For Stride patient content**: clinical-claim approval status
12. **People in frame beyond named talent**: will members / customers / public / other staff appear incidentally? Flags Stage 9f handling upfront so it doesn't surface as a post-brief gotcha (Fade Golf bays often have members in the background; F&E café often has customers in shot).

### Stage 2 - Apply brand context

Load brand Brain + voice + audience persona for the relevant service.

**Persona file expected at** `Brain/Audience Personas/[Brand] - [Service or Audience].md`. Examples: `Brain/Audience Personas/Fade Golf - Members.md`, `Brain/Audience Personas/Stride - Nail Surgery patients.md`.

**If voice file is in Stub state:** flag in output banner ("Voice file stub: talking points are best-guess, recommend /learning before publishing.") but proceed.

**If persona file is missing:** offer Maddie three options before continuing.
- **A. Run Audience Persona Builder now** (inline prerequisite, returns to this skill when complete) - recommended if the shoot is more than a week out.
- **B. Best-guess persona** - proceed using the brand Brain's "Customer" or "Audience" section as a fallback source for Problem-beat language; downgrade the brief's verdict-style header to `Best-guess persona` so Maddie can see the brief was built on assumed needs not validated triggers.
- **C. Maddie supplies the triggers inline** - Maddie types the top 3 pains / triggers in her own words; skill anchors the Problem beat on those. Document in the brief's Overview section under "Persona input: Maddie-supplied verbatim".

Default to B if Maddie says "just proceed" without picking. Do not silently default - make the choice visible.

### Stage 3 - Pick hook + script architecture

For talking-talent shoots:
- Choose the hook type (outcome / problem-statement / pattern interrupt / curiosity)
- Draft the exact opening line
- Draft the problem beat from persona Triggers
- Outline the solution beats (3 to 5 talking points)
- Draft the CTA with value exchange

For pure B-roll / silent shoots: skip script architecture, drive structure through shotlist sequence and on-screen text overlays.

### Stage 4 - Build shotlist (9:16 first)

Numbered list of every shot. Each shot specifies frame, angle, length, description, purpose. Master frame is 9:16; flag any shot intended for 16:9 deliverable only.

### Stage 5 - Sequence and retention pacing

Order to FILM (not edit order). Group by location/setup for production efficiency. State cut cadence per segment.

### Stage 6 - B-roll grouped by purpose

Detail shots / Environment shots / Ambient activity / Transitions. Each item tagged with which future content it may feed.

### Stage 7 - Sound notes

Dialogue mic, ambient capture targets, music direction, sound risks specific to the location.

### Stage 8 - Captions and post-production direction

Burned-in caption style and timing. Cut style. Pacing target. End frame. Aspect ratio confirmed 9:16 master with secondary crops listed.

### Stage 9 - UK consent and usage rights (generates the signable documents)

This stage produces the actual release / consent documents as Word files, ready to print and sign. Not just a flag. Full step-by-step (9a list who needs documents, 9b variables per person with contact-info sourcing rules, 9c docx template substitution including USAGE_LIST / TALENT_OWN_POSTING_LINE / BEFORE_AFTER_LINE / LEGAL_ENTITY caching pattern, 9d /Drafts/ vs /Signed/ folder convention, 9e brief surfacing + T-3 task, 9f background-incidental handling) is in [[filming-consent-generation]]. Load it whenever any identifiable person will be on camera. Quick summary: one .docx per identifiable person, Talent Release for talent and Stride Patient Consent for clinical content, save to `Information/Talent Releases/Drafts/[YYYY-MM-DD] [Brand] [Name] - [Release Type].docx`, signed copies move to `/Signed/` by T-3. Brand-specific release-form facts (legal entity, privacy notice URL, withdrawal contact, brand handle) cached in each brand's Brain file under `## Release form facts`.

### Stage 10 - Logistics and mini call sheet

Equipment list with backups. Locations. Permissions. Backup plan. Mini call sheet distributed evening before the shoot.

### Stage 11 - Deliverables matrix

If shoot feeds multiple posts: one row per deliverable with platform, aspect, length, caption style, CTA, target post date.

### Stage 12 - Save and surface

Save the brief. Auto-add follow-up tasks. Offer to draft the talent-facing version.

---

## Output Format

Full brief template is in [[filming-brief-template]] (loaded when the skill runs). The template covers the header block plus 11 numbered sections in order: Overview, Hook + Script Architecture, Shotlist (9:16 first), Sequence (filming order), Talking Points, B-roll grouped by purpose, Sound, Captions + Post-Production, UK Consent + Usage Rights (with the releases table), Logistics + Mini Call Sheet, Deliverables Matrix. Plus the auto-added Tasks.md follow-up rows (T-7, T-3, T-1, T+1, T+3, T+5, T+7).

---

### Save and update Tasks.md

```bash
mkdir -p "Information/Filming Briefs"
# Write the file
```

Add follow-up tasks to Tasks.md per the brief's Follow-up section.

### Tell Maddie

> Filming brief saved. Platform: [primary]. Hook type: [type], opening line: "[line]". [N] shots in 9:16 master, [M] B-roll items grouped by purpose, [P] deliverables in matrix. Releases generated: [N] .docx files in Information/Talent Releases/ ready to print and sign ([list per person + type]). Signed copies needed back by T-3 - task added. Want me to draft the talent message for [talent name] with the release attached?

If yes, draft a friendly message to send the talent that explains what they need to know without the operational detail (lifts from Talent Ambassador Brief logic).

---

## Worked example

Full Luke ambassador swing-reels worked example is in [[filming-brief-worked-example]]. Demonstrates input gathering, fresh release generation for paid media, persona-missing fallback, and the Maddie-facing summary message.

---

## Rules

- **9:16 vertical is the default master frame.** Other aspects are derived crops, not the primary plan.
- **Hook is a brief field, not an afterthought.** Exact opening line stated in the brief.
- **Hook > Problem > Solution > CTA architecture for all talking-talent shoots.**
- **Talking points are NEVER a script.** Direction + key phrases, never word-for-word.
- **Retention pacing stated explicitly.** Cuts every 2 to 4 sec, alternate frames, no same shot >3 sentences.
- **Burned-in captions assumed.** Specify style and timing.
- **CTA value exchange required.** "Follow for more" is not a CTA.
- **Authentic over polished.** Brief steers talent and crew away from over-staging.
- **Releases are generated, not just flagged.** Skill produces a populated .docx per identifiable on-camera person, saved to `Information/Talent Releases/`, ready for Maddie to print and sign. Source-of-truth templates live in `Assets/Talent Release Template.md` and `Assets/Stride Patient Consent Template.md`.
- **Talent release status is a pre-shoot blocker.** No release = no shoot. Surface this in the brief header, not buried.
- **Release files contain PII and sync to GitHub via Session End.** The repo is private but the privacy boundary should be intentional. Talent Releases carry email and phone; Stride Patient Consents carry Article 9 health-context data. Three guards apply: (1) the `Information/Talent Releases/` tree is included in repo sync, do not change this without Tom's sign-off, (2) signed copies with handwritten signatures live in `/Signed/` and may include a scanned image - confirm with the talent before storing scans of physical signatures in a synced repo, (3) if the talent or patient withdraws consent under the 30-day removal route, the file must be deleted from both `/Drafts/` and `/Signed/` AND the deletion committed and pushed - orphaned PII in git history is the failure mode here, so a follow-up note on full-history scrubbing (`git filter-repo` or BFG) belongs in Maddie's next session's outstanding tasks when this happens.
- **Patient consent for Stride before/afters uses the Stride Patient Consent template, not the Talent Release.** Plus Harry sign-off on the clinical claim before the form is generated.
- **Brand signatory defaults.** Maddie as Marketing Lead unless Tom is named explicitly.
- **Withdrawal contact defaults to brand admin email.** Stride: admin@strideclinics.co.uk. Fade Golf: admin@fadegolf.co.uk. F&E: admin@fireandearth.co.uk. Confirm or override.
- **Background-incidental people handled.** Consent, blur, or controlled location.
- **B-roll grouped by purpose, not flat.** Each item tagged for future repurposing.
- **Mini call sheet for any multi-person shoot.** Distributed evening before.
- **Deliverables matrix if shoot feeds multiple posts.** One row per deliverable.
- **Reference visual named.** At least one.
- **Pre-production timeline included in follow-up tasks.** T-7 release confirmed, T-3 call sheet out, T-1 equipment check, T-0 shoot, T+1 review.
- **No em or en dashes anywhere in output.** Per CLAUDE.md / Tom OS paste-safe rule.
- **British English throughout.**

---

## Anti-patterns

- Producing a script instead of talking points
- Hook that is "Hi, I'm X from Y" - viewers gone before name finishes
- Brand intro / logo at the start of short-form (kills retention)
- Logo end-card on Reels / TikTok (kills replay rate, drops loop count)
- Treating captions as optional ("if we have time in post") - they are not optional
- CTA: "follow for more" / "link in bio" / "check us out" - all dead in 2026
- Same-frame shot held for 6+ seconds with no scene change
- 16:9 as the master frame for content destined for Reels / TikTok / Shorts
- Skipping the talent release form because "we always work together" - no release no shoot, GDPR is not a vibe
- Stride before/after content without specific patient consent form + Harry sign-off
- B-roll listed flat with no thought to what future content it serves
- "Backup plan: TBD" - either name the alt or note "no backup, low-risk shoot" explicitly
- Filming briefs that read like marketing briefs - briefs are for the people on the day, plain operational language
- Deliverables matrix missing on multi-post shoots - leads to footage that doesn't crop / time / caption right for the secondary platforms

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-19 | Skill created. 8-section brief template with worked example for Luke ambassador intro, talking-points-not-scripts pattern, B-roll discipline, auto-Tasks follow-ups. |
| 2026-05-20 | **Lightened through business-context lens** per [[feedback_research_through_business_context]] and updated Skill Creation Discipline. Process gains an explicit "Scale the brief to the shoot" preamble naming three sizes Maddie actually runs (phone-only solo, standard 2-person, multi-person crew) with which stages run for each. Stops the skill from imposing the full 12-stage workflow on a 5-minute Stride patient phone shoot. Heavier stages (mini call sheet, deliverables matrix) explicitly skip for the smaller sizes. |
| 2026-05-20 | **Document-generation upgrade.** Stage 9 no longer flags consent status passively. Skill now generates a populated .docx release per identifiable on-camera person and saves to `Information/Talent Releases/`. Two new templates added as Assets (single source of truth): `Talent Release Template.md` and `Stride Patient Consent Template.md`. Stage 9 process expanded: list every person needing a document, gather variables per person, invoke docx skill to populate template and write .docx, file under predictable naming pattern, add T-3 follow-up task per release. Brand signatory defaults to Maddie. Withdrawal contact defaults to brand admin email. Sources for the templates: Sprintlaw UK talent release / model release forms 2025-update, LawDepot UK release, ICO consent and withdrawal guidance, LexisNexis on UK GDPR impact on creative-industry release agreements, CQC Regulation 11 guidance, NHS Transformation Directorate consent guidance, Yousign UK Patient Consent guide, Kiteworks UK Healthcare GDPR 2026, LegalLens 2026 influencer agreement guidance (AI / digital replica clause). |
| 2026-05-20 | **Templates simplified to 1-pagers per Tom course correction.** First-pass templates were 11 sections / 3 pages, agency-style legal forms - wrong for the local-business audience (customer / member / ambassador / patient being asked at a Stride clinic, an F&E table, or a Run Club catch-up). Both templates rewritten as plain-English single-page forms keeping UK GDPR essentials (named usage scope, duration, withdrawal mechanism, retention period, controller identification, ICO reference, Art 9(2)(a) for Stride health context, CQC Reg 11 "withdrawal does not affect care" line). AI / digital replica prohibition kept as a single sentence. Stage 9 variable list updated: USAGE_LIST is now a tight bulleted list of only the surfaces in scope (not a checkbox grid of every possible platform), TALENT_OWN_POSTING_LINE and BEFORE_AFTER_LINE are conditional single lines rather than separate sections. |
| 2026-05-20 | **Research-first retrofit per [[Projects/Continue - Research-First Skill Retrofits]].** Added What Professionals Expect section (15 markers). New Platform-Native Framing section: 9:16 vertical (1080x1920) as the default master frame, secondary crops derived. New Hook and Script Architecture section: Hook > Problem > Solution > CTA mandatory for talking-talent shoots, exact opening line in the brief, hook type named (outcome / problem-statement / pattern interrupt / curiosity), retention rules (cuts every 2-4s, alternate frames, never same shot >3 sentences, 70%+ watch-through target). New CTA discipline with value-exchange requirement ("follow for more" banned). New burned-in caption discipline (85% of views silent). New Authenticity note steering away from over-polish (raw content performs ~60% better per research). New UK Consent and Usage Rights section: talent release scope / duration / geography / paid-media / talent's own posting rights, background-incidental handling, Stride-specific patient consent and Harry sign-off, GDPR lawful basis. New Mini Call Sheet block distributed evening before. New Deliverables Matrix when one shoot feeds multiple posts (platform / aspect / length / caption / CTA / post date). B-roll restructured: grouped by purpose (detail / environment / ambient / transition) with each item tagged for future repurposing. Reference visual now required. Pre-production timeline baked into follow-up tasks (T-7, T-3, T-1, T-0, T+1). Anti-patterns list expanded with 2026-specific failures (16:9 master for short-form, logo end-card on Reels, "follow for more" CTA, treating captions as optional). Worked example updated. Sources cited: MasterClass / Boords / StudioBinder shot list templates 2026, Crescitaly / Posteverywhere / Shootlab 2026 social media video specs, Virvid / HeyOrca / Asensebranding 2026 hook formats, Miraflow YouTube Shorts 2026, EzUGC / InfluenceFlow / Influee 2026 UGC creator briefs, Asana / Boords / Spirit Juice / Shootsta 2026 pre-production workflows, Celtx call sheet 2026, Sprintlaw UK talent release form 2025-update, Aspect Film and Video on GDPR for video production, Naq / Progressive Robot UK GDPR small business 2026 guides (Data Use and Access Act 2025, PECR max fine raised to £17.5M / 4%). British English verified, no em / en dashes per CLAUDE.md. Skill remains single-file per Maddie OS convention. |
| 2026-05-20 | Cold-simulation test as Maddie (Luke ambassador swing reels, install-in-progress state, no audience persona files yet, no central contacts file). Eight edits applied: (1) `/goal` text updated to reflect "release `.docx` generated" not "release status flagged" (skill is generative now, the old goal phrasing was a leftover from the pre-retrofit version), (2) Stage 1 gained input #12 "people in frame beyond named talent" so incidental capture is surfaced upfront, not buried in Stage 9f, (3) Stage 2 now offers three explicit paths when the audience persona file is missing (run Audience Persona Builder inline / best-guess from brand Brain / Maddie supplies triggers verbatim) instead of silently defaulting to generic Problem-beat language; expected persona filename pattern stated, (4) Step 9b clarified there is no central contacts file in this OS, contact details come from Maddie inline unless a prior signed release for the same person exists, (5) Step 9c LEGAL_ENTITY / PRIVACY_NOTICE_URL / WITHDRAWAL_CONTACT_EMAIL / BRAND_HANDLE caching now writes into a `## Release form facts` section in each brand's Brain file, read-on-subsequent-runs, re-prompt if any key blank, (6) Step 9d split releases into `Information/Talent Releases/Drafts/` and `/Signed/` subfolders so the folder tree tells Maddie at a glance which releases are still outstanding; follow-up task language updated to "move from /Drafts/ to /Signed/", (7) Section 9 output table file paths updated to `/Drafts/`, (8) New Rules entry on PII / GitHub-sync boundary covering Article 9 health data for Stride patients, the 30-day withdrawal route requiring deletion from both /Drafts/ and /Signed/ plus git-history scrub for full removal (`git filter-repo` / BFG), and the consent-before-storing-scanned-signatures clause. Worked example updated to align with all of the above (no more phantom contacts file, persona-missing path shown, /Drafts/ path used). |
| 2026-05-21 | **Reference content extracted to guides folder to keep the skill lean** (637 lines down to 253). Four guide files created under `Filming Brief Generator/guides/`: (1) `filming-brief-template.md` (full 11-section Markdown output template plus auto-Tasks block), (2) `filming-platform-and-script-reference.md` (9:16 framing rules + secondary crops + Hook to Problem to Solution to CTA architecture with beat timings and retention rules), (3) `filming-consent-generation.md` (full Stage 9 step-by-step: who needs documents, variables per person, docx substitution rules including LEGAL_ENTITY cache pattern, /Drafts/ vs /Signed/ folder convention, T-3 follow-up, background-incidental handling), (4) `filming-brief-worked-example.md` (Luke ambassador swing-reels end-to-end example). Each extracted block in the skill replaced with a one-paragraph wiki-link summary so the skill remains executable on its own. No content lost, only relocated. British English and no em / en dashes verified throughout. Pattern matches Landing Page Brief extraction (same convention used across Maddie OS skills). |
