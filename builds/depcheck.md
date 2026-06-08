# Build: DepCheck 📦 — SHIPPED 2026-06-08

- **Live:** https://dukotah.github.io/depcheck/
- **Repo:** https://github.com/Dukotah/depcheck
- **Idea score:** 77 (id `dependency-risk-scanner`, category `dev`)
- **Stack:** static client-side web app (HTML/CSS/vanilla JS), GitHub Pages, $0, zero-secret.
- **What it does:** paste your `package.json` (or a lockfile) → a plain-English report on dependency
  risk: known vulnerabilities (via the free OSV.dev API), typosquatted package names, abandoned/
  unmaintained packages, risky/copyleft licenses, loose version ranges, install-script hooks, and
  dependency bloat. Grouped by severity, per-package, with concrete fixes. "Copy report".

## Significance — 4th tool in the ship-safety suite
ShipSafe (sued) → LeakCheck (code secrets) → ExposureCheck (live site) → **DepCheck (dependencies)**.
Four cross-linking tools for the vibe-coding wave; the suite compounds traffic + shares one paid tier.

## How it was built
A 9-agent forge Workflow (4 build / 2 verify / 1 finalize **+ 2 marketing** agents that produced the
suite launch kit in parallel). Forked LeakCheck (design + safe-render helpers). 0 blockers; finalizer
applied all 8 findings (incl. wiring the real install-script check + reconciling the package-row CSS).

## Privacy & security (independently verified)
- **Your code stays with you** — confirmed by hand + browser: the ONLY outbound requests carry just
  package NAME + VERSION to public registries (api.osv.dev, registry.npmjs.org). The pasted manifest
  body (project name, scripts, postinstall) never leaves the browser.
- **XSS-safe** — registry/OSV responses + pasted text rendered via `textContent`/`el()`, never
  `innerHTML`. Live test: a malicious package name and a `<script>` postinstall rendered as escaped
  text (0 injected nodes).
- **Live browser test:** example scan = 18 risks across 11 deps (4 critical/3 high/6 medium/5 low);
  a bogus package's 404 degraded gracefully with no hang.

## Known limitations (honest)
- Vulnerability/freshness/license checks depend on OSV.dev + npm registry being reachable/CORS-enabled;
  if down, they degrade to offline typosquat + hygiene checks (the UI says so).
- Typosquat list is ~150 popular packages; OSV needs a concrete version (range-only deps aren't queried);
  install-script check only sees the root package.json, not transitive deps. A clean scan is not a guarantee.

## Monetization path
Free tool = reach + suite cross-traffic + dev-SEO ("check package.json for vulnerabilities"). Shared
paid tier with the suite: scheduled re-scans + a CI/pre-commit ruleset pack. Needs owner later: a domain.

## Launch kit
A full suite launch kit (Show HN, Reddit ×3, Product Hunt, X, LinkedIn + an SEO/positioning brief) was
generated alongside this build and committed to `marketing/suite-launch.md`. Honest-only — no fabricated
metrics. Queued for the owner to post (socials aren't connected for auto-posting; Gmail draft created).
