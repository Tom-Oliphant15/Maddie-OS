# Skill: Install

---
triggers:
  - "/install"
  - "install"
  - "set up the OS"
  - "reinstall"
  - "repair the OS"
type: Setup
---

**Purpose:** First-time setup AND repair tool for Maddie's OS. Walks through every connection step by step, tests each before moving on, writes state so re-runs skip what is already working. Idempotent: re-run any time something is broken and the skill picks up from where she is.

**Educational mode:** at every step, explains what the connection is and why it matters in one or two plain sentences, so Maddie understands the OS and can evolve it later.

---

## Context

*Load these files before running this skill:*

- [[Tech Stack]] for which connections to set up
- [[How Your OS Works]] for the educational framing

---

## Quick Start

Maddie says "/install", "install", "set up the OS", "reinstall", "repair the OS".

The skill is idempotent. First run does a full setup. Subsequent runs read the state file and only re-do what is broken or missing.

---

## /goal integration

At the very start, set this goal:

```
/goal every step in .install-state.json shows status "pass" OR "deferred-with-reason", AND a test commit pushed to origin/main returned a success exit code, AND the most recent run of /diagnostics returned no L4 issues. Stop after 25 turns if not met.
```

Claude keeps iterating install steps until the condition holds. The 25-turn cap stops runaway loops.

---

## State File

Lives at project root: `.install-state.json` (committed to git, so Tom can see install progress remotely).

Full schema and step list: [[install-state-file-schema]].

**Status values:** `pending`, `pass`, `fail`, `deferred`.
**On every state change, commit the file** so Tom sees install progress live.

---

## Process

### 0. Read state and confirm with Maddie

```bash
cat .install-state.json 2>/dev/null || echo '{"version":1,"steps":{}}'
```

If file exists with prior pass entries, ask:

> I see you ran Install before, with these steps already passing: [list].
> A) Skip what is already passing and only re-do failures (recommended)
> B) Full reinstall from scratch
> C) Stop, I want to look at the state file first
> Which one?

If file does not exist, create it with all steps `pending` and move on.

---

### 1. Homebrew installed

**Plain English:** "Homebrew is a tool that lets us install command-line apps on your Mac. We need it for `gh` and a couple of small utilities. One-time install, never has to be done again."

**Test:**
```bash
which brew && brew --version
```

**If missing:**
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Then add Homebrew to PATH per the installer's instructions for Apple Silicon Macs:
```bash
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

**Re-test.** Pass when `brew --version` returns a version string.

**Failure (L3):** Use the standard three-way escalation. Most common cause: macOS prompted for password and Maddie missed it. Option A walkthrough re-runs the command and prompts her to enter her Mac password.

---

### 2. `gh` CLI installed

**Plain English:** "The `gh` command is the official GitHub command-line tool. The OS uses it for everything except pushing files (the deploy key handles push and pull)."

**Test:**
```bash
gh --version
```

**If missing:**
```bash
brew install gh
```

**Re-test.** Pass when `gh --version` returns.

---

### 3. Claude Code installed

**Plain English:** "Claude Code is the app this OS runs inside. If you are talking to me, this is already done."

**Test:**
```bash
which claude
```

**If missing:** direct Maddie to download from `https://claude.com/code` and run the installer. Pause Install until she confirms it is installed and re-open Claude Code.

Pass when `claude --version` returns.

---

### 4. GitHub deploy key generated

**Plain English:** "Your laptop needs a unique key the OS's GitHub repo will recognise. Think of it like a hotel key card for one specific room. If your laptop is lost, Tom can deactivate the card remotely in 10 seconds."

**Test:**
```bash
ls -la ~/.ssh/maddie-os-deploy 2>/dev/null
```

**If missing:**
```bash
ssh-keygen -t ed25519 \
  -C "maddie-os-mac-$(date +%Y%m%d)" \
  -f ~/.ssh/maddie-os-deploy \
  -N ""
```
(Empty passphrase. Security comes from key-on-this-machine, not from passphrase.)

**Pass when** both files exist (`~/.ssh/maddie-os-deploy` and `~/.ssh/maddie-os-deploy.pub`).

---

### 5. GitHub deploy key authorised on the repo

**Plain English:** "Now the repo has to accept the key. Tom does this part. After this step, your laptop is on the repo's allow-list."

**Show Maddie the public key:**
```bash
cat ~/.ssh/maddie-os-deploy.pub
```

