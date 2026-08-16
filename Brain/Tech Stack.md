# Tech Stack

*Last updated: 2026-08-16 (Slack cancellation flagged, Metricool status marked unverified). Content otherwise dates from 2026-05-28.*

## Principle

Minimal stack. Fewer MCPs means fewer failure modes for Maddie to diagnose. Add tooling only when a specific recurring use case earns it. Prefer official CLIs to MCPs where both exist.

---

## MCPs (connected via Claude Code on Maddie's MacBook)

| MCP | Status | Connected on | Used by | Notes |
|---|---|---|---|---|
| Google Workspace | Live (fix applied by Tom 2026-05-26) | marketing@fadegroup.uk | Daily Briefing, Voice Notes, Campaign Brief Expander, Session End | Single MCP covers Gmail + Calendar + Drive. Launched via port-collision wrapper (`workspace-mcp-launch.sh`) to avoid clashing with Tom's instance. |
| Slack | Day 0 (Mon 19 May). **Being cancelled, see below** | Fade Group workspace | Daily Briefing, Session End, weekly marketing reports | Maddie's primary written channel. Read + post. |
| Metricool | **Unverified.** Trial agreed 28 May, OAuth setup recorded as pending for all 3 brands (Fade Golf, Stride, Fire & Earth Leamington) | Not connected as at last review | Data Pull, Cross-Platform Repurposer | [[Status]] contradicts this and says Metricool is connected for all three brands. Both files date from early June and neither has been checked since. Confirm with Maddie before either is relied on. |

### Slack is being switched off (flagged 2026-08-16)

Fade Group decided on 12 August 2026 to cancel the Slack workspace and move written comms to email loop memos. No cancellation date has been set yet.

This is not a small change for this OS. Slack is a hard dependency in three places: the Daily Briefing reads it for messages needing a response, Session End posts to it, and the weekly marketing report goes to `#fade-group-marketing`. It is also the documented escape hatch when something breaks ("ping Tom on Slack"), which stops working the moment the workspace does.

Nothing needs doing today, because the OS is dormant and no date is fixed. But Slack cannot be switched off and this OS brought back into use on the same day. Whoever revives it has to re-point those three skills at email first, and give the escape hatch somewhere else to go.

---

## CLIs (zero passive cost, invoked via Bash when needed)

| CLI | Status | Used by | Notes |
|---|---|---|---|
| `gh` | Day 0 | Session End (GitHub push) | Standard GitHub CLI. Authenticated to maddie's GitHub account on Day 0. |
| `google-ads` | Evaluating Thu 29 May | Data Pull (when Stride Ads restructure goes live) | From `printing-press-library`. Install pending evaluation. |
| `google-search-console` | Evaluating Thu 29 May | Data Pull | From `printing-press-library`. Install pending evaluation. |
| `clarity` | Evaluating Thu 29 May | Data Pull (heatmap/behaviour) | From `printing-press-library`. Install pending evaluation. |

## Deferred (do NOT add until a real use case appears)

- **Apify MCP** — for competitor / external account scraping. Wait until Britt's influencer monitoring template arrives and there is a concrete recurring use case.
- **Otter MCP** — currently flagged as broken on Tom's install. Defer until reliable. Otter usage via the iOS app continues; transcripts land in Google Drive and are processed via Drive MCP.
- **Computer-use** — not needed for marketing work.
- **Chrome MCP** — not needed unless a specific workflow gap surfaces.
- **GitHub MCP** — use `gh` CLI instead. Lower passive cost.

## Non-MCP Tools Maddie Uses Day-to-day

| Tool | Purpose |
|---|---|
| Canva | Visual content production |
| Cliniko | Stride patient management (read-only from Maddie's perspective) |
| WordPress | Stride website (admin access blocked currently) |
| Google Ads (web UI) | Until CLI evaluation completes |
| Google Drive (desktop sync) | Master Marketing Document, brand assets, campaign briefs |
| Otter (iOS app) | Solo voice notes and meeting capture |

## OS Self-Healing

This OS is mirrored to GitHub. If something breaks Maddie cannot fix, she pings Tom on Slack. Tom pulls the repo, fixes, pushes. Next Daily Briefing pulls the fix automatically.

---

## Slack Channels

| Purpose | Channel |
|---|---|
| Weekly marketing report | #fade-group-marketing |

---

## Linked

- [[Maddie]] for tech comfort level
- [[Fade Group]] for group-level tooling context
