# Pre-publish Check, Worked Examples

Three reference runs of [[Pre-publish Check]] covering the main input shapes: text-only, image with text (minor fixes), heavy revision.

---

## Example 1, text-only post draft (with stub voice, AI-pasted origin)

```
Maddie: check this for Stride: "Tired of foot pain stopping you in your tracks? Stride's expert podiatrists deliver same-week appointments for ingrown toenails, with a free consultation to elevate your treatment journey. Book online today."

Skill (Step 1): Text-only input, single, brand Stride (normalised). Skipping Visual Brand Check. Running Proofread + Tone Check.

Skill (Step 1.5, pre-collect context):
- Asset format? "IG caption" → Digital ephemeral (Proofread modifier: default scale).
- Channel / Audience / Origin? "IG caption / Cold / Pasted from AI" (drives Tone Check Step 3 + mandatory semantic-drift check 4.7).
- Stub-voice check: Stride voice.md is STUB. Two options offered: A park until 28 May voice lock; B best-guess mode, all verdicts downgraded one tier, BEST-GUESS banner. Maddie picks B.

[Proofread runs, digital ephemeral, default scale] → ✅ Clean (UK English, no em dashes, no spelling)
[Tone Check runs, best-guess mode, AI-pasted Origin, Cold IG caption] → ❌ Fail
  - Enthusiasm axis ~7 vs Stride clinical-cold position ~3 (5+ axis miss → auto-Fail)
  - Semantic-drift check 4.7: "elevate your treatment journey" flagged as AI-homogenisation marker
  - Best-guess downgrade applied to component tier (already at ❌, no further drop)

Combined verdict mapping (Step 3b): worst non-skipped component is Tone Check ❌ → ❌ Heavy revision. BEST-GUESS banner mandatory.

**Combined verdict:** ❌ Heavy revision (BEST-GUESS, Stride voice stub)

| Check | Status | Issues | Notes |
|---|---|---|---|
| Proofread | ✅ Clean | 0 | Digital ephemeral, default scale |
| Tone Check | ❌ Fail | 2 | Best-guess mode, voice file stub |
| Visual Brand Check | Skipped | n/a | No image input |

**Top 3 fixes (across the 2 running components):**
1. Rewrite to clinical-cold register, drop enthusiasm by ~4 points. Open with the offer flatly, not with a problem hook (Tone Check)
2. Remove "elevate your treatment journey", AI homogenisation marker, replace with a concrete service line (Tone Check)
3. (no third fix, only one Tone Check finding beyond the rewrite, do not pad with blank rows)

What to do next: Re-draft in clinical-cold register, re-run /pre-publish. Voice file locking on 28 May will upgrade future verdicts from best-guess to confident.

(Note: filename saved as "2026-05-21 Stride IG caption text check.md" per Step 6 rule 4, since Maddie did not name the asset and there was no image filename to inherit.)
```

---

## Example 2, Canva export with text

```
Maddie: review this design for Stride [drops Canva export]

Skill: Image with extractable text, brand Stride. Running all three.

[Proofread runs on extracted text] → ⚠ Minor fixes (1 spelling)
[Tone Check runs on extracted text] → ✅ Pass
[Visual Brand Check runs] → ⚠ Minor fixes (3 findings, Brand Guidelines stub → Group A only)

**Combined verdict:** ⚠ Minor fixes

| Check | Status | Issues |
|---|---|---|
| Proofread | ⚠ Minor | 1 (US spelling) |
| Tone Check | ✅ Pass | 0 |
| Visual Brand Check | ⚠ Minor | 3 (layout) |

**Top 3 fixes:**
1. Move CTA above the IG reel UI safe zone (bottom 8% danger area), Visual Brand Check
2. Increase caption text size for legibility, Visual Brand Check
3. Spelling: "specialize" → "specialise", Proofread

After these 3 fixes, re-run `/pre-publish` to verify.

(Note: Visual Brand Check ran Group A only because Stride Brand Guidelines are still a stub. Once locked, the Group B brand-adherence check would also run.)
```

---

## Example 3, Heavy revision

```
Maddie: is this ready [drops a leaflet draft with American spellings, off-brand colours, and a small CTA]

Skill: Image with text, F&E. Running all three.

[Proofread] → ⚠ Needs work (4 US spellings, 1 em dash)
[Tone Check] → ❌ Fail (sounds like a different brand, too clinical for F&E)
[Visual Brand Check] → ❌ Heavy revision (off-brand background colour, small body text, logo violations, uneven margins)

**Combined verdict:** ❌ Heavy revision

Worst component is Visual Brand Check (heavy revision). Combined verdict inherits.

| Check | Status | Issues |
|---|---|---|
| Proofread | ⚠ Needs work | 5 |
| Tone Check | ❌ Fail | 3+ |
| Visual Brand Check | ❌ Heavy revision | 7 |

**Top 3 fixes (start here):**
1. Replace the background colour with F&E palette, Visual Brand Check
2. Re-draft the body copy in F&E voice (the current copy reads clinical, not sensory), Tone Check
3. Fix the em dash + 4 US spellings before any further design work, Proofread

This needs more than patching. Recommend rebuilding from the F&E print template rather than fixing this draft.
```