**Three paths:**

**Path A (Tom in person, fastest):** Maddie reads the public key out (or shows screen). Tom runs on **his** Mac, piping the key content via stdin:

```bash
# Tom's machine. Replace the key block below with what Maddie's machine shows.
pbpaste | gh repo deploy-key add - \
  --repo Tom-Oliphant15/Maddie-OS \
  --title "Maddie MacBook $(date +%Y-%m-%d)" \
  --allow-write
```

(Maddie copies the key, Tom pastes into his terminal via `pbpaste`. The `-` in the gh command reads from stdin.) The previous version of this step pointed at `~/.ssh/maddie-os-deploy.pub` on Maddie's filesystem; that path does not exist on Tom's Mac. The stdin route is the portable form.

**Path B (Tom remote, Slack):** Maddie copies the public key block and pastes into Slack to Tom. Pre-drafted message template:

```
Hey Tom, OS install needs you to add my deploy key to the repo.
Public key below, repo is Tom-Oliphant15/Maddie-OS.

[public key block]

Title suggestion: Maddie MacBook [date].
Let me know when added, I will retry the test.
```

**Path C (Tom unreachable):** Defer this step. Install pauses cleanly. Maddie can re-run Install later when Tom has added the key.

**Test:**
```bash
ssh -i ~/.ssh/maddie-os-deploy -T -o StrictHostKeyChecking=accept-new git@github.com
```
Expected output contains: `Hi Tom-Oliphant15/Maddie-OS!` (or similar repo acknowledgement).

**If test fails:** L3 escalation. Most common cause: Tom has not added the key yet, or added it with read-only access instead of read-write. Walkthrough re-runs the test, then offers Path B again with a tweaked message.

---

### 6. Git clone

**Plain English:** "Now we copy the OS files from GitHub onto your laptop. Once this is done, the OS lives at `~/Documents/Maddie OS/`."

**Pre-clone safety check.** Before cloning, confirm the target folder does not already exist with content we did not put there. The L4 condition for this step is "existing `~/Documents/Maddie OS/` with foreign files"; the check makes that L4 fire deterministically rather than relying on the clone-then-discover-conflict route:

```bash
if [ -d "$HOME/Documents/Maddie OS" ] && [ -n "$(ls -A "$HOME/Documents/Maddie OS" 2>/dev/null)" ]; then
  # Folder exists and non-empty
  if [ ! -f "$HOME/Documents/Maddie OS/Instructions.md" ]; then
    echo "L4: $HOME/Documents/Maddie OS exists and has content but is not our OS, refusing to clobber"
    # Fire L4 freeze handling
  fi
fi
```

**Test:**
```bash
ls "$HOME/Documents/Maddie OS/Instructions.md" 2>/dev/null
```

**If missing, configure SSH to use the deploy key for this repo:**
```bash
mkdir -p ~/.ssh
cat >> ~/.ssh/config <<'EOF'

Host github.com-maddie-os
  HostName github.com
  User git
  IdentityFile ~/.ssh/maddie-os-deploy
  IdentitiesOnly yes
EOF
chmod 600 ~/.ssh/config
```

**Then clone:**
```bash
cd "$HOME/Documents"
git clone git@github.com-maddie-os:Tom-Oliphant15/Maddie-OS.git "Maddie OS"
```

**Pass when** `Instructions.md` exists in the cloned folder.

---

### 7. `gh` CLI authenticated

**Plain English:** "The `gh` tool needs to be logged in to read repo info, see issues, etc. Different from the deploy key in step 4. The deploy key handles file pushing. `gh` handles everything else."

**Test:**
```bash
gh auth status 2>&1 | grep -q "Logged in to github.com"
```

**If missing:**
```bash
gh auth login --hostname github.com --git-protocol ssh --web
```
Walks Maddie through browser-based auth. She needs to use the GitHub account Tom has set up for her (machine account, no personal data).

**If Maddie does not have credentials for the machine account:** L3 escalation to Tom.

---

### 8. Google Workspace MCP

**Plain English:** "This is the OS's connection to Gmail, your calendar, and Google Drive. It is the most useful single connection. We are about to open a Google sign-in page in your browser. Sign in as `marketing@fadegroup.uk` and approve the permissions."

