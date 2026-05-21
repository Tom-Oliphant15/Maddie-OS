# Guide: Proofread Output Template

Output structure used by [[Proofread]]. Extracted from the skill file 2026-05-21 to keep the skill lean. Covers the markdown verdict format, image-specific output rules, and the metadata-only OS Health log entry.

---

## Output format

```markdown
# Proofread, YYYY-MM-DD HH:MM

**Source:** [paste of first 40 chars / file path / "image dropped"]
**Variant:** UK English
**Verdict:** Clean / Minor fixes / Needs work / Heavy revision

## Spelling

| Location / context | Current | Suggested | Reason |
|---|---|---|---|
| | | | |

## Grammar

| Location / context | Current | Suggested | Reason |
|---|---|---|---|
| | | | |

## Punctuation

| Location / context | Current | Suggested | Reason |
|---|---|---|---|
| | | | |

[If em or en dashes found, this section gets the hard-rule callout:]

> **Em / en dashes detected.** These mangle to garbage characters ("‚Äî") when pasted between apps with different encodings. Hard rule across the OS. Replacements: comma, full stop, colon, parentheses, or "to" for ranges.

## [Optional, only if relevant] Stylistic flags

| Location / context | Current | Suggested | Reason |
|---|---|---|---|
| | | | |

## Summary

[1 to 2 sentences. If clean, say so plainly. If heavy revision, suggest re-running after edits.]
```

## Image-specific rules

When proofreading an image:

- Cite WHERE on the image each issue is (e.g. "headline at top", "small text bottom-right", "third bullet")
- If text is unreadable in part, flag it: "Bottom-right portion was unreadable due to colour contrast. Proofread covers only the readable portion."
- Note that visual fixes are harder to apply than text fixes. Suggest she re-export from Canva after editing in the source.

## OS Health log entry (metadata only)

```markdown
### YYYY-MM-DD HH:MM, Proofread

**Source type:** pasted text / file / image
**Length:** [word count or "image"]
**Verdict:** clean / minor / needs work / heavy
**Issues found:** [spelling: N, grammar: N, punctuation: N, em-dashes: N]
```

**Privacy rule:** never log the actual text content. Counts and types only.
