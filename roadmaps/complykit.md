# ComplyKit — Roadmap: the suite's first *fix* tool (and first real revenue engine)

> **North star:** The Ship-Safety Suite is four tools that **find** problems. ComplyKit is the first
> that **fixes** one — it turns ShipSafe's "you're missing a privacy policy / demand-letter risk"
> verdict into a real, usable privacy policy, terms of service, and working cookie-consent banner in
> two minutes, free, no signup. Detection is a one-and-done SEO magnet; a **living compliance artifact
> people host and must keep current** is a subscription. ComplyKit is where the suite starts earning.
>
> Like every Copper Bay Labs product it inherits the shared design system and must look like a real
> studio product, not an AI one-off. Because it touches *legal trust*, credibility is the product:
> if the output looks generated, nobody ships it on their real site.

## Positioning & the suite loop

```
ShipSafe  ──finds──▶  "missing privacy policy → ADA/GDPR demand-letter risk"
   │
   └──▶  ComplyKit  ──generates──▶  Privacy Policy + ToS + Cookie banner
                          │
                          └──▶ embedded banner carries "Policy by ComplyKit" backlink
                                   → compounding SEO + qualified inbound back to the suite
```

- **Audience:** the same indie / no-code / vibe-coder / small-team audience as the rest of the suite,
  globally. Anyone who shipped an app fast and never wrote the legal pages every app legally needs.
- **Wedge vs. incumbents (Termly, iubenda, TermsFeed, FreePrivacyPolicy):** they are signup-gated,
  subscription-first, bloated, and generic. ComplyKit is **instant, no-signup, plain-English,
  vibe-coder-framed, and wired into a scanner that already told the user they need it.** That last
  part is distribution nobody else has.

## Guardrail compliance — READ FIRST (FORGE.md #6: no regulated/legal advice)

ComplyKit ships **only if** it stays a *template generator*, never *counsel*. This is the exact,
well-established non-advice model Termly/iubenda/TermsFeed run on (none are law firms), and the same
disclaimer posture the suite already uses for health tools ("not medical advice").

- Every generated document and every page carries a clear, unmissable **"This is a template, not legal
  advice — consult a lawyer for your situation"** disclaimer.
- The tool never answers "is my business compliant?" or gives situation-specific guidance. It collects
  factual inputs (company name, data collected, regions, third parties) and assembles vetted template
  clauses from those facts.
- Templates are built from public, authoritative sources (official GDPR/CCPA text, ICO/CNIL guidance,
  Google/Apple store policy requirements) and version-stamped so the user knows what law-version a doc
  reflects.

If the owner prefers zero legal adjacency, the clean fallback is **HardenCheck** (security-headers /
CSP / cookie-flag scanner next to ExposureCheck) — lower revenue ceiling, no guardrail question.

## The "AI-built" tells we are deliberately killing

| Tell | Fix |
|---|---|
| Emoji icons, generic blue gradient hero | inherit the Copper Bay Labs SVG icon set + brand identity |
| Generic, scary-but-vague legal boilerplate | tight, plain-English clauses with a "what this means" gloss |
| One flat page | `/how-it-works`, `/about`, a per-document `/templates` explainer = real-org depth |
| Forgettable output | the **generated document preview is the hero** — clean, professional, copy/paste-ready |
| A compliance tool that ignores its own | ComplyKit's own site has a flawless policy + consent banner + AAA accessibility |

(Same discipline as the rest of the factory: **verify by screenshot, never by build-success.**)

---

## Phase 1 — CREDIBILITY + FREE MVP (now) · zero-secret · GitHub Pages · verify: SCREENSHOT every item

The free generator is the SEO magnet and the top of the funnel. It must be genuinely excellent and
fully usable with no account, no payment.

- **P1.1 Brand + design system** — adopt the shared Copper Bay Labs kit (wordmark, color system,
  type pairing, SVG icons). Cohesion across the portfolio is itself the anti-slop signal.