**Config + wrapper script:** apply the Google Workspace block from [[install-mcp-configs]] to `~/.claude/settings.json` under `mcpServers` (this is the **Claude Code** config file, not Claude Desktop's `claude_desktop_config.json`, Maddie OS runs inside Claude Code), and install the launch wrapper if missing (script handles ephemeral-port allocation to avoid the workspace-mcp collision issue documented in Tom's CLAUDE.md).

**Restart Claude Code** (Cmd+Q the app, reopen). Maddie has to do this manually. Install pauses for her confirmation.

**Trigger OAuth flow:** read 1 email as a smoke test.
```
(internal MCP call: list_emails limit=1)
```
First call triggers the browser-based Google sign-in. Maddie completes it.

**Test:** the returned email list has at least 1 entry with sane shape.

**Failure modes:**
- **Wrong Google account in sign-in:** plain-English walkthrough to sign out of Google in the browser and re-trigger. Option A walks her through clearing Chrome/Safari Google login state.
- **Permissions denied:** she clicked Deny instead of Allow. Re-trigger.
- **MCP not responding:** likely the wrapper script failed to bind a port. Check `~/.local/bin/workspace-mcp-launch.sh` is executable. L3 escalation if still failing.

---

### 9. Slack MCP

**Plain English:** "This connection lets the OS read Slack messages and post to channels. You will be asked to sign in to the Fade Group Slack workspace."

**Config + wrapper script + Keychain command:** apply the Slack block from [[install-mcp-configs]] to `~/.claude/settings.json` (config block, wrapper script, and the `security add-generic-password` command to store the OAuth token).

**OAuth flow:** open the Slack OAuth URL in browser, Maddie approves, copy the user token, store in Keychain using the command from [[install-mcp-configs]]. Slack token is never written into the config file in plain text.

**Restart Claude Code.**

**Test:** read the latest message from `#leadership` (channel ID `C0AUUAU158T`).

**Failure modes:** wrong workspace selected, OAuth scope rejected. Plain-English walkthroughs per case.

---

### 10. Metricool MCP

**Plain English:** "Metricool tracks your social media across the three brands (Fade Golf, Stride, Fire & Earth Leamington). This is set up the same day we set up your Metricool account, normally Wed 21 May. If we are pre-Wed, this step is deferred."

**Check if Metricool brands are OAuthed yet:** ask Maddie. If no, mark this step `deferred` with reason "Metricool OAuth scheduled Wed 21 May" and continue. Install will re-fire this step automatically on next run.

**If yes, proceed:** apply the Metricool block from [[install-mcp-configs]] to `~/.claude/settings.json` (config block follows the same wrapper script + Keychain pattern as Slack MCP, token never written to config file).

**Test:** pull 1 brand's last 7 days of stats.

---

### 11. First push to GitHub

**Plain English:** "Last connection step. We commit the current state of your OS and push it back to GitHub. After this, Tom can see your install on his side. Every session end after this happens automatically."

**Test:**
```bash
cd "$HOME/Documents/Maddie OS"
git log --oneline -1
```

**If no commits yet, OR if the last commit is the upstream clone HEAD:**
```bash
git add .install-state.json
git commit -m "[install] First push from Maddie's Mac on $(date -u +%Y-%m-%d), $(scutil --get LocalHostName)"
# Use tracking branch via plain `git push`. Hard-coding `origin main` breaks on
# repos defaulting to master or on feature branches; the tracking branch is set
# up by the clone in Step 6.
git push
```

**Pass when** `git push` returns exit 0 and the remote SHA matches local HEAD.

**Failure:** likely a permission issue on the deploy key (read-only instead of read-write). L3 escalation to Tom with the exact error.

---

### 12. Run Diagnostics for the first time

**Plain English:** "We just installed everything. Now let me run a full health check to confirm it all works end to end."

Fire `/diagnostics` inline. Pass if Diagnostics returns no L4 issues.

Any L3 issues found are surfaced via Diagnostics's normal three-way choice. Install does NOT auto-resolve them; it hands off to Diagnostics's escalation flow.

Mark `diagnostics_first_run` pass when Diagnostics completes.

---

### 13. Run Learning for the first time (initial Brain bootstrap)

**Plain English:** "Last meaningful step. The Brain needs the starting facts about you, the group, and the three brands so the skills produce useful output rather than generic. I am going to ask you targeted questions one at a time. Takes 30 to 45 minutes. After this, the OS learns on the job, you will not need to run this again unless we ever do a full reinstall."

