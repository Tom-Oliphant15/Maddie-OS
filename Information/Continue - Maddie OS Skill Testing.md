# Continue: Maddie OS Skill Testing

**Started:** 2026-05-19
**Project:** Maddie OS, prototype build window 19 May to 23 May 2026
**Status:** Prototype scaffolded + built. 24 skills, 14 Brain files, 4 Brain folders. **21 skills tested so far (Visual Brand Check, Campaign Brief Expander, Daily Briefing, Diagnostics, Tone Check, Session End, Filming Brief Generator, Talent/Ambassador Brief, Meeting Prep Brief, Document Template, Pre-publish Check text-only path, Weekly Slack Report Draft, Monthly Report Draft, Google Ads Variation Generator, Google Ads Keyword Builder, Landing Page Brief, Social Trends Watch, Learning, Install, Audience Persona Builder, Proofread standalone), 3 remain (all P3 stubs blocked on upstream software / MCP decisions, not on testing time: Voice Notes, Cross-Platform Repurposer, Data Pull).** All non-stub skills now tested. Parallel research-first retrofit work continues in a separate chat (see [[Projects/Continue - Research-First Skill Retrofits]]).

**P2 cluster summary (2026-05-21):** 53 skill edits applied across the 8 skills tested (Pre-publish Check 7, Weekly Slack 10, Monthly Report 8, Variation Generator 5, Keyword Builder 5, Landing Page Brief 5, Social Trends 5, Learning 4, Install 6 + closed the cross-skill install gap surfaced by 5 of the P2 skills). Cross-cutting themes: (1) **install-window state robustness** (folder self-heal, state-file existence guards, git-resilience patterns) became the canonical fix across most skills; (2) **MCP availability checks** (Slack, Drive, WebSearch, Metricool) standardised on the Daily Briefing 1d pattern; (3) **persona-missing three-option fallback** became canonical across Variation Generator, Keyword Builder, Filming Brief Generator, Landing Page Brief; (4) **Brain caches per brand for compliance / release facts / channel cache** following the Filming Brief Generator pattern; (5) **circular dependency** between Variation Generator (needs URL → routes to Landing Page) and Landing Page Brief (required keyword list → routes to Keyword Builder) resolved by softening LP brief input #6 to accept 3 to 5 example queries when ads not yet built. **Critical bugs caught in Install testing:** wrong MCP config file (would have broken every MCP on Maddie's machine) + Path A deploy-key command referencing wrong filesystem (would have broken Tom-in-person setup); both would have only surfaced on the actual MacBook install at end of in-person window.

---

## Where We Are — Exact State

### Skills tested so far

