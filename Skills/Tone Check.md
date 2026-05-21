# Skill: Tone Check

---
triggers:
  - "tone check"
  - "/tone-check"
  - "does this match"
  - "check the voice"
  - "is this on brand"
type: Quality Check
---

**Purpose:** Run any draft copy through the brand voice file for the relevant brand and return pass / drift flagged / specific edits. Quick, lightweight, used before any external comm ships.

Sits between Maddie writing copy and Maddie publishing copy. Stops voice drift cold once brand voices are locked.

---

## What's Appropriate Here

Maddie runs marketing across three small UK local brands (Fade Golf, Stride Clinics, Fire & Earth Leamington). She reviews her own copy before publishing, often pasting drafts from Claude / GPT for human-eye check, sometimes writing fully by hand. Audience reading the published copy is real local customers (members, patients, day-pass guests), not other marketers.

What this skill IS:
- A pre-publish self-review tool for short-form copy (social posts, captions, emails, ad headlines, landing-page sections).
- A drift catcher for AI-drafted copy that has homogenised the brand fingerprint (semantic drift, 2026's biggest tone risk).
- A coordinate check: where does this draft sit on the brand's tone axes, vs where the brand actually lives.

What this skill is NOT:
- A brand voice audit across months of content (that is the quarterly cadence in [[Voice Drift Sweep]] territory, separate skill).
- A copy-editing or proofreading pass (use [[Proofread]] for that).
- A green light for stub voice files (skill always flags stub and offers best-guess mode).
- An enterprise governance tool (no scoring databases, no cross-channel KPIs, just a verdict-with-edits per draft).

This is a one-piece-of-copy check that takes about 60 seconds and returns a verdict plus specific edits.

---

## Context

*Load these files before running this skill:*

- The relevant brand voice file ([[Brand Voices/Fade Golf voice]] / [[Stride voice]] / [[Fire & Earth voice]])
- The relevant brand Brain file (for cross-reference if the draft mentions specific services or campaigns)
- The Master Marketing Document positioning notes (if relevant and accessible)

---

## Quick Start

Maddie says:
- "tone check this: [draft]"
- "/tone-check [draft] for Stride"
- "does this match the Stride voice"
- "is this on brand for Fade Golf"

The draft can be pasted inline, or referenced (e.g. "the Run Club post I just drafted in the campaign file").

---

## /goal integration

Set at start:

```
/goal output returns one of three verdicts (pass / drift / fail), cites which sections of the voice file the verdict references, provides specific edits where drift or fail is identified, voice-stub status flagged if applicable. Stop after 3 turns if not met.
```

---

## Process

### 1. Confirm brand (with normalisation)

If Maddie did not name the brand, ask: "Which brand voice? Fade Golf, Stride, or Fire & Earth?"

Normalise the input to one of the canonical filenames before looking up the voice file:

| Maddie says | Canonical file |
|---|---|
| `stride`, `stride clinics` | `Stride voice.md` |
| `fade golf`, `golf`, `fade` | `Fade Golf voice.md` |
| `fire & earth`, `fire and earth`, `f&e`, `f and e`, `fire earth`, `leamington` | `Fire & Earth voice.md` |

If Maddie's input does not map to any of the three brands (typo, unrelated brand, non-Fade Group entity): ask back with the three options. Do NOT proceed with a guessed brand.

### 2. Load the voice file

Check `Brain/Brand Voices/[Canonical Brand] voice.md`. Three branches: file missing (stop, surface), file is a stub (return stub-warning with two options A/B), file is locked (continue to Step 3, log Verdict mode = confident).

Full branch logic (status detection command, stop messages, Option B best-guess constraints, BEST-GUESS banner, OS Health logging): see [[stub-voice-handling]].

### 3. Read the draft and capture context

If pasted inline, use it directly. If referenced ("the Run Club post in the campaign file"), open the campaign file and find the copy.

If the reference is ambiguous: ask for clarification. Do not guess.

**Capture context flex inputs.** Same brand voice flexes by situation (Mailchimp content style guide principle). Ask Maddie if not already specified:

- **Channel:** Instagram caption / TikTok caption / Facebook post / Email / Ad headline / Landing page / Patient or member reply
- **Audience moment:** Cold (first touch, awareness) / Warm (already in community, retention) / Booked / Post-purchase / Comms after a complaint
- **Origin:** Wrote by hand / Started with AI draft and edited / Pasted straight from AI

Why this matters:
- A Stride clinical-info post sits closer to Serious / Matter-of-fact than a Stride Run Club community post.
- An Instagram caption tolerates more enthusiasm than an email to a patient about a treatment plan.
- AI-origin drafts get a mandatory semantic-drift check in Step 4.6 (the brand fingerprint risk).

If Maddie skips context, default to: Channel = Instagram caption, Audience = Warm, Origin = wrote by hand. Note the defaults in output so Maddie can correct if wrong.

### 4. Run the tone check (5 dimensions)

Compare the draft against the voice file across 5 dimensions:

**4.1 Tone match**
- Voice file Tone section vs draft overall feel
- Does the draft sound like the brand's documented tone?

**4.2 Vocabulary (Use list)**
- Voice file Vocabulary > Use list
- Does the draft use language consistent with the brand's preferred words?

**4.3 Vocabulary (Avoid list)**
- Voice file Vocabulary > Avoid list
- Does the draft use words the brand should avoid?

**4.4 Sentence rhythm**
- Voice file Sentence Rhythm examples
- Is the rhythm of the draft consistent with brand examples?

**4.5 Drift against bad examples**
- Voice file Bad Examples (drift catchers)
- Does the draft echo any of the documented drift patterns?

**4.6 Four-axis coordinate check (Nielsen Norman methodology)**

Infer the brand's voice position on the four NN/G dimensions (Humor, Formality, Respectfulness, Enthusiasm, each 0 to 10) from the voice file's Tone and Reference Posts sections. Score the draft on the same four axes. Compare. Surface any axis that has drifted more than 2 points.

Brand positions, context-flex notes per brand, and Pass / Drift / Fail thresholds: see [[fade-group-brand-voice-coordinates]]. Apply the context flex from Step 3 to the brand position before scoring.

**4.7 Semantic-drift check (AI-origin drafts only)**

If Origin in Step 3 was "Pasted straight from AI" or "Started with AI draft": read the draft for brand fingerprint markers AND AI-homogenisation tells. Verdict: brand fingerprint present (Pass), thin (Drift), absent (Fail). Hand-written drafts skip this check.

Full marker list and homogenisation tell catalogue: see [[ai-voice-homogenisation-tells]].

### 5. Pattern-match against reference posts

Voice file's Reference Posts section is the strongest anchor. Compare the draft against each reference post on:
- Opening hook style
- Sentence length distribution
- CTA style
- Use of personal language ("we", "you", "I")

### 6. Determine verdict

Rolls up Step 4 (5 dimensions + 4-axis coordinate + optional AI semantic drift) and Step 5 (reference post pattern match).

**Pass:** draft aligns with all 5 dimensions, sits within 2 points on all 4 NN/G axes, pattern-matches a reference post within tolerance, brand fingerprint present (if AI-origin).

**Drift (mid):** 1 to 2 dimensions are off, OR one NN/G axis 2 to 4 points off, OR brand fingerprint thin on an AI-origin draft. Recoverable with specific edits.

**Fail:** 3+ dimensions are off, OR any NN/G axis 5+ points off, OR a clinical-info Stride post scoring above 7 enthusiasm, OR an Avoid-list word in a load-bearing position, OR reads like generic AI output with no brand voice. Needs rewrite, not edits.

Verdict trumping rule: a single 5+ point NN/G axis miss is always a Fail even if everything else passes (it means the draft is in the wrong brand-space entirely).

### 7. Output

Full output template is in [[tone-check-output-template]] (loaded when the skill runs). The template covers: header block (Source / Voice file / Channel-Audience-Origin / Verdict), Why this verdict, NN/G axis coordinate table, per-dimension scoring table including the AI-origin Brand fingerprint row, Reference post comparison, Specific edits (Drift / Fail only), and Next steps. Best-guess mode prepends a banner above the template.

### 8. Log to OS Health (metadata only)

```markdown
### YYYY-MM-DD HH:MM, Tone Check

**Brand:** [brand]
**Verdict:** pass / drift / fail
**Verdict mode:** confident / best-guess
**Voice file status:** locked / stub
**Source type:** inline draft / referenced file
**Origin:** hand-written / AI-edited / AI-pasted
**Channel:** [from Step 3]
**Worst-axis miss:** [name + delta if Drift or Fail, otherwise "none"]
```

(Do NOT log the draft content. Privacy boundary.)

**Trend signal:** if `best-guess` count exceeds confident-count for the same brand over 2 weeks, Tom should be flagged via Admin Report. Indicates the brand voice still is not locked and Maddie is shipping copy unsupervised. Aggregation happens Tom-side, not in this skill.

---

## Worked examples

Three worked examples (Pass on Stride hand-written, Drift on Stride shouting-style, Stub flag on Fade Golf) are in [[tone-check-worked-examples]].

---

## Rules

- If voice file is stub, NEVER produce a confident verdict. Flag the stub and offer two options.
- Best-guess mode (Option B) must always show the banner at the top of the output and log `Verdict mode: best-guess` to OS Health. Maddie must never read a best-guess verdict that looks identical to a locked-voice verdict.
- Brand name normalisation always happens before file lookup. Never proceed with a guessed brand.
- Always cite which voice-file sections drove the verdict.
- Edits are SPECIFIC ("replace X with Y") not generic ("make it warmer").
- Maximum 5 edits in any single tone check. If more needed, the verdict is Fail and the draft needs rewriting.
- Pass verdict requires all 5 dimensions, NN/G 4-axis coordinate within 2 points on every axis, plus reference-post pattern match. Be strict.
- Context flex must be applied to the brand's NN/G coordinates before scoring. A clinical-info Stride post is scored against shifted axes, not the base brand position.
- If voice file is locked but Reference Posts section is empty (incomplete lock), Pass is downgraded to "Provisional Pass" with a one-line note. Reason: cannot pattern-match without anchors. Treat as a partial lock rather than a stub.
- AI-origin drafts always get the semantic-drift check in 4.7. Hand-written drafts skip it.
- A single 5+ point NN/G axis miss is always a Fail, regardless of other verdicts. The draft is in the wrong brand-space.
- Clinical-info Stride posts scoring above 7 on the Enthusiasm axis are always a Fail (clinical truth voice does not shout).
- Metadata only to OS Health. NEVER the draft.
- No em or en dashes in output.

---

## Anti-patterns

- Giving a Pass on a stub voice (false confidence).
- Generic edits ("make it more on brand").
- Re-writing the draft instead of suggesting edits (only do this on Fail).
- Citing "best practice" instead of the specific voice file.
- Logging draft content to OS Health.
- Skipping context flex (judging a Run Club post against base Stride coordinates).
- Passing an AI-origin draft without running the semantic-drift check (4.7), even if the 5 voice-file dimensions all pass. Brand fingerprint loss is the 2026 risk.
- Forcing a Pass when an NN/G axis is 5+ points off because the voice file dimensions pass. The 4-axis coordinate is the trumping signal.
- Editing the brand's documented coordinates because a draft looks fine to your eye. The voice file is the anchor; if it is wrong, raise it at the next quarterly voice review, do not silently shift it during a tone check.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-19 | Skill created. 5-dimension scoring, reference-post pattern match, stub detection with two-option fallback, 3 worked examples (pass, drift, stub flag), specific-edit output format. |
| 2026-05-20 | **Skill testing surfaced 4 robustness gaps that would either silently fail or produce false-confident verdicts on the stub voices.** Edits applied: (1) Option B (best-guess on stub) is now fully defined: compare against placeholder content + brand Brain file + general voice anti-patterns, downgrade verdicts one tier for caution, show a "BEST-GUESS CHECK" banner at the top of the output. Previously Option B was offered but had no defined behaviour. (2) Brand name normalisation table added to Step 1 so "fire and earth" / "f&e" / "leamington" all resolve to the canonical "Fire & Earth voice.md" file. (3) Voice-file-missing handling added to Step 2 so a non-existent voice file does not silently fail. (4) OS Health log now includes "Verdict mode: confident / best-guess" so Tom can distinguish locked verdicts from stub-fallback verdicts in the admin log. (5) Rules section now covers all three edits plus a new clause for "locked but Reference Posts empty" treated as Provisional Pass. Tested as Maddie, Wed 20 May, on this build folder. |
| 2026-05-20 | **P3 research-first retrofit** per [[Continue - Research-First Skill Retrofits]]. Sources: Nielsen Norman Group "The Impact of Tone of Voice on Users' Brand Perception" (nngroup.com/articles/tone-voice-users), NN/G "Four Dimensions of Tone of Voice in UX Writing" (nngroup.com/videos/tone-of-voice-dimensions), Mailchimp Content Style Guide (Voice and Tone, styleguide.mailchimp.com), InfluenceFlow 2026 Brand Voice Guidelines Complete Guide, Bigeye Ultimate Brand Voice Frameworks Guide, Atom Writer How to Measure Brand Voice Consistency 2026 (KPIs scoring automated frameworks), Inkbot Design 7-Step Brand Audit for SMBs 2026, Sprinklr Brand Voice Strategy guide, Mavik Labs Brand Voice for AI Products 2026 (Consistency Without Being Robotic), Situational Dynamics AI Brand Voice Guidelines How to Prevent Tone Drift in 2026, Magid on Voice Drift in the AI era, Yotpo AI Audit Checklist (Validate Content and Brand Voice), Pitch tone of voice template, Elite Asia 2026 Brand Tone of Voice Examples Guide. **Anchored on Maddie's context** (solo marketer reviewing her own copy before publishing across three small UK local brands, audience is real customers not other marketers). Added What's Appropriate Here block (what skill IS and IS NOT, explicitly NOT enterprise governance / brand audit / proofreading). **Methodology baseline upgraded** to NN/G 4 dimensions (Humor / Formality / Respectfulness / Enthusiasm, each 0-10) layered on top of existing 5 voice-file dimensions. New Step 3 captures Channel + Audience moment + Origin (hand / AI-edited / AI-pasted) to enable context flex. New Step 4.6 4-axis coordinate check with inferred brand positions for all three brands + context-flex notes (clinical-info posts vs Run Club, member-experience vs booking-friction, etc). New Step 4.7 semantic-drift check mandatory for AI-origin drafts (brand fingerprint markers vs AI-homogenisation tells: balanced lists of three, "elevate your X", uniform sentence length). Step 6 verdict logic now rolls up 5 dims + 4 axes + semantic drift + reference-post match, with a single 5+ axis miss as automatic Fail and clinical-info-Stride-above-7-enthusiasm as automatic Fail. Output template gained NN/G coordinate table, AI-origin fingerprint row in dimension scoring, Channel/Audience/Origin header line. OS Health log gained Origin, Channel, Worst-axis-miss fields. Rules expanded with context-flex-mandatory, AI-origin-must-run-4.7, axis-trumping rule, clinical-Stride enthusiasm cap, no-silent-coordinate-shift rule. Anti-patterns expanded with skipping context flex, passing AI-origin without 4.7, forcing Pass despite 5+ axis miss, silently editing brand coordinates mid-check. Stress-tested mentally against three real Maddie scenarios: (a) hand-written Stride clinical post (existing Example 1 still passes cleanly, coordinate ~(7,6,9,4), pattern match holds); (b) AI-pasted Fade Golf member post (correctly catches "elevate your X" homogenisation marker and demands fingerprint edits); (c) over-enthusiastic Stride clinical post (existing Example 2 now also auto-fails on 4.6 enthusiasm axis even without the avoid-list shouting, which is stronger). British English verified. No em / en dashes per CLAUDE.md. Skill grew from ~310 to ~410 lines, single file. |
| 2026-05-21 | **Guide extraction pass.** Skill at 406 lines after the research-first retrofit, too heavy. Extracted four reference blocks to `Tone Check/guides/`: (1) the NN/G four-axis brand coordinates table with per-brand context-flex notes and Pass/Drift/Fail thresholds to [[fade-group-brand-voice-coordinates]]; (2) the AI-homogenisation tell catalogue (Step 4.7 detail) to [[ai-voice-homogenisation-tells]]; (3) the full output template (header block, coordinate table, dimension table, edits format) to [[tone-check-output-template]]; (4) the three worked examples (Pass, Drift, Stub flag) to [[tone-check-worked-examples]]; (5) the Step 2 stub-voice handling detail (status detection command, stub-warning text, Option B best-guess constraints, banner) to [[stub-voice-handling]]. Skill body now links to each rather than embedding. No content lost. Skill body now 238 lines (workflow shell + rules + anti-patterns + changelog), guides total 282 lines across 5 files. |
