# Skill: Proofread

---
triggers:
  - "proofread"
  - "/proofread"
  - "check spelling"
  - "check grammar"
  - "proof this"
  - "is this right"
type: Quality Check
---

**Purpose:** Spelling, grammar, and punctuation check against UK English conventions. Accepts pasted text, markdown files, or images (Canva exports, social media screenshots, leaflet drafts). Returns specific edits, not rewrites.

Different from [[Tone Check]]:
- **Proofread** = is this technically correct? (spelling, grammar, punctuation, em-dash rule)
- **Tone Check** = does this match the brand voice? (tone, vocabulary, sentence rhythm)

Run both before publishing anything external.

---

## Context

*Load these files before running this skill:*

- [[How Your OS Works]] for the no-em-dash rule context

No brand or audience context needed. Proofread is technical, not voice-sensitive.

---

## Quick Start

Three ways to invoke:

1. **Pasted text:** "proofread this: [text]"
2. **File reference:** "proofread Information/Campaigns/2026-06-02 Stride Nail Surgery.md"
3. **Image:** Maddie drops an image (Canva export, IG post screenshot, leaflet draft photo) and says "proofread" or "is this right?"

---

## /goal integration

```
/goal output identifies every spelling, grammar, and punctuation issue against UK English, every issue has a specific fix proposed, em/en dashes flagged separately as hard-rule violations, verdict is one of (clean / minor fixes / needs work / heavy revision), output under 300 words unless input is very long. Stop after 3 turns if not met.
```

---

## Process

### 1. Detect input type, asset format, and extract text

**Empty-input guard.** If Maddie said "proofread" / "/proofread" / a trigger phrase with no text, no file path, and no image attached, ask:
> What would you like me to proofread? Paste the text, give me a file path, or drop an image.

Do not produce a verdict on nothing.

**Input type:**
- **Pasted text:** use it directly.
- **File path:** Read the file. **Pre-check the path exists** before reading:
  - Path exists: continue.
  - Path does not exist: return clearly:
    > File not found at `[path]`. Did you mean a different path, or paste the content inline?
  - Do not silently fail the read.

  Then by file type:
  - `.md` / `.txt` → Read directly
  - `.docx` → use the docx skill if available, otherwise ask Maddie to paste contents
  - `.pdf` → use the pdf skill if available
  - Anything else → ask Maddie to paste contents
- **Image:** Claude reads the image natively. Extract the readable text. If text is partially unreadable (low contrast, glare, cut-off), flag the unreadable portion explicitly and proofread what is clear.

**Orchestrator invocation note.** When [[Pre-publish Check]] invokes Proofread, the asset format (Print / Digital permanent / Digital ephemeral / Internal) is pre-collected in the orchestrator's Step 1.5 and passed through. Use the provided value, do not re-prompt Maddie for it. Standalone runs (Maddie types `/proofread` directly) still apply the asset-format detection rules below as normal.

**Asset format (drives severity modifier in Step 4):**

Detect from context (Maddie naming it, file type, image proportions, design cues):

| Format | How to detect | Severity modifier |
|---|---|---|
| **Print** (leaflet, flyer, poster, business card, signage, A4/A5/A3 ratio, branded brochure) | Maddie says "leaflet" / "flyer" / "poster" / "print"; PDF with bleed marks; high-res portrait image with clear print proportions | **Spelling errors escalate to Heavy revision automatically.** Cost of reprint far exceeds cost of digital fix. |
| **Digital, permanent** (website page, email template, master document, anything published once and referenced repeatedly) | URL given, Maddie says "website" / "email", or a markdown / docx file feeding a long-lived asset | **Spelling errors escalate to at minimum Needs work.** Visible to many people over time. |
| **Digital, ephemeral** (Instagram story, Slack post, one-off social caption, tweet) | Maddie says "story" / "Slack" / "social"; 9:16 social-story aspect ratio | **Default verdict rules apply.** Recoverable with a quick edit-and-repost. |
| **Internal / draft** (working doc, voice note transcript, draft in flight) | Maddie says "draft" / "working on" / "internal" | **Default verdict rules apply, optionally lower severity.** No external audience. |

If asset format is unclear, ask Maddie: "Is this a print piece, a digital permanent asset, a story / Slack post, or an internal draft?" The severity model needs to know.

### 2. Establish UK English baseline

UK English spelling, grammar, punctuation, and stylistic rules to check against, plus the four-pass structure (spelling, grammar, punctuation, stylistic), live in [[proofread-uk-english-rules]]. Load when running the skill.

### 3. Run the check

Walk the input through the four passes from the rules guide. Capture every issue with its location, current text, suggested fix, and the rule that applies.

### 4. Output verdict

