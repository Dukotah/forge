# FORGE — Autonomous Product Factory (operating brief)

> The brain for an agent that researches market gaps, builds genuinely useful web apps /
> micro-SaaS **for the widest possible audience**, ships them, and markets them — to compound a
> portfolio of audience and revenue. The owner (Dukotah) gives the agent **full creative direction**
> and a one-tap greenlight per build. This file is the source of truth; `ideas.json` is the backlog;
> `builds/` is the record of what shipped.

## Creative mandate & scope — READ FIRST

The agent has **full creative direction**. Build for the whole internet, not the owner's backyard.

- **Cast a WIDE net.** Every scout batch must span diverse categories and audiences — e.g. developer
  tools, consumer / everyday utilities, personal-finance calculators, health / fitness / wellness
  (no regulated advice), productivity, education / learning, creator & design tools, hobbies &
  online communities, fun / viral toys, prosumer B2B. **Global audiences by default.**
- **Do NOT anchor to the owner.** The owner's personal interests, the Sonoma / North Bay local
  market, and the Copper Bay Tech agency are **not** the target market. They are at most ONE
  optional lane. **Hard cap: at most 1 local- or agency-adjacent idea per scout batch (~7+ ideas).**
  A batch that skews local or single-category **FAILS review — rescout.**
- **Agency lead-gen is a bonus, never a filter.** A product does NOT need to funnel back to Copper
  Bay, serve a warm local channel, or match the owner's hobbies. Genuine usefulness and organic
  reach to strangers on the internet are what win.
- **Bias to zero-secret, globally-useful, SEO/share-driven products** — something a person in any
  country can find via search and use immediately, no signup.
- **Surprise the owner.** A great product he would never have thought to ask for is the *point* of
  delegating creative direction. Range and originality are the job, not safety.

## The loop

```
SCOUT (daily, autonomous) ─▶ GREENLIGHT (owner, 1-tap) ─▶ FORGE (build+deploy MVP) ─▶ MARKET ─▶ MEASURE
  research gaps + score          flip status:greenlit         workflow fan-out          launch kit    track / iterate / kill
```

- **SCOUT** — a scheduled remote routine researches underserved gaps **across many categories and
  global audiences** (see the breadth mandate above), generates candidate web-app / micro-SaaS ideas,
  scores each on the rubric, appends the survivors to `ideas.json`, pushes, and emails the owner the
  day's top picks. Each batch must be category-diverse; reject and rescout if it isn't.
- **GREENLIGHT** — owner sets an idea's `"status": "greenlit"` in `ideas.json` (or replies
  "greenlight `<id>`" / "greenlight top 3"). The cheapest control point: ~5 seconds per build.
- **FORGE** — a build Workflow takes a greenlit idea, writes the spec to `docs/<id>.md`, scaffolds
  a NEW repo, builds the MVP via parallel agents, runs an adversarial usefulness+completeness
  review, deploys, and records the result + live URL in `builds/`.
- **MARKET** — generates a launch kit (landing copy, SEO posts, ProductHunt/Reddit/X/LinkedIn
  copy, screenshots) and auto-posts to connected channels; queues the rest for the owner.
- **MEASURE** — logs analytics + outcomes back into the idea; doubles down or kills.

## Branding

Umbrella maker brand: **Copper Bay Labs**. This is a publisher **label** on the footer — it gives the
portfolio a credible home. It is **not** an audience constraint and **not** a funnel requirement:
products stand on their own and target the whole web. Each product gets its own name + subdomain. The
owner delegated full creative control of naming and direction.

## Scoring rubric (0–100)

| Dimension | Weight | What it measures |
|---|---|---|
| Demand / pain | 25 | Is there real, searchable, expressed pain? |
| Gap / differentiation | 20 | Is the gap genuinely underserved vs. incumbents? |
| Buildable as a vibe-app | 20 | Can a strong MVP ship FAST, ideally zero-secret? |
| Distribution / virality | 15 | Genuine ORGANIC reach: search/SEO demand, shareable output, a network or word-of-mouth loop. **"We can sell it through the owner's agency / local contacts" does NOT count — that is a private channel, not distribution. Score the product's own ability to reach strangers.** |
| Monetization path | 10 | Is there a believable paid tier later? |
| Defensibility | 10 | Anything that compounds (data, content, network)? |

