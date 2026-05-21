# Guide: Google Ads Keyword Builder Worked Example

The Stride nail surgery (medium budget, sub-15-conversion) worked example for [[Google Ads Keyword Builder]]. Loaded only when the skill is invoked. Extracted from the skill file 2026-05-21 to keep the skill lean while preserving the full example.

---

## Worked example (Stride nail surgery, medium budget)

```
Maddie: keywords for stride nail surgery, budget around £800/month, getting around 12 conversions/month at the moment

Skill: Loading Stride > Nail Surgery audience persona. Found: primary persona is 40-65 Leamington locals, has tried home remedies, late-night Googlers, often had NHS waiting list frustration. Persona search terms section gives: "nail surgery near me", "ingrown toenail leamington", "private nail surgery cost", "podiatrist warwick", "nhs nail surgery wait".

Conversion volume reality check: 12 conversions over 30 days is below Smart Bidding's 15-conversion threshold for stable learning. Recommending Manual CPC OR Maximize Conversions with a £40/day cap. Smart Bidding decision waits until volume crosses 15+.

Budget signal: medium. Building Brand + Transactional (booking + buy + urgency) + Solution (problem-aware). Skipping Comparing and Informational entirely until conversion volume builds.

[Output abbreviated]

A. Brand (always include) - 4 keywords exact match
- "stride clinics", "stride clinic leamington", "stride podiatry", "stride clinic booking"

B. Transactional - Booking - 7 keywords exact match
- "nail surgery leamington", "private nail surgery near me", "podiatrist leamington spa", "book nail surgery", "nail surgery warwick", "nail surgery clinic near me", "private podiatrist leamington"

C. Transactional - Buy - 4 keywords exact match
- "nail surgery cost", "private nail surgery price uk", "ingrown toenail surgery cost", "nail surgery from £"

D. Transactional - Urgency - 3 keywords exact match
- "nail surgery same week", "private podiatrist this week", "nail surgery today"

E. Solution - Problem-aware - 6 keywords phrase match
- "ingrown toenail treatment", "ingrown toenail not healing", "permanent nail surgery", "recurring ingrown toenail", "ingrown toenail specialist", "toenail infection treatment"

F. Solution - Comparing - SKIPPED (volume not there yet)
G/H. Informational - SKIPPED (no retargeting asset yet, conversion volume not there)

Total: 24 keywords across 5 themed ad groups.

Negatives (starter, 14):
Universal: "free" (phrase), "jobs" (broad), "training" (broad), "course" (broad), "nhs" (phrase, blocks NHS-funded searches), "diy" (broad), "london" (broad), "manchester" (broad), "children" (broad), "definition" (phrase)
Service-specific: "fake nails" (phrase), "nail polish" (phrase), "manicure" (broad), "nail salon" (phrase)
Competitor: none, awaiting Tom confirmation

Bid strategy recommendation: Manual CPC for first 30 days OR Maximize Conversions with £40/day cap. Switch to Maximize Conversions or Target CPA once you cross 15 conversions in a rolling 30-day window.

Search Terms review cadence: every 2-3 days for the first month (catching the algorithm's exploration phase), then weekly minimum.

A. Run /ads-variations now per ad group, for the complete package?
B. Format as copy-paste block?
C. Set up Search Terms cadence in Tasks.md?
D. Done
```
