# Document Template, worked examples

Three worked examples for the Document Template skill, one per mode: Capture, Apply, Convert.

---

## Capture example: Stride Campaign Brief

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
- Tables: 3 table types, Deliverables, Budget, Approvals. All have navy header row, alternating cream/white rows
- Mandatories: Stride logo top-right of page 1, contact bar bottom of every page, "Confidential, Stride Clinics" footer left

Suggesting name: "Stride Campaign Brief Template"

Maddie: yes

Skill: Saving source first to Assets/Templates/Stride Campaign Brief Template.docx, then writing analysis to Brain/Document Templates/Stride Campaign Brief Template.md. Brand reconciliation check: navy #0F1F3D in the template matches Stride Brand Guidelines, ice-blue #B6D5E8 not currently in Guidelines (it's a callout-box-only colour, recording on the template only, no Guidelines edit). Brain Directory updated.

To use this template for a new campaign brief, say "create a Word campaign brief from Stride Campaign Brief Template" or run Campaign Brief Expander and pick the "save as Word doc" option at the end.
```

---

## Apply example: Generate Stride nail surgery brief as Word

```
Maddie: create a Word campaign brief from Stride Campaign Brief Template using the nail surgery June 2026 brief

Skill: Found template "Stride Campaign Brief Template". Found content at Information/Campaigns/2026-05-19 Stride Nail Surgery June.md.

Mapping content to template structure. Template has 12 sections. New content (markdown brief) has 18 sections, content is richer than template. Two options:
A) Use all 18 sections in the Word doc (will exceed template page count but content stays complete)
B) Map the 18 to the 12 by combining (e.g. "KPIs" and "Goal" combined into one section)

Maddie: A

Skill: Building Word doc with Stride Campaign Brief Template visual styling applied to all 18 sections.

[Skill uses docx skill to build the file]

Skill: Saved to Information/Campaigns/2026-05-19 Stride Nail Surgery June.docx. Open it?
```

---

## Convert example: PDF to Word

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
