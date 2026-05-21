# Skill: Talent / Ambassador Brief

---
triggers:
  - "ambassador brief"
  - "talent brief"
  - "/talent-brief"
  - "brief for [name]"
  - "post from their account"
type: Workflow
---

**Purpose:** When talent (Luke, Jason, Katie, future ambassadors) is posting from their own account on the brand's behalf, they need a brief written for them, not for a marketer. Plain language, example captions, hashtag direction, what to avoid, correct disclosure. One page, copy-pasteable.

Different from Filming Brief Generator (which is operational, for the day of the shoot). This is for what they post FROM their own account in their own voice, on behalf of the brand.

**Disambiguation:** if Maddie says "brief for [name]" without further context, ask one question: "On-set brief for the day of the shoot, or post brief for their own account?" Day-of-shoot routes to Filming Brief Generator; post-from-own-account stays here.

---

## What's Appropriate Here

The talent posting from their own account on the brand's behalf is one of the higher-compliance-risk creator activities in UK marketing. Three regulators in play:

- **ASA / CAP Code** governs recognition of marketing communications. Disclosure must be clear, prominent, and at the start of the post. Specific labels (`#ad`, `paid partnership`) are accepted; vague ones (`#sp`, `#spon`, `#collab`, `#partner`, `#gifted` alone, `#BrandAmbassador`, `#thanks [Brand]`) have been explicitly ruled inadequate.
- **CMA** enforces under the Digital Markets, Competition and Consumers Act 2024 (in force April 2025). Fines up to 10% global turnover or £300k for serious or repeated breaches. The ASA escalation pathway (warnings, name-and-shame webpage, working with platforms to remove content, referral to Trading Standards) is real and active.
- **Platforms** (Meta, TikTok) layer their own Paid Partnership / Branded Content toggle on top. Using the platform-native tool is the safest single move.

Practical compliance pattern at Maddie's scale (small UK brands, ambassador retainers, occasional gifted posts, the odd patient testimonial):

1. Classify the commercial relationship before drafting (paid retainer / gifted / affiliate code / employee / friend-of-brand / patient testimonial).
2. Pick the label (`#ad`, `Ad - Gifted`, paid partnership label, in-video overlay) and place it at the START of the caption AND in-video for short-form.
3. Toggle the platform-native disclosure tool where it exists.
4. Maintain disclosure for **12 months after the commercial relationship ends** when posting about that brand (lingering-association rule).
5. Get the signed release on file before the brief is issued. No release, no brief.

What this skill does NOT do:
- Replace the underlying ambassador agreement / contract (deliverables, payment terms, exclusivity, IP). That sits with Harry / legal as a separate document.
- Replace clinical / patient consent for Stride patient testimonials. The Patient Consent form is a separate clinical document; this brief assumes it is already signed.
- Apply enterprise influencer-program patterns (whitelisting at scale, dark-post buy-side workflows, multi-tier creator stratification). Default brief is a single ambassador posting from their own account, with the brand sometimes reposting.

Per ASA's May 2025 AI-led review of 50,000+ Instagram and TikTok posts: 57% of likely ads were clearly disclosed, 34% had no disclosure, 9% used inadequate labels. The compliance gap is real and the regulator is watching. Get it right.

---

## Context

*Load these files before running this skill:*

- The relevant brand Brain file
- The relevant brand voice file
- The campaign plan (`Information/Campaigns/...`) if this brief is tied to one
- Filming brief output if there is recent filming (so the talent brief references real footage)

---

## Quick Start

Maddie says:
- "ambassador brief for Luke"
- "talent brief Katie Run Club"
- "/talent-brief Luke June post"
- "brief for Luke to post the ambassador reel"

---

## /goal integration

```
/goal output saved to Information/Talent Briefs/[YYYY-MM-DD] [Brand] [Talent] [Topic].md, contains all 7 sections (What we are asking, Why this matters, The content, Example caption, Hashtags, Disclosure, Things to avoid, When to post, Anything else), Disclosure section branches correctly on the commercial relationship captured in Step 1.3, signed talent release for this person confirmed in Information/Talent Releases/Signed/, copy-pasteable as a single message, plain English throughout (no marketing jargon), under 1 page. Stop after 4 turns if not met.
```

---

## Process

### 0. Pre-check, contact + signed talent release on file

