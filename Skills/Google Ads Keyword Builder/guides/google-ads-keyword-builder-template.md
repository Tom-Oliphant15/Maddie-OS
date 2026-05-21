# Guide: Google Ads Keyword Builder Template

The full output template used by [[Google Ads Keyword Builder]]. Loaded only when the skill is invoked. Extracted from the skill file 2026-05-21 to keep the skill lean while preserving the full output structure.

---

```markdown
# Keywords: [Brand] - [Service]

**Generated:** YYYY-MM-DD HH:MM
**Budget signal:** [small / medium / large]
**Conversion volume (30d):** [N or unknown]
**Persona source:** [Brain/Audiences/.../...md OR "best-guess, no persona file"]
**Keyword data sources used:** [persona / Planner / Search Terms report / competitor sites / question-tools / mix]
**Bid strategy recommendation:** [Manual CPC / Maximize Conversions / Target CPA / Smart Bidding full]

## Ad group structure (3 to 10 themed ad groups recommended)

### A. Brand (always include)
**Match type:** Exact | **Bid strategy:** Low Manual CPC OR Target Impression Share (high)
- [Brand name]
- [Brand name] [town]
- [Brand name] booking
[3 to 6 keywords]

### B. Transactional - Booking
**Match type:** Exact | **Bid strategy:** [per Step 5 budget+volume reality]
- [keyword 1]
- [keyword 2]
[5 to 10 keywords, geo-modified variants included]

### C. Transactional - Buy
**Match type:** Exact | **Bid strategy:** [as B]
- ...

### D. Transactional - Urgency
**Match type:** Exact | **Bid strategy:** [as B]
- ...

### E. Solution - Problem-aware
**Match type:** Phrase | **Bid strategy:** [per budget+volume]
- ...

### F. Solution - Comparing (if budget+volume justifies)
**Match type:** Phrase | **Bid strategy:** [as E]
- ...

### G. Informational - Education (only on large budget + retargeting asset in place)
**Match type:** Phrase | **Bid strategy:** Awareness, very low CPC cap
- ...

### H. Informational - Symptom-only (only on large budget + mature 100+ negatives list)
**Match type:** Broad (conditional) | **Bid strategy:** Smart Bidding with daily cap
- ...

## Match type summary

| Group | Recommended match | Bid strategy fit |
|---|---|---|
| A. Brand | Exact | Low Manual CPC or Target Impression Share |
| B-D. Transactional | Exact | Maximize Conversions or Target CPA (if 15+ conv/30d) else Manual CPC |
| E-F. Solution | Phrase | Maximize Conversions or Target CPA (if data) else Manual CPC |
| G. Informational Education | Phrase | Maximize Conversions with daily cap |
| H. Informational Symptom-only | Broad (conditional) | Smart Bidding, mature negatives, weekly review |

## Negative keywords (starter, 10 to 15)

### Universal (always apply, account level)
| Keyword | Reason | Match type |
|---|---|---|
| ... | ... | ... |

### Service-specific (campaign level)
| Keyword | Reason | Match type |
|---|---|---|
| ... | ... | ... |

### Competitor (only if Tom has confirmed)
| Keyword | Reason | Match type |
|---|---|---|
| ... | ... | ... |

## Conversion volume reality check

**Reported volume (30d):** [N]
**Smart Bidding readiness:** [Below 15 / 15-30 / 30-50 / 50+]
**Bid strategy implication:** [Manual CPC / Maximize Conversions / Target CPA / Full Smart Bidding]

If the account is below Smart Bidding thresholds, the skill recommends Manual CPC OR Maximize Conversions with a tight daily cap, and flags that Smart Bidding decisions wait until conversion volume builds.

## Pairs with [[Google Ads Variation Generator]]

To complete the ad-group package, run /ads-variations per ad group above. Each ad group needs:
- At least 2 RSAs (per Google's own guidance)
- Full asset suite (sitelinks + callouts + structured snippets)
- Message Match check against the destination Final URL

## What to do next

- [ ] Paste keywords into Google Ads as themed ad groups per the structure above (not single-keyword ad groups)
- [ ] Apply universal negatives at account level, service-specific at campaign level
- [ ] Set bid strategy per the conversion volume reality check
- [ ] Build the Brand ad group first (defensive, lowest CPC)
- [ ] Run /ads-variations for each ad group to produce the RSA + asset suite
- [ ] Set Search Terms review reminder in Tasks.md: every 2-3 days for the first month, then weekly
- [ ] After 30 days, audit the negatives list and add 5 to 10 more per week until it stabilises
- [ ] If hitting Smart Bidding's 15-conversion threshold within 30 days, switch from Manual CPC to Maximize Conversions

## Linked

- [[Audiences/[Brand]/[Service]]] (persona source)
- [Linked campaign brief if any]
- [[[Brand] voice]] (for any direct ad-extension copy)
- [[Google Ads Variation Generator]] (sister skill, run after this)
```
