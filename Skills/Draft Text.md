---
name: Draft Text
description: Drafts written messages (email, Slack, WhatsApp, LinkedIn) matched to recipient relationship and channel, with a tone matrix and built-in learning loop.
triggers:
  - "draft an email"
  - "draft a reply"
  - "draft a slack"
  - "draft a whatsapp"
  - "write to"
  - "help me word this"
  - "how should I word"
  - "write a follow-up"
  - "write a message to"
  - "/draft"
---

# Skill: Draft Text

**Purpose:** Produce ready-to-send written messages in Maddie's voice, with tone selected deterministically from the matrix below. Covers any written channel, not just email.

---

## Context

*Load these files before running this skill:*

- [[Contacts]] canonical recipient details across all Fade Group brands. Use to resolve colloquial names ("Tom", "Harry", "Wendy", "Luke") to canonical email / Slack / phone, AND to pull relationship-level context. Check Contacts before drafting; do not guess at addresses.
- [[Maddie]] her own voice profile and disposition (chilled, conversational, direct, no corporate hedge)
- [[Slack Workspace]] if message is going to Slack, for channel routing

*Load Voice Samples if available:*

- [[Voice Samples]] real Maddie-authored email samples per tone bucket. If this file does not yet exist (early install window), fall back to the voice profile in [[Maddie]] and the default patterns below.

*Load business-specific Brain files only if the message is about a specific brand:*

- [[Brain/Businesses/Fade Golf]] for Fade Golf comms
- [[Brain/Businesses/Stride Clinics]] for Stride comms
- [[Brain/Businesses/Fire & Earth Leamington]] for F&E comms

---

## Quick Start

Maddie says:
- "draft an email to Luke about the shoot Friday"
- "draft a Slack to Tom about the Stride launch timing"
- "write to Wendy about the patient consent form"
- "help me word this reply to the agency"
- "/draft [channel] to [person] about [topic]"

The more context (relationship, goal, points to land), the sharper the first draft.

---

## When to Use

- Drafting any email, Slack, WhatsApp, or LinkedIn message Maddie will send
- Replying to messages where the response needs to be polished
- Difficult or sensitive comms where tone matters (declining a supplier, pushing back to Tom, chasing an ambassador)
- Cold outreach to potential ambassadors, partners, or suppliers
- Internal-warm comms to Fade Group colleagues she doesn't know well yet

**Not the right skill?**
- Campaign captions / ad copy / landing page copy: use [[Campaign Brief Expander]], [[Google Ads Variation Generator]], or [[Landing Page Brief]]
- Briefing an ambassador on a paid post: use [[Talent Ambassador Brief]] (handles ASA disclosure)
- Long-form internal report drafting: use [[Weekly Slack Report Draft]] or [[Monthly Report Draft]]

---

## /goal integration

```
/goal output single message in correct tone for recipient + channel, BLUF (ask in first paragraph), one ask only, no filler openers, mobile-readable paragraphs, no em / en dashes, British English, sign-off rule applied. Stop after Maddie accepts or after 3 revision rounds.
```

---

## How It Works

Identify recipient, channel, goal. Pick a tone from the Tone Matrix using the relationship. Apply channel adjustments. Apply universal rules. Draft. Offer to adjust. Run the learning hook if Maddie changes anything.

---

## What's Appropriate Here

Maddie's daily comms are a mix of: warm internal (Tom Zoom prep, Harry daily check-ins, Lynda + clinical / therapy staff), light-commercial external (ambassadors like Luke / Katie, suppliers, agencies), occasional cold outreach (potential ambassadors, partner brands, content collaborators), and pushback / declining work (telling an ambassador a brief isn't working, declining a supplier proposal, asking Tom to reconsider a timeline).

**What this skill does at her scale:**
- Calibrates tone to recipient and channel
- Architects the message so the ask is unmistakable in the first read
- Compensates for her tendency to over-hedge or over-soften (per [[Maddie]])
- Pre-flights sensitive messages before they go out