Before drafting a brief that puts the talent on the brand's behalf, do two checks:

**(a) Look the talent up in [[Contacts]].** Fade Group staff and contracted ambassadors live there with canonical address + Slack details. If they are listed, use those details for any contact references in the brief. If they are NOT in Contacts and they are a paid ambassador or contractor (i.e. someone Fade Group transacts with regularly), flag to Maddie: "Should [Talent] be added to Contacts under Clients & External? They look like a recurring contracted relationship." Add the row on Maddie's confirmation. One-off talent (one-time post, gifted-product-only, patient testimonial) does NOT need a Contacts row.

**(b) Confirm a signed release exists:**

```bash
ls "Information/Talent Releases/Signed/" 2>/dev/null | grep -i "[Talent name]"
```

If nothing is found:
- **Paid ambassador / employee / patient**, refuse to issue the brief until the release is in `/Signed/`. Tell Maddie: "No signed release for [Talent] found in /Signed/. Talent posting on the brand's behalf without a release is the same compliance + GDPR risk as filming without one. Generate a release via /filming-brief (or just the release flow) first, then come back." Stop.
- **Friend-of-brand / one-off post**, flag and ask Maddie to confirm a release is in motion. Proceed only on explicit confirmation. Add a Tasks.md row "Get [Talent] signature on Talent Release for [post topic] post, file in Information/Talent Releases/Signed/" with a deadline of the posting date minus 1 day.

This pre-check exists because the talent brief is the moment the talent goes live on the brand's behalf, and a missing release at that point is harder to retrofit (it has to be back-dated or the post pulled). Catch it now.

### 1. Gather inputs

1. **Brand:** Fade Golf / Stride / F&E Leamington
2. **Talent:** name
3. **Commercial relationship**, drives disclosure obligation. Pick one of the six tiers: Paid ambassador / Gifted (any value) / Affiliate code or link / Employee / Friend-of-brand / Stride patient. Full tier definitions, the no-£100-threshold rule, and the 12-month tail rule (disclosure continues for up to 12 months after the formal relationship ends) are in [[talent-ambassador-brief-disclosure-tiers]]. Load that guide before classifying.
4. **What they are posting:** content they are sharing (link to footage if it exists)
5. **Posting platform(s):** their IG / TikTok / both / story-only
6. **Timing:** when to post (specific date/time if relevant)
7. **Campaign tie-in:** if linked to a named campaign
8. **Talent voice reference** (optional but recommended): 1 or 2 links or screenshots of recent posts the talent has made, so the example caption isn't invented from nothing. If none provided, the example caption is generated generically and the brief tells the talent so.

### 2. Apply context

Load brand voice. If voice file is stub, flag but proceed (talent briefs are less voice-rigid because the TALENT is in their own voice, not the brand's exact voice).

### 3. Compose the brief

Full output template is in [[talent-ambassador-brief-template]] (loaded when the skill runs). It covers 9 sections (What we are asking, Why this matters, The content, Example caption, Hashtags, Disclosure, Things to avoid, When to post, Anything else) with the Disclosure block branching across the six tiers in [[talent-ambassador-brief-disclosure-tiers]]. Pick ONE disclosure branch matching Step 1.3; do not include the others.

### 4. Save and surface

```bash
mkdir -p "Information/Talent Briefs"
# Write the file
```

Show Maddie the brief. Ask:
> Brief saved. Want me to:
> A) Draft a Slack/WhatsApp message to send the brief to [Talent]
> B) Strip the brief to its essentials for a shorter version
> C) Done, you will share it from here

### 5. Auto-add follow-up tasks

- [Date+1] Confirm [Talent] received the brief and has the content
- [Posting date] Cross-check [Talent]'s post went live, repost to brand account if appropriate

---

## Worked example

Full Luke ambassador reel worked example (Fade Golf, paid ambassador, IG main + story, showing all three layered disclosure actions) is in [[talent-ambassador-brief-worked-example]].

---

## Plain-language discipline

The whole brief is written FOR THE TALENT, not for Maddie. Specific rules:

