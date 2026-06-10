# Product template — Copper Bay Labs suite standard

Scaffold a new zero-secret static product from these files. Tokens (replace everywhere):

| Token | Meaning | Example |
|---|---|---|
| `{{SLUG}}` | repo + Pages path, lowercase no spaces | `meetingmeter` |
| `{{BRAND}}` | product name | `MeetingMeter` |
| `{{TAGLINE}}` | short headline | `See what a meeting really costs` |
| `{{DESC}}` | one-sentence meta description | `Watch the dollar cost of a meeting tick up live…` |
| `{{DATE}}` | ship date, ISO | `2026-06-10` |

Use `forge/scripts/new-product.sh <slug> "<Brand>" "<Tagline>" "<Desc>"` to copy + fill tokens.

Then:
1. Build the real tool into `index.html` (replace the TOOL placeholder card) + `app.js`.
2. Add product CSS **below** the marked line in `styles.css` (keep the shared tokens).
3. Render `og-image.png` (1200×630) and `apple-touch-icon.png` (180×180) — add `og-template.html`
   / `touch-template.html` sources. (These two PNGs are the only files not in this skeleton.)
4. Add `BUILD-NOTES.md` (gitignored) with the build log + any parked `needsOwner` paid tier.
5. `forge/scripts/verify-product.sh <slug>` → must say DEPLOY-READY.
6. `forge/scripts/deploy-product.sh <slug> "<repo description>"`.

**Footer note:** the `mailto:contact@copperbaytech.com` Pro-waitlist band mirrors the shipped
suite. Per the ops blocker, confirm that inbox actually *receives* before relying on it as a lead
channel — it's currently demand-capture only.

Files here: `index.html app.js styles.css about.html 404.html robots.txt sitemap.xml favicon.svg README.md`.
Not here (generate per product): `og-image.png apple-touch-icon.png og-template.html touch-template.html BUILD-NOTES.md`.
