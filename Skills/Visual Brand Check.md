# Skill: Visual Brand Check

---
triggers:
  - "visual check"
  - "/visual-check"
  - "is this on brand"
  - "review this design"
  - "design check"
type: Quality Check
---

**Purpose:** Visual layout + brand adherence check on any design asset (Canva export, Instagram screenshot, leaflet PDF page, etc.). Returns specific fixes with honest confidence levels so Maddie knows what to trust and what to verify with her own eye.

Sibling to [[Tone Check]] (voice) and [[Proofread]] (text correctness). All three usually chain via [[Pre-publish Check]] when reviewing a finished design.

---

## Methodology baseline

Modern visual QC (2026 standard) covers three layers, not two. This skill bakes all three in.

**Layer 1, Visual layout mechanics** (Group A): legibility, alignment, spacing, hierarchy, composition. Established design principles (Gestalt grouping, visual hierarchy via size/colour/contrast, Z-pattern and F-pattern reading flow for left-to-right cultures). Applies to every asset regardless of brand.

**Layer 2, Brand adherence** (Group B): palette, typography, logo, imagery style, inclusivity in representation. Brand-specific judgement that needs the guidelines file locked.

**Layer 3, Accessibility and platform fit** (Group C): WCAG 2.2 AA contrast ratios (4.5:1 normal text, 3:1 large text), mobile-first sizing and thumb-zone for CTAs, platform-specific conventions (IG feed visual-first, Facebook warm contrast vs blue UI, Reels/TikTok caption clearance), alt text for digital posts. This is the layer most often missed by intuition-built reviewers and is increasingly legally relevant under UK accessibility regulations.

**Plus campaign-context check**: if the asset is part of a set (carousel, campaign variants, ad rotation), it must be reviewed against its siblings, not in isolation. Consistency drift across a set is invisible when checking one frame at a time.

---

## Context

*Load these files before running this skill:*

- The relevant Brand Guidelines file ([[Brand Guidelines/Fade Golf guidelines]] / [[Brand Guidelines/Stride guidelines]] / [[Brand Guidelines/Fire & Earth guidelines]])
- The relevant brand Brain file (for context)
- [[How Your OS Works]] for the educational framing

If Brand Guidelines is stub, see Step 2.

---

## Quick Start

Maddie says:
- "visual check this" (drops image)
- "/visual-check for Stride"
- "is this on brand"
- "review this design for Fade Golf"

Image input: Maddie drops a Canva export, IG screenshot, leaflet PDF page, etc. Claude reads the image natively via vision.

---

## /goal integration

```
/goal output covers Group A (visual layout) checks AND Group B (brand adherence) checks (or Group A only if guidelines file is stub), every finding has a confidence level (High/Medium/Low), specific fix proposed for every finding, verdict is one of (ship / minor fixes / needs work / heavy revision), saved to Reviews/Visual Checks/[YYYY-MM-DD] [Brand] [Asset].md. Stop after 4 turns if not met.
```

---

## Process

### 1. Identify the brand, asset type, and campaign context

If Maddie did not name the brand, ask: "Which brand? Fade Golf, Stride, or F&E."

Detect asset type from image dimensions or ask:
- Square 1080x1080, IG feed
- Vertical 1080x1920, IG story / reel / TikTok
- Horizontal, Facebook feed or YouTube thumbnail
- A4 / A5 portrait, leaflet
- Unknown, ask

**Campaign context check.** Ask: "Is this a standalone asset, or part of a set (carousel, campaign variants, ad rotation, paired with other assets)?" If part of a set, ask Maddie to drop the sibling assets too, or confirm she only wants this frame reviewed. Reviewing one frame of a set in isolation misses cross-asset drift (palette inconsistency between slide 1 and slide 4, type-weight changes, photo style shifts), which is one of the most common brand-consistency failures audit literature flags.

### 2. Load Brand Guidelines

Check the guidelines file status:

```bash
grep -i "STATUS: Stub" "Brain/Brand Guidelines/[Brand] guidelines.md"
```

**If stub:** surface to Maddie:

