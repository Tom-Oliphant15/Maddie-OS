# OS Health Entry Template

The exact markdown block to append to `Reviews/OS Health/current.md` during Stage 7 of [[Diagnostics]].

```markdown
### YYYY-MM-DD HH:MM, Diagnostics Run

**Goal status:** met / partial / aborted
**Duration:** Xm Ys
**Trigger:** automatic (Daily Briefing) / manual (Maddie asked)

**Issues found:**
- **L1 (auto-fixed silent):** [count, one-line each]
- **L2 (auto-fixed, logged):** [count, one-line each, with fix-library pattern ID if matched]
- **L3 (Maddie shown):** [count, each with title, fix attempted, Maddie's choice (A/B/C), outcome]
- **L4 (Slack-pinged Tom):** [count, each with title, ping timestamp]

**Stage 1 connection tests:** [pass/fail/deferred count, e.g. 7 pass, 0 fail, 2 deferred (gh + Metricool)]
**Stage 2 skill logic tests:** [pass/fail/deferred count, e.g. 0 pass, 0 fail, 18 deferred (fixtures not yet authored)]
**Stage 3 Brain freshness:** [count of stale files, count of stubs past lock date]

**Trend signals since last run:**
- [Anything trending wrong, e.g. "Slack MCP latency up 40% over last 4 runs"]
- [Repeat issues, e.g. "Stride orthotic relaunch task deferred 3 weeks running"]

**Fix-library matches:** [pattern IDs that matched, if any]
**Fix-library fetch:** success / failed-using-cache / no-cache-skipped

**State file updates:**
- `.last-diagnostics-run` bumped to [timestamp]
```

**Privacy rule:** OS Health entries contain metadata only. No conversation content, no campaign drafts, no email bodies, no voice note transcripts. Errors and operational state only.
