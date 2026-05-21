# Skill: Teach

---
triggers:
  - "/help"
  - "/explain"
  - "/teach"
  - "how do I"
  - "how does this work"
  - "how does the OS work"
  - "what does [skill name] do"
  - "what's the skill for"
  - "what skill should I use for"
  - "I'm not sure what to say"
  - "I don't know how to"
  - "show me what the OS can do"
  - "what can you do"
  - "is there a way to"
type: Interactive Help
---

**Purpose:** Help Maddie learn and use her OS. Answers questions about how things work, suggests the right skill for a job-to-be-done, offers live demos rather than long descriptions, and routes to Tom when escalation is the right call.

Reads the actual skill files and Brain Directory at runtime. Never duplicates content; always points at canonical sources. Stays in sync with the OS as it evolves because it reads the OS, it doesn't memorise it.

---

## Context

*Load these files before running this skill:*

- [[Brain Directory]] for the OS map (every skill and Brain file, one-line descriptions)
- [[How Your OS Works]] for conceptual framing if the question is "why" or "how does this fit together"
- [[Maddie]] for her disposition, tech comfort level, what kind of explanation will land

*Load on demand based on the question:*

- The specific skill file Maddie asks about (e.g. `Skills/Campaign Brief Expander.md`)
- The relevant brand Brain file if the question is about a specific brand
- [[Tech Stack]] if the question is about tools, MCPs, or CLIs

---

## Quick Start

Maddie says:
- "/help"
- "how do I draft an email"
- "what's the skill for audience research"
- "what does Pre-publish Check do"
- "I'm not sure what to say to get a campaign started"
- "show me what the OS can do"
- "I need Tom's help on something"

She does NOT need to know skill names. She describes the job she wants to do, the skill routes.

---

## When to Use

- Maddie doesn't know which skill to use for a task
- Maddie wants a quick reminder of what a skill does
- Maddie wants to understand HOW the OS works (architecture, Brain, Identity Locks, etc.)
- Maddie has a problem and isn't sure if it's a skill issue, an OS issue, or something to escalate
- First-week onboarding: she's exploring what the OS can do

**Not the right skill?**
- If she wants to RUN a skill, route to that skill, don't explain it (unless she asked for explanation)
- If the OS is broken or a connection is down: route to [[Diagnostics]]
- If she's parking work for later: route to [[Continuation Note]]

---

## /goal integration

```
/goal answer addresses Maddie's actual question (not a generic explanation), points at canonical source files not duplicated content, ends with a single concrete next action (try it now / drill deeper / try a different skill / escalate to Tom), uses British English, no em / en dashes. Stop after 3 turns if Maddie hasn't engaged with a next action.
```

---

## How It Works

Detect the mode from her question. Read the relevant skill or Brain file. Give a short answer (2 to 5 sentences max). Always offer a next action. Bias hard toward "want me to demo this now?" over "here is a long description".

---

## Modes

The skill operates in five modes. Detect mode from the question; switch mode if the conversation evolves.

### Mode 1: Overview

**Trigger phrases:** "show me what the OS can do", "what can you do", "give me the tour", "I'm new to this"

**Behaviour:**
- Don't list all 31 skills. Maddie can't absorb that.
- Group skills by job-to-be-done (mirror the cheat sheet structure).
- Show 5 to 7 example phrases she can say right now, picked for variety not coverage.
- End with: "Want me to demo any of these, or is there a specific job you've got in mind?"

**Example response shape:**

> Your OS covers six main jobs:
>
> 1. **Plan + draft campaigns and content** (Campaign Brief Expander, Filming Brief Generator, Talent Ambassador Brief, Landing Page Brief, Cross-Platform Repurposer)
> 2. **Check work before it ships** (Pre-publish Check, Proofread, Tone Check, Visual Brand Check, Critique)
> 3. **Paid ads** (Google Ads Variation Generator + Keyword Builder)
> 4. **Report on your week and month** (Weekly Slack Report Draft, Monthly Report Draft, Data Pull)
> 5. **Get meetings ready and capture follow-ups** (Meeting Prep Brief, Check My Meetings, Voice Notes)
> 6. **Think and decide** (Grill Me, Critique, Quick Research, Difficult Conversation Prep, Draft Text)
>
> Plus housekeeping (Daily Briefing in the morning, Session End at night, Diagnostics if anything breaks).
>
> Want me to demo one, or have you got a specific job in mind?

### Mode 2: Phrase Lookup ("what do I say")

**Trigger phrases:** "how do I [task]", "what's the skill for [job]", "what do I say to [outcome]", "I want to [job]"

**Behaviour:**
- Identify the skill that matches the job from the Brain Directory.
- Give one or two trigger phrases from that skill's Quick Start.
- Add a one-line "what it does" summary.
- End with: "Want me to run it now? Just say [trigger]."

**Example response:**

> For audience research, that's **Audience Persona Builder**. Just say:
>
> - `audience persona for Stride nail surgery`, or
> - `who is the audience for Fade Golf simulator membership`
>
> It builds a persona file for the brand + service combo, saved to `Brain/Audiences/`.
>
> Want me to run it now?

### Mode 3: Drill-Down ("how does X work")

**Trigger phrases:** "how does X work", "what does X do", "explain X", "walk me through X"

**Behaviour:**
- Open the relevant skill file.
- Pull: Purpose (one sentence), what it does in 2 to 3 bullets (NOT the full Process section), one trigger phrase from Quick Start.
- Offer: "Want the deeper walk-through, want to see it run, or want to know when NOT to use it?"

**Example response:**