- No marketing jargon (no "conversion", no "engagement metrics", no "demographic"). Use "the people who follow you", "what catches attention", "who is watching".
- No internal-team references (no "the canvas", no "the campaign brief"). Use "the project", "the campaign", "what we are running".
- Example captions are drafts, never scripts. The talent rewrites in their voice. The brief makes this explicit.
- Hashtag direction is light: always-use list + optional list + their-own-audience list. Never a rigid required list.

---

## Compliance overlay (Stride only)

For Stride-related talent briefs (clinicians, patient testimonials, partner referrers):
- Patient consent must be confirmed BEFORE any patient-facing content goes out
- Medical claims must be cleared with Harry or a clinician
- "Cure" / "permanent fix" / "guaranteed" language is OUT
- Before-after photos require written consent and anonymisation as needed

If brief is for Stride and either patient or clinical content is involved, the brief includes a compliance reminder in the Things-to-avoid section.

---

## Rules

- Written FOR the talent, not for marketers
- **Pre-check signed release in `Information/Talent Releases/Signed/` before issuing any brief.** Paid / employee / patient = hard refuse if missing. Friend-of-brand = ask Maddie to confirm release is in motion. Catching the gap at brief-issue time is cheaper than retrofitting after the post.
- **Disclosure section is mandatory and branches on the Step 1.3 commercial relationship across SIX tiers:** Paid ambassador / Gifted product or service (any value) / Affiliate code or link / Employee / Friend of brand / Stride patient. Each tier has a defined disclosure pattern; do not generalise across tiers.
- **Disclosure placement is hardcoded:** start of caption, before the "more" cut. In-video text overlay (or verbal callout) required additionally for Reels / TikTok / short-form video. Caption-only disclosure has been ruled inadequate by ASA for short-form video.
- **Platform-native Paid Partnership / Branded Content toggle is the strongest defensible position.** Recommend it as primary in every paid / gifted / affiliate brief in addition to the caption label, not instead of.
- **12-month tail rule mandatory.** If the commercial relationship has ended within the last 12 months, disclosure still applies. The brief Step 1.3 captures relationship-ended date if relevant; the disclosure section inherits the paid tier.
- **Never tell talent to skip `#ad` for paid work.** ASA has explicitly ruled `#sp` / `#spon` / `#collab` / `#partner` / `#gifted` alone / `#thanks [Brand]` / `#BrandAmbassador` / `#[Brand]Ambassador` are ALL inadequate disclosures.
- **No £100 gifted threshold.** Drop the threshold framing. CAP triggers on the commercial relationship itself, not the gift value. Free coffee from a brand you have an agreement with still needs disclosure; expensive gifted product with no agreement still needs disclosure under the lingering-association rule.
- **Affiliate codes count as commercial relationships.** Discount codes (`LUKE10`), referral links, commission arrangements all trigger `#ad` at the same placement as the code or link.
- Example caption is a draft, not a script. Always explicit invitation to rewrite. If no talent voice reference was provided in Step 1.8, the example caption carries a one-line note that it's a generic frame and the talent should rewrite in their own voice.
- Hashtag direction layered (must / optional / their own), never rigid lists. Disclosure hashtag (`#ad`) is separate from the optional brand / topic hashtag set; never bury `#ad` inside the optional list.
- Stride briefs get the compliance overlay; Stride patient testimonials get the patient-testimonial overlay specifically
- Save to `Information/Talent Briefs/[YYYY-MM-DD] [Brand] [Talent] [Topic].md`
- Auto-add follow-up tasks
- **Repost-to-brand decision rule:** brand reposts the talent's post if (a) the post performed materially better than the brand's own equivalent post (proxy: 1.5x reach or saves), AND (b) the post complied with the disclosure rules above, AND (c) the talent's caption doesn't conflict with another in-flight campaign. If any are false, don't repost. Default if unsure: don't repost.
- No em or en dashes

---

## Anti-patterns

