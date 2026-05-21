# Guide: Google Ads Variation Generator Output Template

The full output template used by [[Google Ads Variation Generator]]. Loaded only when the skill is invoked. Extracted from the skill file 2026-05-21 to keep the skill lean while preserving the full output structure.

---

```markdown
# Google Ads Variations: [Brand] - [Service]

**Generated:** YYYY-MM-DD HH:MM
**Final URL:** [landing page]
**Linked campaign:** [if any]
**Voice:** locked / stub-flagged
**Pinning:** none recommended / [legal-pin / brand-name-pin reasoning]
**Match type recommendation:** phrase / exact / broad-with-conditions
**Message Match check:** pass / flag (see below)

## Angle clusters used

1. [Angle name] ([N] headlines)
2. [Angle name] ([N] headlines)
3. [Angle name] ([N] headlines)
4. [Angle name] ([N] headlines)
[5. 6. as needed]

## Headlines (15, max 30 chars each)

| # | Headline | Chars | Angle | Pin? |
|---|---|---|---|---|
| 1 | [headline] | [N] | [angle] | none / pos 1 / pos 2 / pos 3 |
| 2 | ... |
[continued for 15]

**Length spread:** [N] short (15-20), [N] medium (21-26), [N] long (27-30).
**Keyword-match count:** [N] headlines contain the core query keyword verbatim.

## Descriptions (4, max 90 chars each)

| # | Description | Chars | Pin? |
|---|---|---|---|
| 1 | [description] | [N] | none / pos 1 / pos 2 |
| 2 | ... |
| 3 | ... |
| 4 | ... |

## Assets (extensions)

### Sitelinks (6)

| # | Link text | Description line 1 | Description line 2 | URL path |
|---|---|---|---|---|
| 1 | [text, <=25] | [<=35] | [<=35] | /[path] |
| 2 | ... |
[continued for 6]

### Callouts (6)

| # | Callout | Chars |
|---|---|---|
| 1 | [text, <=25] | [N] |
[continued for 6]

### Structured snippets (1 to 2 sets)

| Header (Google list) | Values |
|---|---|
| Services | [val1], [val2], [val3], [val4], [val5] |
| [optional second header] | [val1], [val2], [val3] |

## Suggested combinations to test

[2 to 3 specific pairings the skill would prioritise for the first test, with reasoning.]

## Second RSA suggestion

To meet Google's "at least 2 RSAs per ad group" recommendation, vary the second RSA by:
- Different Final URL (e.g. /book vs /service-overview)
- Lean harder on one cluster (e.g. Outcome-led across most headlines)
- Different CTA in descriptions

## Message Match check

**Landing page H1:** [extracted from Final URL]
**Verdict:** pass / mismatch
**If mismatch:** [specific action, update LP H1, or run Landing Page Brief on a fresh page]

## Negative keywords (starter, 10 to 15)

| Keyword | Reason | Match type |
|---|---|---|
| free | low-intent traffic | phrase |
| jobs | job-seekers, not customers | broad |
| ... | ... | ... |

**Ongoing discipline:** After 30 days, pull Search Terms report and add 5 to 10 more negatives weekly until the list stabilises. Good UK small-business accounts grow to 100+ curated negatives.

## What to do next

- [ ] Paste 15 headlines + 4 descriptions into the RSA in the [Brand] > [Service] ad group
- [ ] Add sitelinks at ad group level (or campaign level if reusable)
- [ ] Add callouts at ad group level
- [ ] Add structured snippet set at ad group or campaign level
- [ ] Apply negatives at ad group AND account level (account-level catches cross-campaign waste)
- [ ] Confirm match type setting per Step 7 recommendation
- [ ] Set 2-week review reminder in Tasks.md (Asset Reporting per-headline + Search Terms report)
- [ ] Set 30-day reminder for negative-list curation pass
- [ ] If Message Match flagged, run /landing-page-brief on the destination page

## Linked

- [[[Brand] voice]] for tone
- [[Audiences/[Brand]/[Service]]] if exists
- [Campaign brief if linked]
- [[Landing Page Brief]] if Message Match flagged
- [[Tone Check]] recommended before publishing
```
