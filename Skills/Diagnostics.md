# Skill: Diagnostics

---
triggers:
  - "/diagnostics"
  - "diagnostics"
  - "check the OS"
  - "is the OS working"
  - "run a health check"
  - "OS health"
type: Health Check
---

**Purpose:** End-to-end health check of the OS. Tests every MCP connection, runs logic checks on every skill against synthetic fixtures, attempts self-fix on anything broken, escalates the rest to Maddie in plain English with three options. Writes a hidden OS Health entry for Tom's admin review.

Fires automatically from [[Daily Briefing]] if `.last-diagnostics-run` is more than 7 days old. Available on-demand any time.

---

## Context

*Load these files before running this skill:*

- [[Tech Stack]] for which connections to test
- [[How Your OS Works]] for educational explanations
- `.install-state.json` for what was supposed to be working
- `Test/scenarios/` for synthetic fixtures
- Optionally: pull `Skills/OS Admin/fix-library.md` from Tom OS via gh raw API (cached locally, fall back to local if unreachable)

---

## Quick Start

Maddie says any trigger above, OR Daily Briefing fires it automatically when stale.

---

## /goal integration

Set at start:

```
/goal every Stage 1 connection test and Stage 2 logic check returns pass OR has a corresponding entry in the escalation block, AND every L1/L2 issue has been auto-fixed and logged, AND `.last-diagnostics-run` is updated with timestamp, AND OS Health entry written. Stop after 12 turns if not met.
```

---

## Severity Taxonomy

| Tier | Examples | Auto-fix? | Maddie sees? | Tom sees? |
|---|---|---|---|---|
| **L1 routine** | Token refresh, MCP reconnect after sleep, stale cache rebuild | Yes, silent | No | OS Health log |
| **L2 patch** | Config drift, skill stub flagged past lock date, dependency reload | Yes, logged | No | OS Health log, marked visible |
| **L3 flag** | Recurring failure after auto-fix, MCP returning bad data, Brain gap blocking a skill | Attempt fix once, surface to Maddie with three-way choice | Yes, inline plain-English | OS Health log, flagged |
| **L4 freeze** | Git conflict, GitHub auth failure, destructive action attempted, integrity violation | Never auto-fix | Yes, immediate notice | **Immediate Slack ping** |

---

## Stage 1: Connection Tests

Run in this order. Each test has a specific bash command, an expected output shape, and a tier-by-failure-mode.

### Test 1.1 Git pull/push reachability
```bash
cd "$HOME/Documents/Maddie OS"
git fetch --dry-run origin main 2>&1
```
**Pass:** exit 0, no error output.
**Fail-mode discrimination (parse the error output):**
- Contains `Authentication failed` or `Permission denied` or `403` → **L4** (auth broken, do not auto-fix).
- Contains `Repository not found` or `does not appear to be a git repository` → **L4** (repo missing or local checkout broken).
- Contains `Could not resolve host` or `Connection refused` or `Operation timed out` → **L1** transient network. Wait 2 seconds, re-test once. If second attempt passes, log L1 silent. If second attempt also fails, escalate to **L3** (network may be down).
- Any other error → **L3** (unrecognised pattern, surface to Maddie with the raw error for Tom to read).

### Test 1.2 `gh` CLI auth
```bash
command -v gh >/dev/null 2>&1 || { echo "gh-not-installed"; exit 0; }
gh auth status 2>&1
```
**Pass:** output contains "Logged in to github.com".
**Pre-check fail:** if first line returns `gh-not-installed`, mark this test `deferred` with reason "gh CLI not installed (Install Phase 2 dependency)". Not L3. Recovery: run /install.
**Fail tier:** L3 if installed but not logged in (token may have expired). Self-fix: prompt re-login via `gh auth login`.

### Pre-check for Tests 1.3 to 1.6: MCP installed in config

Before any MCP call test, check the relevant MCP is registered in `~/Library/Application Support/Claude/claude_desktop_config.json` (or `~/.claude/settings.json` for Claude Code surface):

```bash
jq -e '.mcpServers["workspace-mcp-maddie"]' ~/Library/Application\ Support/Claude/claude_desktop_config.json >/dev/null 2>&1 \
  && echo "workspace-installed" || echo "workspace-missing"
jq -e '.mcpServers["slack"]' ~/Library/Application\ Support/Claude/claude_desktop_config.json >/dev/null 2>&1 \
  && echo "slack-installed" || echo "slack-missing"
```