- Marketing jargon ("conversion", "demographic")
- Rigid scripts disguised as "example captions"
- Listing 20 required hashtags
- Skipping the "Why this matters" section (talent care about the why)
- Skipping the "Anything else" section (talent appreciate easy contact line)
- Not flagging compliance for Stride
- **Telling a paid ambassador not to use `#ad`**, ASA breach risk, unlawful post
- **Recommending `#sp` / `#spon` / `#collab` / `#partner` / `#gifted` alone / `#thanks [Brand]` / `#BrandAmbassador` / `#[Brand]Ambassador` as a disclosure**, ASA has explicitly ruled all of these inadequate
- **Burying `#ad` in the hashtag block at the end of the caption**, disclosure must be at the start, visible before the "more" cut
- **Caption-only disclosure on Reels / TikTok / short-form video**, must also appear in-video as text overlay or verbal callout
- **Skipping the platform-native Paid Partnership / Branded Content toggle**, it's the strongest defensible position, recommend it in addition to caption disclosure
- **Treating `#gifted` as adequate disclosure on its own**, use `Ad - Gifted` or `#ad #gifted`, not `#gifted` alone
- **Citing a £100 gifted-product threshold**, not in CAP, the trigger is the commercial relationship itself
- **Dropping disclosure within 12 months of the formal relationship ending**, lingering-association rule still applies
- Issuing a brief without confirming the signed release is on file
- Generating an "example caption in [Talent]'s voice" when the skill has never seen any of the talent's actual posts AND not telling Maddie that's what happened

---

## Changelog