- **P1.2 Document engine (client-side, zero-secret)** — a questionnaire → template assembler running
  entirely in-browser (same pattern as InvoiceQuick's `jsPDF`). Inputs: company/app name, contact,
  what data you collect (analytics, cookies, accounts, payments, location), third parties
  (Google Analytics, Stripe, Vercel, etc.), regions served (EU/UK/California/global), age policy.
- **P1.3 Three core documents at launch:**
  - **Privacy Policy** (GDPR + CCPA/CPRA aware, version-stamped)
  - **Terms of Service**
  - **Cookie / consent notice** + a copy-paste **cookie-consent banner snippet** (vanilla JS, no deps)
- **P1.4 Output that's actually usable** — live preview, one-click **Copy HTML**, **Download .html /
  .md / PDF**, and a hosted-stub option deferred to Phase 3. Plain-English "what this means" glosses
  beside each major clause.
- **P1.5 Self-exemplary** — ComplyKit's own site has a real ComplyKit-generated policy + a working
  consent banner, full keyboard nav, visible focus, AAA contrast, `prefers-reduced-motion`. It passes
  ShipSafe's own checks at the top grade (dog-food the suite).
- **P1.6 Disclaimers + sourcing** — the "not legal advice" disclaimer on every doc and page; a
  `/methodology` page citing the authoritative sources each template draws from + its law-version date.
- **P1.7 Trust depth** — `/how-it-works`, `/about` (Copper Bay Labs), honest limitations note.
- **P1.8 Suite cross-promo** — footer links to ShipSafe/LeakCheck/ExposureCheck/DepCheck; and the
  **reverse link from ShipSafe**: when ShipSafe flags a missing policy, it deep-links to ComplyKit.

## Phase 2 — DEPTH · make the documents genuinely better than the free incumbents

- **P2.1 More documents** — Acceptable Use Policy, Refund/Return policy, EULA, Disclaimer page,
  GDPR Data Processing Addendum (DPA), Cookie Policy as a standalone doc.
- **P2.2 Smarter assembly** — conditional clauses driven by the answers (e.g. Stripe selected →
  payment-processing + PCI clause; analytics selected → tracking + opt-out clause). This conditional
  accuracy is the quality moat vs. one-size-fits-all free generators.
- **P2.3 Real cookie-consent component** — a genuinely good, accessible, categorized (necessary /
  analytics / marketing) consent banner with granular opt-in, `localStorage` persistence, and a
  documented JS API. This is the asset that justifies the hosted paid tier in Phase 3.
- **P2.4 Multi-jurisdiction depth** — UK-GDPR, EU-GDPR, CCPA/CPRA, plus PIPEDA/LGPD/Australia toggles.
- **P2.5 Localization** — generate documents in multiple languages (huge for EU compliance + SEO).

## Phase 3 — MONETIZE (the point) · the suite's first recurring revenue

The free generator stays free forever (it's the funnel). Revenue comes from the **living artifact**:
docs and a consent banner that must stay current and hosted.

- **P3.1 Hosted, auto-updating policy URL** *(owner: needs a backend/host — Vercel token + KV/DB,
  this is the first product to leave the zero-secret lane)* — `yoursite.complykit.app/privacy` that
  you embed once and never touch again. When a law changes, the hosted doc updates and the site owner
  is notified. **Core $9–19/mo subscription.** This is the recurrence the rest of the suite lacks.
- **P3.2 Hosted Consent Management Platform (CMP)** — the Phase-2 banner, hosted + configurable from a
  dashboard, with a consent log (the audit trail GDPR actually wants). Bundled into Pro / higher tier.
- **P3.3 Remove "Policy by ComplyKit" branding** — classic one-toggle upsell; the free branding is
  also the backlink growth loop, so paid removal is a clean value exchange.
- **P3.4 One-time PDF/branded export pack** — for people who'll never want a subscription
  (mirrors InvoiceQuick's one-time template-pack model). Captures the no-recurring segment.
- **P3.5 Multi-site / agency tier** *(natural Copper Bay Tech tie-in)* — manage policies + consent for
  many client sites from one dashboard; white-label. Agencies are the highest-LTV buyer here.

| Tier | Price | What | Needs (owner) |
|---|---|---|---|
| Free | $0 | Generate + copy/download all core docs + basic banner | — (zero-secret) |
| One-time | ~$9 | Branded PDF pack, premium templates | Stripe |
| Pro | ~$12/mo | Hosted auto-updating policy URL + hosted CMP + consent log + no branding | Stripe + Vercel + DB |
| Agency | ~$39/mo | Multi-site dashboard, white-label, priority templates | + (above) |

## Phase 4 — DISTRIBUTE

- **P4.1 SEO cluster** — the highest-intent legal queries: "free privacy policy generator",
  "[GDPR/CCPA] cookie consent banner", "terms of service generator for [Next.js/Shopify/SaaS]",
  per-jurisdiction and per-platform long-tail landing pages (this scales to hundreds of pages).
- **P4.2 The ShipSafe handoff** — the single best channel: every ShipSafe scan that flags a missing
  policy is a pre-qualified ComplyKit lead. Instrument and optimize this funnel first.
- **P4.3 Backlink loop** — every free "Policy by ComplyKit" banner in the wild is an organic backlink;
  this compounds domain authority for the whole suite.
- **P4.4 Launch** — Product Hunt / Show HN / r/SaaS / r/indiehackers / r/webdev — **only after Phase 1
  credibility clears.** A slop launch wastes the one shot at attention.
- **P4.5 Copper Bay Labs umbrella site** — ComplyKit joins the shared portfolio page.

## How the overseer iterates ComplyKit (autonomous loop)

Add ComplyKit as a tracked project in `OVERSEER.md`. Each cycle the daily overseer routine advances
**one Phase-1 item** on an `overseer/<date>` branch, **screenshot-verifies** it, and confirms
ComplyKit still passes ShipSafe's own checks and renders a valid self-policy. Owner reviews + merges to
`main` → GitHub Pages auto-deploys (free, no Vercel quota). Work phases top-down; **do not start Phase
3 (the hosted/paid backend) until Phase 1–2 are solid and the free funnel is proven** — that's the
first deliberate step out of the zero-secret lane and should be earned by demonstrated free-tier demand.

## Scorecard (FORGE.md rubric)

| Dimension | Wt | Score | Why |
|---|---|---|---|
| Demand / pain | 25 | 23 | "free privacy policy generator" = top-tier high-intent legal query; every app legally needs these; ShipSafe demand-letter fear already proven in-suite |
| Gap / differentiation | 20 | 16 | incumbents are signup+subscription-gated & generic; none are vibe-coder-framed or wired to a scanner that already says you need it |
| Buildable as vibe-app | 20 | 18 | client-side template/doc generation, zero-secret MVP (InvoiceQuick pattern) |
| Distribution / virality | 15 | 14 | top SEO + ShipSafe handoff + "Policy by ComplyKit" backlink loop |
| Monetization | 10 | 9 | proven subscription market; hosted living artifact = genuine recurrence (the suite's weak axis, finally answered) |
| Defensibility | 10 | 6 | hosted artifact lock-in + accumulating clause/template library + backlink moat |
| **Total** | **100** | **86** | clears the 85 auto-greenlight bar; highest-scoring idea in the backlog |