If an MCP is `missing`, mark each dependent test below as `deferred` with reason "MCP not installed (Install Phase 2 dependency)". Do NOT count as L3 failure. Recovery: run /install. Only run the actual MCP-call tests when the config entry exists.

### Test 1.3 Google Workspace MCP, Gmail
Internal MCP call: list 1 email from `marketing@fadegroup.uk`.
**Pre-check fail:** workspace MCP missing in config → deferred (see above).
**Pass:** at least 1 email returned with sane shape (has subject, from, date).
**Fail tier:** L1 if token expired (auto-refresh and re-test). L3 if MCP not responding (restart Claude Code is the fix). L3 if returning empty when inbox is known not to be empty (re-auth flow).

### Test 1.4 Google Workspace MCP, Calendar
Internal MCP call: list today's calendar events.
**Pre-check fail:** workspace MCP missing in config → deferred.
**Pass:** returns event list (empty list is OK if Maddie has no events today).
**Fail tier:** L1 / L3 same pattern as 1.3.

### Test 1.5 Google Workspace MCP, Drive
Internal MCP call: list 1 file in `My Drive` root.
**Pre-check fail:** workspace MCP missing in config → deferred.
**Pass:** returns at least 1 file.
**Fail tier:** L1 / L3 same pattern.

### Test 1.6 Slack MCP
Internal MCP call: read the latest message from `#leadership` (channel ID `C0AUUAU158T`).
**Pre-check fail:** slack MCP missing in config → deferred.
**Pass:** returns a message with sane shape.
**Fail tier:** L1 if token (Slack tokens rarely expire but worth catching). L3 if MCP not responding. L3 if workspace context wrong.

### Test 1.7 Metricool MCP (if installed)
Check `~/Library/Application Support/Claude/claude_desktop_config.json` for `metricool-maddie` entry. If absent, mark this test `deferred` (Metricool not yet set up).
If present:
Internal MCP call: pull last 7 days of stats for one brand.
**Pass:** returns numbers.
**Fail tier:** L3 if returning errors. L2 if brand-not-found (OAuth may need refresh).

### Test 1.8 Disk space
```bash
df -h "$HOME/Documents" | awk 'NR==2 {print $5}' | tr -d '%'
```
**Pass:** value < 90.
**Fail tier:** L3 if 90 to 95%. L4 if > 95% (filesystem could run out mid-write, refuse to push).

### Test 1.9 Repo size sanity
```bash
du -sh "$HOME/Documents/Maddie OS/.git" | awk '{print $1}'
```
**Pass:** under 500 MB (sane for a markdown-only repo).
**Fail tier:** L3 if 500 MB to 1 GB (something unexpected being tracked, investigate). L4 if > 1 GB (binary committed by accident, do not auto-fix).

---

## Stage 2: Logic Tests (synthetic fixtures)

For each skill, run the scenario from `Test/scenarios/[skill name].md` against the fixtures in `Test/fixtures/`. Check output against shape assertions per skill.

**Pre-check (before every skill below):** if any of the three files (scenario, fixture, expected) does not exist for this skill, mark the test `deferred` with reason "fixtures not yet authored" and skip. Do NOT count as L3 failure. Fixtures are authored on a schedule (see `Test/README.md` for the calendar); missing fixtures during the build window is the expected state, not a fault. Aggregate the deferred count in Stage 7's OS Health entry separately from pass/fail counts.

Full per-skill assertion list for all 18 skills (2.1 Daily Briefing through 2.18 Monthly Report Draft) is in [[stage-2-skill-assertions]]. Load it when running this stage and check each skill's output against its assertions.

---

## Stage 3: Brain Freshness Check

For each Brain file, check:

```bash
git log -1 --format=%ct "Brain/[file].md"
```

- Last-update timestamp older than 90 days for an active file → L2 (stale)
- Stub markers (`STATUS: Stub`) past their lock date → L3 (blocks dependent skills)
- Required sections missing per template → L2 (cosmetic) or L3 (if a skill depends on the missing section)

Brand voice stubs past 28 May lock date are escalated to L3 with a specific message:
> "[Brand] voice is still a stub past its 28 May lock date. This means Campaign Brief Expander and Cross-Platform Repurposer outputs are best-guess until the Master Marketing Document lock lands. Want to run /learning to begin filling the voice file now, or escalate to Tom?"

---

