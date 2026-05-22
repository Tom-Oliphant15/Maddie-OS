# Maddie OS, Model Routing

*Which Claude model to use for which job, and why. Lives here as the reference; the 5 heaviest skills also check this when they fire. Read it any time by saying "which model", "model routing", or "/help model".*

---

## TL;DR

You're on the **Pro plan**. Default model is **Sonnet**. Stay on Sonnet for almost everything. Switch to **Opus** for the five heavyweight skills below. **Haiku** is for mechanical / short jobs only.

Switching models in Claude Code: type `/model` to see options, or `/model opus` / `/model sonnet` / `/model haiku` to switch directly. The switch takes effect on the next message you send.

If you want to see how much usage you have left in your current 5-hour window: `/status`.

---

## The three models in one line each

| Model | What it's for | Maddie's day |
|---|---|---|
| **Opus** | Deep reasoning, long synthesis, adversarial / nuanced output. Slower + uses more of your Pro allowance per message. | Reach for it on the 5 skills listed below. |
| **Sonnet** | Balanced. Good at almost everything. Fast enough, smart enough. The Pro plan default. | 90% of your day. |
| **Haiku** | Fast and cheap. Lower depth. Fine for mechanical / pattern-matching work. Uses very little of your allowance. | Proofread of short text, Session End, simple file lookups. |

---

## When to use Opus, by skill

Five skills produce **materially better** output on Opus. Switch to Opus before firing these, then back to Sonnet for the next thing.

| Skill | Why Opus |
|---|---|
| **Campaign Brief Expander** | 18-section professional brief, requires deep creative + analytical synthesis. Sonnet output is thinner, more generic. Opus gets you closer to a brief you'd send without major edits. |
| **Critique** | 4-agent iterative chain (Structure, Clarity, Brutal Critic, Accuracy). Each agent benefits from depth; on Sonnet the critic agent is too polite. |
| **Grill Me** | The skill's job is to ask hard questions you wouldn't ask yourself. Opus pushes back harder and finds holes Sonnet misses. |
| **Difficult Conversation Prep** | Exact phrasing for high-stakes comms (HR, ambassador end, supplier pushback). Opus nuance matters here. |
| **Audience Persona Builder** | Long synthesis pass across research + Brain + your inline input. Opus produces personas with sharper edges; Sonnet trends toward generic demographic descriptions. |

These five skills will check at the start: *"This skill works best on Opus. Switch with /model opus or carry on if you'd rather save the Opus budget for something else this window."* One line, then they proceed either way.

---

## When Sonnet (default) is fine

Everything else. Examples:

- **Daily Briefing** — multi-source synthesis but structured, Sonnet handles it
- **Draft Text** — email / Slack / WhatsApp drafting at brand voice
- **Tone Check** — voice match, Sonnet has the nuance
- **Visual Brand Check** — multimodal (needs vision), Sonnet has it
- **Meeting Prep Brief** — structured output from inputs
- **Filming Brief Generator** — long structured, Sonnet fine
- **Talent / Ambassador Brief** — compliance is rule-based, Sonnet enough
- **Landing Page Brief** — structured, no need to escalate
- **Google Ads Variation Generator + Keyword Builder** — both Sonnet
- **Quick Research** — WebSearch + synthesis, Sonnet
- **Weekly Slack Report Draft + Monthly Report Draft** — structured reporting
- **Slack Search** — read-only search, definitely Sonnet
- **Pre-publish Check** — orchestrator, fires sub-skills which each have their own needs
- **Audience Persona Builder** is listed above as Opus-recommended but works on Sonnet too if you're on a budget

---

## When Haiku is the right call

Short, mechanical, pattern-matching jobs. Saves your Sonnet and Opus allowance for the work that needs it.

| Skill | Why Haiku is fine |
|---|---|
| **Proofread** (text only) | Spelling, grammar, punctuation. Pattern-matching, Haiku handles it. Visual asset proofreading still wants Sonnet for the vision side. |
| **Session End** | Mostly file ops + git. Mechanical. |
| **Continuation Note** | Structured save-state writing. |

For any other skill, default to Sonnet rather than downgrading to Haiku — the quality drop usually isn't worth the saving.

---

## Pro plan usage strategy

Pro gives you a usage allowance per 5-hour rolling window. Heavier models eat the allowance faster.

**Practical patterns that help:**

- **Batch heavy work.** If you've got a Campaign Brief Expander to run on Opus, do it first thing in a window when you have full allowance. Don't run three of them back-to-back in the same window.
- **Save Opus for one or two pieces of real-stakes work per window**, not every task.
- **If you hit a rate limit mid-task:** Claude Code tells you. Wait for the next window or switch to Sonnet to finish. Your Brain + Status updates are preserved either way.
- **`/status` shows your current allowance**, useful if you're about to start a heavy task and want to check headroom.
- **If you regularly run out of Opus allowance and need more**, that's a Pro-vs-Max conversation to have with Tom. Don't downgrade quality on the work that matters; tell Tom you're hitting limits.

---

## Anti-patterns

- **Running Campaign Brief Expander on Haiku to save tokens.** The output will be generic and you'll spend more time editing than you saved. Run on Opus or Sonnet.
- **Using Opus for Session End or Proofread of a short paragraph.** Waste of allowance. Default down.
- **Switching models mid-skill.** The skill might lose context on the switch in some cases. Pick the model before firing, stick with it through.
- **Worrying about model choice on small skills.** Daily Briefing, Quick Research, Tone Check — just stay on Sonnet. The OS only nudges on the 5 skills where the choice actually matters.

---

*Linked from: [[Brain Directory#Onboarding]], [[Daily Cheat Sheet#Model routing]], all 5 heavyweight skills' Step 0 model check.*
