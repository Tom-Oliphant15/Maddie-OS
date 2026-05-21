# Daily Briefing, Output Template

The full briefing is saved to `Reviews/Daily/YYYY-MM-DD.md`. If the file does not exist, create it with the `## Sessions` placeholder so Session End can append to it later.

## File structure

```markdown
# Daily Log, YYYY-MM-DD

## Morning Briefing (HH:MM)

### 0. OS Health Check (if Diagnostics fired)
[One-line headline from Diagnostics, e.g. "All connections healthy, no issues found" OR "1 issue surfaced and self-fixed, 1 deferred. See below."]

[If L3 issues surfaced, list each with the three-way choice rendered inline. Maddie picks A / B / C in conversation.]

### 1. Diary
**Today (Day, DD Month YYYY):**
- HH:MM, [event], [attendees if any], [location if not default]
- ...

**Tomorrow (Day, DD Month YYYY):**
- ...

[For each meeting, flag whether a briefing pack / agenda exists, and whether prep items are open in Tasks.md. If no agenda and no prep, push: "Worth running /meeting-prep before [time]?"]

### 2. Messages for today

**Requires response from Maddie today:**
- [Source], [sender], [topic], [the action]

**FYI Cc'd:**
- [One-line summary, no action expected]

**Newsletters / automated:** skipped.

[Slack scan results follow the same pattern, by channel. If a channel is quiet, one-line acknowledgement.]

[If nothing requires a response, state plainly: "Nothing in your inboxes needs a reply today." Do not pad.]

### 3. Top 3 today
1. **[Item title]** [if it has a deadline today, say so]. [One-sentence rationale.]
2. **[Item title]** ...
3. **[Item title]** ...

[Critical persona check: if Top 3 looks light, push back. If yesterday's Top 3 had carry-overs, surface them.]

### 4. Weekly checklist

| Brand | Posts this week | Active campaign on track | Tools healthy |
|---|---|---|---|
| Fade Golf | [n] (target: [m]) | [yes / behind / no campaign] | [check or flag] |
| Stride | [n] (target: [m]) | [yes / behind / no campaign] | [check or flag] |
| Fire & Earth | [n] (target: [m]) | [yes / behind / no campaign] | [check or flag] |

[Below the table, flag anything trending wrong in plain sentences.]

### 5. To-do (next 10)
- [Brand] [Deadline] [Task title]
- ...

### 6. Awaiting others
**Tom:** [item, chase-date if relevant]
**Harry:** [item, chase-date]
**Mark:** [item]
**[Other]:** [item]

[If an awaiting item is more than 2 weeks past due-date, surface chase-or-drop.]

### 7. Recommendations

[If onboarding P1 gap list is held from Step 1b, it is recommendation #1 every morning until cleared:]

1. **Clear your remaining onboarding items.** [N] Brain section(s) still need their starting content before skills produce non-generic output. Quickest path: run /learning. Or tell me in passing as we work, I will update the relevant file straight away. Outstanding:
   - [file 1, section, one-line reason]
   - [file 2, section, one-line reason]

[Then normal recommendations:]

2. **[Action] today.** [One-sentence reason.] I can: [what Claude can do to make it easier].
3. **[Action] this week.** [Reason.] I can: [...]

[Critical persona: do not pad to 4 if there are only 2 real recommendations. Quality over quantity. If Diagnostics surfaced L3 issues in section 0, do NOT re-surface them here.]

## Sessions
```

## Fallback wording (graceful degradation per Step 1d)

When a required MCP is not connected, replace the affected section's body with a single line, and add one entry to Section 7 (Recommendations) to reconnect. Examples:

- Diary: `[Google Workspace MCP not connected. Cannot pull Diary. See OS Health Check / Install.]`
- Messages: `[Google Workspace MCP not connected. Cannot pull email. See OS Health Check / Install.]` and / or `[Slack MCP not connected. Cannot pull Slack. See OS Health Check / Install.]`
- Weekly checklist post counts: show the table with `[Metricool pending]` in the post-count column. Campaign and tools columns still populate from Status.md.

Recommendation entry (once per missing MCP, not per affected section): `Reconnect <MCP name> via /install (about <N> minutes).`
