# Skill: Pre-publish Check

---
triggers:
  - "check this"
  - "review this"
  - "review this design"
  - "check this design"
  - "/pre-publish"
  - "pre-publish check"
  - "is this ready"
type: Quality Check (orchestrator)
---

**Purpose:** Run [[Proofread]] + [[Tone Check]] + [[Visual Brand Check]] in sequence on a single input. Maddie drops a draft (text or image), says "check this", gets a combined verdict across all three quality skills. Catches the publish-and-cringe class of issues in one command.

This is an **orchestrator** skill. It does not run its own checks. It detects the input type, decides which of the three component skills to run, runs them, aggregates the output.

---

## Context

*Load these files before running this skill:*

- The three component skills load their own context: [[Proofread]], [[Tone Check]], [[Visual Brand Check]]
- This orchestrator only needs to identify the input type and the brand

---

## Quick Start

Maddie says any trigger above. Examples:

- "review this design for Stride" (drops Canva export)
- "check this" (drops image OR pastes text)
- "is this ready to ship" (drops draft)
- "/pre-publish for Fade Golf [text]"

---

## /goal integration

```
/goal component context (asset format, channel, audience moment, origin) pre-collected in a single pass before any component runs, stub-voice state surfaced at orchestrator level (not inside Tone Check), Proofread + Tone Check + Visual Brand Check have all run on the appropriate parts of the input (text-only inputs skip Visual Brand Check, image-only inputs skip Tone Check unless visible text was extracted), each component verdict mapped to the orchestrator tier (Pass / Provisional / Drift / Fail / Best-guess downgrade), a combined verdict is produced (worst non-skipped component drives), top 3 fixes across all skills surfaced without padding blanks, output saved to Reviews/Pre-publish Checks/[YYYY-MM-DD] [Brand] [Asset description].md with the filename rule applied. Stop after 6 turns if not met.
```

---

## Process

### 1. Detect input type, count, and brand

**Input count:**
- **Single input** (one text, one file, or one image): standard sequential flow.
- **Multi-input** (multiple images, image + image, image + text, multiple files): standard flow PLUS a cross-asset consistency check after the individual checks. See Step 3a.

**Input type per item:**
- **Text only** (pasted text or `.md`/`.txt` file): Proofread + Tone Check. Skip Visual Brand Check.
- **Image only** (no extractable text): Visual Brand Check only. Skip Proofread + Tone Check.
- **Image with text** (Canva export, social post, leaflet with copy): all three skills run.
- **Mixed** (file + image): run on each part.

**Brand:**
- If Maddie named it ("for Stride"), use that.
- If not named, ask: "Which brand? Fade Golf, Stride, or F&E?"
- For text-only inputs that do not name a brand, ask before proceeding (Tone Check needs the brand).
- For multi-input, assume same brand across all unless Maddie says otherwise.

Normalise the brand name to canonical form (same table as [[Tone Check]] Step 1): `fade golf` / `golf` / `fade` → Fade Golf; `stride` / `stride clinics` → Stride; `fire & earth` / `f&e` / `leamington` / `fire and earth` → Fire & Earth.

### 1.5. Pre-collect component context (single pass)

The component skills each need context that the orchestrator can collect once, upfront, instead of cascading questions through three sub-skills. Ask Maddie the questions below in a single batch, then pass the answers through to the components so they do not ask again.

**Questions to ask (only those relevant to the components being run):**

| Component | Question | Defaults if Maddie skips |
|---|---|---|
| Proofread (text/image-with-text) | "Is this Print, Digital permanent (website / email / master doc), Digital ephemeral (story / Slack / one-off social), or Internal draft?" | If image proportions clearly indicate print → Print. Otherwise Digital ephemeral. Note default in output. |
| Tone Check (text/image-with-text) | "Channel? (IG caption, TikTok caption, email, ad headline, landing page section, reply). Audience moment? (Cold / Warm / Booked / Post-purchase / Post-complaint). Origin? (Hand-written / AI-edited / AI-pasted)." | IG caption / Warm / Hand-written. Note defaults in output. |

If only one component will run (image-only → only Visual Brand Check), skip this step.

**Stub-voice pre-check (Tone Check only).** Before calling Tone Check, check the brand's voice file. If the file's first 3 lines contain `STATUS: Stub` or the file is missing:

- Surface the stub flag at orchestrator level, not inside Tone Check.
- Offer Maddie the two options (A: park the Pre-publish Check until the voice is locked; B: proceed with best-guess mode, all verdicts downgraded one tier, BEST-GUESS banner on output).
- If Maddie picks A, stop the run; do not invoke any components yet. If B, pass `mode=best-guess` to Tone Check so it skips its own stub prompt.

