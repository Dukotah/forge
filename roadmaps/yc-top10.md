# Copper Bay Labs — YC-Potential Reassessment (Top 10)

> **Date:** 2026-06-15 · **Scope:** all 55 live queue ideas (1 greenlit + 53 researched + 5 parked)
> reassessed, plus fresh ideas generated, then distilled to a top 10 ranked on **Y Combinator
> potential** — *within the existing zero-secret / free-static guardrail* (no per-product backends,
> accounts, or keys required to ship the MVP; venture upside is unlocked later by the owner).
>
> This does **not** rewrite `ideas.json`. It is a strategic lens on the backlog. Greenlight from here.

---

## Why this list looks different from the forge backlog

The forge rubric (demand · gap · buildable · distribution · monetization · defensibility, ≥70 to
surface) optimizes for **shippable static utilities**. A YC lens optimizes for **companies**: big
and growing markets, *frequent/retained* use, a credible wedge that compounds into real recurring
revenue, an organic growth loop, and a moat. Those are nearly orthogonal criteria.

The consequence: most of the current backlog — tip calculators, personality quizzes, frost-date
planners, dog-years converters — scores **low on YC potential by construction**. They are
one-and-done, trivially cloneable, and have no path past a tip-jar. They are excellent *SEO/traffic
magnets* (and worth shipping for that reason), but they are not the seed of a fundable company.

The YC-grade ideas share three traits the quizzes lack: **(1) repeat/retained use** (a habit or a
recurring job, not a single answer), **(2) a wedge → SaaS path** where today's free static tool is
the top of a funnel into a paid product the owner can later unlock, and **(3) a compounding moat**
(user-generated content, a network, or a data/brand flywheel).

## The reassessment rubric (YC-flavored, 0–100)

| Dimension | Weight | What it rewards |
|---|---|---|
| Market size & "why now" | 25 | Large, growing TAM with a real tailwind (AI, creator economy, founder boom, remote work). |
| Frequency / retention | 20 | Used repeatedly → habit or recurring job. One-and-done is penalized hard. |
| Wedge → venture path | 20 | Free static MVP is a believable funnel into a fundable SaaS once keys/payments are unlocked. |
| Organic growth loop | 15 | Compounding SEO **plus** a share loop or network effect — reach to strangers, not a private channel. |
| Monetization clarity | 10 | Believable, ideally *recurring*, willingness-to-pay. |
| Moat / defensibility | 10 | UGC, network, content library, or brand that compounds over time. |

**Guardrail respected throughout:** every top-10 entry has a genuine zero-secret, free, static MVP
that the factory can ship autonomously today. The venture upside (payments, accounts, AI, sync,
cron) is itemized per idea under **Unlock** and stays parked in `needsOwner[]` until the owner funds it.

---

## The Top 10

| # | Product | YC | Status | One-line venture thesis |
|---|---|---|---|---|
| 1 | **InvoiceKit** | 84 | researched | Free invoice generator → payments-rail SaaS; invoicing is evergreen, global, high-frequency, and the take-rate on payments is Stripe-scale. |
| 2 | **DeckShare** | 83 | researched | No-login spaced-repetition flashcards with *shareable* decks → UGC + network-effect moat in a proven venture market (Quizlet, Anki). |
| 3 | **SubAudit** | 82 | researched | Privacy-first subscription tracker → the trust-first wedge into a Rocket Money-style cancel/negotiate SaaS. |
| 4 | **PulseGuard** | 81 | **greenlit** | Recurring monitoring + status pages bundled on top of the whole free security suite — the suite *is* the funnel. Already built locally. |
| 5 | **RunwayLens** | 80 | **NEW** | Burn-rate & runway calculator for founders → finance/forecasting SaaS. Targets YC's *own* audience with a HN/Twitter-native growth loop. |
| 6 | **CoverDraft** | 79 | researched | Guided (non-AI) cover-letter + job-application builder → freemium career SaaS; huge job-seeker TAM, structural gap left by the 2025 AI-everything pivot. |
| 7 | **DilutionLens** | 78 | **NEW** | SAFE / priced-round equity-dilution + option-pool modeler → cap-table SaaS wedge (Carta-scale), founder audience, repeat use every raise. |
| 8 | **SaaSMetrics** | 77 | **NEW** | LTV/CAC · MRR growth · churn · Rule-of-40 calculator → B2B analytics wedge; the canonical founder/operator toolkit, infinitely linkable. |
| 9 | **SubjectGrade** | 76 | researched | No-account email subject-line grader → email-optimization SaaS; daily-use B2B job, every incumbent gates scoring behind a login. |
| 10 | **WinLog** | 75 | researched | Weekly "brag doc" → perf-review + LinkedIn generator; recurring logging habit → team/manager SaaS in the career category. |

