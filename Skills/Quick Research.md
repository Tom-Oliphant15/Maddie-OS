---
name: Quick Research
description: Researches any marketing-relevant topic across multiple sources and delivers a clean, structured report with findings, honest assessment, and a clear bottom line.
triggers:
  - "research"
  - "look into"
  - "can you find out about"
  - "give me an overview of"
  - "compare these options"
  - "what do you know about"
  - "investigate"
  - "is [X] any good"
  - "what are my options for"
  - "/research"
type: Research
---

# Skill: Quick Research

**Purpose:** Research any topic, product, service, tactic, or decision across multiple sources and deliver a structured report with a clear, honest bottom line.

Different from [[Social Trends Watch]]:
- **Quick Research** = on-demand. She asks about something specific.
- **Social Trends Watch** = scheduled scan of what's working on social right now.

---

## Context

*Load these files before running this skill:*

- [[How Your OS Works]] for output style and the no-em-dash rule

*Load business-specific Brain files only if the research is directly related to a brand decision:*

- [[Brain/Businesses/Fade Golf]] — if researching for Fade Golf
- [[Brain/Businesses/Stride Clinics]] — if researching for Stride
- [[Brain/Businesses/Fire & Earth Leamington]] — if researching for F&E

---

## Quick Start

Maddie says:
- "research GP referral marketing for podiatry clinics"
- "look into TikTok shop for service businesses"
- "compare Meta Ads vs Google Ads for local clinics"
- "is Metricool any good"
- "what are my options for ambassador contract templates"
- "/research [topic]"

Tell me if you want a quick answer, a comparison, or a deep dive, I'll scope accordingly.

---

## When to Use

- Evaluating a tool, platform, agency, or supplier before committing
- Comparing options for a marketing decision (channels, tactics, formats)
- Getting up to speed on an unfamiliar topic before briefing it
- Checking whether a tactic / trend / company is credible and still active
- Any time Maddie needs facts rather than opinions before writing a brief

**Not the right skill?** If the research is going to become a campaign plan, run [[Campaign Brief Expander]] after this. If it's about a specific audience segment, run [[Audience Persona Builder]].

---

## /goal integration

```
/goal output covers the depth tier scoped, minimum source count met (3 for Quick / 5 for Comparison or Deep Dive), every significant claim cross-referenced across at least 2 sources or flagged as contested, bottom line contains a clear recommendation not a menu, sources cited. Stop after 5 search rounds if not met.
```

---

## How It Works

Scope the depth first. Search across multiple source types (official, news, reviews, pricing, competitors). Cross-reference claims before including. Deliver a structured report with honest assessment, if something is bad, say it clearly. Always include sources.

---

## Process

### 1. Scope the research

Determine depth:
- **Quick answer** = 2 to 3 paragraphs, top findings only
- **Comparison** = side-by-side table of options
- **Deep dive** = full structured report with all sections

If Maddie has not specified, default to Quick answer and offer to go deeper.

### 2. MCP availability check

WebSearch must be available. If it is not (cold install, sandboxed environment, intermittent error), refuse cleanly:

> WebSearch is not available right now, so I can't run this research without making things up. Try again later, or paste in source material you've already gathered and I'll synthesise from that.

Do NOT fall back to memory. Quick Research without sources is not Quick Research.

### 3. Identify source types

Plan which to check based on topic:
- Official website / vendor docs
- Recent news (last 12 months)
- User reviews (G2, Capterra, Trustpilot for tools; Google reviews for local services)
- Pricing pages
- Competitor comparisons
- Industry commentary (Marketing Week, The Drum, Search Engine Land, Social Media Today)
- ASA / CAP rulings if the topic touches UK advertising rules

### 4. Search

Minimum 3 sources for Quick, 5+ for Comparison or Deep Dive.

### 5. Cross-reference

If two sources disagree, flag it explicitly. Never present contested information as fact.

### 6. Check the subject is still active

Confirm companies / products / tactics are current before recommending. Dead links, last-updated-2022 reviews, or "service shutting down" notices all kill a recommendation.

### 7. Produce the report

Use the output format below, scaled to the depth requested.

---

## Output Format

```markdown
## Research: [Topic]
*Depth: Quick Answer / Comparison / Deep Dive*
*Sources checked: [number] | Date: [today]*

### Summary
[2 to 3 sentences: what this is and the single most important thing to know.]

### Key Findings
- [Finding] - *Source: [name / link]*
- [Finding] - *Source: [name / link]*

### Pricing
[If relevant, specific figures not vague ranges]

### Pros
- [Specific pro]

### Cons
- [Specific con]

### Bottom Line
[Honest paragraph. Make a recommendation. If it is good, say so. If it is not, say that too. Do not hedge.]

### Sources
- [Source name] - [URL]
```

For comparisons, replace Key Findings / Pros / Cons with a side-by-side table.

---

## Saving the report

If the research is non-trivial (Comparison or Deep Dive, or Maddie says "save this"), save to:

`Information/Research/[YYYY-MM-DD] [Topic].md`

Create the folder if missing. Quick answers can stay in chat unless she asks to save.

---

## Rules

- Cross-reference every significant claim across at least 2 sources, never rely on one
- Always include sources, unverified claims are not findings
- If sources disagree, state it explicitly: "Sources disagree, [source A] says X, [source B] says Y"
- If a product or tactic is bad, say so directly, do not soften
- Confirm the subject is still active before recommending
- Bottom Line must contain a recommendation, not just options
- If the topic requires expertise Maddie should consult Tom or a professional for (legal, medical, financial, ASA compliance edge cases), flag it at the end
- Em / en dashes forbidden per CLAUDE.md paste-safe rule

---

## Anti-Patterns

- Single-source findings. Always at least 2.
- Hedged Bottom Line. "It depends" is not a recommendation. Pick a side.
- Glossing over a negative finding because it might disappoint. Maddie needs the honest read.
- Going deep when she asked for a quick answer.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-21 | Initial creation, adapted from Tom OS master Quick Research. Brain context retuned to Fade Group brand files. Use cases reframed for marketing research (tactics, channels, tools, suppliers, ASA lookups). Added WebSearch availability pre-check (no memory fallback). Save path standardised on `Information/Research/`. |