> **Pre-publish Check** is the gatekeeper. Maddie says "is this ready to ship" and it runs all three quality skills (Proofread + Tone Check + Visual Brand Check) on the appropriate input parts, then gives one combined verdict.
>
> Use it on finished assets before they go out. For in-flight drafts, use the individual quality skills directly.
>
> Want to see it run on something you've got, or want me to explain the verdict mapping (Provisional Pass, Best-guess, etc.)?

### Mode 4: Troubleshoot ("something's off")

**Trigger phrases:** "something's not working", "it's not doing what I expect", "I think something is broken", "the OS feels stale", "X gave me a weird answer"

**Behaviour:**
1. **Diagnose first.** Ask one targeted question to narrow it: "Is the skill not firing at all, firing but giving wrong output, or pausing partway through?"
2. **Route based on answer:**
   - Connection / MCP / tool failure: route to [[Diagnostics]]
   - Wrong skill running on her phrase: it's a routing issue, suggest a more specific trigger from the skill's Quick Start
   - Generic / stale output (e.g. campaign brief feels off-brand): probably a Brain gap, suggest checking the brand voice file or running [[Audience Persona Builder]]
   - "I don't know which skill" generic confusion: switch to Mode 2 (Phrase Lookup)
3. If still stuck after 2 turns: route to Mode 5 (Escalate).

### Mode 5: Escalate ("I need Tom")

**Trigger phrases:** "I need Tom", "I need to ask Tom", "this needs Tom's input", "escalate"

**Behaviour:**
- Confirm what she wants to send him in one line.
- Offer to draft the message via [[Draft Text]], routed to `#leadership` (default per Tom's preference) or DM as she prefers.
- Add a "what you tried" line so Tom can pick up where she left off. Pulled from the conversation, not asked for again.
- Show the draft for her approval before sending.

**Auto-route to Escalate WITHOUT asking when:**
- The conversation has touched a topic flagged for escalation in [[Difficult Conversation Prep]] (formal HR issue, ambassador contract end, suspected discrimination, supplier commitment beyond her authority)
- Diagnostics has hit an L4 freeze condition

---

## Process

### Step 1: Detect mode

Look at the question. Match against the trigger phrases per mode. If ambiguous, default to Phrase Lookup (Mode 2) because that's the most common case.

### Step 2: Load only what's needed

- Always: [[Brain Directory]]
- If a specific skill is named: that skill file
- If a brand is named: that brand's Brain file
- Don't load files that won't influence the answer.

### Step 3: Answer concisely

Short answer. 2 to 5 sentences max. No long explanations.

### Step 4: Offer ONE next action

Every answer ends with a single, specific next step. Examples:
- "Want me to run it now? Just say [trigger]."
- "Want the deeper walk-through?"
- "Want to try a different skill instead?"
- "Want me to draft a Slack to Tom about this?"

**Never end with "let me know if you have any questions" or other passive close.**

### Step 5: Re-mode if Maddie pivots

If her follow-up question is in a different mode, switch. Don't ask her to restart.

---

## Rules

- **Read the actual file, never paraphrase from memory.** The OS evolves. A 3-week-old description is wrong.
- **Don't dump full Process sections.** Maddie's question is "should I use this", not "let me read the whole skill". Surface 2 to 3 bullets max.
- **Bias toward demoing, not describing.** "Want to see it run on a real example?" beats "Let me explain how it works in detail."
- **Names she doesn't know don't help her.** If she says "I want to build an audience profile" don't reply "Audience Persona Builder exists." Say "you'd run [skill] by saying `[trigger phrase]`. It does X."
- **One next action per answer.** Never offer a menu of three options unless explicitly running Mode 1 (Overview).
- **Route, don't replicate.** This skill never explains how Diagnostics works in detail; it routes to Diagnostics. Same for every other skill.
- **Plain English, no jargon.** "MCP" → "the Slack connection". "P1 bar" → "the basics that need to be in place". Reach for the technical term only if Maddie asks what it means.
- **British English, no em / en dashes.** CLAUDE.md paste-safe rule.
- **No emojis** unless Maddie asks for them.

---

## Anti-Patterns

- Dumping a full skill file as an answer to "what does X do".
- Listing all 31 skills when she asks "what can you do". Group by job, show examples.
- Long abstract explanations of OS architecture when the question was practical. If she asks "how do I do X", don't lecture on the Brain layers.
- Ending answers with passive closes ("let me know if you have any questions"). Always a concrete next action.
- Memorising skill triggers and getting them wrong because the skill changed. Read the file.
- Refusing to demo because it's "just a learning question". If she asks how something works, the best teaching move is to run it on a real example.

---

## First-Week Behaviour

During Maddie's first two weeks (Install state still in `complete-with-onboarding-in-progress` per `.install-state.json`):

- Be more generous with examples. She doesn't yet know what the OS can do.
- Suggest small experiments she can try in 5 minutes. Don't push her into a 30-minute campaign brief expansion her first day.
- When she asks about a skill, also mention one related skill she might not know exists ("by the way, after you draft this, you can run /critique to improve it").
- After the install state flips to `complete`, drop back to the lean default.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-21 | Initial creation, built for Maddie OS onboarding window. Five modes (Overview, Phrase Lookup, Drill-Down, Troubleshoot, Escalate) covering the question types she'll ask in her first weeks. Reads skill files and Brain Directory at runtime to stay in sync as the OS evolves. Biases toward demoing over describing per the original onboarding design brief (Continue - Onboarding Documentation, 2026-05-21). Routes to Diagnostics for technical failures, to Draft Text for Tom escalations, and to specific skills for "how do I X" questions rather than re-explaining their content. First-Week Behaviour block triggers off `.install-state.json` so the skill is more generous during onboarding and leaner after. |