## Stage 4: Self-Fix Pass

For every L1 and L2 issue surfaced:

### Self-fix routines (L1)

**MCP token refresh:**
- Most MCPs auto-refresh tokens. If a connection test fails with auth error, attempt one re-call after a 2-second delay.
- If success, log `L1 auto-fixed: token refresh, [MCP]` to OS Health.

**Claude Code restart needed:**
- If MCP-not-responding is detected, write a marker file `.claude-restart-needed` and surface to Maddie: "Restart Claude Code. The [MCP] needs a fresh connection." Plain L2, not L3.

**Stale state file:**
- If `.last-diagnostics-run` is malformed JSON, recreate it from scratch. L1 silent.

### Cross-reference fix-library

For any L2 or L3 issue not in the L1 routines above:

```bash
# Fetch the latest fix-library from Tom OS (read-only, no clone)
gh api \
  -H "Accept: application/vnd.github.raw" \
  /repos/tomoliphant/tom-os/contents/Skills/OS%20Admin/fix-library.md \
  > /tmp/fix-library-cache.md 2>/dev/null
```

If fetch succeeds, search the cached library for a pattern matching the current issue's signature. If match found with `Auto-apply allowed: Yes`, attempt the documented fix. Log the pattern ID to OS Health.

If fetch fails (network, auth), continue with the locally-cached version if one exists, OR skip the library lookup and continue.

### Re-test after fix

Re-run the failing test. If pass, mark fixed. If still failing, escalate per the tier.

---

## Stage 5: L3 Escalation to Maddie

For each unfixable L3 issue, surface inline with this exact structure:

```
**[Issue title in plain English]**

**What this is:** [one sentence explaining what the thing is, in Maddie's vocabulary]
**What is wrong:** [one sentence in plain English, no jargon]
**Why it matters:** [one sentence on what stops working if this stays broken]

What would you like to do?

**A) Try to fix it yourself.** I will walk you through it one step at a time and test after each step. Takes [estimated time].

**B) Escalate to Tom.** I will draft a Slack message to him with everything he needs and you just hit send.

**C) Defer.** Skip for now, I will retry on next Diagnostics run.
```

### If Maddie picks A (try-it-yourself walkthrough)

Switch to step-by-step educational fix mode:
1. One micro-step at a time
2. Plain English: what the step does, what to type/click, what the expected outcome is
3. Test after each step
4. If she gets stuck on any step, offer to switch to B
5. After fix, re-run the originally failing test to verify

### If Maddie picks B (escalate to Tom)

Draft Slack message including:
- Issue title
- What was tried (self-fix steps attempted)
- Error log (if technical)
- What Tom needs to look at on his side

Show Maddie the draft, she clicks "send" or edits. The OS does not auto-send.

### If Maddie picks C (defer)

- Log to OS Health as deferred with timestamp
- Diagnostics retries next run
- If deferred 3 times in a row, escalate the deferral itself to Tom: "L3 issue X deferred 3 weeks running, worth a look?"

---

## Stage 6: L4 Immediate Action

For L4 freezes:

1. **Stop immediately.** Do not attempt any fix. Do not modify any file.
2. **Show Maddie a notice:**
   ```
   ⚠ [Issue title]

   I am not touching this because it could cause data loss. Tom has been notified automatically. Carry on with anything else, this will be fixed when Tom is online.
   ```
3. **Auto-Slack-ping Tom** with:
   ```
   [L4 FREEZE, Maddie OS Diagnostics]
   Issue: [issue title]
   Surfaced: [timestamp]
   Maddie was: [what she was doing when this came up, if known]
   Affected: [which skill / connection]
   Local repo state: [output of `git log --oneline -3` and `git status -s`]
   Action needed from Tom: [one-line summary]
   ```
4. **Log to OS Health** with L4 marker.
5. **Continue the rest of Diagnostics** (other tests still run, just skip anything that depends on the frozen item).

---

## Stage 7: Write to OS Health

Append the structured entry to `Reviews/OS Health/current.md`. Full template (fields, format, privacy rule) is in [[os-health-entry-template]].

**Privacy rule (load-bearing, applies here):** OS Health entries contain metadata only. No conversation content, no campaign drafts, no email bodies, no voice note transcripts. Errors and operational state only.

---

## Stage 8: Update state and finish