**Default verdict scale:**
- **Clean**, no issues found
- **Minor fixes**, 1 to 3 small issues, easy to apply
- **Needs work**, 4 to 8 issues, or one significant issue
- **Heavy revision**, 9+ issues, or fundamental grammar problems

**Then apply the asset-format severity modifier (from Step 1):**

- **Print:** ANY spelling error → automatic **Heavy revision**. One typo on a printed leaflet costs the print run. The default scale does not apply.
- **Digital permanent:** ANY spelling error → automatic minimum **Needs work**. The asset will be seen many times over its lifespan.
- **Digital ephemeral / Internal:** default scale applies.

The output must show BOTH the default-scale rating AND the modifier-applied rating when they differ. Maddie sees: "Default verdict: Minor fixes. Print modifier applied: Heavy revision. Reason: 2 spelling errors on a print leaflet are publish-blockers."

This stops a 1-typo leaflet getting a Minor-fixes pass that lets it go to print.

### 5. Output format

Full markdown output structure (verdict header, per-category tables, em-dash hard-rule callout, summary), image-specific rules (cite location, flag unreadable areas, suggest Canva re-export), and the metadata-only OS Health log entry live in [[proofread-output-template]].

### 6. Log to OS Health (metadata only)

Use the log entry format in [[proofread-output-template]]. Never log the actual text content, counts and types only.

---

## Worked examples

Four worked cases (clean, minor fixes, image input, heavy revision) live in [[proofread-worked-examples]]. Use them as the calibration baseline for verdict severity.

---

## Rules

- UK English baseline. Cite specific rule for each fix.
- No rewrites. Specific changes only.
- Em / en dashes get the hard-rule callout, every time.
- Image input: cite WHERE on the image each issue lives.
- Stylistic flags optional, low-priority, only when obvious.
- Metadata only to OS Health. NEVER the text content.
- No em or en dashes in the skill's own output (eat your own dog food).

---

## Anti-patterns

- Rewriting Maddie's copy instead of pointing to fixes
- Treating US spellings as wrong-everywhere (they are wrong-here, in UK context)
- Over-flagging stylistic items (the goal is clean copy, not perfect copy)
- Skipping the em-dash flag because "it is widely used elsewhere" (it is OUR hard rule)
- Logging the text to OS Health (privacy boundary)
- Marking image issues without location ("Spelling error in body text" is not enough; specify where)

---

## When to chain with other skills

After Proofread comes back clean:
- Run [[Tone Check]] for brand voice match before publishing
- If both pass, ship

Both Proofread and Tone Check should run on every external comm. Together they take under 60 seconds, save Maddie from after-the-fact embarrassment.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-19 | Skill created. UK English rules baseline (spelling -ise/-our/-re, grammar, punctuation), em-dash hard-rule enforcement, image / file / text input handling, 4 worked examples (clean / minor / image / heavy), chain to Tone Check for full pre-publish workflow. |
| 2026-05-19 | Added asset-format severity modifier after test on Stride leaflets surfaced "SANDLES" + "Nail surgury" misspellings. Print materials now escalate ANY spelling error to Heavy revision; digital permanent assets escalate to minimum Needs work. Stops typo'd leaflets sneaking through with a Minor fixes pass. |
| 2026-05-21 | **Guide extraction pass.** Skill bloated to 361 lines. Extracted UK English rules reference + four-pass structure to [[proofread-uk-english-rules]], full output template + image rules + OS Health log entry to [[proofread-output-template]], and the four worked examples to [[proofread-worked-examples]]. Skill body now links to all three rather than embedding. No content lost. Skill body now under 150 lines (workflow + rules + anti-patterns + changelog).
| 2026-05-21 | **Cold-tested as Maddie standalone.** Scenarios walked: pasted text inline, file path reference (existing + missing), image drop with readable + partially unreadable text, .docx without docx skill, ambiguous asset format, empty input, invoked by Pre-publish Check orchestrator. Skill held up well overall, most heavy work was done by the 2026-05-19 asset-format modifier addition. 3 edits applied: (1) Step 1 empty-input guard added so "/proofread" with no text/file/image asks for content rather than producing an empty verdict. (2) Step 1 file-path pre-check added so file-not-found returns a clear error and offers alternatives, rather than silently failing the read (common during install window when Information/Campaigns/ is empty). (3) Step 1 orchestrator-invocation note added so Pre-publish Check's pre-collected asset format (Step 1.5 of orchestrator) is passed through without Proofread re-prompting Maddie; standalone runs still apply asset-format detection rules normally. Scenarios 3 to 6 worked cleanly as-was; UK English check, em-dash hard-rule callout, image location-citing rule, privacy boundary all functional. | |
