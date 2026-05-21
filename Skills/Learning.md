# Skill: Learning

---
triggers:
  - "/learning"
  - "learning"
  - "audit my OS"
  - "what is missing"
  - "learn from me"
  - "brain audit"
type: Audit
---

**Purpose:** One-off Brain bootstrap. Reads every Brain file, identifies what is missing, asks Maddie targeted questions to fill the gaps, updates the Brain in real time. Runs once on install (initial bootstrap to clear the P1 minimum bar) and only re-runs if the OS is fully reinstalled or if Maddie chooses to re-audit the whole Brain manually.

**This is NOT a periodic skill.** Ongoing Brain updates happen on the job via the Live Brain Update rule in [[Instructions]]. Any time Maddie tells the OS a Brain-level fact during normal work (a new colour, a new reference post, an audience insight, a tool change), the relevant Brain file is updated immediately. The big-audit format here is for the install-cold-start case only, where the Brain is mostly empty and a structured pass is faster than catching gaps one by one.

**Educational by design:** every question explains what it is asking and why, so Maddie understands the Brain's structure as it grows and could maintain it herself if she wanted to.

---

## Context

*Load these files before running this skill:*

- Every file in `Brain/` (this skill specifically reads the full Brain)
- [[How Your OS Works]] for educational framing
- `.last-learning-run` for state and deferred items
- The Master Marketing Document (in Google Drive, if accessible via Drive MCP) for brand voice + audience context

---

## Quick Start

Two legitimate entry paths:

1. **Install bootstrap.** Install Step 13 fires `/learning` on first run. Goal here is to clear the P1 minimum bar (see [[Install]] Step 13a for the bar definition) so skills produce useful output rather than generic. Maddie can park items beyond P1, those get filled live on the job after install.

2. **Complete reinstall or manual full audit.** Maddie can call `/learning` directly any time she wants a structured pass over the whole Brain, but this is rare. Day to day, the OS picks up Brain changes via the Live Brain Update rule in [[Instructions]].

**Not entered via:** monthly cadence, Daily Briefing recommendation, time-based auto-trigger. Those were removed.

---

## /goal integration

Set at start:

```
/goal every Brain file has all required sections populated OR explicitly marked as deliberate stub with reason, AND each of the 3 brand voices has 3+ reference posts logged OR voice is locked as final, AND each active audience persona has primary + secondary + watering holes filled OR marked as deferred with reason, AND `.last-learning-run` is updated. Stop after Maddie says 'park the rest' or after 30 turns.
```

---

## Audit Targets (per Brain file type)

Required sections per Brain file type are listed in [[learning-audit-targets]]. Covers Brain/Maddie.md, Brain/Fade Group.md, the 3 Brand files, the 3 Brand Voice files, the 3 Brand Guidelines files, on-demand Audience files, and Brain/Tech Stack.md. Brand Guidelines feed [[Visual Brand Check]] Group B; until locked, Visual Brand Check runs Group A only.

---

## Process

### 1. Read state and last-audit

```bash
cat .last-learning-run 2>/dev/null
```

Expected schema (after first run):
```json
{
  "last_run": "2026-06-15T10:30:00Z",
  "gaps_closed_total": 14,
  "gaps_deferred": [
    {"file": "Brain/Audiences/Fade Golf/Membership.md", "section": "Primary persona", "reason": "Maddie wants to talk to Luke first, defer to July"},
    ...
  ]
}
```

Use the deferred list to know what to re-ask vs skip.

### 2. Read all Brain files and identify gaps

For each file in `Brain/`:

```python
# pseudocode
file_contents = read(file)
required_sections = lookup_template(file)
gaps = []
for section in required_sections:
    if section not in file_contents:
        gaps.append((file, section, "missing"))
    elif is_stub(file_contents, section):
        gaps.append((file, section, "stub"))
    elif is_stale(file, section):
        gaps.append((file, section, "stale"))
```

