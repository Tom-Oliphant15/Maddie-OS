# Maddie OS — Status

*Last updated: 2026-05-21 (21 of 24 skills tested. P1 + P2 + Audience Persona Builder + Proofread standalone all complete. 67 skill edits applied across the day. 2 critical Install bugs caught (wrong MCP config file + Tom-side Path A deploy-key command path). Cross-skill install gap (Reviews + Information subfolders) closed centrally via new Install Step 13c. Persona chain end-to-end validated: Audience Persona Builder now unblocks the three-option fallback Option A across the 4 persona-dependent skills. Only 3 P3 stubs remain, all blocked on upstream software / MCP decisions, not on testing time: Voice Notes, Cross-Platform Repurposer, Data Pull.)*

---

## Overview

Personal OS for Maddie, marketing lead at Fade Group. Supports her work across Fade Golf, Stride Clinics, and Fire & Earth Leamington. Built during the Phase 2 in-person block (Mon 19 May to Wed 3 June 2026) with a prototype targeted for Fri 23 May.

**Mode:** Edit Mode during build. Switches to Complete Mode at handover.

**GitHub:** mirrored for remote management by Tom.

---

## Current Phase

**Phase 1 Prototype Build, Mon 19 to Fri 23 May 2026.** Effectively complete on 19 May, ahead of schedule. Now in testing + retrofit phase.

Target was: working OS by Fri 23 May with core skill loop running end to end. **Actual:** prototype built, 24 skills shipped, 2 tested, testing in progress.

---

## This Week's Priorities

| Priority | Owner | Status | Target |
|---|---|---|---|
| Prototype scaffold + skills build | Tom | **Done** | 19 May (ahead of schedule) |
| Visual Brand Check + Pre-publish Check tested | Tom | **Done** | 19 May |
| Campaign Brief Expander tested + upgraded (research-first) | Tom | **Done** | 19 May |
| Research-first discipline locked across all OSs | Tom | **Done** | 19 May |
| Continue - research-first retrofits (parallel work, separate chat) | Tom | In Progress | Ongoing |
| Continue - Maddie OS skill testing (resume in fresh chat) | Tom | In Progress | Ongoing |
| Daily-task audit with Maddie (in-person, when Tom + Maddie reconnect) | Tom + Maddie | Not Started | Per Phase 2 plan |
| Metricool OAuth (3 brands) when Maddie is in person | Tom + Maddie | Not Started | Per Phase 2 plan |
| Brand Voices + Brand Guidelines lock | Tom + Maddie | Not Started | Wed 28 May (Master Marketing Document work) |
| MacBook install + transfer to Maddie | Tom + Maddie | Not Started | End of in-person window |

---

## Active Brands

| Brand | Status | Current Marketing Focus |
|---|---|---|
| Fade Golf | Active | Luke sponsorship/ambassador pitch (Tom + Maddie + Harry, four-way Fri 23 May). Filming with Luke + Jason for swing/membership reels. |
| Stride Clinics | Active | Google tag/conversion tracking fix with Mark (this week). Per-service Google Ads restructure once tag is fixed. Orthotic relaunch July. Run Club content with Katie (filmed 13 May). |
| Fire & Earth Leamington | Active | Marketing canvas setup. Incentive scheme decision parked with Harry. |

---

## Open Actions

*Populated by Tasks.md and updated by skills + session-end protocol.*