**What this skill does NOT do:**
- Marketing campaign copy (separate skills handle this)
- Ambassador / talent briefs (use [[Talent Ambassador Brief]])
- Mass cold outreach (Maddie does not run outbound at scale)
- Drafting in Tom's voice (this is her voice, not his)

---

## Process

### Step 0: Voice samples bootstrap (first run after Gmail is available)

Check at the start of every run:

1. Is Gmail MCP available? (Same check pattern as Daily Briefing Section 1d.)
2. Does `Brain/Voice Samples.md` exist?

**If Gmail is available AND `Voice Samples.md` does NOT exist:** before drafting, ask Maddie once:

> Gmail is wired in. Want me to scan your sent folder and pull 10 to 15 real examples to build your Voice Samples file? It takes about 5 minutes and means every future draft is calibrated against your actual voice, not the default profile in your Brain. Yes / not yet / never (and stop asking).

- **Yes:** run the Voice Samples scan now (process below), save to `Brain/Voice Samples.md`, then continue with the user's original draft request using the new file.
- **Not yet:** continue with the current draft using the [[Maddie]] default voice profile. Ask again on next run.
- **Never:** continue with the default profile. Write a single line to `.voice-samples-state.json` so the skill stops asking. (Maddie can re-enable by deleting that file or saying "scan my emails for voice".)

If Gmail is NOT available, skip Step 0 entirely and use the default profile.

**Voice Samples scan process:**

1. Pull the last 30 sent emails from `marketing@fadegroup.uk` (or whichever Workspace email is active).
2. Drop autoresponders, calendar invites, single-line replies, and forwarded messages with no original text.
3. Categorise the remaining emails into the Tone Matrix buckets (Familiar / Internal-warm / External-warm / Cold / Sensitive). Aim for 2 to 4 examples per bucket that's well-represented in the sample. Skip buckets with no real examples (the bucket falls back to the matrix default until samples accumulate).
4. For each example, capture: recipient relationship type, opener pattern, body structure (prose vs bullets, paragraph length), connector phrases she uses, sign-off behaviour (did Gmail auto-attach, or did she type one).
5. Extract cross-bucket patterns: vocabulary she favours, phrases she avoids, no-AI-tells specific to her writing.
6. Save to `Brain/Voice Samples.md` using the same structure as Tom OS's master Voice Samples file (per-bucket examples + extracted patterns + a "Refresh cadence" line set to "every 3 to 6 months or after deliberate voice shifts").
7. Update [[Brain Directory]] to list Voice Samples under a new "Voice" sub-section.
8. Tell Maddie what was found in one paragraph (which buckets were well-represented, which were thin, any voice signatures spotted) before continuing with her original draft.

### Step 1: Extract inputs

Recipient, channel, relationship (familiar / internal-warm / external-warm / cold / sensitive), goal, points to land, deadline if any.

### Step 2: Pick the tone

Use the Tone Matrix below. If the relationship is unclear, ask before drafting.

### Step 3: Apply channel adjustments

See Channel Adjustments table.

### Step 4: Apply universal rules

See Universal Rules.

### Step 5: Draft

Write the message. Subject for email, none for Slack / WhatsApp.

### Step 6: Offer to adjust

"Want me to make this shorter / softer / more direct / add a specific point?"

### Step 7: Run the learning hook

If Maddie corrects tone, structure, or wording, see Learning Hook below.

---

## Tone Matrix

