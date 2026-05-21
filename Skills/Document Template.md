# Skill: Document Template

---
triggers:
  - "capture this template"
  - "/capture-template"
  - "save this format"
  - "make a template from this"
  - "use the [template name] template"
  - "/apply-template"
  - "create a [type] from [template]"
  - "convert this PDF to Word"
  - "/pdf-to-word"
  - "Word version of this PDF"
type: Workflow (3 modes)
---

**Purpose:** Capture, save, and reapply document formatting. Maddie shows the OS a document she likes (Word, PowerPoint, Excel, or PDF). The OS analyses every element (layout, fonts, colours, sections, tables, page setup) and saves it as a reusable template. Future documents of the same type can be generated using the template + new content, producing output that matches the original exactly.

Also converts PDFs to Word equivalents for further editing.

**Three modes:**
- **Capture:** Maddie gives a document → OS analyses + saves as template
- **Apply:** Maddie says "use the X template with this new content" → OS generates a new doc matching the template
- **Convert:** Maddie gives a PDF → OS produces a Word equivalent

---

## Context

*Load these files before running this skill:*

- The relevant Anthropic skill for the file type:
  - `.docx` → [anthropic-skills:docx]
  - `.pptx` → [anthropic-skills:pptx]
  - `.xlsx` / `.csv` → [anthropic-skills:xlsx]
  - `.pdf` → [anthropic-skills:pdf]
- [[Brain/Document Templates/]] index for existing templates (Apply mode)

---

## Quick Start

Three triggers map to three modes:

| Trigger | Mode |
|---|---|
| "capture this template", "save this format", "make a template from this" + file | Capture |
| "use the [name] template", "apply [name]", "create a [doc type] from [template]" | Apply |
| "convert this PDF to Word", "PDF to Word", "Word version" + PDF file | Convert |

If the trigger is ambiguous, ask Maddie: "Capture this as a template, apply an existing template, or convert?"

**Trigger collision with sister skills.** "Use the [template name] template" can overlap with Campaign Brief Expander, Monthly Report Draft, or other skills that produce a primary artefact and might use a template at the end. Routing rule:
- If Maddie names a specific template and supplies new content (paste or path), this skill fires in Apply mode.
- If Maddie names a content type ("write a campaign brief", "produce a monthly report") AND mentions a template, the content skill fires first, then chains to this skill at its export step.
- If both interpretations are plausible, ask: "Do you want me to produce the brief first and then format it, or are you giving me existing content to format with the template?"

---

## /goal integration

**Capture mode:**
```
/goal template analysis saved to Brain/Document Templates/[Name].md, source file saved to Assets/Templates/[Name].[ext], Brain Directory updated, all template metadata sections populated (Structure, Visual, Sections, Mandatories). Stop after 6 turns if not met.
```

**Apply mode:**
```
/goal new document generated using the named template and supplied new content, output file saved with sensible name, matches template structure (visual style, section order, mandatories), file path returned to Maddie. Stop after 5 turns if not met.
```

**Convert mode:**
```
/goal Word document produced from PDF, structure preserved (headings, paragraphs, tables, lists), images extracted where present, output saved with sensible name. Stop after 4 turns if not met.
```

---

## Pre-check (all three modes)

Before routing, confirm the relevant Anthropic skill bundle is available:
- `anthropic-skills:docx` for Word
- `anthropic-skills:pptx` for PowerPoint
- `anthropic-skills:xlsx` for Excel and CSV
- `anthropic-skills:pdf` for PDF

If the bundle for the file type at hand isn't available, refuse to proceed and tell Maddie which bundle is missing and that it needs to be enabled in Claude Code (rather than silently producing degraded output).

## How Maddie hands a file to the skill

Claude Code is a CLI — there is no drag-drop. To pass a file to this skill, Maddie either:
- pastes the absolute path inline ("capture this template `/Users/maddie/Downloads/strideclinics-nail-surgery-campaign-brief.docx`"), OR
- moves the file into the OS folder first (e.g. `Assets/Templates/` for templates, anywhere under the project for ad-hoc work) and then names the relative path.

When the skill references "the file Maddie supplied", read it as "the path Maddie gave me", not a drag-drop affordance.

## Mode 1: Capture

### Step 1.1 Identify file and confirm intent

Maddie supplies a file path. Confirm:
- "Capturing [filename] as a template. Is this the version you want me to use as the master pattern, or a working draft? Master pattern means future docs match this exactly."

### Step 1.2 Route by file type

Load the appropriate Anthropic skill (`docx` / `pptx` / `xlsx` / `pdf`) and have it read the file fully.

### Step 1.3 Analyse the document

