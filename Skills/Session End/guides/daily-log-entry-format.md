# Daily Log Entry Format

Reference for the session block appended to `Reviews/Daily/YYYY-MM-DD.md` in Step 4 of Session End.

---

## Where it goes

Always append under the `## Sessions` header, not at the end of the file. If `## Sessions` is missing because the daily log was hand-written earlier, add the header first, then append below it. The session block always sits inside the `## Sessions` section so the file stays parseable.

If the daily log file does not exist (Maddie did not greet today, e.g. starting work mid-evening), create it first:

```markdown
# Daily Log, YYYY-MM-DD

## Sessions

```

---

## Block template

```markdown
### HH:MM, [Session topic, 3 to 6 words]

- [What was done, 1 to 3 bullets]
- [Files touched, decisions, outcomes]
- **Next:** [What is queued for next session, or "Done"]
```

---

## Worked examples

Substantive work session:

```markdown
### 11:35, Stride nail surgery campaign brief

- Ran Campaign Brief Expander with audience "parents 40-60, local"
- Output reviewed, weakness flagged on Facebook copy hook, regenerated
- Saved plan to Information/Campaigns/2026-05-19 Stride Nail Surgery.md
- 8 Google Ads headlines selected from 10 options
- **Next:** Build the IG main post in Canva, post Wed
```

Voice-note review session:

```markdown
### 14:10, Fade Golf voice note review

- Processed 2 Otter recordings from morning drive
- Routed 3 ideas to Fade Golf Notes, 1 to General Notes
- One idea was about Luke filming brief, surfaced to Tom in Slack
- **Next:** Done
```

Casual chat with nothing tracked:

```markdown
### 16:00, Casual catch-up with Claude

- No real work, just talked through what was in the inbox
- **Next:** Done
```

---

## Top 3 carry-over

If today's morning briefing had a Top 3 and any item is not Done by session end, surface it in the **Next** line so the carry-over is visible the next day. Cross-reference algorithm:

1. Read today's daily log. If a `## Morning Briefing` section exists, locate `### 3. Top 3 today` and extract the three items.
2. Cross-reference each item against Tasks.md changes made in this session. An item counts as Done if the matching Tasks.md row moved to Done during this session, OR if Maddie explicitly confirmed it complete in conversation.
3. Any Top 3 item still not Done becomes a carry-over for the **Next:** line of this session's block.
4. If no morning briefing exists (Maddie did not greet today), skip the carry-over check.

Carry-over **Next** line format:

```markdown
- **Next:** Carrying over from today's Top 3: [item 2], [item 3]. Re-prioritise tomorrow.
```

This is the proactive monitoring Maddie asked for. Do not silently lose her Top 3.