| Tone | When | Hallmarks |
|---|---|---|
| **Familiar** | Tom, Harry (post first 4 weeks), close friends, family | "Hi Tom,", prose, conversational connectors ("Quick one,", "On the Stride thing,"), contractions, British casual register, short sentences. No bold section headers. |
| **Internal-warm** | Fade Group colleagues she's still building rapport with (Lynda, Wendy, Helen, Aaron, F&E therapists, Mark, Jason) | Professional but warm, brief, friendly close. Light structure if needed. |
| **External-warm** | Ambassadors she knows (Luke, Katie), regular suppliers, known agencies | Friendly but business-y. Specific. Includes deadlines and clear next step. |
| **Cold outreach** | New potential ambassadors, partner brands, content collabs, suppliers she hasn't worked with | Hook (specific to them), credibility (one sentence), value, single low-friction ask. Polished, not casual. |
| **Sensitive / Difficult** | Hard messages, declines, pushback to Tom or Harry, dropping an ambassador, telling a supplier the work isn't right | Direct opener (no burying the lead), the message, next steps, availability for questions. Tone calibrated to relationship: a familiar recipient still gets directness, just wrapped warmer. **Use [[Difficult Conversation Prep]] for stakes-high cases.** |

---

## Message Architecture

Every draft, regardless of tone, follows this architecture. Recipients decide in the first sentence whether to read on. Bury the ask and you cap your response rate.

**BLUF (Bottom Line Up Front).** Lead with what you want or what you are telling them. State the conclusion or ask in the first sentence, then context, evidence, next steps. Tom and Harry read on phone. So do most suppliers and ambassadors. Skim is the default mode.

**One ask per message.** If the message has more than one thing for the recipient to do, either combine them into one clear next step or write two messages. Multi-ask emails get half-replied or ignored.

**Above-the-fold ask.** On a phone screen the recipient sees three or four lines. The ask, or what the message is about, lands in those lines.

**Short paragraphs.** 3 to 4 lines max. White space is a feature.

**Last substantive sentence is the next step.** Do not end on a pleasantry. End on what happens next or what's needed from them.

---

## Cold Outreach Formula

For first-touch comms to people she doesn't know (potential ambassadors, partner brands, suppliers):

1. **Hook (one specific reason).** Concrete proof she researched them. Not "I came across your profile". Try "I saw your post on [specific topic] last week" or "Luke at Fade Golf mentioned your work with [thing]."
2. **Credibility (one sentence).** Single line on why she's worth reading. "I run marketing at Fade Group across Fade Golf, Stride Clinics, and Fire & Earth Leamington." Not a CV.
3. **Value to them (one sentence).** What's in it for them. "We're looking for one paid ambassador for the Fade Golf simulator membership launch and your audience overlap looks like a fit." Not "I'd love to introduce myself".
4. **Single low-friction ask.** A 15-minute call, a yes/no question, an opt-in for more info. Never two asks. Never "let me know your thoughts".

**Cold outreach anti-patterns:**
- "I hope this finds you well" / "Just touching base" / "I wanted to reach out"
- Autobiography in paragraph one
- Asking for "a quick call to introduce yourself" (recipient gains nothing)
- Multi-paragraph pitches before the ask

Elite cold outreach lands under 100 words.

---

## Pushback and Holding Position Patterns

Used when Maddie is pushing back, declining, renegotiating, or holding a position with someone whose cooperation she still wants. Translated from Chris Voss tactical empathy practice for written use. **Particularly important for pushing back to Tom or Harry given her disposition flag.**

**Label, do not argue.** Open with what you sense their position is, in their voice. "It sounds like the priority is X" or "Sounds like the concern is Y." Labels let the recipient correct you without confrontation. They almost always engage when labelled.

**Calibrated questions over assertions.** Instead of "this timeline won't work", try "how am I supposed to land the Stride launch with the GP referral list still pending?" or "what about the original brief is most important to keep?" Invites them to solve with you.

**Avoid "why".** "Why" triggers defensiveness. Use "what" and "how" instead.

**Get to "no", not "yes".** For stale chases or unclear positions, ask a question framed for a "no". "Have you decided to push the launch?" gets engagement; "are you still up for the launch?" begs an awkward yes. People feel safe saying no.