For each file type, extract the elements listed in [[document-template-analysis-fields]]. The guide covers Word (structure, visual, page setup, tables, lists, images, mandatories), PowerPoint (slide layouts, visual theme, per-slide patterns), Excel (sheet structure, per-sheet columns, formatting, tables/charts, named ranges), and PDF (section structure, visual, tables, images, with a low-confidence flag).

### Step 1.4 Name the template

Ask Maddie:
- "What name should I save this as? Suggest: [auto-suggestion based on file content + brand if identifiable]"

Naming convention: `[Brand] [Document Type] Template` or `[Document Type] Template — [Variant]`.

Examples: "Stride Campaign Brief Template", "Fade Golf Pitch Deck Template", "Monthly Marketing Report Template".

### Step 1.5 Save the source file first

Copy the source file to `Assets/Templates/[Name].[ext]` BEFORE writing the analysis. The analysis references the source path; writing analysis first then failing to copy leaves a Brain entry pointing at a non-existent file. Preserve the original somewhere safe in case Maddie wants to update the template later.

### Step 1.6 Save the analysis

Write to `Brain/Document Templates/[Name].md` using the full structure in [[document-template-analysis-file-template]]. The template covers metadata header, Purpose, Structure, Visual (fonts, colours, layout), Section patterns, Tables / data treatment, Mandatories, Variable content, Notes for the Apply skill, Source file path, and Linked references.

### Step 1.7 Brand reconciliation

Before locking the template, compare the extracted visual elements against the brand's existing Guidelines:
- Read `Brain/Brand Guidelines/[Brand] Brand Guidelines.md` if the template's brand is identified.
- For each colour, font, and key typographic decision extracted in Step 1.3, flag mismatches: "Template uses navy #0E1E3C; brand guidelines lock navy #0F1F3D. Capture the template anyway, or align the template's colour to the guideline?"
- For mismatches, default to "ask Maddie" — sometimes the captured doc is the new reference (and the guideline should update), sometimes the captured doc is a one-off variant that shouldn't override the guideline. Maddie decides.

Skip this step if the template is cross-brand or the relevant Guidelines file is in Stub state.

### Step 1.8 Update Brain Directory

Add the template to the [[Brain Directory]] under Document Templates section. Bump timestamp.

### Step 1.9 Confirm with Maddie

> Template saved as [Name]. Analysis at `Brain/Document Templates/[Name].md`, source at `Assets/Templates/[Name].[ext]`. To use it for a new document, say "use the [Name] template" or "create a [doc type] from [Name] template".
>
> If I missed any element when analysing, point at it and I will update the template metadata.

---

## Mode 2: Apply

### Step 2.1 Identify the template

Maddie names the template. If ambiguous, list available templates from `Brain/Document Templates/` and ask which.

If no templates match: surface honestly. "No template found for [name]. Available templates: [list]. Want to capture a new one (give me a source document) or proceed without a template (output will be best-guess formatting)?"

### Step 2.2 Identify the new content source

Where is the content coming from?
- Inline (Maddie pastes it)
- A markdown file (e.g. a Campaign Brief Expander output saved to `Information/Campaigns/`)
- Another file Maddie names

Read the new content.

### Step 2.3 Map content to template structure

Match the new content sections to the template's section patterns. Where the template has placeholder sections that the new content does not cover, ask Maddie:
- "Template has a [section name] section. New content has nothing for it. Skip, mark as TBC, or provide content now?"

### Step 2.4 Generate the output document

Use the relevant Anthropic skill (`docx` / `pptx` / `xlsx`) to produce the document:
- Apply the template's visual styling (fonts, colours, layout)
- Insert mandatories per template
- Populate sections with new content per the template's content pattern
- Match table styles, list styles, heading hierarchy

### Step 2.5 Save and confirm

Save the output to a sensible location:
- For campaign briefs: `Information/Campaigns/[YYYY-MM-DD] [Brand] [Campaign].docx`
- For reports: `Reviews/Monthly Reports/[YYYY-MM].docx`
- For pitches: `Assets/Pitches/[YYYY-MM-DD] [Topic].pptx`
- For anything else: ask Maddie where to save

Tell Maddie:
> Generated [filename]. Applied [Name] template. Saved to [path]. Want me to open it, or do you want to review the markdown source first?

---

## Mode 3: Convert (PDF to Word)

### Step 3.1 Read the PDF

Use [anthropic-skills:pdf] to read the file fully.

For PDFs >10 pages: use the pages parameter, work through in chunks. When stitching chunks into a single Word output, preserve heading numbering across chunk boundaries (renumber if duplicates appear from page-break artefacts).