**Stub detection:** look for placeholder markers like `(to be filled)`, `(placeholder)`, `STATUS: Stub`, empty bullets `- ` at the end of a section, or a section heading with no content below it.

**Stale detection:** Brain file last commit older than 90 days, AND the file's brand/service is in an active campaign per Tasks.md.

### 3. Prioritise the gap list

The P1 list **changes depending on trigger context**. Detect first:

- **Bootstrap mode** (this is the first Learning run, fired by [[Install]] Step 13 OR `.install-state.json` shows `install_state = complete-with-onboarding-in-progress`): use the bootstrap P1 list below. This list mirrors the [[Install]] P1 minimum bar verbatim, so closing it flips install state to `complete`.
- **Post-bootstrap mode** (manual re-audit, or complete-reinstall): use the post-bootstrap P1 list below. The lock-date logic applies here.

**Bootstrap P1 list** (matches Install Step 13a minimum bar):
- `Brain/Maddie.md`: Role, Working Style, Scope sections populated (not stub)
- `Brain/Fade Group.md`: In Scope / Out of Scope, Strategic Direction populated
- Each of the 3 brand Brain files: Brand summary, primary audience headline, current marketing focus populated
- Each of the 3 brand voice files: Tone section populated (Vocabulary Use/Avoid + Reference Posts can be P2 here, Tone is the bootstrap blocker)
- Each of the 3 brand guidelines files: Colour palette populated (typography + logo rules can be P2 here)
- `Brain/Tech Stack.md`: Connected MCPs section populated

**Post-bootstrap P1 list** (date-aware, fires only after Maddie has cleared bootstrap):
- Brand voice file whose Tone section is stub or missing past 28 May lock date (blocks Tone Check confidence, blocks Campaign Brief Expander voice-match)
- Brand guidelines colour palette empty past 28 May lock date (blocks Visual Brand Check Group B)
- Active service has no audience persona file at all (blocks Campaign Brief Expander + Google Ads Keyword Builder + Landing Page Brief)

**P2 (blocks specific skill outputs, both modes):**
- Audience persona has primary but no watering holes or search terms
- Brand voice has tone but no reference posts (Tone Check downgrades Pass to Provisional Pass when Reference Posts empty)
- Brand guidelines have palette but no logo rules or reference assets
- Brand Brain file has empty Channels section

**P3 (cosmetic / completeness, both modes):**
- Working Style section thin on a person Brain file
- Open Threads section out of date but skill still works

Process in priority order. Stop when Maddie says "park the rest".

### 4. Ask Maddie, one gap at a time

Each question uses this exact format:

```
**[Gap title, in plain English]**

**What this is:** [one sentence on what the section is for, in Maddie's vocabulary, no marketing jargon]
**Why it matters:** [one sentence on what works better when this is filled in, naming a specific skill if applicable]
**Current state:** empty / stub / stale / missing examples

**My question:** [a specific, answerable question, NEVER an open prompt like "tell me about X"]

**Optional context I have so far:** [if there is anything in the file already, show it so she does not repeat]
```

After Maddie answers:
- Confirm understanding ("Just to check, that means [paraphrase]. Right?")
- If she confirms, write to the relevant Brain file in the correct section
- If she says "no, that's not quite right", ask the follow-up
- Move to the next gap

### 5. Question templates per section type

The 13 question templates (audience persona x2, brand voice x4, brand guidelines x5, brand Brain file x2, Tech Stack x1) live in [[learning-question-templates]]. Each is a specific, answerable question (never an open prompt like "tell me about X"), wrapped at run time in the standard "What this is / Why it matters / Current state" preamble from step 4.

### 6. Pause and park option

Maddie can say "park the rest", "enough for today", "I'm tired", "ask Tom" at any point.

