# Build: QuotePilot 🏷️ — SHIPPED 2026-06-07

- **Live:** https://dukotah.github.io/quotepilot/
- **Repo:** https://github.com/Dukotah/quotepilot
- **Idea score:** 74 (id `contractor-quote-page-agency-install`, reshaped to a consumer-facing standalone)
- **Stack:** static client-side web app (HTML/CSS/vanilla JS), GitHub Pages, $0, zero-secret.
- **What it does:** pick a home project (10 types) + size + finish level → a transparent, itemized
  **ballpark range** (labor + materials split, shown with the math), Copy + Share. Honest by
  construction: the estimate is a visible sum of labeled assumptions (per-unit range × size × tier),
  with a prominent "ballpark, not a quote" disclaimer + an About page documenting the method.

## Notes
- **Reshaped** from the scout's "agency-install lead qualifier" (a weak B2B standalone) into a
  consumer-facing cost estimator (bigger audience, SEO/share strength, no secrets) — full creative
  control per the owner.
- **Inherited the Copper Bay Labs design system** from ShipSafe (Fraunces/Hanken type, copper+bay
  palette — bay-teal lead to distinguish, same header/footer/component patterns), so v1 shipped
  polished with ZERO redesign rounds. Baked in every ShipSafe lesson from commit 1: versioned assets
  (`?v=1`), non-sticky header, mobile media queries, overflow-clip, OG share image, 404, robots,
  sitemap, touch icon, self-exemplary a11y. Screenshot-verified (estimator renders + computes correctly:
  Bathroom 80 sq ft Standard → $9,600–$28,000).
- **Integrity:** per-unit ranges are widely-published national ballparks; nothing fabricated; the range
  is deliberately wide and disclaimed. No fake reviews/data.
- **Parked (needs owner):** the "get matched with local pros" lead-capture (Resend/email) — v1 ships
  the full estimator + Copy/Share; the lead funnel is the Pro/monetization upgrade.

## Lesson proven
The factory's portfolio-cohesion thesis works: product #2 reused #1's design system → shipped polished
in ONE pass instead of ShipSafe's many de-slop rounds. Future forge products should fork the Copper Bay
Labs base.
