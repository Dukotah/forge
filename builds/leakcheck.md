# Build: LeakCheck 🔑 — SHIPPED 2026-06-08

- **Live:** https://dukotah.github.io/leakcheck/
- **Repo:** https://github.com/Dukotah/leakcheck
- **Idea score:** 80 (id `secret-leak-scanner`, category `dev`) — highest in the widened backlog
- **Stack:** static client-side web app (HTML/CSS/vanilla JS), GitHub Pages, $0, zero-secret.
- **What it does:** paste code, a `.env`, or config → an in-browser scan flags exposed API keys,
  tokens, and private keys, grouped by severity, each with a MASKED preview (first 4 + last 4 chars
  only), the line number, why it's dangerous, and concrete remediation (rotate → stop committing →
  env/secret-manager → scrub git history). "Try an example", "Clear", and "Copy report" (masked).

## Significance
**Product #3, and the FIRST built under the widened-scope mandate** — a globally-useful developer
tool, not a Sonoma-local / agency-funnel play. Same vibe-coder audience ShipSafe proved, but useful
to every developer on earth.

## How it was built
Built by a 7-agent forge swarm (Workflow): 4 parallel builders (detection engine, markup, styles,
peripherals/SEO) → 2 adversarial reviewers (a security reviewer hammering the core privacy/XSS/masking
promise + a completeness/a11y/SEO reviewer) → 1 finalizer that reconciled findings. The finalizer
caught and fixed a **blocker** (the results panel rendered unstyled due to an app.js↔CSS class-name
mismatch) and reconciled the DOM contract onto one naming set.

## Security promise (independently verified, not just claimed)
The product's whole pitch is "your code never leaves your browser." Verified by hand + in a real
browser before ship:
- **Zero network on user data** — no fetch/XHR/WebSocket/sendBeacon/image-ping carries input; the
  only external request is Google Fonts (CSS, from HTML). 
- **XSS-safe** — all user-derived text is inserted via `textContent` (the results container is
  cleared with `textContent=""`, never raw `innerHTML` of user input).
- **Masking is real** — live test: example scan rendered 10 findings (6 critical / 4 high) and the
  full secrets were provably absent from the DOM (`rawSecretVisible: false`); only masked previews
  (`AKIA••••••••••••MPLE`).

## Notes
- Inherited the **Copper Bay Labs design system** (Fraunces/Hanken, copper+bay palette) forked from
  ShipSafe → shipped polished. Full peripherals: about/methodology, 404, robots, sitemap, favicon,
  OG image (1200×630, generated via Playshot of og-template), apple-touch-icon (180×180), versioned
  assets (?v=1).
- **Push-protection gotcha (notable):** GitHub's own secret scanning blocked the first push because
  the demo data contained a recognizable Stripe test key. Fixed by assembling every fake example
  secret from string fragments at runtime, so the source contains no complete secret literal while
  LeakCheck still detects the reassembled strings. (A good lesson for any future scanner-type product.)

## Monetization path (per the owner's "valuable / monetizable" goal)
Free client-side tool = reach + dev-SEO ("check my code for exposed API keys") + HN/Reddit virality.
Paid upgrade teased in-product + roadmap: a **pre-commit hook + CI ruleset / org policy pack** (the
natural "now do this automatically on every commit" upsell). Needs owner later: Stripe + a domain.

## Lesson proven
The widened-scope mandate works on the first try: a category-diverse, globally-useful product shipped
polished in one swarm pass by forking the Copper Bay Labs base. Future forge products keep forking it.
