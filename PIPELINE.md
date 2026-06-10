# FORGE — Build & Ship Pipeline (the deterministic engine)

> This is the repeatable engine behind `FORGE.md`. `FORGE.md` is *why/what*; this is *how*.
> Follow these stages verbatim for every greenlit idea so builds stop being ad-hoc swarms and
> start being a factory line. Every shipped product is a static, zero-secret site on GitHub Pages
> at `https://dukotah.github.io/<slug>/`.

## 0. Inputs & invariants

- **Input:** one idea in `ideas.json` with `"status": "greenlit"` (or `"building"`).
- **Slug:** lowercase, no spaces, matches the repo + Pages path (`bookdeposit`, not `BookDeposit`).
- **Lane:** zero-secret only. Anything needing a key/account is spec'd under the idea's
  `needsOwner[]` and parked in `BUILD-NOTES.md` — it never blocks the free MVP.
- **Brand:** footer carries "Copper Bay Labs" + cross-promo to 2–3 sibling tools. No fabricated
  metrics, reviews, or testimonials (guardrail #5).

## 1. File manifest (the suite standard — every product has exactly these)

```
index.html            the tool itself (functional, not a marketing shell)
app.js                all logic, runs 100% client-side, XSS-safe (textContent, never innerHTML on user data)
styles.css            self-contained; NO undefined var(--token) (renders invisible, still builds green)
about.html            what it is, privacy stance, "not advice" disclaimer where relevant
404.html              on-brand, links home
README.md             public-facing one-pager
robots.txt            Allow: / + Sitemap: https://dukotah.github.io/<slug>/sitemap.xml
sitemap.xml           index + about, lastmod = ship date
favicon.svg           inline brand mark
og-image.png          1200×630 social card (render from og-template.html)
apple-touch-icon.png  180×180 (render from touch-template.html)
og-template.html      source for og-image.png (kept, not linked)
touch-template.html   source for apple-touch-icon.png (kept, not linked)
BUILD-NOTES.md        INTERNAL — gitignored. Build log + parked needsOwner/paid backend spec.
.gitignore            contains: BUILD-NOTES.md
```

Every `index.html`, `about.html`, `404.html` must set, pointing at the final slug:
`<title>`, `<link rel="canonical">`, `og:url`, `og:image`, `twitter:card`. **The #1 fork bug:**
a product forked from a sibling keeps the *sibling's* slug in canonical/og/robots/sitemap. Always
re-point them. `scripts/verify-product.sh` catches this.

## 2. Stages

```
SPEC ──▶ SCAFFOLD ──▶ BUILD ──▶ ADVERSARIAL REVIEW ──▶ FIX ──▶ VERIFY ──▶ DEPLOY ──▶ RECONCILE
```

1. **SPEC** — write `docs/<slug>.md` from the idea's `buildPlan`: the free MVP scope, the exact
   inputs/outputs, and the parked paid tier. One screen of truth before any code.
2. **SCAFFOLD** — copy `templates/product/` to `../<slug>/`, replace the `{{TOKENS}}`
   (see template README), or fork the closest sibling product and re-point every URL.
3. **BUILD** — implement the tool in `app.js` + `index.html`. Disjoint file ownership if using
   parallel agents; integrate shared files (index/nav) yourself. Keep agent fan-out lean
   (~5–12, Sonnet/Haiku) per the budget guardrail.
4. **ADVERSARIAL REVIEW** — a fresh agent tries to break it: XSS via user input, injection in any
   generated snippet, dead/unreachable UI states, WCAG AA contrast, screen-reader churn, broken
   math. Findings are fixed, not waved through (guardrail #4, no slop).
5. **FIX** — apply review findings. Re-render og/touch PNGs if the agent skipped them.
6. **VERIFY** — run `scripts/verify-product.sh <slug>` → must end `DEPLOY-READY`. Gate: blocks deploy.
7. **DEPLOY** — run `scripts/deploy-product.sh <slug> "<repo description>"`. Creates the public repo,
   pushes, enables Pages, polls until the URL serves 200.
8. **RECONCILE** — flip the idea to `"status": "shipped"` with `liveUrl` + `repo`; add a record to
   `builds/<slug>.md`; commit the brain repo. (Done = live URL, not "built locally".)

## 3. Verification gate (what `verify-product.sh` enforces)

- `node --check app.js` passes (and any other `.js`).
- All manifest files present (warns on missing PNGs/sitemap).
- canonical / og:url / og:image / robots / sitemap all reference **this** slug, no sibling slug,
  no placeholder.
- No slop: `TODO`, `FIXME`, `Lorem`, `REPLACE`, `placeholder` content, stray `console.log`.
- `.gitignore` ignores `BUILD-NOTES.md`.

A product that fails the gate is fixed or parked — never shipped.

## 4. Deploy recipe (what `deploy-product.sh` runs)

```sh
cd <slug>
printf 'BUILD-NOTES.md\n' > .gitignore
git init -b main && git add -A
git commit -m "<slug> — initial public build (Copper Bay Labs)"
gh repo create Dukotah/<slug> --public --source=. --push --description "<desc>"
gh api -X POST repos/Dukotah/<slug>/pages -f "source[branch]=main" -f "source[path]=/"
# then poll https://dukotah.github.io/<slug>/ until 200 (first build ~30–90s)
```

`gh` is authed as `Dukotah` (repo+workflow scopes). GitHub Pages = free HTTPS, no Vercel burn.
To re-deploy an existing tool: just `git push` (Pages rebuilds on push to main).

## 5. After ship — distribution (the actual constraint)

Building is the cheap half; reach is the bottleneck (see `forge/ops-log/` + the scheduled operator).
Per-ship, the autonomous half:
- Add the new tool to the **Copper Bay Labs hub** (`hub/`) and to siblings' cross-promo footers.
- Generate the launch kit entry (SEO page, ProductHunt/Reddit/X copy) under `marketing/` — queue,
  don't auto-post (ToS; owner posts).
The owner-only gates that unlock real traffic: confirm the lead inbox **receives**, Search Console
verify `dukotah.github.io` + submit sitemaps, owner posts the prepared launches. Until then,
github.io subpaths barely index — flag these in the run summary, never fake around them.

## 6. Roles in the loop (who runs this)

- **Scout routine** (every 2 days) — refills `ideas.json`, runs distribution batches, logs to
  `ops-log/`, emails the owner.
- **A session agent (you)** — takes greenlit ideas through SPEC→RECONCILE, or ships already-built
  backlog (verify-then-deploy), and keeps `ideas.json` truthful.
- **Owner** — greenlights (5 sec), provides keys to unlock paid tiers, does the browser-only
  distribution gates.