| Skill | Test scenario | Result | Edits applied |
|---|---|---|---|
| Visual Brand Check | Stride summer + nail surgery leaflets (Maddie design samples) | Caught 2 spelling errors + duplicate logo template error. Stub-flag behaviour worked correctly. | 4 skill edits: Proofread asset-format severity modifier, Visual Brand Check soft observations section, Pre-publish Check multi-input cross-asset consistency, Pre-publish Check consolidated Top 3 |
| Campaign Brief Expander | Stride nail surgery June 2026 campaign | Generic output on first run, required full research pass + major rewrite | Skill went from ~400 lines to ~700+, added 13 professional-standard sections, Executive Summary block, Creative Direction upgraded with 4 hook formulas + caption structure + platform format guidance from research |
| Daily Briefing | Cold simulation as Maddie, Wed 20 May 2026, no state files, MCPs disconnected (test env) | Output structure assembled correctly from Status.md + Tasks.md. Two real bugs surfaced: missing Step 1c body (changelog claimed it was added but Process section had no implementation), and no graceful-degradation pattern when MCPs are unavailable. Sections that needed Google Workspace / Slack / Metricool would silently fail in production. | 4 skill edits: (1) Wrote full Step 1c (Trends Watch state-file check, parallels 1a), (2) Added Step 1d MCP availability check, (3) Added one-line fallback wording to Sections 4, 5, 7 referencing 1d, (4) Updated Rules section to lock both new steps. Install-side dependency flagged separately: Install needs to write initial timestamps to `.last-diagnostics-run`, `.last-learning-run`, `.last-trends-run` on completion so first morning post-install does not fire all three monitoring skills unnecessarily. To address during Install testing. |
| Diagnostics | Cold simulation as Maddie, Wed 20 May 2026, no fixtures in Test/, MCPs disconnected, gh not installed | Walked all 8 stages. Multiple robustness gaps surfaced that would generate spurious L3 escalations during the Phase 2 install window (when MCPs are intentionally not yet connected and fixtures not yet authored). All gaps are install-window facing, not steady-state. | 5 skill edits: (1) Stage 2 now defers tests when fixture/scenario/expected files missing, instead of failing (aligns with build-week fixture authoring 20 to 23 May), (2) Tests 1.3 to 1.6 gained config-presence pre-checks for Google Workspace + Slack MCPs (matches the existing Stage 1.7 Metricool pattern), (3) Test 1.2 gained pre-check for `gh` not installed, (4) Test 1.1 fail-mode now parses git error output to discriminate L1 (network) / L3 (unrecognised) / L4 (auth or repo missing), (5) Stage 7 OS Health entry now logs deferred count separately from pass/fail so install-state-deferred is visibly distinct from broken. |
| Tone Check | Cold simulation as Maddie, Wed 20 May 2026, voice files all in Stub state | Stub-flag behaviour worked correctly (grep matched, warning shown, two options offered). But the offered Option B (best-guess) had no defined behaviour, brand-name normalisation was missing, voice-file-not-found was unhandled, and OS Health did not distinguish confident verdicts from best-guess verdicts. Four real bugs in a 270-line skill. | 5 skill edits: (1) Option B fully defined: compare against placeholder content + brand Brain + general anti-patterns, downgrade verdicts one tier, mandatory banner on output, (2) Brand-name normalisation table in Step 1 maps colloquial inputs ("f&e", "leamington", "golf") to canonical filenames, (3) Voice-file-missing handling added, points Maddie to /install or /learning, (4) OS Health log adds "Verdict mode: confident / best-guess" so Tom can see in the admin log whether copy was shipped under a locked or stub voice, (5) Rules section updated to lock all of the above + add "Provisional Pass" for locked-but-Reference-Posts-empty edge case. |
| Session End | Cold simulation as Maddie, Wed 21 May 2026, 14:30 wrap-up, complete-with-onboarding-in-progress install state, Slack ✓ Metricool ✗, daily log already had morning briefing with three Top 3 items, one Top 3 item completed in session, Live Brain Update fired mid-session. | Real-work detection worked. Several gaps surfaced across daily-log append location, Top 3 carry-over logic, Brain Directory regex coverage, OS Health duration anchor / goal verification, hardcoded git working-dir, rebase-conflict handling, Slack MCP dependency for L4 freeze, and the unimplementable "5 days" rule. Nine skill edits applied. | 9 skill edits: (1) Step 0 pre-check for `.install-state.json` exists before close-out, (2) Step 4 daily-log append locates `## Sessions` header explicitly + Top 3 cross-reference algorithm (read morning briefing, cross-ref Tasks.md changes, carry over un-Done items), (3) Step 5 Brain Directory `git status --porcelain Brain/` now catches `??` untracked files, (4) Step 7 OS Health gained goal-verification sub-step + defined duration anchor (morning briefing timestamp, fallback "unknown") + Step 1 named as skills-fired source, (5) Step 8 working-dir reads `install_path` from `.install-state.json` instead of hardcoded `~/Documents/Maddie OS`, (6) Step 8 rebase-abort guard added so failed L2 pull-rebase does not leave repo mid-rebase, (7) Step 8 L4 Slack-ping gained Slack-MCP availability check (mirrors Daily Briefing 1d) with OS Health fallback + plain-English message to Maddie, (8) L4 Slack template gained Rebase status line, (9) Critical persona "5 days" rule rewritten as signal-based (still In Progress at start + still In Progress at end + untouched this session = nudge); date-based check deferred to Weekly Review. Casual-session path tightened to no auto `git add -A`, prompts before staging. Triggers updated. |
| Filming Brief Generator | Cold simulation as Maddie, Luke ambassador swing reels for Fade Golf, shoot in 2 weeks, install-in-progress state, Fade Golf voice file in Stub, no Audience Personas folder in Brain yet, no central contacts file anywhere in the OS, Talent Release + Patient Consent templates present in Assets/. | Skill is well-structured post-retrofit but had real gaps once cold-tested against the actual OS state. Eight skill edits applied. Mostly dependency-handling and operational discipline; the retrofit's content + structure held up. | 8 skill edits: (1) `/goal` text updated from "talent release status flagged" to "release `.docx` generated per identifiable on-camera person, saved under Information/Talent Releases/Drafts/" (goal was out of sync with post-retrofit generative behaviour), (2) Stage 1 input #12 added: "people in frame beyond named talent" surfaces incidental-capture upfront so it doesn't ambush Maddie in Stage 9f, (3) Stage 2 now offers three explicit options when persona file missing (run Audience Persona Builder inline / best-guess from brand Brain / Maddie-supplied verbatim triggers) — was silently defaulting to generic; expected persona filename pattern stated, (4) Step 9b clarified there is no central contacts file in this OS; contact details come from Maddie inline unless a prior signed release for the same person exists in /Signed/, (5) Step 9c LEGAL_ENTITY / PRIVACY_NOTICE_URL / WITHDRAWAL_CONTACT_EMAIL / BRAND_HANDLE caching now writes into a `## Release form facts` section in each brand's Brain file (was just "ask Tom + cache" with no defined cache location), (6) Step 9d split into `Information/Talent Releases/Drafts/` and `/Signed/` subfolders so glance at folder tree shows outstanding releases; follow-up task language changed to "move from /Drafts/ to /Signed/", (7) Section 9 output table file paths updated to /Drafts/, (8) New Rules entry on PII / GitHub-sync boundary covering Article 9 health data for Stride patients, 30-day withdrawal requiring deletion from both /Drafts/ /Signed/ AND git-history scrub (`git filter-repo` / BFG), consent-before-storing-scanned-signatures. Worked example updated to remove phantom contacts file and reflect the persona-missing flow. |
| Talent/Ambassador Brief | Cold simulation as Maddie, Luke paid-ambassador post for Fade Golf reel, install-in-progress state, Fade Golf voice in Stub, no signed-release lookup logic existed, no commercial-relationship branching. | **Critical compliance bug surfaced.** Original template told paid ambassadors NOT to use `#ad`, recommended `#partner` instead — wrong under UK ASA/CAP rules which treat ambassador retainers as paid partnerships requiring clear disclosure (#ad / #paidpartnership / Instagram Paid Partnership label) AND have explicitly ruled #sp/#spon/#collab/#partner inadequate. Six edits applied. | 6 skill edits: (1) Step 0 release pre-check added (refuse to issue brief if no signed release in /Signed/ for paid/employee/patient tiers; flag and require Maddie confirmation for friend-of-brand), (2) Step 1 input #3 commercial-relationship captured across four tiers (paid ambassador / employee / friend-of-brand / Stride patient) drives Disclosure section, (3) Step 1 input #8 talent voice reference optional but recommended; if absent the example caption is honestly labelled generic instead of pretending to be in-voice, (4) Output template gained mandatory Disclosure section branching on relationship tier (paid → #ad/Paid Partnership label; employee → visible employment statement; friend → transparency phrasing; patient → consent + Article 9 + withdrawal route), (5) `/goal` text now 7 sections + Disclosure correctness check + release-on-file check, (6) Rules section adds hard rule that #partner / #sp / #spon / #collab are NEVER recommended (ASA rulings); repost-to-brand decision rule added (1.5x reach or saves AND disclosure-compliant AND no campaign clash, default-don't-repost if unsure). Disambiguation note added at skill purpose: "brief for [name]" trigger asks one question to route between Filming Brief Generator and this skill. Anti-patterns expanded with the compliance breaches. Sources: UK ASA / CAP Code on influencer disclosure (rulings 2022-2024 on #sp / #spon / #ad clarity), CMA Hidden Ads guidance 2024, ASA "no further notice" sanction (2023). |
| Meeting Prep Brief | Cold simulation as Maddie, Tom Zoom prep for Thu 22 May, install-in-progress state, empty Information/Meetings/ (day 1), Status.md has no "Awaiting" section, Data Pull is a stub pending Metricool MCP. | Functional but had multiple silent-failure paths and a structural goal mismatch. Seven edits applied. | 7 skill edits: (1) `/goal` text rewrote — was listing "Who and when" as a section (it's the header block, not a section) and was missing "One thing to remember" entirely; corrected to 5 numbered sections + header block, "One thing to remember" must be critical-persona pointed, (2) Step 2 gained MCP availability check mirroring Daily Briefing 1d (Calendar / Slack / Gmail) with one-line fallbacks instead of silent failure, (3) Empty Information/Meetings/ fallback added: skill offers three options including "Recall it for me" with a 3-line Maddie-supplied summary saved as `[date] [Meeting] - Recalled by Maddie.md` for future runs (instead of silently defaulting to "First meeting on record"), (4) Status.md "Awaiting" reference removed — section doesn't exist in Maddie OS; replaced with Tasks.md Blocked status + Owner field which matches the actual format standard, (5) Data Pull stub-state handling added — skill detects stub status, skips the data offer, notes "Data Pull unavailable until Metricool MCP configured" instead of failing, (6) Meeting-type detection rule made explicit (was vague "skill detects from attendees"): 1+Maddie+Tom = Tom Zoom, 1+Maddie+Harry = Harry 1:1, 3 = three-way, 4+ including external = four-way, anything else without Tom/Harry = external partner, (7) Cross-skill claim "Surface in Daily Briefing if a meeting today has no brief" removed from Rules — Daily Briefing has no such step, the responsibility currently sits with Maddie at greet (Diary section already lists today's meetings). "One thing to remember" source now defined explicitly: Brain Key People / past meeting summaries / active campaign or Status row / Maddie conversation-history flags / one honest question to Maddie if none of those are sharp. |
| Document Template | Cold simulation as Maddie, all three modes (Capture/Apply/Convert) without supplying an actual sample document; testing was structural — step ordering, dependencies, edge cases, sister-skill collisions. | Skill is broadly well-structured but had a real step-ordering bug (Brain analysis written with a path before the source file was copied — left a stale reference on failure), no Anthropic-skill-availability pre-check, drag-drop affordance that doesn't exist in CLI, no brand reconciliation against Guidelines, no image-PDF detection. Eight edits applied. | 8 skill edits: (1) Capture step order flipped — copy source to `Assets/Templates/` first (was Step 1.6), then write analysis to `Brain/Document Templates/` (was Step 1.5); removed the stale-pointer failure mode if the copy fails after the Brain write, (2) Pre-check section added covering all three modes — confirm relevant Anthropic skill bundle (docx/pptx/xlsx/pdf) is available before routing; refuse if missing instead of silent degradation, (3) "How Maddie hands a file to the skill" section added — Claude Code is CLI, no drag-drop; Maddie pastes a path or moves the file into the OS folder; corrected "drops a file" phrasing throughout, (4) New Step 1.7 brand reconciliation — compares extracted colours/fonts against the brand's existing Guidelines file, flags mismatches and asks Maddie before locking the template; prevents a one-off off-palette doc silently becoming the template, (5) Step 3.1 image-PDF detection added — heuristic check for empty text layer on first 1-2 pages; if scanned image without OCR, refuse for high-stakes content or OCR-with-warning for reference content; was silently producing nonsense Word docs, (6) Trigger-collision routing rule added under Quick Start — disambiguates "use the [template] template" between this skill (Apply mode) and content skills (Campaign Brief Expander, Monthly Report Draft) that chain to this at their export step, (7) Commercial-sensitivity / git-sync flag added in Rules — captured source files containing pricing / named clients / internal commentary get a confirmation prompt before save; private repo + Tom-only GitHub access caveat noted, (8) Future-enhancement section dated references removed ("Master Marketing Document spreadsheet (locked 28 May)" and "For now (May 2026)") per CLAUDE.md time-bound-content rule. Capture worked example updated to reflect new step order + reconciliation. |

### Skills NOT yet tested (22)

**P1 testing order recommended (highest immediate value):**
1. ~~Daily Briefing~~ — **Done 2026-05-20.** Two bugs fixed (missing Step 1c, no MCP degradation pattern). Install dependency flagged.
2. ~~Audience Persona Builder~~ — **Done 2026-05-21 (post-retrofit).** 4 edits applied: Step 1 filename casing convention locked to Title Case with spaces per CLAUDE.md naming rule (stops `nail-surgery.md` / `NailSurgery.md` fragmentation), Step 4 WebSearch availability pre-check with clean Maddie-only fallback + confidence downgrade rather than fabricating sources, Step 8 git resilience matching Social Trends + Learning + Install + Audience Persona Builder canonical pattern (rev-parse guard + push-failure fallback + plain `git push`), Step 9 Tone Check cross-skill claim softened (was aspirational, Tone Check does not actually read persona Voice of Customer), and explicit cross-skill connection added for the four persona-dependent skills (Variation Generator + Keyword Builder + Landing Page Brief + Filming Brief Generator) whose three-option fallback now defaults from B/C to A. Persona chain end-to-end validated.
3. ~~Tone Check~~ — **Done 2026-05-20.** 5 edits applied (Option B fully defined, brand-name normalisation, voice-file-missing handling, OS Health verdict mode, Provisional Pass rule).
4. ~~Session End~~ — **Done 2026-05-20.** 9 edits applied (install-state pre-check, daily-log append location + Top 3 cross-ref, untracked-Brain-file fix, OS Health duration anchor + goal verification, dynamic install path, rebase-abort guard, Slack MCP fallback, signal-based stale-task nudge).
5. ~~Diagnostics~~ — **Done 2026-05-20.** 5 edits applied (Stage 2 deferred-fixture handling, MCP config pre-checks, gh pre-check, git error discrimination, OS Health deferred count).
6. ~~Filming Brief Generator~~ — **Done 2026-05-20.** 8 edits applied (goal text resync, Stage 1 incidental-people input, persona-missing three-option flow, contacts source clarified, brand-cache section in Brain, /Drafts/ vs /Signed/ split, PII/GitHub-sync rule, worked example fixed).
7. ~~Talent / Ambassador Brief~~ — **Done 2026-05-20.** 6 edits applied including a critical ASA/CAP compliance fix: original template recommended NOT using #ad and using #partner instead for paid work, which is unlawful disclosure under UK ASA rulings. Replaced with branching Disclosure section across four commercial tiers + signed-release pre-check + voice-reference honesty rule.
8. ~~Meeting Prep Brief~~ — **Done 2026-05-20.** 7 edits applied (goal/section mismatch, MCP availability fallbacks, empty-Meetings-folder fallback, Awaiting-section reference removed, Data Pull stub handling, explicit meeting-type detection rule, "One thing to remember" source defined). Surfaced two Brain expansion candidates: a Key People file (currently no defined source for the relationship context the "One thing" needs) and a separate Meeting Summary skill on Maddie's side (the brief asymmetry without one is real but accepted for now).
9. ~~Document Template~~ — **Done 2026-05-20.** Cold-tested all three modes structurally (no sample document supplied yet). 8 edits applied: Capture step order flipped (copy source before writing analysis, fixes stale-pointer failure mode), Anthropic skills bundle pre-check added, CLI affordance clarified (no drag-drop in Claude Code), brand reconciliation pass added on Capture, image-PDF detection added on Convert (was silently producing nonsense), trigger-collision routing rule added vs sister content skills, commercial-sensitivity / git-sync flag added in Rules, time-bound dated content removed per CLAUDE.md.
10. ~~Pre-publish Check text-only path~~ — **Done 2026-05-21.** 7 structural edits applied (Step 1.5 pre-collect context in one pass, stub-voice handling lifted to orchestrator, Step 3b verdict-mapping table covering Provisional Pass + Best-guess downgrade, Top 3 no-padding rule, Step 6 folder pre-check + filename rule, brand-name normalisation, Worked Example 1 rebuilt). Cross-skill install gap surfaced: Reviews subfolders (Pre-publish Checks / Proofread / Tone Check / Visual Checks) are not created on first install, components hit silent save failures. Flag for Install testing.

**P2 testing order:**
11. ~~Weekly Slack Report Draft~~ — **Done 2026-05-21.** 10 edits applied. Headlines: (a) Step 1 default-window now branches by weekday (Sun/Mon = previous completed week; Tue-Sat asks Maddie to disambiguate last-week vs partial-current-week, no silent half-week reports), (b) Step 2 Tasks-completion detection rewritten to use `.weekly-report-state` boundary timestamp + git log (was per-row timestamps that Tasks.md does not have), (c) Step 2 Data Pull stub detection (skip the offer-to-run, mirrors Meeting Prep Brief Step 5 fix), (d) Step 2 Asks scope filter excludes OS / internal brand tags so Tom's OS-build tasks do not clutter Tom + Harry's founders' read, (e) Step 2 Risks source moved from non-existent Status.md "Awaiting" section to Tasks.md Blocked rows + Status.md changelog escalation + cross-week stuck pattern (same fix family as Meeting Prep Brief), (f) Step 2 empty Campaigns folder fallback to Tasks.md In Progress + To Do next-2-weeks, (g) Step 2 Next Week primary source now Tasks.md next-7-day deadlines (was Status.md This Week's Priorities, which is mid-week current-week not next-week), (h) Step 5 Reviews/Weekly Reports/ folder self-heal, (i) Step 5 Slack MCP availability check + channel resolution cached to Tech Stack on first run (was hardcoded #fade-group-marketing), (j) Step 6 Daily Briefing cross-skill claim softened to hook-to-verify (the missed-week surfacing change lands in Daily Briefing if not yet implemented). Cross-skill install gap reaffirmed: Reviews/ subfolders not created on first install, same as Pre-publish Check finding.
12. ~~Monthly Report Draft~~ — **Done 2026-05-21.** 8 edits applied: Step 1 first-month / window-vs-OS-history pre-check (offers explicit "first-month baseline mode" when window predates OS / first weekly report, stops zero-padded fake-precision tables); Step 2 bash snippets rewritten (concrete patterns + folder-existence guards, no more ambiguous regex placeholders or silent ls failures); Step 2 Data Pull state branching (mirrors Weekly fix); Step 3 manual-data fallback table (Cliniko / membership tools / Lynda's records for acquisitions + Google Ads / Meta Ads / freelancer invoices for spend, with mandatory "data not available, [reason]" cells over inventing); Step 5 first-month / major-capability-just-landed headline framing; Step 8 Reviews/Monthly Reports/ self-heal; Step 8 Drive MCP availability check + fallback for Option B Google Doc export; worked-example guide gained a Note on maturity at the top so first-run callers route to Step 1 baseline mode instead. Cross-skill install gap reaffirmed.
13. ~~Google Ads Variation Generator~~ — **Done 2026-05-21.** 5 edits applied: Step 1.3 no-Final-URL three-branch handling (generic homepage / no URL at all / URL TBC), Step 2 voice-stub block + persona-missing three-option fallback mirroring Filming Brief Generator, Step 2 first-paid-campaign baseline framing when no Data Pulls exist, Step 11 Information/Ad Variations/ folder self-heal, Step 1.3 Landing Page Brief route-upfront chain replaces the post-generation Step 8 flag for doomed Message Match. Cross-skill install gap reaffirmed.
14. ~~Google Ads Keyword Builder~~ — **Done 2026-05-21.** 5 edits applied: Step 1.5 broken/new conversion tracking sub-clause (treat as 0 conv → Manual CPC, covers Stride pre-tag-fix scenario), Step 2 persona-missing three-option fallback (matches canonical Variation Generator + Filming Brief Generator pattern, adapted to keyword context with customer-search-terms verbatim option), Step 3 partial-data-source acknowledgement (no Keyword Planner / Answer The Public still gets ~80% from persona + competitor + Search Terms), Step 9 Information/Ad Variations/ folder self-heal, Step 9 Option C Tasks.md cadence row format made explicit (canonical column format, example, create-sub-table-if-missing rule). Structural observation deferred: `Information/Ad Variations/` shared between two distinct skill outputs, could split into `/Ad Variations/` + `/Keywords/` in a later structural pass.
15. ~~Landing Page Brief~~ — **Done 2026-05-21.** 5 edits applied: Stage 1.6 input softened to remove circular dependency with Variation Generator (now accepts 3 to 5 example search queries when keyword list not yet built, formal message-match locks on re-run); Stage 1 persona-missing three-option fallback added (matches canonical pattern across Variation Generator, Keyword Builder, Filming Brief Generator); Stage 3 Message Match parallel-build branch (Pre-match draft label when ads do not yet exist, no silent match-confirmed lines against nothing); Stage 5 Compliance facts Brain cache section (asked once, cached per brand, reused on every subsequent brief, mirrors Filming Brief Generator release-form-facts pattern); Stage 6 Slack MCP availability check for Option A. Cross-skill chain order documented, no longer circular.
16. ~~Social Trends Watch~~ — **Done 2026-05-21.** 5 edits applied: Step 1 first-run case (empty folder skips reconciliation, baseline framing, omits empty sections), Step 2 WebSearch availability pre-check + clean refusal rather than memory-fallback (point of the skill is sourced current-month synthesis) + date-resolution rule from system date + cleaned ambiguous "Quick Research / Web Search" to plain WebSearch, Step 5 overwrite guard (default to `[YYYY-MM] mid-month update.md` rather than silent overwrite), Step 6 git commit gracefulness mirroring Session End L1/L2/L4 fallback (push-failure → commit deferred to next session; no-repo install-window → skip commit, log to OS Health, never fail the run on git plumbing).
17. ~~Learning~~ — **Done 2026-05-21.** 4 edits applied: Step 3 P1 list split into bootstrap-mode (mirrors Install Step 13a minimum bar verbatim) vs post-bootstrap-mode (28-May-lock-date logic), fixing the dead spot where the date-conditional P1 was functionally empty during pre-28-May bootstrap; Step 6 Daily Briefing surfacer claim made concrete by mirroring parked-P1 items into `.install-state.json` `gap_list` in bootstrap mode (uses the existing Daily Briefing 1b hook), post-bootstrap parked items stay in `.last-learning-run` and do not auto-surface per rescoping; Step 8 git resilience added (`rev-parse` guard + push-failure fallback + no-repo install-window path) matching Session End + Social Trends patterns; Step 8 `git push origin main` softened to plain `git push` to respect tracking branch.
18. ~~Install~~ — **Done 2026-05-21.** 6 edits applied including 2 critical bugs that would have broken Maddie's first install: (a) **MCP config target file fix** at Steps 8/9/10 (was writing to `claude_desktop_config.json` which Maddie OS does not use; corrected to `~/.claude/settings.json` for Claude Code, MCPs would never have loaded otherwise); (b) **Step 5 Path A deploy-key command fix** (Tom's machine cannot reference a path on Maddie's Mac, switched to stdin route via `pbpaste | gh repo deploy-key add -`); (c) Step 6 pre-clone safety check now fires L4 deterministically rather than risk clobbering existing files; (d) Step 13b state-file init made idempotent (was overwriting Learning's and Diagnostics's freshly-written rich state with placeholder); (e) **new Step 13c creates Reviews + Information subfolders centrally**, closing the cross-skill install gap that 5 P2 skills surfaced (Pre-publish Check, Weekly Slack Report, Monthly Report, Variation Generator, Keyword Builder), skills' own self-heal stays as belt-and-braces; (f) `git push origin main` softened to plain `git push` at Steps 11 + 14 to respect tracking branch (matching same fix in Learning + Social Trends).

**P3 testing order (all blocked on upstream decisions, not on testing time):**
19. Voice Notes — stub, depends on recording software decision (Tom + Maddie)
20. Cross-Platform Repurposer — stub, depends on scheduling software decision (Tom + Maddie)
21. Data Pull — stub, depends on Metricool MCP being set up (Wed 21 May per Tasks.md)

**Out-of-band:**
- ~~Proofread standalone~~ — **Done 2026-05-21.** 3 edits applied: Step 1 empty-input guard, file-not-found pre-check returning clear error rather than silent read-failure, orchestrator-invocation note so Pre-publish Check's pre-collected asset format passes through without re-prompting Maddie. Scenarios across pasted text, file path (existing + missing), image readable + unreadable, .docx without docx skill, ambiguous asset format all walked cleanly.

---

## What Was Built This Session (full list)

For audit / context, full scope of what landed in Maddie OS:

### Project structure
- 24 skill files (21 fully fleshed, 3 stubs)
- 14 Brain files: Maddie, Fade Group, 3 business files, 3 voice files, 3 guidelines files, Tech Stack, How Your OS Works, Brain Directory
- 4 Brain folders: Businesses, Brand Voices, Brand Guidelines, Document Templates
- Reviews subfolders: Daily, OS Health (with privacy boundary header), Social Trends
- Test folder skeleton (fixtures, scenarios, expected)
- Information/Campaigns/Archive folder for past-performance reference
- `.gitignore` for the project

### Skills by cluster
**Always-on:** Daily Briefing, Voice Notes (stub), Social Trends Watch
**Strategy:** Audience Persona Builder
**Quality (pre-publish gates):** Pre-publish Check (orchestrator), Proofread, Tone Check, Visual Brand Check
**Creative:** Campaign Brief Expander, Cross-Platform Repurposer (stub)
**Production:** Filming Brief Generator, Talent / Ambassador Brief
**Paid media:** Google Ads Variation Generator, Google Ads Keyword Builder, Landing Page Brief
**Analytics + Reporting:** Data Pull (stub), Weekly Slack Report Draft, Monthly Report Draft
**Stakeholder:** Meeting Prep Brief
**Document handling:** Document Template (Capture / Apply / Convert for Word, PowerPoint, Excel, PDF)
**Setup + self-care:** Install, Diagnostics, Learning
**Lifecycle:** Session End

### Tom OS additions
- Skills/OS Admin/Admin Report.md (Tom-side, manages user OSs remotely)
- Skills/OS Admin/fix-library.md (cross-OS pattern library)
- Reviews/OS Admin/ folder

### Discipline rules locked in
- CLAUDE.md (Tom OS) gained Skill Creation + Skill Editing Discipline sections
- Skill Creator gained Step 1c (research) + Step 5b (stress test) + Step 5c (Critique)
- Maddie's Instructions.md mirrored the same discipline

---

## Structural change: install onboarding gate + Live Brain Update + Document Linking Convention (2026-05-20)

After the three skill tests above, Tom asked whether the OS currently enforces Maddie completing the Learning phase before skills can run. It did not — Install fired Learning but Maddie could say "park the rest" at question 1 and Install would still report "complete". Skills then ran on stubs with graceful degradation.

Tom's decision: implement Layer A. Specifically:

1. **Install gains a P1 minimum-bar gate.** Step 13a (new) measures the Brain against a defined P1 bar (Maddie.md + Fade Group.md + 3 brand Brain files + 3 voice Tone sections + 3 guidelines colour palettes + Tech Stack). If bar met, install reports `complete`. If not, reports `complete-with-onboarding-in-progress` and writes the gap list to `.install-state.json`. Step 13b (new) initialises monitoring state files so first-morning briefing does not unnecessarily fire Diagnostics/Trends.

2. **Daily Briefing Step 1b repurposed.** Was: "recommend Learning if >30 days old". Now: "if install state shows onboarding-in-progress, surface the P1 gap list as recommendation #1 every morning until cleared".

3. **Learning scoped down.** Install-bootstrap + complete-reinstall only. No monthly cadence. No Daily Briefing auto-recommend. Question templates + audit logic kept intact for the legitimate use case.

4. **Live Brain Update rule added to Instructions.md.** After the initial bootstrap, the OS adapts on the job. When Maddie says a Brain-level fact mid-conversation (new colour, new reference post, audience insight, tool change), the relevant Brain file is updated immediately and Maddie is told what changed. Table of examples + scope rules in the Instructions.md section.

5. **Document Linking Convention added to Instructions.md.** Mirrors Tom OS's version. Canonical source per fact, transclusion via `![[file#heading]]` for any fact appearing in multiple docs. Edit at source, propagation is automatic. This is the mechanism that makes Live Brain Update useful — Maddie changes one thing, every doc that references it updates.

Files touched in this batch:
- `Skills/Install.md` (Step 13 rewritten, Steps 13a + 13b added, Step 14 branches on P1, state schema extended)
- `Skills/Daily Briefing.md` (Step 1b repurposed, Section 7 format updated)
- `Skills/Learning.md` (Purpose + Quick Start rewritten, changelog entry)
- `Instructions.md` (Conversation Startup section, Live Brain Update section added, Document Linking Convention section added)
- `Brain/Brain Directory.md` (last-updated note + Daily Briefing + Learning entries)
- `Status.md` (changelog entry)

## Identity Locks layer added (2026-05-20, same day)

After the structural change above, Tom flagged the missing protection: with Live Brain Update active, a creative chat could silently overwrite a canonical brand value (e.g. exploring a Christmas red would overwrite the Fade Golf primary). Identity Locks layer added to Instructions.md to prevent this without making the OS question-heavy.

Design decisions locked:
- Two categories. **Identity (locked):** colour palette, typography, logo, voice Tone + Vocabulary Use/Avoid + Bad Examples, Strategic Direction, Key People, Maddie's Role/Scope, Fade Group in/out scope. **Operational (open):** audiences, reference posts, campaigns, channels, tech stack.
- **Channels stayed operational** because the natural change-language detector catches strategic decisions ("we're dropping TikTok") while pause/resume flips slip through without friction.
- **Add-vs-replace nuance** built in for locked list-shaped sections (Vocabulary Use/Avoid, Bad Examples, Key People): adds write freely, replacements/removals fire the flag. Logo is the exception, both directions locked, every new logo variant is a brand asset decision.
- **Drift detection triggers** on direct contradiction OR explicit change language only ("from now on", "going forward", "change the X", "update the X"). Creative exploration ("let's try red", "what if", "for this campaign", "mocking up") never fires the flag.
- **Single binary question on flag** (permanent / one-off), defaults to one-off if ambiguous. No follow-up chains. One question, done.
- Git history is the audit trail for permanent changes. No separate per-file changelog needed.

Files touched in this sub-batch:
- `Instructions.md` (Live Brain Update opening updated, Identity Locks section added after it)
- `Brain/Brain Directory.md` (last-updated note)
- `Status.md` (changelog entry)

## Decisions Locked During Testing

These came up during the test-and-edit cycles. Document so future-Maddie + Tom remember why:

1. **Print materials escalate spelling errors to Heavy revision automatically.** Modifier in Proofread. Catches the leaflet-cost-of-reprint risk that two Stride leaflet typos surfaced.
2. **Visual Brand Check uses Soft observations when Group B is stub-skipped.** Brand-style notes do not leak into Group A layout findings. Keeps the layout-vs-brand boundary honest.
3. **Pre-publish Check supports multi-input.** Cross-asset consistency check for asset pairs + consolidated Top 3 across the whole set.
4. **Campaign Brief Expander now produces professional-standard briefs.** 18 sections including Executive Summary, Key Messages, Past Performance reference, Mandatories, Out of Scope, Kill Criteria, Stakeholders + Approval Gates. Word export option chained via Document Template skill.
5. **Brain-context-confirmation pattern locked as canonical** for all Brain-dependent skills. Show what Brain content the skill will use, confirm with Maddie, trigger prerequisite skills (Audience Persona Builder, Learning) inline if anything is stub or missing.
6. **Campaign Archive pattern established** at `Information/Campaigns/Archive/`. Completed campaigns with Performance Outcomes appended. Future briefs reference proven winning + losing patterns.

---

## Next Step (when resuming)

Tom resumes testing. Recommended sequence:

1. **Test Daily Briefing first.** It is the OS's morning entry point and validates GitHub pull + state-file triggers (Diagnostics, Learning, Social Trends). Without this working cleanly, the autonomous-monitoring pattern does not fire.

2. **After Daily Briefing passes: test Audience Persona Builder (post-retrofit).** The parallel retrofit work upgrades this skill with research methodology. Test the upgraded version on a real Stride service (e.g. nail surgery) so the audience persona file is locked AND we validate the retrofit worked.

3. **Then test Tone Check, Session End, Diagnostics in any order.**

4. **Filming Brief Generator + Talent/Ambassador Brief next** — Luke ambassador filming is real upcoming use within 2 weeks, real input available.

5. **Continue P1 testing list above in order.**

Cap recommendation: 2 to 3 skills per session. Test the skill, gather feedback, apply edits, log changelog entries.

---

## How to Resume This Work in a Fresh Session

In a fresh Claude Code session, Tom says one of:
- "continue testing Maddie OS skills"
- "pick up the skill testing"
- "resume from Continue - Maddie OS Skill Testing"

The fresh instance:
1. Reads this file in full
2. Reads the Maddie OS Brain Directory to confirm what skills exist
3. Picks the next skill from the recommended testing sequence (or asks Tom if a different order is wanted)
4. Tests the skill end-to-end with Tom as the assumed-Maddie respondent
5. Applies any edits surfaced during the test
6. Updates this note's "Skills tested so far" table
7. Asks whether to continue with the next skill or stop

---

## Parallel work happening

[[Projects/Continue - Research-First Skill Retrofits]] is the parallel work happening in a separate chat. Audience Persona Builder + Visual Brand Check + Filming Brief Generator + Landing Page Brief are queued for retrofit there. **Re-testing those skills AFTER retrofit is the cleanest sequence** (do not test them now, the retrofit will likely change behaviour materially).

---

## Files in scope for this work

- `/Users/tom_oliphant/Documents/Tom OS/Businesses/AI Business/Projects/Maddie - Fade Group/` (all of it)
- Tom-side admin skills: `/Users/tom_oliphant/Documents/Tom OS/Skills/OS Admin/`

---

## Per CLAUDE.md continuation note rules

**Delete this file when all P1 + P2 skills have been tested AND the prototype is stable.** Continuation notes are temporary. Once testing is complete, the work is captured in each skill's Changelog + project Status.md.

Track ongoing testing in the "Skills tested so far" table above so Tom can see progress without re-reading the whole note.

---

*Generated 2026-05-19 by Claude during the Maddie OS build session, parked when context budget ran tight and Tom asked to continue Maddie OS testing in a separate session.*
