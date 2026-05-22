---
name: Difficult Conversation Prep
description: Prepares Maddie for difficult conversations using established methodology (Crucial Conversations, Getting to Yes, NVC, Radical Candor). Separates facts from interpretation, surfaces underlying interests, builds the hard message in Observation-Feeling-Need-Request structure, anticipates reactions with de-escalation moves, sets walk-away grounded in BATNA. Outputs exact phrasing and a follow-up plan.
triggers:
  - "help me prepare for a difficult conversation"
  - "I need to talk to someone about"
  - "how do I approach this conversation"
  - "prepare me for a tough talk"
  - "I need to push back on"
  - "how should I handle this conversation"
  - "I'm avoiding this conversation"
  - "/difficult-conversation"
type: Recipe
recommended_model: opus
recommended_model_reason: "Exact phrasing for high-stakes comms (HR, ambassador end, supplier pushback, salary). Opus nuance materially affects the quality of the suggested wording. Sonnet phrasing tends to be more generic / corporate."
---

# Skill: Difficult Conversation Prep

**Model check (before Step 1):** This skill works best on **Opus**. The exact phrasing for high-stakes comms is the whole product; Opus nuance affects it directly. Switch with `/model opus` if you're on Sonnet or Haiku, or carry on if you'd rather save your Opus budget for something else this 5-hour window. See [[Model Routing]] for the full picture.

**Purpose:** Build Maddie a usable conversation plan for any tough conversation, internal (Tom, Harry, future hires), external (ambassadors, suppliers, agencies), or personal. The output draws on tested methodology, gives her exact words for the hard parts, names the predictable pushback with the response to each, sets non-negotiables grounded in her real alternative, and ends with a follow-up plan.

---

## Context

*Load these Brain files before running this skill:*

- [[Maddie]] for working style, disposition (tends to agree, needs to challenge more), relationships to Tom + Harry
- [[Contacts]] for the other person if internal Fade Group
- [[How Your OS Works]] for output style and no-em-dash rule

*Load business-specific Brain files when the conversation is brand-specific:*

- The relevant brand Brain file (`Brain/Businesses/[Brand].md`) if the conversation is about that brand's strategy, decisions, or relationships

---

## Quick Start

Maddie says:
- "help me prep for a difficult conversation with Harry about the F&E direction"
- "I need to push back on Tom about the Stride launch timing"
- "I'm avoiding the conversation with Luke about the brief"
- "prep me for the talk with the agency"
- "/difficult-conversation"

Tell me who, what about, and what outcome you want. The more you give me about why it feels hard and what you think they'll say, the more useful the prep.

---

## When to Use

- Pushing back on Tom or Harry on a direction Maddie disagrees with
- Telling an ambassador the brief isn't working or they've missed a deadline
- Telling a supplier or agency the work isn't right
- Internal disagreement with Harry on a brand direction
- Delivering bad news (cancelling a shoot, dropping an ambassador, pulling a campaign)
- Receiving difficult feedback from Tom or Harry (use Receiving Mode below)
- Any conversation Maddie is avoiding because it feels hard

---

## What Professionals Expect

Coaches, mediators, and leadership development practitioners do not wing difficult conversations. They prep against well-established frameworks. A serious conversation plan does these things:

1. **Separates facts from the story.** People act on the story they tell themselves about the facts, not the facts. Going in with the story disguised as fact is the most common failure mode.
2. **Clarifies the real motive (Start with Heart).** What does Maddie actually want for herself, for them, for the relationship? "I want to be right" or "I want them to feel bad" are warning signs.
3. **Surfaces interests, not just positions.** Position = "you must do X". Interest = "I need to feel respected", "I need cash by Q3", "I need to protect my reputation". Deals get made on interests.
4. **Knows the alternative (BATNA).** What does Maddie do if no agreement is reached? Without a clear BATNA, walk-away feels like a bluff.
5. **Builds the hard message in OFNR structure.** Observation (factual), Feeling (named honestly), Need (universal need underneath), Request (specific, doable, present-tense, open to "no"). Cleanest way to deliver something hard without triggering defensiveness.
6. **Cares personally AND challenges directly.** Caring without challenging = Ruinous Empathy. Challenging without caring = Obnoxious Aggression. The output never lets her soften the message at the cost of being clear.
7. **Anticipates how safety drops** and has explicit moves to restore it. When the other person goes silent, deflects, or attacks, the move is to step out of content and rebuild safety, not push harder.
8. **Plans the follow-up.** A conversation that ends with "let's talk again soon" and no agreed actions is a conversation that has to happen again. Pros leave with a written summary and next step.
9. **Preps Maddie's own state.** If she walks in dysregulated (anxious, defensive, avoiding eye contact), the conversation goes worse. Brief anchor included before she goes in.

