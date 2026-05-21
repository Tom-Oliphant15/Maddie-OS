# Pre-publish Check, Output Template

The combined output format used by [[Pre-publish Check]]. Save to `Reviews/Pre-publish Checks/[YYYY-MM-DD] [Brand] [Asset description].md`.

---

```markdown
# Pre-publish Check, YYYY-MM-DD HH:MM

**Source:** [text / file / image / image with text]
**Brand:** [brand]
**Asset type:** [if image, what it is]
**Combined verdict:** ✅ Ship / ⚠ Minor fixes / ⚠ Needs work / ❌ Heavy revision

## Component verdicts

| Check | Status | Issues | Detail |
|---|---|---|---|
| Proofread | ✅/⚠/❌ | [N] | See `Reviews/Proofread/[file]` |
| Tone Check | ✅/⚠/❌ | [N] | See `Reviews/Tone Check/[file]` |
| Visual Brand Check | ✅/⚠/❌/skipped | [N] | See `Reviews/Visual Checks/[file]` |

## Top 3 fixes (across all checks)

*For single-input: drawn from across the three component skills.*
*For multi-input: drawn from across all assets AND the cross-asset consistency block. Each item names the asset and the source skill.*

1. **[Most important fix]** ([source: asset name + Proofread / Tone Check / Visual Brand Check / cross-asset])
2. **[Second]** (source)
3. **[Third]** (source)

## Full findings

### Proofread
[Full Proofread output]

### Tone Check
[Full Tone Check output]

### Visual Brand Check
[Full Visual Brand Check output, or "skipped, no image input"]

## What to do next

- [If Ship] Publish.
- [If Minor fixes] Apply the Top 3 above, re-run `/pre-publish check` to verify.
- [If Needs work] Apply all fixes from the component checks, re-run.
- [If Heavy revision] Re-draft using the component output as a checklist, then re-run.

## What I cannot verify

(Inherits from the component skills' honest-limits sections. Most relevant ones bubbled up here.)

- Pixel-precise design measurements
- Exact font identification beyond family-level
- Whether the message will resonate with the audience (separate question, see Campaign Brief Expander)
```

---

## Multi-input addition: Cross-asset consistency block

When 2+ assets are checked in one call, the output also includes this block (placed before the Top 3):

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

If Brand Guidelines are still stub, the photographic / palette / typography rows become Soft observations (same pattern as Visual Brand Check Step 4a). The OS does not pretend to make brand-rule calls without the rules locked.
