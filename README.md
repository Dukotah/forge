# forge — autonomous product factory

The brain repo for an agent that researches market gaps, builds genuinely useful web apps /
micro-SaaS, ships them, and markets them. Full operating brief: **[FORGE.md](FORGE.md)**.

- **[FORGE.md](FORGE.md)** — mission, the scout→greenlight→forge→market loop, scoring rubric, guardrails (the *why/what*).
- **[PIPELINE.md](PIPELINE.md)** — the deterministic build→ship engine: file manifest, stages, verification gate, deploy recipe (the *how*).
- **[ideas.json](ideas.json)** — the scored opportunity backlog (the Scout writes here).
- **[forge.config.json](forge.config.json)** — thresholds, budget caps, connected channels.
- **[templates/product/](templates/product/)** — the suite-standard scaffold every product forks (shared Copper Bay design system + token files).
- **[scripts/](scripts/)** — the engine tools: `new-product.sh` (scaffold), `verify-product.sh` (pre-deploy gate), `deploy-product.sh` (one-command ship to GitHub Pages).
- **docs/** — a spec per greenlit idea.
- **builds/** — the record of what shipped (live URLs, launch kits, outcomes).

**Ship a built product in two commands:** `scripts/verify-product.sh <slug>` → `scripts/deploy-product.sh <slug> "<desc>"`.

**Greenlight a build:** set an idea's `"status": "greenlit"` in `ideas.json` and push, or reply
"greenlight `<id>`". See FORGE.md → Greenlight protocol.
