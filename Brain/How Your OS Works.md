# How Your OS Works

*A plain-English guide to your operating system. Read once for context, dip back in when you want to evolve it. You do not need to understand any of this to use the OS day to day, but the more you know, the more you can shape it to fit you.*

---

## What this OS is, in one paragraph

This is your personal operating system: a folder on your laptop that holds everything Claude needs to be useful to you across Fade Golf, Stride, and Fire & Earth Leamington. It is a filing system, a knowledge base, and a set of repeatable workflows ("skills") that you trigger by typing in plain English. It is built to reduce your repetitive workload so you can spend more time on creative and strategic work. It pushes back when your briefs are weak and it learns the more you use it.

---

## The big idea

Your OS has three layers. You only ever see two of them.

### Layer 1: What you see and use

- **The Brain.** Files that hold what Claude needs to know about you, the three brands, the people you work with, and the tools you use. The Brain grows as you work. When new information comes up, Claude updates the relevant file. You can read any of these any time, they live in plain markdown.
- **The Skills.** Reusable workflows you trigger by phrase. "Hey" runs Daily Briefing. "Expand campaign" runs Campaign Brief Expander. Each skill loads only what it needs and produces a specific output. Skills are also plain markdown, you can read them to see exactly what they will do.
- **The Reviews folder.** Daily logs and weekly summaries Claude writes as you work.

### Layer 2: What runs in the background (mostly invisible)

- **Connections (MCPs).** Pipes between Claude and your tools: Gmail, Calendar, Drive, Slack, Metricool. You set them up once during Install. They mostly just work, and when they do not, Diagnostics tries to fix them.
- **State files.** Tiny files (`.last-diagnostics-run`, `.install-state.json`) that track when things last ran. You do not edit these, they manage themselves.
- **GitHub sync.** Every time you finish a session, the OS pushes a copy of itself to GitHub. Every time you greet Claude in the morning, it pulls the latest. This is how Tom can manage the OS from Australia.

### Layer 3: The admin tier (invisible to you, useful to Tom)

This exists for Tom to see how your OS is performing without him having to ask you. It records WHEN things happened, NOT WHAT you wrote. Your campaign drafts, voice notes, and conversations stay private to you. The admin tier only sees: which skill ran, was it successful, are connections healthy, are Brain files getting stale, did anything break. You do not need to look at this, but you can if you ever want to.

---

## How Claude handles problems

Four severity tiers. You only ever see L3 and L4.

| Tier | What it means | What happens |
|---|---|---|
| L1 routine | Tiny things like a token needing refresh | Auto-fixed silently. You see nothing. |
| L2 patch | Small drift in config or state | Auto-fixed and logged. You see nothing. |
| L3 flag | Something Claude tried to fix but could not | You get a plain-English explanation and three choices: try the fix yourself (Claude walks you through it), escalate to Tom (Claude drafts the Slack message), or defer. |
| L4 freeze | Something serious that could cause harm if touched | Claude stops and does not touch it. You get a notice. Tom is auto-pinged on Slack. |

You can fix L3 issues yourself if you want to. You never have to. Both choices are equally good. The OS is built so you can choose to learn or choose to delegate, every time.

---

## How the OS keeps itself healthy

You do not run weekly checks manually. The OS runs them for you.

- **Diagnostics** runs weekly. It tests every connection and every skill, fixes what it can, surfaces what it cannot. The Monday morning briefing tells you the result.
- **Learning** runs monthly. It scans the Brain for gaps and asks you targeted questions to fill them in. Five minutes of conversation usually closes a month's worth of drift.
- Both fire automatically from your morning greeting. You do not have to remember.

---

## How to evolve the OS

You do not have to do any of this, but if you want to:

### Add a skill
Skills are markdown files in `Skills/`. Look at any existing skill to see the shape. Tell Claude "create a new skill called X that does Y" and it will draft it for you. Critical view always: if the skill is not solving a real recurring need, Claude will push back and say so.

### Update a brand voice
`Brain/Brand Voices/` has one file per brand. When you nail a tone that works, paste 2 or 3 winning posts as reference examples. The next time Campaign Brief Expander or Cross-Platform Repurposer runs, it uses those references.

### Add a new tool to the stack
Tell Claude what tool you want to add. It will ask whether the tool needs a connection (MCP), a command-line tool (CLI), or just a manual integration. The OS prefers the lightest option. Fewer connections means fewer things to break.

### Change a skill's behaviour
Open the skill's markdown file and read the Process section. If you spot something you want different, tell Claude "in skill X, change Y to Z" and it will edit the file and update the skill's changelog. You can also just say "the last Campaign Brief Expander output was too long, can you make it tighter" and Claude will offer to update the skill itself.

### Park a skill
If a skill is not getting used, delete it from `Skills/`. The OS will not miss it.

---

## How Tom is involved

Tom can pull a copy of your OS from GitHub any time. He sees:
- The current state of your Brain (everything that has been added since his last check)
- The OS Health log (what has run, what has broken, what has been fixed)
- The structure of your skills (so he can tune them remotely)

He cannot see:
- The content of any conversation you have had with Claude
- Your campaign drafts, voice notes, email drafts
- Anything you have written but not committed yet

If you ever want to share specific content with Tom (a campaign brief, a strategy doc), commit it to the relevant `Information/` subfolder and tell Claude to push. Anything not committed stays on your laptop only.

---

## When to ask for help

- **If something is broken and you do not want to fix it:** say "escalate" in any conversation. Claude drafts the Slack message to Tom, you hit send.
- **If you want to understand WHY something is the way it is:** ask Claude. "Why does the OS pull from GitHub at the start of the briefing?" gets a real explanation.
- **If you want to change something but are not sure how:** describe the change in plain English, Claude proposes how to do it.

---

## File map (where to look if you want to read)

| Folder | What lives here |
|---|---|
| `Instructions.md` | The master ruleset. Read once for context. |
| `Status.md` | What is going on this week. |
| `Tasks.md` | What needs doing. |
| `Brain/` | What Claude knows. |
| `Skills/` | What Claude does. |
| `Reviews/Daily/` | Daily logs. |
| `Reviews/OS Health/` | The admin tier log (you can look but it is mostly for Tom). |
| `Information/` | Campaign briefs, research, planning docs. |
| `Assets/` | Templates, brand guidelines, asset pointers. |
| `Archive/` | Completed work. |
| `Test/` | Test fixtures Diagnostics uses. You do not need to touch this. |

---

## One last thing

This OS is yours. It works for you. You can change anything you want about how it works. The only rule the OS enforces on itself is that it should make your work better, not just easier. If a change you propose makes the OS faster but worse, Claude will tell you. If a change makes it better, Claude will help you build it.

---

## Linked

- [[Maddie]] for your role and how the OS fits it
- [[Tech Stack]] for what is connected and what is deferred
- [[Brain Directory]] for the OS map
