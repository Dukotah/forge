# Copper Bay Labs ops email — 2026-08-11 (second run)

**Status:** Draft created in Gmail (draft ID: r-6556686162763756119). Full text preserved here as backup.

**To:** dukotah@gmail.com
**Subject:** Copper Bay Labs ops — 2026-08-11 — HardenCheck: CSP for React/Vite apps (sixth guide)

---

Hi Dukotah,

Here's the ops run summary for 2026-08-11 (second run today — the earlier run was a scout session).

## What shipped this run

Task (a) — new SEO guide: HardenCheck sixth guide
**"Content-Security-Policy for React and Vite Apps (What Actually Works)"**

Live URL: https://labs.copperbaytech.com/hardencheck/guides/csp-react-spa-app.html
Git commit: `7c7767c` (dukotah/hardencheck main)

Target queries: "CSP React app", "Content-Security-Policy Vite", "React security headers", "React CSP unsafe-eval", "CSS-in-JS CSP violation"

This guide has been the top task (a) candidate in three consecutive ops-log entries (2026-08-07, 2026-08-09, 2026-08-11). Categorically distinct from all five existing HardenCheck guides.

**What the guide covers:**

- Why React apps break a standard CSP: three structural differences from server-rendered sites
- The three violations with exact browser console error text (bundler inline script, CSS-in-JS style injection, eval())
- Production starting policy with per-directive rationale table
- Three options for Vite's inline bootstrap script (disable, hash, cspNonce plugin); CRA INLINE_RUNTIME_CHUNK=false
- Dev vs prod policy split and why 'unsafe-eval' is dev-only
- CSS-in-JS nonces for SSR setups; honest about static-site limitation
- Netlify, Vercel, nginx deployment snippets
- 7-question FAQ

**Also updated:** nav on all 6 existing pages (index.html + 5 guides), sitemap.xml.

## Owner browser handoff queue

1. **UNCONFIRMED** — Confirm contact@copperbaytech.com RECEIVES email.
2. **NOT STARTED** — Google Search Console: verify dukotah.github.io, submit all sitemaps (hardencheck updated this run).
3. **ONGOING** — Post launch posts from forge/marketing/.
4. **NOT STARTED** — Cloudflare Web Analytics.

## Next candidates

- LeakCheck fifth guide (task a): "how to permanently remove a secret from git history" (git filter-repo + BFG)
- Task (b) continuation: LeakCheck → DepCheck; ExposureCheck → HardenCheck; ShipSafe demand-letter → ComplyKit

## Blocked

- Task (c) new lead CTAs: blocked until contact@copperbaytech.com confirmed.
- Auto-posting: forbidden.

— Copper Bay Labs autonomous ops, 2026-08-11