```
Brand Guidelines for [Brand] are still a stub.

I can still run Group A (visual layout) and Group C (accessibility and platform fit). Both work without brand-specific data, accessibility is a WCAG standard and platform conventions are universal.

Group B (brand adherence) needs the guidelines file locked. Two options:

A) Run /learning now to begin filling in the [Brand] guidelines (10 to 15 min)
B) Skip Group B for this check, run Group A + Group C only

Which?
```

**If locked:** load guidelines and proceed with all three groups.

### 3. Run the per-group checklists

Full checklists for Group A (A1 to A8), Soft Group B observations (when stub-skipped), Group B (B1 to B6), Group C (C1 to C4), and Campaign / Set Consistency (CS1 to CS5) are in [[visual-brand-check-checklists]]. Each item names what to look for, the rationale, and the confidence band to apply.

Run order:
- **Always:** Group A (layout) and Group C (accessibility and platform fit). Both are brand-agnostic.
- **If guidelines locked:** Group B (brand adherence).
- **If guidelines stub:** skip Group B, surface any brand-style observations in the "Soft observations (would normally be Group B)" section per the guide. Do not let brand-style observations leak into Group A.
- **If asset is part of a set and siblings were provided:** Campaign / Set Consistency. If siblings were not provided, skip with the note "Campaign consistency not assessed, only one asset of the set was reviewed. To audit cross-asset consistency, drop the full set."

For every finding, mark confidence (High / Medium / Low) and propose a specific fix.

### 4. Determine verdict

- **Ship** = passes Group A, Group B clean (or skipped with stub), Group C accessibility clear or only reminders, asset is ready
- **Minor fixes** = 1 to 3 issues across all groups, easy fixes
- **Needs work** = 4 to 7 issues, or one significant brand violation, or one accessibility fail (contrast below threshold, colour-only meaning)
- **Heavy revision** = 8+ issues, or major brand drift (wrong palette, wrong fonts, logo missing where required), or multiple accessibility fails

Accessibility fails (Group C contrast below 4.5:1 for normal text, or 3:1 for large text) should weight the verdict, not be hidden among layout findings. An asset that is visually polished but inaccessible is still not ready to ship.

### 5. Output format

Full output template is in [[visual-brand-check-template]] (loaded when the skill runs). The template covers the header block, Group A / Soft B / Group B / Group C / Campaign-Set tables, Platform-format checklist, Top 3 fixes, the mandatory "What I cannot verify" honest-limits block, and Summary. The same guide carries the OS Health metadata log block.

### 6. Image-specific output rules

When citing findings on an image:
- Always say WHERE on the image ("headline at top", "small caption at bottom-right", "logo in bottom-left corner")
- Cite the asset's visual area in plain language (no pixel coordinates Maddie cannot use)
- If a portion of the image is unreadable / unclear, flag it: "Bottom-right text could not be read clearly due to low contrast. Findings cover the rest of the asset."

### 7. Save and offer

Save to `Reviews/Visual Checks/[YYYY-MM-DD] [Brand] [Asset description].md`.

If the asset is part of a campaign, link the check from the campaign brief in `Information/Campaigns/`.

Offer Maddie:
> Visual check complete, [N] findings, verdict [X]. The 3 fixes that matter most are listed at the top. Want me to:
> A) Run [[Proofread]] + [[Tone Check]] on the visible text now (full pre-publish chain)
> B) Done, you have what you need

If she picks A, chain to those skills with the extracted text. (Or she can use [[Pre-publish Check]] next time to run all three in one command.)

### 8. Log to OS Health (metadata only)

Append the OS Health metadata block from [[visual-brand-check-template]] (Brand, Asset type, Guidelines file status, Verdict, per-group finding counts, Campaign set status).

NEVER log the image content, the design itself, or any visible text. Metadata only.

---

## Worked examples

Three full examples are in [[visual-brand-check-worked-examples]]:

1. **Stub guidelines, Group A + C only:** Fade Golf reel cover, verdict Minor fixes, shows the stub fallback path.
2. **Guidelines locked, full check on a campaign set:** Stride orthotics carousel (5 slides), verdict Minor fixes, demonstrates Group A + B + C plus Campaign / Set Consistency.
3. **Heavy revision:** F&E flyer with palette / typography / logo violations, verdict Heavy revision.

---

## When to chain

After Visual Brand Check, the natural next step on a design with text:
1. Proofread on the visible text
2. Tone Check on the visible text

