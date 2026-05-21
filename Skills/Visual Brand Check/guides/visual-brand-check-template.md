# Visual Brand Check, Output Template

Full output format for [[Visual Brand Check]]. Loaded when the skill runs; the skill body links here rather than embedding the template inline.

Save the completed check to `Reviews/Visual Checks/[YYYY-MM-DD] [Brand] [Asset description].md`.

---

```markdown
# Visual Brand Check, YYYY-MM-DD HH:MM

**Source:** [image dropped / file path]
**Asset type:** [IG feed / IG story / Facebook / leaflet / etc.]
**Brand:** [brand]
**Brand Guidelines:** [locked / stub-flagged (Group A + C only) / missing]
**Campaign context:** [standalone / part of set, full set reviewed / part of set, only this frame reviewed]
**Verdict:** Ship / Minor fixes / Needs work / Heavy revision

## Group A: Visual Layout

| # | Finding | Confidence | Suggested fix |
|---|---|---|---|
| A1 | [finding] | High/Medium/Low | [specific fix] |
| ... |

## Soft observations (would normally be Group B)

*Only present this section if Group B is stub-skipped. Otherwise omit.*

| # | Observation | Why it would normally be Group B |
|---|---|---|
| SB1 | [thing noticed, e.g. photographic style differs across the asset pair] | [reason, e.g. "imagery style consistency is a Brand Guidelines call, not a layout call"] |
| ... |

> These are things I noticed that would normally need Brand Guidelines locked to give a real judgement. Surfaced for awareness, not as a Group A finding.

## Group B: Brand Adherence

[If guidelines are stub, skip this section with: "Skipped, brand guidelines stub. See Soft observations above."]

| # | Finding | Confidence | Suggested fix |
|---|---|---|---|
| B1 | [finding] | High/Medium/Low | [specific fix] |
| ... |

## Group C: Accessibility and Platform Fit

| # | Finding | Confidence | Suggested fix |
|---|---|---|---|
| C1 | [contrast finding] | High/Medium/Low | [specific fix, e.g. "darken caption text to near-black, current pale grey on white is below 4.5:1"] |
| C2 | Alt text reminder | Reminder | Confirm alt text is set before publishing |
| C3 | [colour-blind safety finding, if any] | High/Medium/Low | [specific fix] |
| ... |

## Campaign / Set Consistency

[Only present this section if asset is part of a set AND sibling assets were reviewed.]

| # | Finding | Confidence | Suggested fix |
|---|---|---|---|
| CS1 | [cross-asset finding] | High/Medium/Low | [specific fix] |
| ... |

## Platform / format

| Item | Status |
|---|---|
| Aspect ratio matches intended platform | OK / Flag |
| Text inside safe zone | OK / Flag |
| Resolution adequate | OK / Flag |
| Thumb-zone CTA position (mobile) | OK / Flag |
| Platform conventions respected | OK / Flag |

## Top 3 fixes

[Pull the 3 highest-impact findings from the tables. These are what Maddie should fix first. Accessibility fails (C1, C3) take priority over layout polish unless layout is itself blocking comprehension.]

1. **[Most important fix]**
2. **[Second most important fix]**
3. **[Third most important fix]**

## What I cannot verify (honest limits)

- Exact font identification beyond family-level
- Pixel-precise alignment (sub-5px offsets)
- Whether colours exactly match brand hex codes (can flag obvious palette drift, but precise hex matching needs a designer's eye or a colour-picker tool)
- Precise WCAG contrast ratios (can flag obvious risk, but exact ratio calculation needs WebAIM Contrast Checker or Canva's built-in tool)
- Whether alt text is set on the digital post (image alone does not contain it)
- Animation / motion flash thresholds from a still frame
- Whether the design will perform with the audience (that is a separate question; this skill only checks technical, brand, and accessibility correctness)

## Summary

[1 to 2 sentences. Verdict + the top thing to action.]
```

---

## OS Health log block (metadata only, never log image content)

```markdown
### YYYY-MM-DD HH:MM, Visual Brand Check

**Brand:** [brand]
**Asset type:** [type]
**Guidelines file status:** locked / stub
**Verdict:** ship / minor / needs work / heavy
**Findings:** Group A: [N], Group B: [N], Group C: [N]
**Campaign set:** [single / set, full / set, partial]
```