| Action | Brand | Owner | Status | Deadline |
|---|---|---|---|---|
| Send WordPress admin login from Harry (Jetpack blocked Mark's invite) | Stride | Harry to Maddie | Blocked | This week |
| Read Metricool deep research drop (delivered 14 May), gut-check feedback | Cross | Maddie | To Do | This week |
| Confirm Fade Golf combined Jason + Luke meeting date | Fade Golf | Maddie | To Do | This week |
| Master marketing document draft (per-service positioning) | Cross | Maddie (lead) | In Progress | Wed 28 May |
| Slack-based weekly reporting template | Cross | Maddie | To Do | This week |
| Monthly performance report cadence locks | Cross | Maddie | To Do | From ~30 May |

---

## Recently Completed

| Item | Completed | Notes |
|---|---|---|
| Project scaffold | 2026-05-18 | Folder structure, 6 skills stubbed, Brain skeleton, OS Health log, Tom OS-side admin tier (Admin Report + fix-library) |
| Foundation trio fleshed | 2026-05-19 | Install (545 lines), Session End (289 lines), Daily Briefing (394 lines) |
| Tier 1 + Tier 2 skills shipped | 2026-05-19 | 13 additional skills (Audience Persona Builder, Tone Check, Filming Brief Generator, Talent/Ambassador Brief, Meeting Prep Brief, Weekly Slack Report, Monthly Report, 3 Google Ads cluster, Landing Page Brief, Diagnostics, Learning, Campaign Brief Expander) |
| Visual Quality cluster shipped | 2026-05-19 | Visual Brand Check + Pre-publish Check orchestrator + Proofread + 3 Brand Guidelines stubs |
| Visual Brand Check tested on real Stride leaflets | 2026-05-19 | 4 skill edits applied based on findings (Proofread asset-format modifier, soft observations pattern, multi-input cross-asset, consolidated Top 3) |
| Campaign Brief Expander tested + research-first upgraded | 2026-05-19 | First test produced generic output, full research pass on professional brief structure, rebuilt to 18 sections with worked example |
| Document Template skill shipped | 2026-05-19 | Capture/Apply/Convert for Word/PowerPoint/Excel/PDF |
| Social Trends Watch skill shipped | 2026-05-19 | Monthly auto-trigger via Daily Briefing state-file at >30 days |
| Research-first discipline locked across all OSs | 2026-05-19 | CLAUDE.md + Skill Creator + Maddie Instructions.md updated |
| Continuation notes created for parallel work | 2026-05-19 | Skill retrofits + skill testing both queued for fresh sessions |

---

## Brand Notes (Quick Reference)

For deeper context, load the relevant Brain file via [[Brain Directory]].

- **Fade Golf** — premium golf brand. Luke is the new face-of-Fade angle. Filming with Jason on the swing/membership side. AI-built website launched.
- **Stride Clinics** — clinical/health, multi-service (podiatry, sports massage, orthotics). Per-service Google Ads restructure incoming. Mark on the technical side (Google tag, WordPress).
- **Fire & Earth Leamington** — wellness/retreat-feel coworking. Linda runs operationally. Smaller marketing footprint than the other two.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-18 | OS scaffold created. Brain skeleton, six skill stubs, Instructions.md drafted. Pre-Mon 19 May build. |
| 2026-05-19 | Prototype fully built ahead of schedule. 24 skills shipped (21 fleshed + 3 stubs awaiting software decisions). 14 Brain files + 4 Brain folders. Tom OS-side admin tier in place. Visual Brand Check + Pre-publish Check tested on real Stride leaflets, 4 skill edits applied. Campaign Brief Expander tested, rebuilt with research-first pass to 18 professional sections. Document Template + Social Trends Watch skills added. Research-first discipline locked across all OSs (CLAUDE.md, Skill Creator, Instructions.md). Two continuation notes created to resume retrofits + testing in fresh sessions. |
| 2026-05-20 | Skill testing session: Daily Briefing (4 edits), Diagnostics (5 edits), Tone Check (5 edits). Cross-cutting theme: all three had blind spots for the install-window state (MCPs disconnected, fixtures not yet authored, voices still stubs); fixed with graceful degradation + recovery paths. Then structural change: Install gained a P1 minimum-bar gate at Step 13a — install no longer reports plain "complete" if the Brain is too sparse for skills to produce useful output; reports "complete-with-onboarding-in-progress" instead, and Daily Briefing nags the gap list every morning until cleared. Learning scoped to bootstrap + complete-reinstall only (no more monthly cadence). Live Brain Update rule added to Instructions.md so ongoing Brain changes happen on the job. Document Linking Convention added so changes to a canonical source propagate via transclusion to every doc that references it (Karpathy-style one-edit-flows-everywhere). |
| 2026-05-20 | Identity Locks layer added to Instructions.md. Identity-level Brain content (colour palette, typography, logo, voice Tone + Vocabulary Use/Avoid + Bad Examples, Strategic Direction, Key People, Maddie's Role/Scope, Fade Group in/out scope) is now drift-protected. Operational content (audiences, reference posts, campaigns, channels, tech stack) stays friction-free. Add-vs-replace nuance built in: adding to a locked list (e.g. new bad example) writes freely; replacing or removing fires the flag. Flag triggers only on direct contradiction with a current locked value OR explicit change language ("from now on", "going forward", "change the X"); creative exploration runs friction-free. Single binary question on flag (permanent / one-off), defaults to one-off if ambiguous. No follow-up chains. Expected real-world frequency: zero to two flags per week. |
| 2026-05-20 | Session End tested cold as Maddie (Wed 21 May simulation, 14:30 wrap-up, install-in-progress state, Slack ✓ Metricool ✗). 9 edits applied: install-state pre-check at Step 0, daily-log append now locates `## Sessions` header explicitly + Top 3 cross-reference algorithm (reads morning briefing, cross-refs Tasks.md changes, carries over un-Done items to Next), Brain Directory check now uses `git status --porcelain Brain/` (catches untracked new files the old A/D/R/M regex missed), OS Health line gained explicit goal-verification sub-step + defined duration anchor (morning briefing timestamp, falls back to "unknown" not a guess) + Step 1 named as skills-fired source, working-dir guidance changed from hardcoded `cd "$HOME/Documents/Maddie OS"` to read `install_path` from `.install-state.json`, L2 pull-rebase failure now triggers `git rebase --abort` before L4 escalation (was leaving repo mid-rebase), L4 Slack-ping gained Slack-MCP availability check (mirrors Daily Briefing 1d) with OS Health fallback + plain-English message to Maddie to message Tom directly, L4 Slack template gained Rebase status line, critical-persona "Task In Progress more than 5 days" rule rewritten as signal-based (still In Progress at start + still In Progress at end + untouched this session) because Tasks.md has no per-row timestamps; date-based check deferred to Weekly Review. Casual-session path tightened: no auto `git add -A`, prompts before staging unexpected changes. Triggers updated: "save and close" dropped (unnatural for Maddie), "see you tomorrow" and "ok done for today" added. |
| 2026-05-20 | Filming Brief Generator tested cold as Maddie (Luke ambassador swing reels, install-in-progress state, Fade Golf voice still Stub, no Audience Personas folder, no contacts file). 8 edits applied: `/goal` text updated to match the post-retrofit generative behaviour (skill now produces release `.docx` files, old goal said "release status flagged"), Stage 1 gained input #12 "people in frame beyond named talent" so incidental-capture is surfaced upfront not buried in Stage 9f, Stage 2 now offers three explicit paths when audience persona file is missing (run Audience Persona Builder inline / best-guess from brand Brain / Maddie supplies triggers verbatim) — was silently defaulting to generic Problem-beat language, Step 9b clarified there is no central contacts file (details come from Maddie inline unless a prior signed release exists), Step 9c LEGAL_ENTITY / PRIVACY_NOTICE_URL / WITHDRAWAL_CONTACT_EMAIL / BRAND_HANDLE caching now writes into a `## Release form facts` section in each brand's Brain file (was "ask Tom + cache" with no defined cache location), Step 9d split into `Information/Talent Releases/Drafts/` and `/Signed/` subfolders so a glance at the folder shows outstanding releases (follow-up task changed to "move from /Drafts/ to /Signed/"), Section 9 output table paths updated to /Drafts/, new Rules entry on PII / GitHub-sync boundary covering Article 9 health data for Stride patients + 30-day withdrawal requiring deletion from /Drafts/ AND /Signed/ AND git-history scrub (`git filter-repo` / BFG) + consent-before-storing-scanned-signatures, worked example updated to remove the phantom contacts file and demonstrate the persona-missing path. |
| 2026-05-20 | Talent/Ambassador Brief tested cold as Maddie (Luke paid-ambassador post for Fade Golf reel). **Critical UK ASA/CAP compliance bug fixed:** original template told paid ambassadors NOT to use #ad, recommended #partner instead with the comment "this is not a paid partnership in the regulated sense" — wrong under ASA rulings which treat ambassador retainers and gifted product over £100 as paid partnerships requiring clear disclosure (#ad / #paidpartnership / Instagram Paid Partnership label) and have explicitly ruled #sp / #spon / #collab / #partner inadequate. 6 edits applied: Step 0 release pre-check (refuse brief if no signed release in /Signed/ for paid/employee/patient; require Maddie confirmation for friend-of-brand); Step 1 input #3 commercial-relationship captured across four tiers and drives the Disclosure section logic; Step 1 input #8 talent voice reference (1-2 recent posts) optional but recommended — if absent, example caption is honestly labelled generic instead of fake "in-voice"; output template gained mandatory Disclosure section branching on relationship tier; `/goal` text now requires 7 sections + Disclosure correctness check + release-on-file check; Rules adds hard rule that #partner / #sp / #spon / #collab are NEVER recommended (per ASA rulings) plus a repost-to-brand decision rule. Skill purpose statement gained disambiguation for "brief for [name]" trigger (vs Filming Brief Generator). Worked example updated. Anti-patterns expanded. Sources: UK ASA / CAP Code on influencer disclosure (rulings 2022-2024 on #sp / #spon / #ad clarity), CMA Hidden Ads guidance 2024, ASA "no further notice" sanction (2023). |
| 2026-05-20 | Meeting Prep Brief tested cold as Maddie (Tom Zoom prep for Thu 22 May, install-in-progress state, empty Information/Meetings/, Status.md has no "Awaiting" section despite the skill referencing one, Data Pull is a stub pending Metricool MCP). 7 edits applied: `/goal` text rewritten because it listed "Who and when" as a section (it's the header block, not a section) and omitted "One thing to remember" entirely — corrected to 5 numbered sections + header block, "One thing to remember" must be critical-persona pointed; Step 2 gained MCP availability check mirroring Daily Briefing 1d (Calendar / Slack / Gmail) with one-line fallbacks instead of silent failure; empty `Information/Meetings/` fallback added (instead of silent default to "First meeting on record" which would be wrong for Maddie's actual context, skill offers three options including "Recall it for me" — Maddie types 3 lines, skill saves as `[date] [Meeting] - Recalled by Maddie.md` for future runs); Status.md "Awaiting" reference removed because section doesn't exist in Maddie OS — replaced with Tasks.md Blocked status + Owner field (which matches the actual format standard); Data Pull stub-state handling added so the skill detects stub status and skips the offer gracefully instead of failing; meeting-type detection rule made explicit (1+Maddie+Tom = Tom Zoom, 1+Maddie+Harry = Harry 1:1, 3 = three-way, 4+ including external = four-way, anything else without Tom/Harry = external partner); cross-skill claim "Surface in Daily Briefing if a meeting today has no brief" removed from Rules because Daily Briefing has no such step — the responsibility currently sits with Maddie at greet (Diary section already lists today's meetings). "One thing to remember" source now defined explicitly: Brain Key People / past meeting summaries / active campaign or Status row / Maddie conversation-history flags / one honest question to Maddie. Surfaced two Brain expansion candidates not actioned: a Key People file per business (would sharpen "One thing to remember") and a Maddie-side Meeting Summary skill (parallel to Tom's Transcript Summary on the Tom OS side). |
| 2026-05-21 | **P1 final + P2 cluster cold-tested in a single session.** 9 skills tested, 60 edits across them. **P1 final:** Pre-publish Check text-only path (7 edits including Step 1.5 pre-collect-context to stop the 4+ cascading prompts through components, stub-voice handling lifted to orchestrator level, Step 3b verdict-mapping table covering Provisional Pass and Best-guess downgrade, Step 4 no-padding-blanks rule, Step 6 folder pre-check + filename rule). **P2 cluster (8 skills):** Weekly Slack Report Draft (10 edits, headline themes: mid-week default-window branching, Tasks.md window-filter rewrite via state-file boundary timestamp, Data Pull stub detection, Asks domain filter excluding OS/internal, Awaiting → Tasks.md Blocked source change, empty-Campaigns-folder fallback, Slack MCP availability + channel resolution cached to Tech Stack); Monthly Report Draft (8 edits, first-month / pre-OS-data baseline mode, bash snippets concrete + folder-existence guards, Data Pull stub mirror, manual-data fallback table for Cliniko / membership tools / Linda's records, first-month / major-capability-just-landed headline framing, folder self-heal, Drive MCP availability check); Google Ads Variation Generator (5 edits, Final URL three-branch handling for no-LP scenario, persona-missing three-option fallback mirror, first-paid-campaign baseline note, folder self-heal); Google Ads Keyword Builder (5 edits, broken/new conversion-tracking sub-clause for Stride pre-tag-fix, persona-missing three-option fallback, partial-data-source acknowledgement, folder self-heal, Option C Tasks.md cadence row format made explicit); Landing Page Brief (5 edits, Step 1.6 softening removes circular dependency with Variation Generator, persona-missing three-option fallback, Stage 3 parallel-build branch for Message Match, Compliance facts Brain cache per brand, Slack MCP availability check); Social Trends Watch (5 edits, first-run baseline framing, WebSearch availability pre-check + clean refusal not memory-fallback, overwrite guard, git commit gracefulness with rev-parse guard + push-failure fallback); Learning (4 edits, P1 list split into bootstrap-mode mirroring Install P1 bar verbatim vs post-bootstrap mode keeping date-conditional, Daily Briefing surfacer claim made concrete via `.install-state.json` gap_list mirror in bootstrap mode only, git resilience matching Session End + Social Trends, `git push origin main` → plain `git push`); **Install end-to-end (6 edits, including 2 critical bugs that would have broken Maddie's actual first install):** wrong MCP config file at Steps 8/9/10 (was `claude_desktop_config.json` Claude Desktop, corrected to `~/.claude/settings.json` Claude Code, MCPs would never have loaded), Step 5 Path A deploy-key command path fix (Tom's machine cannot reference Maddie's filesystem, switched to `pbpaste | gh repo deploy-key add -` stdin route), Step 6 pre-clone L4 deterministic check, Step 13b state-file init idempotent guard (was overwriting Learning's freshly-written rich state), new Step 13c centrally creates Reviews + Information subfolders closing the cross-skill install gap surfaced across 5 of the P2 skills, `git push origin main` → `git push` matching Learning + Social Trends fix. Cross-cutting themes across the session: install-window state robustness became canonical, MCP availability checks standardised on Daily Briefing 1d pattern, persona-missing three-option fallback became canonical across all persona-dependent skills, Brain caches per brand following the Filming Brief Generator release-facts pattern, circular dependency between LP Brief and Variation Generator broken. |
| 2026-05-20 | Document Template tested cold as Maddie across all three modes (Capture / Apply / Convert) — structural testing without an actual sample document. 8 edits applied: Capture step order flipped (was writing Brain analysis with a Source-file path before the source file was copied — left a stale pointer if the copy step failed; now copy source first then write analysis), pre-check added confirming the relevant Anthropic skill bundle (docx/pptx/xlsx/pdf) is available before routing (refuse if missing instead of silent degradation), "How Maddie hands a file to the skill" section corrects the "drops a file" phrasing throughout (Claude Code is CLI with no drag-drop; Maddie pastes a path or moves the file into the OS folder), new Step 1.7 brand reconciliation pass on Capture compares extracted colours/fonts against the brand's Guidelines file and flags mismatches before locking (prevents a one-off off-palette doc silently becoming the template), Step 3.1 image-PDF detection added (heuristic check for empty text layer on first 1-2 pages, refuse for high-stakes content or OCR-with-warning for reference; was silently producing nonsense Word docs from scanned image PDFs), trigger-collision routing rule added disambiguating "use the [template] template" between this skill's Apply mode and sister content skills (Campaign Brief Expander, Monthly Report Draft) that chain to this at their export step, commercial-sensitivity / git-sync flag added in Rules (captured source files containing pricing / named clients / internal commentary get a confirmation prompt before save), time-bound dated content removed from Future-enhancement section ("locked 28 May", "For now (May 2026)") per CLAUDE.md time-bound-document rule. |