**Image-PDF detection.** Before extracting, check whether the PDF has an OCR/text layer. Heuristic: read the first 1-2 pages with the pdf skill; if text content comes back empty or near-empty while images are present, this is a scanned-image PDF without OCR. Two options:
- **A.** Run OCR via the pdf skill's OCR support and convert from the OCRed text. Flag accuracy is lower than for native-text PDFs.
- **B.** Refuse conversion and tell Maddie: "This PDF is a scanned image without a text layer. Conversion would produce nonsense. Want me to OCR it first (slower, accuracy varies) or do you have the original Word source?"

Default to B if accuracy matters (legal, financial, brief that will be re-sent). Default to A if Maddie says it's for reference only.

### Step 3.2 Extract structure

- Headings (via font-size + font-weight detection)
- Body text
- Tables (where the PDF has them as structured data, not images)
- Lists
- Images (extract as files, reference in the Word doc)

### Step 3.3 Build the Word equivalent

Use [anthropic-skills:docx] to produce a Word document:
- Preserve heading hierarchy
- Preserve paragraph structure
- Preserve tables where extractable
- Insert images where they appeared in the PDF (referenced by extracted file path)
- Apply sensible default Word styling if no template specified

### Step 3.4 Optionally apply a template

If Maddie says "convert this PDF to Word using the [Name] template", apply the template's visual styling to the converted content.

### Step 3.5 Flag limits

PDF conversion is lossy. Flag known limitations:
- Footnotes may be lost
- Multi-column layouts may flatten
- Embedded fonts not matched exactly (best-guess)
- Tables that were rendered as images cannot be extracted as tables

Tell Maddie what was lost so she can manually fix if needed.

### Step 3.6 Save

Save to `[same path as the PDF].docx` or wherever Maddie specifies.

---

## Integration with other skills

When a skill produces an output that needs a polished version for sharing, it can chain to Document Template's Apply mode.

**Examples:**
- Campaign Brief Expander → "want this as a Word doc for Tom + Harry?" → Document Template Apply with the saved Stride Campaign Brief template
- Monthly Report Draft → "want this as a Word doc?" → Document Template Apply with the saved Monthly Report template
- Filming Brief Generator → "want this as a PDF brief for [talent]?" → Document Template Apply with the saved Filming Brief template, output PDF

For each skill that ends in shareable output, offer the Word/PDF/PPT export as a Step N+1 option.

---

## Worked examples

### Capture example: Stride Campaign Brief

```
Maddie: capture this template [drops a Word doc that has the Stride campaign brief format she likes]

Skill: Capturing strideclinics-nail-surgery-campaign-brief.docx. Is this the master pattern, or a working draft?

Maddie: master

Skill: Reading the file via docx skill.

Analysis:
- Structure: 12 sections, including Background, Goal, Audience, Messages, Deliverables, Budget, Approval, Risks
- Fonts: Georgia 18pt headlines, Open Sans 11pt body, Open Sans 10pt italic captions
- Colours: Navy #0F1F3D for headings, ice-blue #B6D5E8 for callout boxes, cream #F5F0E6 for background panels
- Page: A4 portrait, 20mm margins, header "Stride Clinics" right-aligned + page numbers footer right
- Tables: 3 table types — Deliverables, Budget, Approvals. All have navy header row, alternating cream/white rows
- Mandatories: Stride logo top-right of page 1, contact bar bottom of every page, "Confidential — Stride Clinics" footer left

Suggesting name: "Stride Campaign Brief Template"

Maddie: yes

Skill: Saving source first to Assets/Templates/Stride Campaign Brief Template.docx, then writing analysis to Brain/Document Templates/Stride Campaign Brief Template.md. Brand reconciliation check: navy #0F1F3D in the template matches Stride Brand Guidelines, ice-blue #B6D5E8 not currently in Guidelines (it's a callout-box-only colour, recording on the template only, no Guidelines edit). Brain Directory updated.

To use this template for a new campaign brief, say "create a Word campaign brief from Stride Campaign Brief Template" or run Campaign Brief Expander and pick the "save as Word doc" option at the end.
```

### Apply example: Generate Stride nail surgery brief as Word

```
Maddie: create a Word campaign brief from Stride Campaign Brief Template using the nail surgery June 2026 brief

Skill: Found template "Stride Campaign Brief Template". Found content at Information/Campaigns/2026-05-19 Stride Nail Surgery June.md.

Mapping content to template structure. Template has 12 sections. New content (markdown brief) has 18 sections — content is richer than template. Two options:
A) Use all 18 sections in the Word doc (will exceed template page count but content stays complete)
B) Map the 18 to the 12 by combining (e.g. "KPIs" and "Goal" combined into one section)

Maddie: A

Skill: Building Word doc with Stride Campaign Brief Template visual styling applied to all 18 sections.

[Skill uses docx skill to build the file]

Skill: Saved to Information/Campaigns/2026-05-19 Stride Nail Surgery June.docx. Open it?
```

### Convert example: PDF to Word

