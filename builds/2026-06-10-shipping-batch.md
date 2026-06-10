# Build/ship record — 2026-06-10 shipping + engine session

Session goal (owner): run all four FORGE workstreams in parallel — codify the engine, ship
backlog, fix distribution, improve idea quality — with the agent driving and minimal owner input.

## Shipped to GitHub Pages this session (live, HTTP 200 verified)

| Tool | URL | Note |
|---|---|---|
| InvoiceQuick | https://dukotah.github.io/invoicequick/ | Was already deployed by a prior run; **records reconciled** (ideas.json was still `building`). |
| BookDeposit | https://dukotah.github.io/bookdeposit/ | No-show cost calculator. New repo + Pages this session. |
| CreatorVault | https://dukotah.github.io/creatorvault/ | License-key generator + creator-fee comparison. New repo + Pages. |
| PactSign | https://dukotah.github.io/pactsign/ | Freelance/agency contract template generator. New repo + Pages. |
| RecoverFlow | https://dukotah.github.io/recoverflow/ | Failed-payment revenue-leak calculator. New repo + Pages. |

Each wedge was independently verified DEPLOY-READY before push (node --check, full file manifest,
canonical/og/robots/sitemap point at the correct slug — the #1 fork bug — no slop). The paid
backends for all four remain parked under `needsOwner` in each repo's `BUILD-NOTES.md` (gitignored).

**Live portfolio: 6 → 11 tools.** Full set: ShipSafe, LeakCheck, ExposureCheck, DepCheck,
HardenCheck, ComplyKit (ship-safety suite) + InvoiceQuick, PactSign, BookDeposit, RecoverFlow,
CreatorVault (business tools).

## Hub shipped

- **Copper Bay Labs hub** → https://dukotah.github.io/ (repo `Dukotah/dukotah.github.io`, user-root
  Pages). Lists all 11 tools grouped, internal-link SEO, root `sitemap.xml` enumerates every tool.
  Fixes the dead "Copper Bay Labs" root link that every tool footer points at.

## Engine codified (the repeatable factory line)

- `forge/PIPELINE.md` — deterministic build→ship pipeline (manifest, stages, verify gate, deploy recipe).
- `forge/templates/product/` — suite-standard scaffold + shared Copper Bay design-system CSS (token-based).
- `forge/scripts/new-product.sh` — scaffold a product from the template (token fill). Tested end-to-end.
- `forge/scripts/verify-product.sh` — pre-deploy gate (catches the fork-slug bug + slop). Tested vs. bookdeposit → DEPLOY-READY.
- `forge/scripts/deploy-product.sh` — one-command ship (verify → repo → push → Pages → poll-until-live).
- `ideas.json` reconciled: 5 wedges → shipped; HardenCheck backfilled as a tracked idea (was deployed untracked). 32 ideas / 11 shipped.

## Still owner-gated (distribution — the real traffic constraint)

These can't be done autonomously and block real traffic:
1. Confirm `contact@copperbaytech.com` actually **receives** (lead CTAs are demand-capture only until then).
2. Google Search Console: verify `dukotah.github.io` + submit `https://dukotah.github.io/sitemap.xml`
   (and per-tool sitemaps). Without this, github.io subpaths barely index.
3. Owner posts the prepared launches himself (HN/Reddit/PH/X) — auto-posting violates ToS.

## Next (teed up, not done)
- Idea quality: freshness-verify dated stats in `ideas.json`; run a category-diverse scout batch to refill.
- Backfill individual `builds/` records for complykit + hardencheck (shipped in prior sessions, untracked).