```bash
# Update state file
cat > .last-diagnostics-run <<EOF
{
  "last_run": "$(date -u +%Y-%m-%dT%H:%M:%SZ)",
  "result": "[met / partial / aborted]",
  "l1_count": [N],
  "l2_count": [N],
  "l3_count": [N],
  "l4_count": [N]
}
EOF
```

Commit and push state file + OS Health update:
```bash
git add .last-diagnostics-run "Reviews/OS Health/current.md"
git commit -m "[diagnostics] $(date -u +%Y-%m-%d) run, [L3 count] flagged, [L4 count] frozen"
git push origin main
```

(Push failure on this commit is itself an L4 → Stage 6.)

### Report to Maddie

If everything was clean:
> All connections healthy, no issues today. OS is working.

If L1/L2 only (auto-fixed):
> Found and fixed [N] small things automatically. OS is working.

If L3 flagged:
> [N] issue(s) surfaced that I could not fix automatically. Here is the first one:
> [L3 escalation block]

If L4 freeze:
> ⚠ I hit a serious problem and have stopped touching the OS. Tom has been notified on Slack. Carry on with anything else, this will be picked up when he is online.

---

## Educational mode (Option A walkthrough)

When Maddie picks A on an L3, every step explains:
1. **What this step does** (in 1 sentence, her vocabulary)
2. **Why** (1 sentence)
3. **What to do** (the action, with exact command/click if relevant)
4. **What you should see if it worked** (the expected outcome to confirm before moving on)

Goal: by the third Option A walkthrough of the same skill type, Maddie can do it without the OS holding her hand.

---

## Rules

- Never write conversation content or work content to OS Health. Metadata only.
- /goal is mandatory for self-completion behaviour.
- L4 always pings Tom immediately. No rate-limiting, no batching.
- L3 always offers all three options. Never push Maddie toward one.
- Option A walkthroughs are educational by design.
- Fix-library is a cache, not a dependency. If unreachable, continue.
- No em or en dashes in any output.

---

## Anti-patterns

- Treating a network blip as L3 (re-test once before escalating)
- Auto-fixing destructive things to "save time"
- Surfacing L1/L2 issues to Maddie because the metadata feels like content
- Burying L3 escalations at the bottom of the briefing
- Letting L4 sit on a log without pinging Tom
- Treating fix-library cache misses as failures (it is a nice-to-have, not blocking)

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-18 | Skill stub created during scaffold. L1-L4 taxonomy, three-way L3 choice, /goal integration, OS Health log writing with privacy boundary. |
| 2026-05-19 | Full implementation: exact bash for 9 connection tests with per-test failure tier, assertion specs for all 18 skill logic tests, self-fix routines + fix-library fetch pattern, three-way L3 escalation with educational Option A, L4 Slack ping format, full OS Health entry template, state file commit pattern. |
| 2026-05-20 | **Skill testing surfaced multiple robustness gaps that would cause spurious L3 escalations during the Phase 2 install window.** Edits applied: (1) Stage 2 now defers tests when fixture/scenario/expected files are missing, instead of failing. Aligns with the build-week timeline where fixtures are authored 20-23 May. (2) Tests 1.3 to 1.6 (Google Workspace + Slack MCPs) gained a pre-check that defers when the MCP is not registered in the Claude Desktop config. Matches the existing Stage 1.7 (Metricool) pattern. (3) Test 1.2 gained a pre-check for `gh` not installed (deferred, not L3). (4) Test 1.1 git fetch fail-mode now parses error output to discriminate L1 (transient network), L3 (unrecognised error), L4 (auth/repo missing) instead of treating all failures the same. (5) Stage 7 OS Health entry template updated to log pass/fail/deferred counts so deferred-during-install is visibly distinct from broken. Tested as Maddie, Wed 20 May, on this build folder. Install dependency carried over from Daily Briefing test still pending. |
| 2026-05-21 | **Guide extraction pass.** Skill had grown to 500 lines. Extracted the Stage 2 per-skill assertion catalogue (~100 lines across 18 skills) to [[stage-2-skill-assertions]] and the Stage 7 OS Health entry template (~30 lines) to [[os-health-entry-template]]. Skill body now links to both rather than embedding. No content lost. Skill body now ~300 lines (procedural stages + rules + anti-patterns + changelog). The Stage 1 connection tests, Stage 4 self-fix routines, Stage 5 L3 escalation flow, Stage 6 L4 immediate action, Stage 8 state file + report, educational mode and rules all stay in the skill body because they are the operational procedure Claude executes. |