```
Maddie: convert this Maddie Phase 2 plan PDF to Word [drops PDF]

Skill: Reading the PDF (12 pages, looks like a planning doc).

Extracted: 14 sections, 3 tables (workstream status, anchors, milestones), no images, footnotes in 3 sections.

Building Word equivalent.

Notes on what may not have transferred cleanly:
- Footnotes preserved as inline parenthetical references (footnote markers do not transfer cleanly)
- Multi-column layout in section 4 flattened to single column
- All other content preserved

Saved to [path]/Maddie Phase 2 Plan.docx. Want to open and review?
```

---

## Rules

- Three modes only: Capture, Apply, Convert. If trigger is ambiguous, ask.
- ALWAYS confirm the template name with Maddie before saving (Capture).
- ALWAYS show Maddie what was extracted before saving the analysis. She can correct.
- Templates live in `Brain/Document Templates/` (analysis) + `Assets/Templates/` (source files).
- For PDF conversion, flag lossy elements explicitly. PDFs are not source-of-truth, the converted Word is best-effort.
- Brain Directory updated in real time on Capture.
- No em or en dashes in any output (skill output, not generated documents — generated documents preserve whatever was in the template).
- **Commercial-sensitivity / git-sync awareness.** Captured source files in `Assets/Templates/` and analyses in `Brain/Document Templates/` sync to GitHub via Session End. If the captured source contains pricing, named clients, internal commentary, or anything Tom or Harry would not want in a synced repo, ask Maddie before capturing: "This template contains [pricing / client names / internal notes]. The OS repo is private and only Tom has access from the GitHub side, but worth confirming before I save it." Default to ask if any of those signals are present; default to silent-save if the source is a clean structural template with placeholder content.

---

## Anti-patterns

- Capturing without showing Maddie the analysis (she should always confirm)
- Applying without telling Maddie which sections of new content map where
- Silent lossy PDF conversion (flag what was lost)
- Templates that are too brand-specific where they could be brand-agnostic (e.g. "Campaign Brief Template" might work across all three brands with brand colours swapped at apply-time)
- Storing source files outside `Assets/Templates/` (creates discovery friction)

---

## Future enhancement

When Excel template support matures, this skill should handle:
- Master Marketing Document spreadsheet
- Monthly performance tracker
- Campaign budget tracker
- Influencer contact + outreach tracker

Excel mode is functional but tested less than Word + PowerPoint as of skill creation.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-19 | Skill created. Three modes (Capture, Apply, Convert) covering Word, PowerPoint, Excel, PDF. Routes to Anthropic skills per file type. Integrates with Campaign Brief Expander + Monthly Report Draft + Filming Brief Generator + others for shareable-output generation. Triggered by Tom's request for Word output from Campaign Brief Expander and a more general document-template capability. Worked examples for Stride Campaign Brief capture, brief-as-Word apply, and PDF-to-Word convert. |
| 2026-05-20 | Cold-simulation test as Maddie (Stride Campaign Brief Template capture, hypothetical apply for nail surgery brief, hypothetical PDF convert). Eight edits applied: (1) Step order in Capture mode flipped — was writing Brain analysis with a Source-file path before copying the source file (which left a stale reference if the copy failed); now Step 1.5 copies source first, then Step 1.6 writes analysis, (2) New "Pre-check (all three modes)" section added before Mode 1: confirm the relevant Anthropic skill bundle (docx/pptx/xlsx/pdf) is available before routing; refuse if missing instead of silent degradation, (3) New "How Maddie hands a file to the skill" section corrects the "drops a file" phrasing throughout — Claude Code is a CLI with no drag-drop, Maddie pastes a path or moves the file into the OS folder, (4) Step 1.7 brand reconciliation added — compare extracted colours/fonts against `Brain/Brand Guidelines/[Brand] Brand Guidelines.md`, flag mismatches and ask Maddie before locking the template (so a one-off off-palette doc doesn't silently encode an off-brand template), (5) Step 3.1 image-PDF detection added — heuristic check for empty text layer on first 1-2 pages; if scanned-image without OCR, refuse or OCR-with-warning; default to refuse for high-stakes content; was silently producing nonsense, (6) Trigger-collision routing rule added under Quick Start — disambiguates "use the [template] template" between this skill (Apply mode) and content skills like Campaign Brief Expander / Monthly Report Draft that chain to this at their export step, (7) Rules gained commercial-sensitivity / git-sync flag — captured source files containing pricing / named clients / internal commentary get a confirmation prompt before save (private repo + Tom-only access from the GitHub side, but worth asking when sensitive content is present), (8) Future-enhancement section had "Master Marketing Document spreadsheet (locked 28 May)" and "for now (May 2026)" dated references — removed per CLAUDE.md time-bound-content rule. Capture worked example updated to reflect new step order and reconciliation pass. |
