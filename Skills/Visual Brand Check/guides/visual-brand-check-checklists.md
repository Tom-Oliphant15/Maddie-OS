# Visual Brand Check, Per-Group Checklists

Full Group A / B / C / Campaign-Set checklists for [[Visual Brand Check]]. The skill body summarises the methodology; this guide holds the working checks Claude walks through when running the skill.

For each finding, mark confidence (High / Medium / Low).

---

## Group A: Visual Layout checks

Works without brand-specific data. Always runs.

**A1. Text size + weight legibility (mobile-first)**
- Smallest visible text: estimated size in plain language ("hard to read on a phone", "fine for feed but small for a story", "comfortable")
- Typography weight: thin or ultra-light fonts disappear on mobile feeds. Flag any sub-Regular weight used for body or caption text on social assets.
- Body copy on social: aim for equivalent of 24px+ at full screen, headlines significantly larger.
- Confidence: High (for obviously-too-small or too-thin), Medium (borderline)

**A2. Alignment**
- Within each text block: consistent (centred / left / right)?
- Across blocks: do alignment choices feel intentional or accidental?
- Confidence: High (for obvious misalignment >5px-equivalent), Medium (subtle)

**A3. Spacing, gaps, and whitespace**
- Margins consistent on all sides?
- Gutter between elements consistent or visibly uneven?
- Line height comfortable for the typeface and size?
- **Whitespace as active design lever:** is whitespace doing work (giving key elements room to breathe, creating focus), or is the design just cluttered? Cluttered designs lose engagement and click-through on social feeds. Sparse whitespace is a stronger choice than packing the canvas.
- Confidence: High (obvious unevenness or clutter), Medium (borderline)

