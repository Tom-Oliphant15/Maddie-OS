# Skill: Cross-Platform Repurposer

---
triggers:
  - "repurpose this"
  - "repurpose for"
  - "make this fit"
  - "google ads from this"
  - "version this for"
type: Workflow
---

**Purpose:** Take one post (typically Instagram main) and produce platform-appropriate variants for Facebook, TikTok caption, story breakdown, and Google Ads copy. Different demographic per platform, same campaign spine.

---

## Context

*Load these files before running this skill:*

- The relevant brand Voice file
- The relevant brand Brain file (audience, channels)
- The originating Campaign Brief Expander output if one exists for the same campaign

---

## Quick Start

Maddie says "repurpose this for Facebook + TikTok" or "google ads from this post" or "version this for stories", pasting or referencing the source post.

---

## When to Use

- Maddie has drafted or finalised an Instagram post and wants Facebook / TikTok / story variants
- Maddie has a high-performing post and wants to spin out a Google Ads ad set from it
- Maddie has a campaign concept locked and wants the same idea across multiple platforms with different copy

NOT for:
- Drafting a fresh post from scratch (use Campaign Brief Expander)
- Reposting identical content across platforms (just copy-paste)

---

## Process

### 1. Read the source post
Take the source post as-is. Identify:
- Brand (and confirm with Maddie if ambiguous)
- Core message
- Target audience signal
- Hook / opening line
- Call to action

### 2. Identify which platforms to produce
Default set: Facebook, TikTok caption, story breakdown (3 stories), Google Ads headlines + descriptions.

If Maddie names specific platforms, use only those.

### 3. Apply per-platform conventions

**Facebook variant:**
- Longer-form OK (Facebook tolerates 80 to 150 word captions better than IG)
- Older demographic by default for Stride. For Fade Golf/F&E, slightly older skew than IG
- Different opening hook from IG (avoid identical first line, which the algorithm dislikes for cross-posting)
- CTA can be more direct on Facebook

**TikTok caption:**
- Short (under 100 chars ideal, 150 max)
- Hook-led, vertical-video-first thinking
- Hashtags: 3 to 5, mix of trending and niche
- Demographic: younger skew for all three brands by default

**Story breakdown (3 stories from one main post):**
- Story 1: hook / question that draws the viewer in
- Story 2: the meat of the message, often with a poll / quiz / sticker
- Story 3: CTA + link sticker

**Google Ads from the post:**
- 10 headline variations (max 30 chars each)
- 4 description variations (max 90 chars each)
- 5 to 10 suggested search terms
- Pivot any social-friendly phrasing into search-intent phrasing

### 4. Apply voice
Each variant must match the brand voice file. If the voice is a stub (pre-28 May lock), flag and produce best-guess.

### 5. Output
Markdown block per platform, copy-paste ready. Plus a one-line summary at the top: "[Brand] [original campaign] repurposed for [platforms]."

### 6. Save
Append to the campaign's plan file under `Information/Campaigns/...` if one exists. Otherwise save to `Information/Repurposed Posts/[YYYY-MM-DD] [Brand] [topic].md`.

---

## Output Format

```markdown
# [Brand] — [Campaign / topic] — Repurposed

**Source:** [link or pasted text]

## Facebook
[caption]

## TikTok caption
[caption + hashtags]

## Stories (3-part)
### Story 1
### Story 2
### Story 3

## Google Ads
### Headlines (10)
1.
...

### Descriptions (4)
1.
...

### Suggested search terms
- 

### Negative keywords
- 
```

---

## Rules

- No em or en dashes
- British English
- Voice-match per brand
- Do NOT reuse identical opening lines across platforms (algorithm penalty)
- Push back if the source post is weak. Critical persona: "this hook is generic, want to rework before repurposing?"

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-18 | Skill stub created during Maddie OS scaffold. To be fleshed out and tested Fri 23 May. |
