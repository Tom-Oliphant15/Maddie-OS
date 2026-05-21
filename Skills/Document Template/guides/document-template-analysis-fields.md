# Document Template, per-file-type analysis fields

Reference for the Document Template skill's Capture mode (Step 1.3). For each file type, the skill extracts the following elements from the source document before saving the analysis.

---

## Word (.docx)

- Document structure: section order, heading hierarchy, paragraph styles
- Visual: fonts per element (headings, body, captions), font sizes, colours (hex where extractable), line spacing, paragraph spacing
- Page setup: page size, margins, orientation, header/footer content
- Tables: number of tables, column counts, table styles, cell formatting
- Lists: ordered/unordered, indent levels, bullet/number style
- Images: count, placement, captions
- Mandatories: anything that appears in every page or every section (logo, contact bar, page numbers, brand name)

## PowerPoint (.pptx)

- Slide count + layout per slide (title, content, two-column, image+text, etc.)
- Visual: title fonts, body fonts, colour palette, theme
- Slide master / template
- Per-slide content patterns: typical sections, image placement, footer content
- Animation patterns (if any, light analysis)

## Excel (.xlsx)

- Sheet structure: number of sheets, sheet names, sheet purposes
- Per-sheet: column headers, data types per column, formula patterns
- Formatting: header row style, conditional formatting rules, number formats
- Tables and charts present
- Named ranges, validation rules

## PDF (.pdf)

- Section structure (headings via OCR + structure detection)
- Visual: fonts, colours, layout
- Tables present (where extractable)
- Image presence and placement
- Note: PDF analysis is less reliable than native formats. Flag any low-confidence elements.