**A4. Visual hierarchy and reading flow**
- Does the eye know where to look first, second, third? Trace the intended path.
- Reference framework: Z-pattern (most common for poster-style layouts, eye moves top-left to top-right then diagonally to bottom-left, ending bottom-right) or F-pattern (longer text-heavy layouts, eye scans left-to-right then drops down the left edge). Note which pattern the design implies and whether it succeeds.
- Is the headline winning attention?
- Is the CTA at the natural endpoint of the reading flow? For Z-pattern, ideally bottom-right; for F-pattern, near the top or after the primary body.
- Confidence: High (designer's-eye-level read)

**A5. Composition balance**
- Top-heavy, bottom-heavy, off-centre?
- Negative space distributed sensibly?
- Confidence: High

**A6. Image-text collision**
- Does any text overlap a face or critical detail?
- Is body copy washed out by a busy background?
- Confidence: High

**A7. Aspect ratio, safe zones, and platform conventions**
- Does the asset match the platform's intended size?
- Is text inside the platform's safe area (e.g. IG story bottom UI overlay, FB profile picture overlap, Reels caption clearance for the captions/share UI)?
- **Platform conventions:** does the asset respect the platform's design grammar? IG feed skews visual-first with minimal on-image text; Facebook contrast benefits from warm colours (red, orange, gold) against the blue UI; Reels/TikTok need bold short text that survives a 1-second scroll; LinkedIn skews more formal and text-tolerant.
- Confidence: High

**A8. CTA prominence and thumb-zone (mobile)**
- Can the viewer find the call-to-action in under 2 seconds?
- Is the CTA distinct from surrounding text?
- **Thumb-zone (mobile):** for mobile-first assets, is the CTA in the thumb-reachable area? On a portrait phone, the bottom 60% of the screen is thumb-friendly; the top 20% and corners are awkward. CTAs buried in the top-right of an IG story or reel are commonly mis-tapped or missed.
- Confidence: High

---

## Soft Group B observations (only when Group B is stub-skipped)

When Brand Guidelines is stub and Group B is skipped, you may still SEE things that would normally be Group B findings: photographic style inconsistency, palette drift, font drift, logo issues, imagery tone. Do NOT silently file these under Group A (which is layout). Group A is about layout mechanics; Group B is about brand-specific calls.

Instead, surface them in a dedicated "Soft observations (would normally be Group B)" section, clearly labelled, with this framing:

> These are things I noticed that would normally need the Brand Guidelines locked to give a real judgement. Surfaced here for your awareness, not as a Group A finding. Worth re-checking once guidelines lock.

This keeps the Group A / Group B boundary honest. Maddie knows what is a layout judgement (which the OS can confidently make) vs a brand judgement (which needs the guidelines file).

If Brand Guidelines IS locked, skip this section, all brand-related findings go into Group B proper.

---

## Group B: Brand Adherence (needs Brand Guidelines locked)

**B1. Colour palette match**
- Are the brand's primary / secondary / accent colours visible?
- Are there any clearly-off-palette colours (e.g. default Canva blue when brand is navy)?
- Confidence: Medium-high IF guidelines provide hex codes. Lower without.

**B2. Typography match**
- Does the visible type look like the brand font family?
- Or is it an obvious substitute (Canva default, Comic Sans, Papyrus, Times New Roman in a brand that uses sans-serif)?
- Confidence: Medium (font family yes/no), Low (specific font identification)

**B3. Logo presence + sizing + clear space**
- Is logo required for this asset type per guidelines?
- If yes: present? Correctly sized? Adequate clear space around it? Correct colour variant for the background?
- Confidence: Medium-high if guidelines are specific

**B4. Imagery style**
- Does the imagery match the brand's documented style (e.g. Stride: real photos not stock illustrations, F&E: warm/sensory not clinical)?
- Confidence: Medium

**B5. Inclusivity and representation**
- Does the imagery reflect the audience this asset is targeting? (e.g. Stride orthotics primary persona is 25 to 50 athletes plus 60+ diabetic secondary, imagery should not depict only one group if the asset is brand-level; F&E Leamington community should look like Leamington community, not stock London hipsters).
- Any obvious representation gaps (all one age group, gender, ethnicity, body type when the audience is mixed)?
- Confidence: Medium. This is a judgement call, flag for Maddie review.

**B6. Asset-type specifics**
- Any rules from the guidelines that apply specifically to this asset format
- Confidence: Variable based on guidelines specificity

---

## Group C: Accessibility and Platform Fit

Modern visual QC includes accessibility as a first-class layer, not an afterthought. WCAG 2.2 AA is the practical standard for digital assets. Asset-by-asset, these checks apply. Always runs, even when guidelines are stubbed.

**C1. Colour contrast (WCAG 2.2 AA)**
- Normal text contrast against its background should be 4.5:1 or higher.
- Large text (18pt+ regular, or 14pt+ bold) should be 3:1 or higher.
- Estimate visually: stark black on white passes easily; pale grey on white, mid-tone on mid-tone, or coloured text on coloured background often fails. White text over busy photo backgrounds is a frequent fail.
- Cannot precisely calculate contrast ratios from an image, only flag obvious risks. Maddie can verify with WebAIM Contrast Checker or Canva's built-in tool.
- Confidence: Medium-high for obvious fails (very low contrast), Low for borderline.

**C2. Alt text and accessibility metadata (digital posts)**
- If this asset is going to a digital platform (social post, web image, email), does it need alt text? Almost always yes.
- Maddie should not skip alt text on Instagram or Facebook posts.
- Cannot check whether alt text is set (image alone does not contain it). Surface as a reminder: "Confirm alt text is set before publishing. Describe the visible content for someone who cannot see it."
- Confidence: Reminder-only, not a fail. Flag once per check.

**C3. Colour-blind safety**
- Does the design rely on colour alone to convey meaning (e.g. green = good / red = bad, without text or icon backup)?
- Common red-green colour-blindness affects ~8% of men, ~0.5% of women. Designs that use only red and green to differentiate fail this audience.
- Confidence: High when the issue is obvious

**C4. Animation and motion (if applicable)**
- If reviewing a still frame from a video or animation, check for rapid flashing or strobe-like sequences (WCAG flash threshold).
- Cannot fully assess from a still, but flag if the still suggests high-motion content needs review.
- Confidence: Low without video access. Reminder-level.

---

## Campaign / set consistency (if asset is part of a set)

If Maddie confirmed at Step 1 that this asset is part of a set, also check:

**CS1. Palette consistency across set:** do all assets use the same primary and accent colours?
**CS2. Typography consistency:** same font families and weight hierarchy across the set?
**CS3. Imagery style consistency:** same photographic treatment, lighting, framing approach?
**CS4. Logo + lockup consistency:** same logo variant, position, sizing across the set?
**CS5. Message hierarchy consistency:** does headline weight + structure stay consistent, or does one frame visually dominate the others unintentionally?

If she did not provide the sibling assets, skip this section with: "Campaign consistency not assessed, only one asset of the set was reviewed. To audit cross-asset consistency, drop the full set."
