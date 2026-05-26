# Open Questions

*Living registry of everything the OS doesn't know yet but needs to. Every unanswered question, deferred Brain gap, and stub-state decision lives here until resolved. Read by [[Daily Briefing]] each morning and surfaced as a recommendation block until cleared.*

*Last reviewed: 2026-05-22 (initial creation post-bootstrap form, populated with the 3 P3 skill stubs blocked on upstream decisions).*

---

## How this file works

**When a row gets added:**
- Learning skill surfaces a Brain or skill gap that Maddie can't answer in the moment → writes a row here
- Live Brain Update during normal work surfaces a follow-up that needs an external answer → writes a row here
- A skill cold-test surfaces a "depends on X" blocker → writes a row here

**When a row gets resolved:**
- Move it to the **Resolved** section below with the date and the answer
- Update the relevant Brain or skill file with the answer
- Daily Briefing stops surfacing it the next morning

**Status values:**
- **Open** — actively waiting on the answer
- **Blocked** — waiting on an upstream decision (other person, software, dependency)
- **Parked** — Maddie has deferred answering; will re-ask on next /learning
- **Resolved** — answered, captured in Brain, can move to Resolved section

---

## Active rows

| Question | Owner | Blocker / Why open | ETA | Discovered | Status |
|---|---|---|---|---|---|
| Which recording software will Maddie use for solo voice notes? (decides shape of Voice Notes skill.) | Tom + Maddie | No decision yet on Otter vs alternative. Voice Notes skill is a stub pending this. | TBC (likely in-person session window) | 2026-05-18 (Maddie OS scaffold) | Blocked |
| Which scheduling software will Maddie use for cross-platform publishing? (decides shape of Cross-Platform Repurposer skill.) | Tom + Maddie | No decision yet on Metricool publishing vs Buffer vs Later vs other. Cross-Platform Repurposer is a stub pending this. | TBC (likely Phase 2 window) | 2026-05-18 (Maddie OS scaffold) | Blocked |
| Metricool MCP setup for all 3 brands (Fade Golf, Stride, F&E Leamington). Until this lands, Data Pull skill is a stub and weekly/monthly reports run without Metricool data. | Tom + Maddie | Metricool OAuth scheduled "next week" per 2026-05-22 conversation. Install Step 8 defers cleanly until done. | Next week (2026-05-26 onwards) | 2026-05-18 (Maddie OS scaffold) | Blocked |
| Stride Google tag / conversion tracking fix (with Mark Hudson). Until done, Stride Google Ads Keyword Builder runs as 0-conversion / Manual CPC mode. | Mark Hudson + Tom | Mark needs WordPress admin login from Harry (Jetpack blocked his invite). | This week | 2026-05-19 (Tasks.md) | Blocked |
| Master Marketing Document work locks brand voices + guidelines formally. Until then, voice + guidelines files are "Live" but not formally locked. | Tom + Maddie | Meeting with Tom today (2026-05-26) — resolution imminent. | 2026-05-26 | 2026-05-19 (Status.md) | Open |
| Brand identity sweep — confirm or create full visual spec for all 3 brands: typography (headline + body fonts), accent colours (Fade Golf accent TBC, Stride + F&E TBC), composition rules (headline alignment, CTA placement, margin discipline). Currently Brain says "see Canva" or TBC across all three. Needed to complete Visual Brand Check Group B. | Maddie | Parked during Learning 2026-05-22 — run as a dedicated session. Check Canva brand kits per brand, or lock as part of Master Marketing Document work 28 May. | 2026-05-28 | 2026-05-22 (Learning bootstrap) | Parked |
| Confirm exact partnership scope between Fire & Earth Leamington and Padel and Play (Manny). | Tom + Harry + Maddie | Surfaced 2026-05-22 by Tom. F&E "actively working with" Padel and Play but precise scope (cross-promo, joint events, content, referrals?) not yet captured in Brain. | TBC | 2026-05-22 | Open |
| Confirm whether Nick (PT, gym tenant at Stride + Fade Golf) has any agreed marketing crossover with Fade Group, or is pure rent relationship. | Tom + Harry | Tom said "any cross-promotion is a deliberate Harry decision, not a default" on 2026-05-22, but no agreed marketing position yet. | TBC | 2026-05-22 | Open |
| Confirm Olivia's move from Clinical Lead → Practice Manager at F&E (timing, scope, whether it changes how Maddie routes F&E comms). | Tom + Harry + Olivia | Tom flagged it as "potential" on 2026-05-22, not yet decided. | TBC | 2026-05-22 | Open |

---

## Resolved (rolling archive)

| Question | Owner | Answer | Resolved | Discovered |
|---|---|---|---|---|
| Lynda vs Linda canonical spelling | Tom | Lynda (with a Y), confirmed 2026-05-22. | 2026-05-22 | 2026-05-21 (bootstrap form return showed "Linda" consistent) |
| Lynda's actual role: F&E operational lead or broader? | Tom | Area Manager covering Stride + F&E Leamington. Sits above Clinical Leads + Practice Managers + Therapists. Reports to Tom + Harry. | 2026-05-22 | 2026-05-21 |
| Olivia's role at F&E (Brain had her as Therapist) | Tom | Clinical Lead at F&E. Potential Practice Manager move (still Open above). | 2026-05-22 | 2026-05-21 |
| Manny: who is he, what's the relationship? | Tom | Owner of Padel and Play, independent business in Stratford. F&E actively partnering with him. Treat as external business partner, distinct category from contractors/ambassadors. | 2026-05-22 | 2026-05-21 |
| Nick: who is he, what's the relationship? | Tom | PT renting gym space at both Stride and Fade Golf. Tenant relationship, not employee or contractor. | 2026-05-22 | 2026-05-21 |

---

## Maintenance

- Rows older than 90 days in Active should be reviewed at the Weekly Review. If still genuinely blocked, restate the ETA. If the blocker is no longer real, escalate to Tom for a decision.
- When a row resolves, move it to Resolved (don't delete). The history matters for retrospectives.
- The Resolved section can be archived to `Archive/Open Questions YYYY.md` once per year to keep this file lean.
