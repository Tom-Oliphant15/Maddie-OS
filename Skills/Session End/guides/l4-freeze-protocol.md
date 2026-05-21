# L4 Freeze Protocol

Reference for the L4 freeze path in Step 8 of Session End, triggered when `git push` fails and the L2 pull-rebase-push retry also fails.

---

## What L4 means

The local working tree is safe and committed. The remote `origin/main` has diverged in a way the automatic retry could not resolve. Stop, escalate, do not improvise. Tom resolves from Australia.

---

## Hard rules

- Do not force-push.
- Do not amend the latest commit.
- Do not delete anything.
- Do not leave the repo mid-rebase (the abort step below handles this).

---

## Abort any in-progress rebase first

If the L2 pull-rebase failed with conflicts, the repo is left mid-rebase. Restore Maddie's working tree to its pre-rebase state before escalating:

```bash
if [ -d .git/rebase-merge ] || [ -d .git/rebase-apply ]; then
  git rebase --abort
fi
```

---

## Update OS Health with the L4 marker

Write a clear `L4 ESCALATION` heading into `Reviews/OS Health/current.md` with the exact error from the failed push and the local + remote HEAD SHAs. This is the durable record Tom will see when he opens the repo, regardless of whether the Slack ping lands.

---

## Slack-availability check before pinging Tom

Mirror the availability pattern from Daily Briefing Step 1d.

- **If the Slack MCP is connected:** send the L4 message via Slack DM to Tom.
- **If the Slack MCP is not connected** (likely during early bootstrap): do NOT silently swallow. The full L4 marker is already in `Reviews/OS Health/current.md` from the previous step. Tell Maddie in plain English to message Tom directly.

---

## L4 Slack message template

```
[L4 FREEZE, Maddie OS Session End]
Push rejected, conflict with origin/main.
Local HEAD: [SHA]
Remote HEAD: [SHA]
Rebase: [completed-and-pushed / aborted / not-attempted]
Maddie's local work is intact, not force-pushed, not amended.
Suggested fix from your side: clone fresh, cherry-pick or merge her commit, push back.
She has been told the session is saved locally and to carry on.
```

---

## Message to Maddie

Plain English, no jargon, reassuring:

> Session is saved locally but I cannot push to GitHub. Looks like Tom may have pushed something while you were working. I have stopped and [pinged Tom on Slack / could not reach Slack from here, please message Tom directly]. Your work is safe on your laptop. We will pick this up when Tom is online.
