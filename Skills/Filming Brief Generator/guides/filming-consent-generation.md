# Guide: UK Consent and Usage Rights Document Generation

Stage 9 reference detail for [[Filming Brief Generator]]. Extracted from the skill file 2026-05-21 to keep the skill lean. Covers who needs which document, variables to gather per person, the docx-substitution rules, file-path convention, and background-incidental handling.

This stage produces the actual release / consent documents as Word files, ready to print and sign. Not just a flag.

---

## Step 9a - List every person needing a signed document

- All on-camera talent (Luke, Linda, Katie, ambassadors, etc.), need a Talent Release
- Stride patients featured in clinical content, need a Stride Patient Consent (NOT the Talent Release)
- Identifiable customers / members in non-incidental shots, need a Talent Release
- Skip: people in genuinely incidental background where the venue has signage covering filming, OR who will be blurred / cropped out in post

---

## Step 9b - For each person, gather the variables

Templates are deliberately short (1-page friendly forms, not agency-style legal documents). Ask Maddie in one batch per person.

**Where contact info lives:** check sources in this order:

1. **[[Contacts]] file in Brain** — canonical source for Fade Group staff, ambassadors with signed agreements (Luke once contract signs), and external contractors. If the person is listed there, pull their email, phone, and any postal address from their row. Confirm with Maddie that the contact details are still current before substituting into the release.
2. **Previous signed release in `Information/Talent Releases/Signed/`** — if the person has signed a release before, re-use the details from the most recent signed copy and confirm with Maddie that they are still current.
3. **Ask Maddie inline** — for anyone not in Contacts and not in a prior signed release (one-off talent, friends-of-brand, Stride patients), source from Maddie directly.

Never invent contact details. Never pull from an external system without Maddie's confirmation. If the person is in Contacts but a field is "TBC", treat that field as missing and ask Maddie.

For a Talent Release:
- Name, email, phone
- Usage scope (the platforms / surfaces actually in scope for THIS shoot, skip anything that won't be used)
- Duration (default: 12 months from shoot date)
- Territory (default: UK)
- Can the talent also post the content on their own channels? (yes / no)
- Brand signatory (default: Maddie)

For a Stride Patient Consent:
- Patient name, email, phone
- Treatment depicted
- Clinician name
- Identifiability level (full identification / first name only / face shown no name / face blurred / treatment area only)
- Before / after content in scope? (yes / no)
- Usage scope (platforms in scope for THIS shoot)
- Duration (default: 12 months)

---

## Step 9c - Generate the .docx

Use the docx skill ([[anthropic-skills:docx]]) to:

- Read the relevant Markdown template from `Assets/Talent Release Template.md` or `Assets/Stride Patient Consent Template.md`
- Substitute every `{{VARIABLE}}` with the value collected in Step 9b
- **USAGE_LIST**: render as a tight bulleted list of only the surfaces in scope. Plain English, customer-friendly. Examples:
  - `- Our Instagram, TikTok, and Facebook posts and stories`
  - `- Paid ads on Instagram and Facebook`
  - `- Our website`
  - `- Posters and flyers inside our [clinic / bay / venue]`
  Do not list surfaces that are not in scope, the form should not feel exhaustive.
- **TALENT_OWN_POSTING_LINE**: if yes, "You can also post this content on your own social media accounts, tagged @{{BRAND_HANDLE}}, for the same period above." If no, omit the line entirely (do not leave placeholder text).
- **BEFORE_AFTER_LINE** (Stride only): if yes, "Before-and-after photos are in scope for this shoot, which you are specifically agreeing to by signing." If no, omit the line entirely.
- **LEGAL_ENTITY**: the registered UK company name behind the brand. **Cache** in `Brain/Businesses/[Brand].md` under a section titled `## Release form facts` with subkeys `Legal entity`, `Privacy notice URL`, `Withdrawal contact email`, `Brand handle`. On first use, ask Tom to confirm and write the section into the brand's Brain file. On every subsequent run, read from there. If the section is missing or any key is blank, re-prompt and write back.
- **PRIVACY_NOTICE_URL**: same cache section as above.
- **WITHDRAWAL_CONTACT_EMAIL**: same cache section. Defaults if not yet confirmed (Stride: admin@strideclinics.co.uk; Fade Golf: admin@fadegolf.co.uk; F&E: admin@fireandearth.co.uk), write the default into the brand Brain on first run so it is auditable from then on.
- **BRAND_HANDLE**: brand's primary social handle (e.g. @fadegolf).
- **GENERATED_DATE**: today's date in DD/MM/YYYY format.
- Output as a clean Word document, single-page if possible (Talent Release should always fit on one A4; Stride may run to a second page if before-after is in scope, that's acceptable). Plain headings, no heavy tables, signature lines clear.

---

## Step 9d - Save the .docx

Drafts and signed copies live in separate subfolders so a glance at the folder tells Maddie which releases are still outstanding before the shoot.

```
Information/Talent Releases/Drafts/{{YYYY-MM-DD}} {{BRAND}} {{TALENT_NAME}} - {{Release Type}}.docx
```

Examples:
- `Information/Talent Releases/Drafts/2026-05-27 Fade Golf Luke Smith - Talent Release.docx`
- `Information/Talent Releases/Drafts/2026-05-27 Stride Jane Doe - Patient Consent.docx`

On return of the signed copy, Maddie moves the file (or a scanned/photographed signed version) to `Information/Talent Releases/Signed/` keeping the same filename. The T-3 follow-up task in Step 9e is "move to /Signed/", not "file".

`mkdir -p` both subfolders before the first write of a session.

One .docx per person.

---

## Step 9e - Surface in the brief and add a follow-up task

In the Filming Brief output, the UK Consent and Usage Rights section lists every release generated, the file path, and the pre-shoot deadline ("Signed copy must be back before T-3").

Add a Tasks.md row: "[Date-3] Collect signed [Release Type] from [Talent Name], move from /Drafts/ to /Signed/ in Information/Talent Releases/."

---

## Step 9f - Background-incidental handling

For shoots where customers / members / public will be in incidental frame:
- Confirm the venue has filming signage (Stride waiting room, F&E entrance, Fade Golf bay area)
- If not, instruct talent and crew to film in controlled angles only
- If incidental capture cannot be avoided and no signage exists, the brief flags this as a pre-shoot blocker

This stage does NOT generate signage; it surfaces the requirement.
