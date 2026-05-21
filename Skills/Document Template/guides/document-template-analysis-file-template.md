# Document Template, analysis-file template

Reference for the Document Template skill's Capture mode (Step 1.6). When a template is captured, the skill writes the source-file analysis to `Brain/Document Templates/[Name].md` using this exact structure.

---

```markdown
# [Name] Template

**Source file:** Assets/Templates/[Name].[ext]
**Captured:** YYYY-MM-DD HH:MM
**Brand context:** [Brand if identifiable, else "Cross-brand"]
**Document type:** [Campaign Brief / Pitch Deck / Report / Tracker / etc.]
**Captured by:** Document Template Capture skill from [original file]

---

## Purpose

[1 to 2 sentences on what this template is for. What document needs it produces.]

## Structure

[Document type-specific structure breakdown. For Word: section order, heading hierarchy. For PowerPoint: slide count + layout per slide. For Excel: sheet structure + column patterns.]

## Visual

**Fonts:**
- Headlines: [font + weight + size]
- Body: [font + weight + size]
- Captions / footnotes: [font + weight + size]

**Colours (palette):**
- Primary: [name + hex]
- Secondary: [name + hex]
- Accent: [name + hex]
- Backgrounds: [name + hex]

**Layout:**
- Page size + orientation: [A4 portrait, A5 landscape, 16:9 widescreen, etc.]
- Margins: [top, right, bottom, left]
- Header content: [what is in the header on every page]
- Footer content: [what is in the footer on every page]

## Section patterns

For each major section / slide / sheet, note:
- Section name
- Typical content (what goes in this section every time)
- Visual treatment (heading style, content style)
- Variable content (what changes per use)

[Repeat per section]

## Tables / data treatment

[Where applicable: table styles, header row treatment, alternating row colour, cell padding, common column counts.]

## Mandatories (every document using this template MUST include)

- [e.g. "Logo in top-left of page 1"]
- [e.g. "Contact bar at bottom of every page"]
- [e.g. "Page numbers in footer"]
- [e.g. "Brand colour navy #0F1F3D for headings"]

## Variable content (what changes per use)

For [type of document this is], the parts that get filled in per use are:
- [Section X content]
- [Section Y content]
- [...]

## Notes for the Apply skill

[Anything specific the Apply mode needs to know to generate matching output. E.g. "Headings must use sentence case not title case. Body paragraphs left-aligned. Tables always have a coloured header row."]

## Source file path

`Assets/Templates/[Name].[ext]`

## Linked

- [Brand Brain file if applicable]
- [Brand Guidelines if applicable]
- [Skill that typically uses this template, e.g. Campaign Brief Expander]
```