---

## /goal integration

```
/goal output covers all relevant stages for the conversation type, exact words given for openings + hard message (OFNR) + anticipated reactions + closings, BATNA set when negotiation, follow-up plan with written summary + agreed actions + dates, state prep included. Stop after the plan is complete and Maddie has had a chance to role-play if she wants.
```

---

## Process

Work the prep in this sequence. The skill scales: a quick personal chat doesn't need all stages. Lower-stakes conversations can skip Stages 5, 6, and 11.

### Stage 1: Intake and Classify

Capture: who, what, desired outcome, what makes it hard, what she's worried they'll say, any constraints.

Identify conversation type:
- **Pushing back upward** (Tom or Harry on direction or decision)
- **Holding someone to account** (ambassador, supplier, agency on deliverable or behaviour)
- **Delivering bad news** (cancelling a shoot, ending an ambassador relationship, pulling a campaign)
- **Renegotiation** (commercial terms with supplier or agency)
- **Feedback** (lower stakes, growth-oriented)
- **Receiving difficult feedback** (use Receiving Mode below)
- **Personal**

Identify relationship type and power dynamic (who holds what kind of power).

### Stage 2: Start with Heart (Maddie's real motive)

Prompt her to answer in order:
- What do I really want for myself out of this conversation?
- What do I really want for them?
- What do I really want for the relationship?

If the honest answer is something she wouldn't say out loud ("I want to win", "I want them to feel bad", "I want to avoid having this conversation"), surface it. The conversation works only when her motive is one she can stand behind.

### Stage 3: Master the Story (facts vs interpretation)

Two columns:
- **Facts.** What actually happened, verifiable, observable. Dates, words said, actions taken, numbers.
- **Story Maddie is telling herself.** What she has concluded those facts mean about the other person, the relationship, the future.

She goes into the conversation with the facts. The story stays in her head unless genuinely useful to share, framed as story not as truth ("the story I'm telling myself is...").

### Stage 4: Interests Not Positions

For each party:
- **Stated position.** What they are asking for or doing.
- **Underlying interest.** The need that position is meeting (respect, security, autonomy, control, recognition, fairness, cash flow, reputation).

A position-only conversation is a fight. An interests conversation has room for options.

### Stage 5: BATNA / WATNA (negotiations only)

Skip for pure feedback / personal / receiving feedback.

- **BATNA.** Best Alternative To a Negotiated Agreement. If no deal, what does Maddie actually do? Be specific.
- **WATNA.** Worst Alternative. Worst case if no deal.
- **Their BATNA.** What is their alternative? Often weaker than she assumes.

Walk-away point anchored to "worse than my BATNA".

### Stage 6: Power Dynamic Check

Note explicitly who holds power, what kind (positional, financial, informational, exit options), and how that should shape framing.

**For pushing back upward (Tom or Harry):** the power dynamic is asymmetric. The framing is "I want us to get the best outcome and I see something you might not", not "you're wrong". Maddie has positional disadvantage but informational advantage (closer to the work). Use that frame.

**For holding ambassadors / suppliers / agencies to account:** Maddie holds the commercial relationship. The framing is "the work isn't where we need it for this commitment", grounded in the brief and the contract, not personal.

### Stage 7: What They Probably Want (their side)

Put her in the other person's shoes for 60 seconds:
- What do they want out of this conversation?
- What are they afraid will happen?
- What story are they likely telling themselves about Maddie?

Used in framing, not weaponised. Empathy for their position is the difference between a conversation that lands and one that escalates.

### Stage 8: Build the Opening

Three opening options:
- **Direct.** Lead with the issue. "I want to talk about X. Here's what I've observed..."
- **Soft.** Lead with context or appreciation. Then pivot.
- **Question-led.** "How are things from your side on X?"

