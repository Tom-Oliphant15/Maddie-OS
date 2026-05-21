# Guide: Stub Voice Handling

How [[Tone Check]] handles voice files that are stubs or missing. Used in Step 2. Extracted from the skill file 2026-05-21 to keep the skill lean.

---

## Detecting status

Verify the voice file exists and check its status:

```bash
VOICE_FILE="Brain/Brand Voices/[Canonical Brand] voice.md"
[ -f "$VOICE_FILE" ] || { echo "voice-file-missing"; exit 1; }
grep -i "STATUS: Stub" "$VOICE_FILE"
```

---

## If file missing

Stop. Surface to Maddie:

> I cannot find the voice file at `$VOICE_FILE`. Brand Voices folder may not be set up yet. Run /install or /learning to lay it down.

---

## If voice file is a stub (pre-28 May lock or marked deliberate-stub)

Stop and return a stub-warning rather than a fake-confident verdict:

```
Voice file for [Brand] is still a stub. I cannot run a real tone check until the Master Marketing Document work has locked the voice (target 28 May).

Two options:
A) Run /learning now to begin filling in the [Brand] voice file (about 10 min)
B) Proceed with a best-guess check, clearly marked as not-locked
```

---

## If Maddie picks Option B (best-guess on stub voice)

Run the 5-dimension check anyway but with these constraints:

- Compare against any placeholder content the stub does contain (e.g. "clinical and warm" in the Stride stub Tone section, or the per-service notes).
- Cross-reference the relevant brand Brain file ([[Stride Clinics]], [[Fade Golf]], [[Fire & Earth Leamington]]) for tone signals.
- For drift catchers, fall back to general voice anti-patterns: shouting (all-caps, multiple exclamations), aggressive CTAs ("BOOK NOW"), superlatives without evidence ("instant", "best ever"), corporate jargon out of register.
- Set every verdict in Step 6 one tier more cautious than a locked check would (a borderline Pass becomes Drift, a borderline Drift becomes Fail). Reason: low confidence without a locked voice.
- Add a banner at the top of the output:

```
BEST-GUESS CHECK. Voice file is a stub. Treat these edits as direction, not law.
```

- Set "Verdict mode" to `best-guess` in the OS Health log (Step 8).

---

## If voice file is locked

Continue with Step 3 of the skill. Set "Verdict mode" to `confident` for the OS Health log.