> **The founder-tools insight:** three of the ten (RunwayLens, DilutionLens, SaaSMetrics) are *new*
> and deliberately aim at **startup founders** — YC's exact audience. They're pure-math, zero-secret
> static tools (ship today), they get free, durable distribution on Hacker News / Twitter / Indie
> Hackers, and they're the natural top-of-funnel for a founder-finance SaaS. This is the single
> highest-leverage *new* direction the YC lens surfaces, and it's fully inside the guardrail.

---

## The Top 10 in depth

### 1 · InvoiceKit — `global-invoice-generator` *(researched, forge score 80)*
- **Ship-now MVP (zero-secret):** client-side PDF invoice with VAT/GST fields, EU reverse-charge, multi-currency, logo, line items. All in-browser, no signup.
- **Why YC:** invoicing is universal, repeated monthly by every freelancer/SMB on earth, and the category supports billion-dollar outcomes (FreshBooks, Wave, Stripe Invoicing). The free generator is the cleanest possible wedge.
- **Wedge → venture:** saved clients/templates → recurring billing → **"Pay this invoice" button** (payments take-rate, the real money) → expenses/bookkeeping.
- **Moat:** workflow lock-in + the payments rail once it's the system of record.
- **Unlock (`needsOwner`):** Stripe Connect, accounts/DB, email send.

### 2 · DeckShare — `flashcard-deck-share` *(researched, 73)*
- **Ship-now MVP:** build a deck, study with real spaced repetition, share the whole deck via an encoded URL — no login, no paywall.
- **Why YC:** education + spaced repetition is a proven venture market (Quizlet was VC-backed; Anki has a cult). Crucially, *shared decks are user-generated content* → the only true compounding moat in the whole backlog (content library + SEO + network effect).
- **Wedge → venture:** accounts to save progress → class/team decks → a marketplace of premium decks.
- **Moat:** UGC deck library + network effects. Strongest defensibility on this list.
- **Unlock:** accounts/sync (the static MVP runs on `localStorage` + shareable URLs first).

### 3 · SubAudit — `subscription-audit` *(researched, 74)*
- **Ship-now MVP:** add subscriptions once, see true annual spend + an exportable renewal calendar (`.ics`). Manual entry, no bank access, `localStorage`.
- **Why YC:** subscription fatigue is a mass-market, growing consumer pain; Rocket Money ($billion outcome) proves the category. SubAudit's privacy-first, no-login posture is the *trust wedge* — the on-ramp users won't give a bank login to.
- **Wedge → venture:** opt-in bank sync (Plaid) → auto-detect + **cancel/negotiate-for-you** (the revenue engine).
- **Moat:** habit + the spend-data graph once sync is on.
- **Unlock:** Plaid, accounts, the concierge cancel service.

### 4 · PulseGuard — `suite-monitoring-statuspage` *(GREENLIT, 72 · local build complete 2026-06-09)*
- **Ship-now MVP / wedge:** the free re-scan tool over the existing ShipSafe/ExposureCheck/HardenCheck suite — the one differentiator generic monitors don't have.
- **Why YC:** monitoring is textbook recurring SaaS (retention + recurring revenue). Generic uptime is saturated, but PulseGuard inherits the *entire free suite's traffic as a built-in funnel* — distribution most monitoring startups would pay dearly for.
- **Wedge → venture:** scheduled scans → uptime + status pages → alerting → team plans.
- **Moat:** the suite funnel + switching cost of configured monitors.
- **Unlock:** Vercel token + DB/cron, Resend/Twilio. *This is the only top-10 idea whose core (scheduled monitoring) genuinely needs a backend — but the wedge ships free, and it's already built locally.*

### 5 · RunwayLens — **NEW** *(founder finance)*
- **Ship-now MVP:** enter cash, monthly burn, revenue growth → live runway chart, "out of cash" date, and scenario sliders (hire / raise / cut). Pure math, zero-secret.
- **Why YC:** every founder asks "how long do I have?" monthly. Targets YC's own audience, with a native HN/Twitter/Indie-Hackers growth loop and zero paid-acquisition need.
- **Wedge → venture:** save scenarios → connect accounting (QuickBooks/Stripe) → live forecasting + board-ready exports (a Pry/Runway-style SaaS).
- **Moat:** becomes the founder's living financial model → switching cost.
- **Unlock:** accounts, accounting integrations.

### 6 · CoverDraft — `cover-letter-builder` *(researched, 81)*
- **Ship-now MVP:** answer 6 structured prompts → polished, ATS-readable cover letter as a clean PDF. Deterministic templates + coaching prompts — **no AI key needed**, which is exactly the structural gap (every incumbent now pushes generic AI output).
- **Why YC:** enormous, evergreen job-seeker TAM with a strong "why now" — the 2025 AI-everything pivot left a trust gap for a *guided, human* builder.
- **Wedge → venture:** resume builder → application tracker → full job-search OS (freemium career SaaS).
- **Moat:** brand/trust + workflow once it owns the whole application.
- **Unlock:** accounts, optional AI assist as a paid tier.

