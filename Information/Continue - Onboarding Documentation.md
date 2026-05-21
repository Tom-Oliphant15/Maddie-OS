# Continue: Maddie OS Onboarding Documentation

**Started:** 2026-05-21
**Project:** Maddie OS, Phase 2 in-person build window
**Status:** Decision made on artifacts and format. No build work started yet.

---

## Where We Are, Exact State

The Maddie OS prototype is built and tested (21 of 24 skills cold-tested as Maddie, P1 + P2 + Audience Persona Builder + Proofread standalone all complete). GitHub repo is live ([Tom-Oliphant15/Maddie-OS](https://github.com/Tom-Oliphant15/Maddie-OS), private, mirrored). Maddie's Brain bootstrap form was sent to her this afternoon (close-of-play deadline), Friday is the in-person handover.

The gap that drove this work: Maddie is junior and not technical. After Tom hands over Friday and flies home, she needs onboarding materials so she actually uses the OS rather than defaulting to familiar tools.

## Decision Made

**Build three artifacts. Skip two.**

| # | Artifact | Format | Status |
|---|---|---|---|
| 1 | Cheat sheet of phrases and skills | Printable one-page .docx, then PDF | **Build first (60 min).** Tape to monitor. |
| 2 | Teach mode skill | New skill: `/help` or `/explain`, interactive inside the OS | **Build second (90 min).** Reads Brain + skill files, answers questions, suggests live demos. Long-form content lives here. |
| 3 | First-week onboarding path | One-page printable checklist .docx | **Build third (30 min).** Mon-to-Fri "do these things in your first week" structure. |
| ~~4~~ | ~~PowerPoint walk-through deck~~ | n/a | **Rejected.** Dead after Friday. |
| ~~5~~ | ~~Long-form Word doc overview~~ | n/a | **Rejected.** Lives outside the OS, rots when OS evolves, she'll forget it exists by week 2. |

Escalation / troubleshooting guidance folds INTO the teach skill, does not need its own file.

## Why These Choices

- **Teach skill** is the right home for long-form content because it lives inside the OS, stays in sync with the actual skill files automatically, and lets Maddie ask follow-up questions in context (vs reading a static doc once and forgetting).
- **Cheat sheet** is printable because the daily quick-glance use case is the one a screen-based reference loses to. Tape it to her monitor.
- **First-week onboarding path** stops Maddie staring at the OS thinking "now what?" on Monday morning after Tom flies home. Without it, she'll defer to familiar tools and the OS gets used 30% of what it could.
- **Junior, agree-not-push-back disposition.** Per her Brain. Without an explicit "when X happens, ping Tom in Slack" path inside the teach skill, she'll quietly work around problems and Tom never finds out the OS has a gap.

## Existing Scaffolding to Lean On

- [[How Your OS Works]] Brain file: conceptual overview already exists. Worth reviewing for completeness before the teach skill leans on it.
- [[Brain Directory]]: indexes all Brain files and all skills with one-line descriptions. The teach skill reads this.
- [[Instructions]]: Identity Locks layer + Live Brain Update rule, the "how to change behaviour" surface.
- Per-skill `## Quick Start` sections: most skills already have plain-English triggers. Cheat sheet pulls from these.

## Constraints / Rules

- **British English** throughout. CLAUDE.md paste-safe rule.
- **No em / en dashes** anywhere. Use commas, periods, "to" for ranges.
- **Don't over-document.** Maddie is junior and will skim. One printable page she taps daily is worth ten she reads once.
- **Bias teach skill toward DOING, not READING.** Good: "Want to try the Daily Briefing? Say 'morning' and I'll show you live." Bad: "The Daily Briefing skill consists of 7 numbered steps..."
- **No emojis** unless Tom asks.

## Next Step (When Resuming)

**Start with the cheat sheet.** Build the .docx, present for Tom's review, generate PDF when approved.

Suggested cheat sheet structure (subject to challenge):

1. **Greeting and morning** ("morning", "hey", "let's start", auto-fires Daily Briefing)
2. **Working on a specific brand** ("Fade Golf marketing", "switch to Stride")
3. **Drafting content** (Campaign Brief Expander, Filming Brief, Talent Brief, Landing Page Brief, Cross-Platform Repurposer)
4. **Quality gates** (Pre-publish Check, Visual Brand Check, Tone Check, Proofread)
5. **Paid media** (Google Ads Variation Generator, Keyword Builder)
6. **Reporting** (Weekly Slack Report Draft, Monthly Report Draft, Data Pull)
7. **Meetings** (Meeting Prep Brief, Check My Meetings, Voice Notes)
8. **End of day** ("done for today", "see you tomorrow", auto-fires Session End)
9. **Asking it to fix itself** (Diagnostics, "/diagnostics", or just describe the problem and let it route)
10. **Asking Tom for help** (escalation phrase + the Slack channel to use)

Then move to the teach skill. Teach skill design notes:
- Trigger: `/help`, `/explain`, or natural-language ("how does X work?", "what's the skill for Y?")
- Modes: overview (the OS in one breath), drill-down (specific skill or concept), troubleshoot ("something's off, walk me through it"), escalate ("I need Tom")
- Reads the actual skill files for canonical answers, never duplicates info
- Suggests live demos, not just descriptions

Then the first-week checklist. Five-day structure, one task per day max, builds confidence.

## How to Resume in a Fresh Session

In a fresh Claude Code session, Tom says one of:

- "continue Maddie onboarding docs"
- "pick up where we left off on Maddie onboarding"
- "resume Continue - Onboarding Documentation"

The fresh instance:
1. Reads this file in full
2. Reads [[Brain Directory]] for Maddie OS context
3. Starts with the cheat sheet build (Step 1 of the artifact list above) unless Tom redirects
4. Applies all rules from Constraints / Rules section
5. Shows draft for Tom's review before saving final
6. Moves to teach skill only after cheat sheet is locked

## Files in Scope

- `/Users/tom_oliphant/Documents/Tom OS/Businesses/AI Business/Projects/Maddie - Fade Group/Assets/` (cheat sheet + first-week checklist .docx will land here)
- `/Users/tom_oliphant/Documents/Tom OS/Businesses/AI Business/Projects/Maddie - Fade Group/Skills/` (teach skill will land here)
- Existing Brain files referenced by the teach skill (no edits planned, just reads)

## Per CLAUDE.md Continuation Rules

Delete this file when all three artifacts are built AND Maddie has had the Friday handover. Continuation notes are temporary; the work is captured in the artifacts themselves (cheat sheet PDF, teach skill file, first-week checklist PDF) plus the Maddie OS project Status / Tasks files.

---

*Parked 2026-05-21 by Tom mid-session, context window growing, work to continue in a fresh session.*
