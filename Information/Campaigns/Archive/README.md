# Campaign Archive

Completed campaigns with performance outcomes appended. Queried by [[Campaign Brief Expander]] during the Brain context audit so each new brief draws on proven winning patterns and documented failures.

## How a campaign gets archived

When a campaign completes AND a Data Pull cycle has captured its performance:

1. Take the active campaign file from `Information/Campaigns/[YYYY-MM-DD] [Brand] [Campaign].md`
2. Append a **Performance Outcomes** section to the end of the file (template below)
3. Move the file to `Information/Campaigns/Archive/`
4. The next Campaign Brief Expander run for the same brand + service will surface this campaign as reference

A future `/log-campaign-outcome` skill will automate the move + append. For now, Maddie + Tom do it manually at end-of-campaign reviews.

## Performance Outcomes template

```markdown
---

# Performance Outcomes

**Reviewed:** YYYY-MM-DD
**Data Pull reference:** [path to the Data Pull file used]
**Verdict:** ✅ Winner / ⚠ Mixed / ❌ Underperformed

## Primary goal vs target
| Goal | Target | Actual | Delta |
|---|---|---|---|
| | | | |

## Supporting KPIs vs target
| KPI | Target | Actual | Delta |
|---|---|---|---|
| | | | |

## What worked (patterns to reuse)
- [Specific hook, format, channel, timing that drove results]

## What did not work (patterns to avoid)
- [Specific element that underperformed, with the data signal]

## Surprise findings
- [Anything we did not expect, good or bad]

## Lessons for future Stride [service] campaigns
- [What the next brief on this brand + service should do differently]
```

## What does NOT belong in Archive

- Active or in-flight campaigns (those live in `Information/Campaigns/` without Archive subfolder)
- Failed pre-launch concepts that never went live (no performance data)
- Internal experiments (e.g. testing a new tool)

Only campaigns that ran live with measurable outcomes get archived.