When she does:
- Save deferred gaps to `.last-learning-run` with timestamp + reason
- **In bootstrap mode**: also mirror the parked P1 items into `.install-state.json` `gap_list` so [[Daily Briefing]] Step 1b's existing install-onboarding-gap surfacer picks them up automatically every morning until cleared. This uses the canonical Daily Briefing hook rather than introducing a separate Learning surfacer.
- **In post-bootstrap mode**: parked items live in `.last-learning-run` only; they do not auto-surface. Per the rescoping ([[Learning]] is no longer periodic), the OS does not nag about post-bootstrap parked items, Maddie chooses when to re-run a manual audit.
- Tell her how many gaps closed vs deferred

### 7. Update state

```bash
cat > .last-learning-run <<EOF
{
  "last_run": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "gaps_closed_this_run": [N],
  "gaps_deferred": [list with reasons]
}
EOF
```

### 8. Commit Brain changes + state file

```bash
# Defensive guard: only commit if we are inside a git work tree.
if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
  git add Brain/ .last-learning-run
  # Also stage the install-state file if bootstrap mode wrote parked items into it (Step 6).
  [ -f .install-state.json ] && git add .install-state.json
  git commit -m "[learning] $(date -u +%Y-%m-%d) Brain audit, [N] gaps closed, [M] deferred"
  # Use tracking branch rather than hard-coded `origin main` so master / feature branches also work.
  if ! git push 2>/dev/null; then
    echo "(push failed, commit local only; OS Health logged 'commit deferred to next session')"
  fi
else
  echo "(git repo not yet initialised, Brain + state changes saved locally only)"
fi
```

Push failure or no-repo state is logged to OS Health (Step 9) but does not fail the Learning run. The Brain updates Maddie just made are the value, the commit is housekeeping. Mirrors the same resilience pattern as [[Session End]] L1/L2/L4 and [[Social Trends Watch]] Step 6.

### 9. Write to OS Health

```markdown
### YYYY-MM-DD HH:MM, Learning Run

**Goal status:** met / partial / parked early
**Duration:** Xm Ys
**Trigger:** automatic (Daily Briefing recommendation) / manual / Install bootstrap
**Gaps closed:** [count]
**Gaps deferred:** [count, listed with files only, not the question content]
**Brain files updated:** [list of file paths, not content]

**Trend:** [if Maddie keeps deferring the same section, surface it for Tom: "Stride orthotic persona deferred 3 runs in a row"]
```

**Privacy rule:** OS Health entries contain metadata only. NEVER Maddie's answers or the Brain content she added. File paths and counts only.

### 10. Tell Maddie the result

One sentence:
> Brain audit complete. [N] gaps closed, [M] deferred to next month. Brain coverage now at [%]. Next Learning run will pick up the deferred items.

If she parked early, additionally:
> The 2 P1 gaps you parked ([file 1], [file 2]) will surface in your Monday briefing as a reminder. No pressure to do them this week.

---

## Worked example flow

Full Stride-voice question + park-the-rest exit example is in [[learning-worked-example]]. Shows how the skill confirms understanding before writing, clusters patterns from multiple posts, and gracefully exits when Maddie runs out of time.

---

## Educational mode

Every question Learning asks comes with the "What this is / Why it matters / Current state" preamble. Over time Maddie internalises:
- WHY the Brain has separate voice and audience files (different skills need different things)
- WHY personas live per service not per brand (each service has different ideal-customer dynamics)
- WHY reference posts are anchors not rules (LLM output is fuzzy, anchors give it traction)

Within 2 to 3 Learning runs Maddie understands her OS well enough that she could draft a new section herself if she wanted to. After that, the OS becomes a tool she shapes, not a tool that shapes her.

---

## Anti-patterns

- Asking open prompts ("tell me about Stride") instead of specific answerable questions
- Skipping the "what this is / why it matters" framing because the skill is in a hurry
- Writing to a Brain file without confirming with Maddie first
- Pressuring Maddie to finish when she wants to park
- Logging her answers to OS Health (privacy boundary)
- Asking the same question Maddie deferred last month without acknowledging the prior defer

