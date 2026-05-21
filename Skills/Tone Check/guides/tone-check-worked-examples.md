# Guide: Tone Check Worked Examples

Three worked examples (Pass, Drift, Stub flag) demonstrating [[Tone Check]] in use. Extracted from the skill file 2026-05-21 to keep the skill lean. Each example shows the Maddie prompt and the skill's response.

---

## Example 1, Pass

```
Maddie: tone check this for Stride: "Ingrown toenail pain wears you down faster than people realise. Most patients have tried a few things at home first. We get it. Our nail surgery is quick, local, and the results last. Book online or give us a call."

Skill:
**Verdict:** Pass

Why this verdict: Reassuring, plain English, acknowledges the patient's journey before pitching, CTA is direct without being aggressive. Matches Stride voice across all 5 dimensions.

Per-dimension: all pass.

Reference post comparison: closest match to Reference Post #2 ("most people try home remedies first") in the voice file. Similar structure, similar warmth.

Next steps: Ship it.
```

---

## Example 2, Drift

```
Maddie: tone check this for Stride: "Are you SICK of dealing with ingrown toenail pain?! At Stride Clinics, we have the SOLUTION you have been searching for! Book NOW for instant relief!"

Skill:
**Verdict:** Drift

Why this verdict: The shouting-style hook ("SICK", "SOLUTION", "NOW") echoes drift pattern #1 in the voice file (overly aggressive CTAs). The "instant relief" claim conflicts with clinical-truth tone. Rest of the message is OK in structure.

Per-dimension:
- Tone match: Drift (warmth lost in the shouting)
- Vocabulary (Use): Pass
- Vocabulary (Avoid): Drift (the all-caps "NOW" hits the avoid-list)
- Sentence rhythm: Drift (three exclamations in a row, voice file shows max 1)
- Drift against bad examples: Fail (clear echo of bad example #1)

Specific edits:
- Replace "Are you SICK of dealing with..." with "Tired of ingrown toenail pain..." or "Most people put up with it longer than they should..." Reason: voice file uses understatement in openings.
- Drop the all-caps. Stride voice never shouts.
- Replace "instant relief" with "fast, local nail surgery". Reason: clinical-truth voice avoids superlatives ("instant").
- Drop the exclamation mark from "Book NOW". Direct without aggression.

Next steps: Apply the 4 edits and re-run /tone-check.
```

---

## Example 3, Stub flag

```
Maddie: tone check this for Fade Golf: "Membership is more than just access to the simulators. It is the room you walk into and the people you walk in with."

Skill:
Voice file for Fade Golf is still a stub. I cannot run a real tone check until the Master Marketing Document work has locked the voice (target 28 May).

Two options:
A) Run /learning now to begin filling in the Fade Golf voice file (about 10 min)
B) Proceed with a best-guess check, clearly marked as not-locked

(Aside: that draft feels strong on its face, but I should not give it a confident verdict without the voice file locked.)

What do you want to do?
```
