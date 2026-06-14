# Launch kit — JSONSafe · JWTCheck · ShipCheck (2026-06-14)

> Paste-ready, honest-only (no fabricated metrics/users/testimonials — these just launched).
> Auto-posting is against ToS, so YOU fire these. Order = highest leverage first. Log outcomes in
> `ops-log/metrics-ledger.md`. All three target developers (= the agency-buyer audience).

Leverage order: **ShipCheck first** (open-source CLI = the stickiest, most shareable, dev-native) →
JWTCheck (security hook) → JSONSafe (broad utility). Do one well, then the next.

---

## 1. ShipCheck — the big at-bat (open-source npx CLI + GitHub Action)

**Links:** repo https://github.com/Dukotah/shipcheck · landing https://labs.copperbaytech.com/shipcheck/

### Highest-leverage move first: get it into the directories devs already browse
These are PRs/listings, not posts — permanent backlinks, dev-native discovery. (PRs are owner-fired.)
- **`awesome-actions`** (sindresorhus-style list) → add ShipCheck under "Security" or "Code quality".
- **`awesome-nodejs`** / **`awesome-cli-apps`** → add under CLI / developer tools.
- **GitHub Marketplace** → publish the Action (checkbox on a Release at
  github.com/Dukotah/shipcheck/releases — web UI only).
- npm: once published, the package page itself is discovery.

### Show HN (post yourself, then stay in the thread to answer for the first 2h)
**Title:** `Show HN: ShipCheck – npx command that gives your vibe-coded app a pre-launch report card`
**Body:**
> I kept shipping AI-generated side projects with dumb mistakes — a committed .env, a hard-coded key, no
> security headers, images with no alt text. The checks for that are scattered across separate websites,
> and pasting a live secret into a random site is its own risk.
>
> ShipCheck folds the whole pre-launch checklist into one local command: `npx shipcheck`. It scans your
> project and prints a graded report card — secrets, dependency health, env hygiene, security headers,
> build artifacts, SEO, accessibility, project hygiene. It's zero-dependency, runs 100% locally (no
> network, no upload — kind of the point for a tool that hunts leaked secrets), and ships as a GitHub
> Action so you can gate CI.
>
> Each check is a ~30-line module; the whole thing is MIT. Happy to take feedback on the checks /
> false-positive rate.
>
> Repo: https://github.com/Dukotah/shipcheck

### r/webdev / r/node (answer-where-asked beats a raw self-post)
Find a thread about shipping, "things I forgot before launch", or secret leaks, and reply with the
story + the one-liner. Raw self-promo gets removed; a genuine "I built this because I kept doing X" in
a relevant thread does not.

### X / LinkedIn (short)
> Built ShipCheck: `npx shipcheck` → a pre-launch report card for your project. Committed secrets,
> vulnerable deps, missing security headers, broken SEO & a11y — caught locally before you deploy.
> Zero deps, nothing uploaded, MIT. https://labs.copperbaytech.com/shipcheck/

---

## 2. JWTCheck — security hook

**Link:** https://labs.copperbaytech.com/jwtcheck/

### Answer-where-asked (best fit): live "how do I decode a JWT" / "is jwt.io safe" threads
> A JWT is often a live session token — pasting it into an online decoder hands a working credential to
> a server you don't control. I made JWTCheck: it decodes + **audits** the token (flags alg:none, weak
> algorithms, never-expiring tokens, missing iss/aud) and optionally verifies the signature — all 100%
> in your browser, the token never leaves the tab. https://labs.copperbaytech.com/jwtcheck/

### X / LinkedIn
> JWTCheck: decode AND audit a JSON Web Token without pasting it into a site that logs it. Flags
> alg:none, weak algs, never-expiring tokens; optional in-browser signature verify. Nothing uploaded.
> https://labs.copperbaytech.com/jwtcheck/

---

## 3. JSONSafe — broad utility

**Link:** https://labs.copperbaytech.com/jsonsafe/

### Hook: the 2025 JSONFormatter.org leak (every write-up of it is a relevant thread)
> After the 2025 incident where a popular JSON formatter was found retaining 80k+ user-pasted files
> (secrets included), I built JSONSafe: format, validate, tree-explore and **semantically diff** JSON
> entirely in your browser tab. Nothing uploaded — open your network tab and check.
> https://labs.copperbaytech.com/jsonsafe/

### X / LinkedIn
> JSONSafe: format, validate & semantic-diff JSON 100% in your browser. The diff is key/path-aware (not
> line-by-line), and nothing you paste ever leaves the tab. https://labs.copperbaytech.com/jsonsafe/

---

## After any of these land
- Add a row to `ops-log/metrics-ledger.md` (date, channel, any clicks/leads).
- Watch Gmail for "Fix quote —" / quote subjects (the money signal).
- ShipCheck's in-tool footer + the JWTCheck/JSONSafe CTAs already route fix-intent to copperbaytech.com.