### 7 · DilutionLens — **NEW** *(founder finance)*
- **Ship-now MVP:** model a SAFE / priced round — pre/post-money, option pool, multiple rounds — and see founder dilution stack visually. Pure math, zero-secret.
- **Why YC:** dilution is confusing, high-stakes, and revisited every raise; founders share these tools constantly. Cap-table management is a proven venture category (Carta).
- **Wedge → venture:** save a cap table → scenario modeling → a lightweight cap-table-of-record SaaS for pre-seed/seed companies Carta over-serves.
- **Moat:** the cap table as system of record.
- **Unlock:** accounts, e-sign, compliance.

### 8 · SaaSMetrics — **NEW** *(founder / operator)*
- **Ship-now MVP:** calculators for LTV/CAC, MRR growth, churn, payback, and Rule-of-40, each with a shareable result and a plain-English read. Zero-secret.
- **Why YC:** the canonical operator toolkit; every SaaS founder/PM/investor needs these and links to good ones. Infinite long-tail SEO ("what is a good CAC payback period").
- **Wedge → venture:** connect Stripe → live MRR/churn dashboard → benchmarking against anonymized cohorts (a data moat).
- **Moat:** the benchmark dataset once enough connect.
- **Unlock:** Stripe read, accounts.

### 9 · SubjectGrade — `email-subject-grader` *(researched, 77)*
- **Ship-now MVP:** paste a subject line → instant A–F grade + specific fixes (length, spam words, emoji, personalization). Rule-based heuristics, zero-secret.
- **Why YC:** a daily-use B2B job for every marketer; incumbents (CoSchedule, Mailchimp) gate scoring behind an account/their builder — a clean free tool wins the top of funnel.
- **Wedge → venture:** A/B preview → full email pre-send optimizer → deliverability suite.
- **Moat:** a scoring dataset that improves with use.
- **Unlock:** accounts, ESP integrations.

### 10 · WinLog — `career-win-journal` *(researched, 75)*
- **Ship-now MVP:** log weekly wins (impact, metric, stakeholder) → auto-generate perf-review bullets + a LinkedIn post. `localStorage`, zero-secret.
- **Why YC:** a recurring habit (weekly logging = retention) in the large, evergreen career-growth market; the "brag doc" is a known viral concept.
- **Wedge → venture:** accounts → manager/team edition (1:1s, review cycles) → an HR-adjacent SaaS.
- **Moat:** the longitudinal personal record → switching cost.
- **Unlock:** accounts, team features.

---

## What got demoted, and why (the honest cut)

The YC lens systematically pushes down three big chunks of the backlog. Ship them for **traffic**,
not as company seeds:

- **Viral quizzes — ColorSeason (78), ChronoType (78), ArcheType (77), DogYears (73), NameCard (77).**
  Best-in-class *distribution* (huge share loops) but one-and-done, no retention, no monetization, no
  moat. **Verdict:** ship as top-of-funnel traffic magnets that cross-promote the real products; they
  are not fundable on their own. High forge-score, low YC-score — the clearest illustration of the gap.
- **One-shot calculators — TipWorld, RetroYear, UpgradeCost, TechTimeline, BakeConvert, DogYears.**
  Genuinely useful, great SEO, but a single answer and then the user leaves. No second visit, no
  recurring revenue. Keep as SEO surface.
- **The local/agency-adjacent parked set — ReserveRight, SlipLine, DoneRight, VisibleAI, ReviewPulse.**
  Off-thesis for a venture swing (private/local channel, not organic reach to strangers); already
  correctly parked.

**Near-misses worth watching (just outside the 10):** VerbDrill (language learning is venture-scale à
la Duolingo, but DeckShare already carries the ed/SRS + network angle more defensibly), CreatorClimb
(creator-economy tailwind, but advisory and one-and-done), WordSprint (strong daily-streak retention,
modest monetization), FIREPath / DebtViz (big finance market and good repeat use, but weak moat and
soft willingness-to-pay).

---

## Recommended next moves

1. **Greenlight the next 3 (all zero-secret, ship this week):** **InvoiceKit**, **DeckShare**,
   **RunwayLens**. Highest YC ceiling among ideas with a clean free MVP — invoicing TAM, the only
   real UGC/network moat, and the founder-tools beachhead.
2. **Finish PulseGuard** — it's already greenlit and locally built; the free re-scan wedge ships
   now, the recurring monitoring waits on the owner's Vercel/cron unlock.
3. **Add the three NEW founder-tools ideas to `ideas.json`** (RunwayLens, DilutionLens, SaaSMetrics)
   in a follow-up if you want them tracked in the pipeline — say the word and I'll write the records.
4. **Keep the quiz/calculator backlog flowing as SEO magnets**, each cross-promoting the top-10
   products — distribution fuel, not the main bet.

> **Caveat:** within the zero-secret guardrail, every "venture path" above depends on the owner later
> unlocking payments/accounts/sync. The free MVPs are real businesses' *front doors*, not the
> businesses. The day you fund Stripe + a database, InvoiceKit and SubAudit are the two that convert
> fastest from wedge to revenue.