This step preserves the "drop and check" promise of the orchestrator. Without it the user hits 4+ cascading prompts before seeing a verdict.

### 2. Run the appropriate skills in order

**Order matters.** Run in this sequence so each skill informs the next:

1. **Proofread first.** Surfaces typos and grammar errors before tone/visual concerns. If heavy revision is needed at this stage, the rest may be moot.
2. **Tone Check second.** Once text is correct, check brand voice match.
3. **Visual Brand Check third (if image).** Once text is sorted, check layout + brand visual adherence.

Each skill writes its own output to its own folder (`Reviews/Proofread/`, `Reviews/Tone Check/`, `Reviews/Visual Checks/`).

### 3a. Cross-asset consistency check (multi-input only)

If Maddie dropped 2+ assets in one call (a leaflet pair, an Instagram post + story variant, a campaign set), run a cross-asset analysis after the individual checks. Skip this step on single-input.

**What to compare across the assets:**

| Item | Question | Severity if inconsistent |
|---|---|---|
| Brand language elements (logo, contact bar, CTA block style) | Are these treated consistently across the set? | High if logo treatment varies, medium for CTA / contact bar |
| Photographic style | Do the photos read as one brand or different brands? | Medium-high if one is lifestyle and one is clinical without a deliberate reason |
| Decorative elements (foot illustrations, dot patterns, navy bars, accent shapes) | Do the same decorative elements appear consistently, or do they look ad-hoc per asset? | Medium |
| Colour palette | Same palette across the set? | High if obvious palette drift |
| Typography | Same fonts and weights? | High if inconsistent |
| Headline structure | Same approach to hook + sub-head across the set? | Low to medium |

**Output a consistency block:**

```markdown
## Cross-asset consistency

| Item | Status | Note |
|---|---|---|
| Logo treatment | ✅ / ⚠ | [specific] |
| Contact bar / CTA | ✅ / ⚠ | [specific] |
| Photographic style | ✅ / ⚠ | [specific, e.g. "Asset 1 lifestyle/beach, Asset 2 clinical/treatment, different brand reads"] |
| Decorative elements | ✅ / ⚠ | [specific] |
| Colour palette | ✅ / ⚠ | [specific] |
| Typography | ✅ / ⚠ | [specific] |
```

If Brand Guidelines are still stub, the photographic / palette / typography checks become Soft observations (same pattern as Visual Brand Check Step 4a). The OS does not pretend to make brand-rule calls without the rules locked.

### 3b. Aggregate the results

Pull each component skill's verdict and findings. Map each to the orchestrator tier using the table below, then combine.

**Component-verdict → orchestrator-tier mapping:**

| Component output | Orchestrator tier | Notes |
|---|---|---|
| Proofread: Clean | ✅ Pass | |
| Proofread: Minor fixes | ⚠ Minor | |
| Proofread: Needs work | ⚠ Needs work | |
| Proofread: Heavy revision | ❌ Heavy | |
| Tone Check: Pass | ✅ Pass | |
| Tone Check: Provisional Pass | ✅ Pass | Add a one-line caveat in Component verdicts table: "Provisional, Reference Posts empty". |
| Tone Check: Drift | ⚠ Needs work | |
| Tone Check: Fail | ❌ Heavy | |
| Visual Brand Check: Clean / Pass | ✅ Pass | |
| Visual Brand Check: Minor | ⚠ Minor | |
| Visual Brand Check: Needs work | ⚠ Needs work | |
| Visual Brand Check: Heavy revision | ❌ Heavy | |
| Any component: skipped | n/a | Excluded from worst-component calc. |
| Best-guess mode (set in Step 1.5) | downgrade one tier on the component's mapped tier | E.g. Tone Check Pass under best-guess → ⚠ Minor. Mandatory BEST-GUESS banner on combined output. |

**Combined verdict logic (worst non-skipped component drives the combined verdict):**
- **✅ Ship** = all non-skipped components map to ✅ Pass
- **⚠ Minor fixes** = worst is ⚠ Minor
- **⚠ Needs work** = worst is ⚠ Needs work
- **❌ Heavy revision** = any non-skipped component maps to ❌ Heavy

The OS does not paper over a Tone Check Fail because Proofread was clean. The OS also does not surface a confident Ship verdict if any component ran under best-guess.

### 4. Surface the top 3 fixes across all checks

**Single-input:** pull the highest-impact finding from each non-skipped component skill first (so each running component is represented if it had a finding). Then top up to 3 from the next-highest-priority items in any non-skipped component. If the total number of fixes across the whole check is fewer than 3, surface only what exists, do NOT pad with blank rows ("2. -", "3. -"). A clean 1-fix output is honest; a padded 3-fix output is noise.

