# Brain Directory

*Last updated: 2026-05-28 (New files: Information/Harry Back - w/c 1 June 2026.md, Reviews/Weekly Reports/ folder + first report. Brain/Contacts.md updated -- Tracey added, Olivia alias Liv + meeting note. Brain/Tech Stack.md updated -- Metricool trial agreed, Slack weekly report channel cached. Information/Open Questions.md updated -- Metricool MCP now In Progress, scheduling software Resolved.)*

*Previously: 2026-05-26 (Afternoon session: Brain/Businesses/Fade Golf.md, Brain/Businesses/Fire & Earth Leamington.md, Brain/Businesses/Stride Clinics.md, Brain/Fade Group.md, Brain/Tech Stack.md all updated -- Jason meeting context, Harry return date, orthotics clarification, Calendar/Drive MCP live, half marathon campaign added. Prior: 2026-05-22 Pre-install readiness sweep. New Brain/Onboarding/ section added with Daily Cheat Sheet and Your First Week as living .md files so they're accessible mid-conversation, not just as printed PDFs. Install skill stripped of Maddie-side gh dependency, added Day Zero preamble + Day One Tour, added jq install. New Information/Open Questions.md is the durable registry for unanswered questions / stub-state decisions / deferred follow-ups; Learning writes to it on park, Daily Briefing surfaces unresolved rows each morning post-install. Teach skill gained onboarding-artifact triggers + Mode 4b. Earlier today: Brain bootstrapped from Maddie's returned Bootstrap Form. 9 files populated: 3 brand voice files now Live with tone, vocab use/avoid, references, drift catchers; 3 brand guidelines now Live with colour palette — Fade Golf #41873c, Stride #204f7f, F&E #b01227 — logo background rules, and imagery style; 3 business pages now have audience + channels filled per Maddie's words; Maddie.md gained working-week pattern, brief format preferences and push-back style; Fade Group.md Key People table rewritten with per-person relationship context; Contacts.md gained Olivia marketing flag and stub rows for Manny + Nick. Same-day resolution from Tom on all three parked items: Lynda confirmed canonical (and is Area Manager across Stride + F&E, not just F&E operations); Olivia is Clinical Lead F&E (potentially moving to Practice Manager); Manny owns Padel and Play in Stratford (F&E partnership); Nick is a PT renting gym space at Stride + Fade Golf. Org hierarchy added to Fade Group.md (Therapists → Clinical Leads → Practice Managers → Area Manager (Lynda) → Directors → Marketing Lead across all). Earlier: Teach skill added under new Learning the OS group. Interactive `/help` skill that reads skill files at runtime, five modes for first-week onboarding through to steady-state lookup. Earlier today: Seven master skills imported and adapted for Maddie OS: Grill Me, Critique, Quick Research, Slack Search, Continuation Note, Difficult Conversation Prep, Draft Text. Slack Workspace.md Brain file added under Tech Stack section to support Slack Search. Earlier: Contacts.md added under new Contacts section, Fade Group employees only. Mirrored subset of Tom OS Contacts. Earlier still: Onboarding model changed: Learning is now install-bootstrap + complete-reinstall only, no longer periodic. After install clears the P1 minimum bar, the OS adapts on the job via the Live Brain Update rule in Instructions.md. Document Linking Convention added to Instructions.md to make the propagation mechanism explicit: canonical source per fact, transclusion via `![[file#heading]]`, edit at source. Skills updated: Install gained Step 13a (P1 bar measurement) + Step 13b (initial state files), Daily Briefing Step 1b repurposed as onboarding-gap nag, Learning scoped down to bootstrap/reinstall. Identity Locks layer added to Instructions.md: identity-level Brain content (colours, voice tone, strategic positioning, etc.) requires drift-detection + binary permanent/one-off question before any write; operational content stays friction-free; adds to locked lists run freely, only replacements/removals fire the flag.)*

## Purpose

OS map for Maddie's Brain. Read this at the start of every conversation to know what exists and where it lives.

Indexes:
- Brain files (knowledge)
- Active brands (with Brain file paths)
- Skills (with one-line descriptions)
- Key reference docs

Do NOT read all Brain files. Only pull what the current task requires. Skills bypass this directory and load their own context via each skill's `## Context` section.

---

## Personal, Maddie

*Load when: discussing Maddie's role, scope, working style, or anything personal.*

- [[Maddie]] — who Maddie is, role, scope, working preferences, tech comfort, ambitions

---

## Contacts

*Load when: drafting any email, Slack, or message; looking up a Fade Group colleague's address; needing to know who's who across the three brands.*

- [[Contacts]] — Fade Group employees only. Directors (Tom, Harry, Claire), Marketing (Maddie), Stride clinical staff (Wendy, Helen, Aaron), F&E therapists (Lynda + 7 others). Ambassadors, external contractors (Mark Hudson, Luke, Jason), and external professionals (James, Kash, Tanya, Britt) are deliberately out of scope.

---

## Understanding the OS

*Load when: Maddie asks how something works, or wants to evolve the OS. Educational, not operational.*

- [[How Your OS Works]] — plain-English guide to the OS architecture, layers, severity model, how to evolve it

---

## Onboarding (always available, especially first week)

*Load when: Maddie asks "what do I say for X", "cheat sheet", "first week", "what should I do today". The canonical reference for OS triggers and first-week tasks. The Teach skill routes here for phrase-lookup and orientation questions.*

- [[Daily Cheat Sheet]] — the cheat sheet of all OS triggers grouped by job-to-be-done. Living .md version of `Assets/Maddie OS Daily Cheat Sheet.docx` (also printed as PDF for desk pinning). Edit this file as triggers evolve; the printable artifact regenerates from here.
- [[Your First Week]] — Mon-to-Fri task list for Maddie's first week using the OS. One job per day, each ~5 to 20 minutes, end-to-end coverage by Friday. Living .md version of `Assets/Maddie OS Your First Week.docx`.
- [[Using the Terminal]] — plain-English explainer of what the terminal is, how to open it on the right-hand side of Claude Code, how to paste a command and run it, what to do if something looks wrong, and anti-panic notes. For the (rare) moments Maddie has to run something on her Mac directly. Loaded by [[Teach]] on triggers like "terminal", "how do I open the terminal", "how do I run a command".
- [[Model Routing]] — which Claude model (Opus / Sonnet / Haiku) to use for which skill on the Pro plan. Sonnet default, Opus for 5 heavyweight skills (Campaign Brief Expander, Critique, Grill Me, Difficult Conversation Prep, Audience Persona Builder), Haiku for mechanical jobs. The 5 heavyweight skills also surface a one-line model check at firing time. Loaded by [[Teach]] on triggers like "which model", "model routing", "model help".

---

## Fade Group

*Load when: any group-level work, cross-brand strategy, ownership questions.*

- [[Fade Group]] — group overview, businesses, key people (Tom, Harry, Maddie, Lynda, Mark, Luke, Jason, Katie)

---

## Active Brands

| Brand | Status | Brain File |
|---|---|---|
| Fade Golf | Active | [[Fade Golf]] |
| Stride Clinics | Active | [[Stride Clinics]] |
| Fire & Earth Leamington | Active | [[Fire & Earth Leamington]] |

---

## Brand Voices (text tone)

*Load when: drafting copy for a specific brand and need the voice locked.*

- [[Fade Golf voice]]
- [[Stride voice]]
- [[Fire & Earth voice]]

Stubs until the Master Marketing Document work (Wk 2, target lock 28 May 2026).

## Brand Guidelines (visual identity)

*Load when: checking or designing visual assets for a specific brand.*

- [[Brand Guidelines/Fade Golf guidelines]]
- [[Brand Guidelines/Stride guidelines]]
- [[Brand Guidelines/Fire & Earth guidelines]]

Stubs until Master Marketing Document work locks them. Powers [[Visual Brand Check]] Group B (brand adherence). Until locked, Visual Brand Check runs Group A (visual layout) only.

## Document Templates

*Load when: generating a Word/PowerPoint/Excel doc that should match a captured format.*

Located in `Brain/Document Templates/` (analysis) and `Assets/Templates/` (source files).

Templates are captured by [[Document Template]] (Capture mode) when Maddie shows the OS a document she wants future versions to match. Applied automatically when a skill (e.g. [[Campaign Brief Expander]]) offers a Word export at the end.

Current templates: none captured yet. Will populate as Maddie provides samples during build week.

---

## Tech Stack

- [[Tech Stack]] — what tools Maddie uses, what is connected via MCP, what is via CLI, what is manual
- [[Slack Workspace]] — workspace URL, channel IDs, canvas IDs, member IDs for the Fade Group Slack. Used by [[Slack Search]] and any skill that posts to Slack.

---

## Skills

Skills bypass this directory at runtime. Each skill loads its own context. This index lists what exists and what each one does.

**Always-on / dispatched by phrase:**
- [[Daily Briefing]] — morning snapshot. Diary, messages, top 3, weekly checklist, recommendations. Pulls from GitHub at start. Auto-triggers: Diagnostics if >7 days stale, Social Trends Watch if >30 days stale. Surfaces install-onboarding P1 gaps as top recommendation every morning until cleared.
- [[Voice Notes]] — solo recording capture and routing into idea files per brand. *(Stub, waiting on recording software decision.)*
- [[Social Trends Watch]] — monthly research on what is working across the three brand verticals (clinical/health, golf/sport, wellness). Feeds Campaign Brief Expander's creative direction.

**Strategy and audience:**
- [[Audience Persona Builder]] — build/refresh a persona file for a brand+service combo. Maddie-first input, Quick Research triangulation. Saves to `Brain/Audiences/[Brand]/[Service].md`.

**Quality (pre-publish gates):**
- [[Pre-publish Check]] — **orchestrator**. Maddie says "check this" or "review this", the OS runs all three quality skills on the appropriate input parts and gives one combined verdict. Default entry point for finished assets.
- [[Proofread]] — UK English spelling, grammar, punctuation. Accepts pasted text, file paths, or images. Specific edits, not rewrites. Enforces the no-em-dash hard rule.
- [[Tone Check]] — does this draft match the brand voice? Pass/drift/fail with specific edits. Flags stub voices instead of false confidence.
- [[Visual Brand Check]] — visual layout + brand adherence on design assets (Canva exports, screenshots, leaflet PDFs). Group A (layout) always available, Group B (brand adherence) needs Brand Guidelines locked. Honest confidence levels on every finding.

For external comms: use [[Pre-publish Check]]. For in-flight drafting: use individual skills.

**Creative content:**
- [[Campaign Brief Expander]] — feed a campaign concept, audience, deadline; get a per-platform plan with vibe, post types, dates, Google Ads angle, risks.
- [[Cross-Platform Repurposer]] — take one post, get platform-appropriate variants for Facebook, Instagram, TikTok, and Google Ads. *(Stub, waiting on scheduling software decision.)*

**Production briefs:**
- [[Filming Brief Generator]] — for any shoot (Luke + Jason, Run Club, F&E). Shotlist, sequence, talking points (not scripts), B-roll, sound notes, post-production direction. Output saved to `Information/Filming Briefs/`. Talent release drafts saved to `Information/Talent Releases/Drafts/`, signed copies to `/Signed/`.
- [[Talent Ambassador Brief]] — when talent posts from their own account on the brand's behalf. Plain-language one-pager with example caption, hashtag direction, things-to-avoid.

**Paid media:**
- [[Google Ads Variation Generator]] — 10 headlines (≤30 chars) + 4 descriptions (≤90 chars) + negatives, distributed across 3+ angle clusters.
- [[Google Ads Keyword Builder]] — keyword list with intent grouping (transactional/solution/informational), budget-gated, match types per group, layered negatives.
- [[Landing Page Brief]] — per-service page brief: headline, sub-head, sections, CTAs, trust signals, FAQ, technical notes.

**Analytics and reporting:**
- [[Data Pull]] — gather analytics across Metricool, Google Ads, Google Search Console; output a clean numbers table. *(Stub, waiting on Metricool MCP setup.)*
- [[Weekly Slack Report Draft]] — Slack-formatted weekly marketing report. Maddie's voice for the team channel.
- [[Monthly Report Draft]] — longer-form written monthly report for Tom + Harry. Honest, forward-looking.

**Stakeholder:**
- [[Meeting Prep Brief]] — pre-meeting one-pager: last time, open actions, topics to raise, suggested agenda with timings, one thing to remember.

**Document handling:**
- [[Document Template]] — capture, apply, and convert document formats. Three modes: Capture (analyse a Word/PowerPoint/Excel/PDF and save as reusable template), Apply (generate a new doc using a saved template + new content), Convert (PDF → Word). Routes to the right Anthropic skill per file type.

**Setup and self-care (mostly autonomous):**
- [[Install]] — first-time setup and repair tool. Idempotent. Walks through every connection step by step. Re-run any time something is broken.
- [[Diagnostics]] — weekly health check (auto-triggered by Daily Briefing). Tests every connection and every skill, self-fixes what it can, surfaces what it cannot with three-way choice (try yourself / escalate / defer).
- [[Learning]] — one-off Brain bootstrap. Fires once on install (clears P1 minimum bar), or on a complete reinstall. NOT periodic. After install, Brain grows via the Live Brain Update rule in [[Instructions]] — facts captured live during conversations.

**Session lifecycle:**
- [[Session End]] — updates Status.md, Tasks.md, daily log, pushes to GitHub.
- [[Continuation Note]] — save a structured note when parking work mid-task; resume from it in a fresh session.

**Learning the OS:**
- [[Teach]] — interactive help skill. Maddie says `/help`, "how do I X", or "what's the skill for Y". Five modes (Overview / Phrase Lookup / Drill-Down / Troubleshoot / Escalate). Reads actual skill files at runtime so it stays in sync as the OS evolves. Biases toward demoing over describing.

**Thinking partner and review:**
- [[Grill Me]] — critically pressure-tests plans, briefs, or decisions before they go out. Light/Standard/Deep depth tiers, pre-mortem mandatory at Standard+. Use BEFORE the work is finished.
- [[Critique]] — 4-agent iterative chain (Structure → Clarity → Brutal Critic → Accuracy) for finished deliverables. Use AFTER the work is finished, before it ships.
- [[Difficult Conversation Prep]] — full conversation plan for tough talks (pushing back to Tom or Harry, holding ambassadors / suppliers to account, delivering bad news). Includes Receiving Mode for when she's on the receiving end.

**Writing and research:**
- [[Draft Text]] — draft messages (email / Slack / WhatsApp / LinkedIn) in Maddie's voice with tone matched to recipient and channel. Built-in learning loop.
- [[Quick Research]] — on-demand research across multiple sources. Quick / Comparison / Deep Dive depths. WebSearch-dependent, no memory fallback.
- [[Slack Search]] — read-only search across the Fade Group Slack workspace. Returns grouped results with permalinks and a Bottom Line. Use [[Draft Text]] to send.

---

## Brand Notes (quick reference)

For deeper context, load the relevant Brand Brain file.

- **Fade Golf** — premium golf brand. Luke = new face-of-Fade angle. Filming with Jason on swing/membership. AI-built website live.
- **Stride Clinics** — clinical/health. Multi-service (podiatry, sports massage, orthotics). Mark on technical (Google tag, WordPress). Per-service Google Ads restructure incoming.
- **Fire & Earth Leamington** — wellness/retreat-feel coworking. Lynda operational. Smaller marketing footprint.

---

## Maintenance Rules

Every structural change to the OS must be reflected here in real time.

**What triggers an update:**
- Brain file created, renamed, moved, deleted
- Skill created, renamed, replaced, deleted
- Brand added, archived, status changed
- Reference doc added or removed

**How to update:**
- Add new entries under the correct section with a one-line description
- Remove dead entries
- Update paths and descriptions when files move
- Update the "Last updated" timestamp whenever any change is made

**Anti-patterns:**
- Do not batch updates to session end. Update now.
- Do not leave stale entries. Renamed file with old name still listed is worse than missing entry.

---

## Admin tier (intentionally NOT indexed in detail)

`Reviews/OS Health/` exists in the project but is NOT pointed at by any skill in this directory. Maddie can read it if she chooses, but no Brain file references it operationally. This is the privacy boundary between user tier and admin tier. Tom reads OS Health via his own admin skills on his Mac.
