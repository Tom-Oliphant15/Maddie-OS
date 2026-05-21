# Guide: Proofread Worked Examples

Worked examples used by [[Proofread]]. Extracted from the skill file 2026-05-21 to keep the skill lean. Four cases: clean, minor fixes, image input, heavy revision.

---

## Example 1, Clean

```
Maddie: proofread this: "Stride Clinics offers private nail surgery in Leamington Spa. Same-week appointments. Book online today."

Skill:
**Verdict:** Clean

No issues found. UK English throughout, no em or en dashes, punctuation correct.
```

## Example 2, Minor fixes

```
Maddie: proofread "Our team specialize in helping you recover from injuries, fast, friendly, and effective. Book your favorite time slot today!"

(Original had an em dash before "fast"; rendered here as a comma to keep the guide paste-safe.)

Skill:
**Verdict:** Minor fixes

## Spelling
| Location | Current | Suggested | Reason |
|---|---|---|---|
| sentence 1 | specialize | specialise | UK English: -ise not -ize |
| sentence 2 | favorite | favourite | UK English: -our spelling |

## Punctuation
| Location | Current | Suggested | Reason |
|---|---|---|---|
| sentence 1 | "injuries [em dash] fast" | "injuries. Fast" or "injuries: fast" | Em dash, hard rule, replace with full stop or colon |

## Summary
Two UK spelling fixes and one em dash to swap. After the edits, this is ready to ship.
```

## Example 3, Image input

```
Maddie: [drops a screenshot of a Canva-designed Facebook post]
proofread

Skill: Reading the image. Text extracted:

> "Are you tired of dealing with reoccuring ingrown toenails? At Stride Clinics, we specialise in permanent solutions, no more home remedies, no more painful flare-ups."

(Original image had an em dash before "no more home remedies"; rendered here as a comma.)

**Verdict:** Minor fixes

## Spelling
| Location | Current | Suggested | Reason |
|---|---|---|---|
| body text | reoccuring | recurring | misspelling; "recurring" is the correct word ("reoccurring" exists but means happening again at intervals, often a single repeat; "recurring" is the right word here) |

## Punctuation
| Location | Current | Suggested | Reason |
|---|---|---|---|
| body text | "solutions [em dash] no more" | "solutions. No more" or "solutions: no more" | Em dash, hard rule |

## Summary
Re-export from Canva after fixing "reoccuring" to "recurring" and the em dash. Otherwise post is clean.
```

## Example 4, Heavy revision (rare in practice)

```
Maddie: proofread "Our practise is the best for nail surgery. We've focussed our team's specialization on giving the best treatment center in the region, your gonna love it!"

(Original had an em dash before "your gonna"; rendered here as a comma.)

Skill:
**Verdict:** Heavy revision

## Spelling
| Location | Current | Suggested | Reason |
|---|---|---|---|
| sentence 1 | practise (noun use) | practice | "practice" is noun, "practise" is verb in UK English |
| sentence 2 | focussed | focused | modern UK English drops the double-s |
| sentence 2 | specialization | specialisation | UK: -ise/-isation |
| sentence 2 | center | centre | UK: -re ending |

## Grammar
| Location | Current | Suggested | Reason |
|---|---|---|---|
| sentence 2 | your gonna | you're going to | "your" = possessive, "you're" = "you are"; "gonna" is too informal for marketing |

## Punctuation
| Location | Current | Suggested | Reason |
|---|---|---|---|
| sentence 2 | "region [em dash] your" | "region. You're" or "region: you're" | Em dash, hard rule |

## Summary
Multiple US-English spellings and one significant grammar error (your/you're). Worth a full rewrite rather than patching, since the voice also feels off-brand for Stride. Recommend re-running /tone-check after rewrite.
```
