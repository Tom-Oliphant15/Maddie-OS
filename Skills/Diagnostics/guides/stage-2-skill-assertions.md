# Stage 2 Skill Logic Assertions

Per-skill assertion checks for Stage 2 of [[Diagnostics]]. Each block defines the shape assertions that the skill's output must satisfy when run against the synthetic fixtures in `Test/fixtures/`.

For each skill, run the scenario from `Test/scenarios/[skill name].md` against the fixtures in `Test/fixtures/`. Check output against the shape assertions below.

**Pre-check (before every skill below):** if any of the three files (scenario, fixture, expected) does not exist for this skill, mark the test `deferred` with reason "fixtures not yet authored" and skip. Do NOT count as L3 failure. Fixtures are authored on a schedule (see `Test/README.md` for the calendar); missing fixtures during the build window is the expected state, not a fault. Aggregate the deferred count in Stage 7's OS Health entry separately from pass/fail counts.

---

## 2.1 Daily Briefing
- Output written to `Reviews/Daily/YYYY-MM-DD.md`
- File contains all 7 sections in order
- Top 3 contains exactly 3 items (or push-back recorded if fewer)
- Weekly checklist table has 3 rows (Fade Golf, Stride, F&E)
- No em or en dashes in output
- State files were read (`.last-diagnostics-run`, `.last-learning-run`)

## 2.2 Voice Notes (when fixtures exist)
- Correctly routes by brand
- No duplicates added to existing files
- Source Otter ID logged

## 2.3 Campaign Brief Expander
- Output saved to `Information/Campaigns/`
- Output has audience section populated (or option B push-back recorded)
- Per-platform table has 4+ rows
- Risks section has at least 2 entries
- If voice stub, warning banner present at top
- Tasks.md has one new row per planned post

## 2.4 Cross-Platform Repurposer (when wired)
- Per-platform output sections distinct (no identical opening lines)
- Voice match verified
- Output saved to expected path

## 2.5 Data Pull (when wired)
- Output table has all requested metrics
- Period clearly stated
- Source attribution per column
- Tag-fix dependency flagged for Stride if relevant

## 2.6 Session End
- Status.md last-updated bumped to today
- Tasks.md has changes if any tasks completed in conversation
- Daily log has session block appended
- OS Health metadata-only line appended
- git push exit code recorded (success / handled L4)

## 2.7 Install (run only as part of install, not every Diagnostics)
- State file exists and is valid JSON
- All steps have either `pass` or `deferred-with-reason`

## 2.8 Learning (run only as part of Learning fire, not every Diagnostics)
- Brain files updated match the questions asked
- Deferred items have reasons logged
- OS Health entry written

## 2.9 Audience Persona Builder
- Output saved to `Brain/Audiences/[Brand]/[Service].md`
- Required sections populated or marked deferred
- Brain Directory updated to include new file

## 2.10 Tone Check
- Returns pass / drift / specific edits
- Cites the voice file used
- No false-positive on stub voice files (flags voice is stub instead)

## 2.11 Filming Brief Generator
- Output has shotlist, sequence, talking points, B-roll, sound notes, post-production notes
- Talent name(s) included
- Brand context applied

## 2.12 Talent/Ambassador Brief
- 1-page output, copy-pasteable to send
- Plain English (no marketing jargon)
- Example caption included
- Hashtag direction given

## 2.13 Meeting Prep Brief
- Output saved to `Information/Briefing Packs/[YYYY-MM-DD] [Meeting].md`
- Last-discussed section populated
- Open actions table present
- Suggested agenda with timings

## 2.14 Weekly Slack Report Draft
- Slack-formatted markdown (bold, bullet conventions match Slack rendering)
- Pulls from Data Pull output
- Within ~300 words

## 2.15 Google Ads Variation Generator
- 10 headlines, each <30 chars
- 4 descriptions, each <90 chars
- Output table sortable / scannable

## 2.16 Google Ads Keyword Builder
- Keyword list with intent grouping
- Negative keyword list separate
- Match type recommended per keyword

## 2.17 Landing Page Brief
- Brief includes headline, sub-head, sections, CTA, trust signals
- Per-service framing applied

## 2.18 Monthly Report Draft
- Numbers pulled from Data Pull (if available)
- Per-brand sections
- Tom + Harry oriented (not Slack-formatted, longer-form)