---

## Rules

- One question at a time. NEVER batch.
- Always explain what + why before asking.
- Always confirm her answer before writing it to a Brain file.
- Park is always an option. Do not pressure her to finish.
- Privacy boundary holds: only metadata to OS Health, never her answers.
- No em or en dashes.
- If she defers the same P1 gap 3 runs in a row, escalate to Tom via OS Health.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-18 | Skill stub created during scaffold. /goal integration, educational mode, Brain freshness audit. |
| 2026-05-19 | Full implementation: audit target templates per Brain file type, prioritisation algorithm, 9 question templates with exact wording, worked example flow, defer-with-reason state schema, OS Health metadata-only entry template. |
| 2026-05-19 | Added Brand Guidelines audit target (3 files) + 5 new question templates (colour palette, typography, logo, imagery style, reference assets). Prioritisation updated: stub guidelines colour palette past lock date is P1. Maddie will now be prompted to fill Brand Guidelines during Learning runs, same flow as brand voices. |
| 2026-05-20 | **Scope narrowed: Learning is now install-bootstrap + complete-reinstall only, not periodic.** Tom's decision: after the initial install bootstrap clears the P1 bar, the OS adapts on the job via the Live Brain Update rule in Instructions.md (e.g. Maddie says "the Fade Golf primary colour is now #2A5D3F" mid-conversation, OS updates Brand Guidelines straight away). Removed monthly framing, removed Daily Briefing >30 day auto-recommend. Question templates and process logic stay intact for the legitimate bootstrap/reinstall use case. |
| 2026-05-21 | **Guide extraction pass.** Skill at 477 lines was carrying three reference-heavy blocks that didn't need to load with the workflow. Extracted the 7 Brain-file audit target templates to [[learning-audit-targets]], the 13 question templates to [[learning-question-templates]], and the worked example flow to [[learning-worked-example]]. Skill body now links to each rather than embedding. No content lost, no rules changed. Skill body now ~245 lines (workflow + rules + anti-patterns + changelog). |
| 2026-05-21 | **Cold-tested as Maddie (P2 #7).** Scenario: Install Step 13 fires `/learning` on 21 May during bootstrap, Brain mostly skeleton, `.last-learning-run` does not exist yet. 4 edits applied. (1) Step 3 prioritisation split into **bootstrap mode** vs **post-bootstrap mode** P1 lists. Bootstrap P1 mirrors [[Install]] Step 13a minimum bar verbatim (Maddie.md Role/Working Style/Scope, Fade Group.md In/Out scope + Strategic Direction, brand Brain summaries + audience headlines + marketing focus, voice Tone sections, guidelines colour palettes, Tech Stack Connected MCPs), so closing the list flips install state to `complete`. Post-bootstrap P1 keeps the 28-May-lock-date logic. This fixes the install-window dead spot where the date-conditional P1 list was functionally empty during bootstrap (Learning fired with no P1 work to do, while Install's P1 bar was genuinely unmet). (2) Step 6 cross-skill claim about Daily Briefing made concrete: in bootstrap mode, parked P1 items are mirrored into `.install-state.json` `gap_list` so Daily Briefing 1b's existing install-onboarding-gap surfacer picks them up. In post-bootstrap mode (manual audit), parked items live in `.last-learning-run` only and do not auto-surface, per the rescoping (no monthly cadence, no auto-recommend). Stops the orphaned "Daily Briefing surfaces parked items" promise that had no implementation. (3) Step 8 git commit gained `git rev-parse --is-inside-work-tree` defensive guard, push-failure fallback (log "commit deferred" to OS Health, continue), no-repo install-window path (skip commit silently). Matches the resilience pattern in [[Session End]] L1/L2/L4 and [[Social Trends Watch]] Step 6. (4) Step 8 `git push origin main` changed to plain `git push` to respect tracking branch (master / feature branches also work without breakage). Brain updates are the value; commit is housekeeping. |
