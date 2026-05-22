# Learning, Audit Targets per Brain file type

This guide lists the required sections per Brain file type. The Learning skill reads each file against this list to identify gaps (missing sections, stubs, stale content).

---

## Brain/Maddie.md

Required sections:
- Role
- Background
- Working Style
- Tech Comfort
- What She Wants From The OS
- Communication
- Hardware
- Ambitions
- Risks to Manage

---

## Brain/Fade Group.md

Required sections:
- Overview
- Businesses In Scope, Out Of Scope
- Key People (with one-line role each, AND each person's level in the hierarchy verified — see "Role-level depth" below)
- **Organisational Structure** — clinic hierarchy from Therapists up through Clinical Leads, Practice Managers, Area Manager, Directors, plus where Marketing sits. Without this, Draft Text and Meeting Prep cannot route messages through the right layer.
- **External Relationships** — four sub-categories explicitly enumerated: ambassadors / contracted talent, external contractors, external business partners, tenants / facility renters. Without this, the OS keeps mis-classifying people.
- Working Cadence
- Tech And Comms
- Strategic Context

**Role-level depth (applies to every Key People row):** when a person is recorded, the role must reflect their actual *level in the hierarchy*, not just a generic title. E.g. "Therapist" vs "Clinical Lead" vs "Practice Manager" vs "Area Manager" — these are meaningfully different. Generic "Therapist" rows on people who are actually Clinical Leads will cause Draft Text to mis-pitch the tone.

---

## Brain/Businesses/[Brand].md (3 files)

Required sections:
- Overview
- Strategic Direction
- Key People (with role-level depth — see Fade Group.md notes)
- Active Campaigns / Content Streams
- Audience (placeholder, points to Brain/Audiences/[Brand]/)
- Channels
- Voice (link to voice file)
- Open Threads

Optional sections (include when relevant, audit checks whether they *should* exist for this brand):
- **External Partners** — independent businesses this brand is actively working with on shared activity. Distinct from contractors. E.g. F&E's partnership with Padel and Play (Stratford). If a brand has any active partnerships and this section is missing, that's a gap.
- **Gym Tenants** (Stride and Fade Golf only) — PTs or other practitioners renting space. Tenant relationship, not employee or contractor. If facilities are rented out and this section is missing, that's a gap.

---

## Brain/Brand Voices/[Brand] voice.md (3 files)

Required sections:
- Tone (1 to 2 paragraphs)
- Vocabulary (Use list + Avoid list)
- Sentence Rhythm (2 to 3 examples)
- Reference Posts (3 to 5 anchor examples)
- Bad Examples (2 to 3 drift catchers)
- Cross-Brand Drift Check (against the other 2 brands)

---

## Brain/Brand Guidelines/[Brand] guidelines.md (3 files)

Required sections:
- Colour palette (primary, secondary, accent, backgrounds, avoid)
- Typography (headlines, body, display, avoid)
- Logo (where required, optional, forbidden; clear space; minimum size; colour variants)
- Imagery style (use, avoid, composition preferences)
- Composition (alignment, CTA placement, margins)
- Asset-type specifics (IG feed, IG story, Facebook, email, leaflet)
- Reference assets (3 to 5 locked good examples, 2 to 3 bad examples)

These guidelines power [[Visual Brand Check]] Group B (brand adherence). Until locked, Visual Brand Check runs Group A (visual layout) only.

---

## Brain/Audiences/[Brand]/[Service].md (created on demand, one per service)

Required sections:
- Primary persona (demographics, daily life, mindset)
- Secondary persona (if any)
- Watering Holes (where they spend time online + offline)
- Search terms they use
- Triggers (what makes them ready to buy / book)
- Barriers (what stops them)

---

## Brain/Tech Stack.md

Required:
- All MCPs current with status
- All CLIs status
- Deferred list current (per the Integration Choice rule)

---

## Brain/Contacts.md

Required sections:
- **Staff** — Directors, shareholders, Marketing, clinical staff, therapists. People on the books or with an ownership stake.
- **Clients & External** — non-staff Fade Group has a working relationship with. Must contain at minimum:
  - **Ambassadors and contracted talent** (e.g. Luke, Katie)
  - **External contractors** (e.g. Mark Hudson)
  - **External professionals** (accountant, solicitor, franchise network owner)
  - **External business partners** — independent businesses Fade Group is *partnering with*, not buying from. Distinct from contractors. Missing this category is a structural gap.
  - **Tenants and facility renters** — people who rent space at Fade Group facilities and run their own books (PTs, etc.). Missing this category is a structural gap.

**Role-level accuracy check (every row):** the Role field must reflect the person's actual level in the hierarchy. A Clinical Lead listed as "Therapist" is a row-level gap, not a complete row. Confirm with Maddie or Harry on bootstrap.

**Out of scope (do not add):** Stride patients (Cliniko handles patient data, Article 9 boundary), one-off suppliers, AI Business contacts (Tom OS, not this OS).
