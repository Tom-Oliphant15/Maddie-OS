# Guide: AI Voice Homogenisation Tells

Catalogue of markers that suggest AI-drafted copy has lost brand fingerprint and homogenised into generic AI voice. Used by [[Tone Check]] in Step 4.7 (semantic-drift check, AI-origin drafts only). Extracted from the skill file 2026-05-21 to keep the skill lean. The 2026 brand fingerprint risk: AI drafts can pass voice-file dimensions but read as generic AI output.

---

## When to apply this check

Run this check only when Origin in Step 3 was "Pasted straight from AI" or "Started with AI draft and edited". Hand-written drafts skip this check.

---

## Brand fingerprint markers to look FOR

Pulled from the relevant voice file. Examples of what counts:

- Specific phrasing patterns the brand uses
- Signature openings (how the brand starts posts)
- Signature sign-offs (how the brand closes)
- In-jokes or repeated references
- Local references (Leamington landmarks, golf clubs, clinic location specifics)

---

## AI-homogenisation tells to flag

Patterns that indicate the draft has drifted into generic AI voice:

- Balanced lists of three (uniform parallel structure across three items)
- "Elevate your X" phrasing
- "In today's fast-paced world" openings
- "Are you struggling with X? You're not alone" framing
- Uniform sentence length (no rhythm variation)
- Em dashes (also a hard CLAUDE.md rule, double offence)
- Overly tidy syllogisms (premise, premise, conclusion in three sentences)
- Generic CTAs ("Click here to learn more", "Discover more")
- Vague benefit claims without specifics ("transform your experience", "unlock potential")
- Symmetrical paragraph lengths

---

## Verdict on this axis

- **Pass:** brand fingerprint clearly present, few or no AI tells
- **Drift:** brand fingerprint thin, some AI tells appear
- **Fail:** reads like generic AI output with no brand voice
