# Daily Briefing, State-File Checks (Steps 1a to 1d)

These checks run BEFORE the briefing is assembled. They are the autonomous-monitoring mechanism: Maddie greets Claude, the checks fire silently behind the scenes, results land in the right sections of her briefing without her having to remember to ask.

Run in order. Each block decides whether the corresponding skill or surfacing fires inline today.

## 1a, Diagnostics (7-day cadence)

```bash
LAST_DIAG=$(jq -r '.last_run // empty' .last-diagnostics-run 2>/dev/null)
NOW=$(date -u +%s)
DIAG_TS=$([ -n "$LAST_DIAG" ] && date -j -f "%Y-%m-%dT%H:%M:%SZ" "$LAST_DIAG" +%s 2>/dev/null || echo 0)
AGE_DAYS=$(( (NOW - DIAG_TS) / 86400 ))
```

If `.last-diagnostics-run` does not exist (file missing) OR `AGE_DAYS > 7`:
- Fire [[Diagnostics]] inline NOW, before assembling the briefing.
- Diagnostics returns a summary block. Hold it for inclusion at the top of the briefing (Section 0).

If fresh (7 days or less), skip and continue. This is the autonomous-before-Maddie-realises mechanism. She greets Claude on Monday, Diagnostics fires silently behind the scenes, results land in Section 0 of her briefing.

## 1b, Onboarding P1 bar

```bash
INSTALL_STATUS=$(jq -r '.install_status // empty' .install-state.json 2>/dev/null)
P1_REMAINING=$(jq -r '.steps.onboarding_p1_bar.p1_remaining // [] | length' .install-state.json 2>/dev/null)
```

If `INSTALL_STATUS = "complete-with-onboarding-in-progress"` OR `P1_REMAINING > 0`:
- Hold the P1 gap list for inclusion at the TOP of Section 7 (Recommendations). It is the headline recommendation every morning until P1 reaches zero.
- Format the surfacing as: `[N] Brain item(s) outstanding from your install. Cleared by /learning or by telling me in passing while we work. Items: [file 1, section], [file 2, section], ...`

If `INSTALL_STATUS = "complete"` or P1 bar is clear, skip and continue.

This replaces the previous monthly Learning auto-recommend. Learning is install-bootstrap + complete-reinstall only now. Ongoing Brain updates happen via the Live Brain Update rule in CLAUDE.md, captured live as Maddie tells the OS new facts during normal work.

## 1c, Social Trends Watch (30-day cadence)

```bash
LAST_TRENDS=$(jq -r '.last_run // empty' .last-trends-run 2>/dev/null)
TRENDS_TS=$([ -n "$LAST_TRENDS" ] && date -j -f "%Y-%m-%dT%H:%M:%SZ" "$LAST_TRENDS" +%s 2>/dev/null || echo 0)
AGE_DAYS_TRENDS=$(( (NOW - TRENDS_TS) / 86400 ))
```

If `.last-trends-run` does not exist OR `AGE_DAYS_TRENDS > 30`:
- Fire [[Social Trends Watch]] inline. It is a research scan, not interactive, so it runs without Maddie's input.
- Trends Watch returns a one-paragraph "what is working this month" headline plus a written report saved to `Reviews/Social Trends/current.md`. Hold the headline for inclusion at the top of Section 7 (Recommendations).

If fresh (30 days or less), skip and continue.

This is the monthly creative-pulse mechanism. The output feeds [[Campaign Brief Expander]]'s creative direction so briefs stay current with what is actually trending in clinical / health, golf / sport, and wellness.

## 1d, MCP availability check

Before assembling Sections 1, 2, and 4, run a fast availability check on the MCPs the briefing depends on:

- Google Workspace MCP (Calendar + Gmail), needed for Sections 1 (Diary) and 2 (Messages).
- Slack MCP, needed for Section 2 (Messages).
- Metricool MCP, needed for Section 4 (Weekly checklist post counts).

If a required MCP is not connected:
- Do NOT abort the briefing. Continue with the sections that work.
- Replace the affected section content with one line, e.g. `[<MCP name> not connected. Cannot pull <Diary / Messages / post counts>. See OS Health Check / Install.]`
- Add one entry to Section 7 (Recommendations) at the bottom: `Reconnect <MCP name> via /install (about <N> minutes).` Only do this once per missing MCP, not per affected section.

This is the graceful-degradation pattern. The briefing must still be useful when one connection is down, not silently empty.