**Mirror selectively.** When the recipient writes something charged, repeat their three to five most important words back in the reply. Signals listening without conceding.

**Anchor with the data, not the opinion.** "Per the brief signed off on 14 May, deliverables were due 28 May" lands harder than "you said you'd send it by now". The fact does the work.

---

## Chase and Escalation Patterns

For chasing replies, deliverables, decisions, or actions that have stalled.

**Soft chase (first follow-up, 5 to 10 days after original).** Short, friendly, reference the previous message by date and topic. End with original ask restated. **No apology for chasing legitimate work.**

**Direct chase (10 to 20 days, or after one soft chase).** Shorter. Reference chase history. Add deadline or alternative path. "If I don't hear back by [date] I'll [specific action]."

**Escalation chase (when soft + direct have failed).** Name the pattern of non-response neutrally, propose a path forward, invite a "no". "I've raised X on [dates] without reply. Have you decided to go in a different direction, or is there a hold on my end I should know about? Happy to close it out either way."

**Universal chase rules:**
- Never start with "Just following up". Start with the ask restated.
- Never apologise for chasing legitimate work.
- Get to "no" rather than begging for "yes" once past two rounds.
- If the recipient is Tom or Harry, chase still escalates but tone stays familiar.

---

## Channel Adjustments

| Channel | Adjustment from base tone |
|---|---|
| Email | Full structure. Subject line specific and informative (never "Following up"). Paragraphs, not headers, unless tone calls for it. |
| Slack DM | Shorter. No subject. Drop the opener if mid-conversation. |
| Slack channel post | Structured but conversational. Bold for one or two key points only if it aids skim. Route to the right channel per [[Slack Workspace]]. |
| WhatsApp | Shortest. No subject. Drop opener. One or two paragraphs max. |
| LinkedIn message | Warmer than email, shorter. Lead with a specific reason for reaching out. |

---

## Universal Rules

These come from CLAUDE.md and apply to every draft:

- **No em or en dashes** (U+2014, U+2013). Use commas, periods, colons, parentheses, or "to" for ranges.
- **British English** throughout (organise, colour, favour, recognise).
- **Mobile-readable by default.** Assume recipient reads on phone. 3 to 4 line paragraphs, single ask above the fold.
- **Maddie's voice, not the recipient's voice.** Don't pre-empt an expert by drafting in their register. Plain English at her level.

**Email sign-off rule:**
- If Maddie's email client has an auto-footer with her name (most marketing email clients do, especially Gmail with Workspace signature), DO NOT add a sign-off. End on the last substantive sentence.
- If she's drafting in a context where no auto-footer applies (LinkedIn, WhatsApp, Slack outside DM, a draft to be sent from someone else's address), add a brief close: "Thanks, Maddie" or "Cheers, Maddie" matching the tone.
- When in doubt, ask before adding a sign-off.

---

## Output Format

For email:

```
Subject: [Specific subject line]

[Greeting per tone],

[Body, paragraphs, no headers unless tone allows]

[Last substantive sentence, no sign-off if Gmail auto-footer applies]
```

For Slack / WhatsApp / LinkedIn:

```
[Body, opener if appropriate, paragraphs, last substantive sentence]
```

---

## Learning Hook

After delivering the draft, if Maddie changes the tone, structure, or specific wording:

1. **Diagnose the delta:** what changed and why. Structural (wrong format), content (wrong tone or detail), logic (missing or unwanted point)?
2. **One-off vs pattern:** would this change improve future drafts, or only this one? Patterns only.
3. **Decide where the rule lives:**
   - **Tone Matrix update:** refine the hallmarks of an existing tone, or add a new row
   - **Channel Adjustments update:** channel-specific rule needs sharpening
   - **New entry in [[Voice Samples]]** (create the file if it doesn't exist yet): real Maddie-authored example for this tone bucket
   - **New entry in [[Contacts]]:** recipient-specific rule ("Harry prefers WhatsApp not email for quick stuff")
4. **Propose before saving:** state where the change goes and what it says, get her nod, then apply.
5. **Don't fire when nothing changed:** if she accepted the draft, skip.

---

## Rules

- **Never deliver a draft without confirming the tone choice if relationship is ambiguous.** One question beats one wrong draft.
- **One clear ask per message.**
- **Email subject lines must be specific.** Format: noun + verb, under 50 characters, action or topic explicit. "Following up", "Quick question", "Touching base" are not subject lines. "Stride run club, signed brief needed by Fri" is.
- **No filler openers.** "I hope this finds you well", "Just touching base", "I wanted to reach out". Cut to the point.
- **Match register to relationship, not to topic.** A serious topic to Tom stays in familiar tone, just handled directly.
- **British English, no em or en dashes, sign-off rule applied.** Non-negotiable.
- **If sensitive, do not soften past clarity.** Direct beats padded. **This is especially important for Maddie given the agree-rather-than-push-back disposition in her Brain.** If the draft hedges to the point of unclarity, push back.
- **Run the Learning Hook every time she corrects a draft.** That's the feedback loop.
- **Pre-send re-read for sensitive, pushback, and difficult drafts.** Read it from the recipient's perspective: on phone, on a bad day, in 30 seconds. If a charged sentence reads worse than intended in that frame, soften the framing without softening the substance.
- **Get to "no", not "yes", on stale chases.**
- **Use the Cold Outreach Formula for first-touch comms.** No autobiography, no two-asks.
- **Use the Pushback patterns for negotiating or holding position.** Label before arguing. Calibrated questions. Avoid "why". Anchor with data.
- **For stakes-high difficult conversations, route to [[Difficult Conversation Prep]] first.** Draft Text writes a single message; Difficult Conversation Prep builds a full conversation plan including anticipated reactions.

---

## Anti-Patterns

- Drafting in Tom's voice. This is Maddie's skill, her voice.
- Adding a "Best, Maddie" close when her Gmail signature already attaches one. Reads as double-sign-off.
- Softening pushback drafts to the point of ambiguity because the recipient is senior. The whole point of the skill (per her disposition flag) is to compensate for that instinct.
- Generic subject lines. "Quick question" gets ignored.
- "Just following up" openers on chases. The chase IS the message; restate the ask.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-21 | Initial creation, adapted from Tom OS master Draft Text. Voice profile defaults to [[Maddie]] (her Brain) until [[Voice Samples]] file exists; the Learning Hook can create that file once real sent examples accumulate. Tone Matrix reframed for her relationship map (Tom and Harry familiar after first 4 weeks, Fade Group colleagues internal-warm, ambassadors / suppliers external-warm, new contacts cold, hard messages sensitive). Cold Outreach reframed to her use cases (ambassadors, partner brands, content collabs). Pushback patterns kept intact with note flagging extra-importance given her agree-not-push-back disposition. Email sign-off rule made conditional on auto-footer presence (will need confirming once her Gmail signature setup is verified). Pre-flight rule and Difficult Conversation Prep routing added. Single file (no extraction). |
| 2026-05-21 | **Step 0 added: Voice samples bootstrap.** First time the skill is invoked AFTER Gmail MCP becomes available AND `Brain/Voice Samples.md` does not yet exist, Maddie is asked once whether to scan her sent folder for 10 to 15 real examples and build the file. Yes / not yet / never (state cached to `.voice-samples-state.json`). Replaces the previous pattern of waiting for the Learning Hook to slowly accumulate samples over corrections; bootstrapping from real sent mail means draft fidelity jumps immediately rather than over weeks of edits. Same extraction methodology Tom OS used (categorise by tone bucket, capture opener / structure / connector / sign-off patterns, extract cross-bucket vocabulary and no-AI-tells). Skill body process renumbered to make the bootstrap Step 0. |