The Top 3 is what Maddie should action FIRST, drawn from across the full check.

**Multi-input:** produce ONE consolidated Top 3 across the whole set. Pull the highest-impact items regardless of which asset they came from. Each item in the Top 3 names the asset and the source skill.

Priority order for multi-input Top 3:
1. **Publish-blockers first** (any Heavy revision verdict on any asset, especially Proofread errors on print). These trump everything else.
2. **Cross-asset inconsistencies second** (the leaflet pair looking like different brands is a campaign-level issue that no single-asset fix solves).
3. **Per-asset significant issues third** (a duplicate logo, a major layout error).
4. **Improvements last** (legibility tweaks, decoration sizing).

The goal of the consolidated Top 3 is "if Maddie only fixes 3 things across the whole set, these are the 3 that move the needle most".

### 5. Output format

Full output template is in [[pre-publish-check-output-template]]. Header block, component verdicts table, Top 3 fixes (sourced per item), full findings per component, what to do next, what I cannot verify. Multi-input runs add a cross-asset consistency block before the Top 3.

### 6. Save the combined output

**Folder pre-check.** Before writing, ensure these folders exist; create any that are missing:
- `Reviews/Pre-publish Checks/`
- `Reviews/Proofread/`
- `Reviews/Tone Check/`
- `Reviews/Visual Checks/` (only when Visual Brand Check ran)

Components will fall over silently if their output folder does not exist. This is an install-window concern, [[Install]] should create these on first run but the orchestrator self-heals if any are missing rather than refusing to log.

**Filename rule.** Save to `Reviews/Pre-publish Checks/[YYYY-MM-DD] [Brand] [Asset description].md`. Asset description resolution, in priority order:

1. Maddie named it ("Stride nail surgery IG caption") → use her naming.
2. Image file with a meaningful filename ("stride-summer-leaflet.png") → strip extension, title case.
3. Image with no useful filename → describe the asset visually ("Stride leaflet", "Fade Golf IG story").
4. Inline-pasted text with no naming → use `[Brand] [channel from Step 1.5] text check` (e.g. "Stride IG caption text check"). Never default to "Asset.md" or "Untitled".

Component skills also write to their own folders (so each can be referenced individually). The Pre-publish Check is the single combined view.

### 7. Log to OS Health (metadata only)

```markdown
### YYYY-MM-DD HH:MM, Pre-publish Check

**Brand:** [brand]
**Input type:** text / image / mixed
**Components run:** Proofread / Tone Check / Visual Brand Check
**Combined verdict:** ship / minor / needs work / heavy
**Component verdicts:** Proofread: X, Tone Check: X, Visual Brand Check: X
```

Each component skill ALSO writes its own metadata-only OS Health entry. So a Pre-publish Check generates 4 OS Health entries (1 orchestrator + 3 components). This is intentional; Tom's Admin Report can drill into any single component if needed.

---

## Worked examples

Three reference runs (text-only minor fix, Canva export minor fixes, heavy revision leaflet) in [[pre-publish-check-worked-examples]]. Read when calibrating verdict severity, Top 3 selection, or the "skipped" handling for text-only / image-only inputs.

---

## When to use Pre-publish Check vs the individual skills

**Use Pre-publish Check when:**
- The asset is going out externally (Slack canvas counts as internal, social posts count as external)
- Multiple aspects need checking (text + voice + design)
- You want one verdict instead of three

**Use individual skills when:**
- You only want one specific check (e.g. just spelling, no design check)
- The asset is internal-only (master marketing doc draft does not need Visual Brand Check)
- You are iterating fast on copy and Visual Brand Check would slow you down

The orchestrator is the default for finished assets. Individual skills are for in-flight drafting.

---

## Rules

- Pre-collect ALL component context (asset format, channel, audience moment, origin) in Step 1.5 before invoking any component. Never let a component bounce back asking Maddie a question the orchestrator could have asked upfront.
- Detect stub voice state at orchestrator level in Step 1.5. Surface the A/B choice there, do not pass through to Tone Check's own stub flow.
- Run components in order: Proofread → Tone Check → Visual Brand Check
- Worst non-skipped component verdict drives combined verdict (use the Step 3b mapping table)
- Best-guess mode downgrades each affected component one tier and forces a BEST-GUESS banner on the combined output. No silent best-guess Ship verdicts.
- Top 3 fixes pulled from across all non-skipped components, ranked by impact. If fewer than 3 fixes exist total, surface fewer; never pad with blank rows.
- Filename uses the Step 6 resolution priority (Maddie naming > image filename > visual description > `[Brand] [channel] text check`). Never default to "Asset.md" or "Untitled".
- Folder pre-check is mandatory in Step 6. Self-heal missing `Reviews/Pre-publish Checks/` `/Proofread/` `/Tone Check/` `/Visual Checks/` rather than refusing to log.
- Each component writes its own OS Health entry; orchestrator writes one too (4 total per run, fewer if components skipped)
- Save combined output to `Reviews/Pre-publish Checks/[YYYY-MM-DD] [Brand] [Asset description].md`
- Privacy boundary inherited: no content to OS Health, metadata only

