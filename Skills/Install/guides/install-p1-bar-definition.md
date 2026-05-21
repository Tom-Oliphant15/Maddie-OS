# Install P1 Minimum-Bar Definition

The P1 bar is the minimum Brain content needed for skills to produce useful output, not generic. Measured at Step 13a of Install. Install completes either as `complete` (bar met) or `complete-with-onboarding-in-progress` (bar not met, install proceeded but Daily Briefing nags until cleared).

## P1 Bar Table

| File | Required sections | Bar |
|---|---|---|
| `Brain/Maddie.md` | All 9 sections (Role, Background, Working Style, Tech Comfort, What She Wants From The OS, Communication, Hardware, Ambitions, Risks to Manage) | Each section non-empty, no `(placeholder)` or `STATUS: Stub` markers |
| `Brain/Fade Group.md` | All 6 sections (Overview, Businesses In Scope / Out Of Scope, Key People, Working Cadence, Tech And Comms, Strategic Context) | Each section non-empty |
| `Brain/Businesses/Fade Golf.md` | Overview, Strategic Direction, Key People, Channels | Each section non-empty |
| `Brain/Businesses/Stride Clinics.md` | Overview, Strategic Direction, Key People, Channels | Each section non-empty |
| `Brain/Businesses/Fire & Earth Leamington.md` | Overview, Strategic Direction, Key People, Channels | Each section non-empty |
| `Brain/Brand Voices/Fade Golf voice.md` | Tone | 1 to 2 paragraphs describing the voice. Reference posts + bad examples are P2 (live-update after install). |
| `Brain/Brand Voices/Stride voice.md` | Tone | Same |
| `Brain/Brand Voices/Fire & Earth voice.md` | Tone | Same |
| `Brain/Brand Guidelines/Fade Golf guidelines.md` | Colour palette (primary + secondary minimum), Logo (where required) | Reference assets + full typography + imagery rules are P2. |
| `Brain/Brand Guidelines/Stride guidelines.md` | Colour palette, Logo (where required) | Same |
| `Brain/Brand Guidelines/Fire & Earth guidelines.md` | Colour palette, Logo (where required) | Same |
| `Brain/Tech Stack.md` | All MCPs/CLIs with current status | No items in "unknown" state |

## Measurement

```bash
# Pseudocode pattern; actual implementation reads each file, checks the listed sections, returns a JSON array of unmet items.
P1_REMAINING=$(claude --measure-p1-bar)
echo "$P1_REMAINING" | jq .
```

Each unmet item is recorded as:
```json
{"file": "Brain/Brand Voices/Stride voice.md", "section": "Tone", "reason": "still placeholder text"}
```

Write the array to `.install-state.json` under `onboarding_p1_bar.p1_remaining`. If the array is empty, set `onboarding_p1_bar.status` to `pass`. If non-empty, set status to `complete-with-onboarding-in-progress` (NOT `fail`, install proceeded, just incomplete).
