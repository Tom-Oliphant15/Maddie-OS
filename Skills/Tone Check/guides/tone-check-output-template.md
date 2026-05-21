# Guide: Tone Check Output Template

Full output format used by [[Tone Check]] in Step 7. Loaded when the skill runs. Extracted from the skill file 2026-05-21 to keep the skill lean.

---

```markdown
# Tone Check, [Brand], YYYY-MM-DD HH:MM

**Source:** [paste of first 50 chars of draft, or reference]
**Voice file consulted:** Brain/Brand Voices/[Brand] voice.md
**Channel / Audience / Origin:** [Instagram / Warm / AI-edited]  (default flagged if Maddie did not specify)
**Verdict:** Pass / Drift / Fail

## Why this verdict

[2 to 4 sentences explaining the call, referencing specific voice-file sections AND the NN/G axis that drifted if applicable]

## NN/G axis coordinate

| Axis | Brand position (context-adjusted) | Draft position | Delta | Verdict |
|---|---|---|---|---|
| Humor (Funny 0 to Serious 10) | [N] | [N] | [+/-N] | Pass / Drift / Fail |
| Formality (Casual 0 to Formal 10) | [N] | [N] | [+/-N] | Pass / Drift / Fail |
| Respectfulness (Irreverent 0 to Respectful 10) | [N] | [N] | [+/-N] | Pass / Drift / Fail |
| Enthusiasm (Matter-of-fact 0 to Enthusiastic 10) | [N] | [N] | [+/-N] | Pass / Drift / Fail |

## Per-dimension scoring (voice-file checks)

| Dimension | Verdict | Note |
|---|---|---|
| Tone match | Pass / Drift / Fail | [if not pass, why] |
| Vocabulary (Use) | Pass / Drift / Fail | [if not pass, what is missing] |
| Vocabulary (Avoid) | Pass / Drift / Fail | [if not pass, which avoid-words appeared] |
| Sentence rhythm | Pass / Drift / Fail | [if not pass, rhythm signal] |
| Drift against bad examples | Pass / Drift / Fail | [if echoes a drift pattern, which one] |
| Brand fingerprint (AI-origin only) | Pass / Drift / Fail | [if thin or absent: which AI-homogenisation tells appeared] |

## Reference post comparison

[2 to 3 sentences: which reference post(s) the draft most resembles, and what is different]

## [If Drift or Fail] Specific edits

[List of 2 to 5 specific edits. Each edit shows the current phrase and the suggested replacement, with one-line reasoning.]

Example:
- Replace "**Book your treatment**" with "**Book your appointment**". Reason: Stride voice avoids "treatment" in CTAs, prefers "appointment" or "session" for warmth.
- Replace the opening "Are you tired of..." with "Most people..." or similar. Reason: voice file flags rhetorical questions in openings as a drift pattern (bad example #2).

## Next steps

- [If Pass] Ship it.
- [If Drift] Apply the 2 to 5 edits above, re-run /tone-check, ship if pass.
- [If Fail] Rewrite using one of the reference posts as a template. Re-run /tone-check on the rewrite.
```

---

## Notes for best-guess mode

If the voice file is a stub and Maddie chose Option B in Step 2, prepend this banner above the template:

```
BEST-GUESS CHECK. Voice file is a stub. Treat these edits as direction, not law.
```

And set every verdict one tier more cautious than a locked check would deliver.