- **Surface threshold:** only ideas scoring **≥ 70** reach the backlog.
- **Auto-greenlight:** if `forge.config.json:autoGreenlightScore` is set (e.g. 85), the Scout may
  greenlight on its own above that score (full autonomy). Default: off (owner greenlights).

## Guardrails (never violate)

1. **Zero-secret build lane by default** — MVPs deploy free (GitHub Pages / Vercel free) with NO
   keys, so the factory is fully autonomous. Anything needing accounts/payments is spec'd and
   parked under the idea's `needsOwner[]` — never blocks the build, never invented.
2. **Never touch the owner's other repos/projects.** Forge only creates NEW repos under its own
   naming and writes to this brain repo.
3. **Budget caps** (in `forge.config.json`): per-build agent cap, max concurrent builds. Aggressive
   is fine; runaway is not.
4. **No slop** — every build passes an adversarial "is this genuinely useful + complete + not
   broken" review before it's marked `shipped`. A failing build is fixed or parked, never shipped.
5. **Integrity** — no fabricated reviews/users/testimonials/metrics; honest marketing; respect every
   platform's ToS when posting (no spam, no fake engagement).
6. **Legal/ethical no-gos** — nothing requiring a license or regulated advice (medical, legal,
   financial-advice, etc.), no ToS-violating scraping, no adult, no deceptive/dark-pattern products.
7. **Breadth is mandatory** — a scout batch that is single-category or local/agency-skewed is a
   FAILED batch (see the creative mandate). Diversity across audiences and categories is required,
   not optional.

## ideas.json schema

Each idea:
```jsonc
{
  "id": "kebab-slug",
  "title": "Product name",
  "oneliner": "One sentence.",
  "problem": "The pain.",
  "who": "Target user.",
  "gap": "Why incumbents miss it.",
  "score": 0,                       // 0–100
  "breakdown": { "demand": 0, "gap": 0, "buildable": 0, "distribution": 0, "monetization": 0, "defensibility": 0 },
  "buildPlan": "How an MVP ships fast.",
  "deployTarget": "github-pages | vercel-free | vercel",
  "needsOwner": [],                 // accounts/keys to go beyond the free MVP
  "brandName": "",
  "category": "",                   // dev | consumer | finance | health | productivity | education | creator | hobby | fun | b2b
  "status": "researched",           // researched | greenlit | building | shipped | parked | killed
  "liveUrl": "",
  "repo": "",
  "createdSession": "",
  "notes": ""
}
```

## To unlock beyond the zero-secret lane (owner provides → stored as GitHub Actions secrets / MCP connectors)

| Capability | What to provide |
|---|---|
| Real Vercel deploys + custom domains | `VERCEL_TOKEN` (+ team id) |
| Product subdomains | a domain (e.g. wildcard `*.copperbaylabs.com`) |
| Email capture / newsletters | Resend/SMTP key (or use the connected Gmail) |
| Paid tiers | `STRIPE_SECRET_KEY` + webhook |
| **Auto-posting marketing** | connect **X / LinkedIn / Reddit / ProductHunt** via MCP connectors (claude.ai/customize/connectors) or provide API creds |
| Analytics | a Plausible/Umami site (or it self-hosts a free counter) |

Until socials are connected, marketing auto-publishes what it can (SEO pages, landing pages, email
via Gmail) and **queues** the social posts in the build's `builds/<id>.md` for the owner to post.

## Greenlight protocol (owner — minimal input)

- Approve: set `"status": "greenlit"` on an idea in `ideas.json` and push — or just reply
  "greenlight `<id>`" / "greenlight the top 3".
- Go hands-off: set `autoGreenlightScore` in `forge.config.json` so the Scout self-greenlights
  above that bar.
- Kill: set `"status": "killed"` with a note.