---

## Anti-patterns

- Hiding a Tone Check Fail because Proofread was clean (combined verdict must surface the worst)
- Running Visual Brand Check on a text-only input (waste)
- Cascading questions through the components (Proofread asks asset format, then Tone Check asks channel + audience + origin, then asks A/B on stub). The orchestrator pre-collects in Step 1.5 in one pass.
- Padding the Top 3 with blank rows ("2. -", "3. -") when only one fix exists. Surface what is there honestly.
- Producing a "Ship" verdict from a run that used best-guess mode. The banner is mandatory and the worst component tier is downgraded one notch.
- Defaulting an output filename to "Asset.md" or "Untitled" when Maddie pasted text inline (apply Step 6 filename rule)
- Refusing to save because `Reviews/Pre-publish Checks/` does not exist (create it instead)
- Skipping the "What I cannot verify" inherited section
- Replacing individual skill outputs (orchestrator complements them, does not replace; each component file still exists)
- Producing a combined verdict more positive than any component verdict

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-19 | Skill created. Orchestrator pattern wrapping Proofread + Tone Check + Visual Brand Check. Input-type detection (text / image / mixed), brand resolution, sequential execution with shared output aggregation, worst-component-drives-combined-verdict rule, top 3 fixes across components, 3 worked examples (text-only, image with text minor fixes, heavy revision). |
| 2026-05-19 | Added multi-input support: Step 3a cross-asset consistency check (logo, photography, decoration, palette, typography, headline structure with severity guidance and soft-observation fallback for stub Brain Guidelines). Step 4 expanded with consolidated Top 3 logic for multi-input runs (publish-blockers first, cross-asset inconsistencies second, per-asset issues third, improvements last). Output format updated to show asset + source per Top 3 item. Edit triggered by test on Stride leaflet pair which produced two separate Top 3 lists when one consolidated list was more useful. |
| 2026-05-21 | **Guide extraction pass.** Skill body sat at 343 lines after the multi-input addition. Extracted the full output template (Step 5 markdown block plus the cross-asset consistency output block) to [[pre-publish-check-output-template]] and the three worked examples (text-only, Canva export, heavy revision) to [[pre-publish-check-worked-examples]]. Skill body now links to both rather than embedding. Also removed a stray em dash inside the Step 3a table. No content lost. |
| 2026-05-21 | **Text-only path cold-tested as Maddie (last P1 skill).** Scenario: Stride IG caption pasted from AI, all three voice files still STUB. Seven structural gaps surfaced, all applied. (1) Step 1.5 added: pre-collect Proofread asset format + Tone Check channel/audience/origin in a single pass before invoking components, stops 4+ cascading questions through the components and preserves the "drop and check" promise. (2) Stub-voice handling lifted to orchestrator level, also in Step 1.5: orchestrator detects stub state from the voice file's first 3 lines and surfaces the A/B choice once, passes `mode=best-guess` to Tone Check so the component does not re-prompt. (3) Step 3b verdict-mapping table added covering Proofread / Tone Check / Visual Brand Check tiers including Tone Check's Provisional Pass and Best-guess downgrade; best-guess always forces a banner on combined output and downgrades the affected component by one tier (no silent best-guess Ship verdicts). (4) Step 4 Top 3 rule clarified: pull from each non-skipped component first, then top up; never pad with "2. -", "3. -" blank rows when fewer than 3 findings exist total. (5) Step 6 folder pre-check added (Reviews/Pre-publish Checks/, /Proofread/, /Tone Check/, /Visual Checks/ self-heal if missing, since Install does not currently create them, install-window concern flagged). (6) Step 6 filename rule added: Maddie naming > image filename > visual description > `[Brand] [channel] text check`, never defaults to "Asset.md" or "Untitled". (7) Brand name normalisation reused from [[Tone Check]] Step 1. Worked Example 1 rebuilt to demonstrate the new pre-collection step, stub-voice route, best-guess downgrade, and unpadded Top 3. `/goal` updated. Rules + Anti-patterns expanded. Install gap flagged for upcoming Install test: Reviews subfolders (Pre-publish Checks / Proofread / Tone Check / Visual Checks) are not currently created on first install; component skills hit silent save failures. |
