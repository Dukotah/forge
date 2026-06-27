# Copper Bay Labs — Metrics & Revenue Ledger

> Purpose: keep an honest running score so we know when the funnel is *proven* and it's
> worth spending money on ads. Owner has said: once this earns and is proven, he'll fund
> advertising. No fabricated numbers — every figure here must trace to a real source
> (Gmail lead emails, Google Search Console, Stripe). Unknown = write "unknown", not 0.

## The funnel we're measuring
Traffic → tool use → tool finds a problem → "Get a free fix quote" CTA → pre-filled email
lands at `contact@copperbaytech.com` (→ forwards to dukotah@gmail.com) → agency service revenue.
(ComplyKit variant: generated doc → "review & install for you" quote.)

## Proof threshold (when to start paid ads)
Don't spend a dollar on ads until the funnel is *proven* organically. Proven =
**either** of:
- **≥1 real paying engagement** traced from a tool → lead email → closed Copper Bay Tech job, **or**
- **≥3 genuine inbound fix-quote leads** from the CTAs (shows the mechanic converts, even if not yet closed).
Until then, all distribution is $0/organic (SEO + manual launches + answer-where-asked).
Rationale: paying to send traffic into an unproven funnel just buys an expensive 0% conversion.

## What's trackable today (and the gap)
- ✅ **Inbound leads** — searchable in Gmail (subject starts "Fix quote —" or "Quote — … from ComplyKit"). This is the money signal.
- ✅ **Search visibility** — Google Search Console (sc-domain:copperbaytech.com) → Performance tab: impressions, clicks, queries. Starts populating ~days after indexing.
- ❌ **On-site traffic / which tool / CTA click-rate** — NO analytics installed yet. This is the one measurement gap. Privacy-friendly free options (no cookie banner needed): GoatCounter or Cloudflare Web Analytics. Owner-gated (needs a signup / snippet) — recommended next enabling step.

## Baseline — 2026-06-10 (launch-ready, pre-traffic)
| Metric | Value | Source |
|---|---|---|
| Live tools | 11 + hub + 1 cornerstone post | repos |
| Domain | labs.copperbaytech.com (indexed, sitemap accepted, 12+ pages) | Search Console |
| Search impressions (28d) | 0 (indexing just began) | GSC |
| Search clicks (28d) | 0 | GSC |
| Inbound fix-quote leads (total) | 0 | Gmail |
| Closed revenue | $0 | — |
| Ad spend to date | $0 | — |

## Cycle log (append one row per operator run / check-in — never rewrite history)
| Date | Impressions(28d) | Clicks(28d) | Leads(total) | Revenue | Notable / actions taken |
|---|---|---|---|---|---|
| 2026-06-10 | 0 | 0 | 0 | $0 | Baseline. Domain migrated, CTAs live, Search Console verified, cornerstone post shipped. Awaiting owner's first launch post. |
| 2026-06-10 | 0 | 0 | 0 | $0 | DISTRIBUTION STARTED. Channels live: LinkedIn (checklist), Dev.to (https://dev.to/dukotah_hutcheon/the-5-minute-pre-launch-checklist-for-ai-generated-apps-203e, canonical→checklist). HN Show HN pending owner login. No leads yet (expected, <1h). |
| 2026-06-10 | 0 | 0 | 0 | $0 | PORTFOLIO 11→16 tools. Shipped 5 new (cspbuilder, ogpreview, schemamaker, imagecompressor, exifviewer) — all live, in hub+sitemap+dashboard, each with lead CTA. Fixed verify/deploy scripts (were pointed at old domain). Note: more tools ≠ more conversion until traffic is proven; these add SEO surface + traffic magnets (image compressor / exif privacy are high-volume evergreen searches). |
| 2026-06-11 | unknown | unknown | 0 | $0 | SEO article shipped: "How to fix an exposed .env file" → exposurecheck/guides/fix-exposed-env-file.html. Targets fix-intent query, ~1,000 words, platform-specific server configs, per-provider credential rotation, git history cleanup, ExposureCheck verify CTA, cross-links to LeakCheck + ShipSafe. Sitemap + index.html updated with Guides links. Submit updated sitemap to GSC: action for owner. |
| 2026-06-19 | unknown | unknown | 0 | $0 | SCOUT RUN. 6 new ideas appended to ideas.json: CrawlerBlock (78/dev), YarnCalc (78/hobby), BabyLog (77/health), HyperFocus (76/productivity), GiftMap (76/consumer), LaunchCopy (75/b2b). Batch is fully category-diverse. Gmail draft created for owner brief. PulseGuard still greenlit-but-unbuilt — flagged to owner. |
| 2026-06-19 | unknown | unknown | 0 | $0 | SEO guide shipped: "WCAG Compliance for AI-Generated Sites" → shipsafe/guides/wcag-compliance-ai-generated-sites.html. Covers lang attr, form labels, alt text, color contrast, skip nav link — each with code examples and Lovable/Webflow/WP-specific instructions. FAQ JSON-LD schema. ShipSafe CTA + ComplyKit cross-link. Completes 5-tool fix-guide rotation. Submit shipsafe sitemap to GSC: action for owner. |
| 2026-06-27 | unknown | unknown | 0 | $0 | SCOUT RUN. 6 new ideas appended to ideas.json: MoneyType (79/fun), RaiseKit (78/b2b), AICite (76/productivity), VoltCheck (74/consumer), DiscardMath (72/hobby), FabricYard (73/hobby). Batch spans 5 categories; all zero-secret, all score ≥70. PulseGuard still greenlit-but-unbuilt — flagged again. Email draft queued for owner with top-3 picks and handoff actions. |
