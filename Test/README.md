# Test

Synthetic fixtures and scenario specs used by the [[Diagnostics]] skill (Stage 2: Logic Tests).

## What is here

| Folder | Purpose |
|---|---|
| `fixtures/` | Sample data (fake emails, Slack messages, calendar, Metricool stats). Used as INPUT to skills under test. Hand-crafted to cover known patterns: strong/weak briefs, multi-idea voice notes, cross-brand source posts, etc. |
| `scenarios/` | One markdown file per skill. Specifies which fixtures to feed in, what the expected output shape is, and what assertions to check. |
| `expected/` | Assertion patterns per scenario. Used by Diagnostics to verify the output matches the shape without requiring exact-text matches (LLM output varies). |

## When this runs

- Stage 2 of every Diagnostics run (weekly by default, on-demand when called)
- Manually when Tom is changing a skill and wants to regression-test

## Why this folder is committed to git

Tom in Australia can update fixtures and assertions to cover new edge cases as they surface. Maddie's next Diagnostics run on her Mac pulls those changes and tests against them.

## What does NOT go here

- Real client data, real emails, real Slack messages
- Anything containing actual personal information
- Anything resembling real campaign assets

All fixtures are SYNTHETIC. Use realistic-feeling but obviously-fake data ("Stride patient Jane Smith, podiatry consultation") rather than scraped real content.

## How to add a new test

1. Identify the skill and the case it covers (e.g. Campaign Brief Expander with a deliberately weak audience input)
2. Drop the input fixture in `fixtures/`
3. Add a scenario spec in `scenarios/[skill name].md` referencing the fixture
4. Add the expected-shape assertions in `expected/[skill name].md`
5. Run Diagnostics to confirm the new test fires and the skill passes it

---

## Status

Skeleton only at time of scaffolding (2026-05-18). Fixtures + scenarios + expected patterns to be filled in during the build week:

- Daily Briefing tests: Tue 20 May
- Voice Notes tests: Thu 22 May
- Campaign Brief Expander tests: Thu 22 May
- Cross-Platform Repurposer tests: Fri 23 May
- Data Pull tests: Wed 21 May (after Metricool MCP wired)
- Session End tests: Fri 23 May
- Install tests: covered by Install skill itself, no synthetic fixtures needed
- Diagnostics tests: meta, runs against itself with fixture failures injected
- Learning tests: Fri 23 May