If Maddie says "check this" or "review this design" without naming a specific skill, the [[Pre-publish Check]] orchestrator runs all three in sequence.

---

## Rules

- Honest confidence levels on EVERY finding. Never present low-confidence as high-confidence.
- Cite WHERE on the image for every layout / brand / accessibility finding.
- Stub guidelines: run Group A and Group C, flag Group B as skipped. Accessibility is brand-agnostic and always runs.
- Accessibility (Group C) is first-class, not an afterthought. WCAG 2.2 AA fails should weight the verdict, not get buried.
- If asset is part of a set, ask for the siblings or note in output that cross-asset consistency was not checked.
- "What I cannot verify" section is mandatory. Maddie should always know the limits.
- Save to `Reviews/Visual Checks/[YYYY-MM-DD] [Brand] [Asset].md`.
- Metadata only to OS Health.
- No em or en dashes in own output.

---

## Anti-patterns

- Pretending to know exact pixel measurements
- Identifying specific fonts beyond family-level
- Confident colour-hex matching without guidelines providing the hex codes
- Treating accessibility (Group C) as optional or as a bonus check
- Skipping the contrast call on light-on-light or text-over-busy-photo because "it looks fine"
- Reviewing one frame of a campaign set without asking about siblings
- Skipping the "What I cannot verify" section
- Overconfident verdicts on stub guidelines
- Logging image content to OS Health
- Vague findings ("text could be bigger"). Always specific: "increase caption from ~14pt to 18pt".

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-19 | Skill created. Group A (visual layout) + Group B (brand adherence) split, confidence levels per finding, asset-type detection, stub-guidelines fallback to Group A only, 3 worked examples (stub, locked clean, heavy revision), honest-limits section, chain to Pre-publish Check. |
| 2026-05-19 | Added "Soft observations" pattern (Step 4a). When Group B is stub-skipped, brand-style observations now surface in a dedicated labelled section rather than leaking into Group A findings. Keeps the layout-vs-brand boundary honest. Edit triggered by test on Stride leaflet pair where photographic style inconsistency was being surfaced under Group A but is really a Group B (imagery style) finding. |
| 2026-05-19 | Research-first retrofit per [[Continue - Research-First Skill Retrofits]]. Added Methodology baseline (three-layer model: layout mechanics, brand adherence, accessibility and platform fit, plus campaign-context check). Added Group C: Accessibility and Platform Fit covering WCAG 2.2 AA colour contrast (C1, 4.5:1 normal text and 3:1 large text), alt-text reminder (C2), colour-blind safety (C3), animation-flash reminder (C4). Group C runs always, even when guidelines are stubbed, because accessibility is brand-agnostic. Group A enhancements: typography weight check for mobile (A1), whitespace as active design lever (A3), Z-pattern and F-pattern reading-flow references (A4), platform conventions IG/Facebook/Reels/LinkedIn (A7), CTA thumb-zone for mobile (A8). Group B addition: inclusivity and representation check (B5, was B5). Added Campaign / Set Consistency section (CS1 to CS5) for when an asset is part of a set; Step 1 now asks for sibling assets. Verdict scale updated so accessibility fails weight the verdict, not get buried. Sources: W3C WCAG 2.2, WebAIM Contrast Checker, Attention Insight visual hierarchy, Planable 2026 social media design guide, Marq brand consistency 2026, Frontify brand audit, Revival Pixel mobile-first UX 2026, Sprak Design social media graphic design 2026. |
| 2026-05-21 | **Guide extraction pass.** Skill bloated to 554 lines after the research-first retrofit. Extracted three blocks to a sibling `Visual Brand Check/guides/` folder: full per-group checklists (Group A / Soft B / Group B / Group C / Campaign-Set, ~130 lines) to [[visual-brand-check-checklists]], full output template + OS Health metadata block (~90 lines) to [[visual-brand-check-template]], three worked examples (stub fallback, locked carousel, heavy revision, ~130 lines) to [[visual-brand-check-worked-examples]]. Skill body now links to each guide with a 1-2 sentence summary. No content lost. Skill body now 213 lines (methodology baseline, context, quick start, /goal, process steps, image-specific output rules, save/offer, OS Health log, rules, anti-patterns, changelog). |