Check `.last-learning-run`. If empty, fire `/learning` in **install-bootstrap mode** (Learning's first-run path).

Learning runs through P1 + P2 gaps with Maddie. She can say "park the rest" at any time, but the install does not declare complete until the P1 bar is met. P2 and beyond is captured live on the job after install (see Instructions.md → Live Brain Update).

Pass `learning_first_run` when Learning returns (whether Maddie completed all P1+P2 or parked).

---

### 13a. Measure the P1 minimum bar

Independent of how Learning exited, measure the Brain against the P1 bar before declaring install complete.

The P1 bar is the minimum Brain content needed for skills to produce useful output, not generic. Full definition table (which files, which sections, what counts as met) and measurement command: [[install-p1-bar-definition]].

Write the resulting array of unmet items to `.install-state.json` under `onboarding_p1_bar.p1_remaining`. If the array is empty, set `onboarding_p1_bar.status` to `pass`. If non-empty, set status to `complete-with-onboarding-in-progress` (NOT `fail`, install proceeded, just incomplete).

---

### 13b. Initialise monitoring state files

Write initial timestamps to the state files Daily Briefing checks, so first-morning briefing does not unnecessarily auto-fire Diagnostics or Trends Watch.

**Idempotency guard.** Step 12 (Diagnostics first run) and Step 13 (Learning first run) BOTH write their own rich state files (`.last-diagnostics-run` with diagnostics counts; `.last-learning-run` with gaps closed / deferred). Only initialise files that those steps did not produce, otherwise we clobber the richer data with a placeholder:

```bash
NOW=$(date -u +%Y-%m-%dT%H:%M:%SZ)

# Only write if Step 12 / 13 did not already produce the file.
[ -f .last-diagnostics-run ] || echo "{\"last_run\": \"$NOW\", \"initialised_by\": \"install\"}" > .last-diagnostics-run
[ -f .last-learning-run ]    || echo "{\"last_run\": \"$NOW\", \"initialised_by\": \"install\"}" > .last-learning-run

# Trends Watch is not fired during Install, so this file is always written here.
echo "{\"last_run\": \"$NOW\", \"initialised_by\": \"install\"}" > .last-trends-run
```

Mark `state_files_initialised` as pass.

---

### 13c. Create Reviews + Information subfolders that downstream skills expect

Multiple skills assume per-skill output folders exist before they can save their first run. They each have self-heal logic (create-if-missing) but doing it once here makes the first runs cleaner and lets the Brain Directory + git see the empty folders as intentional structure rather than skill-specific surprises.

```bash
cd "$HOME/Documents/Maddie OS"

# Reviews/ output folders for quality checks, reports, data pulls
mkdir -p "Reviews/Pre-publish Checks" \
         "Reviews/Proofread" \
         "Reviews/Tone Check" \
         "Reviews/Visual Checks" \
         "Reviews/Weekly Reports" \
         "Reviews/Monthly Reports" \
         "Reviews/Data Pulls"

# Information/ output folders for skill artefacts
mkdir -p "Information/Ad Variations" \
         "Information/Landing Page Briefs" \
         "Information/Campaigns/Archive" \
         "Information/Talent Releases/Drafts" \
         "Information/Talent Releases/Signed"

# Leave a .gitkeep in each so git tracks the empty folder
for d in "Reviews/Pre-publish Checks" "Reviews/Proofread" "Reviews/Tone Check" \
         "Reviews/Visual Checks" "Reviews/Weekly Reports" "Reviews/Monthly Reports" \
         "Reviews/Data Pulls" "Information/Ad Variations" \
         "Information/Landing Page Briefs" "Information/Talent Releases/Drafts" \
         "Information/Talent Releases/Signed"; do
  [ -d "$d" ] && [ -z "$(ls -A "$d" 2>/dev/null)" ] && touch "$d/.gitkeep"
done
```

Mark `output_folders_initialised` as pass. Skills' own self-heal logic still applies in any later state where a folder gets deleted, this step just stops the first wave of first-runs producing the same "folder missing" finding repeatedly.

This step exists because the cross-skill install gap was surfaced during cold-testing of [[Pre-publish Check]], [[Weekly Slack Report Draft]], [[Monthly Report Draft]], [[Google Ads Variation Generator]], and [[Google Ads Keyword Builder]] (all on 2026-05-21); centralising the folder creation is cleaner than relying on each skill's self-heal as the only safety net.

---

### 14. Mark install complete (or complete-with-onboarding-in-progress)

```bash
# Determine final status
P1_STATUS=$(jq -r '.steps.onboarding_p1_bar.status' .install-state.json)
if [ "$P1_STATUS" = "pass" ]; then
  FINAL="complete"
else
  FINAL="complete-with-onboarding-in-progress"
fi

# Update state
jq --arg now "$(date -u +%Y-%m-%dT%H:%M:%SZ)" --arg final "$FINAL" \
  '.last_run_completed = $now | .install_status = $final' \
  .install-state.json > .install-state.tmp && mv .install-state.tmp .install-state.json

# Commit and push (tracking branch, no hard-coded `origin main`)
git add .install-state.json .last-diagnostics-run .last-learning-run .last-trends-run
git commit -m "[install] Install $FINAL on $(date -u +%Y-%m-%d)"
git push
```

**If P1 bar met (`complete`), tell Maddie:**

> Install complete. Brain has everything the skills need to produce useful output. Three things to know:
>
> 1. Tomorrow morning, just say "hey" to me. The Daily Briefing fires, pulls anything new from GitHub, runs a quick weekly check.
> 2. If anything ever breaks, say "diagnostics" or "is the OS working" any time.
> 3. The OS learns on the job from here. If you tell me a new brand colour, a new reference post, an audience insight, anything Brain-level, I update the relevant Brain file straight away and tell you what changed. No more big audit sessions.

**If P1 bar NOT met (`complete-with-onboarding-in-progress`), tell Maddie:**

> Install is functionally complete, every connection works. **One thing outstanding:** [N] Brain files still need their P1 content before the skills will produce non-generic output. List below, will appear at the top of every Daily Briefing until cleared:
>
> [list of P1_REMAINING items, with file path + section + one-line reason]
>
> Two ways to clear:
> - Run /learning again any time and walk through the remaining gaps in one go.
> - Or just answer in passing as we work. Tell me a brand colour while we are working on a Fade Golf brief, I update the guidelines file straight away.
>
> Skills will still run, but anything voice-dependent or guidelines-dependent will produce best-guess output (clearly flagged) until the bar is met.

---

## L4 Freeze Handling

If any step encounters an L4 condition (destructive action requested, git conflict on push, integrity violation), Install:
1. Stops immediately. Does not roll back.
2. Updates `.install-state.json` with `status: fail, error: <L4 description>`.
3. Auto-Slack-pings Tom with the freeze condition and what step it was on.
4. Tells Maddie in plain English: "I hit a problem I should not try to fix automatically. Tom has been notified. Carry on with anything else, we will pick this up when he is online."

L4 examples specific to Install:
- Git push rejected with merge conflict (someone else pushed to the repo)
- Existing `~/Documents/Maddie OS/` folder contains files we did not put there (avoid clobbering)
- Deploy key generation succeeded but the resulting key has weak randomness (extremely rare)

---

## Slack escalation message templates

When option B is chosen on an L3 failure, draft using the templates in [[install-slack-escalation-templates]] (B-DEPLOY-KEY-FAIL, B-GOOGLE-OAUTH-FAIL, B-SLACK-OAUTH-FAIL, B-GENERIC) and show Maddie for confirmation before sending. She always sends, not the OS.

---

## Rules

- Idempotent. Re-running never breaks what already works.
- State file is the source of truth, not in-conversation memory.
- L4 freezes (git conflict, destructive action attempted) abort the install and Slack-ping Tom immediately.
- No em or en dashes in any output.
- Educational mode is mandatory, not optional. Every step explains what and why.
- Commit and push the state file after every state change. Tom sees install progress live.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-18 | Skill stub created during scaffold. Process outline, state file schema, three-way L3 escalation pattern. |
| 2026-05-20 | **Added P1 minimum-bar gate to install completion.** Install no longer declares plain "complete" if the Brain is too sparse for skills to produce useful output. New Step 13a measures the P1 bar (Maddie.md + Fade Group.md + 3 brand Brain files + 3 voice Tone sections + 3 guidelines colour palettes + Tech Stack). New Step 13b writes initial monitoring state files (`.last-diagnostics-run`, `.last-learning-run`, `.last-trends-run`) so first-morning briefing does not unnecessarily fire Diagnostics/Trends. Step 14 branches on P1 status: `complete` if bar met, `complete-with-onboarding-in-progress` if not (install still proceeds, but Daily Briefing nags daily until cleared). After this initial bootstrap, ongoing Brain updates happen via the Live Brain Update rule in Instructions.md, not via periodic Learning runs. Learning is now bootstrap + complete-reinstall only. |
| 2026-05-19 | Full implementation: exact bash commands per step, MCP config blocks inline, wrapper script patterns, OAuth flows, Keychain token storage, Slack escalation templates, L4 freeze handling. Ready for use on Mon 19 May. |
| 2026-05-21 | Extracted reference content to `Install/guides/` to keep skill body leaner. State file JSON schema, full P1 bar definition table, MCP config blocks and wrapper scripts (Google Workspace, Slack, Metricool), and the four Slack escalation message templates now live in dedicated guide files. Procedure (steps 0 to 14, P1 measurement logic, L4 freeze handling, rules) stays in the skill body unchanged. No content lost. Body length down from 624 to 460 lines. The remaining 460 lines are largely irreducible operational procedure (per-step plain-English explainer + test bash + remediation bash + failure modes for 15 install steps); further extraction would split the procedure itself, not reference content. |
| 2026-05-21 | **Cold-tested as Maddie (P2 #8, end-to-end).** Scenario: brand new MacBook, fresh install, no Homebrew, no gh, all MCPs unconfigured. 6 edits applied. (1) **CRITICAL: MCP config target file corrected at Steps 8, 9, 10.** Skill previously wrote MCP config to `claude_desktop_config.json` (Claude Desktop's file), but Maddie OS runs in **Claude Code** which reads `~/.claude/settings.json` under `mcpServers`. Wrong file means MCPs never load on Maddie's machine. All three steps now point at the Claude Code config file. (2) Step 5 Path A deploy-key command corrected: the original `gh repo deploy-key add ~/.ssh/maddie-os-deploy.pub --repo Tom-Oliphant15/Maddie-OS ...` referenced the public-key path on **Maddie's** Mac, but Tom runs Path A on **his** Mac where the file does not exist. Now uses stdin route `pbpaste | gh repo deploy-key add - --repo ...` so Tom pastes the key Maddie copied. Portable across machines. (3) Step 6 pre-clone safety check added explicitly: if `~/Documents/Maddie OS/` exists with non-Instructions.md contents, fire L4 freeze deterministically rather than clobbering Maddie's existing files. The L4 condition was already in the L4 list, the actual flow gate was missing. (4) Step 13b state-file initialisation made idempotent: `.last-diagnostics-run` and `.last-learning-run` are only written if Steps 12 and 13 did not already produce them with richer state (gaps closed, diagnostic counts). Previously Step 13b overwrote both with a placeholder, losing the data Learning and Diagnostics had just persisted. `.last-trends-run` is still written here unconditionally because Trends Watch is not fired during Install. (5) **New Step 13c added: create Reviews + Information subfolders.** Cross-skill install gap surfaced during P2 testing of Pre-publish Check, Weekly Slack Report, Monthly Report, Google Ads Variation Generator, and Google Ads Keyword Builder, all 5 skills found `Reviews/[their subfolder]` or `Information/[their subfolder]` missing on first run and added self-heal as fallback. Centralising the folder creation in Install is cleaner: creates `Reviews/Pre-publish Checks/`, `/Proofread/`, `/Tone Check/`, `/Visual Checks/`, `/Weekly Reports/`, `/Monthly Reports/`, `/Data Pulls/`, `Information/Ad Variations/`, `Information/Landing Page Briefs/`, `Information/Campaigns/Archive/`, `Information/Talent Releases/Drafts/`, `Information/Talent Releases/Signed/`, plus a `.gitkeep` in each empty folder so git tracks the structure. Skills' own self-heal remains as belt-and-braces. (6) `git push origin main` softened to plain `git push` at Steps 11 and 14 to respect tracking branch (master / feature branches also work without breakage), same fix as [[Learning]] and [[Social Trends Watch]]. **Other observations not fixed:** Step 1 Homebrew install requires Maddie to be physically at the laptop for sudo password (out of skill scope, but worth flagging in install pre-brief); operational dependency that the Tom-side machine-account exists in GitHub before Maddie tries Step 7 `gh auth login`. |
