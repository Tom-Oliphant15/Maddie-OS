# Skill: Grill Me

---
triggers:
  - "grill me"
  - "grill me on this"
  - "stress test this"
  - "challenge this plan"
  - "review our work"
  - "/grill"
type: Critical Review
recommended_model: opus
recommended_model_reason: "Whole point of the skill is to ask hard questions Maddie wouldn't ask herself. Opus pushes back harder and finds holes Sonnet misses; Sonnet trends polite, which kills the skill's value."
---

**Model check (before Step 1):** This skill works best on **Opus**. Grill Me only earns its keep when the questions have teeth; on Sonnet you get politer pushback and weaker holes. Switch with `/model opus` if you're on Sonnet or Haiku, or carry on if you'd rather save your Opus budget for something else this 5-hour window. See [[Model Routing]] for the full picture.

**Purpose:** Critically review a piece of work, plan, or decision by asking probing questions one at a time until every angle is covered and nothing important has been left unexamined.

Different from [[Critique]]:
- **Grill Me** = before the work is finished. Tests plans, decisions, briefs, positioning, campaign ideas.
- **Critique** = after the work is finished. Iteratively improves a near-final deliverable.

---

## Context

*Load these files before running this skill:*

- [[Brain Directory]], identify which brand or topic files are relevant, then load them
- The relevant brand Brain file (`Brain/Businesses/[Brand].md`) if the work is brand-specific
- The relevant Status.md section or Tasks.md entry if the work ties to live tracking

---

## Quick Start

Maddie says:
- "grill me on this campaign idea"
- "stress test this Stride brief"
- "challenge this Fade Golf plan"
- "review what I just wrote"
- "/grill"

---

## When to Use

- Maddie has drafted a campaign plan, brief, or strategic call and wants it pressure-tested before sending to Tom or Harry
- Maddie is about to commit budget, sign off a shoot day, or lock a creative direction
- A decision feels right but she wants the holes found before, not after
- Before closing out a piece of work she'll be judged on

**Not the right skill?** If the deliverable is finished and about to be published or sent, use [[Critique]] instead. Grill Me is for plans and decisions; Critique is for iteratively improving finished output.

---

## /goal integration

```
/goal output covers all relevant grill angles for the depth tier chosen, pre-mortem is included for standard and deep tiers, every weak answer is followed up not accepted, ends with a written summary listing what holds up, gaps, risks, and next actions, no question asked twice. Stop after 25 turns if not met.
```

---

## How It Works

Load relevant context first. Ask one sharp question at a time. Do not stack questions, that dilutes the process. Each question digs into a different angle: risks, gaps, assumptions, alternatives, dependencies, second-order effects. Keep pushing until satisfied that nothing significant has been missed. End with a clear written summary.

---

## What's Appropriate Here

Maddie is a junior marketing lead making real campaign and budget calls for three small UK businesses (Fade Golf, Stride Clinics, Fire & Earth Leamington). Decisions touch shoot days, ambassador asks, ad spend, content strategy, and partnership pitches. She tends to agree rather than push back, so the grill must do the pushing for her.

**What this skill does at Maddie's scale:**
- Surfaces optimism bias before a brief lands with Tom or Harry
- Forces her to articulate why the idea works, not just that it works
- Uses Klein's prospective-hindsight technique to upgrade risk forecasting by roughly 30%
- Builds her muscle for spotting holes in her own thinking, so over time she grills herself

**What this skill does NOT do:**
- Multi-day red team exercises
- Formal pre-mortem workshops
- Replace expert input (legal, clinical, financial); pair with Tom or the relevant expert when those are at stake

---

## Depth Tiers

Pick depth based on stakes and reversibility. Ask Maddie which tier; if unspecified, default to Standard.

| Tier | When | Roughly |
|---|---|---|
| **Light grill** | Low-stakes, easily reversed (a single post, a small experiment) | 3 to 5 questions |
| **Standard grill** | Real money, partner-facing, or campaign-level commitment | 8 to 12 questions, pre-mortem mandatory |
| **Deep grill** | Hard to reverse (relaunch, rebrand, ambassador signing, big shoot day) | 15+ questions, full angle sweep |

---

## Process

### 1. Identify what's being reviewed

If Maddie has not specified, ask: "What are we grilling, a campaign plan, a brief, a decision, or today's work?"

Load the relevant Brain and project files based on her answer.

### 2. Get her brief

Ask her to summarise the work or decision in 2 to 3 sentences. This anchors the review and surfaces her own understanding before the questions begin.

