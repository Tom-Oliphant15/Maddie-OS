# Tech Stack

*Last updated: 2026-05-18 (scaffold, pre-build Mon 19 May)*

## Principle

Minimal stack. Fewer MCPs means fewer failure modes for Maddie to diagnose. Add tooling only when a specific recurring use case earns it. Prefer official CLIs to MCPs where both exist.

---

## MCPs (connected via Claude Code on Maddie's MacBook)

| MCP | Status | Connected on | Used by | Notes |
|---|---|---|---|---|
| Google Workspace | Live (fix applied by Tom 2026-05-26) | marketing@fadegroup.uk | Daily Briefing, Voice Notes, Campaign Brief Expander, Session End | Single MCP covers Gmail + Calendar + Drive. Launched via port-collision wrapper (`workspace-mcp-launch.sh`) to avoid clashing with Tom's instance. |
| Slack | Day 0 (Mon 19 May) | Fade Group workspace | Daily Briefing, Session End, weekly marketing reports | Maddie's primary written channel. Read + post. |
| Metricool | Day 3 (Wed 21 May) | 3 brands OAuth (Fade Golf, Stride, Fire & Earth Leamington) | Data Pull | Added when Metricool Advanced trial is set up. Phase 2 plan deliverable Wed 21 May. |

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

## Linked

- [[Maddie]] for tech comfort level
- [[Fade Group]] for group-level tooling context
