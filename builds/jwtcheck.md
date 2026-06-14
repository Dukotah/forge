# Build/ship record — JWTCheck

- **Date:** 2026-06-13
- **Idea:** `jwt-decoder-inspector` (score 79) — proposed + greenlit + built + shipped same session
  to replace the mined-out dev vein in the backlog.
- **Live:** https://labs.copperbaytech.com/jwtcheck/ (HTTP 200 verified at deploy)
- **Repo:** https://github.com/Dukotah/jwtcheck (public, GitHub Pages, main/root)
- **Lane:** zero-secret / `needsOwner: []` — no keys, no backend, pure client-side.

## What shipped
Decode **and audit** any JSON Web Token, 100% in-browser:
- **Decode** header + payload (base64url → JSON, syntax-highlighted), raw signature shown.
- **Claims in plain English** — `exp`/`iat`/`nbf` as real UTC dates + relative time; `iss`/`aud`/`sub`/`jti` labelled.
- **Security audit** (the wedge vs jwt.io): severity-ranked — `alg:none` critical, no `exp` high,
  expired medium, symmetric/long-lived/future-`nbf`/missing-`iss`-`aud` low, asymmetric pass.
- **Optional signature verification** via Web Crypto — HS256/384/512 (secret) and RS/ES/PS 256/384/512
  (PEM public key). Key + token never leave the tab.
- **Lead CTA** — it's a detector, so it feeds the suite's findings-driven "Get a free fix quote".
  Sends only finding TITLES + COUNTS, states "No token was shared" — never the token/claims/secret.

## Positioning
A JWT is often a live credential; pasting it into a random decoder is a real exposure. "Your token never
leaves the tab." Joins the -Check security family and (unlike JSONSafe, a pure utility) plugs into the
agency lead funnel. Evergreen high-intent search ("jwt decoder").

## QA
- `node --check` clean; `verify-product.sh` → DEPLOY-READY.
- Node: HMAC sign+verify (correct secret VALID, wrong rejected); decode correctness.
- Headless-Chrome: full UI renders (decode/claims/audit), Web Crypto verify → "✓ VALID" for sample+secret,
  DOM dump confirmed CTA mailto carries only labels+counts (no token). XSS-safe (textContent/createElement).

## Reconciled
- `ideas.json`: jwt-decoder-inspector → shipped (+liveUrl/repo). Hub ("Ship-safety suite" group) +
  hub sitemap + overseer dashboard all updated.

## Not done / future
- Optional **jwtcheck-action** CI twin (mirror leakcheck-action) — fail builds on `alg:none`/missing-exp.
- Lead funnel still 0 leads portfolio-wide — owner-gated distribution remains the real constraint.