### 3. Grill

Ask one probing question at a time. Wait for her answer before asking the next. Work through these angles, not in fixed order, and not all will apply every time. **For Standard and Deep grill, the Pre-Mortem question is mandatory.** It is the single highest-leverage question in this skill.

**Core angles (Light grill picks 3 to 5 from these):**

- **Gaps**: What has not been addressed yet that should be?
- **Risks**: What could go wrong? What is the worst case?
- **Assumptions**: What are you assuming is true that might not be?
- **Alternatives**: What options did you not consider? Why was this path chosen?
- **Dependencies**: What does this rely on that is outside your control?
- **Second-order effects**: What does this change downstream? Who else is affected?
- **Reversibility**: If this turns out wrong, how hard is it to undo?
- **Clarity**: If Tom picked this up cold tomorrow, would he understand it?
- **Completeness**: Is there anything half-finished that needs resolving before this is truly done?

**Standard grill adds:**

- **Pre-mortem (Klein technique)**: "Imagine it is six months from now and this campaign failed badly. Not slightly underperformed, failed. Write down every reason that could have caused that." The grammatical shift from "what could go wrong" to "why did this fail" activates prospective hindsight and improves risk forecasting by roughly 30%. Push for at least three concrete failure stories, not abstract risks.
- **Cost-of-being-wrong asymmetry**: "What does it cost if you are right? What does it cost if you are wrong? Is the asymmetry tolerable?"
- **Confidence calibration**: "How confident are you on a 0 to 100 scale? What would make you change your mind?" If she cannot name what would change her mind, she is committed, not reasoning.

**Deep grill adds:**

- **Adversary perspective**: "Who would push back on this, and what is the strongest case against it?" Forces her out of her own frame.
- **Sunk cost check**: "Are you committed because the analysis says go, or because you have already spent time on this?"
- **Outcomes anchor**: If the work has stated outcomes (campaign goal, business objective), test whether the decision actually drives them, or has drifted.
- **Dumbest-question test**: "What is the most basic question someone uninformed would ask about this?" The obvious thing is often missing.

Keep pressing on any answer that feels vague, optimistic, or incomplete. A good answer closes the question. A weak answer opens another.

### 4. Know when to stop

Stop when:
- All relevant angles have been covered
- Her answers are consistently clear and well-reasoned
- No new gaps or risks are surfacing

Do not stop just because she sounds confident. Stop when the work earns it.

### 5. Produce a review summary

Present a written summary covering:
- **What was reviewed**, brief description
- **What holds up**, things that are solid
- **Gaps identified**, anything that needs more work
- **Risks flagged**, things to watch or mitigate
- **Recommended actions**, clear next steps

Ask: "Anything to add or push back on before I save this?"

### 6. Save and update

Save the summary to `Reviews/Grills/[YYYY-MM-DD] [Topic].md`. Create the folder if missing. Update Tasks.md with any new actions. Update Status.md if the grill materially changed the picture for the current week.

---

## Best Practices

- One question at a time, never a list
- Do not accept "yes that's fine" as an answer, push for substance
- Be direct, not polite, the point is to find problems before Tom or Harry does
- If something is genuinely solid, say so, this is not about being difficult, it is about being thorough
- Flag anything that should become a task immediately
- **Pre-mortem wording matters.** Frame past tense ("it failed, why?") not future-conditional ("what could go wrong?"). The grammatical shift is the entire point of the technique.
- **Force concrete failure stories, not abstract risks.** "We lost the Stride nail surgery push because the new GPs we relied on stopped referring after the August holiday" beats "referral risk".
- **Confidence calibration cuts through committed-mode answers.** If she is already at 90+ on something she has asked to grill, that gap is itself a signal.

---

## Anti-Patterns

- Stacking three questions in one turn. Always one at a time.
- Accepting the first answer when it is vague. Follow up with "say more about that" or "what specifically".
- Skipping the pre-mortem on a Standard or Deep grill because the conversation feels like it is going well.
- Saving the summary in chat only. It must land in `Reviews/Grills/` so she can return to it weeks later.

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-21 | Initial creation, adapted from Tom OS master Grill Me. Repurposed for Maddie's junior-marketing context: scale shifted from solo-operator-with-real-money decisions to campaign/brief/shoot/ambassador decisions; What's Appropriate Here rewritten; angle examples retuned (Tom→Maddie, Liv example→Stride GP referrals); save path moved to `Reviews/Grills/`; expanded the agree-not-push-back framing per her Brain so the skill compensates for her disposition. |
