# Maddie OS Wishlist, 2026-05-18

**Source:** Otter recording "AI Content Strategy Planning" / Maddie x Tom in-person wishlist conversation, 16m 49s.
**Otter ID:** uCSZPaARUFCRLYPd0xtOJtCbXsw
**URL:** https://otter.ai/u/uCSZPaARUFCRLYPd0xtOJtCbXsw
**Attendees:** Tom Oliphant, Maddie Hosking
**Context:** Conversation happened the day before the Phase 2 in-person build started (Mon 19 May). Maddie articulating what she wants her OS to do; Tom confirms framing and queues each item against the build plan.

**Purpose of this doc:** Historical record of Maddie's original wishlist, cross-referenced against what's been built or scheduled in [[Maddie Phase 2 Plan]] and the active Maddie OS install. Lets us check at end of Phase 2 (3 June) whether the wishlist has been delivered.

---

## Wishlist (Maddie's words, paraphrased)

### 1. Content creation assistance

- AI takes a campaign brief from Maddie (campaign, audience, deadline) and produces a content plan: post ideas, repurposing across Instagram / Facebook / TikTok, Google Ad headlines, suggested search terms.
- Maddie keeps creative ownership ("I don't want it to make the post for me"). AI gives the structured starting point; she creates and edits.
- Example campaigns she had in mind: Paddle and Play, Run Club, Stride nail surgery (high-value Google Ads focus).

### 2. Repurposing one post across platforms

- Feed in one Instagram post + the demographic for each platform. Get back: tailored Facebook copy, Google Ad headlines, suggested search terms, optimised stories.
- Stride / F&E currently mirror Instagram to Facebook automatically; Maddie wants them distinct because the Facebook audience is different (older / parent demographic).

### 3. Scheduled content plan output

- After the brief and repurposing, AI produces a posting schedule with dates and notes per day. Maddie follows it to create + schedule.
- Maddie mentioned she had already used Claude to produce a content strategy for Paddle and Play, manually. Wishlist version: this becomes a repeatable skill she invokes.

### 4. Continuous improvement / consistency

- Once one campaign is done well, the same framework gets re-applied to the next campaign, maintaining tone and quality consistency.

### 5. In-campaign edits and bouncing ideas

- Mid-campaign: Maddie tells the AI "this hasn't performed as well, go funnier / more serious / different angle", and it re-suggests posts with the running context already loaded.

### 6. Reminders and updates

- **Proactive:** weekly / daily checklist. "Have we posted 5 times this week, have we covered this campaign, have we mentioned Run Club lately." Maddie wants this triggered automatically.
- **Reactive:** AI reads what was posted, sees performance, comments on what worked / didn't, suggests next-week adjustments based on the actual numbers.
- Note from Tom in transcript: monitoring social media directly is hard / locked down. Reactive feedback realistic only via Metricool or similar pulling the numbers.

### 7. Master document maintenance

- AI listens to / reads conversations (e.g. meetings) and updates the master marketing document automatically with new context, campaign details, audience changes.
- Pulls from Google / external sources when relevant ("here's what's been added on Google about this service").

### 8. Search for missing context

- Maddie raised: she didn't have Harry's WordPress login. Wishlist: AI can search Maddie's accounts / Drive / notes to find a credential, or proactively flag the missing item and prompt her to ask Harry.

---

## Cross-reference against current state

| Wishlist item | Where it lives now | Status |
|---|---|---|
| 1. Content creation from campaign brief | [[Campaign Brief Expander]] skill in Maddie OS. Tested + upgraded research-first 19 May | Built, in test |
| 2. Repurposing across platforms | [[Cross-Platform Repurposer]] skill stub (P3, blocked on upstream software/MCP decisions per skill testing continuation note) | Stub, blocked |
| 3. Scheduled content plan output | Implicit in the Campaign Brief Expander output (date-stamped post plan). Not a separate skill | Folded into #1 |
| 4. Framework consistency across campaigns | Brand Voices + Brand Guidelines Brain files lock the consistency layer; Critique skill enforces it | Built (voices Live, guidelines Live) |
| 5. In-campaign edits + idea-bouncing | Covered by general Claude Code conversational use; no dedicated skill | Implicit |
| 6a. Proactive reminders / checklist | Daily morning briefing fires in Maddie OS post-install (scheduled task) | Built |
| 6b. Reactive performance feedback | [[Data Pull]] skill stub (P3, blocked on Metricool OAuth completion) | Stub, blocked |
| 7. Master document auto-update from conversations | Maddie OS Learning skill (writes Brain on new info captured during conversations); Master Marketing Document is the doc deliverable, Maddie owns it manually for Phase 2 | Build vs. Learning combo |
| 8. Credential / account search | Not a dedicated skill. Maddie OS Slack Search covers internal Slack lookups; Gmail MCP covers her sent folder. Cross-system search not built | Partial (Slack + Gmail only) |

---

## Gaps surfaced (anything in the wishlist not covered by current build)

- **Cross-Platform Repurposer + Data Pull are both P3 stubs**, blocked on Metricool OAuth and upstream MCP decisions. These directly underpin wishlist items 2 and 6b, the two highest-leverage automation requests Maddie made. Unblock path is the Metricool OAuth for 3+ brands during the in-person Phase 2 block (currently "Not Started" per [[Maddie Phase 2 Plan]] Wk 1 Wed 21 May target, deferred per Maddie OS Status.md 22 May).
- **Cross-system credential / context search** (item 8) is not on the Phase 2 plan. Worth a Tom decision: build a small skill, or accept as out-of-scope and Maddie just asks Harry when blocked.
- **Auto-update master marketing document from conversations** (item 7) is mid-built via Learning, but the actual master marketing document itself is a Maddie-owned deliverable, not auto-generated. The wishlist version (AI listens + writes) is a step beyond current Learning skill capability. Worth a Tom decision: scope it in Phase 2 or defer to Phase 3 (Launch + Measure).

---

## Notes

- Tom's framing in the conversation aligns with the Phase 2 plan: "I think it would be most useful if you said... we'll take a run club for example. So if we were going to do a campaign for a run club or paddle and play, and we had the deadline of the 12th, that was like the day it happened, and so you could tell it all that, and then it could basically do its own kind of research and the paddle club, and stuff like that, and then with the context, it could then give you a report on, okay well do two or three posts on Instagram." This became the Campaign Brief Expander skill.
- Maddie's three concrete action items from the original Otter capture were: build the AI assistant, integrate it with her software/accounts, find Harry's WordPress credentials. The first two are tracked via Phase 2 Plan workstreams. The third (WordPress credentials) is unresolved unless captured elsewhere.

---

## Cross-references

- [[Maddie Phase 2 Plan]] (the build plan that operationalises this wishlist)
- [[Maddie - Fade Group/Status]] (active project status)
- [[Maddie - Fade Group/Tasks]] (active task list)
- [[Continue - Maddie OS Skill Testing]] (the test cycle that will catch wishlist gaps)
