# forge — autonomous product factory

The brain repo for an agent that researches market gaps, builds genuinely useful web apps /
micro-SaaS, ships them, and markets them. Full operating brief: **[FORGE.md](FORGE.md)**.

- **[FORGE.md](FORGE.md)** — mission, the scout→greenlight→forge→market loop, scoring rubric, guardrails.
- **[ideas.json](ideas.json)** — the scored opportunity backlog (the Scout writes here).
- **[forge.config.json](forge.config.json)** — thresholds, budget caps, connected channels.
- **docs/** — a spec per greenlit idea.
- **builds/** — the record of what shipped (live URLs, launch kits, outcomes).

**Greenlight a build:** set an idea's `"status": "greenlit"` in `ideas.json` and push, or reply
"greenlight `<id>`". See FORGE.md → Greenlight protocol.
