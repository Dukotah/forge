# Build: ExposureCheck 🔭 — SHIPPED 2026-06-08

- **Live:** https://dukotah.github.io/exposurecheck/
- **Repo:** https://github.com/Dukotah/exposurecheck
- **Idea score:** 80 (id `live-site-exposure-scanner`, category `dev`)
- **Stack:** static client-side web app (HTML/CSS/vanilla JS), GitHub Pages, $0, zero-secret.
- **What it does:** enter your deployed URL (or paste your built bundle) → a plain-English report on
  what a public visitor can already grab: exposed `.env`/`.git`/config/backup files, API keys/secrets
  hardcoded in your shipped JS bundle, publicly-fetchable source maps (leaked original source), and
  leaked internal endpoints. Findings are grouped by severity, secrets are masked, "Copy report"
  (masked). Best-effort, honest about what proxy-scanning can't see (e.g. response headers).

## Significance — completes the "ship-safety suite"
Product #4, and the third tool in a coherent, cross-promoting product line for vibe-coded / indie apps:
- **ShipSafe** — will you get SUED (ADA/WCAG + privacy)
- **LeakCheck** — did you leak a secret in your CODE (paste source)
- **ExposureCheck** — is your LIVE site leaking (scan the deployed app)
Each links to the other two as the Copper Bay Labs ship-safety suite, so they compound each other's
traffic instead of standing alone.

## How it was built — fork + swarm
Built by a 7-agent forge Workflow swarm (4 build / 2 adversarial verify / 1 finalize) that **forked the
LeakCheck repo**: it reuses LeakCheck's secret-detection regex set, `maskSecret()`, the `el()`/textContent
safe-render helpers, and the entire design system + finding/severity components — applied to FETCHED
content instead of pasted code. Shipped polished, 0 blockers.

## Architecture (dual input, zero-secret)
- **URL mode (primary):** fetches the target page + same-origin scripts through a fallback chain of
  public CORS proxies (allorigins → corsproxy.io → thingproxy), with per-request timeouts and graceful
  degradation to paste mode if all fail. Probes a curated ~12-path list (/.env, /.git/config, /.DS_Store,
  /backup.zip, …) for publicly-exposed sensitive files.
- **Paste mode (fallback, always works, no network):** paste your built HTML/JS → same analysis, fully
  client-side. "Try an example" uses this so the demo works offline.

## Security & safety (independently verified, not just claimed)
- **XSS-safe** — it fetches ARBITRARY remote HTML/JS, so this was the #1 adversarial target. Confirmed by
  hand: ZERO `innerHTML`/`document.write`/`insertAdjacentHTML`; all fetched/pasted content reaches the DOM
  only via `textContent`/`el()`/`createTextNode`.
- **Masking real** — live browser test: example scan rendered 16 exposures (5 critical/3 high/5 medium/3
  low) with the full secrets provably absent from the DOM (only masked previews).
- **Defensive framing** — enforced as a scan-YOUR-OWN-site check: prominent "only scan sites you own or are
  authorized to test" notice, FAQ "Is this an attack tool?", and it only requests publicly-served paths
  (no exploitation/auth-bypass). Not a pentest tool.

## Known limitations (honest)
- URL mode depends on third-party public CORS proxies (can be rate-limited/down, can't reach auth-gated or
  private pages); a clean/failed URL scan is not authoritative — **paste mode is the reliable path**.
- Security-headers check is informational only (proxies strip headers) — surfaces an honest "not verifiable
  via proxy" note rather than a verdict.
- Heuristic detection (regex + entropy + sniffers): can miss novel formats; a clean result is not a guarantee.

## Monetization path
Free tool = reach + the suite's cross-traffic + dev-SEO ("is my site leaking my .env / API keys"). Paid
upgrade (shared across the suite): scheduled re-scans + a CI/pre-commit ruleset pack (LeakCheck's paid tier),
and a "fix it" funnel to Copper Bay. Needs owner later: a domain + (for scheduled scans) a small backend.

## Lesson proven
Forking a sibling product (LeakCheck) → a second polished product in one swarm pass, with a built-in
cross-promotion loop. The suite strategy is the compounding play; future Labs products should cluster.
