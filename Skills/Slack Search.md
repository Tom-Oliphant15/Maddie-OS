# Skill: Slack Search

---
triggers:
  - "search slack for"
  - "search slack"
  - "find in slack"
  - "what's been said about"
  - "slack search"
  - "/slack-search"
type: Recipe
---

**Purpose:** On-demand search of the Fade Group Slack workspace for messages, threads, and canvases matching a topic, person, or keyword. Returns a grouped summary with links so Maddie can jump to the source.

**Read-only.** This skill never posts, drafts, or modifies Slack content. To send a message use [[Draft Text]].

---

## Context

*Load on demand:*

- [[Slack Workspace]], for channel IDs, canvas IDs, member IDs (so user-name queries can be resolved to user_ids)
- Slack MCP, for `slack_search_public_and_private`, `slack_search_users`, `slack_search_channels`, `slack_read_thread`, `slack_read_canvas`

---

## Quick Start

Maddie says:
- "search Slack for Stride run club"
- "what's Harry said about the budget this week"
- "find Fade Golf shoot day in Slack"
- "/slack-search [topic]"

---

## When to Use

- Maddie wants to find what has been discussed in Slack about a topic, brand, or person
- Maddie wants to pull together a set of messages before drafting a response or running a campaign
- Maddie wants to check whether something has already been said before she raises it again

---

## /goal integration

```
/goal output covers the right channels (filter by brand or workspace-wide), respects date scope (default last 30 days), groups results by channel with snippets + permalinks, ends with a one-line Bottom Line summarising the picture. Stop after 1 search round unless Maddie asks to narrow or widen.
```

---

## Process

### Step 1: MCP availability check

Mirror Daily Briefing Section 1d. If Slack MCP is unavailable:

> Slack MCP isn't connected right now, so I can't search. Try `/diagnostics` to check status, or come back later.

Do not fall back to memory.

### Step 2: Parse the query

Extract:
- **Keywords** ("Stride", "run club", "budget", "Luke")
- **People filter** if a name is mentioned. Resolve via `slack_search_users` if user_id not in [[Slack Workspace]]. Add `from:<@USER_ID>` or `to:<@USER_ID>`.
- **Channel filter** if a channel is named. Resolve via `slack_search_channels` if ID not cached. Add `in:<#CHANNEL_ID>`.
- **Date range** if implied ("last week" → `after:YYYY-MM-DD`, "this month" → `after:[first of month]`). Default to last 30 days.

### Step 3: Run the search

Call `slack_search_public_and_private` with:
- The constructed query
- `sort=score` (relevance) unless Maddie asks for chronological
- `limit=20`
- `include_context=true`

### Step 4: Enrich results

- For thread replies (have `thread_ts`), call `slack_read_thread` to fetch parent + sibling replies for context
- For canvas results (file type), call `slack_read_canvas` and skim for the relevant section
- Drop bot messages and emoji-only reactions

### Step 5: Format the output

Group by channel, ordered by hit count descending. For each channel:

```
**#channel-name** (N hits)
- DD Mmm, Sender: "snippet, max 120 chars" ([link](slack-permalink))
- DD Mmm, Sender: "snippet" ([link](slack-permalink))
```

If a hit is from a thread, indent thread context one level under the parent.

After the channels, include a one-line **Bottom line:** summarising what the search reveals (e.g. "Three threads about the Stride nail surgery launch, all in `#stride-marketing`, most recent 18 May where Harry asked for the GP referral list.").

### Step 6: Offer next step

End with a single follow-up tailored to the search:
- "Want me to draft a reply to [latest thread]?" if the search reveals an unanswered question to Maddie
- "Want me to pull the full thread?" if context is incomplete
- "Anything else to search for?" otherwise

---

## Examples

**Query: "search Slack for Stride nail surgery"**
- Keywords: "Stride nail surgery"
- No person, no channel, no date filter
- Translated query: `Stride nail surgery after:[today-30]`
- Likely channels with hits: `#stride-marketing`, `#fade-group-marketing`

**Query: "what's Harry said about the budget this week"**
- Keywords: "budget"
- Person filter: `from:<@U0AV0EBHTDG>` (Harry)
- Date filter: `after:[Monday of this week]`
- Translated: `budget from:<@U0AV0EBHTDG> after:YYYY-MM-DD`

**Query: "find all messages in #fade-golf-marketing from last week"**
- No keywords (broad)
- Channel filter: `in:<#C0AUYBPB93Q>`
- Date filter: last week
- Translated: `in:<#C0AUYBPB93Q> after:YYYY-MM-DD before:YYYY-MM-DD`
- Sort: timestamp, descending

---

## Rules

- **Read-only.** Never post, draft, or modify Slack from this skill.
- **No content leakage to OS files.** Search results delivered in-conversation only. Do NOT save full message bodies to Brain files, Status files, or daily logs unless Maddie asks explicitly.
- **Cap at 20 results.** If too broad, ask her to narrow before running again.
- **Default scope is workspace-wide** including `#leadership` (she has read access for @mentions).
- **Bot and reaction filtering.** Skip bot messages (`include_bots=false`) and skip emoji reactions in formatted output.
- **Be specific in the Bottom Line.** Not "several discussions", write "three threads, most recent on [date] where [person] said [one-clause summary]".
- **Em / en dashes forbidden** per CLAUDE.md paste-safe rule.

---

## Anti-Patterns

- Searching `#leadership` for something she could ask Tom or Harry directly. Use this skill when there's a real research need, not as a substitute for asking.
- Posting from this skill. It is read-only. Use [[Draft Text]] to send.
- Returning raw search dumps with no Bottom Line. Always synthesise.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-21 | Initial creation, adapted from Tom OS master Slack Search. Workspace context loaded from new `Brain/Slack Workspace.md` (Maddie-side reference, subset of Tom's). Member resolution defaults to her user_id and Tom/Harry's. Examples retuned to Maddie's marketing context (Stride nail surgery, Fade Golf shoot day). Added MCP availability pre-check mirror of Daily Briefing 1d. |