| Date | Change |
|---|---|
| 2026-05-19 | Skill created. 6-section template written for the talent not the marketer, voice-of-talent example captions, layered hashtag direction, Stride compliance overlay, worked example for Luke ambassador intro. |
| 2026-05-20 | Cold-simulation test as Maddie (Luke ambassador post for Fade Golf, post-shoot reel sharing). Six edits applied. **Critical compliance bug fixed:** the original template told the talent NOT to use "#ad" or "sponsored" and suggested "#partner" instead, with the comment "this is not a paid partnership in the regulated sense", wrong under UK ASA/CAP rules, which treat ambassador retainers and gifted-product-over-£100 as paid partnerships requiring clear disclosure (#ad / #paidpartnership / Instagram Paid Partnership label), and which have explicitly ruled #sp/#spon/#collab/#partner inadequate. Six edits in total: (1) Step 0 pre-check added, refuse to issue the brief if no signed release exists in `Information/Talent Releases/Signed/` for the talent (paid / employee / patient = hard refuse; friend-of-brand = ask Maddie to confirm a release is in motion); release-gap detected at brief-issue time is cheaper to fix than after the post goes live, (2) Step 1 input #3 now captures the commercial relationship explicitly across four tiers (paid ambassador / employee / friend-of-brand / Stride patient) and drives the Disclosure section logic, (3) Step 1 input #8 added, talent voice reference (1-2 recent posts) optional; without it the example caption is honestly labelled generic instead of pretending to be in-voice, (4) Output template gained a mandatory Disclosure section that branches on the commercial relationship (paid → #ad/Paid Partnership label; employee → visible employment statement; friend → transparency phrasing; patient → consent + withdrawal route, not commercial disclosure), (5) /goal text updated to 7 sections + Disclosure correctness check + release-on-file check, (6) Rules section restructured with explicit hard rules on never recommending #partner / #sp / #spon / #collab as disclosure, plus a repost-to-brand decision rule (1.5x reach or saves, AND disclosure-compliant, AND no campaign clash, default-don't-repost if unsure). Skill purpose statement gained a disambiguation rule for the "brief for [name]" trigger (vs Filming Brief Generator). Worked example updated to show the Paid Partnership disclosure routing for Luke. Anti-patterns expanded with the compliance breaches and the "fake in-voice caption from no source material" pattern. Sources: UK ASA / CAP Code on influencer disclosure (rulings 2022-2024 on #sp / #spon / #ad clarity), CMA Hidden Ads guidance 2024, ASA "no further notice" sanction rule (2023). |
| 2026-05-21 | **Guide extraction pass.** Skill bloated to 339 lines after the research-first retrofit. Extracted the full output template (~95 lines) to [[talent-ambassador-brief-template]], the six commercial-relationship tier definitions and 12-month tail rule (~10 lines) to [[talent-ambassador-brief-disclosure-tiers]], and the Luke ambassador worked example (~30 lines) to [[talent-ambassador-brief-worked-example]]. Skill body now links to all three rather than embedding. No content lost. Skill body now ~210 lines (workflow + rules + anti-patterns + changelog). |
| 2026-05-20 | **Research-first retrofit pass** per [[Continue - Research-First Skill Retrofits]] and the CLAUDE.md Skill Creation Discipline. Anchored on Maddie's actual context (small UK brands, ambassador retainers, occasional gifted posts, single-talent posts from own account, sometimes reposted by brand). Ran Step 1c research filtered through that context. Findings: (a) £100 gifted-product threshold cited in industry blogs is NOT in CAP, the trigger is the commercial relationship itself, not the gift value; (b) ASA's May 2025 AI-led review of 50,000+ posts found 34% had no disclosure and 9% used inadequate labels, regulator is actively escalating; (c) DMCC Act 2024 (in force April 2025) gives CMA direct enforcement teeth, fines up to 10% global turnover or £300k for serious breaches; (d) ASA has explicitly ruled #BrandAmbassador / #[Brand]Ambassador inadequate as disclosure (specific addition to the prior banned-tag list); (e) 12-month tail rule, disclosure continues for up to 12 months after the commercial relationship ends due to lingering association; (f) for Reels / TikTok / short-form video, caption disclosure is NOT enough, in-video text overlay or verbal callout is mandatory; (g) affiliate codes (`LUKE10` etc) count as commercial relationships requiring disclosure at the same placement as the code or link; (h) "Ad first" layered structure (`Ad - Gifted`, `Ad - prtrip`) is the correct format for layered disclosure, not `#gifted` alone. **Edits applied:** (1) added new "What's Appropriate Here" section near the top of the file summarising the regulatory frame (ASA / CMA / platforms), enforcement stakes, practical compliance pattern, and what the skill explicitly does NOT do (ambassador contracts, clinical patient consent forms, enterprise influencer-program patterns); (2) Step 1.3 commercial relationship rewritten from 4 tiers to 6 tiers (Paid ambassador / Gifted any value / Affiliate code or link / Employee / Friend of brand / Stride patient), £100 threshold removed and replaced with "any commercial benefit" trigger, affiliate-code tier added as its own category, 12-month tail rule added at the bottom of Step 1.3; (3) Disclosure section in the output template rewritten across all six tiers with explicit placement rule (start of caption, before "more" cut), platform-native Paid Partnership / Branded Content toggle recommended as primary, in-video text overlay or verbal callout mandatory for short-form video, layered `Ad - Gifted` structure shown, expanded banned-tag list (#sp / #spon / #collab / #partner / #gifted alone / #thanks [Brand] / #BrandAmbassador / #[Brand]Ambassador), affiliate-code disclosure placement-mirrors-link rule; (4) Rules section restructured to encode all six tiers, 12-month tail rule, no-£100-threshold rule, platform-native toggle as default; (5) Anti-patterns expanded with: burying #ad in end-hashtag block, caption-only on short-form video, skipping platform-native toggle, citing £100 threshold, dropping disclosure within 12-month tail; (6) Worked example updated to show the three layered actions for Luke (caption #ad at start + Instagram Paid Partnership label + in-video overlay). Stress-tested mentally against three real scenarios: Luke ambassador reel (passes - now shows all three layers), hypothetical Britt gifted-massage Stride post (passes - no £100 myth, layered Ad - Gifted in caption + overlay), hypothetical Luke discount code `LUKE10` (passes - affiliate tier triggers `#ad` at same placement as code). Skill grew from 281 to ~340 lines, single file (no extraction needed - the regulatory frame is dense but the skill is the right home for it). British English verified. No em / en dashes per CLAUDE.md paste-safe rule. **Sources:** ASA / CAP Recognising Ads guidance 2026 (asa.org.uk), CMA Hidden Ads guidance via Lexology and RPC, Kolsquare 2025-2026 ASA updates summary, Lewis Silkin May 2025 report on ASA influencer transparency review, ASA May 2025 AI-led review press release (50,000+ post sample, 57% compliance ceiling), ASA escalates-sanctions news (cap.org.uk), Pinsent Masons "ads are ads" guidance for influencers, Awisee 2026 ASA social media guidelines summary, Gov.uk social media endorsements guidance for content creators, TikTok Branded Content Policy (tiktok.com/legal), TikTok commercial content disclosure setting docs (ads.tiktok.com/help), UK affiliate link disclosure guidance (Breezy.io UK template, MyRoomIsMyOffice UK affiliate disclosures), DMCC Act 2024 enforcement summaries (Chambers Practice Guide UK 2025, Osborne Clarke regulatory outlook May 2025). |
