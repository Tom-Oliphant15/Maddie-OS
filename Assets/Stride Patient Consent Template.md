# Stride Patient Consent Template

*Source-of-truth template for a simple, friendly, UK GDPR + CQC-compliant patient consent form. Designed to fit on one printed A4 page (may run to a second page if before/after content is in scope). The Filming Brief Generator populates a copy per patient per shoot and produces a Word document. Edit here only when the form itself needs to change.*

*Variables use double-brace syntax: `{{VARIABLE}}`. The skill substitutes before writing the .docx.*

---

# Permission to use your photo and video

**Stride Clinics**

Thanks for letting us include you in our content. We'd like your permission to use the photos and video we take in connection with your treatment. Please read below, ask any questions, then sign at the bottom. We'll give you a copy.

**This is completely your choice.** Whether you sign or not will not affect your care in any way.

---

**Your details**

Name: {{PATIENT_NAME}}

Email: {{PATIENT_EMAIL}}

Phone: {{PATIENT_PHONE}}

---

**What's being recorded and what we'd like to do with it**

Treatment shown: {{TREATMENT_DESCRIPTION}}

Clinician: {{CLINICIAN_NAME}}

Date: {{SHOOT_DATE}}

How identifiable you'll be: {{IDENTIFIABILITY_LEVEL}}

We'd like to use the content for:

{{USAGE_LIST}}

**For how long:** {{DURATION}}

{{BEFORE_AFTER_LINE}}

We will NOT use your image to train AI models or create a digital replica / deepfake of you.

---

**Your right to change your mind**

You can withdraw your permission at any time by emailing {{WITHDRAWAL_CONTACT_EMAIL}} or telling your clinician. **Withdrawing will not affect your care.** We'll remove the content from our own channels within 30 days. We can't always get it back from places others have shared it, but we'll stop using it ourselves straight away.

Your clinical record is separate and we keep that in line with NHS rules, regardless of any decision you make about marketing use.

---

**By signing, you confirm:**

- You're 18 or over (or a parent / guardian has signed too)
- You've had a chance to ask questions
- You're signing because you want to, not because you feel you have to
- You understand you can withdraw at any time without it affecting your care

---

**Your signature:** _____________________________

**Date:** _____________________________

**Clinician witnessing consent ({{CLINICIAN_NAME}}):** _____________________________

---

*Stride Clinics is the data controller. Lawful basis: your explicit consent (UK GDPR Art 6(1)(a) and Art 9(2)(a)). We keep marketing content for the period above plus 6 years; your clinical record per NHS Records Management Code. Full privacy notice: {{PRIVACY_NOTICE_URL}}. Complaints: ico.org.uk. This consent meets CQC Regulation 11 (Need for consent).*

*Generated {{GENERATED_DATE}}. File a signed copy in the patient's clinical record AND Information/Talent Releases/.*

---

## Template change log

| Date | Change | Approved by |
|---|---|---|
| 2026-05-20 | Initial template (over-engineered, 11 sections, 3 pages, agency-style). Sources: Yousign UK Patient Consent, ICO consent guidance, CQC Reg 11, NHS Transformation Directorate. | Superseded |
| 2026-05-20 | Rewritten as 1-page friendly form per Tom course correction. Local-clinic audience. UK GDPR + CQC essentials retained: explicit consent basis (Art 6(1)(a) + Art 9(2)(a) for special category health data), "withdrawing does not affect care" line up top AND in withdrawal section (CQC Reg 11 requirement), clinical-record vs marketing-use separation explained, AI / digital replica prohibition kept as single sentence, before/after handled as a single conditional line rather than a separate section, clinician witnessing line retained, NHS Records Management retention referenced. Pending clinical sign-off by Harry on the language used. | Tom (pending Harry clinical review + Maddie review) |