Each option in exact words. She picks the one that fits the relationship.

### Stage 9: Build the Hard Message in OFNR

For the central thing she needs to say:

- **Observation.** Factual. "Last Tuesday on the Stride brief, when I flagged the GP referral timing, you said..."
- **Feeling.** Honest emotional state. "I felt dismissed."
- **Need.** Universal need underneath. "I need to be able to raise risks I see in the work."
- **Request.** Specific, doable, present-tense, open to "no". "Would you be open to giving me 60 seconds to finish the point next time, even if you disagree?"

OFNR is not the only structure but is the most reliable for the hardest message. Default to OFNR for the central point, freer language around it.

### Stage 10: Anticipated Reactions and De-escalation

Identify 4 to 6 specific reactions she's worried about:
- Defensive ("That's not what happened")
- Deflecting ("Well you also...")
- Dismissive ("That's not how it works in marketing")
- Counter-attacking
- Agreeing too easily (often means they haven't really heard it)
- Asking for time
- For upward conversations: pulling rank ("I've been doing this longer")

For each, her response, word for word.

Where safety drops (silence, attack, shutdown), the move is **step out of content and rebuild safety first**:
- Name what is happening: "I can see this is landing hard. Can we pause?"
- Restate mutual purpose: "I'm not here to attack. I'm here because I want us to land this campaign well."
- Acknowledge their position: "I hear you see it differently. Can you walk me through it?"
- Then return to content.

### Stage 11: Non-Negotiables

| Level | What it looks like |
|---|---|
| Must achieve | Minimum acceptable outcome. Below this, the conversation hasn't done its job. |
| Ideal outcome | What full success looks like. |
| Walk-away point | Trigger for ending the conversation, escalating to Tom, or invoking BATNA. |

### Stage 12: Closing + Follow-up Plan

Three closing options:
- **If resolved.** Confirm what was agreed: who does what by when, how reviewed.
- **If unresolved.** Confirm the gap, name the next step (another conversation, escalation to Tom, etc.), set a date.
- **If needs follow-up.** Pause and agree a return point, in writing.

Follow-up must include:
- Written summary (email or Slack) within 24 hours, what was discussed, what was agreed, what each person committed to
- For agreements with externals (ambassadors, suppliers, agencies): confirm in writing before drift sets in
- Update Tasks.md and the relevant brand Status section if commitments were made

### Stage 13: Maddie's State Prep

Before the conversation, she needs:
- **One thing to remember.** Single sentence reminding her of the real motive.
- **The move when triggered.** What she does if her own emotion rises (breath, drink water, restate the question, ask for a 5-minute break).
- **What success feels like.** Calm voice, slowed pace, willing to hear it even if uncomfortable.

### Stage 14: Role-Play Offer

Ask if she wants to run it with Claude playing the other person. Default scenario: the version she's most worried about.

---

## Receiving Mode

When the conversation is one Maddie is **receiving** (Tom or Harry sitting her down to deliver something hard), the skill flips:

- **Stage 2 becomes:** what does she want her own behaviour to look like? (calm, curious, not defensive)
- **Stage 3 stays:** separate what they're saying (facts as they see them) from her own story
- **Stage 9 becomes:** what she'll ask, not what she'll say. Two or three questions to get to their real concern.
- **Stage 10 becomes:** how she'll respond if she disagrees, if she's surprised, if she gets emotional. Default move: "I want to think about this before I respond. Can we pick this up again tomorrow?"
- **Stage 12 becomes:** what she takes away (a clear ask, a clear next step) and what she writes down.

---

## Output Format

```markdown
## Conversation Prep: [Who] - [Topic]
**Type:** [Pushing back / Holding to account / Bad news / Renegotiation / Feedback / Receiving / Personal]
**Relationship:** [Internal Tom/Harry / Ambassador / Supplier / Agency / Personal]
**Escalate to Tom before having this:** [No / Yes - one-line reason]

### Before You Start

**Real motive (Start with Heart)**
- For me: [...]
- For them: [...]
- For the relationship: [...]

**Facts vs Story**
| Facts (verifiable) | Story (your interpretation) |
|---|---|
| | |

**Interests not positions**
- **Their stated position:** [...]
- **Their likely underlying interest:** [...]
- **Your stated position:** [...]
- **Your underlying interest:** [...]

**Your alternative (BATNA)** - *if negotiation*

**Power dynamic note**

**What they probably want**

**Timing and setting**

### Opening Options

**Direct:** "[exact words]"
**Soft:** "[exact words]"
**Question-led:** "[exact words]"

### The Hard Message (OFNR)

**Observation:** "[factual, no judgment]"
**Feeling:** "[honest emotional state]"
**Need:** "[universal need underneath]"
**Request:** "[specific, doable, present-tense, open to no]"

### Anticipated Reactions

**If they [defend / deflect / dismiss / counter-attack / agree too easily / pull rank]:**
> "[response, exact words]"

*If safety drops: name it, restate mutual purpose, acknowledge their view, then return.*

### Non-Negotiables

| Level | What it looks like |
|---|---|
| Must achieve | |
| Ideal outcome | |
| Walk-away point | |

### Closing Options

**If resolved:** "[exact words]" + confirm who does what by when.
**If unresolved:** "[exact words]" + next step, by when.
**If needs follow-up:** "[exact words]" + written summary by tomorrow.

### Follow-up Plan

- Written summary within 24 hours: yes
- Agreed actions logged to Tasks.md: yes
- Brand Status updated if commitments made: yes
- Next conversation if needed: [date / trigger]

### Your State

- **One thing to remember:** [...]
- **Move when triggered:** [...]
- **What success feels like:** calm voice, slowed pace, willing to hear it

---
*Want to role-play this? Say "let's run through it" and I'll play [their name].*
```

---

## Rules

- **Exact words always.** Generic advice is not output. Every key sentence in quotes.
- **Facts and story always separated.** Never let her go in with interpretation disguised as fact.
- **Real motive surfaced.** If her honest answer to "what do I want for them" is "to feel bad", call it out.
- **Interests, not just positions.** Pull underlying interest for both parties.
- **BATNA for negotiations is mandatory.** Walk-away without BATNA is arbitrary.
- **OFNR for the central hard message.**
- **Step-out-of-content move included in every prep.**
- **No Ruinous Empathy.** If the prep softens the message to the point of unclarity, push back. Care AND challenge.
- **Plain English in her voice.** No corporate phrasing.
- **No em / en dashes.** CLAUDE.md paste-safe rule.
- **Role-play offer at the end, always.**
- **Escalate where the situation requires it.** See below.

---

## Escalation

The skill produces the prep brief. It does NOT replace Tom or the right professional in these situations:

- **Anything that touches HR or formal employment.** Maddie is not Tom or Harry's HR function. If a conversation involves another Fade Group employee in a way that has performance / conduct / discrimination implications, escalate to Tom before the conversation.
- **Conversation with an ambassador about ending the relationship.** Escalate to Tom. Likely contract / ASA implications.
- **Conversation involving suspected discrimination, harassment, or whistleblowing.** Escalate immediately to Tom. Statutory duties apply.
- **Conversation with a supplier where Maddie may need to commit money beyond her authority.** Escalate first.
- **Conversation where Maddie suspects mental health crisis on the other side.** Pause, consider whether a wellbeing professional / GP is the right next step. Do not press for an outcome.

When escalation is required, the prep opens with "Escalate to Tom before having this conversation" at the top, not buried.

---

## Anti-Patterns

- Skipping the real-motive question because it feels uncomfortable. The motive check is the most important stage.
- Going in with the story as if it were fact. "You don't listen to me" is a story. "Last Tuesday I raised X and you cut me off after 4 seconds" is fact.
- Writing generic advice instead of exact words. "Be assertive" is not the output. The exact opening line is.
- Skipping role-play offer.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-21 | Initial creation, adapted from Tom OS master Difficult Conversation Prep. Repurposed for Maddie's reality (junior, agree-rather-than-push-back disposition per her Brain). UK ACAS / employer-side performance frame dropped (not her role). Added Pushing Back Upward as primary conversation type given the disposition flag. Added Receiving Mode for when she's on the receiving end of Tom or Harry feedback. Escalation block rewritten to escalate to Tom (not external solicitor) since she's the employee not the principal. Kept Crucial Conversations / OFNR / BATNA / Radical Candor framework intact. Single file (354 lines), no separate guides folder. |
