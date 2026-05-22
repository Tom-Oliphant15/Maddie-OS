# Slack Workspace

*Reference for the OS. Holds workspace URL, channel IDs, canvas IDs, and member IDs so Slack work in any session can find the right targets without searching.*

*Last updated: 2026-05-21*

---

## Workspace

| Field | Value |
|---|---|
| Workspace name | Fade Group Workspace |
| URL | fade-group-workspace.slack.com |
| Workspace ID | T0AUUAU0SH |
| Maddie's role | Member |
| Maddie's user_id | U0AVDBDK09F |
| Maddie's email | marketing@fadegroup.uk |

---

## Channels (Maddie has access to)

| Channel | Purpose | Channel ID | Type |
|---|---|---|---|
| `#general` | Company-wide announcements | C0AUX1H0F0D | Public |
| `#leadership` | Tom and Harry strategic space. Maddie reads for @mentions or topics affecting her work. **Never post here unless explicitly @mentioned or asked.** | C0AUUAU158T | Private |
| `#fade-group-marketing` | Cross-business marketing. Maddie's primary working channel. Home of the Marketing Sync canvas. | C0AVDJV10RX | Public |
| `#fade-golf-marketing` | Marketing for Fade Golf | C0AUYBPB93Q | Public |
| `#stride-marketing` | Marketing for Stride Clinics | C0B0EN9PBB2 | Public |
| `#fire-and-earth-marketing` | Marketing for Fire & Earth Leamington | C0AVDJNUJRX | Public |

---

## Canvases

| Canvas | Lives in | Canvas ID | Purpose |
|---|---|---|---|
| Marketing Sync: Agenda and Decisions | `#fade-group-marketing` | F0B03EYMM43 | Live working space for Tom, Maddie, Harry between marketing sync meetings. Same approval-gate pattern as Director Sync. |
| Fade Golf Marketing | `#fade-golf-marketing` | F0B06SP5T5L | Maddie's working surface for Fade Golf marketing. Snapshot of activity, social metrics, commercial outcomes. Updated weekly by Maddie. |
| Stride Clinics Marketing | `#stride-marketing` | F0B02JBS55H | Maddie's working surface for Stride marketing. Reviews and ratings tracking on top of standard structure. Updated weekly. |
| Fire & Earth Marketing | `#fire-and-earth-marketing` | F0B090A7Z8A | Maddie's working surface for F&E Leamington marketing. Reviews via Google + TripAdvisor, covers booked. Updated weekly. |

---

## Key Members

| Name | Slack user_id | Email | Role |
|---|---|---|---|
| Tom Oliphant | U0AUU2ETP0T | tom@fadegroup.uk | Workspace Primary Owner, Maddie's manager (weekly Zoom) |
| Harry Sherlock | U0AV0EBHTDG | harry@fadegroup.uk | Director, Maddie's daily in-person manager |
| Maddie Charpentier | U0AVDBDK09F | marketing@fadegroup.uk | Maddie (you) |

---

## Channel routing rules (where to post what)

| If you want to... | Default channel |
|---|---|
| Send Tom or Harry a business-level message that should be on record | `#leadership` if Tom asked you to; otherwise DM Tom or Harry directly |
| Discuss cross-brand marketing strategy or ideas | `#fade-group-marketing` |
| Discuss Fade Golf marketing specifically | `#fade-golf-marketing` |
| Discuss Stride marketing specifically | `#stride-marketing` |
| Discuss F&E marketing specifically | `#fire-and-earth-marketing` |
| Share a company-wide announcement | `#general` |
| Personal / quick / not channel-relevant | DM the person |

---

## Connection notes for Claude

Accessed via the Slack MCP configured in `~/.claude/settings.json` (see [[Tech Stack]]).

**What works:**
- Search channels, users, messages, canvases
- Read channel messages, threads, canvases
- Post messages, schedule messages, draft messages
- Update canvases (with caveats below)

**What does not work:**
- Creating canvases (errors with `bot_scopes_not_found`)
- Creating, archiving, renaming channels
- Inviting users to the workspace
- Adding users to channels

**Canvas update behaviour to remember:**
- `replace` with `section_id` targeting a non-header element acts more like an append than a clean replace.
- Cleanest approach for routine canvas updates is a full canvas replace (action=replace, no section_id, full content). Title is preserved automatically.
- Always read the canvas first to confirm current state before a full replace.

---

## Related

- [[Fade Group]] group overview
- [[Tech Stack]] Slack MCP wiring
- [[Contacts]] full Fade Group contact list
