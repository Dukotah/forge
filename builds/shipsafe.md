# Build: ShipSafe 🛟 — SHIPPED 2026-06-07

- **Live:** https://dukotah.github.io/shipsafe/
- **Repo:** https://github.com/Dukotah/shipsafe
- **Idea score:** 79 (id `vibe-app-health-checker`)
- **Stack:** static client-side web app (HTML/CSS/vanilla JS), GitHub Pages, $0, zero-secret.
- **What it does:** paste a URL → fetches the page via a CORS-proxy fallback chain → runs ~20
  source-HTML checks (accessibility / privacy / schema / trust) → plain-English **demand-letter
  risk** report with a prioritized fix list, copy-report, and a Copper Bay Tech "get it fixed" CTA.

## Phase 1 de-slop — SHIPPED 2026-06-07 (commits d295d8f + 89c645c)
Full credibility pass so it doesn't read as AI-built: **Copper Bay Labs brand** (copper + bay palette,
Fraunces serif / Hanken Grotesk pairing, custom **lifebuoy logo**), **custom SVG icon set replacing
every emoji**, redesigned **letter-grade report** (A–F) with WCAG deep-links + skeleton loading,
**Methodology + About** trust pages, **self-exemplary accessibility** (skip-link, landmarks,
focus-visible, reduced-motion, AAA contrast, footer legal links so it passes its own checks), and a
**human copy pass**. Screenshot-verified live (serif hero, copper motif, SVG icons, no emoji).
Remaining Phase 1: P1.4 shareable OG result image, P1.9 real domain (owner). Phases 2–4 next.

## Header fix + build-out — 2026-06-07 (commits → c55e0b9)
Owner reported a broken header. Root cause was TWO things: (1) the redesign HTML was loading against a
**stale cached `styles.css`** (relative link, no version) that predated the new `.masthead` rules → header
had no styling/height. (2) `position:sticky;top:0` rendered clipped. Fixes: **versioned asset links**
(`styles.css?v=N` / `app.js?v=N`, bumped each deploy so the CDN can't serve stale CSS again) + **non-sticky
header** (eliminates the clip) + **padding-based bar height**. Also fixed a mobile bug (stacked input
ballooned to 280px because `flex-basis` became a height in `flex-direction:column` → reset `flex:0 0 auto`)
and added `overflow-x:clip`. **Built it out:** a "Built for sites made with" credibility band
(Lovable/Bolt/v0/Cursor/Webflow/Framer/Squarespace/WordPress) + a 3-step "How it works" section.
Screenshot-verified: header crisp, mobile input correct, new sections render. LESSON for all Pages
products: **version CSS/JS links** or the CDN serves stale assets after a redesign.

## Status / next
- ✅ Built, deployed, live. Adversarial self-review done; smoke-test the live URL on a few real
  sites (a clean site, a no-code site, a JS-only SPA to see the graceful "couldn't read" state).
- **Pro tier (needs owner):** a Vercel deploy unlocks the server-side rendered-page scan (real
  Lighthouse/contrast) + scheduled re-checks + email alerts → the $9/mo monetization path.

## Launch kit (auto-published where possible; social posts QUEUED — connect channels to auto-post)

**Auto-published:** the live landing page is SEO-built (title/description/OG/JSON-LD, FAQ targeting
"is my website ADA compliant", "Lovable ADA compliance", etc.).

**Product Hunt** (tagline + first comment):
> **ShipSafe — Is your website about to get an ADA demand letter?**
> 4,600+ ADA web lawsuits hit in 2024, and AI-generated/no-code sites are the easiest targets. Paste
> your URL and get a plain-English report on the accessibility, privacy, and schema gaps that
> actually get sites sued — 10 seconds, no signup, free.

**Show HN / r/nocode / r/SideProject / r/indiehackers / r/SaaS:**
> **Show: ShipSafe – plain-English ADA & privacy risk check for vibe-coded sites**
> I kept seeing Lovable/Bolt/v0 sites ship with no `lang` attribute, unlabeled inputs, no alt text,
> and no privacy policy — the exact things serial ADA filers scan for. Existing tools (axe,
> Lighthouse) are dev-facing and never frame the legal/privacy risk. ShipSafe gives a non-technical
> "demand-letter risk" report with a fix list. Free, client-side, no signup. Feedback welcome.

**X / LinkedIn:**
> Built a free tool: paste your site's URL → plain-English report on the ADA/WCAG + privacy gaps that
> get sites demand letters. Made for the wave of AI-generated sites that look great but ship
> non-compliant. 10 sec, no signup → https://dukotah.github.io/shipsafe/

**SEO content angle (next):** a short post "Is your Lovable/Bolt site ADA compliant? The 6 things
that get AI-generated sites sued" linking the tool — near-zero competition on those queries.

**Distribution edge:** Boots audience (devs/vibe-coders), Copper Bay Tech client audits, indie-maker
communities. Honest framing only — it's heuristic guidance, not legal advice (stated in-product).
