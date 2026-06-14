# Build/ship record — ShipCheck (CLI)

- **Date:** 2026-06-13/14
- **Origin:** owner request — "build a project that uses significant tokens / takes significant time
  and helps other vibe coders." Not from ideas.json; proposed + built this session.
- **Repo:** https://github.com/Dukotah/shipcheck (public, MIT, tags `v1` + `v1.0.0`)
- **Landing:** https://labs.copperbaytech.com/shipcheck/ (served from the repo's `docs/` via Pages; HTTP 200)
- **Type:** open-source **npm CLI + GitHub Action** — NOT a Pages static tool. This is the v2 of the
  whole ship-safety suite, turned into a dev-workflow command (mirrors the leakcheck-action distribution play, bigger).

## What it is
`npx shipcheck` scans a project locally and prints a graded pre-launch report card. Zero runtime
dependencies (node: builtins only), 100% local (no network, no writes). 8 analyzers:
secrets · deps · env · headers · artifacts · seo · a11y · meta. 4 reporters: terminal · json ·
markdown · sarif. CLI flags (`--fail-on`, `--only`, `--skip`, `--format`, `--ignore`) + `.shipcheckrc.json`.
GitHub Action (`action.yml`: job summary + CI gate) + CI on Node 18/20/22.

## How it was built (hybrid spine + multi-agent fan-out)
- Spine built directly: context scanner, severity/score, auto-discovery registry, runner, CLI, the
  reference analyzer (secrets) + reference reporter (terminal) + reference test + the ANALYZER-CONTRACT.
- Fan-out via Workflow (**23 agents, ~872k tokens, ~11.5 min**): 7 analyzers each build→adversarial-
  review→fix in parallel, + 3 reporters. Adversarial pass caught & fixed real bugs (deps false-CRITICAL
  on the legit `mariadb` driver; env per-file gitignore coverage + subdir `.env` discovery; headers
  treating comment/prose header names as configured + component-library false positive).

## QA (verified by me, not just agent self-reports)
- `node --test`: **100/100 pass**.
- E2E: messy fixture → all 8 fire, score F, `--fail-on high` exits 1; clean fixture → A+. JSON/SARIF
  2.1.0/Markdown reporters valid. **Dogfood** caught 2 real fixes (no-lockfile FP on dependency-free
  projects; self-scan ignore for the tool's own rule files) → ShipCheck self-scans **A+ 100/100**.

## Reconciled
- ideas.json: added as shipped record. Hub (ship-safety suite) + hub sitemap + overseer dashboard updated.

## Pending / owner-gated
- `npm publish` (owner: `npm login` → `npm publish`) so `npx shipcheck` resolves from the registry
  (until then it works via `npx Dukotah/shipcheck` or the Action `@v1`).
- GitHub Marketplace listing for the Action (web-UI checkbox on a release).
- Distribution: README + `awesome-*` PRs, the launch posts — same owner-gated constraint as the suite.
